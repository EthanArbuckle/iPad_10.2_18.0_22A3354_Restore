char *sub_2331228A4(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  objc_super v17;

  v7 = (uint64_t *)&v3[OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_callback];
  *v7 = 0;
  v7[1] = 0;
  swift_unknownObjectWeakInit();
  v8 = v3;
  sub_233147BA8();
  v9 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessoriesLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038C98);
  v10 = swift_allocObject();
  *(_DWORD *)(v10 + 16) = 0;
  *(_QWORD *)&v8[v9] = v10;
  *(_QWORD *)&v8[OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories] = MEMORY[0x24BEE4AF8];
  v8[OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_systemTrackingEnabled] = 1;
  *(_QWORD *)&v8[OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory] = 0;
  v11 = *v7;
  *v7 = a2;
  v7[1] = a3;
  swift_retain();
  sub_233129614(v11);
  swift_unknownObjectWeakAssign();

  v17.receiver = v8;
  v17.super_class = (Class)type metadata accessor for DockAccessoryManagerHelper(0);
  v12 = (char *)objc_msgSendSuper2(&v17, sel_init);
  v13 = MEMORY[0x234930BD4](&v12[OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_manager]);
  if (v13)
  {
    v14 = (void *)v13;
    v15 = v12;
    sub_233147734();

  }
  swift_release();
  return v12;
}

uint64_t sub_233122A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);

  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_256038C38 + dword_256038C38);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v12;
  *v12 = v8;
  v12[1] = sub_233129C70;
  return v14(a5, a6, a8);
}

uint64_t sub_233122BE0(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint8_t *v16;
  uint8_t *v17;
  uint64_t (*v18)(char *, uint64_t);
  uint64_t result;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  os_unfair_lock_s *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  int v27;

  v2 = v1;
  v4 = sub_233147BB4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v25 - v9;
  v11 = v2 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger;
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v12((char *)&v25 - v9, v2 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, v4);
  v13 = sub_233147B9C();
  v14 = sub_233147D4C();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v26 = v8;
    v16 = v15;
    *(_DWORD *)v15 = 67109120;
    v27 = a1 & 1;
    sub_233147D88();
    _os_log_impl(&dword_233121000, v13, v14, "Helper: setting system tracking enabled %{BOOL}d", v16, 8u);
    v17 = v16;
    v8 = v26;
    MEMORY[0x234930B44](v17, -1, -1);
  }

  v18 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
  result = v18(v10, v4);
  *(_BYTE *)(v2 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_systemTrackingEnabled) = a1 & 1;
  if ((a1 & 1) != 0)
  {
    v12(v8, v11, v4);
    v20 = sub_233147B9C();
    v21 = sub_233147D4C();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_233121000, v20, v21, "System tracking enabled, stopping tracking loop for previously-vended accessories", v22, 2u);
      MEMORY[0x234930B44](v22, -1, -1);
    }

    v18(v8, v4);
    v23 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessoriesLock);
    swift_retain();
    os_unfair_lock_lock(v23 + 4);
    sub_233122E54(v2);
    os_unfair_lock_unlock(v23 + 4);
    return swift_release();
  }
  else
  {
    v24 = *(_QWORD *)(v2 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory);
    if (v24)
      *(_BYTE *)(v24 + OBJC_IVAR____TtC7DockKit13DockAccessory__tracking) = 0;
  }
  return result;
}

uint64_t sub_233122E54(uint64_t a1)
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
  id v12;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  id v19;

  v2 = a1 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories;
  swift_beginAccess();
  v3 = *(_QWORD *)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (!v4)
    goto LABEL_14;
  swift_bridgeObjectRetain();
  v5 = 0;
  do
  {
    v6 = v3 + 16 * v5++;
    v18 = *(_OWORD *)(v6 + 32);
    swift_retain();
    sub_233123020((uint64_t)&v18, a1);
    swift_release();
  }
  while (v4 != v5);
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)v2;
  v8 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    v9 = 0;
    v10 = MEMORY[0x24BEE4AF8];
    do
    {
      v17 = *(_OWORD *)(v7 + 16 * v9 + 32);
      v11 = swift_retain();
      ((void (*)(id *__return_ptr, uint64_t))v17)(&v19, v11);
      v12 = v19;

      if (v12)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)&v18 = v10;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_2331403B0(0, *(_QWORD *)(v10 + 16) + 1, 1);
          v10 = v18;
        }
        v15 = *(_QWORD *)(v10 + 16);
        v14 = *(_QWORD *)(v10 + 24);
        if (v15 >= v14 >> 1)
        {
          sub_2331403B0(v14 > 1, v15 + 1, 1);
          v10 = v18;
        }
        *(_QWORD *)(v10 + 16) = v15 + 1;
        *(_OWORD *)(v10 + 16 * v15 + 32) = v17;
      }
      else
      {
        swift_release();
      }
      ++v9;
    }
    while (v8 != v9);
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_14:
    v10 = MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)v2 = v10;
  return swift_bridgeObjectRelease();
}

void sub_233123020(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(void **__return_ptr, uint64_t);
  void *v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  uint8_t *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint8_t *v27;
  uint8_t *v28;
  uint64_t v29;
  int v30;
  void (*v31)(void **__return_ptr, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;

  v5 = sub_233147BB4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void (**)(void **__return_ptr, uint64_t))a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11(&v35, v7);
  v12 = v35;
  if (v35)
  {
    v33 = v10;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, a2 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, v5);
    v13 = v12;
    v14 = sub_233147B9C();
    v15 = sub_233147D4C();
    v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      v30 = v16;
      v17 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v35 = (void *)v29;
      v31 = v11;
      *(_DWORD *)v17 = 136315138;
      v27 = v17 + 4;
      v28 = v17;
      v18 = (void *)sub_233147770();
      v19 = sub_2331476B0();
      v32 = v2;
      v21 = v20;

      v34 = sub_23313FD70(v19, v21, (uint64_t *)&v35);
      v11 = v31;
      sub_233147D88();

      swift_bridgeObjectRelease();
      v22 = v28;
      _os_log_impl(&dword_233121000, v14, (os_log_type_t)v30, "Stopping tracking loop for %s", v28, 0xCu);
      v23 = v29;
      swift_arrayDestroy();
      MEMORY[0x234930B44](v23, -1, -1);
      MEMORY[0x234930B44](v22, -1, -1);

    }
    else
    {

    }
    v24 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    v11(&v35, v24);
    v25 = v35;
    if (v35)
    {
      sub_233147860();
      if (swift_dynamicCastClass())
      {
        v26 = v25;
        sub_23314780C();

      }
      else
      {
        v26 = v13;
        v13 = v25;
      }

    }
  }
}

uint64_t sub_23312329C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(void **__return_ptr, uint64_t);
  uint64_t v15;
  id v16;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v18;
  unint64_t v19;
  __int128 v21;
  void (*v22[3])(void **__return_ptr, uint64_t);
  id v23;

  v6 = a1 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories;
  swift_beginAccess();
  v7 = *(_QWORD *)v6;
  v8 = *(_QWORD *)(*(_QWORD *)v6 + 16);
  if (!v8)
    goto LABEL_14;
  swift_bridgeObjectRetain();
  v9 = 0;
  do
  {
    v10 = v7 + 16 * v9++;
    *(_OWORD *)v22 = *(_OWORD *)(v10 + 32);
    swift_retain();
    sub_233123478(v22, a2, a1, a3);
    swift_release();
  }
  while (v8 != v9);
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)v6;
  v12 = *(_QWORD *)(*(_QWORD *)v6 + 16);
  if (v12)
  {
    swift_bridgeObjectRetain();
    v13 = 0;
    v14 = (void (*)(void **__return_ptr, uint64_t))MEMORY[0x24BEE4AF8];
    do
    {
      v21 = *(_OWORD *)(v11 + 16 * v13 + 32);
      v15 = swift_retain();
      ((void (*)(id *__return_ptr, uint64_t))v21)(&v23, v15);
      v16 = v23;

      if (v16)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v22[0] = v14;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_2331403B0(0, *((_QWORD *)v14 + 2) + 1, 1);
          v14 = v22[0];
        }
        v19 = *((_QWORD *)v14 + 2);
        v18 = *((_QWORD *)v14 + 3);
        if (v19 >= v18 >> 1)
        {
          sub_2331403B0(v18 > 1, v19 + 1, 1);
          v14 = v22[0];
        }
        *((_QWORD *)v14 + 2) = v19 + 1;
        *((_OWORD *)v14 + v19 + 2) = v21;
      }
      else
      {
        swift_release();
      }
      ++v13;
    }
    while (v12 != v13);
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_14:
    v14 = (void (*)(void **__return_ptr, uint64_t))MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)v6 = v14;
  return swift_bridgeObjectRelease();
}

void sub_233123478(void (**a1)(void **__return_ptr, uint64_t), void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  char v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void (*v39)(void **__return_ptr, uint64_t);
  uint64_t v40;
  void *v41;

  v9 = sub_233147BB4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = *a1;
  v39(&v41, v11);
  v14 = v41;
  if (v41)
  {
    v38 = a4;
    v15 = (void *)sub_233147770();

    sub_2331476C8();
    v16 = v15;
    v17 = a2;
    v18 = sub_233147D64();

    if ((v18 & 1) == 0)
    {

      return;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a3 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, v9);
    v19 = v16;
    v20 = sub_233147B9C();
    v21 = sub_233147D4C();
    v22 = v21;
    v23 = os_log_type_enabled(v20, v21);
    v37 = v19;
    if (v23)
    {
      v24 = swift_slowAlloc();
      v36 = v4;
      v25 = v24;
      v35 = swift_slowAlloc();
      v41 = (void *)v35;
      *(_DWORD *)v25 = 136315394;
      v34 = v22;
      v26 = sub_2331476B0();
      v40 = sub_23313FD70(v26, v27, (uint64_t *)&v41);
      sub_233147D88();

      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 1024;
      v28 = sub_2331479D4();
      LODWORD(v40) = v28 == sub_2331479D4();
      sub_233147D88();
      _os_log_impl(&dword_233121000, v20, (os_log_type_t)v34, "Updating tracking button state on %s to %{BOOL}d", (uint8_t *)v25, 0x12u);
      v29 = v35;
      swift_arrayDestroy();
      MEMORY[0x234930B44](v29, -1, -1);
      MEMORY[0x234930B44](v25, -1, -1);

    }
    else
    {

    }
    v30 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    v39(&v41, v30);
    v31 = v41;
    if (!v41)
      goto LABEL_10;
    sub_233147860();
    if (swift_dynamicCastClass())
    {
      v32 = v31;
      sub_2331479D4();
      sub_2331479D4();
      sub_233147854();

LABEL_10:
      return;
    }

  }
}

uint64_t sub_2331237A0()
{
  void *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];

  __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_233147CD4();
  v4 = *(_QWORD *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v0;
  v6 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  v7 = v0;
  if (v6 == 1)
  {
    sub_233129970((uint64_t)v2, &qword_256038C20);
    v8 = 0;
    v9 = 0;
  }
  else
  {
    sub_233147CC8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    if (v5[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v8 = sub_233147CBC();
      v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = &unk_256038C60;
  *(_QWORD *)(v11 + 24) = v5;
  if (v9 | v8)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v8;
    v13[3] = v9;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_233123970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[3] = a4;
  v5 = sub_233147BB4();
  v4[4] = v5;
  v4[5] = *(_QWORD *)(v5 - 8);
  v4[6] = swift_task_alloc();
  v4[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2331239E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void (*v6)(uint64_t, char *, uint64_t);
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  unsigned __int8 *v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(char **)(v0 + 24);
  v5 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger;
  *(_QWORD *)(v0 + 64) = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger;
  v6 = *(void (**)(uint64_t, char *, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 72) = v6;
  v6(v1, &v4[v5], v2);
  v7 = v4;
  v8 = sub_233147B9C();
  v9 = sub_233147D4C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(unsigned __int8 **)(v0 + 24);
    v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v11 = 67109120;
    *(_DWORD *)(v0 + 124) = v10[OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_systemTrackingEnabled];
    sub_233147D88();

    _os_log_impl(&dword_233121000, v8, v9, "XPC disconnected, attempting to re-connect and set system tracking enabled: %{BOOL}d", v11, 8u);
    MEMORY[0x234930B44](v11, -1, -1);
  }
  else
  {

  }
  v12 = *(_QWORD *)(v0 + 56);
  v13 = *(_QWORD *)(v0 + 32);
  v14 = *(_QWORD *)(v0 + 24);
  v15 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 40) + 8);
  *(_QWORD *)(v0 + 80) = v15;
  v15(v12, v13);
  v16 = MEMORY[0x234930BD4](v14 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_manager);
  *(_QWORD *)(v0 + 88) = v16;
  if (v16)
  {
    *(_QWORD *)(v0 + 96) = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_systemTrackingEnabled;
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v17;
    *v17 = v0;
    v17[1] = sub_233123B8C;
    return sub_233147740();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_233123B8C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 112) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_233123C10()
{
  uint64_t v0;
  char *v1;
  void *v2;
  void (*v3)(uint64_t, char *, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  char *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v1 = *(char **)(v0 + 24);
  v2 = *(void **)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 64);
  v3 = *(void (**)(uint64_t, char *, uint64_t))(v0 + 72);
  v5 = *(_QWORD *)(v0 + 48);
  v6 = *(_QWORD *)(v0 + 32);

  v3(v5, &v1[v4], v6);
  v7 = v1;
  v8 = v2;
  v9 = v7;
  v10 = v2;
  v11 = sub_233147B9C();
  v12 = sub_233147D40();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = *(void **)(v0 + 112);
    v14 = *(_QWORD *)(v0 + 96);
    v15 = *(unsigned __int8 **)(v0 + 24);
    v16 = swift_slowAlloc();
    v17 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v16 = 67109378;
    LODWORD(v14) = v15[v14];

    *(_DWORD *)(v0 + 120) = v14;
    sub_233147D88();

    *(_WORD *)(v16 + 8) = 2112;
    v18 = v13;
    v19 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v19;
    sub_233147D88();
    *v17 = v19;

    _os_log_impl(&dword_233121000, v11, v12, "Failed setting system tracking enabled: %{BOOL}d, %@", (uint8_t *)v16, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v17, -1, -1);
    MEMORY[0x234930B44](v16, -1, -1);

  }
  else
  {
    v20 = *(void **)(v0 + 112);
    v21 = *(void **)(v0 + 24);

  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 80))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_233123E84()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DockAccessoryManagerHelper(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL static DockKitError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DockKitError.hash(into:)()
{
  return sub_233147EA8();
}

uint64_t DockKitError.hashValue.getter()
{
  sub_233147E9C();
  sub_233147EA8();
  return sub_233147ECC();
}

BOOL sub_233123FCC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t _s7DockKit0A9AccessoryC17CameraOrientationO9hashValueSivg_0()
{
  sub_233147E9C();
  sub_233147EA8();
  return sub_233147ECC();
}

uint64_t sub_233124024()
{
  return sub_233147EA8();
}

uint64_t sub_23312404C()
{
  sub_233147E9C();
  sub_233147EA8();
  return sub_233147ECC();
}

uint64_t sub_23312409C()
{
  uint64_t v0;

  v0 = sub_233147BB4();
  __swift_allocate_value_buffer(v0, qword_256038988);
  __swift_project_value_buffer(v0, (uint64_t)qword_256038988);
  return sub_233147BA8();
}

uint64_t sub_23312411C@<X0>(NSObject *a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char *v33;
  NSObject *v34;
  uint64_t result;
  uint64_t v36;
  char *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  NSObject *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int *v53;
  NSObject *v54;
  uint64_t v55;
  int v56;
  unsigned int (*v57)(uint64_t, uint64_t, uint64_t);
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  id v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  NSObject *v145;
  NSObject *v146;
  os_log_type_t v147;
  uint64_t v148;
  _QWORD *v149;
  NSObject *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  NSObject *v157;
  os_log_type_t v158;
  char *v159;
  uint8_t *v160;
  _QWORD *v161;
  uint64_t v162;
  uint64_t v163;
  NSObject *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  int v168;
  char v169;
  uint64_t v170;
  char v171;
  char *v172;
  char *v173;
  char *v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  NSObject *v178;
  char *v179;
  char *v180;
  uint64_t v181;
  char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  char v186;
  NSObject *v187;
  uint64_t v188;

  v188 = *MEMORY[0x24BDAC8D0];
  v4 = sub_233147BB4();
  v5 = *(_QWORD *)(v4 - 8);
  v184 = v4;
  v185 = v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v172 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v182 = (char *)&v172 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038C80);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v172 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v172 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v176 = (uint64_t)&v172 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v172 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v172 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v180 = (char *)&v172 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v177 = (uint64_t)&v172 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v31 = (uint64_t *)((char *)&v172 - v30);
  MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)&v172 - v32;
  v187 = a1;
  v34 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038C88);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    *a2 = v186;
    return result;
  }
  v174 = v8;
  v172 = v13;
  v175 = a2;
  v36 = sub_233147B00();
  v181 = *(_QWORD *)(v36 - 8);
  v37 = *(char **)(v181 + 56);
  v179 = v33;
  v183 = v36;
  v173 = v37;
  ((void (*)(char *, uint64_t, uint64_t))v37)(v33, 1, 1);
  v178 = sub_2331475F0();
  v38 = -[NSObject domain](v178, sel_domain);
  v39 = sub_233147BF0();
  v41 = v40;

  if (v39 == 0xD000000000000012 && v41 == 0x800000023314B150)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    v43 = v178;
    v44 = -[NSObject code](v178, sel_code);
    v45 = (uint64_t)v179;
    v46 = v181;
    v47 = v184;
    v48 = v183;
    switch((unint64_t)v44)
    {
      case 0uLL:
        v49 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v50 = sub_233147BF0();
        v52 = v51;

        *v31 = v50;
        v53 = (unsigned int *)MEMORY[0x24BE2DBD8];
        break;
      case 1uLL:
        v86 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v87 = sub_233147BF0();
        v52 = v88;

        *v31 = v87;
        v53 = (unsigned int *)MEMORY[0x24BE2DBF0];
        break;
      case 2uLL:
        v89 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v90 = sub_233147BF0();
        v52 = v91;

        *v31 = v90;
        v53 = (unsigned int *)MEMORY[0x24BE2DBF8];
        break;
      case 3uLL:
        v92 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v93 = sub_233147BF0();
        v52 = v94;

        *v31 = v93;
        v53 = (unsigned int *)MEMORY[0x24BE2DC18];
        break;
      case 4uLL:
        v68 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v69 = sub_233147BF0();
        v52 = v70;

        *v31 = v69;
        v53 = (unsigned int *)MEMORY[0x24BE2DC38];
        break;
      case 5uLL:
        v95 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v96 = sub_233147BF0();
        v52 = v97;

        *v31 = v96;
        v53 = (unsigned int *)MEMORY[0x24BE2DBC0];
        break;
      case 6uLL:
        v98 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v99 = sub_233147BF0();
        v52 = v100;

        *v31 = v99;
        v53 = (unsigned int *)MEMORY[0x24BE2DC88];
        break;
      case 7uLL:
        v101 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v102 = sub_233147BF0();
        v52 = v103;

        *v31 = v102;
        v53 = (unsigned int *)MEMORY[0x24BE2DC98];
        break;
      case 8uLL:
        v104 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v105 = sub_233147BF0();
        v52 = v106;

        *v31 = v105;
        v53 = (unsigned int *)MEMORY[0x24BE2DBC8];
        break;
      case 9uLL:
        v71 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v72 = sub_233147BF0();
        v52 = v73;

        *v31 = v72;
        v53 = (unsigned int *)MEMORY[0x24BE2DC90];
        break;
      case 0xAuLL:
        v107 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v108 = sub_233147BF0();
        v52 = v109;

        *v31 = v108;
        v53 = (unsigned int *)MEMORY[0x24BE2DC40];
        break;
      case 0xBuLL:
        v74 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v75 = sub_233147BF0();
        v52 = v76;

        *v31 = v75;
        v53 = (unsigned int *)MEMORY[0x24BE2DC68];
        break;
      case 0xCuLL:
        v77 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v78 = sub_233147BF0();
        v52 = v79;

        *v31 = v78;
        v53 = (unsigned int *)MEMORY[0x24BE2DC78];
        break;
      case 0xDuLL:
        v110 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v111 = sub_233147BF0();
        v52 = v112;

        *v31 = v111;
        v53 = (unsigned int *)MEMORY[0x24BE2DC70];
        break;
      case 0xEuLL:
        v62 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v63 = sub_233147BF0();
        v52 = v64;

        *v31 = v63;
        v53 = (unsigned int *)MEMORY[0x24BE2DC50];
        break;
      case 0xFuLL:
        v113 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v114 = sub_233147BF0();
        v52 = v115;

        *v31 = v114;
        v53 = (unsigned int *)MEMORY[0x24BE2DC48];
        break;
      case 0x10uLL:
        v65 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v66 = sub_233147BF0();
        v52 = v67;

        *v31 = v66;
        v53 = (unsigned int *)MEMORY[0x24BE2DC10];
        break;
      case 0x11uLL:
        v116 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v117 = sub_233147BF0();
        v52 = v118;

        *v31 = v117;
        v53 = (unsigned int *)MEMORY[0x24BE2DC58];
        break;
      case 0x12uLL:
        v119 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v120 = sub_233147BF0();
        v52 = v121;

        *v31 = v120;
        v53 = (unsigned int *)MEMORY[0x24BE2DBE8];
        break;
      case 0x13uLL:
        v128 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v129 = sub_233147BF0();
        v52 = v130;

        *v31 = v129;
        v53 = (unsigned int *)MEMORY[0x24BE2DBD0];
        break;
      case 0x14uLL:
        v122 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v123 = sub_233147BF0();
        v52 = v124;

        *v31 = v123;
        v53 = (unsigned int *)MEMORY[0x24BE2DBB8];
        break;
      case 0x15uLL:
        v125 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v126 = sub_233147BF0();
        v52 = v127;

        *v31 = v126;
        v53 = (unsigned int *)MEMORY[0x24BE2DC30];
        break;
      case 0x16uLL:
        v131 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v132 = sub_233147BF0();
        v52 = v133;

        *v31 = v132;
        v53 = (unsigned int *)MEMORY[0x24BE2DC28];
        break;
      case 0x17uLL:
        v137 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v138 = sub_233147BF0();
        v52 = v139;

        *v31 = v138;
        v53 = (unsigned int *)MEMORY[0x24BE2DC60];
        break;
      case 0x18uLL:
        v80 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v81 = sub_233147BF0();
        v52 = v82;

        *v31 = v81;
        v53 = (unsigned int *)MEMORY[0x24BE2DC08];
        break;
      case 0x19uLL:
        v83 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v84 = sub_233147BF0();
        v52 = v85;

        *v31 = v84;
        v53 = (unsigned int *)MEMORY[0x24BE2DC00];
        break;
      case 0x1AuLL:
        v140 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v141 = sub_233147BF0();
        v52 = v142;

        *v31 = v141;
        v53 = (unsigned int *)MEMORY[0x24BE2DC20];
        break;
      case 0x1BuLL:
        v59 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v60 = sub_233147BF0();
        v52 = v61;

        *v31 = v60;
        v53 = (unsigned int *)MEMORY[0x24BE2DBE0];
        break;
      default:
        v134 = -[NSObject localizedDescription](v43, sel_localizedDescription);
        v135 = sub_233147BF0();
        v52 = v136;

        *v31 = v135;
        v53 = (unsigned int *)MEMORY[0x24BE2DC10];
        v48 = v183;
        break;
    }
    v31[1] = v52;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v46 + 104))(v31, *v53, v48);
    ((void (*)(uint64_t *, _QWORD, uint64_t, uint64_t))v173)(v31, 0, 1, v48);
    sub_2331298E0((uint64_t)v31, v45);
    v143 = v182;
    if (qword_256038980 != -1)
      swift_once();
    v144 = __swift_project_value_buffer(v47, (uint64_t)qword_256038988);
    (*(void (**)(char *, uint64_t, uint64_t))(v185 + 16))(v143, v144, v47);
    v145 = v43;
    v146 = sub_233147B9C();
    v147 = sub_233147D4C();
    if (os_log_type_enabled(v146, v147))
    {
      v173 = v16;
      v148 = swift_slowAlloc();
      v149 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v148 = 138412546;
      v187 = v145;
      v150 = v145;
      sub_233147D88();
      *v149 = v145;

      v46 = v181;
      *(_WORD *)(v148 + 12) = 2112;
      swift_beginAccess();
      v151 = v177;
      sub_233129928(v45, v177);
      v152 = v183;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v151, 1, v183) == 1)
      {
        sub_233129970(v151, &qword_256038C80);
        v187 = 0;
        sub_233147D88();
        v153 = 0;
      }
      else
      {
        sub_233127808(&qword_256038C90, (uint64_t (*)(uint64_t))MEMORY[0x24BE2DCA0], MEMORY[0x24BE2DCB0]);
        swift_allocError();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32))(v154, v151, v152);
        v153 = _swift_stdlib_bridgeErrorToNSError();
        v187 = v153;
        sub_233147D88();
      }
      v149[1] = v153;
      _os_log_impl(&dword_233121000, v146, v147, "nsErr is %@, coreErr = %@", (uint8_t *)v148, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
      swift_arrayDestroy();
      MEMORY[0x234930B44](v149, -1, -1);
      MEMORY[0x234930B44](v148, -1, -1);
      v45 = (uint64_t)v179;
      v16 = v173;
      v47 = v184;
      v143 = v182;
    }
    else
    {

      v146 = v145;
    }
    v155 = (uint64_t)v180;

    (*(void (**)(char *, uint64_t))(v185 + 8))(v143, v47);
    swift_beginAccess();
    sub_233129928(v45, v155);
    v57 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48);
    v55 = v183;
    if (v57(v155, 1, v183) == 1)
    {

      v58 = v155;
      goto LABEL_50;
    }
    v21 = (char *)v155;
    goto LABEL_52;
  }
  v42 = sub_233147E60();
  swift_bridgeObjectRelease();
  if ((v42 & 1) != 0)
    goto LABEL_7;
  v187 = a1;
  v54 = a1;
  v55 = v183;
  v56 = swift_dynamicCast();
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v173)(v24, v56 ^ 1u, 1, v55);
  v45 = (uint64_t)v179;
  sub_2331298E0((uint64_t)v24, (uint64_t)v179);
  sub_233129928(v45, (uint64_t)v21);
  v57 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v181 + 48);
  if (v57((uint64_t)v21, 1, v55) == 1)
  {

    v58 = (uint64_t)v21;
LABEL_50:
    sub_233129970(v58, &qword_256038C80);
    result = sub_233129970(v45, &qword_256038C80);
    *v175 = 3;
    return result;
  }
  v47 = v184;
LABEL_52:
  sub_233129970((uint64_t)v21, &qword_256038C80);
  if (qword_256038980 != -1)
    swift_once();
  v156 = __swift_project_value_buffer(v47, (uint64_t)qword_256038988);
  (*(void (**)(char *, uint64_t, uint64_t))(v185 + 16))(v174, v156, v47);
  v157 = sub_233147B9C();
  v158 = sub_233147D4C();
  if (os_log_type_enabled(v157, v158))
  {
    v159 = v16;
    v160 = (uint8_t *)swift_slowAlloc();
    v161 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v160 = 138412290;
    swift_beginAccess();
    v162 = v176;
    sub_233129928(v45, v176);
    if (v57(v162, 1, v55) == 1)
    {
      sub_233129970(v162, &qword_256038C80);
      v187 = 0;
      sub_233147D88();
      v163 = 0;
    }
    else
    {
      sub_233127808(&qword_256038C90, (uint64_t (*)(uint64_t))MEMORY[0x24BE2DCA0], MEMORY[0x24BE2DCB0]);
      swift_allocError();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v181 + 32))(v165, v162, v55);
      v163 = _swift_stdlib_bridgeErrorToNSError();
      v187 = v163;
      sub_233147D88();
    }
    *v161 = v163;
    _os_log_impl(&dword_233121000, v157, v158, "Converting coreErr = %@ to public", v160, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v161, -1, -1);
    MEMORY[0x234930B44](v160, -1, -1);
    v164 = v178;
    v45 = (uint64_t)v179;
    v16 = v159;
    v47 = v184;
  }
  else
  {
    v164 = v157;
    v157 = v178;
  }

  (*(void (**)(char *, uint64_t))(v185 + 8))(v174, v47);
  swift_beginAccess();
  sub_233129928(v45, (uint64_t)v16);
  if (v57((uint64_t)v16, 1, v55) == 1)
    goto LABEL_63;
  v166 = (uint64_t)v172;
  sub_233129928((uint64_t)v16, (uint64_t)v172);
  v167 = v181;
  v168 = (*(uint64_t (**)(uint64_t, uint64_t))(v181 + 88))(v166, v55);
  if (v168 != *MEMORY[0x24BE2DBD8])
  {
    if (v168 == *MEMORY[0x24BE2DBF0] || v168 == *MEMORY[0x24BE2DBF8])
      goto LABEL_70;
    if (v168 == *MEMORY[0x24BE2DC18])
      goto LABEL_62;
    if (v168 == *MEMORY[0x24BE2DC38] || v168 == *MEMORY[0x24BE2DBC0] || v168 == *MEMORY[0x24BE2DC88])
      goto LABEL_70;
    if (v168 == *MEMORY[0x24BE2DC98] || v168 == *MEMORY[0x24BE2DBC8])
      goto LABEL_62;
    if (v168 == *MEMORY[0x24BE2DC90])
    {
      (*(void (**)(uint64_t, uint64_t))(v167 + 96))(v166, v55);
      swift_bridgeObjectRelease();
      v169 = 2;
      goto LABEL_71;
    }
    if (v168 == *MEMORY[0x24BE2DC40])
    {
LABEL_70:
      (*(void (**)(uint64_t, uint64_t))(v167 + 96))(v166, v55);
      swift_bridgeObjectRelease();
      v169 = 1;
      goto LABEL_71;
    }
    if (v168 == *MEMORY[0x24BE2DC68] || v168 == *MEMORY[0x24BE2DC78])
      goto LABEL_80;
    if (v168 != *MEMORY[0x24BE2DC70]
      && v168 != *MEMORY[0x24BE2DC50]
      && v168 != *MEMORY[0x24BE2DC48]
      && v168 != *MEMORY[0x24BE2DC10])
    {
      if (v168 != *MEMORY[0x24BE2DC58])
      {
        if (v168 == *MEMORY[0x24BE2DBE8] || v168 == *MEMORY[0x24BE2DBD0] || v168 == *MEMORY[0x24BE2DBB8])
          goto LABEL_89;
        if (v168 != *MEMORY[0x24BE2DC30])
        {
          if (v168 == *MEMORY[0x24BE2DC28] || v168 == *MEMORY[0x24BE2DC60])
          {
            (*(void (**)(char *, uint64_t))(v181 + 96))(v172, v183);
            swift_bridgeObjectRelease();
          }
          else
          {
            if (v168 == *MEMORY[0x24BE2DC08])
            {
              (*(void (**)(char *, uint64_t))(v181 + 96))(v172, v183);
              swift_bridgeObjectRelease();
              v171 = 4;
              goto LABEL_90;
            }
            if (v168 == *MEMORY[0x24BE2DC00])
            {
              (*(void (**)(char *, uint64_t))(v181 + 96))(v172, v183);
              swift_bridgeObjectRelease();
              v171 = 5;
              goto LABEL_90;
            }
            if (v168 == *MEMORY[0x24BE2DC20])
            {
              (*(void (**)(char *, uint64_t))(v181 + 96))(v172, v183);
              swift_bridgeObjectRelease();
              v171 = 6;
              goto LABEL_90;
            }
            if (v168 == *MEMORY[0x24BE2DBE0])
            {
              (*(void (**)(char *, uint64_t))(v181 + 96))(v172, v183);
              swift_bridgeObjectRelease();
              v171 = 7;
              goto LABEL_90;
            }
            if (v168 == *MEMORY[0x24BE2DC80])
              goto LABEL_89;
            (*(void (**)(char *, uint64_t))(v181 + 8))(v172, v183);
          }
          v171 = 3;
          goto LABEL_90;
        }
      }
LABEL_80:
      (*(void (**)(char *, uint64_t))(v181 + 96))(v172, v183);
      swift_bridgeObjectRelease();
      v171 = 1;
LABEL_90:
      *v175 = v171;
      sub_233129970((uint64_t)v16, &qword_256038C80);
      v170 = (uint64_t)v179;
      return sub_233129970(v170, &qword_256038C80);
    }
LABEL_89:
    (*(void (**)(char *, uint64_t))(v181 + 96))(v172, v183);
    swift_bridgeObjectRelease();
    v171 = 2;
    goto LABEL_90;
  }
LABEL_62:
  (*(void (**)(uint64_t, uint64_t))(v167 + 96))(v166, v55);
  swift_bridgeObjectRelease();
LABEL_63:
  v169 = 3;
LABEL_71:
  *v175 = v169;
  sub_233129970((uint64_t)v16, &qword_256038C80);
  v170 = v45;
  return sub_233129970(v170, &qword_256038C80);
}

BOOL sub_233125690()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  char v3;
  os_unfair_lock_s *v4;

  v1 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  v2 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  swift_release();
  v3 = *(_BYTE *)(v0 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  v4 = *(os_unfair_lock_s **)(v0 + v1);
  swift_retain();
  os_unfair_lock_unlock(v4 + 4);
  swift_release();
  return (v3 & 1) == 0;
}

uint64_t sub_233125710@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint8_t *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = v1;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560389C0);
  v16 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_233147BB4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v2 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager_logger, v6);
  v10 = sub_233147B9C();
  v11 = sub_233147D34();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v15 = a1;
    v13 = v12;
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_233121000, v10, v11, "API: accessoryStateChanges", v12, 2u);
    MEMORY[0x234930B44](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v5, *MEMORY[0x24BEE6A10], v17);
  return sub_233147D1C();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x234930AC0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23312590C()
{
  uint64_t result;

  type metadata accessor for DockAccessoryManager(0);
  swift_allocObject();
  result = sub_233125988();
  qword_2560389A8 = result;
  return result;
}

uint64_t static DockAccessoryManager.shared.getter()
{
  if (qword_2560389A0 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_233125988()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v0 + 24) = 0;
  sub_233147BA8();
  v1 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038C98);
  v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v0 + v1) = v2;
  *(_BYTE *)(v0 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled) = 0;
  *(_QWORD *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)sub_23314774C()), sel_init);
  return v0;
}

uint64_t sub_233125A3C(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 108) = a1;
  v3 = sub_233147BB4();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 48) = swift_task_alloc();
  *(_QWORD *)(v2 + 56) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233125AB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  _QWORD *v14;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 24);
  v5 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager_logger;
  *(_QWORD *)(v0 + 64) = OBJC_IVAR____TtC7DockKit20DockAccessoryManager_logger;
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 72) = v6;
  v6(v1, v4 + v5, v2);
  v7 = sub_233147B9C();
  v8 = sub_233147D34();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = *(unsigned __int8 *)(v0 + 108);
    v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v10 = 67240192;
    *(_DWORD *)(v0 + 104) = v9;
    sub_233147D88();
    _os_log_impl(&dword_233121000, v7, v8, "API: setSystemTrackingEnabled: %{BOOL,public}d", v10, 8u);
    MEMORY[0x234930B44](v10, -1, -1);
  }

  v11 = *(_QWORD *)(v0 + 56);
  v12 = *(_QWORD *)(v0 + 32);
  v13 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 40) + 8);
  *(_QWORD *)(v0 + 80) = v13;
  v13(v11, v12);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v14;
  *v14 = v0;
  v14[1] = sub_233125BF0;
  return sub_233147740();
}

uint64_t sub_233125BF0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_233125C54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  char v10;
  id v11;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_BYTE *)(v0 + 108);
  v4 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  v5 = swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v2;
  *(_BYTE *)(v5 + 24) = v3;
  v6 = swift_task_alloc();
  *(_QWORD *)(v6 + 16) = sub_233127164;
  *(_QWORD *)(v6 + 24) = v5;
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  (*(void (**)(void))(v6 + 16))();
  os_unfair_lock_unlock(v4 + 4);
  if (v1)
    return swift_task_dealloc();
  v8 = *(_QWORD *)(v0 + 24);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  v9 = *(void **)(v8 + 24);
  if (v9)
  {
    v10 = *(_BYTE *)(v0 + 108);
    v11 = v9;
    sub_233122BE0(v10);

  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233125D74()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  char v18[9];

  v1 = *(void **)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 72))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 24) + *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 32));
  v2 = v1;
  v3 = v1;
  v4 = sub_233147B9C();
  v5 = sub_233147D40();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 96);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v10;
    sub_233147D88();
    *v8 = v10;

    _os_log_impl(&dword_233121000, v4, v5, "Failed in setSystemTrackingEnabled: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v8, -1, -1);
    MEMORY[0x234930B44](v7, -1, -1);
  }
  else
  {
    v11 = *(void **)(v0 + 96);

  }
  v12 = *(NSObject **)(v0 + 96);
  v13 = *(void (**)(uint64_t, uint64_t))(v0 + 80);
  v14 = *(_QWORD *)(v0 + 48);
  v15 = *(_QWORD *)(v0 + 32);

  v13(v14, v15);
  sub_23312411C(v12, v18);
  LOBYTE(v15) = v18[0];
  sub_233127120();
  swift_allocError();
  *v16 = v15;
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233125F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038CA0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_233147CE0();
  v9 = sub_233147CD4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v10 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v11 = (char *)swift_allocObject();
  *((_QWORD *)v11 + 2) = 0;
  *((_QWORD *)v11 + 3) = 0;
  *((_QWORD *)v11 + 4) = a2;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v11[v10], (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  swift_retain();
  sub_233129C78((uint64_t)v8, (uint64_t)&unk_256038CB0, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_2331260E0(uint64_t a1)
{
  uint64_t v1;

  return sub_233125F7C(a1, v1);
}

uint64_t sub_2331260E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[4] = a4;
  v5[5] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038CB8);
  v5[6] = v6;
  v5[7] = *(_QWORD *)(v6 - 8);
  v5[8] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038CA0);
  v5[9] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[10] = v8;
  v5[11] = *(_QWORD *)(v8 + 64);
  v5[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23312617C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  char *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  _QWORD *v16;
  void *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v0 + 104) = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v1, v2);
  v9 = objc_allocWithZone((Class)type metadata accessor for DockAccessoryManagerHelper(0));
  v10 = v6;
  v11 = sub_2331228A4(v6, (uint64_t)sub_233129BA0, v8);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = *(void **)(v5 + 24);
  if (v13)
  {
    v14 = *(_BYTE *)(*(_QWORD *)(v0 + 32) + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
    v15 = v13;
    sub_233122BE0((v14 & 1) == 0);

    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v16;
    *v16 = v0;
    v16[1] = sub_233126348;
    return sub_2331265D0();
  }
  else
  {
    sub_233127120();
    v18 = (void *)swift_allocError();
    *v19 = 2;
    swift_willThrow();
    v20 = *(_QWORD *)(v0 + 64);
    v21 = *(_QWORD *)(v0 + 48);
    v22 = *(_QWORD *)(v0 + 56);
    *(_QWORD *)(v0 + 16) = 0;
    *(_WORD *)(v0 + 24) = 0;
    sub_233147CEC();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
    sub_233147CF8();

    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_233126348()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_2331263AC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(*(_QWORD *)(v0 + 32) + 24);
  if (v1)
  {
    v2 = *(void **)(v0 + 120);
    v3 = v1;
    sub_2331476F8();

    if (v2)
    {
      v4 = *(_QWORD *)(v0 + 64);
      v5 = *(_QWORD *)(v0 + 48);
      v6 = *(_QWORD *)(v0 + 56);
      *(_QWORD *)(v0 + 16) = 0;
      *(_WORD *)(v0 + 24) = 0;
      sub_233147CEC();
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
      sub_233147CF8();

    }
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_233126474()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 56);
  *(_QWORD *)(v0 + 16) = 0;
  *(_WORD *)(v0 + 24) = 0;
  sub_233147CEC();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  sub_233147CF8();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233126508(uint64_t a1, _BYTE *a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;
  char v12;
  char v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038CB8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v8) = *a2;
  v11 = a1;
  v12 = v8;
  v13 = a3;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038CA0);
  sub_233147CEC();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_2331265D0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  *(_QWORD *)(v1 + 24) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23312662C()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[4] = *(_QWORD *)(v0[2] + 16);
  v1 = (_QWORD *)swift_task_alloc();
  v0[5] = v1;
  *v1 = v0;
  v1[1] = sub_233126680;
  return sub_2331476E0();
}

uint64_t sub_233126680(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 48) = a1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_2331266FC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(void **)(v0 + 48);
  if (v1)
  {
    v2 = (void *)sub_233147770();
    sub_2331476BC();

    v3 = sub_233147698();
    if (v3 == sub_233147698())
    {
      v4 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 56) = v4;
      *v4 = v0;
      v4[1] = sub_2331267B4;
      return sub_2331476D4();
    }

  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2331267B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 64) = a1;
  *(_QWORD *)(v3 + 72) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_233126820()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  id v10;

  v1 = *(void **)(*(_QWORD *)(v0 + 16) + 24);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 64);
    v3 = *(void **)(v0 + 48);
    v4 = *(_QWORD *)(v0 + 24);
    v5 = v1;
    v6 = (void *)sub_233147770();
    v7 = sub_233147CD4();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v4, 1, 1, v7);
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = 0;
    v8[3] = 0;
    v8[4] = v5;
    v8[5] = v6;
    v8[6] = 0;
    v8[7] = 0;
    v8[8] = v2;
    v9 = v5;
    v10 = v6;
    sub_233129C78(v4, (uint64_t)&unk_256038C30, (uint64_t)v8);
    swift_release();

  }
  else
  {
    v9 = *(id *)(v0 + 48);
  }

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233126914()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DockAccessoryManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager_logger;
  v2 = sub_233147BB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return v0;
}

uint64_t DockAccessoryManager.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager_logger;
  v2 = sub_233147BB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

_QWORD *sub_233126A24@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_233126A34(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_233126A40(uint64_t a1, uint64_t a2)
{
  return sub_233126C78(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_233126A4C(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_233147BD8();
  *a2 = 0;
  return result;
}

uint64_t sub_233126AC0(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_233147BE4();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_233126B3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_233147BF0();
  v2 = sub_233147BCC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_233126B7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_233147BCC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_233126BC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_233147BF0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_233126BE8()
{
  sub_233127808(&qword_256038C10, (uint64_t (*)(uint64_t))type metadata accessor for DeviceType, (uint64_t)&unk_2331487FC);
  sub_233127808(&qword_256038C18, (uint64_t (*)(uint64_t))type metadata accessor for DeviceType, (uint64_t)&unk_2331487A4);
  return sub_233147E18();
}

uint64_t sub_233126C6C(uint64_t a1, uint64_t a2)
{
  return sub_233126C78(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_233126C78(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_233147BF0();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_233126CB4()
{
  sub_233147BF0();
  sub_233147C20();
  return swift_bridgeObjectRelease();
}

uint64_t sub_233126CF4()
{
  uint64_t v0;

  sub_233147BF0();
  sub_233147E9C();
  sub_233147C20();
  v0 = sub_233147ECC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_233126D64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_233147BF0();
  v2 = v1;
  if (v0 == sub_233147BF0() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_233147E60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_233126DEC(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

_QWORD *sub_233126E0C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256038C48);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23312791C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_233126F18(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038C78);
  v10 = *(_QWORD *)(type metadata accessor for DockAccessory.TrackedSubjectType(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_233147DE8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for DockAccessory.TrackedSubjectType(0) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2331297C8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

unint64_t sub_233127120()
{
  unint64_t result;

  result = qword_2560389D8;
  if (!qword_2560389D8)
  {
    result = MEMORY[0x234930AD8](&protocol conformance descriptor for DockKitError, &type metadata for DockKitError);
    atomic_store(result, (unint64_t *)&qword_2560389D8);
  }
  return result;
}

void sub_233127164()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled) = (*(_BYTE *)(v0 + 24) & 1) == 0;
}

unint64_t sub_233127188()
{
  unint64_t result;

  result = qword_2560389E8;
  if (!qword_2560389E8)
  {
    result = MEMORY[0x234930AD8](&protocol conformance descriptor for DockKitError, &type metadata for DockKitError);
    atomic_store(result, (unint64_t *)&qword_2560389E8);
  }
  return result;
}

uint64_t sub_2331271CC()
{
  return type metadata accessor for DockAccessoryManagerHelper(0);
}

uint64_t type metadata accessor for DockAccessoryManagerHelper(uint64_t a1)
{
  return sub_233127434(a1, (uint64_t *)&unk_256038A50);
}

uint64_t sub_2331271E8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233147BB4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DockKitError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DockKitError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233127384 + 4 * byte_233148505[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_2331273B8 + 4 * byte_233148500[v4]))();
}

uint64_t sub_2331273B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2331273C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2331273C8);
  return result;
}

uint64_t sub_2331273D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2331273DCLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_2331273E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2331273E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2331273F4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_233127400(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DockKitError()
{
  return &type metadata for DockKitError;
}

uint64_t sub_233127418()
{
  return type metadata accessor for DockAccessoryManager(0);
}

uint64_t type metadata accessor for DockAccessoryManager(uint64_t a1)
{
  return sub_233127434(a1, (uint64_t *)&unk_256038A88);
}

uint64_t sub_233127434(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_233127468()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233147BB4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for DockAccessoryManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DockAccessoryManager.isSystemTrackingEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of DockAccessoryManager.accessoryStateChanges.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of DockAccessoryManager.setSystemTrackingEnabled(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 240) + *(_QWORD *)(*(_QWORD *)v1 + 240));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23312759C;
  return v6(a1);
}

uint64_t sub_23312759C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t initializeBufferWithCopyOfBuffer for DockAccessory.MotionState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t sub_233127620(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_233127640(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for Vector3D(uint64_t a1)
{
  sub_233129C20(a1, &qword_256038BC8);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23312768C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2331276AC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_233129C20(a1, &qword_256038BD0);
}

void type metadata accessor for Position(uint64_t a1)
{
  sub_233129C20(a1, &qword_256038BD8);
}

void type metadata accessor for DeviceType(uint64_t a1)
{
  sub_233129C20(a1, &qword_256038BE0);
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_233129C20(a1, &qword_256038BE8);
}

__n128 __swift_memcpy48_16(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_233127744(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_233127764(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for simd_float3x3(uint64_t a1)
{
  sub_233129C20(a1, &qword_256038BF0);
}

uint64_t sub_2331277B0()
{
  return sub_233127808(&qword_256038BF8, (uint64_t (*)(uint64_t))type metadata accessor for DeviceType, (uint64_t)&unk_23314876C);
}

uint64_t sub_2331277DC()
{
  return sub_233127808(&qword_256038C00, (uint64_t (*)(uint64_t))type metadata accessor for DeviceType, (uint64_t)&unk_233148744);
}

uint64_t sub_233127808(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x234930AD8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_233127848()
{
  return sub_233127808(&qword_256038C08, (uint64_t (*)(uint64_t))type metadata accessor for DeviceType, (uint64_t)&unk_2331487D4);
}

uint64_t sub_233127878()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);

  v2 = v0[5];
  v3 = v0[6];
  v4 = v0[8];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_233129C70;
  v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_256038C38 + dword_256038C38);
  v6 = (_QWORD *)swift_task_alloc();
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_233129C70;
  return v8(v2, v3, v4);
}

uint64_t sub_23312791C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256038C50);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_233147E0C();
  __break(1u);
  return result;
}

uint64_t sub_233127A24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[8] = a3;
  v4[9] = v3;
  v4[6] = a1;
  v4[7] = a2;
  v5 = sub_233147BB4();
  v4[10] = v5;
  v4[11] = *(_QWORD *)(v5 - 8);
  v4[12] = swift_task_alloc();
  v4[13] = swift_task_alloc();
  v4[14] = type metadata accessor for DockAccessory.Identifier(0);
  v4[15] = swift_task_alloc();
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  v4[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233127AE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  os_unfair_lock_s *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD **v28;
  _QWORD *v29;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, char *, _BOOL8);
  uint64_t v46;
  uint64_t v47;
  _BOOL8 v48;
  _QWORD *v49;
  unint64_t v50;
  _QWORD *v51;
  char v52[9];

  sub_2331476BC();
  v1 = sub_233147698();
  if (v1 != sub_233147698())
    goto LABEL_20;
  v2 = (uint64_t *)(*(_QWORD *)(v0 + 72) + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_callback);
  v3 = *v2;
  *(_QWORD *)(v0 + 152) = *v2;
  *(_QWORD *)(v0 + 160) = v2[1];
  if (!v3)
    goto LABEL_20;
  v4 = *(uint64_t **)(v0 + 144);
  swift_retain();
  v5 = sub_2331476B0();
  v7 = v6;
  sub_2331476A4();
  *v4 = v5;
  v4[1] = v7;
  v8 = sub_23314786C();
  if (v8 == sub_23314786C())
  {
    v9 = *(_QWORD *)(v0 + 72);
    v10 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_manager;
    *(_QWORD *)(v0 + 168) = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_manager;
    v11 = MEMORY[0x234930BD4](v9 + v10);
    *(_QWORD *)(v0 + 176) = v11;
    if (v11)
    {
      v12 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 184) = v12;
      *v12 = v0;
      v12[1] = sub_233127FC4;
      return sub_2331476E0();
    }
  }
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 88) + 16))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 72) + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, *(_QWORD *)(v0 + 80));
  v14 = sub_233147B9C();
  v15 = sub_233147D4C();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_233121000, v14, v15, "updating previously-emitted accessories tracking button state", v16, 2u);
    MEMORY[0x234930B44](v16, -1, -1);
  }
  v17 = *(_QWORD *)(v0 + 104);
  v18 = *(_QWORD *)(v0 + 80);
  v19 = *(_QWORD *)(v0 + 88);
  v21 = *(_QWORD *)(v0 + 64);
  v20 = *(_QWORD *)(v0 + 72);
  v22 = *(_QWORD *)(v0 + 48);

  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  v23 = *(os_unfair_lock_s **)(v20 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessoriesLock);
  v24 = (_QWORD *)swift_task_alloc();
  v24[2] = v20;
  v24[3] = v22;
  v24[4] = v21;
  v25 = swift_task_alloc();
  *(_QWORD *)(v25 + 16) = sub_23312950C;
  *(_QWORD *)(v25 + 24) = v24;
  swift_retain();
  os_unfair_lock_lock(v23 + 4);
  (*(void (**)(void))(v25 + 16))();
  os_unfair_lock_unlock(v23 + 4);
  v26 = *(_QWORD *)(v0 + 72);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  v27 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v28 = (_QWORD **)(v26 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories);
  swift_beginAccess();
  v29 = *v28;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v28 = v29;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v29 = sub_233126E0C(0, v29[2] + 1, 1, v29);
    *v28 = v29;
  }
  v31 = v29[2];
  v32 = v29[3];
  v33 = v31 + 1;
  if (v31 >= v32 >> 1)
  {
    v49 = v29;
    v50 = v29[2];
    v51 = sub_233126E0C((_QWORD *)(v32 > 1), v31 + 1, 1, v49);
    v31 = v50;
    v29 = v51;
    *v28 = v51;
  }
  v35 = *(_QWORD *)(v0 + 136);
  v34 = *(_QWORD *)(v0 + 144);
  v36 = *(_QWORD *)(v0 + 72);
  v29[2] = v33;
  v37 = &v29[2 * v31];
  v37[4] = sub_23312954C;
  v37[5] = v27;
  swift_endAccess();
  swift_release();
  v38 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory;
  v39 = *(_QWORD *)(v36 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory);
  sub_233129594(v34, v35);
  v40 = *(_QWORD *)(v0 + 136);
  if (!v39)
  {
    sub_2331295D8(*(_QWORD *)(v0 + 136));
    goto LABEL_16;
  }
  v41 = *(_QWORD *)(v0 + 128);
  sub_233129594(v39 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, v41);
  v42 = sub_233147668();
  sub_2331295D8(v41);
  sub_2331295D8(v40);
  if ((v42 & 1) == 0)
  {
LABEL_16:
    v43 = *(_QWORD *)(v0 + 120);
    sub_233129594(*(_QWORD *)(v0 + 144), v43);
    type metadata accessor for DockAccessory(0);
    swift_allocObject();
    *(_QWORD *)(v36 + v38) = sub_23312F6C8(v43, 0);
    swift_release();
  }
  v44 = *(_QWORD *)(v36 + v38);
  v45 = *(void (**)(uint64_t, char *, _BOOL8))(v0 + 152);
  v46 = *(_QWORD *)(v0 + 144);
  if (v44)
  {
    v52[0] = 0;
    swift_retain();
    v47 = sub_2331479D4();
    v48 = v47 == sub_2331479D4();
    v45(v44, v52, v48);
    sub_233129614((uint64_t)v45);
    swift_release();
    sub_2331295D8(v46);
  }
  else
  {
    sub_2331295D8(*(_QWORD *)(v0 + 144));
    sub_233129614((uint64_t)v45);
  }
LABEL_20:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233127FC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 192) = a1;
  *(_QWORD *)(v3 + 200) = v1;
  swift_task_dealloc();
  if (!v1)

  return swift_task_switch();
}

uint64_t sub_233128038()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_unfair_lock_s *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD **v26;
  _QWORD *v27;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void (*v43)(uint64_t, char *, _BOOL8);
  uint64_t v44;
  uint64_t v45;
  _BOOL8 v46;
  void *v47;
  id v48;
  char v49;
  char v50[9];

  v1 = *(void **)(v0 + 192);
  if (!v1)
    goto LABEL_8;
  sub_233147860();
  v2 = swift_dynamicCastClass();
  *(_QWORD *)(v0 + 208) = v2;
  if (!v2)
  {

LABEL_8:
    v49 = 0;
    v10 = 0;
    v11 = *(_QWORD *)(v0 + 200);
    goto LABEL_9;
  }
  sub_233129624();
  v3 = v1;
  v4 = (void *)sub_233147770();

  v5 = sub_233147D64();
  if ((v5 & 1) == 0)
  {

    goto LABEL_8;
  }
  v6 = MEMORY[0x234930BD4](*(_QWORD *)(v0 + 72) + *(_QWORD *)(v0 + 168));
  *(_QWORD *)(v0 + 216) = v6;
  if (v6)
  {
    v7 = v3;
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 224) = v8;
    *v8 = v0;
    v8[1] = sub_233128550;
    return sub_2331476D4();
  }
  v11 = *(_QWORD *)(v0 + 200);
  v47 = *(void **)(v0 + 192);
  v48 = v3;
  sub_233147854();

  v10 = *(void **)(v0 + 208);
  v49 = 1;
LABEL_9:
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 88) + 16))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 72) + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, *(_QWORD *)(v0 + 80));
  v12 = sub_233147B9C();
  v13 = sub_233147D4C();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_233121000, v12, v13, "updating previously-emitted accessories tracking button state", v14, 2u);
    MEMORY[0x234930B44](v14, -1, -1);
  }
  v15 = *(_QWORD *)(v0 + 104);
  v16 = *(_QWORD *)(v0 + 80);
  v17 = *(_QWORD *)(v0 + 88);
  v19 = *(_QWORD *)(v0 + 64);
  v18 = *(_QWORD *)(v0 + 72);
  v20 = *(_QWORD *)(v0 + 48);

  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
  v21 = *(os_unfair_lock_s **)(v18 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessoriesLock);
  v22 = (_QWORD *)swift_task_alloc();
  v22[2] = v18;
  v22[3] = v20;
  v22[4] = v19;
  v23 = swift_task_alloc();
  *(_QWORD *)(v23 + 16) = sub_23312950C;
  *(_QWORD *)(v23 + 24) = v22;
  swift_retain();
  os_unfair_lock_lock(v21 + 4);
  (*(void (**)(void))(v23 + 16))();
  os_unfair_lock_unlock(v21 + 4);
  if (v11)
    return swift_task_dealloc();
  v24 = *(_QWORD *)(v0 + 72);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  v25 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v26 = (_QWORD **)(v24 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories);
  swift_beginAccess();
  v27 = *v26;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v26 = v27;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v27 = sub_233126E0C(0, v27[2] + 1, 1, v27);
    *v26 = v27;
  }
  v30 = v27[2];
  v29 = v27[3];
  if (v30 >= v29 >> 1)
  {
    v27 = sub_233126E0C((_QWORD *)(v29 > 1), v30 + 1, 1, v27);
    *v26 = v27;
  }
  v32 = *(_QWORD *)(v0 + 136);
  v31 = *(_QWORD *)(v0 + 144);
  v33 = *(_QWORD *)(v0 + 72);
  v27[2] = v30 + 1;
  v34 = &v27[2 * v30];
  v34[4] = sub_23312954C;
  v34[5] = v25;
  swift_endAccess();
  swift_release();
  v35 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory;
  v36 = *(_QWORD *)(v33 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory);
  sub_233129594(v31, v32);
  v37 = *(_QWORD *)(v0 + 136);
  if (v36)
  {
    v38 = *(_QWORD *)(v0 + 128);
    sub_233129594(v36 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, v38);
    v39 = sub_233147668();
    sub_2331295D8(v38);
    sub_2331295D8(v37);
    if ((v39 & 1) != 0)
      goto LABEL_22;
  }
  else
  {
    sub_2331295D8(*(_QWORD *)(v0 + 136));
  }
  v40 = *(_QWORD *)(v0 + 120);
  sub_233129594(*(_QWORD *)(v0 + 144), v40);
  type metadata accessor for DockAccessory(0);
  swift_allocObject();
  v41 = v10;
  *(_QWORD *)(v33 + v35) = sub_23312F6C8(v40, (uint64_t)v10);
  swift_release();
LABEL_22:
  v42 = *(_QWORD *)(v33 + v35);
  v43 = *(void (**)(uint64_t, char *, _BOOL8))(v0 + 152);
  v44 = *(_QWORD *)(v0 + 144);
  if (v42)
  {
    v50[0] = v49;
    swift_retain();
    v45 = sub_2331479D4();
    v46 = v45 == sub_2331479D4();
    v43(v42, v50, v46);
    sub_233129614((uint64_t)v43);
    swift_release();
    sub_2331295D8(v44);
  }
  else
  {
    sub_2331295D8(*(_QWORD *)(v0 + 144));
    sub_233129614((uint64_t)v43);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233128550(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 232) = v1;
  swift_task_dealloc();
  if (!v1)
  {

    *(_QWORD *)(v4 + 240) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_2331285CC()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD **v20;
  _QWORD *v21;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void (*v37)(uint64_t, char *, _BOOL8);
  uint64_t v38;
  uint64_t v39;
  _BOOL8 v40;
  char v41[9];

  v1 = *(id *)(v0 + 192);
  sub_2331479D4();
  sub_2331479D4();
  v2 = *(_QWORD *)(v0 + 232);
  v3 = *(void **)(v0 + 192);
  sub_233147854();

  v4 = *(void **)(v0 + 208);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 88) + 16))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 72) + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, *(_QWORD *)(v0 + 80));
  v5 = sub_233147B9C();
  v6 = sub_233147D4C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_233121000, v5, v6, "updating previously-emitted accessories tracking button state", v7, 2u);
    MEMORY[0x234930B44](v7, -1, -1);
  }
  v8 = *(_QWORD *)(v0 + 104);
  v9 = *(_QWORD *)(v0 + 80);
  v10 = *(_QWORD *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 64);
  v11 = *(_QWORD *)(v0 + 72);
  v13 = *(_QWORD *)(v0 + 48);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  v14 = *(os_unfair_lock_s **)(v11 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessoriesLock);
  v15 = (_QWORD *)swift_task_alloc();
  v15[2] = v11;
  v15[3] = v13;
  v15[4] = v12;
  v16 = swift_task_alloc();
  *(_QWORD *)(v16 + 16) = sub_23312950C;
  *(_QWORD *)(v16 + 24) = v15;
  swift_retain();
  os_unfair_lock_lock(v14 + 4);
  (*(void (**)(void))(v16 + 16))();
  os_unfair_lock_unlock(v14 + 4);
  if (v2)
    return swift_task_dealloc();
  v18 = *(_QWORD *)(v0 + 72);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v20 = (_QWORD **)(v18 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories);
  swift_beginAccess();
  v21 = *v20;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v20 = v21;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v21 = sub_233126E0C(0, v21[2] + 1, 1, v21);
    *v20 = v21;
  }
  v24 = v21[2];
  v23 = v21[3];
  if (v24 >= v23 >> 1)
  {
    v21 = sub_233126E0C((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
    *v20 = v21;
  }
  v26 = *(_QWORD *)(v0 + 136);
  v25 = *(_QWORD *)(v0 + 144);
  v27 = *(_QWORD *)(v0 + 72);
  v21[2] = v24 + 1;
  v28 = &v21[2 * v24];
  v28[4] = sub_23312954C;
  v28[5] = v19;
  swift_endAccess();
  swift_release();
  v29 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory;
  v30 = *(_QWORD *)(v27 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory);
  sub_233129594(v25, v26);
  v31 = *(_QWORD *)(v0 + 136);
  if (v30)
  {
    v32 = *(_QWORD *)(v0 + 128);
    sub_233129594(v30 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, v32);
    v33 = sub_233147668();
    sub_2331295D8(v32);
    sub_2331295D8(v31);
    if ((v33 & 1) != 0)
      goto LABEL_14;
  }
  else
  {
    sub_2331295D8(*(_QWORD *)(v0 + 136));
  }
  v34 = *(_QWORD *)(v0 + 120);
  sub_233129594(*(_QWORD *)(v0 + 144), v34);
  type metadata accessor for DockAccessory(0);
  swift_allocObject();
  v35 = v4;
  *(_QWORD *)(v27 + v29) = sub_23312F6C8(v34, (uint64_t)v4);
  swift_release();
LABEL_14:
  v36 = *(_QWORD *)(v27 + v29);
  v37 = *(void (**)(uint64_t, char *, _BOOL8))(v0 + 152);
  v38 = *(_QWORD *)(v0 + 144);
  if (v36)
  {
    v41[0] = 1;
    swift_retain();
    v39 = sub_2331479D4();
    v40 = v39 == sub_2331479D4();
    v37(v36, v41, v40);
    sub_233129614((uint64_t)v37);
    swift_release();
    sub_2331295D8(v38);
  }
  else
  {
    sub_2331295D8(*(_QWORD *)(v0 + 144));
    sub_233129614((uint64_t)v37);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233128A0C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_unfair_lock_s *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD **v29;
  _QWORD *v30;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, BOOL *, _BOOL8);
  uint64_t v46;
  uint64_t v47;
  _BOOL8 v48;
  BOOL v50[9];

  v1 = *(void **)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 80);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_233147B9C();
  v9 = sub_233147D40();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = v1;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v13;
    sub_233147D88();
    *v11 = v13;

    _os_log_impl(&dword_233121000, v8, v9, "failed fetching connected accessory %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v11, -1, -1);
    MEMORY[0x234930B44](v10, -1, -1);

  }
  else
  {

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  v14 = *(_QWORD *)(v0 + 200);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 88) + 16))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 72) + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, *(_QWORD *)(v0 + 80));
  v15 = sub_233147B9C();
  v16 = sub_233147D4C();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_233121000, v15, v16, "updating previously-emitted accessories tracking button state", v17, 2u);
    MEMORY[0x234930B44](v17, -1, -1);
  }
  v18 = *(_QWORD *)(v0 + 104);
  v19 = *(_QWORD *)(v0 + 80);
  v20 = *(_QWORD *)(v0 + 88);
  v22 = *(_QWORD *)(v0 + 64);
  v21 = *(_QWORD *)(v0 + 72);
  v23 = *(_QWORD *)(v0 + 48);

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
  v24 = *(os_unfair_lock_s **)(v21 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessoriesLock);
  v25 = (_QWORD *)swift_task_alloc();
  v25[2] = v21;
  v25[3] = v23;
  v25[4] = v22;
  v26 = swift_task_alloc();
  *(_QWORD *)(v26 + 16) = sub_23312950C;
  *(_QWORD *)(v26 + 24) = v25;
  swift_retain();
  os_unfair_lock_lock(v24 + 4);
  (*(void (**)(void))(v26 + 16))();
  os_unfair_lock_unlock(v24 + 4);
  v27 = *(_QWORD *)(v0 + 72);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  v28 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v29 = (_QWORD **)(v27 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories);
  swift_beginAccess();
  v30 = *v29;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v29 = v30;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v30 = sub_233126E0C(0, v30[2] + 1, 1, v30);
    *v29 = v30;
  }
  v33 = v30[2];
  v32 = v30[3];
  if (v33 >= v32 >> 1)
  {
    v30 = sub_233126E0C((_QWORD *)(v32 > 1), v33 + 1, 1, v30);
    *v29 = v30;
  }
  v35 = *(_QWORD *)(v0 + 136);
  v34 = *(_QWORD *)(v0 + 144);
  v36 = *(_QWORD *)(v0 + 72);
  v30[2] = v33 + 1;
  v37 = &v30[2 * v33];
  v37[4] = sub_23312954C;
  v37[5] = v28;
  swift_endAccess();
  swift_release();
  v38 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory;
  v39 = *(_QWORD *)(v36 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory);
  sub_233129594(v34, v35);
  v40 = *(_QWORD *)(v0 + 136);
  if (!v39)
  {
    sub_2331295D8(*(_QWORD *)(v0 + 136));
    goto LABEL_14;
  }
  v41 = *(_QWORD *)(v0 + 128);
  sub_233129594(v39 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, v41);
  v42 = sub_233147668();
  sub_2331295D8(v41);
  sub_2331295D8(v40);
  if ((v42 & 1) == 0)
  {
LABEL_14:
    v43 = *(_QWORD *)(v0 + 120);
    sub_233129594(*(_QWORD *)(v0 + 144), v43);
    type metadata accessor for DockAccessory(0);
    swift_allocObject();
    *(_QWORD *)(v36 + v38) = sub_23312F6C8(v43, 0);
    swift_release();
  }
  v44 = *(_QWORD *)(v36 + v38);
  v45 = *(void (**)(uint64_t, BOOL *, _BOOL8))(v0 + 152);
  v46 = *(_QWORD *)(v0 + 144);
  if (v44)
  {
    v50[0] = v14 == 0;
    swift_retain();
    v47 = sub_2331479D4();
    v48 = v47 == sub_2331479D4();
    v45(v44, v50, v48);
    sub_233129614((uint64_t)v45);
    swift_release();
    sub_2331295D8(v46);
  }
  else
  {
    sub_2331295D8(*(_QWORD *)(v0 + 144));
    sub_233129614((uint64_t)v45);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233128F7C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_unfair_lock_s *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD **v29;
  _QWORD *v30;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void (*v46)(uint64_t, BOOL *, _BOOL8);
  uint64_t v47;
  uint64_t v48;
  _BOOL8 v49;
  void *v51;
  BOOL v52[9];

  v1 = *(void **)(v0 + 232);
  v51 = *(void **)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 80);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_233147B9C();
  v9 = sub_233147D40();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = v1;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v13;
    sub_233147D88();
    *v11 = v13;

    _os_log_impl(&dword_233121000, v8, v9, "failed fetching connected accessory %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v11, -1, -1);
    MEMORY[0x234930B44](v10, -1, -1);

  }
  else
  {

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  v14 = *(_QWORD *)(v0 + 200);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 88) + 16))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 72) + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, *(_QWORD *)(v0 + 80));
  v15 = sub_233147B9C();
  v16 = sub_233147D4C();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_233121000, v15, v16, "updating previously-emitted accessories tracking button state", v17, 2u);
    MEMORY[0x234930B44](v17, -1, -1);
  }
  v18 = *(_QWORD *)(v0 + 104);
  v20 = *(_QWORD *)(v0 + 80);
  v19 = *(_QWORD *)(v0 + 88);
  v22 = *(_QWORD *)(v0 + 64);
  v21 = *(_QWORD *)(v0 + 72);
  v23 = *(_QWORD *)(v0 + 48);

  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  v24 = *(os_unfair_lock_s **)(v21 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessoriesLock);
  v25 = (_QWORD *)swift_task_alloc();
  v25[2] = v21;
  v25[3] = v23;
  v25[4] = v22;
  v26 = swift_task_alloc();
  *(_QWORD *)(v26 + 16) = sub_23312950C;
  *(_QWORD *)(v26 + 24) = v25;
  swift_retain();
  os_unfair_lock_lock(v24 + 4);
  (*(void (**)(void))(v26 + 16))();
  os_unfair_lock_unlock(v24 + 4);
  v27 = *(_QWORD *)(v0 + 72);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  v28 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v29 = (_QWORD **)(v27 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories);
  swift_beginAccess();
  v30 = *v29;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v29 = v30;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v30 = sub_233126E0C(0, v30[2] + 1, 1, v30);
    *v29 = v30;
  }
  v33 = v30[2];
  v32 = v30[3];
  if (v33 >= v32 >> 1)
  {
    v30 = sub_233126E0C((_QWORD *)(v32 > 1), v33 + 1, 1, v30);
    *v29 = v30;
  }
  v35 = *(_QWORD *)(v0 + 136);
  v34 = *(_QWORD *)(v0 + 144);
  v36 = *(_QWORD *)(v0 + 72);
  v30[2] = v33 + 1;
  v37 = &v30[2 * v33];
  v37[4] = sub_23312954C;
  v37[5] = v28;
  swift_endAccess();
  swift_release();
  v38 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory;
  v39 = *(_QWORD *)(v36 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory);
  sub_233129594(v34, v35);
  v40 = *(_QWORD *)(v0 + 136);
  if (!v39)
  {
    sub_2331295D8(*(_QWORD *)(v0 + 136));
    goto LABEL_14;
  }
  v41 = *(_QWORD *)(v0 + 128);
  sub_233129594(v39 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, v41);
  v42 = sub_233147668();
  sub_2331295D8(v41);
  sub_2331295D8(v40);
  if ((v42 & 1) == 0)
  {
LABEL_14:
    v43 = *(_QWORD *)(v0 + 120);
    sub_233129594(*(_QWORD *)(v0 + 144), v43);
    type metadata accessor for DockAccessory(0);
    swift_allocObject();
    v44 = v51;
    *(_QWORD *)(v36 + v38) = sub_23312F6C8(v43, (uint64_t)v51);
    swift_release();
  }
  v45 = *(_QWORD *)(v36 + v38);
  v46 = *(void (**)(uint64_t, BOOL *, _BOOL8))(v0 + 152);
  v47 = *(_QWORD *)(v0 + 144);
  if (v45)
  {
    v52[0] = v14 == 0;
    swift_retain();
    v48 = sub_2331479D4();
    v49 = v48 == sub_2331479D4();
    v46(v45, v52, v49);
    sub_233129614((uint64_t)v46);
    swift_release();
    sub_2331295D8(v47);
  }
  else
  {
    sub_2331295D8(*(_QWORD *)(v0 + 144));
    sub_233129614((uint64_t)v46);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23312950C()
{
  uint64_t v0;

  return sub_23312329C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_233129528()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23312954C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  swift_beginAccess();
  result = MEMORY[0x234930BD4](v1 + 16);
  *a1 = result;
  return result;
}

uint64_t sub_233129594(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DockAccessory.Identifier(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2331295D8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DockAccessory.Identifier(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_233129614(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

unint64_t sub_233129624()
{
  unint64_t result;

  result = qword_256038C40;
  if (!qword_256038C40)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256038C40);
  }
  return result;
}

uint64_t sub_233129664()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_233129690(uint64_t a1)
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
  v7[1] = sub_233129C70;
  return sub_233123970(a1, v4, v5, v6);
}

uint64_t sub_2331296FC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_233129720(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_233129C70;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256039C50 + dword_256039C50))(a1, v4);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_2331297C8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(type metadata accessor for DockAccessory.TrackedSubjectType(0) - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_233147E0C();
  __break(1u);
  return result;
}

uint64_t sub_2331298E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038C80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_233129928(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038C80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_233129970(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
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

uint64_t sub_233129A04()
{
  return sub_23314771C();
}

uint64_t sub_233129A24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038CA0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_233129AA4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256038CA0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_23312759C;
  return sub_2331260E8(a1, v5, v6, v7, v8);
}

uint64_t sub_233129B3C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038CA0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_233129BA0(uint64_t a1, _BYTE *a2, char a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038CA0);
  return sub_233126508(a1, a2, a3);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_233129C20(a1, &qword_256038CC0);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_233129C20(a1, &qword_256038CC8);
}

void sub_233129C20(uint64_t a1, unint64_t *a2)
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

uint64_t sub_233129C78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_233147CD4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_233147CC8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_233129970(a1, &qword_256038C20);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_233147CBC();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_233129DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_233147CD4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_233147CC8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_233129970(a1, &qword_256038C20);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_233147CBC();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256039C10);
  return swift_task_create();
}

id sub_233129F18()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  objc_super v6;

  v1 = &v0[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_feedbackCallback];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  v2 = &v0[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_eventCallback];
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  v3 = &v0[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_batteryCallback];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = &v0[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingSummaryCallback];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  swift_unknownObjectWeakInit();
  sub_233147BA8();
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for DockAccessoryHelper(0);
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t sub_23312A000(uint64_t a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(double *)(v8 + 56) = a2;
  *(_QWORD *)(v8 + 40) = a7;
  *(_QWORD *)(v8 + 48) = a8;
  *(_QWORD *)(v8 + 24) = a5;
  *(_QWORD *)(v8 + 32) = a6;
  *(_QWORD *)(v8 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_23312A024()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, double);
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, double))(*(_QWORD *)(v0 + 24)
                                                                                + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_feedbackCallback);
  if (v1)
  {
    v2 = *(double *)(v0 + 56);
    v4 = *(_QWORD *)(v0 + 40);
    v3 = *(_QWORD *)(v0 + 48);
    v5 = *(_QWORD *)(v0 + 32);
    swift_retain();
    v1(v5, v4, v3, 0, 0, v2);
    sub_233129614((uint64_t)v1);
  }
  **(_BYTE **)(v0 + 16) = v1 == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23312A194(uint64_t a1, void *a2)
{
  sub_23312A2C8(a1, a2, (uint64_t)&unk_250461370, (uint64_t)&unk_256039C30);
}

uint64_t sub_23312A1A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23312A1C4()
{
  uint64_t v0;
  void (*v1)(uint64_t, _QWORD, _QWORD);
  uint64_t v2;

  v1 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 24)
                                                      + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_eventCallback);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 32);
    swift_retain();
    v1(v2, 0, 0);
    sub_233129614((uint64_t)v1);
  }
  **(_BYTE **)(v0 + 16) = v1 == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23312A2B4(uint64_t a1, void *a2)
{
  sub_23312A2C8(a1, a2, (uint64_t)&unk_250461348, (uint64_t)&unk_256039C20);
}

void sub_23312A2C8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  id v19;
  uint64_t v20;

  v6 = v4;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = &v4[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand];
  v12 = (void *)MEMORY[0x234930BD4](v11);

  if (v12)
  {
    v13 = MEMORY[0x234930BD4](v11);
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)sub_233147770();

      sub_2331476C8();
      LOBYTE(v14) = sub_233147D64();

      if ((v14 & 1) != 0)
      {
        v16 = sub_233147CD4();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v10, 1, 1, v16);
        v17 = (_QWORD *)swift_allocObject();
        v17[2] = 0;
        v17[3] = 0;
        v17[4] = v6;
        v17[5] = a2;
        v18 = v6;
        v19 = a2;
        sub_233129DC4((uint64_t)v10, a4, (uint64_t)v17);
        swift_release();
      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_23312A408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23312A424()
{
  uint64_t v0;
  void (*v1)(uint64_t, _QWORD, _QWORD);
  uint64_t v2;

  v1 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 24)
                                                      + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_batteryCallback);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 32);
    swift_retain();
    v1(v2, 0, 0);
    sub_233129614((uint64_t)v1);
  }
  **(_BYTE **)(v0 + 16) = v1 == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23312A514()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = &v0[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand];
  v6 = (void *)MEMORY[0x234930BD4](v5);

  if (v6)
  {
    v7 = MEMORY[0x234930BD4](v5);
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)sub_233147770();

      sub_2331476C8();
      LOBYTE(v8) = sub_233147D64();

      if ((v8 & 1) != 0)
      {
        v10 = sub_233147608();
        v12 = v11;
        v13 = sub_233147CD4();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v4, 1, 1, v13);
        v14 = (_QWORD *)swift_allocObject();
        v14[2] = 0;
        v14[3] = 0;
        v14[4] = v1;
        v14[5] = v10;
        v14[6] = v12;
        v15 = v1;
        sub_233129DC4((uint64_t)v4, (uint64_t)&unk_256039BF8, (uint64_t)v14);
        swift_release();
      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_23312A65C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  return swift_task_switch();
}

uint64_t sub_23312A678()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, _QWORD, _QWORD);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 24)
                                                               + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingSummaryCallback);
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 32);
    v2 = *(_QWORD *)(v0 + 40);
    swift_retain();
    v1(v3, v2, 0, 0);
    sub_233129614((uint64_t)v1);
  }
  **(_BYTE **)(v0 + 16) = v1 == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23312A7EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t result;
  void (*v12)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t, double);
  void (*v13)(_QWORD, uint64_t, uint64_t);
  uint64_t v14;

  v2 = v1;
  v4 = sub_233147BB4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2 + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_logger, v4);
  v8 = sub_233147B9C();
  v9 = sub_233147D4C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_233121000, v8, v9, "accessory disconnected, sending error to delegate", v10, 2u);
    MEMORY[0x234930B44](v10, -1, -1);
  }

  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12 = *(void (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t, double))(v2
                                                                                + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_feedbackCallback);
  if (v12)
  {
    swift_retain();
    v12(MEMORY[0x24BEE4AF8], MEMORY[0x24BEE4AF8], MEMORY[0x24BEE4AF8], a1, 1, 0.0);
    result = sub_233129614((uint64_t)v12);
  }
  v13 = *(void (**)(_QWORD, uint64_t, uint64_t))(v2
                                                        + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_eventCallback);
  if (v13)
  {
    swift_retain();
    v13(0, a1, 1);
    return sub_233129614((uint64_t)v13);
  }
  return result;
}

id sub_23312A9C4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DockAccessoryHelper(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t DockAccessory.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_233140F4C(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, a1, type metadata accessor for DockAccessory.Identifier);
}

uint64_t type metadata accessor for DockAccessory.Identifier(uint64_t a1)
{
  return sub_233127434(a1, qword_256039228);
}

unint64_t DockAccessory.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  unint64_t v5;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v1 = v0;
  v2 = type metadata accessor for DockAccessory.Identifier(0);
  MEMORY[0x24BDAC7A8](v2);
  sub_233140F4C(v0 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, (uint64_t)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  sub_233147BFC();
  v18 = 0xD000000000000011;
  v19 = 0x800000023314B260;
  sub_233147C38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_233147C38();
  swift_bridgeObjectRelease();
  v6 = v18;
  v5 = v19;
  v7 = (unint64_t *)(v0 + OBJC_IVAR____TtC7DockKit13DockAccessory_firmwareVersion);
  swift_beginAccess();
  v8 = v7[1];
  v16 = *v7;
  v17 = v8;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038CD0);
  sub_233147BFC();
  v16 = v6;
  v17 = v5;
  swift_bridgeObjectRetain();
  sub_233147C38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_233147C38();
  swift_bridgeObjectRelease();
  v9 = v16;
  v10 = v17;
  v11 = (uint64_t *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_hardwareModel);
  swift_beginAccess();
  v12 = v11[1];
  v14 = *v11;
  v15 = v12;
  swift_bridgeObjectRetain();
  sub_233147BFC();
  v14 = v9;
  v15 = v10;
  swift_bridgeObjectRetain();
  sub_233147C38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_233147C38();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t DockAccessory.firmwareVersion.getter()
{
  return sub_23312AD38(&OBJC_IVAR____TtC7DockKit13DockAccessory_firmwareVersion);
}

uint64_t DockAccessory.hardwareModel.getter()
{
  return sub_23312AD38(&OBJC_IVAR____TtC7DockKit13DockAccessory_hardwareModel);
}

uint64_t sub_23312AD38(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t DockAccessory.Identifier.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DockAccessory.Identifier.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for DockAccessory.Identifier(0) + 24);
  v4 = sub_233147674();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t DockAccessory.Identifier.debugDescription.getter()
{
  uint64_t v1;

  v1 = sub_233147C08();
  swift_bridgeObjectRetain();
  sub_233147C38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_233147C38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_233147C38();
  swift_bridgeObjectRelease();
  type metadata accessor for DockAccessory.Identifier(0);
  sub_23314765C();
  swift_bridgeObjectRetain();
  sub_233147C38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t static DockAccessory.Identifier.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v4 = type metadata accessor for DockAccessory.Identifier(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v11 - v8;
  sub_233140F4C(a1, (uint64_t)&v11 - v8, type metadata accessor for DockAccessory.Identifier);
  sub_233140F4C(a2, (uint64_t)v7, type metadata accessor for DockAccessory.Identifier);
  LOBYTE(a2) = sub_233147668();
  sub_2331416B8((uint64_t)v7, type metadata accessor for DockAccessory.Identifier);
  sub_2331416B8((uint64_t)v9, type metadata accessor for DockAccessory.Identifier);
  return a2 & 1;
}

uint64_t static DockAccessory.Category.== infix(_:_:)()
{
  return 1;
}

uint64_t DockAccessory.Identifier.hash(into:)()
{
  sub_233147EA8();
  type metadata accessor for DockAccessory.Identifier(0);
  sub_233147674();
  sub_233127808(&qword_256038CD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_233147BC0();
}

uint64_t DockAccessory.Identifier.hashValue.getter()
{
  sub_233147E9C();
  sub_233147EA8();
  type metadata accessor for DockAccessory.Identifier(0);
  sub_233147674();
  sub_233127808(&qword_256038CD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_233147BC0();
  return sub_233147ECC();
}

uint64_t sub_23312B100(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v11;

  v3 = MEMORY[0x24BDAC7A8](a1);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)&v11 - v7;
  sub_233140F4C(v6, (uint64_t)&v11 - v7, type metadata accessor for DockAccessory.Identifier);
  sub_233140F4C(a2, (uint64_t)v5, type metadata accessor for DockAccessory.Identifier);
  v9 = sub_233147668();
  sub_2331416B8((uint64_t)v5, type metadata accessor for DockAccessory.Identifier);
  sub_2331416B8((uint64_t)v8, type metadata accessor for DockAccessory.Identifier);
  return v9 & 1;
}

uint64_t sub_23312B1D0()
{
  sub_233147E9C();
  sub_233147EA8();
  sub_233147674();
  sub_233127808(&qword_256038CD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_233147BC0();
  return sub_233147ECC();
}

uint64_t sub_23312B260()
{
  sub_233147EA8();
  sub_233147674();
  sub_233127808(&qword_256038CD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_233147BC0();
}

uint64_t sub_23312B2D8()
{
  sub_233147E9C();
  sub_233147EA8();
  sub_233147674();
  sub_233127808(&qword_256038CD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_233147BC0();
  return sub_233147ECC();
}

id DockAccessory.CameraInformation.captureDevice.getter()
{
  id *v0;

  return *v0;
}

uint64_t DockAccessory.CameraInformation.cameraPosition.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

void DockAccessory.CameraInformation.orientation.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

__n128 DockAccessory.CameraInformation.cameraIntrinsics.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  __int128 v3;
  __n128 result;

  v2 = *(_BYTE *)(v1 + 80);
  v3 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(a1 + 16) = v3;
  result = *(__n128 *)(v1 + 64);
  *(__n128 *)(a1 + 32) = result;
  *(_BYTE *)(a1 + 48) = v2;
  return result;
}

uint64_t DockAccessory.CameraInformation.referenceDimensions.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 88);
}

double DockAccessory.CameraInformation.init(captureDevice:cameraPosition:orientation:cameraIntrinsics:referenceDimensions:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X8>)
{
  char v15;
  char v16;
  __int128 v17;
  double result;
  _OWORD v19[2];
  __int128 v20;
  char v21;

  sub_233141A14(a4, (uint64_t)v19, &qword_256038CE0);
  v15 = v21;
  v16 = *a3;
  *(_QWORD *)a8 = a1;
  *(_QWORD *)(a8 + 8) = a2;
  *(_BYTE *)(a8 + 16) = v16;
  v17 = v19[1];
  *(_OWORD *)(a8 + 32) = v19[0];
  *(_OWORD *)(a8 + 48) = v17;
  result = *(double *)&v20;
  *(_OWORD *)(a8 + 64) = v20;
  *(_BYTE *)(a8 + 80) = v15;
  *(_QWORD *)(a8 + 88) = a5;
  *(_QWORD *)(a8 + 96) = a6;
  *(_BYTE *)(a8 + 104) = a7 & 1;
  return result;
}

uint64_t DockAccessory.State.debugDescription.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x64656B636F44;
  else
    return 0x64656B636F646E55;
}

BOOL static DockAccessory.State.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DockAccessory.State.hash(into:)()
{
  return sub_233147EA8();
}

uint64_t DockAccessory.State.hashValue.getter()
{
  sub_233147E9C();
  sub_233147EA8();
  return sub_233147ECC();
}

BOOL sub_23312B508(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DockAccessory.Category.debugDescription.getter()
{
  return 0x676E696B63617254;
}

uint64_t DockAccessory.Category.hash(into:)()
{
  return sub_233147EA8();
}

uint64_t sub_23312B56C()
{
  return 1;
}

uint64_t sub_23312B578()
{
  return sub_233147EA8();
}

uint64_t sub_23312B5A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_233141570(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23312B5CC()
{
  return 0;
}

void sub_23312B5D8(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23312B5E4()
{
  sub_23312BC1C();
  return sub_233147F08();
}

uint64_t sub_23312B60C()
{
  sub_23312BC1C();
  return sub_233147F14();
}

uint64_t sub_23312B634()
{
  return 0;
}

uint64_t sub_23312B640()
{
  sub_23312BC60();
  return sub_233147F08();
}

uint64_t sub_23312B668()
{
  sub_23312BC60();
  return sub_233147F14();
}

uint64_t DockAccessory.Category.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038CE8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038CF0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23312BC1C();
  sub_233147EE4();
  sub_23312BC60();
  sub_233147E48();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t DockAccessory.Category.hashValue.getter()
{
  sub_233147E9C();
  sub_233147EA8();
  return sub_233147ECC();
}

uint64_t DockAccessory.Category.init(from:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038D08);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038D10);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23312BC1C();
  v8 = v23;
  sub_233147ED8();
  if (v8)
    goto LABEL_7;
  v20 = a1;
  v23 = v5;
  v10 = v21;
  v9 = v22;
  if (*(_QWORD *)(sub_233147E3C() + 16) != 1)
  {
    v14 = sub_233147DC4();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256038D18);
    *v16 = &type metadata for DockAccessory.Category;
    sub_233147E30();
    sub_233147DB8();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x24BEE26D0], v14);
    swift_willThrow();
    v17 = v23;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v9);
    a1 = v20;
LABEL_7:
    v13 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1Tm(v13);
  }
  sub_23312BC60();
  v11 = v4;
  sub_233147E24();
  v12 = v23;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
  v13 = (uint64_t)v20;
  return __swift_destroy_boxed_opaque_existential_1Tm(v13);
}

uint64_t sub_23312BA68(_QWORD *a1)
{
  return DockAccessory.Category.init(from:)(a1);
}

uint64_t sub_23312BA7C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038CE8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038CF0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23312BC1C();
  sub_233147EE4();
  sub_23312BC60();
  sub_233147E48();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_23312BBB8()
{
  sub_233147E9C();
  sub_233147EA8();
  return sub_233147ECC();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23312BC1C()
{
  unint64_t result;

  result = qword_256038CF8;
  if (!qword_256038CF8)
  {
    result = MEMORY[0x234930AD8](&unk_233149B58, &type metadata for DockAccessory.Category.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256038CF8);
  }
  return result;
}

unint64_t sub_23312BC60()
{
  unint64_t result;

  result = qword_256038D00;
  if (!qword_256038D00)
  {
    result = MEMORY[0x234930AD8](&unk_233149B08, &type metadata for DockAccessory.Category.TrackingStandCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256038D00);
  }
  return result;
}

uint64_t sub_23312BCA4()
{
  sub_233147E9C();
  sub_233147EA8();
  return sub_233147ECC();
}

uint64_t sub_23312BCE0()
{
  return DockAccessory.Category.debugDescription.getter();
}

void DockAccessory.Observation.type.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t DockAccessory.Observation.identifier.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

double DockAccessory.Observation.rect.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t DockAccessory.Observation.faceYawAngle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for DockAccessory.Observation(0) + 28);
  return sub_23312BD5C(v3, a1);
}

uint64_t type metadata accessor for DockAccessory.Observation(uint64_t a1)
{
  return sub_233127434(a1, (uint64_t *)&unk_2560392C8);
}

uint64_t sub_23312BD5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t DockAccessory.Observation.init(identifier:type:rect:faceYawAngle:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>)
{
  char v10;
  uint64_t v11;

  v10 = *a2;
  *(_QWORD *)(a4 + 8) = a1;
  *(_BYTE *)a4 = v10;
  *(double *)(a4 + 16) = a5;
  *(double *)(a4 + 24) = a6;
  *(double *)(a4 + 32) = a7;
  *(double *)(a4 + 40) = a8;
  v11 = type metadata accessor for DockAccessory.Observation(0);
  return sub_233141A14(a3, a4 + *(int *)(v11 + 28), &qword_256038D20);
}

uint64_t DockAccessory.StateChange.accessory.getter()
{
  return swift_retain();
}

void DockAccessory.StateChange.state.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 8);
}

uint64_t DockAccessory.StateChange.trackingButtonEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 9);
}

uint64_t DockAccessory.StateChanges.Iterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  type metadata accessor for DockAccessory.StateChanges.Iterator(0);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038D30);
  *v1 = v0;
  v1[1] = sub_233129C70;
  return sub_233147D10();
}

uint64_t type metadata accessor for DockAccessory.StateChanges.Iterator(uint64_t a1)
{
  return sub_233127434(a1, (uint64_t *)&unk_256039400);
}

uint64_t sub_23312BEA4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038D30);
  *v1 = v0;
  v1[1] = sub_2331475AC;
  return sub_233147D10();
}

uint64_t sub_23312BF18()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038D30);
  *v1 = v0;
  v1[1] = sub_2331475AC;
  return sub_233147D10();
}

uint64_t DockAccessory.StateChanges.makeAsyncIterator()@<X0>(char *a1@<X8>)
{
  return sub_23312C1A8(&qword_256038D30, &qword_256038D38, type metadata accessor for DockAccessory.StateChanges.Iterator, a1);
}

uint64_t sub_23312BFA8@<X0>(uint64_t a1@<X8>)
{
  return sub_23312D694(&qword_256038D30, type metadata accessor for DockAccessory.StateChanges.Iterator, &qword_256038D38, type metadata accessor for DockAccessory.StateChanges, a1);
}

double DockAccessory.MotionState.angularVelocities.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double DockAccessory.MotionState.angularPositions.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

double DockAccessory.MotionState.timestamp.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 64);
}

void *DockAccessory.MotionState.error.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 72);
  v2 = v1;
  return v1;
}

uint64_t DockAccessory.MotionStates.Iterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  type metadata accessor for DockAccessory.MotionStates.Iterator(0);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038D48);
  *v1 = v0;
  v1[1] = sub_233129C70;
  return sub_233147D10();
}

uint64_t type metadata accessor for DockAccessory.MotionStates.Iterator(uint64_t a1)
{
  return sub_233127434(a1, (uint64_t *)&unk_256039530);
}

uint64_t sub_23312C0A4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038D48);
  *v1 = v0;
  v1[1] = sub_2331475AC;
  return sub_233147D10();
}

uint64_t sub_23312C118()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038D48);
  *v1 = v0;
  v1[1] = sub_2331475AC;
  return sub_233147D10();
}

uint64_t DockAccessory.MotionStates.makeAsyncIterator()@<X0>(char *a1@<X8>)
{
  return sub_23312C1A8(&qword_256038D48, &qword_256038D50, type metadata accessor for DockAccessory.MotionStates.Iterator, a1);
}

uint64_t sub_23312C1A8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(_QWORD)@<X2>, char *a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v19;

  v8 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v16(v15, v4, v12);
  v16(a4, (uint64_t)v15, v12);
  sub_233147D04();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v17 = a3(0);
  return (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 32))(&a4[*(int *)(v17 + 20)], v11, v8);
}

uint64_t sub_23312C2C0@<X0>(uint64_t a1@<X8>)
{
  return sub_23312D694(&qword_256038D48, type metadata accessor for DockAccessory.MotionStates.Iterator, &qword_256038D50, type metadata accessor for DockAccessory.MotionStates, a1);
}

uint64_t DockAccessory.TrackedPerson.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23312C668((uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], a1);
}

uint64_t DockAccessory.TrackedPerson.identifier.setter(uint64_t a1)
{
  return sub_23312C6B0(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t (*DockAccessory.TrackedPerson.identifier.modify())()
{
  return nullsub_1;
}

double DockAccessory.TrackedPerson.rect.getter()
{
  return sub_23312C4FC(type metadata accessor for DockAccessory.TrackedPerson);
}

uint64_t DockAccessory.TrackedPerson.rect.setter(double a1, double a2, double a3, double a4)
{
  return sub_23312C534(type metadata accessor for DockAccessory.TrackedPerson, a1, a2, a3, a4);
}

uint64_t (*DockAccessory.TrackedPerson.rect.modify())()
{
  type metadata accessor for DockAccessory.TrackedPerson(0);
  return nullsub_1;
}

uint64_t DockAccessory.TrackedPerson.saliencyRank.getter()
{
  return sub_23312C5B4(type metadata accessor for DockAccessory.TrackedPerson);
}

uint64_t DockAccessory.TrackedPerson.saliencyRank.setter(uint64_t a1, char a2)
{
  return sub_23312C5EC(a1, a2, type metadata accessor for DockAccessory.TrackedPerson);
}

uint64_t (*DockAccessory.TrackedPerson.saliencyRank.modify())()
{
  type metadata accessor for DockAccessory.TrackedPerson(0);
  return nullsub_1;
}

uint64_t DockAccessory.TrackedPerson.speakingConfidence.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for DockAccessory.TrackedPerson(0) + 28));
}

uint64_t DockAccessory.TrackedPerson.speakingConfidence.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;

  result = type metadata accessor for DockAccessory.TrackedPerson(0);
  v6 = v2 + *(int *)(result + 28);
  *(_QWORD *)v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*DockAccessory.TrackedPerson.speakingConfidence.modify())()
{
  type metadata accessor for DockAccessory.TrackedPerson(0);
  return nullsub_1;
}

uint64_t DockAccessory.TrackedPerson.lookingAtCameraConfidence.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for DockAccessory.TrackedPerson(0) + 32));
}

uint64_t DockAccessory.TrackedPerson.lookingAtCameraConfidence.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;

  result = type metadata accessor for DockAccessory.TrackedPerson(0);
  v6 = v2 + *(int *)(result + 32);
  *(_QWORD *)v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*DockAccessory.TrackedPerson.lookingAtCameraConfidence.modify())()
{
  type metadata accessor for DockAccessory.TrackedPerson(0);
  return nullsub_1;
}

uint64_t DockAccessory.TrackedObject.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23312C668((uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], a1);
}

uint64_t DockAccessory.TrackedObject.identifier.setter(uint64_t a1)
{
  return sub_23312C6B0(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t (*DockAccessory.TrackedObject.identifier.modify())()
{
  return nullsub_1;
}

double DockAccessory.TrackedObject.rect.getter()
{
  return sub_23312C4FC(type metadata accessor for DockAccessory.TrackedObject);
}

double sub_23312C4FC(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  return *(double *)(v1 + *(int *)(a1(0) + 20));
}

uint64_t DockAccessory.TrackedObject.rect.setter(double a1, double a2, double a3, double a4)
{
  return sub_23312C534(type metadata accessor for DockAccessory.TrackedObject, a1, a2, a3, a4);
}

uint64_t sub_23312C534(uint64_t (*a1)(_QWORD), double a2, double a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t result;
  double *v11;

  result = a1(0);
  v11 = (double *)(v5 + *(int *)(result + 20));
  *v11 = a2;
  v11[1] = a3;
  v11[2] = a4;
  v11[3] = a5;
  return result;
}

uint64_t (*DockAccessory.TrackedObject.rect.modify())()
{
  type metadata accessor for DockAccessory.TrackedObject(0);
  return nullsub_1;
}

uint64_t DockAccessory.TrackedObject.saliencyRank.getter()
{
  return sub_23312C5B4(type metadata accessor for DockAccessory.TrackedObject);
}

uint64_t sub_23312C5B4(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1(0) + 24));
}

uint64_t DockAccessory.TrackedObject.saliencyRank.setter(uint64_t a1, char a2)
{
  return sub_23312C5EC(a1, a2, type metadata accessor for DockAccessory.TrackedObject);
}

uint64_t sub_23312C5EC(uint64_t a1, char a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t result;
  uint64_t v7;

  result = a3(0);
  v7 = v3 + *(int *)(result + 24);
  *(_QWORD *)v7 = a1;
  *(_BYTE *)(v7 + 8) = a2 & 1;
  return result;
}

uint64_t (*DockAccessory.TrackedObject.saliencyRank.modify())()
{
  type metadata accessor for DockAccessory.TrackedObject(0);
  return nullsub_1;
}

uint64_t DockAccessory.TrackingState.time.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23312C668((uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], a1);
}

uint64_t sub_23312C668@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = a1(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v2, v4);
}

uint64_t DockAccessory.TrackingState.time.setter(uint64_t a1)
{
  return sub_23312C6B0(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900]);
}

uint64_t sub_23312C6B0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;

  v4 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v2, a1, v4);
}

uint64_t (*DockAccessory.TrackingState.time.modify())()
{
  return nullsub_1;
}

uint64_t DockAccessory.TrackingState.trackedSubjects.getter()
{
  type metadata accessor for DockAccessory.TrackingState(0);
  return swift_bridgeObjectRetain();
}

uint64_t DockAccessory.TrackingState.trackedSubjects.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for DockAccessory.TrackingState(0) + 20);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*DockAccessory.TrackingState.trackedSubjects.modify())()
{
  type metadata accessor for DockAccessory.TrackingState(0);
  return nullsub_1;
}

uint64_t DockAccessory.TrackingState.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  __int128 *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  char *v32;
  __int128 v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  unint64_t v50;
  __int128 v51;

  v1 = v0;
  v44 = type metadata accessor for DockAccessory.TrackedObject(0);
  MEMORY[0x24BDAC7A8](v44);
  v43 = (uint64_t)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = type metadata accessor for DockAccessory.TrackedPerson(0);
  MEMORY[0x24BDAC7A8](v42);
  v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = type metadata accessor for DockAccessory.TrackedSubjectType(0);
  v5 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v47 = 0x3D656D6974;
  *((_QWORD *)&v47 + 1) = 0xE500000000000000;
  sub_233147650();
  sub_233127808(&qword_256038D58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
  sub_233147E54();
  sub_233147C38();
  swift_bridgeObjectRelease();
  sub_233147C38();
  v8 = v47;
  v51 = v47;
  v9 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for DockAccessory.TrackingState(0) + 20));
  v10 = *(_QWORD *)(v9 + 16);
  if (v10)
  {
    v11 = v9 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v45 = *(_QWORD *)(v5 + 72);
    v41 = v9;
    swift_bridgeObjectRetain();
    do
    {
      sub_233140F4C(v11, (uint64_t)v7, type metadata accessor for DockAccessory.TrackedSubjectType);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v12 = v43;
        sub_2331416F4((uint64_t)v7, v43, type metadata accessor for DockAccessory.TrackedObject);
        *(_QWORD *)&v47 = 0x207463656A626FLL;
        *((_QWORD *)&v47 + 1) = 0xE700000000000000;
        sub_23314765C();
        v13 = sub_233141630(5);
        v15 = v14;
        v17 = v16;
        v19 = v18;
        swift_bridgeObjectRelease();
        MEMORY[0x23493043C](v13, v15, v17, v19);
        sub_233147C38();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_233147C38();
        sub_233147C38();
        swift_bridgeObjectRelease();
        v49 = 0;
        v50 = 0xE000000000000000;
        sub_233147C38();
        v20 = (__int128 *)(v12 + *(int *)(v44 + 20));
        v21 = v20[1];
        v47 = *v20;
        v48 = v21;
        type metadata accessor for CGRect(0);
        sub_233147DDC();
        sub_233147C38();
        sub_233147C38();
        swift_bridgeObjectRelease();
        v22 = v12;
        v23 = type metadata accessor for DockAccessory.TrackedObject;
      }
      else
      {
        sub_2331416F4((uint64_t)v7, (uint64_t)v4, type metadata accessor for DockAccessory.TrackedPerson);
        *(_QWORD *)&v47 = 0x206E6F73726570;
        *((_QWORD *)&v47 + 1) = 0xE700000000000000;
        sub_23314765C();
        v24 = sub_233141630(5);
        v26 = v25;
        v28 = v27;
        v30 = v29;
        swift_bridgeObjectRelease();
        MEMORY[0x23493043C](v24, v26, v28, v30);
        sub_233147C38();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_233147C38();
        sub_233147C38();
        swift_bridgeObjectRelease();
        v49 = 0;
        v50 = 0xE000000000000000;
        sub_233147C38();
        v31 = (int *)v42;
        v32 = &v4[*(int *)(v42 + 20)];
        v33 = *((_OWORD *)v32 + 1);
        v47 = *(_OWORD *)v32;
        v48 = v33;
        type metadata accessor for CGRect(0);
        sub_233147DDC();
        sub_233147C38();
        sub_233147C38();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v47 = 0x79636E65696C6173;
        *((_QWORD *)&v47 + 1) = 0xE90000000000003DLL;
        v34 = &v4[v31[6]];
        v35 = *(_QWORD *)v34;
        LOBYTE(v34) = v34[8];
        v49 = v35;
        LOBYTE(v50) = (_BYTE)v34;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256038D60);
        sub_233147BFC();
        sub_233147C38();
        swift_bridgeObjectRelease();
        sub_233147C38();
        sub_233147C38();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v47 = 0x676E696B61657073;
        *((_QWORD *)&v47 + 1) = 0xE90000000000003DLL;
        v36 = &v4[v31[7]];
        v37 = *(_QWORD *)v36;
        LOBYTE(v36) = v36[8];
        v49 = v37;
        LOBYTE(v50) = (_BYTE)v36;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256038D68);
        sub_233147BFC();
        sub_233147C38();
        swift_bridgeObjectRelease();
        sub_233147C38();
        sub_233147C38();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v47 = 0x3D676E696B6F6F6CLL;
        *((_QWORD *)&v47 + 1) = 0xE800000000000000;
        v38 = &v4[v31[8]];
        v39 = *(_QWORD *)v38;
        LOBYTE(v38) = v38[8];
        v49 = v39;
        LOBYTE(v50) = (_BYTE)v38;
        sub_233147BFC();
        sub_233147C38();
        swift_bridgeObjectRelease();
        sub_233147C38();
        sub_233147C38();
        swift_bridgeObjectRelease();
        v22 = (uint64_t)v4;
        v23 = type metadata accessor for DockAccessory.TrackedPerson;
      }
      sub_2331416B8(v22, v23);
      sub_233147C38();
      v11 += v45;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
    return v51;
  }
  return v8;
}

uint64_t DockAccessory.TrackingStates.Iterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  type metadata accessor for DockAccessory.TrackingStates.Iterator(0);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038D78);
  *v1 = v0;
  v1[1] = sub_233129C70;
  return sub_233147D10();
}

uint64_t sub_23312CE04()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038D78);
  *v1 = v0;
  v1[1] = sub_2331475AC;
  return sub_233147D10();
}

uint64_t sub_23312CE78()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038D78);
  *v1 = v0;
  v1[1] = sub_2331475AC;
  return sub_233147D10();
}

uint64_t DockAccessory.TrackingStates.makeAsyncIterator()@<X0>(char *a1@<X8>)
{
  return sub_23312C1A8(&qword_256038D78, &qword_256038D80, type metadata accessor for DockAccessory.TrackingStates.Iterator, a1);
}

uint64_t sub_23312CF08@<X0>(uint64_t a1@<X8>)
{
  return sub_23312D694(&qword_256038D78, type metadata accessor for DockAccessory.TrackingStates.Iterator, &qword_256038D80, type metadata accessor for DockAccessory.TrackingStates, a1);
}

uint64_t DockAccessory.AccessoryEvent.hash(into:)()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 8) >> 6;
  if (v1)
  {
    if (v1 == 1)
    {
      sub_233147EA8();
      return sub_233147EC0();
    }
    else
    {
      return sub_233147EA8();
    }
  }
  else
  {
    sub_233147EA8();
    sub_233147EA8();
    return sub_233147EB4();
  }
}

uint64_t DockAccessory.AccessoryEvent.hashValue.getter()
{
  sub_233147E9C();
  DockAccessory.AccessoryEvent.hash(into:)();
  return sub_233147ECC();
}

uint64_t sub_23312D018()
{
  sub_233147E9C();
  DockAccessory.AccessoryEvent.hash(into:)();
  return sub_233147ECC();
}

uint64_t sub_23312D06C()
{
  sub_233147E9C();
  DockAccessory.AccessoryEvent.hash(into:)();
  return sub_233147ECC();
}

uint64_t DockAccessory.AccessoryEvents.Iterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  type metadata accessor for DockAccessory.AccessoryEvents.Iterator(0);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038D90);
  *v1 = v0;
  v1[1] = sub_233129C70;
  return sub_233147D10();
}

uint64_t sub_23312D134()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038D90);
  *v1 = v0;
  v1[1] = sub_23312D1A8;
  return sub_233147D10();
}

uint64_t sub_23312D1A8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23312D1F4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038D90);
  *v1 = v0;
  v1[1] = sub_2331475AC;
  return sub_233147D10();
}

uint64_t DockAccessory.AccessoryEvents.makeAsyncIterator()@<X0>(char *a1@<X8>)
{
  return sub_23312C1A8(&qword_256038D90, &qword_256038D98, type metadata accessor for DockAccessory.AccessoryEvents.Iterator, a1);
}

uint64_t sub_23312D284@<X0>(uint64_t a1@<X8>)
{
  return sub_23312D694(&qword_256038D90, type metadata accessor for DockAccessory.AccessoryEvents.Iterator, &qword_256038D98, type metadata accessor for DockAccessory.AccessoryEvents, a1);
}

uint64_t DockAccessory.accessoryEvents.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23312D830(&qword_256039DA8, "API: getAccessoryEvents", a1);
}

uint64_t DockAccessory.BatteryState.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double DockAccessory.BatteryState.batteryLevel.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t DockAccessory.BatteryState.lowBattery.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

void DockAccessory.BatteryState.chargeState.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 25);
}

uint64_t DockAccessory.BatteryState.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_233147C20();
  swift_bridgeObjectRelease();
  sub_233147EC0();
  sub_233147EB4();
  return sub_233147EA8();
}

uint64_t DockAccessory.BatteryState.hashValue.getter()
{
  sub_233147E9C();
  swift_bridgeObjectRetain();
  sub_233147C20();
  swift_bridgeObjectRelease();
  sub_233147EC0();
  sub_233147EB4();
  sub_233147EA8();
  return sub_233147ECC();
}

uint64_t sub_23312D458()
{
  sub_233147E9C();
  swift_bridgeObjectRetain();
  sub_233147C20();
  swift_bridgeObjectRelease();
  sub_233147EC0();
  sub_233147EB4();
  sub_233147EA8();
  return sub_233147ECC();
}

uint64_t DockAccessory.BatteryStates.Iterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  type metadata accessor for DockAccessory.BatteryStates.Iterator(0);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038DA8);
  *v1 = v0;
  v1[1] = sub_233129C70;
  return sub_233147D10();
}

uint64_t sub_23312D56C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038DA8);
  *v1 = v0;
  v1[1] = sub_2331475AC;
  return sub_233147D10();
}

uint64_t sub_23312D5E0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038DA8);
  *v1 = v0;
  v1[1] = sub_2331475AC;
  return sub_233147D10();
}

uint64_t DockAccessory.BatteryStates.makeAsyncIterator()@<X0>(char *a1@<X8>)
{
  return sub_23312C1A8(&qword_256038DA8, &qword_256038DB0, type metadata accessor for DockAccessory.BatteryStates.Iterator, a1);
}

uint64_t sub_23312D670@<X0>(uint64_t a1@<X8>)
{
  return sub_23312D694(&qword_256038DA8, type metadata accessor for DockAccessory.BatteryStates.Iterator, &qword_256038DB0, type metadata accessor for DockAccessory.BatteryStates, a1);
}

uint64_t sub_23312D694@<X0>(uint64_t *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t *a3@<X4>, uint64_t (*a4)(_QWORD)@<X5>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t (*v23)(_QWORD);
  uint64_t v24;
  uint64_t (*v25)(_QWORD);

  v24 = a5;
  v25 = a4;
  v23 = a2;
  v8 = v5;
  v9 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a2(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v22 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(a3);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  v20(v19, v8, v16);
  v20(v15, (uint64_t)v19, v16);
  sub_233147D04();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v15[*(int *)(v13 + 20)], v12, v9);
  sub_2331416F4((uint64_t)v15, v24, v23);
  return sub_2331416B8(v8, v25);
}

uint64_t DockAccessory.batteryStates.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23312D830(&qword_256039D50, "API: getAccessoryBatteryStates", a1);
}

uint64_t sub_23312D830@<X0>(uint64_t *a1@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint8_t *v13;
  _QWORD *v14;
  _BYTE *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;

  v18 = a2;
  v4 = v3;
  v22 = a3;
  v21 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v19 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v20 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_233147BB4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v4 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v6);
  v10 = sub_233147B9C();
  v11 = sub_233147D34();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v17 = v4;
    v13 = v12;
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_233121000, v10, v11, v18, v12, 2u);
    v4 = v17;
    MEMORY[0x234930B44](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v14 = (_QWORD *)(v4 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v14)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v19 + 104))(v20, *MEMORY[0x24BEE6A10], v21);
    return sub_233147D1C();
  }
  else
  {
    sub_233127120();
    swift_allocError();
    *v16 = 1;
    return swift_willThrow();
  }
}

uint64_t DockAccessory.FramingMode.hash(into:)()
{
  return sub_233147EA8();
}

BOOL static DockAccessory.FramingMode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23312DA88(char a1)
{
  return *(_QWORD *)&aAutomaticenter[8 * a1];
}

uint64_t sub_23312DAA8()
{
  sub_233141884();
  return sub_233147F08();
}

uint64_t sub_23312DAD0()
{
  sub_233141884();
  return sub_233147F14();
}

uint64_t sub_23312DAF8()
{
  sub_233141840();
  return sub_233147F08();
}

uint64_t sub_23312DB20()
{
  sub_233141840();
  return sub_233147F14();
}

uint64_t sub_23312DB48()
{
  char *v0;

  return sub_23312DA88(*v0);
}

uint64_t sub_23312DB50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_233146420(a1, a2);
  *a3 = result;
  return result;
}

void sub_23312DB74(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23312DB80()
{
  sub_233141774();
  return sub_233147F08();
}

uint64_t sub_23312DBA8()
{
  sub_233141774();
  return sub_233147F14();
}

uint64_t sub_23312DBD0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23312DBFC()
{
  sub_2331417FC();
  return sub_233147F08();
}

uint64_t sub_23312DC24()
{
  sub_2331417FC();
  return sub_233147F14();
}

uint64_t sub_23312DC4C()
{
  sub_2331417B8();
  return sub_233147F08();
}

uint64_t sub_23312DC74()
{
  sub_2331417B8();
  return sub_233147F14();
}

void DockAccessory.FramingMode.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038DB8);
  v19 = *(_QWORD *)(v4 - 8);
  v20 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v18 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038DC0);
  v16 = *(_QWORD *)(v6 - 8);
  v17 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v15 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038DC8);
  v13 = *(_QWORD *)(v8 - 8);
  v14 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038DD0);
  MEMORY[0x24BDAC7A8](v12);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038DD8);
  v21 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v10 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233141774();
  sub_233147EE4();
  __asm { BR              X9 }
}

uint64_t sub_23312DE54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v4 - 68) = 0;
  sub_233141884();
  sub_233147E48();
  (*(void (**)(uint64_t, _QWORD))(v3 + 8))(v2, *(_QWORD *)(v4 - 168));
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 96) + 8))(v1, v0);
}

uint64_t DockAccessory.FramingMode.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  _QWORD *v27;
  uint64_t v28;

  v23 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038E08);
  v21[5] = *(_QWORD *)(v3 - 8);
  v21[6] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v26 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038E10);
  v21[4] = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038E18);
  v21[2] = *(_QWORD *)(v6 - 8);
  v21[3] = v6;
  MEMORY[0x24BDAC7A8](v6);
  v24 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038E20);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038E28);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v27 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_233141774();
  v15 = v28;
  sub_233147ED8();
  if (!v15)
  {
    v21[0] = v9;
    v21[1] = v8;
    v28 = v11;
    v16 = sub_233147E3C();
    if (*(_QWORD *)(v16 + 16) == 1)
      __asm { BR              X9 }
    v17 = sub_233147DC4();
    swift_allocError();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256038D18);
    *v19 = &type metadata for DockAccessory.FramingMode;
    sub_233147E30();
    sub_233147DB8();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x24BEE26D0], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v10);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
}

uint64_t sub_23312E410@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return DockAccessory.FramingMode.init(from:)(a1, a2);
}

void sub_23312E424(_QWORD *a1)
{
  DockAccessory.FramingMode.encode(to:)(a1);
}

double DockAccessory.Limits.Limit.positionRange.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double DockAccessory.Limits.Limit.maximumSpeed.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void DockAccessory.Limits.Limit.init(positionRange:maximumSpeed:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>)
{
  _BYTE *v5;

  if (a4 >= 0.0 && a3 > a2)
  {
    *a1 = a2;
    a1[1] = a3;
    a1[2] = a4;
  }
  else
  {
    sub_233127120();
    swift_allocError();
    *v5 = 3;
    swift_willThrow();
  }
}

__n128 DockAccessory.Limits.yaw.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;

  v2 = v1[1].n128_u64[0];
  v3 = v1[1].n128_u8[8];
  result = *v1;
  *a1 = *v1;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

__n128 DockAccessory.Limits.pitch.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;

  v2 = v1[3].n128_u64[0];
  v3 = v1[3].n128_u8[8];
  result = v1[2];
  *a1 = result;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

__n128 DockAccessory.Limits.roll.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;

  v2 = v1[5].n128_u64[0];
  v3 = v1[5].n128_u8[8];
  result = v1[4];
  *a1 = result;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

__n128 DockAccessory.Limits.init(yaw:pitch:roll:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  unsigned __int8 v9;
  __n128 result;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_BYTE *)(a1 + 24);
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_BYTE *)(a2 + 24);
  v8 = a3[1].n128_u64[0];
  v9 = a3[1].n128_u8[8];
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_QWORD *)(a4 + 16) = v4;
  *(_BYTE *)(a4 + 24) = v5;
  *(_OWORD *)(a4 + 32) = *(_OWORD *)a2;
  *(_QWORD *)(a4 + 48) = v6;
  *(_BYTE *)(a4 + 56) = v7;
  result = *a3;
  *(__n128 *)(a4 + 64) = *a3;
  *(_QWORD *)(a4 + 80) = v8;
  *(_BYTE *)(a4 + 88) = v9;
  return result;
}

uint64_t DockAccessory.framingMode.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  char v5;
  os_unfair_lock_s *v6;
  uint64_t result;

  v3 = OBJC_IVAR____TtC7DockKit13DockAccessory__framingModeLock;
  v4 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory__framingModeLock);
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  swift_release();
  v5 = *(_BYTE *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory__framingMode);
  v6 = *(os_unfair_lock_s **)(v1 + v3);
  swift_retain();
  os_unfair_lock_unlock(v6 + 4);
  result = swift_release();
  *a1 = v5;
  return result;
}

double DockAccessory.regionOfInterest.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  double v3;
  os_unfair_lock_s *v4;

  v1 = OBJC_IVAR____TtC7DockKit13DockAccessory__roiLock;
  v2 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC7DockKit13DockAccessory__roiLock);
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  swift_release();
  v3 = *(double *)(v0 + OBJC_IVAR____TtC7DockKit13DockAccessory__roi);
  v4 = *(os_unfair_lock_s **)(v0 + v1);
  swift_retain();
  os_unfair_lock_unlock(v4 + 4);
  swift_release();
  return v3;
}

uint64_t DockAccessory.motionStates.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23312E688(a1);
}

uint64_t sub_23312E688@<X0>(uint64_t a1@<X8>)
{
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
  id *v12;
  void (*v13)(char *);
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint8_t *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  id v26;
  id v27;
  _BYTE *v28;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  id v46;
  id v47;
  char *v48;
  NSObject *v49;
  uint64_t v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[2];
  void (*v66)(char *, uint64_t);
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75[3];
  uint64_t v76;

  v72 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039D18);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_233147BB4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v73 = (char *)v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v65 - v10;
  v12 = (id *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v12)
  {
    v70 = v3;
    v71 = v1;
    v67 = v2;
    v68 = v5;
    v13 = *(void (**)(char *))(v7 + 16);
    v69 = v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
    v13(v11);
    v14 = sub_233147B9C();
    v15 = sub_233147D34();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = v6;
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_233121000, v14, v15, "API: getMotionStates", v17, 2u);
      v18 = v17;
      v6 = v16;
      MEMORY[0x234930B44](v18, -1, -1);
    }

    v66 = *(void (**)(char *, uint64_t))(v7 + 8);
    v66(v11, v6);
    v76 = MEMORY[0x24BEE4AF8];
    if (*v12)
    {
      v19 = *v12;
      v20 = (void *)sub_23314783C();

      if (v20)
      {
        v21 = sub_233147B0C();

        sub_233147B3C();
        v22 = sub_233147B18();
        if (*(_QWORD *)(v21 + 16) && (v24 = sub_2331406D8(v22, v23), (v25 & 1) != 0))
        {
          v26 = *(id *)(*(_QWORD *)(v21 + 56) + 8 * v24);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (swift_dynamicCastClass())
          {
            v27 = v26;
            MEMORY[0x234930490]();
            if (*(_QWORD *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_233147CA4();
            sub_233147CB0();
            sub_233147C98();

          }
          else
          {

          }
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
      if (*v12)
      {
        v30 = *v12;
        v31 = (void *)sub_23314783C();

        if (v31)
        {
          v32 = sub_233147B0C();

          sub_233147B3C();
          v33 = sub_233147B30();
          if (*(_QWORD *)(v32 + 16) && (v35 = sub_2331406D8(v33, v34), (v36 & 1) != 0))
          {
            v37 = *(id *)(*(_QWORD *)(v32 + 56) + 8 * v35);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (swift_dynamicCastClass())
            {
              v38 = v37;
              MEMORY[0x234930490]();
              if (*(_QWORD *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                sub_233147CA4();
              sub_233147CB0();
              sub_233147C98();

            }
            else
            {

            }
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
        }
        if (*v12)
        {
          v39 = *v12;
          v40 = (void *)sub_23314783C();

          if (v40)
          {
            v41 = sub_233147B0C();

            sub_233147B3C();
            v42 = sub_233147B24();
            if (*(_QWORD *)(v41 + 16) && (v44 = sub_2331406D8(v42, v43), (v45 & 1) != 0))
            {
              v46 = *(id *)(*(_QWORD *)(v41 + 56) + 8 * v44);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (swift_dynamicCastClass())
              {
                v47 = v46;
                MEMORY[0x234930490]();
                if (*(_QWORD *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                  sub_233147CA4();
                sub_233147CB0();
                sub_233147C98();

              }
              else
              {

              }
            }
            else
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
          }
        }
      }
    }
    v48 = v73;
    ((void (*)(char *, uint64_t, uint64_t))v13)(v73, v69, v6);
    v49 = sub_233147B9C();
    v50 = v6;
    v51 = sub_233147D4C();
    if (os_log_type_enabled(v49, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc();
      v75[0] = swift_slowAlloc();
      v69 = v50;
      v53 = v75[0];
      *(_DWORD *)v52 = 136315138;
      v65[1] = v52 + 4;
      swift_beginAccess();
      v54 = sub_233147B3C();
      v55 = swift_bridgeObjectRetain();
      v56 = MEMORY[0x2349304B4](v55, v54);
      v58 = v57;
      swift_bridgeObjectRelease();
      v74 = sub_23313FD70(v56, v58, v75);
      sub_233147D88();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_233121000, v49, v51, "Requesting motion states with actuators: %s", v52, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x234930B44](v53, -1, -1);
      MEMORY[0x234930B44](v52, -1, -1);

      v59 = v73;
      v60 = v69;
    }
    else
    {

      v59 = v48;
      v60 = v50;
    }
    v66(v59, v60);
    v62 = v67;
    v61 = v68;
    v63 = swift_beginAccess();
    v64 = v76;
    MEMORY[0x24BDAC7A8](v63);
    v65[-2] = v71;
    v65[-1] = v64;
    (*(void (**)(char *, _QWORD, uint64_t))(v70 + 104))(v61, *MEMORY[0x24BEE6A10], v62);
    swift_bridgeObjectRetain();
    sub_233147D1C();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_233127120();
    swift_allocError();
    *v28 = 1;
    return swift_willThrow();
  }
}

uint64_t DockAccessory.trackingStates.getter()
{
  return sub_23312EDCC();
}

uint64_t sub_23312EDCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint8_t *v11;
  _QWORD *v12;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039CC0);
  v17 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v18 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_233147BB4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v4);
  v8 = sub_233147B9C();
  v9 = sub_233147D34();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v16 = v1;
    v11 = v10;
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_233121000, v8, v9, "API: getTrackingStates", v10, 2u);
    v1 = v16;
    MEMORY[0x234930B44](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12 = (_QWORD *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v12)
  {
    type metadata accessor for DockAccessory.TrackingState(0);
    (*(void (**)(char *, _QWORD, uint64_t))(v17 + 104))(v18, *MEMORY[0x24BEE6A10], v2);
    return sub_233147D1C();
  }
  else
  {
    sub_233127120();
    swift_allocError();
    *v14 = 1;
    return swift_willThrow();
  }
}

void DockAccessory.limits.getter(uint64_t a1@<X8>)
{
  sub_23312F010(a1);
}

void sub_23312F010(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id *v10;
  id v11;
  double v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  _QWORD *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void (*v31)(char *, unint64_t, uint64_t);
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  char *v59;
  double v60;
  char v61;
  double v62;
  double v63;
  char v64;
  char v65;
  _BYTE *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  int v72;
  int v73;
  double v74;
  double v75;
  double v76;
  int v77;
  double v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(char *, unint64_t, uint64_t);
  NSObject *v82;
  uint64_t v83;
  uint64_t v84;

  v3 = sub_233147BB4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2331477F4();
  v83 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = v1;
  v10 = (id *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  v11 = *v10;
  v12 = 0.0;
  if (*v10)
  {
    v71 = v6;
    v13 = v11;
    v14 = (void *)sub_23314783C();

    if (v14)
    {

      if (!*v10)
        goto LABEL_42;
      v15 = *v10;
      v16 = (void *)sub_23314783C();

      if (!v16)
      {
LABEL_43:
        __break(1u);
        return;
      }
      v17 = v82;
      v18 = sub_233147998();
      v70 = v4;
      if (v17)
      {

        v19 = v17;
LABEL_7:
        (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v71, v79 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v3);
        v20 = v19;
        v21 = v19;
        v22 = sub_233147B9C();
        v23 = sub_233147D4C();
        if (os_log_type_enabled(v22, v23))
        {
          v24 = (uint8_t *)swift_slowAlloc();
          v25 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v24 = 138412290;
          v26 = v19;
          v27 = _swift_stdlib_bridgeErrorToNSError();
          v84 = v27;
          sub_233147D88();
          *v25 = v27;

          _os_log_impl(&dword_233121000, v22, v23, "Caught err %@ and returning public", v24, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
          swift_arrayDestroy();
          MEMORY[0x234930B44](v25, -1, -1);
          MEMORY[0x234930B44](v24, -1, -1);
        }
        else
        {

        }
        (*(void (**)(char *, uint64_t))(v70 + 8))(v71, v3);
        sub_233127120();
        swift_allocError();
        sub_23312411C(v19, v59);
        swift_willThrow();

        return;
      }
      v82 = 0;
      v69 = v18;

      v28 = *(_QWORD *)(v69 + 16);
      if (v28)
      {
        v68 = v3;
        v29 = v69 + ((*(unsigned __int8 *)(v83 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v83 + 80));
        v30 = *(_QWORD *)(v83 + 72);
        v78 = 0.0;
        v75 = 0.0;
        v76 = 0.0;
        v31 = *(void (**)(char *, unint64_t, uint64_t))(v83 + 16);
        v80 = v30;
        v81 = v31;
        v77 = 1;
        v74 = 0.0;
        v32 = 0.0;
        v33 = 0.0;
        v73 = 1;
        v34 = 0.0;
        v35 = 0.0;
        v36 = 0.0;
        v72 = 1;
        v31(v9, v29, v7);
        while (1)
        {
          sub_2331477C4();
          v38 = v37;
          sub_2331477B8();
          if (v38 > v39)
          {
            __break(1u);
LABEL_42:
            __break(1u);
            goto LABEL_43;
          }
          v40 = v39;
          sub_2331477E8();
          if (v41 < 0.0 || v40 <= v38)
          {
            sub_233127120();
            v19 = swift_allocError();
            *v66 = 3;
            swift_willThrow();
            (*(void (**)(char *, uint64_t))(v83 + 8))(v9, v7);
            swift_bridgeObjectRelease();
            v3 = v68;
            v4 = v70;
            goto LABEL_7;
          }
          v43 = v41;
          v44 = sub_2331477DC();
          v46 = v45;
          sub_233147B3C();
          if (v44 == sub_233147B18() && v46 == v47)
            break;
          v48 = sub_233147E60();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v48 & 1) != 0)
            goto LABEL_25;
LABEL_26:
          v49 = sub_2331477DC();
          v51 = v50;
          if (v49 == sub_233147B30() && v51 == v52)
          {
            swift_bridgeObjectRelease_n();
LABEL_30:
            v73 = 0;
            v74 = -v40;
            v32 = -v38;
            v33 = v43;
            goto LABEL_31;
          }
          v53 = sub_233147E60();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v53 & 1) != 0)
            goto LABEL_30;
LABEL_31:
          v54 = sub_2331477DC();
          v56 = v55;
          if (v54 == sub_233147B24() && v56 == v57)
          {
            swift_bridgeObjectRelease_n();
            (*(void (**)(char *, uint64_t))(v83 + 8))(v9, v7);
LABEL_12:
            v77 = 0;
            v78 = v38;
            v75 = v43;
            v76 = v40;
            goto LABEL_13;
          }
          v58 = sub_233147E60();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v83 + 8))(v9, v7);
          if ((v58 & 1) != 0)
            goto LABEL_12;
LABEL_13:
          v29 += v80;
          if (!--v28)
          {
            swift_bridgeObjectRelease();
            v12 = v78;
            v61 = v77;
            v62 = v75;
            v60 = v76;
            v63 = v74;
            v64 = v73;
            v65 = v72;
            goto LABEL_39;
          }
          v81(v9, v29, v7);
        }
        swift_bridgeObjectRelease_n();
LABEL_25:
        v72 = 0;
        v34 = v38;
        v35 = v40;
        v36 = v43;
        goto LABEL_26;
      }
      swift_bridgeObjectRelease();
    }
  }
  v60 = 0.0;
  v61 = 1;
  v62 = 0.0;
  v63 = 0.0;
  v32 = 0.0;
  v33 = 0.0;
  v64 = 1;
  v34 = 0.0;
  v35 = 0.0;
  v65 = 1;
  v36 = 0.0;
LABEL_39:
  *(double *)a1 = v34;
  *(double *)(a1 + 8) = v35;
  *(double *)(a1 + 16) = v36;
  *(_BYTE *)(a1 + 24) = v65 & 1;
  *(double *)(a1 + 32) = v63;
  *(double *)(a1 + 40) = v32;
  *(double *)(a1 + 48) = v33;
  *(_BYTE *)(a1 + 56) = v64 & 1;
  *(double *)(a1 + 64) = v12;
  *(double *)(a1 + 72) = v60;
  *(double *)(a1 + 80) = v62;
  *(_BYTE *)(a1 + 88) = v61 & 1;
}

uint64_t sub_23312F6C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v46;

  v3 = v2;
  v6 = sub_233147BB4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_233147BA8();
  v10 = (_QWORD *)(v2 + OBJC_IVAR____TtC7DockKit13DockAccessory_firmwareVersion);
  *v10 = 0;
  v10[1] = 0;
  v11 = (_QWORD *)(v2 + OBJC_IVAR____TtC7DockKit13DockAccessory_hardwareModel);
  *v11 = 0;
  v11[1] = 0;
  *(_BYTE *)(v2 + OBJC_IVAR____TtC7DockKit13DockAccessory__framingMode) = 0;
  v12 = OBJC_IVAR____TtC7DockKit13DockAccessory__framingModeLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038C98);
  v13 = swift_allocObject();
  *(_DWORD *)(v13 + 16) = 0;
  *(_QWORD *)(v3 + v12) = v13;
  v14 = v3 + OBJC_IVAR____TtC7DockKit13DockAccessory__roi;
  *(_QWORD *)v14 = 0;
  *(_QWORD *)(v14 + 8) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(v14 + 16) = _Q0;
  v20 = OBJC_IVAR____TtC7DockKit13DockAccessory__roiLock;
  v21 = swift_allocObject();
  *(_DWORD *)(v21 + 16) = 0;
  *(_QWORD *)(v3 + v20) = v21;
  *(_BYTE *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory__tracking) = 0;
  v22 = OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgressLock;
  v23 = swift_allocObject();
  *(_DWORD *)(v23 + 16) = 0;
  *(_QWORD *)(v3 + v22) = v23;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgress) = 0;
  sub_233147614();
  v24 = OBJC_IVAR____TtC7DockKit13DockAccessory__animateCommandLock;
  sub_233147B84();
  *(_QWORD *)(v3 + v24) = sub_233147B78();
  sub_233147614();
  *(_QWORD *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory__maxPositionFrequency) = 0x4000000000000000;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory__maxAnimateFrequency) = 0x4000000000000000;
  v25 = OBJC_IVAR____TtC7DockKit13DockAccessory_trackingSummaryLock;
  sub_233147B60();
  *(_QWORD *)(v3 + v25) = sub_233147B54();
  *(_QWORD *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_publishSummaryPeriod) = 0x3FA999999999999ALL;
  sub_233147614();
  v26 = OBJC_IVAR____TtC7DockKit13DockAccessory_allocatedLock;
  v27 = swift_allocObject();
  *(_QWORD *)(v3 + v26) = v27;
  *(_DWORD *)(v27 + 16) = 0;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory) = 0;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_helper) = 0;
  sub_233140F4C(a1, v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, type metadata accessor for DockAccessory.Identifier);
  if (a2 && (sub_233147860(), (v28 = swift_dynamicCastClass()) != 0))
  {
    v29 = (void *)v28;
    v30 = (id *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
    swift_beginAccess();
    v31 = *v30;
    *v30 = v29;
    swift_unknownObjectRetain();

    if (*v30)
    {
      v32 = *v30;
      v33 = sub_233147764();
      v35 = v34;

    }
    else
    {
      v33 = 0;
      v35 = 0;
    }
    v39 = (uint64_t *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_firmwareVersion);
    swift_beginAccess();
    *v39 = v33;
    v39[1] = v35;
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v40 = *v30;
    if (*v30)
    {
      swift_endAccess();
      v41 = v40;
      v40 = (void *)sub_23314777C();
      v43 = v42;
      swift_unknownObjectRelease();

      sub_2331416B8(a1, type metadata accessor for DockAccessory.Identifier);
    }
    else
    {
      sub_2331416B8(a1, type metadata accessor for DockAccessory.Identifier);
      swift_endAccess();
      swift_unknownObjectRelease();
      v43 = 0;
    }
    v44 = (_QWORD *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_hardwareModel);
    swift_beginAccess();
    *v44 = v40;
    v44[1] = v43;
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v6);
    v36 = sub_233147B9C();
    v37 = sub_233147D4C();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_233121000, v36, v37, "No stand provided, cannot use this object for IPC", v38, 2u);
      MEMORY[0x234930B44](v38, -1, -1);
    }

    swift_unknownObjectRelease();
    sub_2331416B8(a1, type metadata accessor for DockAccessory.Identifier);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v3;
}

uint64_t DockAccessory.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void (*v10)(char *, uint64_t);
  id *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v18;

  v1 = v0;
  v2 = sub_233147BB4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v2);
  v7 = sub_233147B9C();
  v8 = sub_233147D4C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_233121000, v7, v8, "DockAccessory de-init: cleaning up", v9, 2u);
    MEMORY[0x234930B44](v9, -1, -1);
  }

  v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v5, v2);
  v11 = (id *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v11)
  {
    v12 = *v11;
    sub_23314780C();

    if (*v11)
    {
      v13 = *v11;
      sub_233147758();

    }
  }
  v10(v6, v2);
  sub_2331416B8(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, type metadata accessor for DockAccessory.Identifier);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  v14 = v1 + OBJC_IVAR____TtC7DockKit13DockAccessory__lastOrientationCommandTime;
  v15 = sub_233147650();
  v16 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8);
  v16(v14, v15);
  swift_release();
  v16(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory__lastAnimateCommandTime, v15);
  swift_release();
  v16(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_lastSummaryPublishTime, v15);
  swift_release();

  return v1;
}

uint64_t DockAccessory.__deallocating_deinit()
{
  DockAccessory.deinit();
  return swift_deallocClassInstance();
}

uint64_t static DockAccessory.== infix(_:_:)()
{
  type metadata accessor for DockAccessory.Identifier(0);
  return sub_233147668();
}

uint64_t DockAccessory.hash(into:)()
{
  sub_233147EA8();
  type metadata accessor for DockAccessory.Identifier(0);
  sub_233147674();
  sub_233127808(&qword_256038CD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_233147BC0();
}

id DockAccessory.setOrientation(_:duration:relative:)(uint64_t a1, uint64_t a2, int a3, double a4, double a5, double a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  os_unfair_lock_s *v32;
  char v33;
  os_unfair_lock_s *v34;
  id result;
  _BYTE *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44[3];

  v8 = v6;
  v15 = sub_233147BB4();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v8 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v15);
  v19 = sub_233147B9C();
  v20 = sub_233147D34();
  v40 = v20;
  v21 = os_log_type_enabled(v19, v20);
  v42 = a1;
  if (v21)
  {
    v22 = swift_slowAlloc();
    v41 = a2;
    v23 = v22;
    v37 = swift_slowAlloc();
    v44[0] = v37;
    *(_DWORD *)v23 = 134350082;
    v43 = a4;
    v39 = v7;
    sub_233147D88();
    v38 = a3;
    *(_WORD *)(v23 + 12) = 2050;
    v43 = a5;
    sub_233147D88();
    *(_WORD *)(v23 + 22) = 2050;
    v43 = a6;
    sub_233147D88();
    *(_WORD *)(v23 + 32) = 2082;
    v24 = sub_233147EFC();
    v43 = COERCE_DOUBLE(sub_23313FD70(v24, v25, v44));
    sub_233147D88();
    LOBYTE(a3) = v38;
    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 42) = 1026;
    LODWORD(v43) = a3 & 1;
    sub_233147D88();
    _os_log_impl(&dword_233121000, v19, (os_log_type_t)v40, "API: setOrientation: %{public}f, %{public}f, %{public}f dur %{public}s, rel: %{BOOL,public}d", (uint8_t *)v23, 0x30u);
    v26 = v37;
    swift_arrayDestroy();
    MEMORY[0x234930B44](v26, -1, -1);
    v27 = v23;
    a2 = v41;
    MEMORY[0x234930B44](v27, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  v28 = (_QWORD *)(v8 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v28)
  {
    v29 = a3;
    if (qword_2560389A0 != -1)
      swift_once();
    v30 = qword_2560389A8;
    v31 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
    v32 = *(os_unfair_lock_s **)(qword_2560389A8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
    swift_retain();
    os_unfair_lock_lock(v32 + 4);
    swift_release();
    v33 = *(_BYTE *)(v30 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
    v34 = (os_unfair_lock_s *)(*(_QWORD *)(v30 + v31) + 16);
    swift_retain();
    os_unfair_lock_unlock(v34);
    swift_release();
    if ((v33 & 1) != 0)
    {
      return sub_2331302A8(v42, a2, v29 & 1);
    }
    else
    {
      result = (id)sub_233147DF4();
      __break(1u);
    }
  }
  else
  {
    sub_233127120();
    swift_allocError();
    *v36 = 1;
    return (id)swift_willThrow();
  }
  return result;
}

id sub_2331302A8(uint64_t a1, uint64_t a2, int a3)
{
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
  char *v15;
  uint64_t v16;
  char *v17;
  id *v18;
  id v19;
  id v20;
  char v21;
  os_unfair_lock_s *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  os_unfair_lock_s *v31;
  char v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  char *v37;
  id result;
  uint64_t v39;
  void *v40;
  char *v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  void *v46;
  uint64_t v47;
  os_unfair_lock_s *v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  os_unfair_lock_s *v59;
  void *v60;
  id v61;
  os_unfair_lock_s *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;

  v68 = a3;
  v65 = a1;
  v66 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  MEMORY[0x24BDAC7A8](v4);
  v67 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_233147650();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_233147BB4();
  v10 = *(_QWORD *)(v69 - 8);
  v11 = MEMORY[0x24BDAC7A8](v69);
  v64 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v63 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v63 - v16;
  v18 = (id *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (!*v18
    || (v19 = *v18, v70 = v3, v20 = v19, v21 = sub_233147848(), v20, v3 = v70, (v21 & 1) == 0))
  {
    v33 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v17, v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v69);
    v34 = sub_233147B9C();
    v35 = sub_233147D4C();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_233121000, v34, v35, "Tracking button off, motors disabled", v36, 2u);
      MEMORY[0x234930B44](v36, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v17, v33);
    v32 = 2;
    goto LABEL_10;
  }
  v63 = OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgressLock;
  v22 = *(os_unfair_lock_s **)(v70 + OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgressLock);
  swift_retain();
  os_unfair_lock_lock(v22 + 4);
  swift_release();
  v23 = v70 + OBJC_IVAR____TtC7DockKit13DockAccessory__lastOrientationCommandTime;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v23, v6);
  sub_23314762C();
  v24 = v70;
  v26 = v25;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (fabs(v26) < 1.0 / *(double *)(v24 + OBJC_IVAR____TtC7DockKit13DockAccessory__maxPositionFrequency))
  {
    v27 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v15, v24 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v69);
    v28 = sub_233147B9C();
    v29 = sub_233147D34();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_233121000, v28, v29, "rate limiting set orientation API", v30, 2u);
      MEMORY[0x234930B44](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v27);
    v31 = *(os_unfair_lock_s **)(v70 + v63);
    swift_retain();
    os_unfair_lock_unlock(v31 + 4);
    swift_release();
    v32 = 7;
LABEL_10:
    sub_233127120();
    swift_allocError();
    *v37 = v32;
    return (id)swift_willThrow();
  }
  sub_233147644();
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 40))(v23, v9, v6);
  swift_endAccess();
  v39 = OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgress;
  v40 = *(void **)(v24 + OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgress);
  if (v40 && (objc_msgSend(v40, sel_isCancelled) & 1) == 0)
  {
    result = *(id *)(v24 + v39);
    if (!result)
    {
      __break(1u);
      return result;
    }
    if ((objc_msgSend(result, sel_isFinished) & 1) == 0)
    {
      v41 = v64;
      v42 = v69;
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v64, v24 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v69);
      v43 = sub_233147B9C();
      v44 = sub_233147D4C();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v45 = 0;
        _os_log_impl(&dword_233121000, v43, v44, "Orientation in progress, cancelling", v45, 2u);
        MEMORY[0x234930B44](v45, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v41, v42);
      v24 = v70;
      v46 = *(void **)(v70 + v39);
      if (v46)
        objc_msgSend(v46, sel_cancel);
    }
  }
  v47 = v63;
  v48 = *(os_unfair_lock_s **)(v24 + v63);
  swift_retain();
  os_unfair_lock_unlock(v48 + 4);
  swift_release();
  if (*v18)
  {
    v49 = *v18;
    sub_233147818();

  }
  v50 = objc_msgSend(objc_allocWithZone((Class)sub_2331477AC()), sel_init);
  sub_233147788();
  sub_2331477A0();
  sub_233147794();
  v51 = objc_msgSend((id)objc_opt_self(), sel_progressWithTotalUnitCount_, 1);
  v52 = sub_233147CD4();
  v53 = (uint64_t)v67;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56))(v67, 1, 1, v52);
  v54 = swift_allocObject();
  *(_QWORD *)(v54 + 16) = 0;
  *(_QWORD *)(v54 + 24) = 0;
  v55 = v66;
  *(_QWORD *)(v54 + 32) = v65;
  *(_QWORD *)(v54 + 40) = v55;
  v56 = v70;
  *(_QWORD *)(v54 + 48) = v70;
  *(_QWORD *)(v54 + 56) = v50;
  *(_BYTE *)(v54 + 64) = v68 & 1;
  *(_QWORD *)(v54 + 72) = v51;
  swift_retain();
  v57 = v50;
  v58 = v51;
  sub_233129C78(v53, (uint64_t)&unk_256039CB8, v54);
  swift_release();
  v59 = *(os_unfair_lock_s **)(v56 + v47);
  swift_retain();
  os_unfair_lock_lock(v59 + 4);
  swift_release();
  v60 = *(void **)(v56 + v39);
  *(_QWORD *)(v56 + v39) = v58;
  v61 = v58;

  v62 = *(os_unfair_lock_s **)(v56 + v47);
  swift_retain();
  os_unfair_lock_unlock(v62 + 4);

  swift_release();
  return v61;
}

id DockAccessory.setOrientation(_:duration:relative:)(uint64_t a1, uint64_t a2, int a3, __n128 a4, __n128 a5)
{
  unint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  os_unfair_lock_s *v16;
  char v17;
  os_unfair_lock_s *v18;
  int v19;
  double v20;
  double v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  os_log_t v32;
  uint64_t v33;
  _BYTE *v34;
  id result;
  uint64_t v36;
  os_log_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  int v43;
  __n128 v44;
  __n128 v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  _OWORD v50[2];
  SPRotation3D v51;

  v46 = a2;
  v44 = a4;
  v45 = a5;
  v8 = sub_233147BB4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)(v5 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v12)
  {
    v43 = a3;
    v13 = a1;
    if (qword_2560389A0 != -1)
      swift_once();
    v14 = qword_2560389A8;
    v15 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
    v16 = *(os_unfair_lock_s **)(qword_2560389A8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
    swift_retain();
    os_unfair_lock_lock(v16 + 4);
    swift_release();
    v17 = *(_BYTE *)(v14 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
    v18 = *(os_unfair_lock_s **)(v14 + v15);
    swift_retain();
    os_unfair_lock_unlock(v18 + 4);
    swift_release();
    if ((v17 & 1) != 0)
    {
      v19 = sub_233147D58();
      *(__n128 *)&v51.quaternion.vector.f64[2] = v44;
      *(__n128 *)v51.vector.f64 = v45;
      v50[0] = v44;
      v50[1] = v45;
      SPRotation3DGetEulerAngles(v51, (uint64_t)v50, v19, (uint64_t)&v47);
      SPVector3DMake(v47, v48, v49, &v47);
      v45.n128_f64[0] = v48;
      v20 = v47;
      v21 = v49;
      v44.n128_u64[0] = v5;
      v22 = v9;
      (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v11, v5 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v8);
      v23 = sub_233147B9C();
      v24 = sub_233147D34();
      v25 = v24;
      if (os_log_type_enabled(v23, v24))
      {
        v26 = swift_slowAlloc();
        v39 = v25;
        v27 = v26;
        *(double *)&v40 = COERCE_DOUBLE(swift_slowAlloc());
        v47 = *(double *)&v40;
        *(_DWORD *)v27 = 134350082;
        *(double *)v50 = v20;
        v41 = v22;
        v42 = v20;
        sub_233147D88();
        *(_WORD *)(v27 + 12) = 2050;
        *(_QWORD *)&v50[0] = v45.n128_u64[0];
        sub_233147D88();
        *(_WORD *)(v27 + 22) = 2050;
        *(double *)v50 = v21;
        sub_233147D88();
        *(_WORD *)(v27 + 32) = 2082;
        v38 = v8;
        v37 = v23;
        v28 = v46;
        v29 = sub_233147EFC();
        *(_QWORD *)&v50[0] = sub_23313FD70(v29, v30, (uint64_t *)&v47);
        sub_233147D88();
        swift_bridgeObjectRelease();
        *(_WORD *)(v27 + 42) = 1026;
        v31 = v43;
        LODWORD(v50[0]) = v43 & 1;
        sub_233147D88();
        v32 = v37;
        _os_log_impl(&dword_233121000, v37, (os_log_type_t)v39, "API: setOrientationR: %{public}f, %{public}f, %{public}f dur %{public}s, rel: %{BOOL,public}d", (uint8_t *)v27, 0x30u);
        v33 = v40;
        swift_arrayDestroy();
        MEMORY[0x234930B44](v33, -1, -1);
        MEMORY[0x234930B44](v27, -1, -1);

        (*(void (**)(char *, uint64_t))(v41 + 8))(v11, v38);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v8);
        v28 = v46;
        v31 = v43;
      }
      return sub_2331302A8(v13, v28, v31 & 1);
    }
    else
    {
      result = (id)sub_233147DF4();
      __break(1u);
    }
  }
  else
  {
    sub_233127120();
    swift_allocError();
    *v34 = 1;
    return (id)swift_willThrow();
  }
  return result;
}

uint64_t sub_233130DB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  *(_QWORD *)(v8 + 72) = a7;
  *(_QWORD *)(v8 + 80) = v12;
  *(_BYTE *)(v8 + 168) = a8;
  *(_QWORD *)(v8 + 56) = a5;
  *(_QWORD *)(v8 + 64) = a6;
  *(_QWORD *)(v8 + 48) = a4;
  v9 = sub_233147BB4();
  *(_QWORD *)(v8 + 88) = v9;
  *(_QWORD *)(v8 + 96) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 104) = swift_task_alloc();
  v10 = sub_233147920();
  *(_QWORD *)(v8 + 112) = v10;
  *(_QWORD *)(v8 + 120) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 128) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233130E50()
{
  uint64_t v0;
  uint64_t v1;
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v1 = *(_QWORD *)(v0 + 64);
  sub_233147EF0();
  sub_233147EF0();
  v2 = (id *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v2 && (v3 = *v2, v4 = sub_23314783C(), *(_QWORD *)(v0 + 136) = v4, v3, v4))
  {
    v6 = *(_QWORD *)(v0 + 120);
    v5 = *(_QWORD *)(v0 + 128);
    v7 = *(_QWORD *)(v0 + 112);
    v8 = *(_QWORD *)(v0 + 80);
    v9 = *(_QWORD *)(v0 + 64);
    v10 = swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v10;
    *(_QWORD *)(v10 + 16) = v9;
    *(_QWORD *)(v10 + 24) = v8;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v5, *MEMORY[0x24BE2DA20], v7);
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v11;
    *v11 = v0;
    v11[1] = sub_233130FD0;
    return sub_23314798C();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_233130FD0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*v1 + 128);
  v3 = *(void **)(*v1 + 136);
  v4 = *(_QWORD *)(*v1 + 112);
  v5 = *(_QWORD *)(*v1 + 120);
  v6 = *v1;
  *(_QWORD *)(v6 + 160) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);

  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_23313108C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint8_t *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v1 = *(void **)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = *(_QWORD *)(v0 + 64);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_233147B9C();
  v9 = sub_233147D40();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(void **)(v0 + 160);
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v11 = 138412290;
    v13 = v10;
    v14 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v14;
    sub_233147D88();
    *v12 = v14;

    _os_log_impl(&dword_233121000, v8, v9, "Caught %@ while setting orientation, canceling progress", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v12, -1, -1);
    MEMORY[0x234930B44](v11, -1, -1);
  }
  else
  {
    v15 = *(void **)(v0 + 160);

  }
  v16 = *(void **)(v0 + 160);
  v18 = *(_QWORD *)(v0 + 96);
  v17 = *(_QWORD *)(v0 + 104);
  v20 = *(void **)(v0 + 80);
  v19 = *(_QWORD *)(v0 + 88);

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  objc_msgSend(v20, sel_cancel);

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DockAccessory.setOrientation(_:duration:relative:)(uint64_t a1, uint64_t a2, char a3, double a4, double a5, double a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v7 + 104) = a2;
  *(_QWORD *)(v7 + 112) = v6;
  *(_BYTE *)(v7 + 156) = a3;
  *(_QWORD *)(v7 + 96) = a1;
  *(double *)(v7 + 80) = a5;
  *(double *)(v7 + 88) = a6;
  *(double *)(v7 + 72) = a4;
  v8 = sub_233147BB4();
  *(_QWORD *)(v7 + 120) = v8;
  *(_QWORD *)(v7 + 128) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 136) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2331312E4()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  os_unfair_lock_s *v16;
  char v17;
  os_unfair_lock_s *v18;
  _QWORD *v19;
  _BYTE *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 128) + 16))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 112) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(_QWORD *)(v0 + 120));
  v1 = sub_233147B9C();
  v2 = sub_233147D34();
  if (os_log_type_enabled(v1, v2))
  {
    v24 = *(_QWORD *)(v0 + 120);
    v25 = *(_QWORD *)(v0 + 136);
    v23 = *(_QWORD *)(v0 + 128);
    v22 = *(unsigned __int8 *)(v0 + 156);
    v4 = *(_QWORD *)(v0 + 80);
    v3 = *(_QWORD *)(v0 + 88);
    v5 = *(_QWORD *)(v0 + 72);
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    v26 = v7;
    *(_DWORD *)v6 = 134350082;
    *(_QWORD *)(v0 + 40) = v5;
    sub_233147D88();
    *(_WORD *)(v6 + 12) = 2050;
    *(_QWORD *)(v0 + 48) = v4;
    sub_233147D88();
    *(_WORD *)(v6 + 22) = 2050;
    *(_QWORD *)(v0 + 56) = v3;
    sub_233147D88();
    *(_WORD *)(v6 + 32) = 2082;
    v8 = sub_233147EFC();
    *(_QWORD *)(v0 + 64) = sub_23313FD70(v8, v9, &v26);
    sub_233147D88();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 42) = 1026;
    *(_DWORD *)(v0 + 152) = v22;
    sub_233147D88();
    _os_log_impl(&dword_233121000, v1, v2, "API: setOrientation: %{public}f, %{public}f, %{public}f dur %{public}s, rel: %{BOOL,public}d", (uint8_t *)v6, 0x30u);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v7, -1, -1);
    MEMORY[0x234930B44](v6, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v24);
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 128);
    v10 = *(_QWORD *)(v0 + 136);
    v12 = *(_QWORD *)(v0 + 120);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  v13 = (_QWORD *)(*(_QWORD *)(v0 + 112) + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v13)
  {
    if (qword_2560389A0 != -1)
      swift_once();
    v14 = qword_2560389A8;
    v15 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
    v16 = *(os_unfair_lock_s **)(qword_2560389A8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
    swift_retain();
    os_unfair_lock_lock(v16 + 4);
    swift_release();
    v17 = *(_BYTE *)(v14 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
    v18 = *(os_unfair_lock_s **)(v14 + v15);
    swift_retain();
    os_unfair_lock_unlock(v18 + 4);
    swift_release();
    if ((v17 & 1) != 0)
    {
      v19 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 144) = v19;
      *v19 = v0;
      v19[1] = sub_2331316FC;
      return sub_23313175C(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), *(_BYTE *)(v0 + 156), *(double *)(v0 + 72), *(double *)(v0 + 80), *(double *)(v0 + 88));
    }
    else
    {
      return sub_233147DF4();
    }
  }
  else
  {
    sub_233127120();
    swift_allocError();
    *v21 = 1;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2331316FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  swift_task_dealloc();
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_23313175C(uint64_t a1, uint64_t a2, char a3, double a4, double a5, double a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v7 + 80) = a2;
  *(_QWORD *)(v7 + 88) = v6;
  *(_BYTE *)(v7 + 208) = a3;
  *(_QWORD *)(v7 + 72) = a1;
  *(double *)(v7 + 56) = a5;
  *(double *)(v7 + 64) = a6;
  *(double *)(v7 + 48) = a4;
  v8 = sub_233147920();
  *(_QWORD *)(v7 + 96) = v8;
  *(_QWORD *)(v7 + 104) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 112) = swift_task_alloc();
  v9 = sub_233147BB4();
  *(_QWORD *)(v7 + 120) = v9;
  *(_QWORD *)(v7 + 128) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v7 + 136) = swift_task_alloc();
  *(_QWORD *)(v7 + 144) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233131804()
{
  uint64_t v0;
  id *v1;
  id v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  os_unfair_lock_s *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = (id *)(*(_QWORD *)(v0 + 88) + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v1 && (v2 = *v1, v3 = sub_233147848(), v2, (v3 & 1) != 0))
  {
    v4 = *(_QWORD *)(v0 + 88);
    v5 = OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgressLock;
    *(_QWORD *)(v0 + 152) = OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgressLock;
    v6 = *(os_unfair_lock_s **)(v4 + v5);
    v7 = swift_task_alloc();
    *(_QWORD *)(v7 + 16) = sub_233146960;
    *(_QWORD *)(v7 + 24) = v4;
    swift_retain();
    os_unfair_lock_lock(v6 + 4);
    sub_233126DEC(v8, *(uint64_t (**)(void))(v7 + 16));
    os_unfair_lock_unlock(v6 + 4);
    swift_release();
    swift_task_dealloc();
    if (*v1)
    {
      v9 = *v1;
      sub_233147818();

    }
    *(_QWORD *)(v0 + 160) = objc_msgSend(objc_allocWithZone((Class)sub_2331477AC()), sel_init);
    sub_233147788();
    sub_2331477A0();
    sub_233147794();
    v10 = objc_msgSend((id)objc_opt_self(), sel_progressWithTotalUnitCount_, 1);
    *(_QWORD *)(v0 + 168) = v10;
    sub_233147EF0();
    sub_233147EF0();
    if (*v1 && (v11 = *v1, v12 = sub_23314783C(), *(_QWORD *)(v0 + 176) = v12, v11, v12))
    {
      v14 = *(_QWORD *)(v0 + 104);
      v13 = *(_QWORD *)(v0 + 112);
      v16 = *(_QWORD *)(v0 + 88);
      v15 = *(_QWORD *)(v0 + 96);
      v17 = swift_task_alloc();
      *(_QWORD *)(v0 + 184) = v17;
      *(_QWORD *)(v17 + 16) = v16;
      *(_QWORD *)(v17 + 24) = v10;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 104))(v13, *MEMORY[0x24BE2DA20], v15);
      v18 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 192) = v18;
      *v18 = v0;
      v18[1] = sub_233131C80;
      return sub_23314798C();
    }
    else
    {
      v27 = *(_QWORD *)(v0 + 168);
      v28 = *(_QWORD *)(v0 + 88);
      v29 = *(os_unfair_lock_s **)(v28 + *(_QWORD *)(v0 + 152));
      v30 = swift_task_alloc();
      *(_QWORD *)(v30 + 16) = v28;
      *(_QWORD *)(v30 + 24) = v27;
      v31 = swift_task_alloc();
      *(_QWORD *)(v31 + 16) = sub_233146978;
      *(_QWORD *)(v31 + 24) = v30;
      swift_retain();
      os_unfair_lock_lock(v29 + 4);
      sub_233126DEC(v32, *(uint64_t (**)(void))(v31 + 16));
      os_unfair_lock_unlock(v29 + 4);

      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 168));
    }
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 128) + 16))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 88) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(_QWORD *)(v0 + 120));
    v20 = sub_233147B9C();
    v21 = sub_233147D4C();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_233121000, v20, v21, "Tracking button off, motors disabled", v22, 2u);
      MEMORY[0x234930B44](v22, -1, -1);
    }
    v23 = *(_QWORD *)(v0 + 144);
    v24 = *(_QWORD *)(v0 + 120);
    v25 = *(_QWORD *)(v0 + 128);

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
    sub_233127120();
    swift_allocError();
    *v26 = 2;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_233131C80()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    v3 = (void *)v2[22];
    (*(void (**)(_QWORD, _QWORD))(v2[13] + 8))(v2[14], v2[12]);

  }
  else
  {
    v4 = (void *)v2[22];
    (*(void (**)(_QWORD, _QWORD))(v2[13] + 8))(v2[14], v2[12]);

    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_233131D24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 88);
  v4 = *(os_unfair_lock_s **)(v3 + *(_QWORD *)(v0 + 152));
  v5 = swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v3;
  *(_QWORD *)(v5 + 24) = v2;
  v6 = swift_task_alloc();
  *(_QWORD *)(v6 + 16) = sub_233146978;
  *(_QWORD *)(v6 + 24) = v5;
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  sub_233126DEC(v7, *(uint64_t (**)(void))(v6 + 16));
  os_unfair_lock_unlock(v4 + 4);
  if (v1)
    return swift_task_dealloc();

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 168));
}

uint64_t sub_233131E30()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint8_t *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;

  v1 = *(void **)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 120);
  v5 = *(_QWORD *)(v0 + 88);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_233147B9C();
  v9 = sub_233147D4C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(void **)(v0 + 200);
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v11 = 138412290;
    v13 = v10;
    v14 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v14;
    sub_233147D88();
    *v12 = v14;

    _os_log_impl(&dword_233121000, v8, v9, "caught err %@, returning public", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v12, -1, -1);
    MEMORY[0x234930B44](v11, -1, -1);
  }
  else
  {
    v15 = *(void **)(v0 + 200);

  }
  v16 = *(NSObject **)(v0 + 200);
  v18 = *(void **)(v0 + 160);
  v17 = *(void **)(v0 + 168);
  v20 = *(_QWORD *)(v0 + 128);
  v19 = *(_QWORD *)(v0 + 136);
  v21 = *(_QWORD *)(v0 + 120);

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  sub_233127120();
  swift_allocError();
  sub_23312411C(v16, v22);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DockAccessory.setOrientation(_:duration:relative:)(unint64_t a1, unint64_t a2, unsigned __int8 a3, __n128 a4, __n128 a5)
{
  unint64_t v5;
  __n128 *v6;
  uint64_t v7;

  v6[7].n128_u64[0] = a2;
  v6[7].n128_u64[1] = v5;
  v6[10].n128_u8[4] = a3;
  v6[6].n128_u64[1] = a1;
  v6[1] = a4;
  v6[2] = a5;
  v7 = sub_233147BB4();
  v6[8].n128_u64[0] = v7;
  v6[8].n128_u64[1] = *(_QWORD *)(v7 - 8);
  v6[9].n128_u64[0] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2331320C4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  char v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  _QWORD *v29;
  int v30;
  uint64_t v31;
  __int128 v32;
  double v33;
  SPRotation3D v34;
  __int128 v35;
  double v36;
  double v37;
  double v38;
  SPRotation3D v39;

  v1 = (_QWORD *)(*(_QWORD *)(v0 + 120) + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v1)
  {
    if (qword_2560389A0 != -1)
      swift_once();
    v2 = qword_2560389A8;
    v3 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
    v4 = *(os_unfair_lock_s **)(qword_2560389A8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
    swift_retain();
    os_unfair_lock_lock(v4 + 4);
    swift_release();
    v5 = *(_BYTE *)(v2 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
    v6 = *(os_unfair_lock_s **)(v2 + v3);
    swift_retain();
    os_unfair_lock_unlock(v6 + 4);
    swift_release();
    if ((v5 & 1) != 0)
    {
      v8 = *(_QWORD *)(v0 + 136);
      v7 = *(_QWORD *)(v0 + 144);
      v10 = *(_QWORD *)(v0 + 120);
      v9 = *(_QWORD *)(v0 + 128);
      v32 = *(_OWORD *)(v0 + 16);
      *(_OWORD *)v34.vector.f64 = *(_OWORD *)(v0 + 32);
      v11 = sub_233147D58();
      *(_OWORD *)&v39.quaternion.vector.f64[2] = v32;
      *(_OWORD *)v39.vector.f64 = *(_OWORD *)v34.vector.f64;
      *(_OWORD *)&v34.quaternion.vector.f64[2] = v32;
      v35 = *(_OWORD *)v34.vector.f64;
      SPRotation3DGetEulerAngles(v39, (uint64_t)&v34.vector.f64[2], v11, (uint64_t)&v36);
      SPVector3DMake(v36, v37, v38, &v36);
      v12 = v36;
      v13 = v37;
      v14 = v38;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v10 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v9);
      v15 = sub_233147B9C();
      v16 = sub_233147D34();
      v17 = os_log_type_enabled(v15, v16);
      v19 = *(_QWORD *)(v0 + 136);
      v18 = *(_QWORD *)(v0 + 144);
      v20 = *(_QWORD *)(v0 + 128);
      if (v17)
      {
        v31 = *(_QWORD *)(v0 + 128);
        v30 = *(unsigned __int8 *)(v0 + 164);
        v34.vector.f64[0] = v12;
        v21 = swift_slowAlloc();
        v33 = v13;
        *(double *)&v22 = COERCE_DOUBLE(swift_slowAlloc());
        v36 = *(double *)&v22;
        *(_DWORD *)v21 = 134350082;
        *(double *)(v0 + 72) = v34.vector.f64[0];
        sub_233147D88();
        *(_WORD *)(v21 + 12) = 2050;
        *(double *)(v0 + 80) = v33;
        sub_233147D88();
        *(_WORD *)(v21 + 22) = 2050;
        *(double *)(v0 + 88) = v14;
        sub_233147D88();
        *(_WORD *)(v21 + 32) = 2082;
        v23 = sub_233147EFC();
        *(_QWORD *)(v0 + 96) = sub_23313FD70(v23, v24, (uint64_t *)&v36);
        sub_233147D88();
        swift_bridgeObjectRelease();
        *(_WORD *)(v21 + 42) = 1026;
        *(_DWORD *)(v0 + 160) = v30;
        sub_233147D88();
        _os_log_impl(&dword_233121000, v15, v16, "API: setOrientationR: %{public}f, %{public}f, %{public}f dur %{public}s, rel: %{BOOL,public}d", (uint8_t *)v21, 0x30u);
        swift_arrayDestroy();
        v25 = v22;
        v13 = v33;
        MEMORY[0x234930B44](v25, -1, -1);
        v26 = v21;
        v12 = v34.vector.f64[0];
        MEMORY[0x234930B44](v26, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v31);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
      }
      v29 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 152) = v29;
      *v29 = v0;
      v29[1] = sub_233132510;
      return sub_23313175C(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112), *(_BYTE *)(v0 + 164), v12, v13, v14);
    }
    else
    {
      return sub_233147DF4();
    }
  }
  else
  {
    sub_233127120();
    swift_allocError();
    *v27 = 1;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_233132510(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  swift_task_dealloc();
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_233132570(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  double v13;
  double v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _BYTE *v18;
  uint64_t result;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  char *v25;

  v2 = sub_233147BB4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v25 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - v6;
  v8 = sub_233147650();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1 + OBJC_IVAR____TtC7DockKit13DockAccessory__lastOrientationCommandTime;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  sub_23314762C();
  v14 = v13;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (fabs(v14) >= 1.0 / *(double *)(a1 + OBJC_IVAR____TtC7DockKit13DockAccessory__maxPositionFrequency))
  {
    sub_233147644();
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v12, v11, v8);
    swift_endAccess();
    v20 = OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgress;
    result = *(_QWORD *)(a1 + OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgress);
    if (result)
    {
      result = (uint64_t)objc_msgSend((id)result, sel_isCancelled);
      if ((result & 1) == 0)
      {
        result = *(_QWORD *)(a1 + v20);
        if (result)
        {
          result = (uint64_t)objc_msgSend((id)result, sel_isFinished);
          if ((result & 1) == 0)
          {
            (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v25, a1 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v2);
            v21 = sub_233147B9C();
            v22 = sub_233147D4C();
            if (os_log_type_enabled(v21, v22))
            {
              v23 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v23 = 0;
              _os_log_impl(&dword_233121000, v21, v22, "Orientation in progress, cancelling", v23, 2u);
              MEMORY[0x234930B44](v23, -1, -1);
            }

            (*(void (**)(char *, uint64_t))(v3 + 8))(v25, v2);
            result = *(_QWORD *)(a1 + v20);
            if (result)
              return (uint64_t)objc_msgSend((id)result, sel_cancel);
          }
        }
        else
        {
          __break(1u);
        }
      }
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v7, a1 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v2);
    v15 = sub_233147B9C();
    v16 = sub_233147D34();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_233121000, v15, v16, "rate limiting set orientation API", v17, 2u);
      MEMORY[0x234930B44](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
    sub_233127120();
    swift_allocError();
    *v18 = 7;
    return swift_willThrow();
  }
  return result;
}

char *sub_2331328B4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *result;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  id v41;

  v41 = a3;
  v40 = sub_233147BB4();
  v4 = *(_QWORD *)(v40 - 8);
  v5 = MEMORY[0x24BDAC7A8](v40);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v40 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v40 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v40 - v14;
  v16 = sub_2331478E4();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_233147980();
  result = (char *)(*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v19, v16);
  if ((_DWORD)result == *MEMORY[0x24BE2D9D8])
    return result;
  if ((_DWORD)result == *MEMORY[0x24BE2D9F0])
  {
    v21 = v40;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v13, a2 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v40);
    v22 = sub_233147B9C();
    v23 = sub_233147D4C();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_233121000, v22, v23, "completed: increase completed unit count", v24, 2u);
      MEMORY[0x234930B44](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v13, v21);
    v25 = v41;
    result = (char *)objc_msgSend(v41, sel_completedUnitCount);
    if (!__OFADD__(result, 1))
      return (char *)objc_msgSend(v25, sel_setCompletedUnitCount_, result + 1);
    __break(1u);
    return result;
  }
  if ((_DWORD)result == *MEMORY[0x24BE2D9E8])
  {
    v26 = v40;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v15, a2 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v40);
    v27 = sub_233147B9C();
    v28 = sub_233147D4C();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_233121000, v27, v28, "canceled: canceling progress", v29, 2u);
      MEMORY[0x234930B44](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v15, v26);
    return (char *)objc_msgSend(v41, sel_cancel);
  }
  v30 = a2 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  if ((_DWORD)result == *MEMORY[0x24BE2D9E0])
  {
    v32 = v40;
    v31(v10, v30, v40);
    v33 = sub_233147B9C();
    v34 = sub_233147D4C();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_233121000, v33, v34, "failed: canceling progress", v35, 2u);
      MEMORY[0x234930B44](v35, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v32);
    return (char *)objc_msgSend(v41, sel_cancel);
  }
  v36 = v40;
  v31(v7, v30, v40);
  v37 = sub_233147B9C();
  v38 = sub_233147D4C();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v39 = 0;
    _os_log_impl(&dword_233121000, v37, v38, "default: canceling progress", v39, 2u);
    MEMORY[0x234930B44](v39, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v36);
  objc_msgSend(v41, sel_cancel);
  return (char *)(*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t DockAccessory.setAngularVelocity(_:)(double a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 96) = v3;
  *(double *)(v4 + 80) = a2;
  *(double *)(v4 + 88) = a3;
  *(double *)(v4 + 72) = a1;
  v5 = sub_233147BB4();
  *(_QWORD *)(v4 + 104) = v5;
  *(_QWORD *)(v4 + 112) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 120) = swift_task_alloc();
  *(_QWORD *)(v4 + 128) = swift_task_alloc();
  *(_QWORD *)(v4 + 136) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233132D88()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  id *v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  os_unfair_lock_s *v24;
  char v25;
  os_unfair_lock_s *v26;
  id v27;
  id v28;
  uint64_t v29;
  _QWORD *v30;
  char v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t (*v39)(void);
  uint64_t v40;

  v1 = v0[17];
  v2 = v0[13];
  v3 = v0[14];
  v4 = v0[12];
  v5 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  v0[18] = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  v6 = v4 + v5;
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[19] = v7;
  v7(v1, v4 + v5, v2);
  v8 = sub_233147B9C();
  v9 = sub_233147D34();
  if (os_log_type_enabled(v8, v9))
  {
    v11 = v0[10];
    v10 = v0[11];
    v12 = v0[9];
    v40 = v6;
    v13 = swift_slowAlloc();
    v0[6] = v12;
    *(_DWORD *)v13 = 134349568;
    sub_233147D88();
    *(_WORD *)(v13 + 12) = 2050;
    v0[7] = v11;
    sub_233147D88();
    *(_WORD *)(v13 + 22) = 2050;
    v0[8] = v10;
    sub_233147D88();
    _os_log_impl(&dword_233121000, v8, v9, "API: setAngularVelocity: %{public}f, %{public}f, %{public}f", (uint8_t *)v13, 0x20u);
    v14 = v13;
    v6 = v40;
    MEMORY[0x234930B44](v14, -1, -1);
  }

  v15 = v0[17];
  v16 = v0[13];
  v17 = v0[12];
  v18 = *(void (**)(uint64_t, uint64_t))(v0[14] + 8);
  v0[20] = v18;
  v18(v15, v16);
  v19 = (id *)(v17 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (!*v19)
  {
    v32 = 1;
LABEL_16:
    sub_233127120();
    swift_allocError();
    *v38 = v32;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v39 = (uint64_t (*)(void))v0[1];
    return v39();
  }
  v20 = *v19;
  v21 = sub_233147848();

  if ((v21 & 1) == 0)
  {
    v7(v0[16], v6, v0[13]);
    v33 = sub_233147B9C();
    v34 = sub_233147D4C();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_233121000, v33, v34, "Tracking button off, motors disabled", v35, 2u);
      MEMORY[0x234930B44](v35, -1, -1);
    }
    v36 = v0[16];
    v37 = v0[13];

    v18(v36, v37);
    v32 = 2;
    goto LABEL_16;
  }
  if (qword_2560389A0 != -1)
    swift_once();
  v22 = qword_2560389A8;
  v23 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  v24 = *(os_unfair_lock_s **)(qword_2560389A8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v24 + 4);
  swift_release();
  v25 = *(_BYTE *)(v22 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  v26 = *(os_unfair_lock_s **)(v22 + v23);
  swift_retain();
  os_unfair_lock_unlock(v26 + 4);
  swift_release();
  if ((v25 & 1) != 0)
  {
    if (*v19)
    {
      v27 = *v19;
      sub_233147818();

      if (*v19)
      {
        v28 = *v19;
        v29 = sub_23314783C();
        v0[21] = v29;

        if (v29)
        {
          v30 = (_QWORD *)swift_task_alloc();
          v0[22] = v30;
          *v30 = v0;
          v30[1] = sub_2331331FC;
          return sub_2331479C8();
        }
      }
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v39 = (uint64_t (*)(void))v0[1];
    return v39();
  }
  return sub_233147DF4();
}

uint64_t sub_2331331FC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 184) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_233133290()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  char *v21;

  v1 = *(void **)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 144);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 152);
  v4 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 104);

  v2(v4, v6 + v3, v5);
  v7 = v1;
  v8 = v1;
  v9 = sub_233147B9C();
  v10 = sub_233147D4C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(void **)(v0 + 184);
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138412290;
    v14 = v11;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v15;
    sub_233147D88();
    *v13 = v15;

    _os_log_impl(&dword_233121000, v9, v10, "caught err %@, returning public", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v13, -1, -1);
    MEMORY[0x234930B44](v12, -1, -1);
  }
  else
  {
    v16 = *(void **)(v0 + 184);

  }
  v17 = *(NSObject **)(v0 + 184);
  v18 = *(void (**)(uint64_t, uint64_t))(v0 + 160);
  v19 = *(_QWORD *)(v0 + 120);
  v20 = *(_QWORD *)(v0 + 104);

  v18(v19, v20);
  sub_233127120();
  swift_allocError();
  sub_23312411C(v17, v21);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DockAccessory.setLimits(_:)(uint64_t a1)
{
  uint64_t v1;
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  os_unfair_lock_s *v30;
  char v31;
  os_unfair_lock_s *v32;
  void (*v33)(char *, uint64_t, uint64_t);
  NSObject *v34;
  uint64_t v35;
  os_log_type_t v36;
  _BOOL4 v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void **v55;
  void *v56;
  id v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  _QWORD *v65;
  NSObject *v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  char *v69;
  uint64_t result;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  void (*v75)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(char *, uint64_t, uint64_t);
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  int v93;
  char *v94;
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  uint64_t v102;

  v3 = sub_233147BB4();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v97 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v71 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038EC0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v73 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v74 = (char *)&v71 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v77 = (char *)&v71 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v71 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v71 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v71 - v22;
  v24 = *(_QWORD *)a1;
  v89 = *(_QWORD *)(a1 + 8);
  v90 = v24;
  v88 = *(_QWORD *)(a1 + 16);
  LODWORD(v96) = *(unsigned __int8 *)(a1 + 24);
  v25 = *(_QWORD *)(a1 + 40);
  v84 = *(_QWORD *)(a1 + 32);
  v85 = v25;
  v86 = *(_QWORD *)(a1 + 48);
  v93 = *(unsigned __int8 *)(a1 + 56);
  v80 = *(_QWORD *)(a1 + 64);
  v79 = *(_QWORD *)(a1 + 72);
  v78 = *(_QWORD *)(a1 + 80);
  v87 = *(unsigned __int8 *)(a1 + 88);
  v26 = sub_2331477F4();
  v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56);
  v95 = v23;
  v27(v23, 1, 1, v26);
  v27(v21, 1, 1, v26);
  v94 = v18;
  v76 = v26;
  v75 = v27;
  v27(v18, 1, 1, v26);
  if (qword_2560389A0 != -1)
    swift_once();
  v28 = qword_2560389A8;
  v29 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  v30 = *(os_unfair_lock_s **)(qword_2560389A8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v30 + 4);
  swift_release();
  v31 = *(_BYTE *)(v28 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  v32 = *(os_unfair_lock_s **)(v28 + v29);
  swift_retain();
  os_unfair_lock_unlock(v32 + 4);
  swift_release();
  if ((v31 & 1) == 0)
  {
    result = sub_233147DF4();
    __break(1u);
    return result;
  }
  v91 = v1;
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v81 = v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  v82 = v33;
  ((void (*)(char *))v33)(v8);
  v34 = sub_233147B9C();
  v35 = v4;
  v36 = sub_233147D34();
  v37 = os_log_type_enabled(v34, v36);
  v38 = v96;
  if (v37)
  {
    v39 = swift_slowAlloc();
    v71 = swift_slowAlloc();
    v102 = v71;
    *(_DWORD *)v39 = 136446722;
    v83 = v21;
    v98 = v90;
    v99 = v89;
    v100 = v88;
    v101 = v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256038EC8);
    v72 = v35;
    v40 = sub_233147BFC();
    v98 = sub_23313FD70(v40, v41, &v102);
    sub_233147D88();
    swift_bridgeObjectRelease();
    *(_WORD *)(v39 + 12) = 2082;
    v98 = v84;
    v99 = v85;
    v100 = v86;
    v101 = v93;
    v42 = sub_233147BFC();
    v98 = sub_23313FD70(v42, v43, &v102);
    sub_233147D88();
    swift_bridgeObjectRelease();
    *(_WORD *)(v39 + 22) = 2082;
    v98 = v80;
    v99 = v79;
    v100 = v78;
    v101 = v87;
    v44 = sub_233147BFC();
    v98 = sub_23313FD70(v44, v45, &v102);
    v38 = v96;
    v21 = v83;
    sub_233147D88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_233121000, v34, v36, "API: setLimits: %{public}s, %{public}s, %{public}s", (uint8_t *)v39, 0x20u);
    v46 = v71;
    swift_arrayDestroy();
    MEMORY[0x234930B44](v46, -1, -1);
    MEMORY[0x234930B44](v39, -1, -1);

    v47 = *(void (**)(char *, uint64_t))(v72 + 8);
  }
  else
  {

    v47 = *(void (**)(char *, uint64_t))(v35 + 8);
  }
  v47(v8, v3);
  v49 = v91;
  v48 = v92;
  if ((v38 & 1) == 0)
  {
    sub_233147B3C();
    sub_233147B18();
    v50 = (uint64_t)v77;
    sub_2331477D0();
    if (v48)
      goto LABEL_20;
    v51 = (uint64_t)v95;
    sub_233129970((uint64_t)v95, &qword_256038EC0);
    v75((char *)v50, 0, 1, v76);
    sub_233141A14(v50, v51, &qword_256038EC0);
  }
  if ((v93 & 1) == 0)
  {
    sub_233147B3C();
    sub_233147B30();
    v52 = (uint64_t)v74;
    sub_2331477D0();
    if (v48)
      goto LABEL_20;
    sub_233129970((uint64_t)v21, &qword_256038EC0);
    v75((char *)v52, 0, 1, v76);
    sub_233141A14(v52, (uint64_t)v21, &qword_256038EC0);
  }
  if ((v87 & 1) == 0)
  {
    sub_233147B3C();
    sub_233147B24();
    v53 = (uint64_t)v73;
    sub_2331477D0();
    if (!v48)
    {
      v54 = (uint64_t)v94;
      sub_233129970((uint64_t)v94, &qword_256038EC0);
      v75((char *)v53, 0, 1, v76);
      sub_233141A14(v53, v54, &qword_256038EC0);
      goto LABEL_16;
    }
LABEL_20:
    v59 = v48;
    v82(v97, v81, v3);
    v60 = v48;
    v61 = v48;
    v62 = sub_233147B9C();
    v63 = sub_233147D4C();
    if (os_log_type_enabled(v62, v63))
    {
      v96 = v3;
      v64 = (uint8_t *)swift_slowAlloc();
      v65 = (_QWORD *)swift_slowAlloc();
      v83 = v21;
      *(_DWORD *)v64 = 138412290;
      v66 = v59;
      v67 = v47;
      v68 = _swift_stdlib_bridgeErrorToNSError();
      v98 = v68;
      v3 = v96;
      v21 = v83;
      sub_233147D88();
      *v65 = v68;
      v47 = v67;

      _os_log_impl(&dword_233121000, v62, v63, "Caught err %@ and returning public", v64, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
      swift_arrayDestroy();
      MEMORY[0x234930B44](v65, -1, -1);
      MEMORY[0x234930B44](v64, -1, -1);
    }
    else
    {

    }
    v47(v97, v3);
    sub_233127120();
    swift_allocError();
    sub_23312411C(v59, v69);
    swift_willThrow();

    goto LABEL_24;
  }
LABEL_16:
  v55 = (void **)(v49 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  v56 = *v55;
  if (v56)
  {
    swift_endAccess();
    v57 = v56;
    v58 = (void *)sub_23314783C();

    if (v58)
    {
      sub_2331479A4();
      if (v48)
      {

        goto LABEL_20;
      }

    }
LABEL_24:
    sub_233129970((uint64_t)v94, &qword_256038EC0);
    sub_233129970((uint64_t)v21, &qword_256038EC0);
    return sub_233129970((uint64_t)v95, &qword_256038EC0);
  }
  sub_233129970((uint64_t)v94, &qword_256038EC0);
  sub_233129970((uint64_t)v21, &qword_256038EC0);
  sub_233129970((uint64_t)v95, &qword_256038EC0);
  return swift_endAccess();
}

void sub_233133E48(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, void (*a5)(uint64_t, uint64_t), void (*a6)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v11 = OBJC_IVAR____TtC7DockKit13DockAccessory_helper;
  if (*(_QWORD *)(v6 + OBJC_IVAR____TtC7DockKit13DockAccessory_helper)
    || (v12 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DockAccessoryHelper(0)), sel_init),
        v13 = *(void **)(v6 + v11),
        *(_QWORD *)(v6 + v11) = v12,
        v13,
        *(_QWORD *)(v6 + v11)))
  {
    swift_unknownObjectWeakAssign();
    v14 = *(_QWORD *)(v6 + v11);
    if (v14)
    {
      v15 = (uint64_t *)(v14 + *a4);
      v16 = *v15;
      v17 = v15[1];
      *v15 = a2;
      v15[1] = a3;
      a5(a2, a3);
      a6(v16, v17);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_233133F38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[5] = a4;
  v5 = sub_233147BB4();
  v4[6] = v5;
  v4[7] = *(_QWORD *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233133F98()
{
  _QWORD *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  void *v9;
  _QWORD *v10;
  uint64_t (*v11)(void);
  uint64_t (*v13)(void);

  (*(void (**)(_QWORD, uint64_t, _QWORD))(v0[7] + 16))(v0[8], v0[5] + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v0[6]);
  v1 = sub_233147B9C();
  v2 = sub_233147D4C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_233121000, v1, v2, "Stopping event feedback", v3, 2u);
    MEMORY[0x234930B44](v3, -1, -1);
  }
  v5 = v0[7];
  v4 = v0[8];
  v7 = v0[5];
  v6 = v0[6];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v8 = (void **)(v7 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  v9 = *v8;
  v0[9] = *v8;
  if (v9)
  {
    v13 = (uint64_t (*)(void))((int)*MEMORY[0x24BE2D850] + MEMORY[0x24BE2D850]);
    v9;
    v10 = (_QWORD *)swift_task_alloc();
    v0[10] = v10;
    *v10 = v0;
    v10[1] = sub_233134100;
    v11 = v13;
  }
  else
  {
    swift_task_dealloc();
    v11 = (uint64_t (*)(void))v0[1];
  }
  return v11();
}

uint64_t sub_233134100()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23313417C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2331341B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[5] = a4;
  v5[6] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039DB0);
  v5[7] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[8] = v7;
  v5[9] = *(_QWORD *)(v7 + 64);
  v5[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233134220()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD *v14;
  void *v16;
  _BYTE *v17;
  uint64_t (*v18)(id);

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 48);
  v6 = (void **)(v4 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  v7 = *v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v9 + v8, v1, v2);
  v10 = v7;
  sub_233133E48((uint64_t)v7, (uint64_t)sub_233147480, v9, &OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_eventCallback, (void (*)(uint64_t, uint64_t))sub_233147598, (void (*)(uint64_t, uint64_t))sub_233147594);

  swift_release();
  v11 = *(void **)(v4 + OBJC_IVAR____TtC7DockKit13DockAccessory_helper);
  *(_QWORD *)(v0 + 88) = v11;
  if (v11)
  {
    v12 = *v6;
    *(_QWORD *)(v0 + 96) = *v6;
    if (v12)
    {
      v18 = (uint64_t (*)(id))((int)*MEMORY[0x24BE2D858] + MEMORY[0x24BE2D858]);
      v12;
      v13 = v11;
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v14;
      *v14 = v0;
      v14[1] = sub_2331343FC;
      return v18(v13);
    }
  }
  else
  {
    sub_233127120();
    v16 = (void *)swift_allocError();
    *v17 = 2;
    swift_willThrow();
    sub_233147CF8();

  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2331343FC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 112) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v4 = *(void **)(v2 + 96);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23313447C()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 96);

  v2 = *(void **)(v0 + 112);
  sub_233147CF8();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2331344CC(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  BOOL v18;
  char v19;
  unsigned __int16 v20;
  id v21;
  int v22;
  int v23;
  double v24;
  char v25;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039DC8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256039DB0);
    sub_233147CF8();
    return;
  }
  v11 = a1;
  v12 = sub_233147A1C();
  v13 = sub_233147A10();
  v14 = *(_QWORD *)(v13 + 16);
  if (v14)
  {
    v21 = v11;
    v22 = a3;
    sub_233147A34();
    v23 = v12;
    v15 = 0;
    do
    {
      v16 = a4;
      v17 = *(double *)(v13 + 8 * v15++ + 32);
      v18 = v23 == sub_2331479E0();
      v24 = v17;
      a4 = v16;
      v25 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256039DB0);
      sub_233147CEC();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
    while (v14 != v15);
    swift_bridgeObjectRelease();
    v11 = v21;
    LOBYTE(a3) = v22;
    LOBYTE(v12) = v23;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_233147A34();
  if (sub_233147A04() == v12)
  {
    v24 = 0.0;
    v19 = 0x80;
LABEL_15:
    v25 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256039DB0);
    sub_233147CEC();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    goto LABEL_16;
  }
  if (sub_2331479EC() == v12)
  {
    *(_QWORD *)&v24 = 1;
    v19 = 0x80;
    goto LABEL_15;
  }
  if (sub_2331479F8() == v12)
  {
    v20 = sub_233147A28();
    if ((v20 & 0x8000) != 0)
    {
      __break(1u);
      return;
    }
    v24 = (double)v20 / 100.0;
    v19 = 64;
    goto LABEL_15;
  }
LABEL_16:
  if ((a3 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256039DB0);
    sub_233147CF8();
  }

}

uint64_t sub_233134728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[6] = a4;
  v5 = sub_233147BB4();
  v4[7] = v5;
  v4[8] = *(_QWORD *)(v5 - 8);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233134798()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void **v15;
  void *v16;
  _QWORD *v17;
  uint64_t (*v19)(void);

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  *(_QWORD *)(v0 + 88) = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 96) = v6;
  v6(v1, v4 + v5, v2);
  v7 = sub_233147B9C();
  v8 = sub_233147D4C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_233121000, v7, v8, "Stopping battery states", v9, 2u);
    MEMORY[0x234930B44](v9, -1, -1);
  }
  v10 = *(_QWORD *)(v0 + 80);
  v11 = *(_QWORD *)(v0 + 56);
  v12 = *(_QWORD *)(v0 + 64);
  v13 = *(_QWORD *)(v0 + 48);

  v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  *(_QWORD *)(v0 + 104) = v14;
  v14(v10, v11);
  v15 = (void **)(v13 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  v16 = *v15;
  *(_QWORD *)(v0 + 112) = *v15;
  if (v16)
  {
    v19 = (uint64_t (*)(void))((int)*MEMORY[0x24BE2D848] + MEMORY[0x24BE2D848]);
    v16;
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v17;
    *v17 = v0;
    v17[1] = sub_23313492C;
    return v19();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23313492C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 128) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2331349B0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  void *v16;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(void **)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 88);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 96);
  v5 = *(_QWORD *)(v0 + 72);
  v6 = *(_QWORD *)(v0 + 56);

  v3(v5, v1 + v4, v6);
  v7 = v2;
  v8 = v2;
  v9 = sub_233147B9C();
  v10 = sub_233147D40();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(void **)(v0 + 128);
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138412290;
    v14 = v11;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v15;
    sub_233147D88();
    *v13 = v15;

    _os_log_impl(&dword_233121000, v9, v10, "Failed stopping battery states: %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v13, -1, -1);
    MEMORY[0x234930B44](v12, -1, -1);

  }
  else
  {
    v16 = *(void **)(v0 + 128);

  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 104))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233134B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[5] = a4;
  v5[6] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039D58);
  v5[7] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[8] = v7;
  v5[9] = *(_QWORD *)(v7 + 64);
  v5[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233134BF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD *v14;
  void *v16;
  _BYTE *v17;
  _QWORD *v18;
  uint64_t (*v19)(id);

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 48);
  v6 = (void **)(v4 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  v7 = *v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  v8 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v4;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v9 + v8, v1, v2);
  v10 = v7;
  swift_retain();
  sub_233133E48((uint64_t)v7, (uint64_t)sub_233147198, v9, &OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_batteryCallback, (void (*)(uint64_t, uint64_t))sub_233147598, (void (*)(uint64_t, uint64_t))sub_233147594);

  swift_release();
  v11 = *(void **)(v4 + OBJC_IVAR____TtC7DockKit13DockAccessory_helper);
  *(_QWORD *)(v0 + 88) = v11;
  if (v11)
  {
    v12 = *v6;
    *(_QWORD *)(v0 + 96) = *v6;
    if (v12)
    {
      v19 = (uint64_t (*)(id))((int)*MEMORY[0x24BE2D860] + MEMORY[0x24BE2D860]);
      v12;
      v13 = v11;
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v14;
      *v14 = v0;
      v14[1] = sub_233134E1C;
      return v19(v13);
    }
    else
    {
      v18 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 120) = v18;
      *v18 = v0;
      v18[1] = sub_233134EB4;
      return sub_233135244();
    }
  }
  else
  {
    sub_233127120();
    v16 = (void *)swift_allocError();
    *v17 = 2;
    swift_willThrow();
    sub_233147CF8();

    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_233134E1C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;
  _QWORD *v5;

  v2 = *v1;
  *(_QWORD *)(v2 + 112) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v4 = *(void **)(v2 + 96);

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 120) = v5;
  *v5 = v2;
  v5[1] = sub_233134EB4;
  return sub_233135244();
}

uint64_t sub_233134EB4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 128) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_233134F28()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 128);
  sub_233147CF8();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_233134F6C(void *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
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
  __n128 v18;
  char *v19;
  id v20;
  unint64_t v21;
  char v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;

  v36 = a3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039D88);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_233147BB4();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v35 - v17;
  if (a1)
  {
    v35 = a5;
    v20 = a1;
    v21 = sub_233147A4C();
    if (v21 >= 3)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a4 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v12);
      v26 = sub_233147B9C();
      v27 = sub_233147D4C();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_233121000, v26, v27, "Unknown charge state, default to notCharging", v28, 2u);
        MEMORY[0x234930B44](v28, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      v22 = 0;
    }
    else
    {
      v22 = v21;
    }
    v29 = sub_233147A64();
    v31 = v30;
    sub_233147A58();
    v33 = v32;
    v34 = sub_233147A40();
    v37 = v29;
    v38 = v31;
    v39 = v33;
    v40 = v34 & 1;
    v41 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256039D58);
    sub_233147CEC();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    if ((v36 & 1) != 0)
      sub_233147CF8();

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, __n128))(v13 + 16))((char *)&v35 - v17, a4 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v12, v18);
    v23 = sub_233147B9C();
    v24 = sub_233147D40();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_233121000, v23, v24, "Got nil battery state", v25, 2u);
      MEMORY[0x234930B44](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v19, v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256039D58);
    sub_233147CF8();
  }
}

uint64_t sub_233135244()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  *(_QWORD *)(v1 + 80) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2331352A0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void **v3;
  void *v4;
  _QWORD *v5;
  uint64_t (*v6)(void);
  uint64_t (*v8)(void);

  v1 = v0[9];
  v2 = OBJC_IVAR____TtC7DockKit13DockAccessory_accessory;
  v0[11] = OBJC_IVAR____TtC7DockKit13DockAccessory_accessory;
  v3 = (void **)(v1 + v2);
  swift_beginAccess();
  v4 = *v3;
  v0[12] = *v3;
  if (v4)
  {
    v8 = (uint64_t (*)(void))((int)*MEMORY[0x24BE2D868] + MEMORY[0x24BE2D868]);
    v4;
    v5 = (_QWORD *)swift_task_alloc();
    v0[13] = v5;
    *v5 = v0;
    v5[1] = sub_233135358;
    v6 = v8;
  }
  else
  {
    swift_task_dealloc();
    v6 = (uint64_t (*)(void))v0[1];
  }
  return v6();
}

uint64_t sub_233135358(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 112) = a1;
  *(_QWORD *)(v3 + 120) = v1;
  swift_task_dealloc();
  if (!v1)

  return swift_task_switch();
}

uint64_t sub_2331353CC()
{
  uint64_t v0;
  void *v1;
  unint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t result;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v1 = *(void **)(*(_QWORD *)(v0 + 72) + *(_QWORD *)(v0 + 88));
  if (!v1)
    goto LABEL_27;
  v2 = *(_QWORD *)(v0 + 112);
  if (v2 >> 62)
  {
LABEL_25:
    v27 = v1;
    swift_bridgeObjectRetain();
    v3 = sub_233147E00();
    swift_bridgeObjectRelease();
    if (v3)
      goto LABEL_4;
    goto LABEL_26;
  }
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  v4 = v1;
  if (!v3)
  {
LABEL_26:

LABEL_27:
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
LABEL_4:
  v5 = 0;
  v28 = v3;
  v36 = *(_QWORD *)(v0 + 72);
  v37 = v2 & 0xC000000000000001;
  v33 = *(_QWORD *)(v0 + 112) + 32;
  v35 = OBJC_IVAR____TtC7DockKit13DockAccessory_helper;
  v29 = v1;
  while (1)
  {
    if (v37)
      v6 = (id)MEMORY[0x2349305D4](v5, *(_QWORD *)(v0 + 112));
    else
      v6 = *(id *)(v33 + 8 * v5);
    v7 = v6;
    v8 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    v9 = *(void **)(v36 + v35);
    if (!v9)
    {

      goto LABEL_6;
    }
    v10 = v1;
    v11 = v9;
    v12 = (void *)sub_233147770();

    v2 = (unint64_t)&v11[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand];
    v13 = (void *)MEMORY[0x234930BD4](&v11[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand]);

    if (v13)
      break;
LABEL_5:

LABEL_6:
    ++v5;
    if (v8 == v3)
      goto LABEL_26;
  }
  v34 = v12;
  result = MEMORY[0x234930BD4](v2);
  if (result)
  {
    v15 = (void *)result;
    v16 = (void *)sub_233147770();

    sub_2331476C8();
    v2 = sub_233147D64();

    if ((v2 & 1) != 0)
    {
      v17 = *(_QWORD *)(v0 + 80);
      v18 = sub_233147CD4();
      v19 = *(_QWORD *)(v18 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
      v20 = (_QWORD *)swift_allocObject();
      v20[2] = 0;
      v21 = v20 + 2;
      v20[3] = 0;
      v20[4] = v11;
      v20[5] = v7;
      v30 = v19;
      LODWORD(v19) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18);
      v32 = v11;
      v31 = v7;
      v22 = *(_QWORD *)(v0 + 80);
      if ((_DWORD)v19 == 1)
      {
        sub_233129970(*(_QWORD *)(v0 + 80), &qword_256038C20);
        if (*v21)
          goto LABEL_17;
LABEL_20:
        v23 = 0;
        v25 = 0;
      }
      else
      {
        sub_233147CC8();
        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v22, v18);
        if (!*v21)
          goto LABEL_20;
LABEL_17:
        swift_getObjectType();
        swift_unknownObjectRetain();
        v23 = sub_233147CBC();
        v25 = v24;
        swift_unknownObjectRelease();
      }
      v26 = swift_allocObject();
      *(_QWORD *)(v26 + 16) = &unk_256039D78;
      *(_QWORD *)(v26 + 24) = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256039C10);
      if (v25 | v23)
      {
        *(_QWORD *)(v0 + 16) = 0;
        *(_QWORD *)(v0 + 24) = 0;
        *(_QWORD *)(v0 + 32) = v23;
        *(_QWORD *)(v0 + 40) = v25;
      }
      v2 = swift_task_create();

      swift_release();
      v3 = v28;
      v1 = v29;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_233135760()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2331357A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039D20);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_233147CE0();
  v12 = sub_233147CD4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v13 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v14 = (char *)swift_allocObject();
  *((_QWORD *)v14 + 2) = 0;
  *((_QWORD *)v14 + 3) = 0;
  *((_QWORD *)v14 + 4) = a2;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v14[v13], (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *(_QWORD *)&v14[(v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8] = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_233129C78((uint64_t)v11, (uint64_t)&unk_256039D30, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_233135928(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_233147CD4();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a2;
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  swift_retain();
  if (v9 == 1)
  {
    sub_233129970((uint64_t)v5, &qword_256038C20);
  }
  else
  {
    sub_233147CC8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
    if (v8[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v10 = sub_233147CBC();
      v12 = v11;
      swift_unknownObjectRelease();
      if (v12 | v10)
      {
        v14[0] = 0;
        v14[1] = 0;
        v14[2] = v10;
        v14[3] = v12;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_233135AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[5] = a4;
  v5 = sub_233147BB4();
  v4[6] = v5;
  v4[7] = *(_QWORD *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233135B48()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;

  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 56) + 16))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(_QWORD *)(v0 + 48));
  v1 = sub_233147B9C();
  v2 = sub_233147D4C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_233121000, v1, v2, "Stopping actuator feedback", v3, 2u);
    MEMORY[0x234930B44](v3, -1, -1);
  }
  v5 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 40);
  v6 = *(_QWORD *)(v0 + 48);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v8 = (id *)(v7 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v8 && (v9 = *v8, v10 = sub_23314783C(), *(_QWORD *)(v0 + 72) = v10, v9, v10))
  {
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v11;
    *v11 = v0;
    v11[1] = sub_233135CB8;
    return sub_2331479BC();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_233135CB8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_233135D34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6[17] = a5;
  v6[18] = a6;
  v6[16] = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039D38);
  v6[19] = v7;
  v6[20] = *(_QWORD *)(v7 - 8);
  v6[21] = swift_task_alloc();
  v8 = sub_233147BB4();
  v6[22] = v8;
  v6[23] = *(_QWORD *)(v8 - 8);
  v6[24] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039D20);
  v6[25] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v6[26] = v10;
  v6[27] = *(_QWORD *)(v10 + 64);
  v6[28] = swift_task_alloc();
  return swift_task_switch();
}

void sub_233135DF4()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD *v21;
  NSObject *v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  _BYTE *v44;
  id v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v2 = v0 + 16;
  v1 = v0[16];
  v3 = v0[28];
  v4 = v0[25];
  v5 = v0[26];
  v6 = v0[17];
  v7 = (void **)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  v8 = *v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v6, v4);
  v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v10 = swift_allocObject();
  v11 = v10 + v9;
  v12 = v1;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))(v11, v3, v4);
  v13 = v8;
  sub_233133E48((uint64_t)v8, (uint64_t)sub_233146F18, v10, &OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_feedbackCallback, (void (*)(uint64_t, uint64_t))sub_233147598, (void (*)(uint64_t, uint64_t))sub_233147594);

  swift_release();
  v14 = OBJC_IVAR____TtC7DockKit13DockAccessory_helper;
  if (!*(_QWORD *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_helper))
  {
    sub_233127120();
    v22 = swift_allocError();
    *v23 = 2;
    swift_willThrow();
    v16 = v56;
    v25 = v56[23];
    v24 = v56[24];
    v26 = v56[22];
    v27 = v56[16];
    SPVector3DMake(0.0, 0.0, 0.0, (double *)&v57);
    v54 = v59;
    v55 = v60;
    v52 = v57;
    v53 = v58;
    SPVector3DMake(0.0, 0.0, 0.0, (double *)&v57);
    v50 = v59;
    v51 = v60;
    v48 = v57;
    v49 = v58;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, v27 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v26);
    v28 = v22;
    v29 = v22;
    v30 = sub_233147B9C();
    v31 = sub_233147D4C();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      v46 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v32 = 138412290;
      v33 = v22;
      v34 = _swift_stdlib_bridgeErrorToNSError();
      *(v2 - 1) = v34;
      sub_233147D88();
      *v46 = v34;

      _os_log_impl(&dword_233121000, v30, v31, "Converting private err %@ to public", v32, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
      swift_arrayDestroy();
      MEMORY[0x234930B44](v46, -1, -1);
      MEMORY[0x234930B44](v32, -1, -1);
    }
    else
    {

    }
    v35 = v56[24];
    v36 = v56[22];
    v37 = v56[23];
    v39 = v56[20];
    v38 = v56[21];
    v47 = v56[19];

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v35, v36);
    sub_23312411C(v22, (char *)&v57);
    LOBYTE(v36) = v57;
    v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE60]), sel_init);
    objc_msgSend(v40, sel_timeIntervalSinceNow);
    v42 = v41;

    v43 = (void *)swift_allocError();
    *v44 = v36;
    v56[4] = v54;
    v56[5] = v55;
    v56[2] = v52;
    v56[3] = v53;
    v56[8] = v50;
    v56[9] = v51;
    v56[6] = v48;
    v56[7] = v49;
    v56[10] = v42;
    v56[11] = v43;
    v45 = v43;
    sub_233147CEC();
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v47);
    sub_233147CF8();

    goto LABEL_10;
  }
  v15 = *v7;
  v16 = v56;
  if (!v15 || (v17 = v15, v18 = sub_23314783C(), v56[29] = v18, v17, !v18))
  {
LABEL_10:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    ((void (*)(void))v16[1])();
    return;
  }
  v19 = *(void **)(v12 + v14);
  v56[30] = v19;
  if (v19)
  {
    v20 = v19;
    v21 = (_QWORD *)swift_task_alloc();
    v56[31] = v21;
    *v21 = v56;
    v21[1] = sub_2331362C8;
    sub_2331479B0();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2331362C8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 256) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v4 = *(void **)(v2 + 232);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_233136360()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _BYTE *v24;
  id v25;
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

  v1 = *(void **)(v0 + 232);

  v2 = *(_QWORD *)(v0 + 128);
  v3 = *(NSObject **)(v0 + 256);
  v5 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 192);
  v6 = *(_QWORD *)(v0 + 176);
  SPVector3DMake(0.0, 0.0, 0.0, (double *)&v36);
  v32 = v37;
  v33 = v38;
  v34 = v36;
  v35 = v39;
  SPVector3DMake(0.0, 0.0, 0.0, (double *)&v36);
  v30 = v38;
  v31 = v39;
  v28 = v36;
  v29 = v37;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v2 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v6);
  v7 = v3;
  v8 = v3;
  v9 = sub_233147B9C();
  v10 = sub_233147D4C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v11 = 138412290;
    v13 = v3;
    v14 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 120) = v14;
    sub_233147D88();
    *v12 = v14;

    _os_log_impl(&dword_233121000, v9, v10, "Converting private err %@ to public", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v12, -1, -1);
    MEMORY[0x234930B44](v11, -1, -1);
  }
  else
  {

  }
  v15 = *(_QWORD *)(v0 + 192);
  v17 = *(_QWORD *)(v0 + 176);
  v16 = *(_QWORD *)(v0 + 184);
  v19 = *(_QWORD *)(v0 + 160);
  v18 = *(_QWORD *)(v0 + 168);
  v27 = *(_QWORD *)(v0 + 152);

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  sub_23312411C(v3, (char *)&v36);
  LOBYTE(v16) = v36;
  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE60]), sel_init);
  objc_msgSend(v20, sel_timeIntervalSinceNow);
  v22 = v21;

  sub_233127120();
  v23 = (void *)swift_allocError();
  *v24 = v16;
  *(_QWORD *)(v0 + 24) = v32;
  *(_QWORD *)(v0 + 32) = v33;
  *(_QWORD *)(v0 + 16) = v34;
  *(_QWORD *)(v0 + 64) = v30;
  *(_QWORD *)(v0 + 72) = v31;
  *(_QWORD *)(v0 + 40) = v35;
  *(_QWORD *)(v0 + 48) = v28;
  *(_QWORD *)(v0 + 56) = v29;
  *(_QWORD *)(v0 + 80) = v22;
  *(_QWORD *)(v0 + 88) = v23;
  v25 = v23;
  sub_233147CEC();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v27);
  sub_233147CF8();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313668C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, uint64_t a6, double a7)
{
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  double *v18;
  uint64_t *v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  double *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  id v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  uint64_t v74;
  double v75;
  id v76;

  v62 = a5;
  v58 = a4;
  v55 = a2;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039D38);
  v60 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v59 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  SPVector3DMake(0.0, 0.0, 0.0, &v67);
  v12 = v67;
  v65 = v69;
  v66 = v68;
  v57 = v70;
  SPVector3DMake(0.0, 0.0, 0.0, &v67);
  v13 = v67;
  v14 = v68;
  v64 = v69;
  v56 = v70;
  v15 = *(_QWORD *)(a3 + 16);
  v16 = *(_QWORD *)(a1 + 16);
  v63 = a6;
  v54 = a1;
  if (v15 != v16 || !v16)
  {
LABEL_26:
    if (!v16 || (v34 = v55, *(_QWORD *)(v55 + 16) != v16))
    {
LABEL_50:
      v67 = v13;
      v68 = v14;
      v69 = v64;
      v70 = v56;
      v71 = v12;
      v72 = v66;
      v73 = v65;
      v74 = v57;
      v75 = a7;
      v76 = v58;
      v51 = v58;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256039D20);
      v52 = v59;
      sub_233147CEC();
      result = (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v52, v61);
      if ((v62 & 1) != 0)
        return sub_233147CF8();
      return result;
    }
    sub_233147B3C();
    v35 = 0;
    v36 = (double *)(v34 + 32);
    v37 = (uint64_t *)(v54 + 40);
    while (1)
    {
      v39 = *(v37 - 1);
      v38 = *v37;
      swift_bridgeObjectRetain();
      if (v39 == sub_233147B18() && v38 == v40)
      {
        result = swift_bridgeObjectRelease_n();
LABEL_39:
        if (v35 >= v16)
          goto LABEL_54;
        v14 = *v36;
        goto LABEL_29;
      }
      v42 = sub_233147E60();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v42 & 1) != 0)
        goto LABEL_39;
      v43 = *(v37 - 1);
      v44 = *v37;
      swift_bridgeObjectRetain();
      if (v43 == sub_233147B30() && v44 == v45)
        break;
      v46 = sub_233147E60();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v46 & 1) != 0)
        goto LABEL_42;
      v47 = *(v37 - 1);
      v48 = *v37;
      swift_bridgeObjectRetain();
      if (v47 == sub_233147B24() && v48 == v49)
      {
        result = swift_bridgeObjectRelease_n();
      }
      else
      {
        v50 = sub_233147E60();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if ((v50 & 1) == 0)
          goto LABEL_29;
      }
      if (v35 >= v16)
        goto LABEL_58;
      v64 = *v36;
LABEL_29:
      ++v35;
      ++v36;
      v37 += 2;
      if (v16 == v35)
        goto LABEL_50;
    }
    result = swift_bridgeObjectRelease_n();
LABEL_42:
    if (v35 >= v16)
      goto LABEL_56;
    v13 = -*v36;
    goto LABEL_29;
  }
  sub_233147B3C();
  v17 = 0;
  v18 = (double *)(a3 + 32);
  v19 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v22 = *(v19 - 1);
    v21 = *v19;
    swift_bridgeObjectRetain();
    if (v22 == sub_233147B18() && v21 == v23)
      break;
    v25 = sub_233147E60();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v25 & 1) != 0)
      goto LABEL_17;
    v26 = *(v19 - 1);
    v27 = *v19;
    swift_bridgeObjectRetain();
    if (v26 == sub_233147B30() && v27 == v28)
    {
      result = swift_bridgeObjectRelease_n();
LABEL_20:
      if (v17 >= v15)
        goto LABEL_55;
      v12 = -*v18;
      goto LABEL_7;
    }
    v29 = sub_233147E60();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v29 & 1) != 0)
      goto LABEL_20;
    v30 = *(v19 - 1);
    v31 = *v19;
    swift_bridgeObjectRetain();
    if (v30 == sub_233147B24() && v31 == v32)
    {
      result = swift_bridgeObjectRelease_n();
LABEL_5:
      if (v17 >= v15)
        goto LABEL_57;
      v65 = *v18;
      goto LABEL_7;
    }
    v33 = sub_233147E60();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v33 & 1) != 0)
      goto LABEL_5;
LABEL_7:
    ++v17;
    ++v18;
    v19 += 2;
    if (v15 == v17)
      goto LABEL_26;
  }
  result = swift_bridgeObjectRelease_n();
LABEL_17:
  if (v17 < v15)
  {
    v66 = *v18;
    goto LABEL_7;
  }
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
  return result;
}

uint64_t sub_233136BB4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a3);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_233147CE0();
  v15 = sub_233147CD4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v16 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = 0;
  *((_QWORD *)v17 + 3) = 0;
  *((_QWORD *)v17 + 4) = a2;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v17[v16], (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  swift_retain();
  sub_233129C78((uint64_t)v14, a6, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_233136D1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[4];

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_233147CD4();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a2;
  v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  swift_retain();
  if (v13 == 1)
  {
    sub_233129970((uint64_t)v9, &qword_256038C20);
    v14 = 0;
    v15 = 0;
  }
  else
  {
    sub_233147CC8();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (v12[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v14 = sub_233147CBC();
      v15 = v16;
      swift_unknownObjectRelease();
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
  }
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a5;
  *(_QWORD *)(v17 + 24) = v12;
  if (v15 | v14)
  {
    v19[0] = 0;
    v19[1] = 0;
    v19[2] = v14;
    v19[3] = v15;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_233136EF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[6] = a4;
  v5 = sub_233147BB4();
  v4[7] = v5;
  v4[8] = *(_QWORD *)(v5 - 8);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233136F64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void **v15;
  void *v16;
  _QWORD *v17;
  uint64_t (*v19)(void);

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  *(_QWORD *)(v0 + 88) = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 96) = v6;
  v6(v1, v4 + v5, v2);
  v7 = sub_233147B9C();
  v8 = sub_233147D4C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_233121000, v7, v8, "Stopping tracking states", v9, 2u);
    MEMORY[0x234930B44](v9, -1, -1);
  }
  v10 = *(_QWORD *)(v0 + 80);
  v11 = *(_QWORD *)(v0 + 56);
  v12 = *(_QWORD *)(v0 + 64);
  v13 = *(_QWORD *)(v0 + 48);

  v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  *(_QWORD *)(v0 + 104) = v14;
  v14(v10, v11);
  v15 = (void **)(v13 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  v16 = *v15;
  *(_QWORD *)(v0 + 112) = *v15;
  if (v16)
  {
    v19 = (uint64_t (*)(void))((int)*MEMORY[0x24BE2D870] + MEMORY[0x24BE2D870]);
    v16;
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v17;
    *v17 = v0;
    v17[1] = sub_2331370F8;
    return v19();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2331370F8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 128) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23313717C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  void *v16;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(void **)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 88);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 96);
  v5 = *(_QWORD *)(v0 + 72);
  v6 = *(_QWORD *)(v0 + 56);

  v3(v5, v1 + v4, v6);
  v7 = v2;
  v8 = v2;
  v9 = sub_233147B9C();
  v10 = sub_233147D40();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(void **)(v0 + 128);
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138412290;
    v14 = v11;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v15;
    sub_233147D88();
    *v13 = v15;

    _os_log_impl(&dword_233121000, v9, v10, "Failed stopping tracking states: %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v13, -1, -1);
    MEMORY[0x234930B44](v12, -1, -1);

  }
  else
  {
    v16 = *(void **)(v0 + 128);

  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 104))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233137354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[6] = a4;
  v5[7] = a5;
  v6 = sub_233147BB4();
  v5[8] = v6;
  v5[9] = *(_QWORD *)(v6 - 8);
  v5[10] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039CC8);
  v5[11] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[12] = v8;
  v5[13] = *(_QWORD *)(v8 + 64);
  v5[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2331373E4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  void *v17;
  _BYTE *v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(id);
  uint64_t v32;

  v1 = v0 + 6;
  v2 = v0[6];
  v3 = v0[14];
  v4 = v0[11];
  v5 = v0[12];
  v6 = v0[7];
  v7 = (void **)(v2 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  v8 = *v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v6, v4);
  v9 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v2;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))(v10 + v9, v3, v4);
  v11 = v8;
  swift_retain();
  sub_233133E48((uint64_t)v8, (uint64_t)sub_233146C28, v10, &OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingSummaryCallback, (void (*)(uint64_t, uint64_t))sub_233146CCC, (void (*)(uint64_t, uint64_t))sub_233129614);

  swift_release();
  v12 = *(void **)(v2 + OBJC_IVAR____TtC7DockKit13DockAccessory_helper);
  v1[9] = v12;
  if (v12)
  {
    v13 = *v7;
    *(_QWORD *)(v32 + 128) = *v7;
    if (v13)
    {
      v31 = (uint64_t (*)(id))((int)*MEMORY[0x24BE2D878] + MEMORY[0x24BE2D878]);
      v13;
      v14 = v12;
      v15 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v32 + 136) = v15;
      *v15 = v32;
      v15[1] = sub_23313779C;
      return v31(v14);
    }
    else
    {
      v27 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v32 + 152) = v27;
      *v27 = v32;
      v27[1] = sub_233137834;
      return sub_233138410();
    }
  }
  else
  {
    sub_233127120();
    v17 = (void *)swift_allocError();
    *v18 = 2;
    swift_willThrow();
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v32 + 72) + 16))(*(_QWORD *)(v32 + 80), *(_QWORD *)(v32 + 48) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(_QWORD *)(v32 + 64));
    v19 = v17;
    v20 = v17;
    v21 = sub_233147B9C();
    v22 = sub_233147D40();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v23 = 138412290;
      v25 = v17;
      v26 = _swift_stdlib_bridgeErrorToNSError();
      *(v1 - 1) = v26;
      sub_233147D88();
      *v24 = v26;

      _os_log_impl(&dword_233121000, v21, v22, "Failed to get tracking Summary: %@", v23, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
      swift_arrayDestroy();
      MEMORY[0x234930B44](v24, -1, -1);
      MEMORY[0x234930B44](v23, -1, -1);
    }
    else
    {

    }
    v28 = *(_QWORD *)(v32 + 80);
    v29 = *(_QWORD *)(v32 + 64);
    v30 = *(_QWORD *)(v32 + 72);

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v29);
    sub_233147CF8();

    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v32 + 8))();
  }
}

uint64_t sub_23313779C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;
  _QWORD *v5;

  v2 = *v1;
  *(_QWORD *)(v2 + 144) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v4 = *(void **)(v2 + 128);

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 152) = v5;
  *v5 = v2;
  v5[1] = sub_233137834;
  return sub_233138410();
}

uint64_t sub_233137834()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 160) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2331378B4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(void **)(v0 + 128);

  v2 = *(void **)(v0 + 144);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 72) + 16))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 48) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(_QWORD *)(v0 + 64));
  v3 = v2;
  v4 = v2;
  v5 = sub_233147B9C();
  v6 = sub_233147D40();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v2;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v10;
    sub_233147D88();
    *v8 = v10;

    _os_log_impl(&dword_233121000, v5, v6, "Failed to get tracking Summary: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v8, -1, -1);
    MEMORY[0x234930B44](v7, -1, -1);
  }
  else
  {

  }
  v11 = *(_QWORD *)(v0 + 80);
  v12 = *(_QWORD *)(v0 + 64);
  v13 = *(_QWORD *)(v0 + 72);

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  sub_233147CF8();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233137A94()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(void **)(v0 + 160);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 72) + 16))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 48) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(_QWORD *)(v0 + 64));
  v2 = v1;
  v3 = v1;
  v4 = sub_233147B9C();
  v5 = sub_233147D40();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v6 = 138412290;
    v8 = v1;
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v9;
    sub_233147D88();
    *v7 = v9;

    _os_log_impl(&dword_233121000, v4, v5, "Failed to get tracking Summary: %@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v7, -1, -1);
    MEMORY[0x234930B44](v6, -1, -1);
  }
  else
  {

  }
  v10 = *(_QWORD *)(v0 + 80);
  v11 = *(_QWORD *)(v0 + 64);
  v12 = *(_QWORD *)(v0 + 72);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  sub_233147CF8();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233137C68(uint64_t a1, unint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
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
  unint64_t v31;
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  char *v44;
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
  char v55;
  char v56;
  uint64_t v57;
  char v58;
  char v59;
  uint64_t v60;
  char v61;
  char v62;
  int *v63;
  char *v64;
  char *v65;
  char v66;
  char *v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  char v84;
  uint64_t v85;
  char *v86;
  char *v87;
  unint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  uint8_t *v91;
  uint64_t v92;
  char *v93;
  _QWORD v94[2];
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  unsigned int v107;
  unint64_t v108;
  char *v109;
  char *v110;
  char *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;

  v103 = a4;
  v10 = sub_233147BB4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v94 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for DockAccessory.TrackedSubjectType(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v110 = (char *)v94 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v109 = (char *)v94 - v18;
  v19 = sub_233147AF4();
  v113 = *(_QWORD *)(v19 - 8);
  v114 = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v112 = (char *)v94 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v111 = (char *)v94 - v22;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039CF0);
  v101 = *(_QWORD *)(v23 - 8);
  v102 = v23;
  MEMORY[0x24BDAC7A8](v23);
  v99 = (char *)v94 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for DockAccessory.TrackingState(0);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v100 = (char *)v94 - v29;
  if (a2 >> 60 == 15)
    goto LABEL_25;
  v96 = v27;
  v97 = v28;
  sub_233147AE8();
  sub_233146CDC(a1, a2);
  v30 = sub_233147AC4();
  if (!v30)
  {
    sub_23314690C(a1, a2);
LABEL_25:
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a5 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v10);
    v89 = sub_233147B9C();
    v90 = sub_233147D40();
    if (os_log_type_enabled(v89, v90))
    {
      v91 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v91 = 0;
      _os_log_impl(&dword_233121000, v89, v90, "Got nil tracking trackingSummary", v91, 2u);
      MEMORY[0x234930B44](v91, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256039CC8);
    return sub_233147CF8();
  }
  v98 = a1;
  v95 = a2;
  v94[1] = v30;
  v31 = sub_233147ADC();
  if (v31 >> 62)
    result = sub_233147E00();
  else
    result = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
  v33 = v98;
  if (result)
  {
    v94[0] = a6;
    if (result < 1)
    {
      __break(1u);
      return result;
    }
    v34 = 0;
    v108 = v31 & 0xC000000000000001;
    v107 = *MEMORY[0x24BE2DBA0];
    v35 = MEMORY[0x24BEE4AF8];
    v105 = result;
    v106 = v31;
    v104 = v15;
    do
    {
      v115 = v35;
      if (v108)
        MEMORY[0x2349305D4](v34, v31);
      else
        swift_retain();
      v37 = v111;
      sub_233147AAC();
      v39 = v112;
      v38 = v113;
      v40 = v114;
      (*(void (**)(char *, _QWORD, uint64_t))(v113 + 104))(v112, v107, v114);
      sub_233127808(&qword_256039CF8, (uint64_t (*)(uint64_t))MEMORY[0x24BE2DBA8], MEMORY[0x24BE2DBB0]);
      sub_233147C5C();
      sub_233147C5C();
      v42 = v116;
      v41 = v117;
      v43 = *(void (**)(char *, uint64_t))(v38 + 8);
      v43(v39, v40);
      v43(v37, v40);
      if (v41 == v42)
      {
        v44 = v109;
        sub_233147A70();
        sub_233147AA0();
        v46 = v45;
        v48 = v47;
        v50 = v49;
        v52 = v51;
        v53 = sub_233147A7C();
        v54 = v14;
        v56 = v55;
        v57 = sub_233147A88();
        v59 = v58;
        v60 = sub_233147A94();
        v62 = v61;
        v63 = (int *)type metadata accessor for DockAccessory.TrackedPerson(0);
        v64 = &v44[v63[5]];
        *(_QWORD *)v64 = v46;
        *((_QWORD *)v64 + 1) = v48;
        *((_QWORD *)v64 + 2) = v50;
        *((_QWORD *)v64 + 3) = v52;
        v65 = &v44[v63[6]];
        *(_QWORD *)v65 = v53;
        v66 = v56 & 1;
        v14 = v54;
        v65[8] = v66;
        v67 = &v44[v63[7]];
        *(_QWORD *)v67 = v57;
        v67[8] = v59 & 1;
        v68 = &v44[v63[8]];
        *(_QWORD *)v68 = v60;
        v68[8] = v62 & 1;
        swift_storeEnumTagMultiPayload();
        v35 = v115;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v35 = sub_233126F18(0, *(_QWORD *)(v35 + 16) + 1, 1, v35);
        v15 = v104;
        v69 = v105;
        v31 = v106;
        v71 = *(_QWORD *)(v35 + 16);
        v70 = *(_QWORD *)(v35 + 24);
        v72 = v71 + 1;
        if (v71 >= v70 >> 1)
          v35 = sub_233126F18(v70 > 1, v71 + 1, 1, v35);
        v36 = (uint64_t)v109;
      }
      else
      {
        v73 = v110;
        sub_233147A70();
        sub_233147AA0();
        v75 = v74;
        v77 = v76;
        v79 = v78;
        v81 = v80;
        v82 = sub_233147A7C();
        v84 = v83;
        v85 = type metadata accessor for DockAccessory.TrackedObject(0);
        v86 = &v73[*(int *)(v85 + 20)];
        *(_QWORD *)v86 = v75;
        *((_QWORD *)v86 + 1) = v77;
        *((_QWORD *)v86 + 2) = v79;
        *((_QWORD *)v86 + 3) = v81;
        v87 = &v73[*(int *)(v85 + 24)];
        *(_QWORD *)v87 = v82;
        v87[8] = v84 & 1;
        swift_storeEnumTagMultiPayload();
        v35 = v115;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v35 = sub_233126F18(0, *(_QWORD *)(v35 + 16) + 1, 1, v35);
        v69 = v105;
        v31 = v106;
        v71 = *(_QWORD *)(v35 + 16);
        v88 = *(_QWORD *)(v35 + 24);
        v72 = v71 + 1;
        if (v71 >= v88 >> 1)
          v35 = sub_233126F18(v88 > 1, v71 + 1, 1, v35);
        v36 = (uint64_t)v110;
      }
      ++v34;
      *(_QWORD *)(v35 + 16) = v72;
      sub_2331416F4(v36, v35+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(_QWORD *)(v15 + 72) * v71, type metadata accessor for DockAccessory.TrackedSubjectType);
      swift_release();
    }
    while (v69 != v34);
    swift_bridgeObjectRelease();
    v33 = v98;
  }
  else
  {
    swift_bridgeObjectRelease();
    v35 = MEMORY[0x24BEE4AF8];
  }
  v92 = (uint64_t)v100;
  sub_233147AB8();
  *(_QWORD *)(v92 + *(int *)(v96 + 20)) = v35;
  sub_233140F4C(v92, v97, type metadata accessor for DockAccessory.TrackingState);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256039CC8);
  v93 = v99;
  sub_233147CEC();
  (*(void (**)(char *, uint64_t))(v101 + 8))(v93, v102);
  if ((v103 & 1) != 0)
  {
    sub_233147CF8();
    sub_23314690C(v33, v95);
    swift_release();
    return sub_2331416B8(v92, type metadata accessor for DockAccessory.TrackingState);
  }
  else
  {
    sub_2331416B8(v92, type metadata accessor for DockAccessory.TrackingState);
    sub_23314690C(v33, v95);
    return swift_release();
  }
}

uint64_t sub_233138410()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  *(_QWORD *)(v1 + 48) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23313846C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void **v3;
  void *v4;
  _QWORD *v5;
  uint64_t (*v6)(void);
  uint64_t (*v8)(void);

  v1 = v0[5];
  v2 = OBJC_IVAR____TtC7DockKit13DockAccessory_accessory;
  v0[7] = OBJC_IVAR____TtC7DockKit13DockAccessory_accessory;
  v3 = (void **)(v1 + v2);
  swift_beginAccess();
  v4 = *v3;
  v0[8] = *v3;
  if (v4)
  {
    v8 = (uint64_t (*)(void))((int)*MEMORY[0x24BE2D880] + MEMORY[0x24BE2D880]);
    v4;
    v5 = (_QWORD *)swift_task_alloc();
    v0[9] = v5;
    *v5 = v0;
    v5[1] = sub_233138524;
    v6 = v8;
  }
  else
  {
    swift_task_dealloc();
    v6 = (uint64_t (*)(void))v0[1];
  }
  return v6();
}

uint64_t sub_233138524(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_QWORD *)(v4 + 80) = a1;
  *(_QWORD *)(v4 + 88) = a2;
  *(_QWORD *)(v4 + 96) = v2;
  swift_task_dealloc();
  if (!v2)

  return swift_task_switch();
}

uint64_t sub_23313859C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  char *v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  uint64_t result;
  void *v11;
  void *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (*(_QWORD *)(v0 + 88) >> 60 == 15)
    goto LABEL_14;
  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(void **)(v1 + *(_QWORD *)(v0 + 56));
  if (!v2)
  {
    v23 = *(_QWORD *)(v0 + 80);
LABEL_11:
    sub_23314690C(v23, *(_QWORD *)(v0 + 88));
LABEL_14:
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v3 = *(void **)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_helper);
  if (!v3)
  {
    v23 = *(_QWORD *)(v0 + 80);
    goto LABEL_11;
  }
  v4 = v2;
  v5 = v3;
  v6 = (void *)sub_233147770();
  v7 = (void *)sub_2331475FC();
  v8 = &v5[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand];
  v9 = (void *)MEMORY[0x234930BD4](&v5[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand]);

  if (!v9)
  {
    v21 = *(_QWORD *)(v0 + 80);
    v22 = *(_QWORD *)(v0 + 88);
LABEL_13:
    sub_23314690C(v21, v22);

    goto LABEL_14;
  }
  result = MEMORY[0x234930BD4](v8);
  if (result)
  {
    v11 = (void *)result;
    v12 = (void *)sub_233147770();

    sub_2331476C8();
    v13 = sub_233147D64();

    v15 = *(_QWORD *)(v0 + 80);
    v14 = *(_QWORD *)(v0 + 88);
    if ((v13 & 1) != 0)
    {
      v16 = *(_QWORD *)(v0 + 48);
      v24 = sub_233147608();
      v18 = v17;
      v19 = sub_233147CD4();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v16, 1, 1, v19);
      v20 = (_QWORD *)swift_allocObject();
      v20[2] = 0;
      v20[3] = 0;
      v20[4] = v5;
      v20[5] = v24;
      v20[6] = v18;
      v5 = v5;
      sub_233129DC4(v16, (uint64_t)&unk_256039CE8, (uint64_t)v20);
      swift_release();
    }
    v21 = v15;
    v22 = v14;
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_233138774()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DockAccessory.track(_:cameraInformation:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  char v5;
  char v6;
  char v7;
  __int128 v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 80);
  v7 = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)a2;
  *(_QWORD *)(v2 + 24) = v4;
  *(_BYTE *)(v2 + 32) = v5;
  v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v2 + 64) = v8;
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(v2 + 96) = v6;
  *(_OWORD *)(v2 + 104) = *(_OWORD *)(a2 + 88);
  *(_BYTE *)(v2 + 120) = v7;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 128) = v9;
  *v9 = v2;
  v9[1] = sub_233138850;
  return sub_2331388BC(a1, (uint64_t *)(v2 + 16), 0);
}

{
  uint64_t v2;
  uint64_t v4;
  char v5;
  char v6;
  char v7;
  __int128 v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 80);
  v7 = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)a2;
  *(_QWORD *)(v2 + 24) = v4;
  *(_BYTE *)(v2 + 32) = v5;
  v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v2 + 64) = v8;
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(v2 + 96) = v6;
  *(_OWORD *)(v2 + 104) = *(_OWORD *)(a2 + 88);
  *(_BYTE *)(v2 + 120) = v7;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 128) = v9;
  *v9 = v2;
  v9[1] = sub_233138850;
  return sub_23313AB74(a1, (uint64_t *)(v2 + 16), 0);
}

uint64_t sub_233138850()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 136) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2331388BC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  *(_QWORD *)(v4 + 136) = a3;
  *(_QWORD *)(v4 + 144) = v3;
  *(_QWORD *)(v4 + 128) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038D20);
  *(_QWORD *)(v4 + 152) = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039268);
  *(_QWORD *)(v4 + 160) = v6;
  *(_QWORD *)(v4 + 168) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 176) = swift_task_alloc();
  v7 = type metadata accessor for DockAccessory.Observation(0);
  *(_QWORD *)(v4 + 184) = v7;
  *(_QWORD *)(v4 + 192) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v4 + 200) = swift_task_alloc();
  v8 = sub_233147BB4();
  *(_QWORD *)(v4 + 208) = v8;
  *(_QWORD *)(v4 + 216) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v4 + 224) = swift_task_alloc();
  v9 = swift_task_alloc();
  v10 = *a2;
  v11 = a2[1];
  *(_QWORD *)(v4 + 232) = v9;
  *(_QWORD *)(v4 + 240) = v10;
  *(_QWORD *)(v4 + 248) = v11;
  *(_BYTE *)(v4 + 408) = *((_BYTE *)a2 + 16);
  v12 = *((_OWORD *)a2 + 3);
  *(_OWORD *)(v4 + 256) = *((_OWORD *)a2 + 2);
  *(_OWORD *)(v4 + 272) = v12;
  v13 = *((_OWORD *)a2 + 4);
  *(_BYTE *)(v4 + 409) = *((_BYTE *)a2 + 80);
  v14 = *(_OWORD *)(a2 + 11);
  *(_OWORD *)(v4 + 288) = v13;
  *(_OWORD *)(v4 + 304) = v14;
  *(_BYTE *)(v4 + 410) = *((_BYTE *)a2 + 104);
  return swift_task_switch();
}

uint64_t sub_2331389E0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  char v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void (*v46)(uint64_t, uint64_t);
  id v47;
  void (*v48)(_QWORD *, _QWORD);
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int32x2_t v56;
  int32x2_t v57;
  __int128 v58;
  int32x2_t v59;
  int32x2_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  _BYTE *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  _QWORD *v79;
  uint64_t (*v80)(void);
  _QWORD *v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  if (qword_2560389A0 != -1)
    swift_once();
  v1 = qword_2560389A8;
  v2 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  v3 = *(os_unfair_lock_s **)(qword_2560389A8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  swift_release();
  v4 = *(_BYTE *)(v1 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  v5 = *(os_unfair_lock_s **)(v1 + v2);
  swift_retain();
  os_unfair_lock_unlock(v5 + 4);
  swift_release();
  if ((v4 & 1) != 0)
  {
    v6 = v0[18];
    v7 = OBJC_IVAR____TtC7DockKit13DockAccessory__tracking;
    v0[40] = OBJC_IVAR____TtC7DockKit13DockAccessory__tracking;
    v81 = v0;
    if ((*(_BYTE *)(v6 + v7) & 1) == 0)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(v0[27] + 16))(v0[29], v6 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v0[26]);
      v8 = sub_233147B9C();
      v9 = sub_233147D4C();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_233121000, v8, v9, "Starting tracker", v10, 2u);
        MEMORY[0x234930B44](v10, -1, -1);
      }
      v11 = v0[29];
      v12 = v0[26];
      v13 = v0[27];
      v14 = v0[18];

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
      v15 = (void **)(v14 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
      swift_beginAccess();
      v16 = *v15;
      v0[41] = *v15;
      if (v16)
      {
        v80 = (uint64_t (*)(void))((int)*MEMORY[0x24BE2D918] + MEMORY[0x24BE2D918]);
        v16;
        v17 = (_QWORD *)swift_task_alloc();
        v0[42] = v17;
        *v17 = v0;
        v17[1] = sub_2331396B4;
        return v80();
      }
      *(_BYTE *)(v0[18] + v0[40]) = 1;
    }
    v18 = v0[31];
    v0[43] = objc_msgSend(objc_allocWithZone((Class)sub_2331478D8()), sel_init);
    sub_233146924();
    sub_233147D70();
    sub_2331478C0();
    if (v18 == 2)
      goto LABEL_19;
    v19 = sub_233147BF0();
    v21 = v20;
    if (v19 == sub_233147BF0() && v21 == v22)
      goto LABEL_36;
    v23 = sub_233147E60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      v24 = sub_233147BF0();
      v26 = v25;
      if (v24 == sub_233147BF0() && v26 == v27)
        goto LABEL_36;
      v28 = sub_233147E60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v28 & 1) == 0)
      {
        v69 = sub_233147BF0();
        v71 = v70;
        if (v69 == sub_233147BF0() && v71 == v72)
        {
LABEL_36:
          swift_bridgeObjectRelease_n();
          goto LABEL_19;
        }
        v73 = sub_233147E60();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v73 & 1) == 0)
        {
LABEL_20:
          v29 = (char *)v0 + 409;
          v30 = v0[16];
          sub_23314789C();
          v31 = *(_QWORD *)(v30 + 16);
          if (v31)
          {
            v32 = v0[24];
            v33 = (double *)v0[25];
            v76 = v0[21];
            v77 = v0[23];
            v34 = v0[16] + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
            v74 = (char *)v0 + 409;
            v75 = *(_QWORD *)(v32 + 72);
            swift_bridgeObjectRetain();
            v79 = v0 + 2;
            do
            {
              sub_233140F4C(v34, v0[25], type metadata accessor for DockAccessory.Observation);
              v35 = v0[25];
              v37 = v0[19];
              v36 = v0[20];
              v38 = v33[2];
              v39 = v33[3];
              v40 = v33[4];
              v41 = v33[5];
              v82.origin.x = v38;
              v82.origin.y = v39;
              v82.size.width = v40;
              v82.size.height = v41;
              CGRectGetMinX(v82);
              v83.origin.x = v38;
              v83.origin.y = v39;
              v83.size.width = v40;
              v83.size.height = v41;
              CGRectGetMinY(v83);
              v84.origin.x = v38;
              v84.origin.y = v39;
              v84.size.width = v40;
              v84.size.height = v41;
              CGRectGetHeight(v84);
              v85.origin.x = v38;
              v85.origin.y = v39;
              v85.size.width = v40;
              v85.size.height = v41;
              CGRectGetWidth(v85);
              v86.origin.x = v38;
              v86.origin.y = v39;
              v86.size.width = v40;
              v86.size.height = v41;
              CGRectGetHeight(v86);
              sub_23312BD5C(v35 + *(int *)(v77 + 28), v37);
              if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v37, 1, v36) == 1)
              {
                sub_233129970(v0[19], &qword_256038D20);
              }
              else
              {
                v42 = v0[22];
                v43 = v0[19];
                v44 = v0[20];
                v45 = objc_msgSend((id)objc_opt_self(), sel_radians);
                sub_2331475E4();

                v46 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
                v46(v43, v44);
                sub_2331475D8();
                v46(v42, v44);
              }
              v47 = objc_allocWithZone((Class)sub_23314768C());
              sub_233147680();
              v48 = (void (*)(_QWORD *, _QWORD))sub_233147890();
              v50 = v49;
              MEMORY[0x234930490](v48, v49, v51, v52, v53);
              if (*(_QWORD *)((*v50 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v50 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                sub_233147CA4();
              v0 = v81;
              v54 = v81[25];
              sub_233147CB0();
              sub_233147C98();
              v48(v79, 0);
              sub_2331416B8(v54, type metadata accessor for DockAccessory.Observation);
              v34 += v75;
              --v31;
            }
            while (v31);
            swift_bridgeObjectRelease();
            v29 = v74;
          }
          if ((*v29 & 1) == 0)
          {
            v55 = v0[36];
            v56 = (int32x2_t)v0[34];
            v57 = (int32x2_t)v81[32];
            *(_QWORD *)&v58 = v55;
            *((_QWORD *)&v58 + 1) = v0[37];
            v78 = v58;
            v59 = (int32x2_t)v81[33];
            v60 = (int32x2_t)v81[35];
            __swift_instantiateConcreteTypeFromMangledName(&qword_256039C90);
            v61 = swift_allocObject();
            *(_OWORD *)(v61 + 16) = xmmword_233149C80;
            __swift_instantiateConcreteTypeFromMangledName(&qword_256039C98);
            v62 = swift_allocObject();
            *(_OWORD *)(v62 + 16) = xmmword_233149C80;
            *(_DWORD *)(v62 + 32) = v57.i32[0];
            *(_DWORD *)(v62 + 36) = v56.i32[0];
            v0 = v81;
            *(_DWORD *)(v62 + 40) = v55;
            v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039CA0);
            *(_QWORD *)(v61 + 56) = v63;
            *(_QWORD *)(v61 + 32) = v62;
            v64 = swift_allocObject();
            *(_OWORD *)(v64 + 16) = xmmword_233149C80;
            *(int32x2_t *)(v64 + 32) = vzip2_s32(v57, v56);
            *(_DWORD *)(v64 + 40) = DWORD1(v78);
            *(_QWORD *)(v61 + 88) = v63;
            *(_QWORD *)(v61 + 64) = v64;
            v65 = swift_allocObject();
            *(_OWORD *)(v65 + 16) = xmmword_233149C80;
            *(int32x2_t *)(v65 + 32) = vzip1_s32(v59, v60);
            *(_DWORD *)(v65 + 40) = DWORD2(v78);
            *(_QWORD *)(v61 + 120) = v63;
            *(_QWORD *)(v61 + 96) = v65;
            v66 = objc_allocWithZone(MEMORY[0x24BDBCE30]);
            v67 = (void *)sub_233147C74();
            swift_bridgeObjectRelease();
            objc_msgSend(v66, sel_initWithArray_, v67);

            sub_233147878();
          }
          if ((v29[1] & 1) == 0)
          {
            sub_2331478A8();
            sub_2331478B4();
          }
          __asm { BR              X10 }
        }
      }
    }
LABEL_19:
    sub_233147D70();
    sub_2331478C0();
    goto LABEL_20;
  }
  return sub_233147DF4();
}

uint64_t sub_2331396B4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(*(_QWORD *)v0 + 328);
  swift_task_dealloc();

  return swift_task_switch();
}

void sub_23313970C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void (*v30)(uint64_t, uint64_t);
  id v31;
  void (*v32)(_QWORD *, _QWORD);
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int32x2_t v40;
  int32x2_t v41;
  __int128 v42;
  int32x2_t v43;
  int32x2_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  _BYTE *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  _QWORD *v62;
  _QWORD *v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  *(_BYTE *)(v0[18] + v0[40]) = 1;
  v1 = v0[31];
  v0[43] = objc_msgSend(objc_allocWithZone((Class)sub_2331478D8()), sel_init);
  sub_233146924();
  sub_233147D70();
  sub_2331478C0();
  v63 = v0;
  if (v1 == 2)
    goto LABEL_13;
  v2 = sub_233147BF0();
  v4 = v3;
  if (v2 == sub_233147BF0() && v4 == v5)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_13;
  }
  v7 = sub_233147E60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0)
  {
    v8 = sub_233147BF0();
    v10 = v9;
    if (v8 == sub_233147BF0() && v10 == v11)
      goto LABEL_9;
    v12 = sub_233147E60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) != 0)
      goto LABEL_13;
    v52 = sub_233147BF0();
    v54 = v53;
    if (v52 == sub_233147BF0() && v54 == v55)
    {
LABEL_9:
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v56 = sub_233147E60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v56 & 1) == 0)
      {
LABEL_14:
        v13 = (char *)v0 + 409;
        v14 = v0[16];
        sub_23314789C();
        v15 = *(_QWORD *)(v14 + 16);
        if (v15)
        {
          v16 = v0[24];
          v17 = (double *)v0[25];
          v59 = v0[21];
          v60 = v0[23];
          v18 = v0[16] + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
          v57 = (char *)v0 + 409;
          v58 = *(_QWORD *)(v16 + 72);
          swift_bridgeObjectRetain();
          v62 = v0 + 2;
          do
          {
            sub_233140F4C(v18, v0[25], type metadata accessor for DockAccessory.Observation);
            v19 = v0[25];
            v21 = v0[19];
            v20 = v0[20];
            v22 = v17[2];
            v23 = v17[3];
            v24 = v17[4];
            v25 = v17[5];
            v64.origin.x = v22;
            v64.origin.y = v23;
            v64.size.width = v24;
            v64.size.height = v25;
            CGRectGetMinX(v64);
            v65.origin.x = v22;
            v65.origin.y = v23;
            v65.size.width = v24;
            v65.size.height = v25;
            CGRectGetMinY(v65);
            v66.origin.x = v22;
            v66.origin.y = v23;
            v66.size.width = v24;
            v66.size.height = v25;
            CGRectGetHeight(v66);
            v67.origin.x = v22;
            v67.origin.y = v23;
            v67.size.width = v24;
            v67.size.height = v25;
            CGRectGetWidth(v67);
            v68.origin.x = v22;
            v68.origin.y = v23;
            v68.size.width = v24;
            v68.size.height = v25;
            CGRectGetHeight(v68);
            sub_23312BD5C(v19 + *(int *)(v60 + 28), v21);
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48))(v21, 1, v20) == 1)
            {
              sub_233129970(v0[19], &qword_256038D20);
            }
            else
            {
              v26 = v0[22];
              v27 = v0[19];
              v28 = v0[20];
              v29 = objc_msgSend((id)objc_opt_self(), sel_radians);
              sub_2331475E4();

              v30 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
              v30(v27, v28);
              sub_2331475D8();
              v30(v26, v28);
            }
            v31 = objc_allocWithZone((Class)sub_23314768C());
            sub_233147680();
            v32 = (void (*)(_QWORD *, _QWORD))sub_233147890();
            v34 = v33;
            MEMORY[0x234930490](v32, v33, v35, v36, v37);
            if (*(_QWORD *)((*v34 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v34 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_233147CA4();
            v0 = v63;
            v38 = v63[25];
            sub_233147CB0();
            sub_233147C98();
            v32(v62, 0);
            sub_2331416B8(v38, type metadata accessor for DockAccessory.Observation);
            v18 += v58;
            --v15;
          }
          while (v15);
          swift_bridgeObjectRelease();
          v13 = v57;
        }
        if ((*v13 & 1) == 0)
        {
          v39 = v0[36];
          v40 = (int32x2_t)v0[34];
          v41 = (int32x2_t)v63[32];
          *(_QWORD *)&v42 = v39;
          *((_QWORD *)&v42 + 1) = v0[37];
          v61 = v42;
          v43 = (int32x2_t)v63[33];
          v44 = (int32x2_t)v63[35];
          __swift_instantiateConcreteTypeFromMangledName(&qword_256039C90);
          v45 = swift_allocObject();
          *(_OWORD *)(v45 + 16) = xmmword_233149C80;
          __swift_instantiateConcreteTypeFromMangledName(&qword_256039C98);
          v46 = swift_allocObject();
          *(_OWORD *)(v46 + 16) = xmmword_233149C80;
          *(_DWORD *)(v46 + 32) = v41.i32[0];
          *(_DWORD *)(v46 + 36) = v40.i32[0];
          v0 = v63;
          *(_DWORD *)(v46 + 40) = v39;
          v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039CA0);
          *(_QWORD *)(v45 + 56) = v47;
          *(_QWORD *)(v45 + 32) = v46;
          v48 = swift_allocObject();
          *(_OWORD *)(v48 + 16) = xmmword_233149C80;
          *(int32x2_t *)(v48 + 32) = vzip2_s32(v41, v40);
          *(_DWORD *)(v48 + 40) = DWORD1(v61);
          *(_QWORD *)(v45 + 88) = v47;
          *(_QWORD *)(v45 + 64) = v48;
          v49 = swift_allocObject();
          *(_OWORD *)(v49 + 16) = xmmword_233149C80;
          *(int32x2_t *)(v49 + 32) = vzip1_s32(v43, v44);
          *(_DWORD *)(v49 + 40) = DWORD2(v61);
          *(_QWORD *)(v45 + 120) = v47;
          *(_QWORD *)(v45 + 96) = v49;
          v50 = objc_allocWithZone(MEMORY[0x24BDBCE30]);
          v51 = (void *)sub_233147C74();
          swift_bridgeObjectRelease();
          objc_msgSend(v50, sel_initWithArray_, v51);

          sub_233147878();
        }
        if ((v13[1] & 1) == 0)
        {
          sub_2331478A8();
          sub_2331478B4();
        }
        __asm { BR              X10 }
      }
    }
  }
LABEL_13:
  sub_233147D70();
  sub_2331478C0();
  goto LABEL_14;
}

uint64_t sub_23313A194()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 376) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v3 = *(void **)(v2 + 352);

  }
  return swift_task_switch();
}

uint64_t sub_23313A204()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 344);
  sub_23313A904();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313A294()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 400) = v0;
  swift_task_dealloc();
  if (!v0)

  return swift_task_switch();
}

uint64_t sub_23313A300()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 344);
  sub_23313A904();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313A388()
{
  uint64_t v0;
  void *v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;

  v1 = *(void **)(v0 + 352);
  v2 = *(void **)(v0 + 136);

  v3 = *(NSObject **)(v0 + 376);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 216) + 16))(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 144) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(_QWORD *)(v0 + 208));
  v4 = v3;
  v5 = v3;
  v6 = sub_233147B9C();
  v7 = sub_233147D4C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v3;
    v11 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 120) = v11;
    sub_233147D88();
    *v9 = v11;

    _os_log_impl(&dword_233121000, v6, v7, "caught err %@, returning public", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v9, -1, -1);
    MEMORY[0x234930B44](v8, -1, -1);
  }
  else
  {

  }
  v12 = *(void **)(v0 + 344);
  v13 = *(_QWORD *)(v0 + 224);
  v14 = *(_QWORD *)(v0 + 208);
  v15 = *(_QWORD *)(v0 + 216);

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  sub_233127120();
  swift_allocError();
  sub_23312411C(v3, v16);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313A5C0()
{
  uint64_t v0;
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;

  v1 = *(NSObject **)(v0 + 400);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 216) + 16))(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 144) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(_QWORD *)(v0 + 208));
  v2 = v1;
  v3 = v1;
  v4 = sub_233147B9C();
  v5 = sub_233147D4C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v6 = 138412290;
    v8 = v1;
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 120) = v9;
    sub_233147D88();
    *v7 = v9;

    _os_log_impl(&dword_233121000, v4, v5, "caught err %@, returning public", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v7, -1, -1);
    MEMORY[0x234930B44](v6, -1, -1);
  }
  else
  {

  }
  v10 = *(void **)(v0 + 344);
  v11 = *(_QWORD *)(v0 + 224);
  v12 = *(_QWORD *)(v0 + 208);
  v13 = *(_QWORD *)(v0 + 216);

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  sub_233127120();
  swift_allocError();
  sub_23312411C(v1, v14);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DockAccessory.track(_:cameraInformation:image:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  __int128 v10;
  _QWORD *v11;

  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_BYTE *)(a2 + 16);
  v8 = *(_BYTE *)(a2 + 80);
  v9 = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(v3 + 16) = *(_QWORD *)a2;
  *(_QWORD *)(v3 + 24) = v6;
  *(_BYTE *)(v3 + 32) = v7;
  v10 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 64) = v10;
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(v3 + 96) = v8;
  *(_OWORD *)(v3 + 104) = *(_OWORD *)(a2 + 88);
  *(_BYTE *)(v3 + 120) = v9;
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 128) = v11;
  *v11 = v3;
  v11[1] = sub_23313A88C;
  return sub_2331388BC(a1, (uint64_t *)(v3 + 16), a3);
}

{
  uint64_t v3;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  __int128 v10;
  _QWORD *v11;

  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_BYTE *)(a2 + 16);
  v8 = *(_BYTE *)(a2 + 80);
  v9 = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(v3 + 16) = *(_QWORD *)a2;
  *(_QWORD *)(v3 + 24) = v6;
  *(_BYTE *)(v3 + 32) = v7;
  v10 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 64) = v10;
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(v3 + 96) = v8;
  *(_OWORD *)(v3 + 104) = *(_OWORD *)(a2 + 88);
  *(_BYTE *)(v3 + 120) = v9;
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 128) = v11;
  *v11 = v3;
  v11[1] = sub_233138850;
  return sub_23313AB74(a1, (uint64_t *)(v3 + 16), a3);
}

uint64_t sub_23313A88C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 136) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23313A8F8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313A904()
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
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_233147CD4();
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
    sub_233129970((uint64_t)v4, &qword_256038C20);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    sub_233147CC8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v9 = sub_233147CBC();
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
  *(_QWORD *)(v12 + 16) = &unk_256039C68;
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

uint64_t sub_23313AB74(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v4 + 160) = a3;
  *(_QWORD *)(v4 + 168) = v3;
  *(_QWORD *)(v4 + 152) = a1;
  v6 = sub_233147BB4();
  *(_QWORD *)(v4 + 176) = v6;
  *(_QWORD *)(v4 + 184) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 192) = swift_task_alloc();
  v7 = swift_task_alloc();
  v8 = *a2;
  v9 = a2[1];
  *(_QWORD *)(v4 + 200) = v7;
  *(_QWORD *)(v4 + 208) = v8;
  *(_QWORD *)(v4 + 216) = v9;
  *(_BYTE *)(v4 + 65) = *((_BYTE *)a2 + 16);
  sub_233141A14((uint64_t)(a2 + 4), v4 + 16, &qword_256038CE0);
  *(_OWORD *)(v4 + 224) = *(_OWORD *)(a2 + 11);
  *(_BYTE *)(v4 + 66) = *((_BYTE *)a2 + 104);
  return swift_task_switch();
}

uint64_t sub_23313AC2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  char v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  void *v16;
  _QWORD *v17;
  uint64_t (*v18)(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void **v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void **v50;
  void *v51;
  _QWORD *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t (*v59)(void);
  uint64_t (*v60)(uint64_t, id, uint64_t, uint64_t, void *);

  if (qword_2560389A0 != -1)
    swift_once();
  v1 = qword_2560389A8;
  v2 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  v3 = *(os_unfair_lock_s **)(qword_2560389A8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  swift_release();
  v4 = *(_BYTE *)(v1 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  v5 = *(os_unfair_lock_s **)(v1 + v2);
  swift_retain();
  os_unfair_lock_unlock(v5 + 4);
  swift_release();
  if ((v4 & 1) == 0)
    return sub_233147DF4();
  v6 = *(_QWORD *)(v0 + 168);
  v7 = OBJC_IVAR____TtC7DockKit13DockAccessory__tracking;
  *(_QWORD *)(v0 + 240) = OBJC_IVAR____TtC7DockKit13DockAccessory__tracking;
  if ((*(_BYTE *)(v6 + v7) & 1) != 0)
  {
LABEL_11:
    if (*(_QWORD *)(v0 + 216) == 2)
    {
LABEL_12:
      v20 = 0;
      goto LABEL_25;
    }
    v21 = sub_233147BF0();
    v23 = v22;
    if (v21 == sub_233147BF0() && v23 == v24)
    {
      swift_bridgeObjectRelease_n();
      v20 = 3;
    }
    else
    {
      v26 = sub_233147E60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v26 & 1) != 0)
      {
        v20 = 3;
      }
      else
      {
        v27 = sub_233147BF0();
        v29 = v28;
        if (v27 == sub_233147BF0() && v29 == v30)
        {
          v20 = 2;
          swift_bridgeObjectRelease_n();
        }
        else
        {
          v31 = sub_233147E60();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v31 & 1) != 0)
          {
            v20 = 2;
          }
          else
          {
            v54 = sub_233147BF0();
            v56 = v55;
            if (v54 == sub_233147BF0() && v56 == v57)
            {
              swift_bridgeObjectRelease_n();
            }
            else
            {
              v58 = sub_233147E60();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v58 & 1) == 0)
                goto LABEL_12;
            }
            v20 = 1;
          }
        }
      }
    }
LABEL_25:
    v32 = qword_233149BF0[*(char *)(v0 + 65)];
    v33 = *(_QWORD *)(v0 + 160);
    v34 = objc_allocWithZone((Class)sub_2331478FC());
    v35 = (void *)sub_2331478F0();
    *(_QWORD *)(v0 + 264) = v35;
    v36 = *(_QWORD *)(v0 + 168);
    if (v33)
    {
      v37 = *(void **)(v0 + 160);
      v38 = (void **)(v36 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
      swift_beginAccess();
      v39 = *v38;
      *(_QWORD *)(v0 + 272) = *v38;
      if (v39)
      {
        v40 = objc_allocWithZone(MEMORY[0x24BDBF660]);
        v41 = v37;
        v39;
        v42 = objc_msgSend(v40, sel_initWithCVPixelBuffer_, v41);
        *(_QWORD *)(v0 + 280) = v42;
        v60 = (uint64_t (*)(uint64_t, id, uint64_t, uint64_t, void *))((int)*MEMORY[0x24BE2D940]
                                                                            + MEMORY[0x24BE2D940]);
        v43 = v35;
        v44 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 288) = v44;
        *v44 = v0;
        v44[1] = sub_23313B754;
        v45 = *(_QWORD *)(v0 + 152);
        v46 = v42;
        v47 = v20;
        v48 = v32;
        v49 = v35;
        return v60(v45, v46, v47, v48, v49);
      }
    }
    else
    {
      v50 = (void **)(v36 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
      swift_beginAccess();
      v51 = *v50;
      *(_QWORD *)(v0 + 304) = *v50;
      if (v51)
      {
        v60 = (uint64_t (*)(uint64_t, id, uint64_t, uint64_t, void *))((int)*MEMORY[0x24BE2D940]
                                                                            + MEMORY[0x24BE2D940]);
        v51;
        v52 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 312) = v52;
        *v52 = v0;
        v52[1] = sub_23313B834;
        v45 = *(_QWORD *)(v0 + 152);
        v46 = 0;
        v47 = v20;
        v48 = v32;
        v49 = v35;
        return v60(v45, v46, v47, v48, v49);
      }
    }
    v53 = *(void **)(v0 + 264);
    sub_23313A904();

    swift_task_dealloc();
    swift_task_dealloc();
    v18 = *(uint64_t (**)(void))(v0 + 8);
    return v18();
  }
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 184) + 16))(*(_QWORD *)(v0 + 200), v6 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(_QWORD *)(v0 + 176));
  v8 = sub_233147B9C();
  v9 = sub_233147D4C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_233121000, v8, v9, "Starting tracker", v10, 2u);
    MEMORY[0x234930B44](v10, -1, -1);
  }
  v11 = *(_QWORD *)(v0 + 200);
  v12 = *(_QWORD *)(v0 + 176);
  v13 = *(_QWORD *)(v0 + 184);
  v14 = *(_QWORD *)(v0 + 168);

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  v15 = (void **)(v14 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  v16 = *v15;
  *(_QWORD *)(v0 + 248) = *v15;
  if (!v16)
  {
    *(_BYTE *)(*(_QWORD *)(v0 + 168) + *(_QWORD *)(v0 + 240)) = 1;
    goto LABEL_11;
  }
  v59 = (uint64_t (*)(void))((int)*MEMORY[0x24BE2D918] + MEMORY[0x24BE2D918]);
  v16;
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 256) = v17;
  *v17 = v0;
  v17[1] = sub_23313B2BC;
  v18 = v59;
  return v18();
}

uint64_t sub_23313B2BC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(*(_QWORD *)v0 + 248);
  swift_task_dealloc();

  return swift_task_switch();
}

uint64_t sub_23313B314()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void **v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void **v32;
  void *v33;
  _QWORD *v34;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t (*v42)(uint64_t, id, uint64_t, uint64_t, void *);

  *(_BYTE *)(*(_QWORD *)(v0 + 168) + *(_QWORD *)(v0 + 240)) = 1;
  if (*(_QWORD *)(v0 + 216) == 2)
    goto LABEL_2;
  v2 = sub_233147BF0();
  v4 = v3;
  if (v2 == sub_233147BF0() && v4 == v5)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  v7 = sub_233147E60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
  {
LABEL_15:
    v1 = 3;
    goto LABEL_16;
  }
  v8 = sub_233147BF0();
  v10 = v9;
  if (v8 == sub_233147BF0() && v10 == v11)
  {
    v1 = 2;
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v13 = sub_233147E60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v13 & 1) != 0)
    {
      v1 = 2;
    }
    else
    {
      v37 = sub_233147BF0();
      v39 = v38;
      if (v37 == sub_233147BF0() && v39 == v40)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v41 = sub_233147E60();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v41 & 1) == 0)
        {
LABEL_2:
          v1 = 0;
          goto LABEL_16;
        }
      }
      v1 = 1;
    }
  }
LABEL_16:
  v14 = qword_233149BF0[*(char *)(v0 + 65)];
  v15 = *(_QWORD *)(v0 + 160);
  v16 = objc_allocWithZone((Class)sub_2331478FC());
  v17 = (void *)sub_2331478F0();
  *(_QWORD *)(v0 + 264) = v17;
  v18 = *(_QWORD *)(v0 + 168);
  if (v15)
  {
    v19 = *(void **)(v0 + 160);
    v20 = (void **)(v18 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
    swift_beginAccess();
    v21 = *v20;
    *(_QWORD *)(v0 + 272) = *v20;
    if (v21)
    {
      v22 = objc_allocWithZone(MEMORY[0x24BDBF660]);
      v23 = v19;
      v21;
      v24 = objc_msgSend(v22, sel_initWithCVPixelBuffer_, v23);
      *(_QWORD *)(v0 + 280) = v24;
      v42 = (uint64_t (*)(uint64_t, id, uint64_t, uint64_t, void *))((int)*MEMORY[0x24BE2D940]
                                                                          + MEMORY[0x24BE2D940]);
      v25 = v17;
      v26 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 288) = v26;
      *v26 = v0;
      v26[1] = sub_23313B754;
      v27 = *(_QWORD *)(v0 + 152);
      v28 = v24;
      v29 = v1;
      v30 = v14;
      v31 = v17;
      return v42(v27, v28, v29, v30, v31);
    }
  }
  else
  {
    v32 = (void **)(v18 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
    swift_beginAccess();
    v33 = *v32;
    *(_QWORD *)(v0 + 304) = *v32;
    if (v33)
    {
      v42 = (uint64_t (*)(uint64_t, id, uint64_t, uint64_t, void *))((int)*MEMORY[0x24BE2D940]
                                                                          + MEMORY[0x24BE2D940]);
      v33;
      v34 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 312) = v34;
      *v34 = v0;
      v34[1] = sub_23313B834;
      v27 = *(_QWORD *)(v0 + 152);
      v28 = 0;
      v29 = v1;
      v30 = v14;
      v31 = v17;
      return v42(v27, v28, v29, v30, v31);
    }
  }
  v36 = *(void **)(v0 + 264);
  sub_23313A904();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313B754()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *v1;
  *(_QWORD *)(*v1 + 296) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v4 = *(void **)(v2 + 272);
    v3 = *(void **)(v2 + 280);

  }
  return swift_task_switch();
}

uint64_t sub_23313B7D4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 264);
  sub_23313A904();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313B834()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 320) = v0;
  swift_task_dealloc();
  if (!v0)

  return swift_task_switch();
}

uint64_t sub_23313B8A0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 264);
  sub_23313A904();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313B8F8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;

  v1 = *(void **)(v0 + 272);
  v2 = *(void **)(v0 + 280);
  v3 = *(void **)(v0 + 160);

  v4 = *(NSObject **)(v0 + 296);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 184) + 16))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 168) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(_QWORD *)(v0 + 176));
  v5 = v4;
  v6 = v4;
  v7 = sub_233147B9C();
  v8 = sub_233147D4C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v4;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 144) = v12;
    sub_233147D88();
    *v10 = v12;

    _os_log_impl(&dword_233121000, v7, v8, "caught err %@, returning public", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v10, -1, -1);
    MEMORY[0x234930B44](v9, -1, -1);
  }
  else
  {

  }
  v13 = *(void **)(v0 + 264);
  v14 = *(_QWORD *)(v0 + 192);
  v15 = *(_QWORD *)(v0 + 176);
  v16 = *(_QWORD *)(v0 + 184);

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  sub_233127120();
  swift_allocError();
  sub_23312411C(v4, v17);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313BB0C()
{
  uint64_t v0;
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;

  v1 = *(NSObject **)(v0 + 320);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 184) + 16))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 168) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(_QWORD *)(v0 + 176));
  v2 = v1;
  v3 = v1;
  v4 = sub_233147B9C();
  v5 = sub_233147D4C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v6 = 138412290;
    v8 = v1;
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 144) = v9;
    sub_233147D88();
    *v7 = v9;

    _os_log_impl(&dword_233121000, v4, v5, "caught err %@, returning public", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v7, -1, -1);
    MEMORY[0x234930B44](v6, -1, -1);
  }
  else
  {

  }
  v10 = *(void **)(v0 + 264);
  v11 = *(_QWORD *)(v0 + 192);
  v12 = *(_QWORD *)(v0 + 176);
  v13 = *(_QWORD *)(v0 + 184);

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  sub_233127120();
  swift_allocError();
  sub_23312411C(v1, v14);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DockAccessory.selectSubject(at:)(double a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 + 80) = v2;
  *(double *)(v3 + 64) = a1;
  *(double *)(v3 + 72) = a2;
  v4 = sub_233147BB4();
  *(_QWORD *)(v3 + 88) = v4;
  *(_QWORD *)(v3 + 96) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 104) = swift_task_alloc();
  *(_QWORD *)(v3 + 112) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23313BE20()
{
  uint64_t v0;
  void **v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  _BYTE *v21;
  uint64_t (*v22)(void);
  uint64_t v23;
  uint64_t v24;
  os_unfair_lock_s *v25;
  int v26;
  os_unfair_lock_s *v27;
  void *v28;
  _QWORD *v29;
  _QWORD *v31;
  uint64_t v32;
  uint64_t (*v33)(double, double);
  uint64_t v34[2];

  v1 = (void **)(*(_QWORD *)(v0 + 80) + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v1)
  {
    v2 = *(_QWORD *)(v0 + 112);
    v3 = *(_QWORD *)(v0 + 88);
    v4 = *(_QWORD *)(v0 + 96);
    v5 = *(_QWORD *)(v0 + 80);
    v6 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
    *(_QWORD *)(v0 + 120) = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    *(_QWORD *)(v0 + 128) = v7;
    v7(v2, v5 + v6, v3);
    v8 = sub_233147B9C();
    v9 = sub_233147D34();
    v10 = os_log_type_enabled(v8, v9);
    v11 = *(_QWORD *)(v0 + 112);
    v12 = *(_QWORD *)(v0 + 88);
    v13 = *(_QWORD *)(v0 + 96);
    if (v10)
    {
      v32 = *(_QWORD *)(v0 + 96);
      v14 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      v34[0] = v15;
      *(_DWORD *)v14 = 136446466;
      v16 = sub_233147D28();
      *(_QWORD *)(v0 + 48) = sub_23313FD70(v16, v17, v34);
      sub_233147D88();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2082;
      v18 = sub_233147D28();
      *(_QWORD *)(v0 + 56) = sub_23313FD70(v18, v19, v34);
      sub_233147D88();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_233121000, v8, v9, "API: selectSubject: %{public}s, %{public}s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x234930B44](v15, -1, -1);
      MEMORY[0x234930B44](v14, -1, -1);

      v20 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    }
    else
    {

      v20 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    }
    v20(v11, v12);
    *(_QWORD *)(v0 + 136) = v20;
    if (qword_2560389A0 != -1)
      swift_once();
    v23 = qword_2560389A8;
    v24 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
    v25 = *(os_unfair_lock_s **)(qword_2560389A8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
    swift_retain();
    os_unfair_lock_lock(v25 + 4);
    swift_release();
    v26 = *(unsigned __int8 *)(v23 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
    v27 = *(os_unfair_lock_s **)(v23 + v24);
    swift_retain();
    os_unfair_lock_unlock(v27 + 4);
    swift_release();
    if (v26 != 1)
    {
      *(_QWORD *)(v0 + 168) = objc_msgSend(objc_allocWithZone((Class)sub_23314774C()), sel_init);
      v31 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 176) = v31;
      *v31 = v0;
      v31[1] = sub_23313C294;
      return sub_2331476EC();
    }
    v28 = *v1;
    *(_QWORD *)(v0 + 144) = *v1;
    if (v28)
    {
      v33 = (uint64_t (*)(double, double))((int)*MEMORY[0x24BE2D920] + MEMORY[0x24BE2D920]);
      v28;
      v29 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 152) = v29;
      *v29 = v0;
      v29[1] = sub_23313C20C;
      return v33(*(double *)(v0 + 64), *(double *)(v0 + 72));
    }
    swift_task_dealloc();
    swift_task_dealloc();
    v22 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    sub_233127120();
    swift_allocError();
    *v21 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    v22 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v22();
}

uint64_t sub_23313C20C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 160) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23313C294()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23313C2F8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313C33C()
{
  uint64_t v0;
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  NSObject *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;

  v1 = *(NSObject **)(v0 + 160);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 128))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80) + *(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 88));
  v2 = v1;
  v3 = v1;
  v4 = sub_233147B9C();
  v5 = sub_233147D4C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v6 = 138412290;
    v8 = v1;
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v9;
    sub_233147D88();
    *v7 = v9;

    _os_log_impl(&dword_233121000, v4, v5, "caught err %@, returning public", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v7, -1, -1);
    MEMORY[0x234930B44](v6, -1, -1);
  }
  else
  {

  }
  v10 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
  v11 = *(_QWORD *)(v0 + 104);
  v12 = *(_QWORD *)(v0 + 88);

  v10(v11, v12);
  sub_233127120();
  swift_allocError();
  sub_23312411C(v1, v13);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313C52C()
{
  uint64_t v0;
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  NSObject *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;

  v1 = *(NSObject **)(v0 + 184);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 128))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80) + *(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 88));
  v2 = v1;
  v3 = v1;
  v4 = sub_233147B9C();
  v5 = sub_233147D4C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v6 = 138412290;
    v8 = v1;
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v9;
    sub_233147D88();
    *v7 = v9;

    _os_log_impl(&dword_233121000, v4, v5, "caught err %@, returning public", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v7, -1, -1);
    MEMORY[0x234930B44](v6, -1, -1);
  }
  else
  {

  }
  v10 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
  v11 = *(_QWORD *)(v0 + 104);
  v12 = *(_QWORD *)(v0 + 88);

  v10(v11, v12);
  sub_233127120();
  swift_allocError();
  sub_23312411C(v1, v13);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DockAccessory.selectSubjects(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[7] = a1;
  v2[8] = v1;
  v3 = sub_233147674();
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v4 = sub_233147BB4();
  v2[12] = v4;
  v2[13] = *(_QWORD *)(v4 - 8);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23313C7B4()
{
  _QWORD *v0;
  void **v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  _BYTE *v22;
  uint64_t (*v23)(void);
  uint64_t v24;
  uint64_t v25;
  os_unfair_lock_s *v26;
  int v27;
  os_unfair_lock_s *v28;
  void *v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  id v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t (*v73)(uint64_t);
  uint64_t v74;

  v1 = (void **)(v0[8] + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (!*v1)
  {
    sub_233127120();
    swift_allocError();
    *v22 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
  v2 = v0 + 7;
  v3 = v0[15];
  v4 = v0[12];
  v5 = v0[13];
  v6 = v0[8];
  v7 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  v0[16] = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v0[17] = v8;
  v8(v3, v6 + v7, v4);
  swift_bridgeObjectRetain_n();
  v9 = sub_233147B9C();
  v10 = sub_233147D34();
  v11 = os_log_type_enabled(v9, v10);
  v12 = v0[15];
  v13 = v0[12];
  v14 = v0[13];
  v72 = v0;
  if (v11)
  {
    v65 = v0[9];
    v69 = v0[15];
    v67 = v0[12];
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v74 = v16;
    *(_DWORD *)v15 = 136315138;
    v17 = swift_bridgeObjectRetain();
    v18 = MEMORY[0x2349304B4](v17, v65);
    v66 = v14;
    v20 = v19;
    swift_bridgeObjectRelease();
    v0[6] = sub_23313FD70(v18, v20, &v74);
    sub_233147D88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_233121000, v9, v10, "API: selectSubjects: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v16, -1, -1);
    MEMORY[0x234930B44](v15, -1, -1);

    v21 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
    v21(v69, v67);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    v21 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v21(v12, v13);
  }
  v0[18] = v21;
  if (qword_2560389A0 != -1)
    swift_once();
  v24 = qword_2560389A8;
  v25 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  v26 = *(os_unfair_lock_s **)(qword_2560389A8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v26 + 4);
  swift_release();
  v27 = *(unsigned __int8 *)(v24 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  v28 = *(os_unfair_lock_s **)(v24 + v25);
  swift_retain();
  os_unfair_lock_unlock(v28 + 4);
  swift_release();
  if (v27 == 1)
  {
    v29 = *v1;
    if (*v1)
    {
      v30 = *v2;
      v31 = *(_QWORD *)(*v2 + 16);
      if (v31)
      {
        v32 = v0[10];
        v74 = MEMORY[0x24BEE4AF8];
        v68 = v29;
        sub_2331403CC(0, v31, 0);
        v33 = v30 + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
        v70 = *(_QWORD *)(v32 + 72);
        v34 = v32;
        v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16);
        do
        {
          v36 = v0[11];
          v37 = v0[9];
          v35(v36, v33, v37);
          v38 = sub_23314765C();
          v40 = v39;
          (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v36, v37);
          v41 = v74;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2331403CC(0, *(_QWORD *)(v41 + 16) + 1, 1);
            v41 = v74;
          }
          v43 = *(_QWORD *)(v41 + 16);
          v42 = *(_QWORD *)(v41 + 24);
          if (v43 >= v42 >> 1)
          {
            sub_2331403CC(v42 > 1, v43 + 1, 1);
            v41 = v74;
          }
          *(_QWORD *)(v41 + 16) = v43 + 1;
          v44 = v41 + 16 * v43;
          *(_QWORD *)(v44 + 32) = v38;
          *(_QWORD *)(v44 + 40) = v40;
          v0 = v72;
          v33 += v70;
          --v31;
        }
        while (v31);
        v63 = v68;
      }
      else
      {
        v63 = v29;
        v41 = MEMORY[0x24BEE4AF8];
      }
      v0[19] = v63;
      v0[20] = v41;
      v73 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x24BE2D930] + MEMORY[0x24BE2D930]);
      v64 = (_QWORD *)swift_task_alloc();
      v0[21] = v64;
      *v64 = v0;
      v64[1] = sub_23313CDF0;
      return v73(v41);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
  v45 = v0[7];
  v0[23] = objc_msgSend(objc_allocWithZone((Class)sub_23314774C()), sel_init);
  v46 = *(_QWORD *)(v45 + 16);
  v47 = MEMORY[0x24BEE4AF8];
  if (v46)
  {
    v48 = v0[10];
    v49 = v0[7];
    v74 = MEMORY[0x24BEE4AF8];
    sub_2331403CC(0, v46, 0);
    v50 = v49 + ((*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80));
    v71 = *(_QWORD *)(v48 + 72);
    v51 = v48;
    v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16);
    do
    {
      v53 = v0[11];
      v54 = v0[9];
      v52(v53, v50, v54);
      v55 = sub_23314765C();
      v57 = v56;
      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v53, v54);
      v47 = v74;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2331403CC(0, *(_QWORD *)(v47 + 16) + 1, 1);
        v47 = v74;
      }
      v59 = *(_QWORD *)(v47 + 16);
      v58 = *(_QWORD *)(v47 + 24);
      if (v59 >= v58 >> 1)
      {
        sub_2331403CC(v58 > 1, v59 + 1, 1);
        v47 = v74;
      }
      *(_QWORD *)(v47 + 16) = v59 + 1;
      v60 = v47 + 16 * v59;
      *(_QWORD *)(v60 + 32) = v55;
      *(_QWORD *)(v60 + 40) = v57;
      v0 = v72;
      v50 += v71;
      --v46;
    }
    while (v46);
  }
  v0[24] = v47;
  v61 = (_QWORD *)swift_task_alloc();
  v0[25] = v61;
  *v61 = v0;
  v61[1] = sub_23313CE88;
  return sub_233147704();
}

uint64_t sub_23313CDF0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 176) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v4 = *(void **)(v2 + 152);
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23313CE88()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23313CEF4()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313CF44()
{
  uint64_t v0;
  NSObject *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  NSObject *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  char *v18;

  v1 = *(NSObject **)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 128);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 136);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRelease();
  v2(v4, v6 + v3, v5);
  v7 = v1;
  v8 = v1;
  v9 = sub_233147B9C();
  v10 = sub_233147D4C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v11 = 138412290;
    v13 = v1;
    v14 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v14;
    sub_233147D88();
    *v12 = v14;

    _os_log_impl(&dword_233121000, v9, v10, "caught err %@, returning public", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v12, -1, -1);
    MEMORY[0x234930B44](v11, -1, -1);
  }
  else
  {

  }
  v15 = *(void (**)(uint64_t, uint64_t))(v0 + 144);
  v16 = *(_QWORD *)(v0 + 112);
  v17 = *(_QWORD *)(v0 + 96);

  v15(v16, v17);
  sub_233127120();
  swift_allocError();
  sub_23312411C(v1, v18);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313D150()
{
  uint64_t v0;
  NSObject *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  NSObject *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  char *v18;

  v1 = *(NSObject **)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 128);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 136);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRelease();
  v2(v4, v6 + v3, v5);
  v7 = v1;
  v8 = v1;
  v9 = sub_233147B9C();
  v10 = sub_233147D4C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v11 = 138412290;
    v13 = v1;
    v14 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v14;
    sub_233147D88();
    *v12 = v14;

    _os_log_impl(&dword_233121000, v9, v10, "caught err %@, returning public", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v12, -1, -1);
    MEMORY[0x234930B44](v11, -1, -1);
  }
  else
  {

  }
  v15 = *(void (**)(uint64_t, uint64_t))(v0 + 144);
  v16 = *(_QWORD *)(v0 + 112);
  v17 = *(_QWORD *)(v0 + 96);

  v15(v16, v17);
  sub_233127120();
  swift_allocError();
  sub_23312411C(v1, v18);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DockAccessory.setFramingMode(_:)(_BYTE *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  *(_QWORD *)(v2 + 56) = v1;
  v4 = sub_233147BB4();
  *(_QWORD *)(v2 + 64) = v4;
  *(_QWORD *)(v2 + 72) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 80) = swift_task_alloc();
  *(_QWORD *)(v2 + 88) = swift_task_alloc();
  *(_BYTE *)(v2 + 145) = *a1;
  return swift_task_switch();
}

uint64_t sub_23313D3D8()
{
  uint64_t v0;
  id *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  NSObject *v8;
  os_log_type_t v9;
  char v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  _BYTE *v16;
  uint64_t (*v17)(void);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  os_unfair_lock_s *v23;
  int v24;
  os_unfair_lock_s *v25;
  id v26;
  char v27;
  uint64_t v28;
  os_unfair_lock_s *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v1 = (id *)(*(_QWORD *)(v0 + 56) + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v1)
  {
    v2 = *(_QWORD *)(v0 + 88);
    v3 = *(_QWORD *)(v0 + 64);
    v4 = *(_QWORD *)(v0 + 72);
    v5 = *(_QWORD *)(v0 + 56);
    v6 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
    *(_QWORD *)(v0 + 96) = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    *(_QWORD *)(v0 + 104) = v7;
    v7(v2, v5 + v6, v3);
    v8 = sub_233147B9C();
    v9 = sub_233147D34();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = *(_BYTE *)(v0 + 145);
      v35 = *(_QWORD *)(v0 + 72);
      v36 = *(_QWORD *)(v0 + 64);
      v37 = *(_QWORD *)(v0 + 88);
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v38 = v12;
      *(_DWORD *)v11 = 136446210;
      *(_BYTE *)(v0 + 144) = v10;
      v13 = sub_233147BFC();
      *(_QWORD *)(v0 + 48) = sub_23313FD70(v13, v14, &v38);
      sub_233147D88();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_233121000, v8, v9, "API: setFramingMode: %{public}s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x234930B44](v12, -1, -1);
      MEMORY[0x234930B44](v11, -1, -1);

      v15 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
      v15(v37, v36);
    }
    else
    {
      v18 = *(_QWORD *)(v0 + 88);
      v19 = *(_QWORD *)(v0 + 64);
      v20 = *(_QWORD *)(v0 + 72);

      v15 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
      v15(v18, v19);
    }
    *(_QWORD *)(v0 + 112) = v15;
    if (qword_2560389A0 != -1)
      swift_once();
    v21 = qword_2560389A8;
    v22 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
    v23 = *(os_unfair_lock_s **)(qword_2560389A8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
    swift_retain();
    os_unfair_lock_lock(v23 + 4);
    swift_release();
    v24 = *(unsigned __int8 *)(v21 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
    v25 = *(os_unfair_lock_s **)(v21 + v22);
    swift_retain();
    os_unfair_lock_unlock(v25 + 4);
    swift_release();
    if (v24 != 1)
    {
      *(_QWORD *)(v0 + 120) = objc_msgSend(objc_allocWithZone((Class)sub_23314774C()), sel_init);
      v33 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 128) = v33;
      *v33 = v0;
      v33[1] = sub_23313D7F0;
      return sub_233147710();
    }
    if (*v1)
    {
      v26 = *v1;
      sub_233147830();

    }
    v27 = *(_BYTE *)(v0 + 145);
    v28 = *(_QWORD *)(v0 + 56);
    v29 = *(os_unfair_lock_s **)(v28 + OBJC_IVAR____TtC7DockKit13DockAccessory__framingModeLock);
    v30 = swift_task_alloc();
    *(_QWORD *)(v30 + 16) = v28;
    *(_BYTE *)(v30 + 24) = v27;
    v31 = swift_task_alloc();
    *(_QWORD *)(v31 + 16) = sub_233141A58;
    *(_QWORD *)(v31 + 24) = v30;
    swift_retain();
    os_unfair_lock_lock(v29 + 4);
    sub_233126DEC(v32, *(uint64_t (**)(void))(v31 + 16));
    os_unfair_lock_unlock(v29 + 4);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v17 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    sub_233127120();
    swift_allocError();
    *v16 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    v17 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v17();
}

uint64_t sub_23313D7F0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23313D854()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_BYTE *)(v0 + 145);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(os_unfair_lock_s **)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory__framingModeLock);
  v5 = swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v3;
  *(_BYTE *)(v5 + 24) = v2;
  v6 = swift_task_alloc();
  *(_QWORD *)(v6 + 16) = sub_233141A58;
  *(_QWORD *)(v6 + 24) = v5;
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  sub_233126DEC(v7, *(uint64_t (**)(void))(v6 + 16));
  os_unfair_lock_unlock(v4 + 4);
  if (v1)
    return swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313D94C()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  char *v21;

  v1 = *(void **)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 96);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 104);
  v4 = *(_QWORD *)(v0 + 80);
  v6 = *(_QWORD *)(v0 + 56);
  v5 = *(_QWORD *)(v0 + 64);

  v2(v4, v6 + v3, v5);
  v7 = v1;
  v8 = v1;
  v9 = sub_233147B9C();
  v10 = sub_233147D4C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(void **)(v0 + 136);
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138412290;
    v14 = v11;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v15;
    sub_233147D88();
    *v13 = v15;

    _os_log_impl(&dword_233121000, v9, v10, "caught err %@, returning public", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v13, -1, -1);
    MEMORY[0x234930B44](v12, -1, -1);
  }
  else
  {
    v16 = *(void **)(v0 + 136);

  }
  v17 = *(NSObject **)(v0 + 136);
  v18 = *(void (**)(uint64_t, uint64_t))(v0 + 112);
  v19 = *(_QWORD *)(v0 + 80);
  v20 = *(_QWORD *)(v0 + 64);

  v18(v19, v20);
  sub_233127120();
  swift_allocError();
  sub_23312411C(v17, v21);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DockAccessory.setRegionOfInterest(_:)(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v5 + 112) = v4;
  *(double *)(v5 + 96) = a3;
  *(double *)(v5 + 104) = a4;
  *(double *)(v5 + 80) = a1;
  *(double *)(v5 + 88) = a2;
  v6 = sub_233147BB4();
  *(_QWORD *)(v5 + 120) = v6;
  *(_QWORD *)(v5 + 128) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 136) = swift_task_alloc();
  *(_QWORD *)(v5 + 144) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23313DBC8()
{
  uint64_t v0;
  id *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  os_unfair_lock_s *v27;
  int v28;
  os_unfair_lock_s *v29;
  id v30;
  _QWORD *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  os_unfair_lock_s *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(void);
  uint64_t v41;
  __int128 v42;
  uint64_t v43[2];

  v1 = (id *)(*(_QWORD *)(v0 + 112) + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v1)
  {
    v2 = *(_QWORD *)(v0 + 144);
    v3 = *(_QWORD *)(v0 + 120);
    v4 = *(_QWORD *)(v0 + 128);
    v5 = *(_QWORD *)(v0 + 112);
    v6 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
    *(_QWORD *)(v0 + 152) = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    *(_QWORD *)(v0 + 160) = v7;
    v7(v2, v5 + v6, v3);
    v8 = sub_233147B9C();
    v9 = sub_233147D34();
    v10 = os_log_type_enabled(v8, v9);
    v11 = *(_QWORD *)(v0 + 144);
    v12 = *(_QWORD *)(v0 + 120);
    v13 = *(_QWORD *)(v0 + 128);
    if (v10)
    {
      v14 = swift_slowAlloc();
      v41 = swift_slowAlloc();
      v43[0] = v41;
      *(_DWORD *)v14 = 136446978;
      v15 = sub_233147D28();
      *(_QWORD *)(v0 + 48) = sub_23313FD70(v15, v16, v43);
      sub_233147D88();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2082;
      v17 = sub_233147D28();
      *(_QWORD *)(v0 + 56) = sub_23313FD70(v17, v18, v43);
      sub_233147D88();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 22) = 2082;
      v19 = sub_233147D28();
      *(_QWORD *)(v0 + 64) = sub_23313FD70(v19, v20, v43);
      sub_233147D88();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 32) = 2082;
      v21 = sub_233147D28();
      *(_QWORD *)(v0 + 72) = sub_23313FD70(v21, v22, v43);
      sub_233147D88();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_233121000, v8, v9, "API: setRegionOfInterest: %{public}s, %{public}s, %{public}s, %{public}s", (uint8_t *)v14, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x234930B44](v41, -1, -1);
      MEMORY[0x234930B44](v14, -1, -1);

    }
    else
    {

    }
    v23 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v23(v11, v12);
    *(_QWORD *)(v0 + 168) = v23;
    if (qword_2560389A0 != -1)
      swift_once();
    v25 = qword_2560389A8;
    v26 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
    v27 = *(os_unfair_lock_s **)(qword_2560389A8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
    swift_retain();
    os_unfair_lock_lock(v27 + 4);
    swift_release();
    v28 = *(unsigned __int8 *)(v25 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
    v29 = *(os_unfair_lock_s **)(v25 + v26);
    swift_retain();
    os_unfair_lock_unlock(v29 + 4);
    swift_release();
    if (v28 != 1)
    {
      *(_QWORD *)(v0 + 176) = objc_msgSend(objc_allocWithZone((Class)sub_23314774C()), sel_init);
      v31 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 184) = v31;
      *v31 = v0;
      v31[1] = sub_23313E27C;
      return sub_233147728();
    }
    if (*v1)
    {
      v30 = *v1;
      sub_233147824();

    }
    v33 = *(_QWORD *)(v0 + 112);
    v35 = *(_QWORD *)(v0 + 96);
    v34 = *(_QWORD *)(v0 + 104);
    v42 = *(_OWORD *)(v0 + 80);
    v36 = *(os_unfair_lock_s **)(v33 + OBJC_IVAR____TtC7DockKit13DockAccessory__roiLock);
    v37 = swift_task_alloc();
    *(_QWORD *)(v37 + 16) = v33;
    *(_OWORD *)(v37 + 24) = v42;
    *(_QWORD *)(v37 + 40) = v35;
    *(_QWORD *)(v37 + 48) = v34;
    v38 = swift_task_alloc();
    *(_QWORD *)(v38 + 16) = sub_233141A70;
    *(_QWORD *)(v38 + 24) = v37;
    swift_retain();
    os_unfair_lock_lock(v36 + 4);
    sub_233126DEC(v39, *(uint64_t (**)(void))(v38 + 16));
    os_unfair_lock_unlock(v36 + 4);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v40 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    sub_233127120();
    swift_allocError();
    *v24 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    v40 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v40();
}

uint64_t sub_23313E27C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 192) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23313E2E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 104);
  v10 = *(_OWORD *)(v0 + 80);
  v5 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC7DockKit13DockAccessory__roiLock);
  v6 = swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v2;
  *(_OWORD *)(v6 + 24) = v10;
  *(_QWORD *)(v6 + 40) = v4;
  *(_QWORD *)(v6 + 48) = v3;
  v7 = swift_task_alloc();
  *(_QWORD *)(v7 + 16) = sub_233141A70;
  *(_QWORD *)(v7 + 24) = v6;
  swift_retain();
  os_unfair_lock_lock(v5 + 4);
  sub_233126DEC(v8, *(uint64_t (**)(void))(v7 + 16));
  os_unfair_lock_unlock(v5 + 4);
  if (v1)
    return swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313E3F4()
{
  uint64_t v0;
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  NSObject *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;

  v1 = *(NSObject **)(v0 + 192);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 160))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 112) + *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 120));
  v2 = v1;
  v3 = v1;
  v4 = sub_233147B9C();
  v5 = sub_233147D4C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v6 = 138412290;
    v8 = v1;
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v9;
    sub_233147D88();
    *v7 = v9;

    _os_log_impl(&dword_233121000, v4, v5, "caught err %@, returning public", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v7, -1, -1);
    MEMORY[0x234930B44](v6, -1, -1);
  }
  else
  {

  }
  v10 = *(void (**)(uint64_t, uint64_t))(v0 + 168);
  v11 = *(_QWORD *)(v0 + 136);
  v12 = *(_QWORD *)(v0 + 120);

  v10(v11, v12);
  sub_233127120();
  swift_allocError();
  sub_23312411C(v1, v13);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DockAccessory.animate(motion:)(_BYTE *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 104) = v1;
  v4 = sub_233147968();
  *(_QWORD *)(v2 + 112) = v4;
  *(_QWORD *)(v2 + 120) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 128) = swift_task_alloc();
  v5 = sub_233147BB4();
  *(_QWORD *)(v2 + 136) = v5;
  *(_QWORD *)(v2 + 144) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 152) = swift_task_alloc();
  *(_QWORD *)(v2 + 160) = swift_task_alloc();
  *(_QWORD *)(v2 + 168) = swift_task_alloc();
  *(_QWORD *)(v2 + 176) = swift_task_alloc();
  v6 = sub_233147650();
  *(_QWORD *)(v2 + 184) = v6;
  *(_QWORD *)(v2 + 192) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v2 + 200) = swift_task_alloc();
  *(_BYTE *)(v2 + 305) = *a1;
  return swift_task_switch();
}

uint64_t sub_23313E6C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  char v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(void);

  if (qword_2560389A0 != -1)
    swift_once();
  v1 = qword_2560389A8;
  v2 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  v3 = *(os_unfair_lock_s **)(qword_2560389A8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  swift_release();
  v4 = *(_BYTE *)(v1 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  v5 = *(os_unfair_lock_s **)(v1 + v2);
  swift_retain();
  os_unfair_lock_unlock(v5 + 4);
  swift_release();
  if ((v4 & 1) == 0)
    return sub_233147DF4();
  v6 = v0[13];
  v7 = OBJC_IVAR____TtC7DockKit13DockAccessory__animateCommandLock;
  v0[26] = OBJC_IVAR____TtC7DockKit13DockAccessory__animateCommandLock;
  v0[27] = *(_QWORD *)(v6 + v7);
  v10 = (uint64_t (*)(void))((int)*MEMORY[0x24BE5B538] + MEMORY[0x24BE5B538]);
  swift_retain();
  v8 = (_QWORD *)swift_task_alloc();
  v0[28] = v8;
  *v8 = v0;
  v8[1] = sub_23313E83C;
  return v10();
}

uint64_t sub_23313E83C()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23313E898()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = v0[24];
  v1 = v0[25];
  v3 = v0[23];
  v4 = v0[13];
  v5 = v4 + OBJC_IVAR____TtC7DockKit13DockAccessory__lastAnimateCommandTime;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  sub_23314762C();
  v7 = v6;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v8 = 1.0 / *(double *)(v4 + OBJC_IVAR____TtC7DockKit13DockAccessory__maxAnimateFrequency);
  v9 = v0[13];
  if (fabs(v7) >= v8)
  {
    v18 = v0[25];
    v19 = v0[26];
    v20 = v0[23];
    v21 = v0[24];
    sub_233147644();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 40))(v5, v18, v20);
    swift_endAccess();
    v0[30] = *(_QWORD *)(v9 + v19);
    sub_233147B84();
    sub_233127808(&qword_256038F30, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B550], MEMORY[0x24BE5B560]);
    swift_retain();
    sub_233147CBC();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v0[18] + 16))(v0[22], v9 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v0[17]);
    v10 = sub_233147B9C();
    v11 = sub_233147D34();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_233121000, v10, v11, "rate limiting animate", v12, 2u);
      MEMORY[0x234930B44](v12, -1, -1);
    }
    v13 = v0[26];
    v14 = v0[22];
    v15 = v0[17];
    v16 = v0[18];
    v17 = v0[13];

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
    v0[29] = *(_QWORD *)(v17 + v13);
    sub_233147B84();
    sub_233127808(&qword_256038F30, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B550], MEMORY[0x24BE5B560]);
    swift_retain();
    sub_233147CBC();
  }
  return swift_task_switch();
}

uint64_t sub_23313EAFC()
{
  sub_233147B6C();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23313EB40()
{
  uint64_t v0;
  _BYTE *v1;

  sub_233127120();
  swift_allocError();
  *v1 = 7;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313EBEC()
{
  sub_233147B6C();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23313EC30()
{
  uint64_t v0;
  id *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_QWORD, uint64_t, uint64_t);
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  char v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  char v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(_QWORD);
  uint64_t v36;

  v1 = (id *)(*(_QWORD *)(v0 + 104) + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (!*v1)
  {
    v18 = 1;
LABEL_9:
    sub_233127120();
    swift_allocError();
    *v25 = v18;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = *v1;
  v5 = sub_233147848();

  v6 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  *(_QWORD *)(v0 + 248) = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  v7 = v3 + v6;
  v8 = *(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 16);
  *(_QWORD *)(v0 + 256) = v8;
  v9 = *(_QWORD *)(v0 + 136);
  if ((v5 & 1) == 0)
  {
    v8(*(_QWORD *)(v0 + 168), v7, v9);
    v19 = sub_233147B9C();
    v20 = sub_233147D4C();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_233121000, v19, v20, "Tracking button off, motors disabled", v21, 2u);
      MEMORY[0x234930B44](v21, -1, -1);
    }
    v22 = *(_QWORD *)(v0 + 168);
    v23 = *(_QWORD *)(v0 + 136);
    v24 = *(_QWORD *)(v0 + 144);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
    v18 = 2;
    goto LABEL_9;
  }
  v8(*(_QWORD *)(v0 + 160), v7, v9);
  v10 = sub_233147B9C();
  v11 = sub_233147D34();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = *(_BYTE *)(v0 + 305);
    v32 = *(_QWORD *)(v0 + 144);
    v33 = *(_QWORD *)(v0 + 136);
    v34 = *(_QWORD *)(v0 + 160);
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v36 = v14;
    *(_DWORD *)v13 = 136446210;
    *(_BYTE *)(v0 + 304) = v12;
    v15 = sub_233147BFC();
    *(_QWORD *)(v0 + 96) = sub_23313FD70(v15, v16, &v36);
    sub_233147D88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_233121000, v10, v11, "API: animate: %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v14, -1, -1);
    MEMORY[0x234930B44](v13, -1, -1);

    v17 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v17(v34, v33);
  }
  else
  {
    v27 = *(_QWORD *)(v0 + 160);
    v28 = *(_QWORD *)(v0 + 136);
    v29 = *(_QWORD *)(v0 + 144);

    v17 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
    v17(v27, v28);
  }
  *(_QWORD *)(v0 + 264) = v17;
  result = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 104))(*(_QWORD *)(v0 + 128), **((unsigned int **)&unk_250461720 + *(char *)(v0 + 305)), *(_QWORD *)(v0 + 112));
  v30 = *v1;
  *(_QWORD *)(v0 + 272) = *v1;
  if (v30)
  {
    v35 = (uint64_t (*)(_QWORD))((int)*MEMORY[0x24BE2D958] + MEMORY[0x24BE2D958]);
    v30;
    v31 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 280) = v31;
    *v31 = v0;
    v31[1] = sub_23313EFE4;
    return v35(*(_QWORD *)(v0 + 128));
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23313EFE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 288) = v1;
  swift_task_dealloc();

  if (!v1)
    *(_QWORD *)(v4 + 296) = a1;
  return swift_task_switch();
}

uint64_t sub_23313F060()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 296));
}

uint64_t sub_23313F0F0()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint8_t *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  char *v20;

  v1 = *(void **)(v0 + 288);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 256);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_QWORD *)(v0 + 136);
  v5 = *(_QWORD *)(v0 + 104) + *(_QWORD *)(v0 + 248);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
  v2(v3, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_233147B9C();
  v9 = sub_233147D4C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(void **)(v0 + 288);
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v11 = 138412290;
    v13 = v10;
    v14 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 88) = v14;
    sub_233147D88();
    *v12 = v14;

    _os_log_impl(&dword_233121000, v8, v9, "caught err %@, returning public", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560389E0);
    swift_arrayDestroy();
    MEMORY[0x234930B44](v12, -1, -1);
    MEMORY[0x234930B44](v11, -1, -1);
  }
  else
  {
    v15 = *(void **)(v0 + 288);

  }
  v16 = *(NSObject **)(v0 + 288);
  v17 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
  v18 = *(_QWORD *)(v0 + 152);
  v19 = *(_QWORD *)(v0 + 136);

  v17(v18, v19);
  sub_233127120();
  swift_allocError();
  sub_23312411C(v16, v20);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313F32C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[12] = a4;
  v5 = sub_233147BB4();
  v4[13] = v5;
  v4[14] = *(_QWORD *)(v5 - 8);
  v4[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  v4[16] = swift_task_alloc();
  v6 = sub_233147650();
  v4[17] = v6;
  v4[18] = *(_QWORD *)(v6 - 8);
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23313F3E8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v1 = v0[12];
  v2 = OBJC_IVAR____TtC7DockKit13DockAccessory_trackingSummaryLock;
  v0[21] = OBJC_IVAR____TtC7DockKit13DockAccessory_trackingSummaryLock;
  v0[22] = *(_QWORD *)(v1 + v2);
  v5 = (uint64_t (*)(void))((int)*MEMORY[0x24BE2DCE8] + MEMORY[0x24BE2DCE8]);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[23] = v3;
  *v3 = v0;
  v3[1] = sub_23313F468;
  return v5();
}

uint64_t sub_23313F468(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 208) = a1;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23313F4CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  id v30;
  char *v31;
  void *v32;
  void *v33;
  char *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;

  if (*(_BYTE *)(v0 + 208) != 1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v2 = *(_QWORD *)(v0 + 152);
  v1 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 144);
  v5 = *(_QWORD *)(v0 + 96);
  sub_233147638();
  v6 = v5 + OBJC_IVAR____TtC7DockKit13DockAccessory_lastSummaryPublishTime;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v6, v3);
  sub_233147620();
  v8 = v7;
  v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v9(v2, v3);
  v9(v1, v3);
  if (v8 <= 0.05)
    goto LABEL_19;
  v10 = *(_QWORD *)(v0 + 160);
  v11 = *(_QWORD *)(v0 + 136);
  v12 = *(_QWORD *)(v0 + 144);
  v13 = *(_QWORD *)(v0 + 96);
  sub_233147638();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 40))(v6, v10, v11);
  swift_endAccess();
  v14 = (id *)(v13 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (!*v14)
  {
LABEL_8:
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 112) + 16))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 96) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(_QWORD *)(v0 + 104));
    v18 = sub_233147B9C();
    v19 = sub_233147D4C();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_233121000, v18, v19, "no summary", v20, 2u);
      MEMORY[0x234930B44](v20, -1, -1);
    }
    v21 = *(_QWORD *)(v0 + 168);
    v23 = *(_QWORD *)(v0 + 112);
    v22 = *(_QWORD *)(v0 + 120);
    v25 = *(_QWORD *)(v0 + 96);
    v24 = *(_QWORD *)(v0 + 104);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    *(_QWORD *)(v0 + 192) = *(_QWORD *)(v25 + v21);
    sub_233147B60();
    sub_233127808(&qword_256039C78, (uint64_t (*)(uint64_t))MEMORY[0x24BE2DD00], MEMORY[0x24BE2DD10]);
    swift_retain();
    sub_233147CBC();
    return swift_task_switch();
  }
  v15 = *v14;
  sub_233147800();
  sub_233147B90();
  swift_release();
  if (!*(_QWORD *)(v0 + 88))
  {
LABEL_7:

    goto LABEL_8;
  }
  v16 = sub_233147AD0();
  if (v17 >> 60 == 15)
  {
    swift_release();
    goto LABEL_7;
  }
  v27 = v16;
  v28 = v17;
  v29 = *(void **)(*(_QWORD *)(v0 + 96) + OBJC_IVAR____TtC7DockKit13DockAccessory_helper);
  if (!v29)
  {

    swift_release();
    sub_23314690C(v27, v28);
    goto LABEL_19;
  }
  v30 = v15;
  v31 = v29;
  v32 = (void *)sub_233147770();

  v33 = (void *)sub_2331475FC();
  v34 = &v31[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand];
  v35 = (void *)MEMORY[0x234930BD4](&v31[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand]);

  if (!v35)
  {
LABEL_17:

    swift_release();
    sub_23314690C(v27, v28);

LABEL_19:
    *(_QWORD *)(v0 + 200) = *(_QWORD *)(*(_QWORD *)(v0 + 96) + *(_QWORD *)(v0 + 168));
    sub_233147B60();
    sub_233127808(&qword_256039C78, (uint64_t (*)(uint64_t))MEMORY[0x24BE2DD00], MEMORY[0x24BE2DD10]);
    swift_retain();
    sub_233147CBC();
    return swift_task_switch();
  }
  result = MEMORY[0x234930BD4](v34);
  if (result)
  {
    v36 = (void *)result;
    v37 = (void *)sub_233147770();

    sub_2331476C8();
    LOBYTE(v36) = sub_233147D64();

    if ((v36 & 1) != 0)
    {
      v38 = *(_QWORD *)(v0 + 128);
      v39 = sub_233147608();
      v43 = v40;
      v44 = v39;
      v41 = sub_233147CD4();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v38, 1, 1, v41);
      v42 = (_QWORD *)swift_allocObject();
      v42[2] = 0;
      v42[3] = 0;
      v42[4] = v31;
      v42[5] = v44;
      v42[6] = v43;
      v31 = v31;
      sub_233129DC4(v38, (uint64_t)&unk_256039C80, (uint64_t)v42);
      swift_release();
    }
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_23313F998()
{
  uint64_t v0;

  sub_233147B48();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23313F9FC()
{
  uint64_t v0;

  sub_233147B48();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DockAccessory.hashValue.getter()
{
  sub_233147E9C();
  sub_233147EA8();
  type metadata accessor for DockAccessory.Identifier(0);
  sub_233147674();
  sub_233127808(&qword_256038CD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_233147BC0();
  return sub_233147ECC();
}

unint64_t sub_23313FAF4()
{
  return DockAccessory.debugDescription.getter();
}

uint64_t sub_23313FB14()
{
  type metadata accessor for DockAccessory.Identifier(0);
  return sub_233147668();
}

uint64_t sub_23313FB58()
{
  sub_233147E9C();
  sub_233147EA8();
  type metadata accessor for DockAccessory.Identifier(0);
  sub_233147674();
  sub_233127808(&qword_256038CD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_233147BC0();
  return sub_233147ECC();
}

uint64_t sub_23313FBF0()
{
  sub_233147EA8();
  type metadata accessor for DockAccessory.Identifier(0);
  sub_233147674();
  sub_233127808(&qword_256038CD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_233147BC0();
}

uint64_t sub_23313FC78()
{
  sub_233147E9C();
  sub_233147EA8();
  type metadata accessor for DockAccessory.Identifier(0);
  sub_233147674();
  sub_233127808(&qword_256038CD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_233147BC0();
  return sub_233147ECC();
}

uint64_t sub_23313FD0C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2331475AC;
  return v6(a1);
}

uint64_t sub_23313FD70(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23313FE40(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2331469D4((uint64_t)v12, *a3);
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
      sub_2331469D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_23313FE40(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_233147D94();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23313FFF8(a5, a6);
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
  v8 = sub_233147DD0();
  if (!v8)
  {
    sub_233147DE8();
    __break(1u);
LABEL_17:
    result = sub_233147E0C();
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

uint64_t sub_23313FFF8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23314008C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_233140264(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_233140264(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23314008C(uint64_t a1, unint64_t a2)
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
      v3 = sub_233140200(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_233147DA0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_233147DE8();
      __break(1u);
LABEL_10:
      v2 = sub_233147C44();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_233147E0C();
    __break(1u);
LABEL_14:
    result = sub_233147DE8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_233140200(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256039CA8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_233140264(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256039CA8);
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
  result = sub_233147E0C();
  __break(1u);
  return result;
}

uint64_t sub_2331403B0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2331403E8(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2331403CC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_233140570(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2331403E8(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256038C48);
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
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8)
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256038C50);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_233147E0C();
  __break(1u);
  return result;
}

uint64_t sub_233140570(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256039C58);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_233147E0C();
  __break(1u);
  return result;
}

unint64_t sub_2331406D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_233147E9C();
  sub_233147C20();
  v4 = sub_233147ECC();
  return sub_23314073C(a1, a2, v4);
}

unint64_t sub_23314073C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_233147E60() & 1) == 0)
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
      while (!v14 && (sub_233147E60() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23314081C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_233140884;
  return v5(v2 + 32);
}

uint64_t sub_233140884()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t _s7DockKit0A9AccessoryC0C5EventO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  double v2;
  uint64_t v3;
  double v4;
  unsigned int v5;
  char v6;
  char v7;
  uint64_t v9;
  int v10;
  BOOL v11;
  BOOL v12;

  v2 = *(double *)a1;
  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = *(double *)a2;
  v5 = *(unsigned __int8 *)(a2 + 8);
  if (v3 >> 6)
  {
    if (v3 >> 6 == 1)
    {
      if ((v5 & 0xC0) != 0x40 || v2 != v4)
        return 0;
    }
    else
    {
      v9 = v3 ^ 0x80;
      v10 = v5 & 0xC0;
      if (*(_QWORD *)&v2 | v9)
      {
        v12 = v10 == 128 && *(_QWORD *)&v4 == 1;
        if (!v12 || v5 != 128)
          return 0;
      }
      else
      {
        v11 = v10 == 128 && *(_QWORD *)&v4 == 0;
        if (!v11 || v5 != 128)
          return 0;
      }
    }
    return 1;
  }
  else
  {
    if (v5 >= 0x40)
      return 0;
    v6 = ((v3 & 1) == 0) ^ v5;
    if (*(_QWORD *)&v2 == *(_QWORD *)&v4)
      v7 = v6;
    else
      v7 = 0;
    return v7 & 1;
  }
}

BOOL _s7DockKit0A9AccessoryC12BatteryStateV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  double v2;
  int v3;
  int v4;
  double v5;
  int v6;
  int v7;
  char v9;
  _BOOL8 result;

  v2 = *(double *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a1 + 24);
  v4 = *(unsigned __int8 *)(a1 + 25);
  v5 = *(double *)(a2 + 16);
  v6 = *(unsigned __int8 *)(a2 + 24);
  v7 = *(unsigned __int8 *)(a2 + 25);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
  {
    result = 0;
    if (v2 != v5)
      return result;
    goto LABEL_9;
  }
  v9 = sub_233147E60();
  result = 0;
  if ((v9 & 1) != 0 && v2 == v5)
  {
LABEL_9:
    if (((v3 ^ v6) & 1) == 0)
      return v4 == v7;
  }
  return result;
}

BOOL _s7DockKit0A9AccessoryC13TrackedObjectV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  _QWORD *v7;
  char v8;
  _QWORD *v9;
  char v10;

  if ((sub_233147668() & 1) == 0)
    return 0;
  v4 = type metadata accessor for DockAccessory.TrackedObject(0);
  result = CGRectEqualToRect(*(CGRect *)(a1 + *(int *)(v4 + 20)), *(CGRect *)(a2 + *(int *)(v4 + 20)));
  if (!result)
    return result;
  v6 = *(int *)(v4 + 24);
  v7 = (_QWORD *)(a1 + v6);
  v8 = *(_BYTE *)(a1 + v6 + 8);
  v9 = (_QWORD *)(a2 + v6);
  v10 = *(_BYTE *)(a2 + v6 + 8);
  if ((v8 & 1) == 0)
  {
    if (*v7 != *v9)
      v10 = 1;
    return (v10 & 1) == 0;
  }
  return (v10 & 1) != 0;
}

BOOL _s7DockKit0A9AccessoryC13TrackedPersonV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  int *v4;
  _BOOL8 result;
  uint64_t v6;
  _QWORD *v7;
  char v8;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  double *v12;
  char v13;
  double *v14;
  int v15;
  uint64_t v16;
  double *v17;
  char v18;
  double *v19;
  char v20;

  if ((sub_233147668() & 1) == 0)
    return 0;
  v4 = (int *)type metadata accessor for DockAccessory.TrackedPerson(0);
  result = CGRectEqualToRect(*(CGRect *)(a1 + v4[5]), *(CGRect *)(a2 + v4[5]));
  if (!result)
    return result;
  v6 = v4[6];
  v7 = (_QWORD *)(a1 + v6);
  v8 = *(_BYTE *)(a1 + v6 + 8);
  v9 = (_QWORD *)(a2 + v6);
  v10 = *(unsigned __int8 *)(a2 + v6 + 8);
  if ((v8 & 1) != 0)
  {
    if (!v10)
      return 0;
  }
  else
  {
    if (*v7 != *v9)
      LOBYTE(v10) = 1;
    if ((v10 & 1) != 0)
      return 0;
  }
  v11 = v4[7];
  v12 = (double *)(a1 + v11);
  v13 = *(_BYTE *)(a1 + v11 + 8);
  v14 = (double *)(a2 + v11);
  v15 = *(unsigned __int8 *)(a2 + v11 + 8);
  if ((v13 & 1) != 0)
  {
    if (!v15)
      return 0;
  }
  else
  {
    if (*v12 != *v14)
      LOBYTE(v15) = 1;
    if ((v15 & 1) != 0)
      return 0;
  }
  v16 = v4[8];
  v17 = (double *)(a1 + v16);
  v18 = *(_BYTE *)(a1 + v16 + 8);
  v19 = (double *)(a2 + v16);
  v20 = *(_BYTE *)(a2 + v16 + 8);
  if ((v18 & 1) == 0)
  {
    if (*v17 != *v19)
      v20 = 1;
    return (v20 & 1) == 0;
  }
  return (v20 & 1) != 0;
}

BOOL _s7DockKit0A9AccessoryC18TrackedSubjectTypeO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char v22;
  char *v23;
  int v24;
  uint64_t (*v25)(uint64_t);
  uint64_t v26;
  BOOL v27;
  uint64_t v29;
  uint64_t v30;

  v30 = a2;
  v3 = type metadata accessor for DockAccessory.TrackedObject(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DockAccessory.TrackedPerson(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DockAccessory.TrackedSubjectType(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v29 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256039DE0);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = (uint64_t)&v18[*(int *)(v16 + 48)];
  sub_233140F4C(a1, (uint64_t)v18, type metadata accessor for DockAccessory.TrackedSubjectType);
  sub_233140F4C(v30, v19, type metadata accessor for DockAccessory.TrackedSubjectType);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_233140F4C((uint64_t)v18, (uint64_t)v14, type metadata accessor for DockAccessory.TrackedSubjectType);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      sub_2331416F4(v19, (uint64_t)v8, type metadata accessor for DockAccessory.TrackedPerson);
      v27 = _s7DockKit0A9AccessoryC13TrackedPersonV2eeoiySbAE_AEtFZ_0((uint64_t)v14, (uint64_t)v8);
      sub_2331416B8((uint64_t)v8, type metadata accessor for DockAccessory.TrackedPerson);
      sub_2331416B8((uint64_t)v14, type metadata accessor for DockAccessory.TrackedPerson);
      sub_2331416B8((uint64_t)v18, type metadata accessor for DockAccessory.TrackedSubjectType);
      return v27;
    }
    v25 = type metadata accessor for DockAccessory.TrackedPerson;
    v26 = (uint64_t)v14;
    goto LABEL_11;
  }
  sub_233140F4C((uint64_t)v18, (uint64_t)v12, type metadata accessor for DockAccessory.TrackedSubjectType);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    v25 = type metadata accessor for DockAccessory.TrackedObject;
    v26 = (uint64_t)v12;
LABEL_11:
    sub_2331416B8(v26, v25);
    sub_233129970((uint64_t)v18, (uint64_t *)&unk_256039DE0);
    return 0;
  }
  sub_2331416F4(v19, (uint64_t)v5, type metadata accessor for DockAccessory.TrackedObject);
  if ((sub_233147668() & 1) == 0
    || !CGRectEqualToRect(*(CGRect *)&v12[*(int *)(v3 + 20)], *(CGRect *)&v5[*(int *)(v3 + 20)]))
  {
    goto LABEL_7;
  }
  v20 = *(int *)(v3 + 24);
  v21 = &v12[v20];
  v22 = v12[v20 + 8];
  v23 = &v5[v20];
  v24 = v5[v20 + 8];
  if ((v22 & 1) == 0)
  {
    if (*(_QWORD *)v21 != *(_QWORD *)v23)
      LOBYTE(v24) = 1;
    if ((v24 & 1) != 0)
      goto LABEL_7;
LABEL_18:
    sub_2331416B8((uint64_t)v5, type metadata accessor for DockAccessory.TrackedObject);
    sub_2331416B8((uint64_t)v12, type metadata accessor for DockAccessory.TrackedObject);
    sub_2331416B8((uint64_t)v18, type metadata accessor for DockAccessory.TrackedSubjectType);
    return 1;
  }
  if (v24)
    goto LABEL_18;
LABEL_7:
  sub_2331416B8((uint64_t)v5, type metadata accessor for DockAccessory.TrackedObject);
  sub_2331416B8((uint64_t)v12, type metadata accessor for DockAccessory.TrackedObject);
  sub_2331416B8((uint64_t)v18, type metadata accessor for DockAccessory.TrackedSubjectType);
  return 0;
}

uint64_t type metadata accessor for DockAccessory.TrackedPerson(uint64_t a1)
{
  return sub_233127434(a1, qword_256039670);
}

uint64_t type metadata accessor for DockAccessory.TrackedObject(uint64_t a1)
{
  return sub_233127434(a1, qword_256039710);
}

uint64_t type metadata accessor for DockAccessory.TrackingState(uint64_t a1)
{
  return sub_233127434(a1, qword_2560397A8);
}

uint64_t type metadata accessor for DockAccessory.TrackedSubjectType(uint64_t a1)
{
  return sub_233127434(a1, qword_2560395E0);
}

uint64_t sub_233140F4C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_233140F90(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  void *v6;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;

  v6 = v5;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038C20);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = &v5[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand];
  v15 = (void *)MEMORY[0x234930BD4](v14);

  if (v15)
  {
    v16 = MEMORY[0x234930BD4](v14);
    if (v16)
    {
      v17 = (void *)v16;
      v18 = (void *)sub_233147770();

      sub_2331476C8();
      LOBYTE(v17) = sub_233147D64();

      if ((v17 & 1) != 0)
      {
        v19 = sub_233147CD4();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v13, 1, 1, v19);
        v20 = swift_allocObject();
        *(_QWORD *)(v20 + 16) = 0;
        *(_QWORD *)(v20 + 24) = 0;
        *(_QWORD *)(v20 + 32) = v6;
        *(_QWORD *)(v20 + 40) = a3;
        *(_QWORD *)(v20 + 48) = a5;
        *(_QWORD *)(v20 + 56) = a4;
        *(double *)(v20 + 64) = a1;
        v21 = v6;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_233129DC4((uint64_t)v13, (uint64_t)&unk_256039C48, v20);
        swift_release();
      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_233141100(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  _BYTE *v25;
  id v26;
  void (*v28)(_BYTE *, _BYTE *, uint64_t);
  unint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  void (*v36)(_BYTE *, uint64_t);
  _BYTE *v37;
  char v38;
  os_log_t v39;
  uint64_t v40;
  void (*v41)(_BYTE *, uint64_t);
  _BYTE v42[4];
  int v43;
  os_log_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v52 = a2;
  v46 = a1;
  v5 = sub_233147914();
  v50 = *(_QWORD *)(v5 - 8);
  v51 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v49 = &v42[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_233147968();
  v47 = *(_QWORD *)(v7 - 8);
  v48 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v42[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_233147BB4();
  v53 = *(_QWORD *)(v10 - 8);
  v54 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v42[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039C38);
  MEMORY[0x24BDAC7A8](v13);
  v15 = &v42[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = sub_233147950();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = &v42[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = &v42[-v22];
  MEMORY[0x24BDAC7A8](v21);
  v25 = &v42[-v24];
  v26 = a3;
  sub_233147938();
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
    return sub_233129970((uint64_t)v15, &qword_256039C38);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v17 + 32))(v25, v15, v16);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v53 + 16))(v12, v3 + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_logger, v54);
  v28 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v17 + 16);
  v28(v23, v25, v16);
  v28(v20, v25, v16);
  v29 = v52;
  swift_bridgeObjectRetain_n();
  v30 = sub_233147B9C();
  v31 = sub_233147D4C();
  v32 = v31;
  if (os_log_type_enabled(v30, v31))
  {
    v33 = swift_slowAlloc();
    v44 = v30;
    v34 = v33;
    v45 = swift_slowAlloc();
    v56 = v45;
    *(_DWORD *)v34 = 136315650;
    v43 = v32;
    swift_bridgeObjectRetain();
    v55 = sub_23313FD70(v46, v29, &v56);
    sub_233147D88();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v34 + 12) = 256;
    sub_23314792C();
    v35 = sub_233147908();
    (*(void (**)(_BYTE *, uint64_t))(v47 + 8))(v9, v48);
    v36 = *(void (**)(_BYTE *, uint64_t))(v17 + 8);
    v36(v23, v16);
    LOBYTE(v55) = v35;
    sub_233147D88();
    *(_WORD *)(v34 + 15) = 256;
    v37 = v49;
    sub_233147944();
    v38 = sub_233147908();
    (*(void (**)(_BYTE *, uint64_t))(v50 + 8))(v37, v51);
    v36(v20, v16);
    LOBYTE(v55) = v38;
    sub_233147D88();
    v39 = v44;
    _os_log_impl(&dword_233121000, v44, (os_log_type_t)v43, "Received trajectory progress feedback: s='%s' type='%hhu' status='%hhu'", (uint8_t *)v34, 0x12u);
    v40 = v45;
    swift_arrayDestroy();
    MEMORY[0x234930B44](v40, -1, -1);
    MEMORY[0x234930B44](v34, -1, -1);

    (*(void (**)(_BYTE *, uint64_t))(v53 + 8))(v12, v54);
    return ((uint64_t (*)(_BYTE *, uint64_t))v36)(v25, v16);
  }
  else
  {
    v41 = *(void (**)(_BYTE *, uint64_t))(v17 + 8);
    v41(v20, v16);
    v41(v23, v16);
    swift_bridgeObjectRelease_n();

    (*(void (**)(_BYTE *, uint64_t))(v53 + 8))(v12, v54);
    return ((uint64_t (*)(_BYTE *, uint64_t))v41)(v25, v16);
  }
}

uint64_t sub_233141570(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x676E696B63617274 && a2 == 0xED0000646E617453)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_233147E60();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23314160C()
{
  return 0x676E696B63617274;
}

uint64_t sub_233141630(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_233147C2C();
    return sub_233147C50();
  }
  return result;
}

uint64_t sub_2331416B8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2331416F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for DockAccessory.TrackingStates.Iterator(uint64_t a1)
{
  return sub_233127434(a1, (uint64_t *)&unk_2560398D0);
}

uint64_t type metadata accessor for DockAccessory.AccessoryEvents.Iterator(uint64_t a1)
{
  return sub_233127434(a1, (uint64_t *)&unk_256039A00);
}

uint64_t type metadata accessor for DockAccessory.BatteryStates.Iterator(uint64_t a1)
{
  return sub_233127434(a1, (uint64_t *)&unk_256039B30);
}

unint64_t sub_233141774()
{
  unint64_t result;

  result = qword_256038DE0;
  if (!qword_256038DE0)
  {
    result = MEMORY[0x234930AD8](&unk_233149AB8, &type metadata for DockAccessory.FramingMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256038DE0);
  }
  return result;
}

unint64_t sub_2331417B8()
{
  unint64_t result;

  result = qword_256038DE8;
  if (!qword_256038DE8)
  {
    result = MEMORY[0x234930AD8](&unk_233149A68, &type metadata for DockAccessory.FramingMode.RightCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256038DE8);
  }
  return result;
}

unint64_t sub_2331417FC()
{
  unint64_t result;

  result = qword_256038DF0;
  if (!qword_256038DF0)
  {
    result = MEMORY[0x234930AD8](&unk_233149A18, &type metadata for DockAccessory.FramingMode.LeftCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256038DF0);
  }
  return result;
}

unint64_t sub_233141840()
{
  unint64_t result;

  result = qword_256038DF8;
  if (!qword_256038DF8)
  {
    result = MEMORY[0x234930AD8](&unk_2331499C8, &type metadata for DockAccessory.FramingMode.CenterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256038DF8);
  }
  return result;
}

unint64_t sub_233141884()
{
  unint64_t result;

  result = qword_256038E00;
  if (!qword_256038E00)
  {
    result = MEMORY[0x234930AD8](&unk_233149978, &type metadata for DockAccessory.FramingMode.AutomaticCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256038E00);
  }
  return result;
}

void SPRotation3DGetEulerAngles(SPRotation3D a1@<0:Q0, 16:Q1>, uint64_t a2@<X0>, int a3@<W1>, uint64_t a4@<X8>)
{
  float64x2_t v8;
  double v10;
  double v18;
  __int128 v22;
  int64x2_t v23;
  long double v24;
  __int128 v25;
  __int128 v26;
  float64_t v27;

  _Q2 = *(int8x16_t *)a2;
  _Q1 = *(_OWORD *)(a2 + 16);
  if (a3 == 2)
  {
    v8 = (float64x2_t)vextq_s8(_Q2, _Q2, 8uLL);
    _Q2.i64[0] = *(_QWORD *)(a2 + 16);
  }
  else if (a3 == 1)
  {
    v8.f64[0] = *(float64_t *)(a2 + 16);
    v8.f64[1] = *(float64_t *)(a2 + 8);
  }
  else
  {
    v8 = 0uLL;
    _Q2.i64[0] = 0;
  }
  v26 = *(_OWORD *)(a2 + 16);
  _D8 = v8.f64[1];
  v10 = vmuld_lane_f64(v8.f64[1], v8, 1);
  v27 = v8.f64[0];
  __asm { FMLA            D0, D2, V1.D[1] }
  *(double *)&_Q0 = atan2(_D0 + _D0, (v10 + *(double *)_Q2.i64 * *(double *)_Q2.i64) * -2.0 + 1.0);
  v25 = _Q0;
  _V1.D[1] = *((_QWORD *)&v26 + 1);
  __asm { FMLA            D0, D8, V1.D[1] }
  v18 = *(double *)&_Q0 + *(double *)&_Q0;
  if (v18 > 1.0)
    v18 = 1.0;
  if (v18 < -1.0)
    v18 = -1.0;
  v24 = asin(v18);
  _V2.D[1] = *((_QWORD *)&v26 + 1);
  _D1 = v27;
  __asm { FMLA            D0, D1, V2.D[1] }
  *(float *)&_D0 = _D0 + _D0;
  *(float *)&_D1 = vmlad_n_f64(v10, _D1, _D1) * -2.0 + 1.0;
  *(double *)&v22 = atan2f(*(float *)&_D0, *(float *)&_D1);
  if (a3 == 2)
  {
    *(long double *)v23.i64 = v24;
    v23.i64[1] = v22;
    v22 = v25;
  }
  else if (a3 == 1)
  {
    v23.i64[0] = v25;
    *(long double *)&v23.i64[1] = v24;
  }
  else
  {
    v23 = vdupq_n_s64(0x7FF8000000000000uLL);
    *(_QWORD *)&v22 = 0x7FF8000000000000;
  }
  *(int64x2_t *)a4 = v23;
  *(_OWORD *)(a4 + 16) = v22;
  *(_DWORD *)(a4 + 32) = a3;
}

void SPVector3DMake(double a1@<D0>, double a2@<D1>, double a3@<D2>, double *a4@<X8>)
{
  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
}

uint64_t sub_233141A14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_233141A58()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC7DockKit13DockAccessory__framingMode) = *(_BYTE *)(v0 + 24);
}

__n128 sub_233141A70()
{
  uint64_t v0;
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC7DockKit13DockAccessory__roi;
  result = *(__n128 *)(v0 + 24);
  v3 = *(_OWORD *)(v0 + 40);
  *(__n128 *)v1 = result;
  *(_OWORD *)(v1 + 16) = v3;
  return result;
}

uint64_t sub_233141A90()
{
  return sub_233127808(&qword_256038F38, type metadata accessor for DockAccessory.Identifier, (uint64_t)&protocol conformance descriptor for DockAccessory.Identifier);
}

unint64_t sub_233141AC0()
{
  unint64_t result;

  result = qword_256038F40;
  if (!qword_256038F40)
  {
    result = MEMORY[0x234930AD8](&protocol conformance descriptor for DockAccessory.CameraOrientation, &type metadata for DockAccessory.CameraOrientation);
    atomic_store(result, (unint64_t *)&qword_256038F40);
  }
  return result;
}

unint64_t sub_233141B08()
{
  unint64_t result;

  result = qword_256038F48;
  if (!qword_256038F48)
  {
    result = MEMORY[0x234930AD8](&protocol conformance descriptor for DockAccessory.State, &type metadata for DockAccessory.State);
    atomic_store(result, (unint64_t *)&qword_256038F48);
  }
  return result;
}

unint64_t sub_233141B50()
{
  unint64_t result;

  result = qword_256038F50;
  if (!qword_256038F50)
  {
    result = MEMORY[0x234930AD8](&protocol conformance descriptor for DockAccessory.Category, &type metadata for DockAccessory.Category);
    atomic_store(result, (unint64_t *)&qword_256038F50);
  }
  return result;
}

unint64_t sub_233141B98()
{
  unint64_t result;

  result = qword_256038F58[0];
  if (!qword_256038F58[0])
  {
    result = MEMORY[0x234930AD8](&protocol conformance descriptor for DockAccessory.Observation.ObservationType, &type metadata for DockAccessory.Observation.ObservationType);
    atomic_store(result, qword_256038F58);
  }
  return result;
}

uint64_t sub_233141BDC()
{
  return MEMORY[0x24BEE40A8];
}

uint64_t sub_233141BE8()
{
  return sub_233127808(qword_256038F70, type metadata accessor for DockAccessory.StateChanges.Iterator, (uint64_t)&protocol conformance descriptor for DockAccessory.StateChanges.Iterator);
}

uint64_t sub_233141C14()
{
  return sub_233127808(qword_256038F88, type metadata accessor for DockAccessory.MotionStates.Iterator, (uint64_t)&protocol conformance descriptor for DockAccessory.MotionStates.Iterator);
}

uint64_t sub_233141C40()
{
  return sub_233127808(&qword_256038FA0, type metadata accessor for DockAccessory.TrackingStates.Iterator, (uint64_t)&protocol conformance descriptor for DockAccessory.TrackingStates.Iterator);
}

unint64_t sub_233141C70()
{
  unint64_t result;

  result = qword_256038FA8[0];
  if (!qword_256038FA8[0])
  {
    result = MEMORY[0x234930AD8](&protocol conformance descriptor for DockAccessory.AccessoryEvent, &type metadata for DockAccessory.AccessoryEvent);
    atomic_store(result, qword_256038FA8);
  }
  return result;
}

uint64_t sub_233141CB4()
{
  return sub_233127808(&qword_256038FC0, type metadata accessor for DockAccessory.AccessoryEvents.Iterator, (uint64_t)&protocol conformance descriptor for DockAccessory.AccessoryEvents.Iterator);
}

unint64_t sub_233141CE4()
{
  unint64_t result;

  result = qword_256038FC8;
  if (!qword_256038FC8)
  {
    result = MEMORY[0x234930AD8](&protocol conformance descriptor for DockAccessory.BatteryChargeState, &type metadata for DockAccessory.BatteryChargeState);
    atomic_store(result, (unint64_t *)&qword_256038FC8);
  }
  return result;
}

unint64_t sub_233141D2C()
{
  unint64_t result;

  result = qword_256038FD0[0];
  if (!qword_256038FD0[0])
  {
    result = MEMORY[0x234930AD8](&protocol conformance descriptor for DockAccessory.BatteryState, &type metadata for DockAccessory.BatteryState);
    atomic_store(result, qword_256038FD0);
  }
  return result;
}

uint64_t sub_233141D70()
{
  return sub_233127808(&qword_256038FE8, type metadata accessor for DockAccessory.BatteryStates.Iterator, (uint64_t)&protocol conformance descriptor for DockAccessory.BatteryStates.Iterator);
}

unint64_t sub_233141DA0()
{
  unint64_t result;

  result = qword_256038FF0;
  if (!qword_256038FF0)
  {
    result = MEMORY[0x234930AD8](&protocol conformance descriptor for DockAccessory.FramingMode, &type metadata for DockAccessory.FramingMode);
    atomic_store(result, (unint64_t *)&qword_256038FF0);
  }
  return result;
}

unint64_t sub_233141DE8()
{
  unint64_t result;

  result = qword_256038FF8;
  if (!qword_256038FF8)
  {
    result = MEMORY[0x234930AD8](&protocol conformance descriptor for DockAccessory.Animation, &type metadata for DockAccessory.Animation);
    atomic_store(result, (unint64_t *)&qword_256038FF8);
  }
  return result;
}

uint64_t sub_233141E2C()
{
  return sub_233127808(&qword_256039000, type metadata accessor for DockAccessory, (uint64_t)&protocol conformance descriptor for DockAccessory);
}

uint64_t type metadata accessor for DockAccessory(uint64_t a1)
{
  return sub_233127434(a1, qword_2560390A0);
}

uint64_t sub_233141E6C()
{
  return type metadata accessor for DockAccessoryHelper(0);
}

uint64_t type metadata accessor for DockAccessoryHelper(uint64_t a1)
{
  return sub_233127434(a1, (uint64_t *)&unk_256039058);
}

uint64_t sub_233141E88()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233147BB4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_233141F10()
{
  return type metadata accessor for DockAccessory(0);
}

uint64_t sub_233141F18()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_233147BB4();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for DockAccessory.Identifier(319);
    if (v2 <= 0x3F)
    {
      result = sub_233147650();
      if (v3 <= 0x3F)
        return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t method lookup function for DockAccessory()
{
  return swift_lookUpClassMethod();
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.Identifier(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 24);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_233147674();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for DockAccessory.Identifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_233147674();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for DockAccessory.Identifier(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_233147674();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *assignWithCopy for DockAccessory.Identifier(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_233147674();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for DockAccessory.Identifier(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 24);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_233147674();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for DockAccessory.Identifier(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_233147674();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.Identifier()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2331422D4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_233147674();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for DockAccessory.Identifier()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23314235C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_233147674();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_2331423D0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233147674();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DockAccessory.CameraOrientation(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23314249C + 4 * byte_2331488ED[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_2331424D0 + 4 * byte_2331488E8[v4]))();
}

uint64_t sub_2331424D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2331424D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2331424E0);
  return result;
}

uint64_t sub_2331424EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2331424F4);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_2331424F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233142500(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.CameraOrientation()
{
  return &type metadata for DockAccessory.CameraOrientation;
}

void destroy for DockAccessory.CameraInformation(id *a1)
{

}

uint64_t initializeWithCopy for DockAccessory.CameraInformation(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  v6 = v3;
  return a1;
}

uint64_t assignWithCopy for DockAccessory.CameraInformation(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = *(_OWORD *)(a2 + 32);
  v8 = *(_OWORD *)(a2 + 48);
  v9 = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v8;
  *(_OWORD *)(a1 + 64) = v9;
  *(_OWORD *)(a1 + 32) = v7;
  v10 = *(_OWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v10;
  return a1;
}

__n128 __swift_memcpy105_16(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_OWORD *)(a1 + 89) = *(__int128 *)((char *)a2 + 89);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for DockAccessory.CameraInformation(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.CameraInformation(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 105))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.CameraInformation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 104) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 105) = 1;
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
    *(_BYTE *)(result + 105) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.CameraInformation()
{
  return &type metadata for DockAccessory.CameraInformation;
}

uint64_t getEnumTagSinglePayload for DockAccessory.State(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DockAccessory.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233142820 + 4 * byte_2331488F7[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_233142854 + 4 * byte_2331488F2[v4]))();
}

uint64_t sub_233142854(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23314285C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233142864);
  return result;
}

uint64_t sub_233142870(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233142878);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23314287C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233142884(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_233142890(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.State()
{
  return &type metadata for DockAccessory.State;
}

uint64_t sub_2331428B8()
{
  return 0;
}

ValueMetadata *type metadata accessor for DockAccessory.Category()
{
  return &type metadata for DockAccessory.Category;
}

_QWORD *initializeBufferWithCopyOfBuffer for DockAccessory.Observation(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    *(_QWORD *)(a1 + 8) = a2[1];
    v5 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    *(_OWORD *)(a1 + 32) = v5;
    v6 = *(int *)(a3 + 28);
    v7 = (void *)(a1 + v6);
    v8 = (char *)a2 + v6;
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039268);
    v10 = *(_QWORD *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038D20);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t destroy for DockAccessory.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = a1 + *(int *)(a2 + 28);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039268);
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return result;
}

uint64_t initializeWithCopy for DockAccessory.Observation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  v5 = *(int *)(a3 + 28);
  v6 = (void *)(a1 + v5);
  v7 = (const void *)(a2 + v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039268);
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038D20);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithCopy for DockAccessory.Observation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v4 = *(int *)(a3 + 28);
  v5 = (void *)(a1 + v4);
  v6 = (void *)(a2 + v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039268);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(v5, 1, v7);
  v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038D20);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

uint64_t initializeWithTake for DockAccessory.Observation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  v5 = *(int *)(a3 + 28);
  v6 = (void *)(a1 + v5);
  v7 = (const void *)(a2 + v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039268);
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038D20);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithTake for DockAccessory.Observation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void *, uint64_t, uint64_t);
  int v11;
  int v12;
  uint64_t v13;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  v5 = *(int *)(a3 + 28);
  v6 = (void *)(a1 + v5);
  v7 = (void *)(a2 + v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039268);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v9 + 48);
  v11 = v10(v6, 1, v8);
  v12 = v10(v7, 1, v8);
  if (!v11)
  {
    if (!v12)
    {
      (*(void (**)(void *, void *, uint64_t))(v9 + 40))(v6, v7, v8);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(v6, v8);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038D20);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v9 + 32))(v6, v7, v8);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.Observation()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233142E38(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;

  if ((_DWORD)a2 == 253)
  {
    v4 = *a1;
    if (v4 >= 3)
      return v4 - 2;
    else
      return 0;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038D20);
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 28)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for DockAccessory.Observation()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_233142EBC(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 253)
  {
    *result = a2 + 2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038D20);
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 28)], a2, a2, v7);
  }
  return result;
}

void sub_233142F30()
{
  unint64_t v0;

  sub_233142FBC();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_233142FBC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2560392D8[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256039268);
    v0 = sub_233147D7C();
    if (!v1)
      atomic_store(v0, qword_2560392D8);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x234930ACC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.Observation.ObservationType()
{
  return &type metadata for DockAccessory.Observation.ObservationType;
}

uint64_t destroy for DockAccessory.StateChange()
{
  return swift_release();
}

uint64_t _s7DockKit13DockAccessoryC11StateChangeVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DockAccessory.StateChange(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  return a1;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for DockAccessory.StateChange(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.StateChange(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 10))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.StateChange(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 10) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 10) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.StateChange()
{
  return &type metadata for DockAccessory.StateChange;
}

uint64_t initializeBufferWithCopyOfBuffer for DockAccessory.StateChanges(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038D38);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for DockAccessory.StateChanges(uint64_t a1, uint64_t a2)
{
  return sub_233145464(a1, a2, &qword_256038D38);
}

uint64_t initializeWithCopy for DockAccessory.StateChanges(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331454A4(a1, a2, a3, &qword_256038D38);
}

uint64_t assignWithCopy for DockAccessory.StateChanges(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331454F4(a1, a2, a3, &qword_256038D38);
}

uint64_t initializeWithTake for DockAccessory.StateChanges(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145544(a1, a2, a3, &qword_256038D38);
}

uint64_t assignWithTake for DockAccessory.StateChanges(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145594(a1, a2, a3, &qword_256038D38);
}

uint64_t getEnumTagSinglePayload for DockAccessory.StateChanges()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2331432AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_37Tm(a1, a2, a3, &qword_256038D38);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.StateChanges()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2331432C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_38Tm(a1, a2, a3, a4, &qword_256038D38);
}

uint64_t type metadata accessor for DockAccessory.StateChanges(uint64_t a1)
{
  return sub_233127434(a1, (uint64_t *)&unk_256039368);
}

void sub_2331432E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_233143698(a1, a2, a3, qword_256039378, (uint64_t)&type metadata for DockAccessory.StateChange);
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.StateChanges.Iterator(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2331456C0(a1, a2, a3, &qword_256038D38, &qword_256038D30);
}

uint64_t destroy for DockAccessory.StateChanges.Iterator(uint64_t a1, uint64_t a2)
{
  return sub_233145780(a1, a2, &qword_256038D38, &qword_256038D30);
}

uint64_t initializeWithCopy for DockAccessory.StateChanges.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331457FC(a1, a2, a3, &qword_256038D38, &qword_256038D30);
}

uint64_t assignWithCopy for DockAccessory.StateChanges.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145890(a1, a2, a3, &qword_256038D38, &qword_256038D30);
}

uint64_t initializeWithTake for DockAccessory.StateChanges.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145924(a1, a2, a3, &qword_256038D38, &qword_256038D30);
}

uint64_t assignWithTake for DockAccessory.StateChanges.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331459B8(a1, a2, a3, &qword_256038D38, &qword_256038D30);
}

uint64_t getEnumTagSinglePayload for DockAccessory.StateChanges.Iterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23314337C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_39Tm(a1, a2, a3, &qword_256038D38, &qword_256038D30);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.StateChanges.Iterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23314339C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_40Tm(a1, a2, a3, a4, &qword_256038D38, &qword_256038D30);
}

void sub_2331433B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2331437E4(a1, a2, a3, qword_256039378, (uint64_t)&type metadata for DockAccessory.StateChange, qword_256039410);
}

void destroy for DockAccessory.MotionState(uint64_t a1)
{

}

uint64_t initializeWithCopy for DockAccessory.MotionState(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  void *v5;
  id v6;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(void **)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v6 = v5;
  *(_QWORD *)(a1 + 72) = v5;
  return a1;
}

_QWORD *assignWithCopy for DockAccessory.MotionState(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  *a1 = v3;
  a1[1] = v4;
  v7 = a2[4];
  v6 = a2[5];
  v8 = a2[7];
  a1[6] = a2[6];
  a1[7] = v8;
  a1[4] = v7;
  a1[5] = v6;
  a1[8] = a2[8];
  v9 = (void *)a1[9];
  v10 = (void *)a2[9];
  v11 = v10;
  a1[9] = v10;

  return a1;
}

__n128 __swift_memcpy80_16(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for DockAccessory.MotionState(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  void *v6;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v6 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);

  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.MotionState(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 72);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.MotionState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 0;
    if (a2)
      *(_QWORD *)(result + 72) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.MotionState()
{
  return &type metadata for DockAccessory.MotionState;
}

uint64_t initializeBufferWithCopyOfBuffer for DockAccessory.MotionStates(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038D50);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for DockAccessory.MotionStates(uint64_t a1, uint64_t a2)
{
  return sub_233145464(a1, a2, &qword_256038D50);
}

uint64_t initializeWithCopy for DockAccessory.MotionStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331454A4(a1, a2, a3, &qword_256038D50);
}

uint64_t assignWithCopy for DockAccessory.MotionStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331454F4(a1, a2, a3, &qword_256038D50);
}

uint64_t initializeWithTake for DockAccessory.MotionStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145544(a1, a2, a3, &qword_256038D50);
}

uint64_t assignWithTake for DockAccessory.MotionStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145594(a1, a2, a3, &qword_256038D50);
}

uint64_t getEnumTagSinglePayload for DockAccessory.MotionStates()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23314364C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_37Tm(a1, a2, a3, &qword_256038D50);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.MotionStates()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233143664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_38Tm(a1, a2, a3, a4, &qword_256038D50);
}

uint64_t type metadata accessor for DockAccessory.MotionStates(uint64_t a1)
{
  return sub_233127434(a1, (uint64_t *)&unk_256039498);
}

void sub_233143684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_233143698(a1, a2, a3, qword_2560394A8, (uint64_t)&type metadata for DockAccessory.MotionState);
}

void sub_233143698(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5)
{
  unint64_t v5;

  sub_233145B94(319, a4, a5, MEMORY[0x24BEE6A98]);
  if (v5 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.MotionStates.Iterator(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2331456C0(a1, a2, a3, &qword_256038D50, &qword_256038D48);
}

uint64_t destroy for DockAccessory.MotionStates.Iterator(uint64_t a1, uint64_t a2)
{
  return sub_233145780(a1, a2, &qword_256038D50, &qword_256038D48);
}

uint64_t initializeWithCopy for DockAccessory.MotionStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331457FC(a1, a2, a3, &qword_256038D50, &qword_256038D48);
}

uint64_t assignWithCopy for DockAccessory.MotionStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145890(a1, a2, a3, &qword_256038D50, &qword_256038D48);
}

uint64_t initializeWithTake for DockAccessory.MotionStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145924(a1, a2, a3, &qword_256038D50, &qword_256038D48);
}

uint64_t assignWithTake for DockAccessory.MotionStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331459B8(a1, a2, a3, &qword_256038D50, &qword_256038D48);
}

uint64_t getEnumTagSinglePayload for DockAccessory.MotionStates.Iterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233143794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_39Tm(a1, a2, a3, &qword_256038D50, &qword_256038D48);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.MotionStates.Iterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2331437B4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_40Tm(a1, a2, a3, a4, &qword_256038D50, &qword_256038D48);
}

void sub_2331437C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2331437E4(a1, a2, a3, qword_2560394A8, (uint64_t)&type metadata for DockAccessory.MotionState, qword_256039540);
}

void sub_2331437E4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, unint64_t *a6)
{
  unint64_t v8;
  unint64_t v9;

  sub_233145B94(319, a4, a5, MEMORY[0x24BEE6A98]);
  if (v8 <= 0x3F)
  {
    sub_233145B94(319, a6, a5, MEMORY[0x24BEE6A78]);
    if (v9 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.TrackedSubjectType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  _OWORD *v19;
  _OWORD *v20;
  __int128 v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v7 = sub_233147674();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    if (EnumCaseMultiPayload == 1)
    {
      v8 = type metadata accessor for DockAccessory.TrackedObject(0);
      v9 = *(int *)(v8 + 20);
      v10 = (_OWORD *)((char *)a1 + v9);
      v11 = (_OWORD *)((char *)a2 + v9);
      v12 = v11[1];
      *v10 = *v11;
      v10[1] = v12;
      v13 = *(int *)(v8 + 24);
    }
    else
    {
      v17 = (int *)type metadata accessor for DockAccessory.TrackedPerson(0);
      v18 = v17[5];
      v19 = (_OWORD *)((char *)a1 + v18);
      v20 = (_OWORD *)((char *)a2 + v18);
      v21 = v20[1];
      *v19 = *v20;
      v19[1] = v21;
      v22 = v17[6];
      v23 = (char *)a1 + v22;
      v24 = (char *)a2 + v22;
      *(_QWORD *)v23 = *(_QWORD *)v24;
      v23[8] = v24[8];
      v25 = v17[7];
      v26 = (char *)a1 + v25;
      v27 = (char *)a2 + v25;
      v26[8] = v27[8];
      *(_QWORD *)v26 = *(_QWORD *)v27;
      v13 = v17[8];
    }
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v14[8] = v15[8];
    *(_QWORD *)v14 = *(_QWORD *)v15;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithCopy for DockAccessory.TrackedSubjectType(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;
  int *v11;
  int *v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v5 = sub_233147674();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  if (EnumCaseMultiPayload == 1)
  {
    v6 = type metadata accessor for DockAccessory.TrackedObject(0);
    v7 = *(int *)(v6 + 20);
    v8 = (_OWORD *)(a1 + v7);
    v9 = (_OWORD *)(a2 + v7);
    v10 = v9[1];
    *v8 = *v9;
    v8[1] = v10;
    v11 = (int *)(v6 + 24);
  }
  else
  {
    v12 = (int *)type metadata accessor for DockAccessory.TrackedPerson(0);
    v13 = v12[5];
    v14 = (_OWORD *)(a1 + v13);
    v15 = (_OWORD *)(a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = v12[6];
    v18 = a1 + v17;
    v19 = a2 + v17;
    *(_QWORD *)v18 = *(_QWORD *)v19;
    *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
    v20 = v12[7];
    v21 = a1 + v20;
    v22 = a2 + v20;
    *(_BYTE *)(v21 + 8) = *(_BYTE *)(v22 + 8);
    *(_QWORD *)v21 = *(_QWORD *)v22;
    v11 = v12 + 8;
  }
  v23 = *v11;
  v24 = a1 + v23;
  v25 = a2 + v23;
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *(_BYTE *)(v24 + 8) = *(_BYTE *)(v25 + 8);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for DockAccessory.TrackedSubjectType(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;
  int *v11;
  int *v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  if (a1 != a2)
  {
    sub_2331416B8(a1, type metadata accessor for DockAccessory.TrackedSubjectType);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v5 = sub_233147674();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    if (EnumCaseMultiPayload == 1)
    {
      v6 = type metadata accessor for DockAccessory.TrackedObject(0);
      v7 = *(int *)(v6 + 20);
      v8 = (_OWORD *)(a1 + v7);
      v9 = (_OWORD *)(a2 + v7);
      v10 = v9[1];
      *v8 = *v9;
      v8[1] = v10;
      v11 = (int *)(v6 + 24);
    }
    else
    {
      v12 = (int *)type metadata accessor for DockAccessory.TrackedPerson(0);
      v13 = v12[5];
      v14 = (_OWORD *)(a1 + v13);
      v15 = (_OWORD *)(a2 + v13);
      v16 = v15[1];
      *v14 = *v15;
      v14[1] = v16;
      v17 = v12[6];
      v18 = a1 + v17;
      v19 = a2 + v17;
      v20 = *(_BYTE *)(v19 + 8);
      *(_QWORD *)v18 = *(_QWORD *)v19;
      *(_BYTE *)(v18 + 8) = v20;
      v21 = v12[7];
      v22 = a1 + v21;
      v23 = a2 + v21;
      v24 = *(_BYTE *)(v23 + 8);
      *(_QWORD *)v22 = *(_QWORD *)v23;
      *(_BYTE *)(v22 + 8) = v24;
      v11 = v12 + 8;
    }
    v25 = *v11;
    v26 = a1 + v25;
    v27 = (uint64_t *)(a2 + v25);
    v28 = *v27;
    *(_BYTE *)(v26 + 8) = *((_BYTE *)v27 + 8);
    *(_QWORD *)v26 = v28;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for DockAccessory.TrackedSubjectType(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;
  int *v11;
  int *v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v5 = sub_233147674();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
  if (EnumCaseMultiPayload == 1)
  {
    v6 = type metadata accessor for DockAccessory.TrackedObject(0);
    v7 = *(int *)(v6 + 20);
    v8 = (_OWORD *)(a1 + v7);
    v9 = (_OWORD *)(a2 + v7);
    v10 = v9[1];
    *v8 = *v9;
    v8[1] = v10;
    v11 = (int *)(v6 + 24);
  }
  else
  {
    v12 = (int *)type metadata accessor for DockAccessory.TrackedPerson(0);
    v13 = v12[5];
    v14 = (_OWORD *)(a1 + v13);
    v15 = (_OWORD *)(a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = v12[6];
    v18 = a1 + v17;
    v19 = a2 + v17;
    *(_QWORD *)v18 = *(_QWORD *)v19;
    *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
    v20 = v12[7];
    v21 = a1 + v20;
    v22 = a2 + v20;
    *(_BYTE *)(v21 + 8) = *(_BYTE *)(v22 + 8);
    *(_QWORD *)v21 = *(_QWORD *)v22;
    v11 = v12 + 8;
  }
  v23 = *v11;
  v24 = a1 + v23;
  v25 = a2 + v23;
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *(_BYTE *)(v24 + 8) = *(_BYTE *)(v25 + 8);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for DockAccessory.TrackedSubjectType(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;
  int *v11;
  int *v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (a1 != a2)
  {
    sub_2331416B8(a1, type metadata accessor for DockAccessory.TrackedSubjectType);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v5 = sub_233147674();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
    if (EnumCaseMultiPayload == 1)
    {
      v6 = type metadata accessor for DockAccessory.TrackedObject(0);
      v7 = *(int *)(v6 + 20);
      v8 = (_OWORD *)(a1 + v7);
      v9 = (_OWORD *)(a2 + v7);
      v10 = v9[1];
      *v8 = *v9;
      v8[1] = v10;
      v11 = (int *)(v6 + 24);
    }
    else
    {
      v12 = (int *)type metadata accessor for DockAccessory.TrackedPerson(0);
      v13 = v12[5];
      v14 = (_OWORD *)(a1 + v13);
      v15 = (_OWORD *)(a2 + v13);
      v16 = v15[1];
      *v14 = *v15;
      v14[1] = v16;
      v17 = v12[6];
      v18 = a1 + v17;
      v19 = a2 + v17;
      *(_QWORD *)v18 = *(_QWORD *)v19;
      *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
      v20 = v12[7];
      v21 = a1 + v20;
      v22 = a2 + v20;
      *(_BYTE *)(v21 + 8) = *(_BYTE *)(v22 + 8);
      *(_QWORD *)v21 = *(_QWORD *)v22;
      v11 = v12 + 8;
    }
    v23 = *v11;
    v24 = a1 + v23;
    v25 = a2 + v23;
    *(_QWORD *)v24 = *(_QWORD *)v25;
    *(_BYTE *)(v24 + 8) = *(_BYTE *)(v25 + 8);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.TrackedSubjectType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for DockAccessory.TrackedSubjectType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_233143E94()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_233143EA4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for DockAccessory.TrackedPerson(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for DockAccessory.TrackedObject(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.TrackedPerson(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_233147674();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (_OWORD *)((char *)a1 + v8);
    v11 = (_OWORD *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (char *)a1 + v9;
    v14 = (char *)a2 + v9;
    *(_QWORD *)v13 = *(_QWORD *)v14;
    v13[8] = v14[8];
    v15 = a3[7];
    v16 = a3[8];
    v17 = (char *)a1 + v15;
    v18 = (char *)a2 + v15;
    *(_QWORD *)v17 = *(_QWORD *)v18;
    v17[8] = v18[8];
    v19 = (char *)a1 + v16;
    v20 = (char *)a2 + v16;
    *(_QWORD *)v19 = *(_QWORD *)v20;
    v19[8] = v20[8];
  }
  return a1;
}

uint64_t initializeWithCopy for DockAccessory.TrackedPerson(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_233147674();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_OWORD *)(a1 + v7);
  v10 = (_OWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  v14 = a3[7];
  v15 = a3[8];
  v16 = a1 + v14;
  v17 = a2 + v14;
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *(_BYTE *)(v16 + 8) = *(_BYTE *)(v17 + 8);
  v18 = a1 + v15;
  v19 = a2 + v15;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  return a1;
}

uint64_t assignWithCopy for DockAccessory.TrackedPerson(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v6 = sub_233147674();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  v10 = a3[6];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = *(_BYTE *)(v12 + 8);
  *(_QWORD *)v11 = *(_QWORD *)v12;
  *(_BYTE *)(v11 + 8) = v13;
  v14 = a3[7];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = *(_BYTE *)(v16 + 8);
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *(_BYTE *)(v15 + 8) = v17;
  v18 = a3[8];
  v19 = a1 + v18;
  v20 = a2 + v18;
  v21 = *(_BYTE *)(v20 + 8);
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *(_BYTE *)(v19 + 8) = v21;
  return a1;
}

uint64_t initializeWithTake for DockAccessory.TrackedPerson(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_233147674();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_OWORD *)(a1 + v7);
  v10 = (_OWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  v14 = a3[7];
  v15 = a3[8];
  v16 = a1 + v14;
  v17 = a2 + v14;
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *(_BYTE *)(v16 + 8) = *(_BYTE *)(v17 + 8);
  v18 = a1 + v15;
  v19 = a2 + v15;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  return a1;
}

uint64_t assignWithTake for DockAccessory.TrackedPerson(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_233147674();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_OWORD *)(a1 + v7);
  v10 = (_OWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  v14 = a3[7];
  v15 = a3[8];
  v16 = a1 + v14;
  v17 = a2 + v14;
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *(_BYTE *)(v16 + 8) = *(_BYTE *)(v17 + 8);
  v18 = a1 + v15;
  v19 = a2 + v15;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.TrackedPerson()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for DockAccessory.TrackedPerson()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233144300()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233147674();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.TrackedObject(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_233147674();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (_OWORD *)((char *)a1 + v8);
    v11 = (_OWORD *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (char *)a1 + v9;
    v14 = (char *)a2 + v9;
    *(_QWORD *)v13 = *(_QWORD *)v14;
    v13[8] = v14[8];
  }
  return a1;
}

uint64_t _s7DockKit13DockAccessoryC13TrackedPersonVwxx_0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_233147674();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for DockAccessory.TrackedObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_233147674();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_OWORD *)(a1 + v7);
  v10 = (_OWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  return a1;
}

uint64_t assignWithCopy for DockAccessory.TrackedObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v6 = sub_233147674();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  v10 = *(int *)(a3 + 24);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = *(_BYTE *)(v12 + 8);
  *(_QWORD *)v11 = *(_QWORD *)v12;
  *(_BYTE *)(v11 + 8) = v13;
  return a1;
}

uint64_t initializeWithTake for DockAccessory.TrackedObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_233147674();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_OWORD *)(a1 + v7);
  v10 = (_OWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  return a1;
}

uint64_t assignWithTake for DockAccessory.TrackedObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_233147674();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_OWORD *)(a1 + v7);
  v10 = (_OWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_QWORD *)v12 = *(_QWORD *)v13;
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.TrackedObject()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_index_45Tm(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_233147674();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.TrackedObject()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_index_46Tm(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_233147674();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_233144704()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233147674();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.TrackingState(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_233147650();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for DockAccessory.TrackingState(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_233147650();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DockAccessory.TrackingState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_233147650();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DockAccessory.TrackingState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_233147650();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for DockAccessory.TrackingState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_233147650();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for DockAccessory.TrackingState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_233147650();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.TrackingState()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2331449E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_233147650();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.TrackingState()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233144A70(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_233147650();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_233144AE8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233147650();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DockAccessory.TrackingStates(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038D80);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for DockAccessory.TrackingStates(uint64_t a1, uint64_t a2)
{
  return sub_233145464(a1, a2, &qword_256038D80);
}

uint64_t initializeWithCopy for DockAccessory.TrackingStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331454A4(a1, a2, a3, &qword_256038D80);
}

uint64_t assignWithCopy for DockAccessory.TrackingStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331454F4(a1, a2, a3, &qword_256038D80);
}

uint64_t initializeWithTake for DockAccessory.TrackingStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145544(a1, a2, a3, &qword_256038D80);
}

uint64_t assignWithTake for DockAccessory.TrackingStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145594(a1, a2, a3, &qword_256038D80);
}

uint64_t getEnumTagSinglePayload for DockAccessory.TrackingStates()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233144BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_37Tm(a1, a2, a3, &qword_256038D80);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.TrackingStates()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233144BFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_38Tm(a1, a2, a3, a4, &qword_256038D80);
}

uint64_t type metadata accessor for DockAccessory.TrackingStates(uint64_t a1)
{
  return sub_233127434(a1, (uint64_t *)&unk_256039838);
}

void sub_233144C1C()
{
  unint64_t v0;

  sub_233144DF0(319, qword_256039848, MEMORY[0x24BEE6A98]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.TrackingStates.Iterator(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2331456C0(a1, a2, a3, &qword_256038D80, &qword_256038D78);
}

uint64_t destroy for DockAccessory.TrackingStates.Iterator(uint64_t a1, uint64_t a2)
{
  return sub_233145780(a1, a2, &qword_256038D80, &qword_256038D78);
}

uint64_t initializeWithCopy for DockAccessory.TrackingStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331457FC(a1, a2, a3, &qword_256038D80, &qword_256038D78);
}

uint64_t assignWithCopy for DockAccessory.TrackingStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145890(a1, a2, a3, &qword_256038D80, &qword_256038D78);
}

uint64_t initializeWithTake for DockAccessory.TrackingStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145924(a1, a2, a3, &qword_256038D80, &qword_256038D78);
}

uint64_t assignWithTake for DockAccessory.TrackingStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331459B8(a1, a2, a3, &qword_256038D80, &qword_256038D78);
}

uint64_t getEnumTagSinglePayload for DockAccessory.TrackingStates.Iterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233144D18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_39Tm(a1, a2, a3, &qword_256038D80, &qword_256038D78);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.TrackingStates.Iterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233144D38(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_40Tm(a1, a2, a3, a4, &qword_256038D80, &qword_256038D78);
}

void sub_233144D4C()
{
  unint64_t v0;
  unint64_t v1;

  sub_233144DF0(319, qword_256039848, MEMORY[0x24BEE6A98]);
  if (v0 <= 0x3F)
  {
    sub_233144DF0(319, qword_2560398E0, MEMORY[0x24BEE6A78]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_233144DF0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = type metadata accessor for DockAccessory.TrackingState(255);
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DockAccessory.AccessoryEvent(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 126);
  v3 = ((*(unsigned __int8 *)(a1 + 8) >> 6) & 0xFFFFFF83 | (4 * ((*(unsigned __int8 *)(a1 + 8) >> 1) & 0x1F))) ^ 0x7F;
  if (v3 >= 0x7D)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for DockAccessory.AccessoryEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 126;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_BYTE *)(result + 8) = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

uint64_t sub_233144F04(uint64_t a1)
{
  unsigned int v1;
  int v2;
  unsigned int v3;

  v1 = *(unsigned __int8 *)(a1 + 8);
  v2 = (char)v1;
  v3 = v1 >> 6;
  if (v2 >= 0)
    return v3;
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_233144F24(uint64_t result)
{
  *(_BYTE *)(result + 8) &= 0x3Fu;
  return result;
}

uint64_t sub_233144F34(uint64_t result, unsigned int a2)
{
  if (a2 < 2)
  {
    *(_BYTE *)(result + 8) = *(_BYTE *)(result + 8) & 1 | ((_BYTE)a2 << 6);
  }
  else
  {
    *(_QWORD *)result = a2 - 2;
    *(_BYTE *)(result + 8) = 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.AccessoryEvent()
{
  return &type metadata for DockAccessory.AccessoryEvent;
}

uint64_t initializeBufferWithCopyOfBuffer for DockAccessory.AccessoryEvents(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038D98);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for DockAccessory.AccessoryEvents(uint64_t a1, uint64_t a2)
{
  return sub_233145464(a1, a2, &qword_256038D98);
}

uint64_t initializeWithCopy for DockAccessory.AccessoryEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331454A4(a1, a2, a3, &qword_256038D98);
}

uint64_t assignWithCopy for DockAccessory.AccessoryEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331454F4(a1, a2, a3, &qword_256038D98);
}

uint64_t initializeWithTake for DockAccessory.AccessoryEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145544(a1, a2, a3, &qword_256038D98);
}

uint64_t assignWithTake for DockAccessory.AccessoryEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145594(a1, a2, a3, &qword_256038D98);
}

uint64_t getEnumTagSinglePayload for DockAccessory.AccessoryEvents()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233144FF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_37Tm(a1, a2, a3, &qword_256038D98);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.AccessoryEvents()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233145010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_38Tm(a1, a2, a3, a4, &qword_256038D98);
}

uint64_t type metadata accessor for DockAccessory.AccessoryEvents(uint64_t a1)
{
  return sub_233127434(a1, (uint64_t *)&unk_256039968);
}

void sub_233145030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_233143698(a1, a2, a3, qword_256039978, (uint64_t)&type metadata for DockAccessory.AccessoryEvent);
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.AccessoryEvents.Iterator(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2331456C0(a1, a2, a3, &qword_256038D98, &qword_256038D90);
}

uint64_t destroy for DockAccessory.AccessoryEvents.Iterator(uint64_t a1, uint64_t a2)
{
  return sub_233145780(a1, a2, &qword_256038D98, &qword_256038D90);
}

uint64_t initializeWithCopy for DockAccessory.AccessoryEvents.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331457FC(a1, a2, a3, &qword_256038D98, &qword_256038D90);
}

uint64_t assignWithCopy for DockAccessory.AccessoryEvents.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145890(a1, a2, a3, &qword_256038D98, &qword_256038D90);
}

uint64_t initializeWithTake for DockAccessory.AccessoryEvents.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145924(a1, a2, a3, &qword_256038D98, &qword_256038D90);
}

uint64_t assignWithTake for DockAccessory.AccessoryEvents.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331459B8(a1, a2, a3, &qword_256038D98, &qword_256038D90);
}

uint64_t getEnumTagSinglePayload for DockAccessory.AccessoryEvents.Iterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2331450C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_39Tm(a1, a2, a3, &qword_256038D98, &qword_256038D90);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.AccessoryEvents.Iterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2331450E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_40Tm(a1, a2, a3, a4, &qword_256038D98, &qword_256038D90);
}

void sub_2331450FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2331437E4(a1, a2, a3, qword_256039978, (uint64_t)&type metadata for DockAccessory.AccessoryEvent, qword_256039A10);
}

uint64_t _s7DockKit13DockAccessoryC11ObservationV15ObservationTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s7DockKit13DockAccessoryC11ObservationV15ObservationTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2331451F4 + 4 * byte_233148901[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_233145228 + 4 * byte_2331488FC[v4]))();
}

uint64_t sub_233145228(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233145230(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233145238);
  return result;
}

uint64_t sub_233145244(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23314524CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_233145250(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233145258(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.BatteryChargeState()
{
  return &type metadata for DockAccessory.BatteryChargeState;
}

uint64_t destroy for DockAccessory.BatteryState()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DockAccessory.BatteryState(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DockAccessory.BatteryState(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  return a1;
}

__n128 __swift_memcpy26_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 10) = *(_OWORD *)(a2 + 10);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DockAccessory.BatteryState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.BatteryState(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 26))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.BatteryState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 26) = 1;
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
    *(_BYTE *)(result + 26) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.BatteryState()
{
  return &type metadata for DockAccessory.BatteryState;
}

uint64_t initializeBufferWithCopyOfBuffer for DockAccessory.BatteryStates(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256038DB0);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for DockAccessory.BatteryStates(uint64_t a1, uint64_t a2)
{
  return sub_233145464(a1, a2, &qword_256038DB0);
}

uint64_t sub_233145464(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(a3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
}

uint64_t initializeWithCopy for DockAccessory.BatteryStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331454A4(a1, a2, a3, &qword_256038DB0);
}

uint64_t sub_2331454A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  return a1;
}

uint64_t assignWithCopy for DockAccessory.BatteryStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331454F4(a1, a2, a3, &qword_256038DB0);
}

uint64_t sub_2331454F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  return a1;
}

uint64_t initializeWithTake for DockAccessory.BatteryStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145544(a1, a2, a3, &qword_256038DB0);
}

uint64_t sub_233145544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  return a1;
}

uint64_t assignWithTake for DockAccessory.BatteryStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145594(a1, a2, a3, &qword_256038DB0);
}

uint64_t sub_233145594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.BatteryStates()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2331455E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_37Tm(a1, a2, a3, &qword_256038DB0);
}

uint64_t __swift_get_extra_inhabitant_index_37Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(a1, a2, v6);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.BatteryStates()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233145638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_38Tm(a1, a2, a3, a4, &qword_256038DB0);
}

uint64_t __swift_store_extra_inhabitant_index_38Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7;

  v7 = __swift_instantiateConcreteTypeFromMangledName(a5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a1, a2, a2, v7);
}

uint64_t type metadata accessor for DockAccessory.BatteryStates(uint64_t a1)
{
  return sub_233127434(a1, (uint64_t *)&unk_256039A98);
}

void sub_233145698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_233143698(a1, a2, a3, qword_256039AA8, (uint64_t)&type metadata for DockAccessory.BatteryState);
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.BatteryStates.Iterator(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2331456C0(a1, a2, a3, &qword_256038DB0, &qword_256038DA8);
}

uint64_t *sub_2331456C0(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  int v7;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  v7 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v7 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v7 + 16) & ~(unint64_t)v7));
    swift_retain();
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(a4);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
    v11 = *(int *)(a3 + 20);
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = __swift_instantiateConcreteTypeFromMangledName(a5);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  }
  return a1;
}

uint64_t destroy for DockAccessory.BatteryStates.Iterator(uint64_t a1, uint64_t a2)
{
  return sub_233145780(a1, a2, &qword_256038DB0, &qword_256038DA8);
}

uint64_t sub_233145780(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
  v8 = a1 + *(int *)(a2 + 20);
  v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

uint64_t initializeWithCopy for DockAccessory.BatteryStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331457FC(a1, a2, a3, &qword_256038DB0, &qword_256038DA8);
}

uint64_t sub_2331457FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
  v10 = *(int *)(a3 + 20);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

uint64_t assignWithCopy for DockAccessory.BatteryStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145890(a1, a2, a3, &qword_256038DB0, &qword_256038DA8);
}

uint64_t sub_233145890(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(a1, a2, v9);
  v10 = *(int *)(a3 + 20);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t initializeWithTake for DockAccessory.BatteryStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233145924(a1, a2, a3, &qword_256038DB0, &qword_256038DA8);
}

uint64_t sub_233145924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
  v10 = *(int *)(a3 + 20);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

uint64_t assignWithTake for DockAccessory.BatteryStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2331459B8(a1, a2, a3, &qword_256038DB0, &qword_256038DA8);
}

uint64_t sub_2331459B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(a1, a2, v9);
  v10 = *(int *)(a3 + 20);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.BatteryStates.Iterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233145A44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_39Tm(a1, a2, a3, &qword_256038DB0, &qword_256038DA8);
}

uint64_t __swift_get_extra_inhabitant_index_39Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    v13 = a1;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = a1 + *(int *)(a3 + 20);
    v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48);
  }
  return v12(v13, a2, v11);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.BatteryStates.Iterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233145ADC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_40Tm(a1, a2, a3, a4, &qword_256038DB0, &qword_256038DA8);
}

uint64_t __swift_store_extra_inhabitant_index_40Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;

  v11 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a3)
  {
    v13 = v11;
    v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v15 = a1;
  }
  else
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(a6);
    v15 = a1 + *(int *)(a4 + 20);
    v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  }
  return v14(v15, a2, a2, v13);
}

void sub_233145B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2331437E4(a1, a2, a3, qword_256039AA8, (uint64_t)&type metadata for DockAccessory.BatteryState, qword_256039B40);
}

void sub_233145B94(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

ValueMetadata *type metadata accessor for DockAccessory.FramingMode()
{
  return &type metadata for DockAccessory.FramingMode;
}

ValueMetadata *type metadata accessor for DockAccessory.Animation()
{
  return &type metadata for DockAccessory.Animation;
}

__n128 __swift_memcpy89_8(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for DockAccessory.Limits(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 89))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DockAccessory.Limits(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 88) = 0;
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
  *(_BYTE *)(result + 89) = v3;
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.Limits()
{
  return &type metadata for DockAccessory.Limits;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for DockAccessory.Limits.Limit(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DockAccessory.Limits.Limit(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.Limits.Limit()
{
  return &type metadata for DockAccessory.Limits.Limit;
}

uint64_t _s7DockKit13DockAccessoryC11FramingModeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s7DockKit13DockAccessoryC11FramingModeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233145DE4 + 4 * byte_23314890B[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_233145E18 + 4 * byte_233148906[v4]))();
}

uint64_t sub_233145E18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233145E20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233145E28);
  return result;
}

uint64_t sub_233145E34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233145E3CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_233145E40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233145E48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.FramingMode.CodingKeys()
{
  return &type metadata for DockAccessory.FramingMode.CodingKeys;
}

ValueMetadata *type metadata accessor for DockAccessory.FramingMode.AutomaticCodingKeys()
{
  return &type metadata for DockAccessory.FramingMode.AutomaticCodingKeys;
}

ValueMetadata *type metadata accessor for DockAccessory.FramingMode.CenterCodingKeys()
{
  return &type metadata for DockAccessory.FramingMode.CenterCodingKeys;
}

ValueMetadata *type metadata accessor for DockAccessory.FramingMode.LeftCodingKeys()
{
  return &type metadata for DockAccessory.FramingMode.LeftCodingKeys;
}

ValueMetadata *type metadata accessor for DockAccessory.FramingMode.RightCodingKeys()
{
  return &type metadata for DockAccessory.FramingMode.RightCodingKeys;
}

uint64_t _s7DockKit13DockAccessoryC8CategoryOwet_0(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t _s7DockKit13DockAccessoryC8CategoryOwst_0(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_233145F34 + 4 * byte_233148910[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_233145F54 + 4 * byte_233148915[v4]))();
}

_BYTE *sub_233145F34(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_233145F54(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_233145F5C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_233145F64(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_233145F6C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_233145F74(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.Category.CodingKeys()
{
  return &type metadata for DockAccessory.Category.CodingKeys;
}

ValueMetadata *type metadata accessor for DockAccessory.Category.TrackingStandCodingKeys()
{
  return &type metadata for DockAccessory.Category.TrackingStandCodingKeys;
}

unint64_t sub_233145FA4()
{
  unint64_t result;

  result = qword_256039B70;
  if (!qword_256039B70)
  {
    result = MEMORY[0x234930AD8](&unk_233149758, &type metadata for DockAccessory.Category.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256039B70);
  }
  return result;
}

unint64_t sub_233145FEC()
{
  unint64_t result;

  result = qword_256039B78;
  if (!qword_256039B78)
  {
    result = MEMORY[0x234930AD8](&unk_233149950, &type metadata for DockAccessory.FramingMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256039B78);
  }
  return result;
}

unint64_t sub_233146034()
{
  unint64_t result;

  result = qword_256039B80;
  if (!qword_256039B80)
  {
    result = MEMORY[0x234930AD8](&unk_233149870, &type metadata for DockAccessory.FramingMode.AutomaticCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256039B80);
  }
  return result;
}

unint64_t sub_23314607C()
{
  unint64_t result;

  result = qword_256039B88;
  if (!qword_256039B88)
  {
    result = MEMORY[0x234930AD8](&unk_233149898, &type metadata for DockAccessory.FramingMode.AutomaticCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256039B88);
  }
  return result;
}

unint64_t sub_2331460C4()
{
  unint64_t result;

  result = qword_256039B90;
  if (!qword_256039B90)
  {
    result = MEMORY[0x234930AD8](&unk_233149820, &type metadata for DockAccessory.FramingMode.CenterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256039B90);
  }
  return result;
}

unint64_t sub_23314610C()
{
  unint64_t result;

  result = qword_256039B98;
  if (!qword_256039B98)
  {
    result = MEMORY[0x234930AD8](&unk_233149848, &type metadata for DockAccessory.FramingMode.CenterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256039B98);
  }
  return result;
}

unint64_t sub_233146154()
{
  unint64_t result;

  result = qword_256039BA0;
  if (!qword_256039BA0)
  {
    result = MEMORY[0x234930AD8](&unk_2331497D0, &type metadata for DockAccessory.FramingMode.LeftCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256039BA0);
  }
  return result;
}

unint64_t sub_23314619C()
{
  unint64_t result;

  result = qword_256039BA8;
  if (!qword_256039BA8)
  {
    result = MEMORY[0x234930AD8](&unk_2331497F8, &type metadata for DockAccessory.FramingMode.LeftCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256039BA8);
  }
  return result;
}

unint64_t sub_2331461E4()
{
  unint64_t result;

  result = qword_256039BB0;
  if (!qword_256039BB0)
  {
    result = MEMORY[0x234930AD8](&unk_233149780, &type metadata for DockAccessory.FramingMode.RightCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256039BB0);
  }
  return result;
}

unint64_t sub_23314622C()
{
  unint64_t result;

  result = qword_256039BB8;
  if (!qword_256039BB8)
  {
    result = MEMORY[0x234930AD8](&unk_2331497A8, &type metadata for DockAccessory.FramingMode.RightCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256039BB8);
  }
  return result;
}

unint64_t sub_233146274()
{
  unint64_t result;

  result = qword_256039BC0;
  if (!qword_256039BC0)
  {
    result = MEMORY[0x234930AD8](&unk_2331498C0, &type metadata for DockAccessory.FramingMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256039BC0);
  }
  return result;
}

unint64_t sub_2331462BC()
{
  unint64_t result;

  result = qword_256039BC8;
  if (!qword_256039BC8)
  {
    result = MEMORY[0x234930AD8](&unk_2331498E8, &type metadata for DockAccessory.FramingMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256039BC8);
  }
  return result;
}

unint64_t sub_233146304()
{
  unint64_t result;

  result = qword_256039BD0;
  if (!qword_256039BD0)
  {
    result = MEMORY[0x234930AD8](&unk_233149678, &type metadata for DockAccessory.Category.TrackingStandCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256039BD0);
  }
  return result;
}

unint64_t sub_23314634C()
{
  unint64_t result;

  result = qword_256039BD8;
  if (!qword_256039BD8)
  {
    result = MEMORY[0x234930AD8](&unk_2331496A0, &type metadata for DockAccessory.Category.TrackingStandCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256039BD8);
  }
  return result;
}

unint64_t sub_233146394()
{
  unint64_t result;

  result = qword_256039BE0;
  if (!qword_256039BE0)
  {
    result = MEMORY[0x234930AD8](&unk_2331496C8, &type metadata for DockAccessory.Category.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256039BE0);
  }
  return result;
}

unint64_t sub_2331463DC()
{
  unint64_t result;

  result = qword_256039BE8;
  if (!qword_256039BE8)
  {
    result = MEMORY[0x234930AD8](&unk_2331496F0, &type metadata for DockAccessory.Category.CodingKeys);
    atomic_store(result, &qword_256039BE8);
  }
  return result;
}

uint64_t sub_233146420(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6974616D6F747561 && a2 == 0xE900000000000063;
  if (v3 || (sub_233147E60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7265746E6563 && a2 == 0xE600000000000000 || (sub_233147E60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1952867692 && a2 == 0xE400000000000000 || (sub_233147E60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7468676972 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_233147E60();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_2331465AC(uint64_t a1, unint64_t a2)
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

uint64_t sub_2331465F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;

  v7 = *(_OWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 48);
  v5 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_233129C70;
  *(_QWORD *)(v5 + 40) = v4;
  *(_OWORD *)(v5 + 24) = v7;
  *(_QWORD *)(v5 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_233146670(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_233129C70;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256039C00 + dword_256039C00))(a1, v4);
}

uint64_t sub_2331466E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 32);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_233129C70;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_233146750(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 32);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_23312759C;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_2331467B8()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2331467FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v4 = *(_QWORD *)(v1 + 64);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v1 + 32);
  v7 = *(_OWORD *)(v1 + 48);
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_233129C70;
  *(_QWORD *)(v5 + 56) = v4;
  *(_OWORD *)(v5 + 40) = v7;
  *(_OWORD *)(v5 + 24) = v6;
  *(_QWORD *)(v5 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_23314687C(uint64_t a1)
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
  v7[1] = sub_233129C70;
  return sub_23313F32C(a1, v4, v5, v6);
}

uint64_t sub_2331468E8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23314690C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2331465AC(a1, a2);
  return a1;
}

unint64_t sub_233146924()
{
  unint64_t result;

  result = qword_256039C88;
  if (!qword_256039C88)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256039C88);
  }
  return result;
}

uint64_t sub_233146960()
{
  uint64_t v0;

  return sub_233132570(v0);
}

id sub_233146978()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgress);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgress) = v2;

  return v2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2331469D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_233146A10()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_233146A4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = *(_QWORD *)(v1 + 56);
  v10 = *(_BYTE *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_233129C70;
  return sub_233130DB8(a1, v4, v5, v6, v7, v8, v9, v10);
}

char *sub_233146AF0(uint64_t a1)
{
  uint64_t v1;

  return sub_2331328B4(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_233146B08(uint64_t a1)
{
  uint64_t v1;

  return sub_233136BB4(a1, v1, &qword_256039CC8, (uint64_t)sub_233146B40, (uint64_t)&unk_250461488, (uint64_t)&unk_256039CD8);
}

uint64_t sub_233146B40(uint64_t a1)
{
  uint64_t v1;

  return sub_233136D1C(a1, v1, (uint64_t)&unk_250461500, (uint64_t)&unk_250461528, (uint64_t)&unk_256039D08);
}

uint64_t sub_233146B78()
{
  return objectdestroy_130Tm(&qword_256039CC8);
}

uint64_t sub_233146B84(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256039CC8) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_233129C70;
  return sub_233137354(a1, v5, v6, v7, v8);
}

uint64_t sub_233146C1C()
{
  return objectdestroy_134Tm(&qword_256039CC8);
}

uint64_t sub_233146C28(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v9;

  v9 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256039CC8) - 8) + 80);
  return sub_233137C68(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), v4 + ((v9 + 24) & ~v9));
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  sub_2331465AC(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_233146CCC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_233146CDC(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_233146D24(uint64_t a1)
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
  v7[1] = sub_233129C70;
  return sub_233136EF4(a1, v4, v5, v6);
}

uint64_t sub_233146D90(uint64_t a1)
{
  uint64_t v1;

  return sub_2331357A0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_233146D98(uint64_t a1)
{
  uint64_t v1;

  return sub_233135928(a1, v1);
}

uint64_t sub_233146DC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256039D20);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_233146E5C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256039D20) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[4];
  v9 = (uint64_t)v1 + v5;
  v10 = *(_QWORD *)((char *)v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_233129C70;
  return sub_233135D34(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_233146F0C()
{
  return objectdestroy_160Tm(&qword_256039D20);
}

uint64_t sub_233146F18(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, double a6)
{
  uint64_t v6;
  uint64_t v13;

  v13 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256039D20) - 8) + 80);
  return sub_23313668C(a1, a2, a3, a4, a5, v6 + ((v13 + 16) & ~v13), a6);
}

uint64_t sub_233146F9C(uint64_t a1)
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
  v7[1] = sub_233129C70;
  return sub_233135AE8(a1, v4, v5, v6);
}

uint64_t sub_233147008(uint64_t a1)
{
  uint64_t v1;

  return sub_233136BB4(a1, v1, &qword_256039D58, (uint64_t)sub_233147040, (uint64_t)&unk_2504615C8, (uint64_t)&unk_256039D68);
}

uint64_t sub_233147040(uint64_t a1)
{
  uint64_t v1;

  return sub_233136D1C(a1, v1, (uint64_t)&unk_250461668, (uint64_t)&unk_250461690, (uint64_t)&unk_256039D98);
}

uint64_t sub_233147078()
{
  return objectdestroy_130Tm(&qword_256039D58);
}

uint64_t sub_233147084(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256039D58) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_233129C70;
  return sub_233134B88(a1, v5, v6, v7, v8);
}

uint64_t sub_23314711C()
{
  return objectdestroy_134Tm(&qword_256039D58);
}

uint64_t objectdestroy_134Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v1 + v4, v2);
  return swift_deallocObject();
}

void sub_233147198(void *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256039D58) - 8) + 80);
  sub_233134F6C(a1, a2, a3, *(_QWORD *)(v3 + 16), v3 + ((v7 + 24) & ~v7));
}

uint64_t objectdestroy_71Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_233147230(uint64_t a1)
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
  v7[1] = sub_233129C70;
  return sub_233134728(a1, v4, v5, v6);
}

uint64_t sub_23314729C(uint64_t a1)
{
  uint64_t v1;

  return sub_233136BB4(a1, v1, &qword_256039DB0, (uint64_t)sub_2331472D4, (uint64_t)&unk_2504616B8, (uint64_t)&unk_256039DC0);
}

uint64_t sub_2331472D4(uint64_t a1)
{
  uint64_t v1;

  return sub_233135928(a1, v1);
}

uint64_t sub_2331472FC()
{
  return objectdestroy_130Tm(&qword_256039DB0);
}

uint64_t objectdestroy_130Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v1 + v4, v2);
  return swift_deallocObject();
}

uint64_t sub_233147380(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256039DB0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_233129C70;
  return sub_2331341B8(a1, v5, v6, v7, v8);
}

uint64_t sub_233147418()
{
  return objectdestroy_160Tm(&qword_256039DB0);
}

uint64_t objectdestroy_160Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

void sub_233147480(void *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256039DB0) - 8) + 80);
  sub_2331344CC(a1, a2, a3, v3 + ((v7 + 16) & ~v7));
}

uint64_t objectdestroy_102Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_233147508(uint64_t a1)
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
  v7[1] = sub_23312759C;
  return sub_233133F38(a1, v4, v5, v6);
}

uint64_t sub_2331475D8()
{
  return MEMORY[0x24BDCB498]();
}

uint64_t sub_2331475E4()
{
  return MEMORY[0x24BDCB568]();
}

uint64_t sub_2331475F0()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2331475FC()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_233147608()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_233147614()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_233147620()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_23314762C()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_233147638()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_233147644()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_233147650()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23314765C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_233147668()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_233147674()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_233147680()
{
  return MEMORY[0x24BE2D760]();
}

uint64_t sub_23314768C()
{
  return MEMORY[0x24BE2D768]();
}

uint64_t sub_233147698()
{
  return MEMORY[0x24BE2D770]();
}

uint64_t sub_2331476A4()
{
  return MEMORY[0x24BE2D778]();
}

uint64_t sub_2331476B0()
{
  return MEMORY[0x24BE2D780]();
}

uint64_t sub_2331476BC()
{
  return MEMORY[0x24BE2D788]();
}

uint64_t sub_2331476C8()
{
  return MEMORY[0x24BE2D790]();
}

uint64_t sub_2331476D4()
{
  return MEMORY[0x24BE2D7A0]();
}

uint64_t sub_2331476E0()
{
  return MEMORY[0x24BE2D7B0]();
}

uint64_t sub_2331476EC()
{
  return MEMORY[0x24BE2D7C0]();
}

uint64_t sub_2331476F8()
{
  return MEMORY[0x24BE2D7D0]();
}

uint64_t sub_233147704()
{
  return MEMORY[0x24BE2D7D8]();
}

uint64_t sub_233147710()
{
  return MEMORY[0x24BE2D7E8]();
}

uint64_t sub_23314771C()
{
  return MEMORY[0x24BE2D7F8]();
}

uint64_t sub_233147728()
{
  return MEMORY[0x24BE2D800]();
}

uint64_t sub_233147734()
{
  return MEMORY[0x24BE2D810]();
}

uint64_t sub_233147740()
{
  return MEMORY[0x24BE2D818]();
}

uint64_t sub_23314774C()
{
  return MEMORY[0x24BE2D828]();
}

uint64_t sub_233147758()
{
  return MEMORY[0x24BE2D838]();
}

uint64_t sub_233147764()
{
  return MEMORY[0x24BE2D840]();
}

uint64_t sub_233147770()
{
  return MEMORY[0x24BE2D888]();
}

uint64_t sub_23314777C()
{
  return MEMORY[0x24BE2D890]();
}

uint64_t sub_233147788()
{
  return MEMORY[0x24BE2D8A0]();
}

uint64_t sub_233147794()
{
  return MEMORY[0x24BE2D8A8]();
}

uint64_t sub_2331477A0()
{
  return MEMORY[0x24BE2D8B0]();
}

uint64_t sub_2331477AC()
{
  return MEMORY[0x24BE2D8B8]();
}

uint64_t sub_2331477B8()
{
  return MEMORY[0x24BE2D8C8]();
}

uint64_t sub_2331477C4()
{
  return MEMORY[0x24BE2D8D0]();
}

uint64_t sub_2331477D0()
{
  return MEMORY[0x24BE2D8D8]();
}

uint64_t sub_2331477DC()
{
  return MEMORY[0x24BE2D8E0]();
}

uint64_t sub_2331477E8()
{
  return MEMORY[0x24BE2D8E8]();
}

uint64_t sub_2331477F4()
{
  return MEMORY[0x24BE2D8F0]();
}

uint64_t sub_233147800()
{
  return MEMORY[0x24BE2D900]();
}

uint64_t sub_23314780C()
{
  return MEMORY[0x24BE2D908]();
}

uint64_t sub_233147818()
{
  return MEMORY[0x24BE2D910]();
}

uint64_t sub_233147824()
{
  return MEMORY[0x24BE2D928]();
}

uint64_t sub_233147830()
{
  return MEMORY[0x24BE2D938]();
}

uint64_t sub_23314783C()
{
  return MEMORY[0x24BE2D950]();
}

uint64_t sub_233147848()
{
  return MEMORY[0x24BE2D960]();
}

uint64_t sub_233147854()
{
  return MEMORY[0x24BE2D968]();
}

uint64_t sub_233147860()
{
  return MEMORY[0x24BE2D970]();
}

uint64_t sub_23314786C()
{
  return MEMORY[0x24BE2D980]();
}

uint64_t sub_233147878()
{
  return MEMORY[0x24BE2D990]();
}

uint64_t sub_233147884()
{
  return MEMORY[0x24BE2D998]();
}

uint64_t sub_233147890()
{
  return MEMORY[0x24BE2D9A0]();
}

uint64_t sub_23314789C()
{
  return MEMORY[0x24BE2D9A8]();
}

uint64_t sub_2331478A8()
{
  return MEMORY[0x24BE2D9B0]();
}

uint64_t sub_2331478B4()
{
  return MEMORY[0x24BE2D9B8]();
}

uint64_t sub_2331478C0()
{
  return MEMORY[0x24BE2D9C0]();
}

uint64_t sub_2331478CC()
{
  return MEMORY[0x24BE2D9C8]();
}

uint64_t sub_2331478D8()
{
  return MEMORY[0x24BE2D9D0]();
}

uint64_t sub_2331478E4()
{
  return MEMORY[0x24BE2D9F8]();
}

uint64_t sub_2331478F0()
{
  return MEMORY[0x24BE2DA00]();
}

uint64_t sub_2331478FC()
{
  return MEMORY[0x24BE2DA08]();
}

uint64_t sub_233147908()
{
  return MEMORY[0x24BE2DA10]();
}

uint64_t sub_233147914()
{
  return MEMORY[0x24BE2DA18]();
}

uint64_t sub_233147920()
{
  return MEMORY[0x24BE2DA28]();
}

uint64_t sub_23314792C()
{
  return MEMORY[0x24BE2DA30]();
}

uint64_t sub_233147938()
{
  return MEMORY[0x24BE2DA38]();
}

uint64_t sub_233147944()
{
  return MEMORY[0x24BE2DA40]();
}

uint64_t sub_233147950()
{
  return MEMORY[0x24BE2DA48]();
}

uint64_t sub_23314795C()
{
  return MEMORY[0x24BE2DA58]();
}

uint64_t sub_233147968()
{
  return MEMORY[0x24BE2DA60]();
}

uint64_t sub_233147974()
{
  return MEMORY[0x24BE2DA68]();
}

uint64_t sub_233147980()
{
  return MEMORY[0x24BE2DA70]();
}

uint64_t sub_23314798C()
{
  return MEMORY[0x24BE2DA78]();
}

uint64_t sub_233147998()
{
  return MEMORY[0x24BE2DA88]();
}

uint64_t sub_2331479A4()
{
  return MEMORY[0x24BE2DA90]();
}

uint64_t sub_2331479B0()
{
  return MEMORY[0x24BE2DA98]();
}

uint64_t sub_2331479BC()
{
  return MEMORY[0x24BE2DAA8]();
}

uint64_t sub_2331479C8()
{
  return MEMORY[0x24BE2DAB8]();
}

uint64_t sub_2331479D4()
{
  return MEMORY[0x24BE2DAC8]();
}

uint64_t sub_2331479E0()
{
  return MEMORY[0x24BE2DAD8]();
}

uint64_t sub_2331479EC()
{
  return MEMORY[0x24BE2DAE0]();
}

uint64_t sub_2331479F8()
{
  return MEMORY[0x24BE2DAE8]();
}

uint64_t sub_233147A04()
{
  return MEMORY[0x24BE2DAF0]();
}

uint64_t sub_233147A10()
{
  return MEMORY[0x24BE2DAF8]();
}

uint64_t sub_233147A1C()
{
  return MEMORY[0x24BE2DB00]();
}

uint64_t sub_233147A28()
{
  return MEMORY[0x24BE2DB08]();
}

uint64_t sub_233147A34()
{
  return MEMORY[0x24BE2DB10]();
}

uint64_t sub_233147A40()
{
  return MEMORY[0x24BE2DB20]();
}

uint64_t sub_233147A4C()
{
  return MEMORY[0x24BE2DB28]();
}

uint64_t sub_233147A58()
{
  return MEMORY[0x24BE2DB30]();
}

uint64_t sub_233147A64()
{
  return MEMORY[0x24BE2DB38]();
}

uint64_t sub_233147A70()
{
  return MEMORY[0x24BE2DB48]();
}

uint64_t sub_233147A7C()
{
  return MEMORY[0x24BE2DB50]();
}

uint64_t sub_233147A88()
{
  return MEMORY[0x24BE2DB58]();
}

uint64_t sub_233147A94()
{
  return MEMORY[0x24BE2DB60]();
}

uint64_t sub_233147AA0()
{
  return MEMORY[0x24BE2DB68]();
}

uint64_t sub_233147AAC()
{
  return MEMORY[0x24BE2DB70]();
}

uint64_t sub_233147AB8()
{
  return MEMORY[0x24BE2DB78]();
}

uint64_t sub_233147AC4()
{
  return MEMORY[0x24BE2DB80]();
}

uint64_t sub_233147AD0()
{
  return MEMORY[0x24BE2DB88]();
}

uint64_t sub_233147ADC()
{
  return MEMORY[0x24BE2DB90]();
}

uint64_t sub_233147AE8()
{
  return MEMORY[0x24BE2DB98]();
}

uint64_t sub_233147AF4()
{
  return MEMORY[0x24BE2DBA8]();
}

uint64_t sub_233147B00()
{
  return MEMORY[0x24BE2DCA0]();
}

uint64_t sub_233147B0C()
{
  return MEMORY[0x24BE2DCB8]();
}

uint64_t sub_233147B18()
{
  return MEMORY[0x24BE2DCC0]();
}

uint64_t sub_233147B24()
{
  return MEMORY[0x24BE2DCC8]();
}

uint64_t sub_233147B30()
{
  return MEMORY[0x24BE2DCD0]();
}

uint64_t sub_233147B3C()
{
  return MEMORY[0x24BE2DCD8]();
}

uint64_t sub_233147B48()
{
  return MEMORY[0x24BE2DCF0]();
}

uint64_t sub_233147B54()
{
  return MEMORY[0x24BE2DCF8]();
}

uint64_t sub_233147B60()
{
  return MEMORY[0x24BE2DD00]();
}

uint64_t sub_233147B6C()
{
  return MEMORY[0x24BE5B540]();
}

uint64_t sub_233147B78()
{
  return MEMORY[0x24BE5B548]();
}

uint64_t sub_233147B84()
{
  return MEMORY[0x24BE5B550]();
}

uint64_t sub_233147B90()
{
  return MEMORY[0x24BE5B6A0]();
}

uint64_t sub_233147B9C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_233147BA8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_233147BB4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_233147BC0()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_233147BCC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_233147BD8()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_233147BE4()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_233147BF0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_233147BFC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_233147C08()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_233147C14()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_233147C20()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_233147C2C()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_233147C38()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_233147C44()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_233147C50()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_233147C5C()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_233147C68()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_233147C74()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_233147C80()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_233147C8C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_233147C98()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_233147CA4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_233147CB0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_233147CBC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_233147CC8()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_233147CD4()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_233147CE0()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t sub_233147CEC()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_233147CF8()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_233147D04()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_233147D10()
{
  return MEMORY[0x24BEE6A68]();
}

uint64_t sub_233147D1C()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_233147D28()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_233147D34()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_233147D40()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_233147D4C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_233147D58()
{
  return MEMORY[0x24BEE5EB8]();
}

uint64_t sub_233147D64()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_233147D70()
{
  return MEMORY[0x24BDD0248]();
}

uint64_t sub_233147D7C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_233147D88()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_233147D94()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_233147DA0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_233147DAC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_233147DB8()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_233147DC4()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_233147DD0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_233147DDC()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_233147DE8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_233147DF4()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_233147E00()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_233147E0C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_233147E18()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_233147E24()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_233147E30()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_233147E3C()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_233147E48()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_233147E54()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_233147E60()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_233147E6C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_233147E78()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_233147E84()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_233147E90()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_233147E9C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_233147EA8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_233147EB4()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_233147EC0()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_233147ECC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_233147ED8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_233147EE4()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_233147EF0()
{
  return MEMORY[0x24BEE4828]();
}

uint64_t sub_233147EFC()
{
  return MEMORY[0x24BEE4830]();
}

uint64_t sub_233147F08()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_233147F14()
{
  return MEMORY[0x24BEE4A10]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x24BDAD188](__x);
  return result;
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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


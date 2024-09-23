id ContactProviderExtension.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  id result;

  result = sub_233099100(v4, a1, a2, a3);
  *a4 = result;
  return result;
}

uint64_t dispatch thunk of ContactProviderExtension.configure(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ContactProviderExtension.invalidate()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 32) + *(_QWORD *)(a2 + 32));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_233098F04;
  return v7(a1, a2);
}

uint64_t sub_233098F04()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_233098F4C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for _ExtensionConfiguration(255, *a1, a1[1], a4);
  JUMPOUT(0x23492F248);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_233098F84(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_233098FA4(uint64_t result, int a2, int a3)
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

void type metadata accessor for os_activity_scope_state_s(uint64_t a1)
{
  sub_233098FF4(a1, &qword_256034EE0);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_233098FF4(a1, &qword_256034EE8);
}

void sub_233098FF4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_233099038()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for _ExtensionConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _ExtensionConfiguration);
}

uint64_t sub_23309904C(void *a1, uint64_t a2)
{
  id v4;

  v4 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_256039C70);
  objc_msgSend(a1, sel_setExportedInterface_, v4);

  objc_msgSend(a1, sel_setExportedObject_, a2);
  objc_msgSend(a1, sel_resume);
  return 1;
}

uint64_t sub_2330990E4(void *a1)
{
  uint64_t *v1;

  sub_23309904C(a1, *v1);
  return 1;
}

id sub_233099100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  type metadata accessor for ExtensionHost(0, a2, a3, a4);
  return sub_2330AFC70(a1, v5, v6, v7);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23492F1F4](a1, v6, a5);
}

uint64_t sub_23309915C(uint64_t *a1, _QWORD *a2, __int128 *a3, char a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];
  __int128 v16[2];

  v11 = *a1;
  v10 = a1[1];
  *(_QWORD *)(v5 + 152) = 0;
  *(_QWORD *)(v5 + 160) = 0;
  *(_QWORD *)(v5 + 144) = 0;
  *(_OWORD *)(v5 + 168) = xmmword_2330B9510;
  *(_OWORD *)(v5 + 192) = xmmword_2330B9520;
  sub_23309B090((uint64_t)a2, v5 + 16);
  v12 = a2[3];
  v13 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v12);
  v15[0] = v11;
  v15[1] = v10;
  (*(void (**)(__int128 *__return_ptr, _QWORD *, uint64_t, uint64_t))(v13 + 8))(v16, v15, v12, v13);
  swift_bridgeObjectRelease();
  sub_23309B0D4(v16, v5 + 104);
  sub_23309B0D4(a3, v5 + 56);
  *(_BYTE *)(v5 + 96) = a4;
  *(_QWORD *)(v5 + 184) = a5;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a2);
  return v5;
}

uint64_t sub_233099244(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v2 + 344) = v1;
  v4 = sub_2330B8C9C();
  *(_QWORD *)(v2 + 352) = v4;
  *(_QWORD *)(v2 + 360) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 368) = swift_task_alloc();
  *(_QWORD *)(v2 + 376) = swift_task_alloc();
  v5 = sub_2330B8CB4();
  *(_QWORD *)(v2 + 384) = v5;
  *(_QWORD *)(v2 + 392) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 400) = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035280);
  *(_QWORD *)(v2 + 408) = v6;
  *(_QWORD *)(v2 + 416) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v2 + 424) = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035288);
  *(_QWORD *)(v2 + 432) = v7;
  *(_QWORD *)(v2 + 440) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v2 + 448) = swift_task_alloc();
  *(_OWORD *)(v2 + 456) = *(_OWORD *)a1;
  *(_QWORD *)(v2 + 472) = *(_QWORD *)(a1 + 16);
  return swift_task_switch();
}

uint64_t sub_23309934C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  _BYTE *v14;
  id v15;
  id v16;
  char v17;
  _QWORD *v18;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);

  v1 = *(_QWORD **)(v0 + 344);
  v22 = v1;
  if (v1[18])
  {
    swift_retain();
    sub_2330B89B4();
    swift_release();
    v1 = *(_QWORD **)(v0 + 344);
  }
  v26 = *(_QWORD *)(v0 + 464);
  v27 = *(_QWORD *)(v0 + 472);
  v2 = *(_QWORD *)(v0 + 448);
  v3 = *(_QWORD *)(v0 + 432);
  v4 = *(_QWORD *)(v0 + 440);
  v5 = *(_QWORD *)(v0 + 424);
  v24 = *(_QWORD *)(v0 + 416);
  v25 = *(_QWORD *)(v0 + 456);
  v23 = *(_QWORD *)(v0 + 408);
  sub_23309B090((uint64_t)(v1 + 7), v0 + 16);
  type metadata accessor for ItemChangeObserverImpl();
  v6 = swift_allocObject();
  *(_QWORD *)(v0 + 480) = v6;
  v7 = v6 + OBJC_IVAR____TtC15ContactProvider22ItemChangeObserverImpl__state;
  *(_QWORD *)(v0 + 136) = 0;
  *(_QWORD *)(v0 + 144) = 0;
  *(_QWORD *)(v0 + 128) = 0;
  *(_BYTE *)(v0 + 152) = 0x80;
  sub_2330B89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v7, v2, v3);
  *(_QWORD *)(v6 + 16) = 5;
  sub_23309B0D4((__int128 *)(v0 + 16), v6 + 24);
  swift_beginAccess();
  sub_2330B89CC();
  swift_endAccess();
  swift_allocObject();
  swift_weakInit();
  sub_23309AE98();
  v8 = sub_2330B8A08();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v5, v23);
  v22[18] = v8;
  swift_release();
  v9 = v1[20];
  v10 = v1[21];
  v1[20] = v25;
  v1[21] = v26;
  v1[22] = v27;
  sub_23309AB3C(v25, v26);
  sub_23309AA20(v9, v10);
  v11 = v1[21];
  if (v11 >> 60 == 15)
  {
    v12 = *(void **)(*(_QWORD *)(v0 + 344) + 152);
    if (!v12)
      goto LABEL_8;
    sub_23309ADE8();
    v13 = (void *)swift_allocError();
    *v14 = 7;
    v15 = v12;
    v16 = v12;
    v17 = == infix(_:_:)();

    if ((v17 & 1) != 0)
    {
      sub_23309B090(*(_QWORD *)(v0 + 344) + 104, v0 + 56);
      v28 = (uint64_t (*)(uint64_t))((char *)&dword_256036078 + dword_256036078);
      v18 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 560) = v18;
      *v18 = v0;
      v18[1] = sub_23309A518;
      return v28(v0 + 56);
    }
    else
    {
LABEL_8:
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  else
  {
    *(_QWORD *)(v0 + 488) = v11;
    v20 = *(_QWORD **)(v0 + 344);
    v21 = v20[20];
    *(_QWORD *)(v0 + 496) = v21;
    *(_QWORD *)(v0 + 504) = v20[22];
    *(_QWORD *)(v0 + 512) = v20[23];
    sub_23309AB3C(v21, v11);
    return swift_task_switch();
  }
}

uint64_t sub_2330996BC()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 121) = *(_BYTE *)(*(_QWORD *)(v0 + 512) + 112);
  return swift_task_switch();
}

uint64_t sub_2330996DC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  void *v5;
  _BYTE *v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void (*v19)(uint64_t, uint64_t);
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if ((*(_BYTE *)(v0 + 121) & 1) != 0)
  {
    if (qword_256034E00 != -1)
      swift_once();
    v1 = sub_2330B89A8();
    __swift_project_value_buffer(v1, (uint64_t)qword_256037A50);
    v2 = sub_2330B8990();
    v3 = sub_2330B8B94();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_233097000, v2, v3, "ItemChangeSession.sync() stopping, extension was invalidated", v4, 2u);
      MEMORY[0x23492F2E4](v4, -1, -1);
    }

    sub_23309ADE8();
    v5 = (void *)swift_allocError();
    *v6 = 8;
    v7 = sub_2330A354C();
    v8 = *(_QWORD *)(v0 + 496);
    v9 = *(_QWORD *)(v0 + 488);
    if ((v7 & 1) != 0)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      *(_QWORD *)(v0 + 104) = 0;
      *(_QWORD *)(v0 + 112) = 0;
      *(_QWORD *)(v0 + 96) = v5;
      *(_BYTE *)(v0 + 120) = 64;
      swift_retain();
      sub_2330B89F0();
    }
    else
    {

    }
    sub_23309AA20(v8, v9);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 496);
    v10 = *(_QWORD *)(v0 + 504);
    v13 = *(_QWORD *)(v0 + 480);
    v12 = *(_QWORD *)(v0 + 488);
    v14 = *(_QWORD *)(v0 + 400);
    v15 = *(_QWORD *)(v0 + 368);
    v24 = *(_QWORD *)(v0 + 376);
    v25 = *(_QWORD *)(v0 + 360);
    v16 = *(_QWORD *)(v0 + 344);
    v26 = *(_QWORD *)(v0 + 352);
    swift_beginAccess();
    v23 = 1000000000000000000 * qword_256036060;
    v17 = ((qword_256036060 >> 63) & 0xF21F494C589C0000)
        + (((unint64_t)qword_256036060 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
    v18 = (_QWORD *)swift_allocObject();
    *(_QWORD *)(v0 + 520) = v18;
    v18[2] = v16;
    v18[3] = v11;
    v18[4] = v12;
    v18[5] = v10;
    v18[6] = v13;
    sub_23309AFD8(v11, v12);
    swift_retain();
    swift_retain();
    sub_2330B8CA8();
    sub_2330B8C84();
    MEMORY[0x23492EC6C](v23, v17);
    v19 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    *(_QWORD *)(v0 + 528) = v19;
    v19(v15, v26);
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 536) = v20;
    v20[2] = &unk_2560352A0;
    v20[3] = v18;
    v20[4] = v24;
    v20[5] = v14;
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 544) = v21;
    *v21 = v0;
    v21[1] = sub_233099A40;
    return sub_2330B8D14();
  }
}

uint64_t sub_233099A40()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 552) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_233099AAC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  _BYTE *v10;
  id v11;
  id v12;
  char v13;
  _QWORD *v14;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);

  v1 = *(_QWORD *)(v0 + 496);
  v2 = *(_QWORD *)(v0 + 488);
  v4 = *(_QWORD *)(v0 + 392);
  v3 = *(_QWORD *)(v0 + 400);
  v5 = *(_QWORD *)(v0 + 384);
  (*(void (**)(_QWORD, _QWORD))(v0 + 528))(*(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 352));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_release();
  sub_23309AA20(v1, v2);
  v6 = *(_QWORD **)(v0 + 344);
  v7 = v6[21];
  if (v7 >> 60 == 15)
  {
    v8 = (void *)v6[19];
    if (!v8)
      goto LABEL_6;
    sub_23309ADE8();
    v9 = (void *)swift_allocError();
    *v10 = 7;
    v11 = v8;
    v12 = v8;
    v13 = == infix(_:_:)();

    if ((v13 & 1) != 0)
    {
      sub_23309B090(*(_QWORD *)(v0 + 344) + 104, v0 + 56);
      v17 = (uint64_t (*)(uint64_t))((char *)&dword_256036078 + dword_256036078);
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 560) = v14;
      *v14 = v0;
      v14[1] = sub_23309A518;
      return v17(v0 + 56);
    }
    else
    {
LABEL_6:
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  else
  {
    *(_QWORD *)(v0 + 488) = v7;
    v16 = v6[20];
    *(_QWORD *)(v0 + 496) = v16;
    *(_QWORD *)(v0 + 504) = v6[22];
    *(_QWORD *)(v0 + 512) = v6[23];
    sub_23309AB3C(v16, v7);
    return swift_task_switch();
  }
}

uint64_t sub_233099CA4()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  void *v13;
  _BYTE *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  _BYTE *v20;
  id v21;
  char v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  _QWORD *v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  void *v46;
  _BYTE *v47;
  id v48;
  char v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  unint64_t v58;
  _QWORD *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  _BYTE *v63;
  id v64;
  id v65;
  char v66;
  _QWORD *v67;
  uint64_t v69;
  uint64_t (*v70)(uint64_t);

  v1 = *(void **)(v0 + 552);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
  v4 = *(_QWORD *)(v0 + 392);
  v3 = *(_QWORD *)(v0 + 400);
  v6 = *(_QWORD *)(v0 + 376);
  v5 = *(_QWORD *)(v0 + 384);
  v7 = *(_QWORD *)(v0 + 352);
  swift_task_dealloc();
  v2(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_release();
  *(_QWORD *)(v0 + 336) = v1;
  v8 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B0);
  if ((swift_dynamicCast() & 1) != 0)
  {

    if (qword_256034E00 != -1)
      swift_once();
    v9 = sub_2330B89A8();
    __swift_project_value_buffer(v9, (uint64_t)qword_256037A50);
    v10 = sub_2330B8990();
    v11 = sub_2330B8B94();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_233097000, v10, v11, "ItemChangeSession.sync() did timeout", v12, 2u);
      MEMORY[0x23492F2E4](v12, -1, -1);
    }

    sub_23309ADE8();
    v13 = (void *)swift_allocError();
    *v14 = 7;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2330B89E4();
    swift_release();
    swift_release();
    v15 = *(_QWORD *)(v0 + 192);
    v16 = *(_QWORD *)(v0 + 200);
    v17 = *(_QWORD *)(v0 + 208);
    v18 = *(unsigned __int8 *)(v0 + 216);
    v19 = (void *)swift_allocError();
    *v20 = 7;
    if (v18 >> 6 == 1)
    {
      sub_23309B074(v15, v16, v17, v18);
      v21 = v19;
      v22 = == infix(_:_:)();
      sub_23309AB20(v15, v16, v17, v18);
      sub_23309AB20((uint64_t)v19, 0, 0, 0x40u);

      sub_23309AB20(v15, v16, v17, v18);
      if ((v22 & 1) != 0)
      {

LABEL_15:
        v36 = *(_QWORD *)(v0 + 496);
        v37 = *(_QWORD *)(v0 + 488);
        v38 = *(_QWORD **)(v0 + 344);
        v39 = v38[20];
        v40 = v38[21];
        *((_OWORD *)v38 + 10) = xmmword_2330B9530;
        v38[22] = 0;
        sub_23309AA20(v39, v40);
        sub_23309AA20(v36, v37);
        v41 = *(void **)(v0 + 336);
        goto LABEL_23;
      }
    }
    else
    {
      sub_23309B074(v15, v16, v17, v18);
      v35 = v19;
      sub_23309AB20(v15, v16, v17, v18);
      sub_23309AB20((uint64_t)v19, 0, 0, 0x40u);

      sub_23309AB20(v15, v16, v17, v18);
    }
    swift_getKeyPath();
    swift_getKeyPath();
    *(_QWORD *)(v0 + 168) = 0;
    *(_QWORD *)(v0 + 176) = 0;
    *(_QWORD *)(v0 + 160) = v13;
    *(_BYTE *)(v0 + 184) = 64;
    swift_retain();
    sub_2330B89F0();
    goto LABEL_15;
  }

  if (qword_256034E00 != -1)
    swift_once();
  v23 = *(void **)(v0 + 552);
  v24 = sub_2330B89A8();
  __swift_project_value_buffer(v24, (uint64_t)qword_256037A50);
  v25 = v23;
  v26 = v23;
  v27 = sub_2330B8990();
  v28 = sub_2330B8B94();
  v29 = os_log_type_enabled(v27, v28);
  v30 = *(void **)(v0 + 552);
  if (v29)
  {
    v31 = swift_slowAlloc();
    v32 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v31 = 138543362;
    v33 = v30;
    v34 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v31 + 4) = v34;
    *v32 = v34;

    _os_log_impl(&dword_233097000, v27, v28, "ItemChangeSession.sync() error %{public}@", (uint8_t *)v31, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B8);
    swift_arrayDestroy();
    MEMORY[0x23492F2E4](v32, -1, -1);
    MEMORY[0x23492F2E4](v31, -1, -1);
  }
  else
  {

  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330B89E4();
  swift_release();
  swift_release();
  v43 = *(_QWORD *)(v0 + 224);
  v42 = *(_QWORD *)(v0 + 232);
  v44 = *(_QWORD *)(v0 + 240);
  v45 = *(unsigned __int8 *)(v0 + 248);
  sub_23309ADE8();
  v46 = (void *)swift_allocError();
  *v47 = 7;
  if (v45 >> 6 == 1)
  {
    sub_23309B074(v43, v42, v44, v45);
    v48 = v46;
    v49 = == infix(_:_:)();
    sub_23309AB20(v43, v42, v44, v45);
    sub_23309AB20((uint64_t)v46, 0, 0, 0x40u);

    sub_23309AB20(v43, v42, v44, v45);
    if ((v49 & 1) != 0)
      goto LABEL_22;
  }
  else
  {
    sub_23309B074(v43, v42, v44, v45);
    v50 = v46;
    sub_23309AB20(v43, v42, v44, v45);
    sub_23309AB20((uint64_t)v46, 0, 0, 0x40u);

    sub_23309AB20(v43, v42, v44, v45);
  }
  v51 = *(void **)(v0 + 552);
  swift_getKeyPath();
  swift_getKeyPath();
  *(_QWORD *)(v0 + 264) = 0;
  *(_QWORD *)(v0 + 272) = 0;
  *(_QWORD *)(v0 + 256) = v51;
  *(_BYTE *)(v0 + 280) = 64;
  swift_retain();
  v52 = v51;
  sub_2330B89F0();
LABEL_22:
  v53 = *(void **)(v0 + 552);
  v54 = *(_QWORD *)(v0 + 496);
  v55 = *(_QWORD *)(v0 + 488);
  v56 = *(_QWORD **)(v0 + 344);
  v57 = v56[20];
  v58 = v56[21];
  *((_OWORD *)v56 + 10) = xmmword_2330B9530;
  v56[22] = 0;
  sub_23309AA20(v57, v58);
  sub_23309AA20(v54, v55);
  v41 = v53;
LABEL_23:

  v59 = *(_QWORD **)(v0 + 344);
  v60 = v59[21];
  if (v60 >> 60 == 15)
  {
    v61 = (void *)v59[19];
    if (!v61)
      goto LABEL_28;
    sub_23309ADE8();
    v62 = (void *)swift_allocError();
    *v63 = 7;
    v64 = v61;
    v65 = v61;
    v66 = == infix(_:_:)();

    if ((v66 & 1) != 0)
    {
      sub_23309B090(*(_QWORD *)(v0 + 344) + 104, v0 + 56);
      v70 = (uint64_t (*)(uint64_t))((char *)&dword_256036078 + dword_256036078);
      v67 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 560) = v67;
      *v67 = v0;
      v67[1] = sub_23309A518;
      return v70(v0 + 56);
    }
    else
    {
LABEL_28:
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  else
  {
    *(_QWORD *)(v0 + 488) = v60;
    v69 = v59[20];
    *(_QWORD *)(v0 + 496) = v69;
    *(_QWORD *)(v0 + 504) = v59[22];
    *(_QWORD *)(v0 + 512) = v59[23];
    sub_23309AB3C(v69, v60);
    return swift_task_switch();
  }
}

uint64_t sub_23309A518()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *v0 + 56;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v1);
  return swift_task_switch();
}

uint64_t sub_23309A578()
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

uint64_t sub_23309A5E4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;
  _QWORD v6[3];
  char v7;

  v1 = *a1;
  v2 = a1[1];
  v3 = a1[2];
  v4 = *((_BYTE *)a1 + 24);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v6[0] = v1;
    v6[1] = v2;
    v6[2] = v3;
    v7 = v4;
    sub_23309A800((uint64_t)v6);
    return swift_release();
  }
  return result;
}

uint64_t sub_23309A664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[18] = a5;
  v6[19] = a6;
  v6[16] = a3;
  v6[17] = a4;
  v6[15] = a2;
  return swift_task_switch();
}

uint64_t sub_23309A684()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  __int128 v7;

  v2 = *(_QWORD *)(v0 + 144);
  v1 = *(_QWORD *)(v0 + 152);
  v7 = *(_OWORD *)(v0 + 128);
  sub_23309B090(*(_QWORD *)(v0 + 120) + 104, v0 + 16);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v3);
  *(_OWORD *)(v0 + 96) = v7;
  *(_QWORD *)(v0 + 112) = v2;
  *(_QWORD *)(v0 + 80) = type metadata accessor for ItemChangeObserverImpl();
  *(_QWORD *)(v0 + 88) = &protocol witness table for ItemChangeObserverImpl;
  *(_QWORD *)(v0 + 56) = v1;
  *(_QWORD *)&v7 = **(int **)(v4 + 16) + *(_QWORD *)(v4 + 16);
  swift_retain();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v5;
  *v5 = v0;
  v5[1] = sub_23309A76C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v7)(v0 + 96, v0 + 56, v3, v4);
}

uint64_t sub_23309A76C()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *v0 + 56;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v1);
  return swift_task_switch();
}

uint64_t sub_23309A7CC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23309A800(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD *, _QWORD, uint64_t, uint64_t);
  void *v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD v20[3];
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;

  v2 = v1;
  v4 = *(void **)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(unsigned __int8 *)(a1 + 24);
  if (v6 >> 6)
  {
    if (v6 >> 6 != 1)
      return;
    v7 = (void *)v1[19];
    v2[19] = v4;
    v8 = v4;
    v9 = v4;

    sub_23309B090((uint64_t)(v2 + 7), (uint64_t)v21);
    v10 = v22;
    v11 = v23;
    __swift_project_boxed_opaque_existential_1(v21, v22);
    (*(void (**)(void *, uint64_t, uint64_t))(v11 + 128))(v4, v10, v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    v12 = v2[20];
    v13 = v2[21];
    *((_OWORD *)v2 + 10) = xmmword_2330B9530;
    v2[22] = 0;
  }
  else
  {
    sub_23309B090((uint64_t)(v1 + 7), (uint64_t)v21);
    v14 = v22;
    v15 = v23;
    __swift_project_boxed_opaque_existential_1(v21, v22);
    v20[0] = v4;
    v20[1] = v3;
    v20[2] = v5;
    v16 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v15 + 120);
    sub_23309AB3C((uint64_t)v4, v3);
    v16(v20, v6 & 1, v14, v15);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    if ((v6 & 1) != 0)
    {
      sub_23309AB3C((uint64_t)v4, v3);
      v17 = v4;
      v18 = v3;
      v19 = v5;
    }
    else
    {
      v17 = 0;
      v19 = 0;
      v18 = 0xF000000000000000;
    }
    v12 = v1[20];
    v13 = v1[21];
    v1[20] = v17;
    v1[21] = v18;
    v1[22] = v19;
  }
  sub_23309AA20(v12, v13);
  sub_23309AB20((uint64_t)v4, v3, v5, v6);
}

uint64_t ItemChangeSession.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  swift_release();

  sub_23309AA20(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168));
  swift_release();
  return v0;
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

uint64_t sub_23309AA20(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23309AA34(a1, a2);
  return a1;
}

uint64_t sub_23309AA34(uint64_t a1, unint64_t a2)
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

uint64_t ItemChangeSession.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  swift_release();

  sub_23309AA20(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168));
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ItemChangeSession()
{
  return objc_opt_self();
}

uint64_t method lookup function for ItemChangeSession()
{
  return swift_lookUpClassMethod();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_23309AB20(uint64_t a1, unint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 >> 6 == 1)
  {

  }
  else if (!(a4 >> 6))
  {
    sub_23309AA34(a1, a2);
  }
}

uint64_t sub_23309AB3C(uint64_t a1, unint64_t a2)
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

void sub_23309AB80(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  _BYTE *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (*v12)(void *, uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;

  if ((uint64_t)a1[24] <= 0)
  {
    if (qword_256034E00 != -1)
      swift_once();
    v16 = sub_2330B89A8();
    __swift_project_value_buffer(v16, (uint64_t)qword_256037A50);
    v17 = sub_2330B8990();
    v18 = sub_2330B8B94();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_233097000, v17, v18, "ItemChangeSession.sync() will retry enumerating the sync anchor", v19, 2u);
      MEMORY[0x23492F2E4](v19, -1, -1);
    }

    v20 = a1[24];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      a1[24] = v22;
      return;
    }
    __break(1u);
  }
  else
  {
    if (qword_256034E00 != -1)
      swift_once();
    v2 = sub_2330B89A8();
    __swift_project_value_buffer(v2, (uint64_t)qword_256037A50);
    v3 = sub_2330B8990();
    v4 = sub_2330B8B94();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_233097000, v3, v4, "ItemChangeSession.sync() did fail to save", v5, 2u);
      MEMORY[0x23492F2E4](v5, -1, -1);
    }

    sub_23309ADE8();
    v6 = swift_allocError();
    *v7 = 2;
    v8 = (void *)a1[19];
    a1[19] = v6;

    sub_23309B090((uint64_t)(a1 + 7), (uint64_t)v23);
    v9 = v24;
    v10 = v25;
    __swift_project_boxed_opaque_existential_1(v23, v24);
    v11 = (void *)a1[19];
    if (v11)
    {
      v12 = *(void (**)(void *, uint64_t, uint64_t))(v10 + 112);
      v13 = v11;
      v12(v11, v9, v10);

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      v14 = a1[20];
      v15 = a1[21];
      *((_OWORD *)a1 + 10) = xmmword_2330B9530;
      a1[22] = 0;
      sub_23309AA20(v14, v15);
      return;
    }
  }
  __break(1u);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_23309ADE8()
{
  unint64_t result;

  result = qword_256036630;
  if (!qword_256036630)
  {
    result = MEMORY[0x23492F248](&protocol conformance descriptor for ContactProviderError, &type metadata for ContactProviderError);
    atomic_store(result, (unint64_t *)&qword_256036630);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23492F230]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23309AE6C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23309AE90(uint64_t *a1)
{
  return sub_23309A5E4(a1);
}

unint64_t sub_23309AE98()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256035290;
  if (!qword_256035290)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256035280);
    result = MEMORY[0x23492F248](MEMORY[0x24BDB9EE8], v1);
    atomic_store(result, &qword_256035290);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23492F23C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23309AF28()
{
  uint64_t v0;

  swift_release();
  sub_23309AA34(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23309AF5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  __int128 v6;

  v5 = *(_OWORD *)(v0 + 32);
  v6 = *(_OWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_23309B0EC;
  *(_QWORD *)(v3 + 152) = v2;
  *(_OWORD *)(v3 + 136) = v5;
  *(_OWORD *)(v3 + 120) = v6;
  return swift_task_switch();
}

uint64_t sub_23309AFD8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23309AB3C(a1, a2);
  return a1;
}

uint64_t sub_23309AFEC(uint64_t a1, uint64_t a2)
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
  v10[1] = sub_233098F04;
  return sub_2330ADD38(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_23309B074(uint64_t a1, unint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 >> 6 == 1)
    return (uint64_t)(id)a1;
  if (!(a4 >> 6))
    return sub_23309AB3C(a1, a2);
  return a1;
}

uint64_t sub_23309B090(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23309B0D4(__int128 *a1, uint64_t a2)
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

uint64_t sub_23309B0F0(uint64_t a1, _QWORD *a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(__int128 *__return_ptr, _QWORD *, uint64_t, uint64_t);
  _QWORD v15[2];
  __int128 v16[2];

  v6 = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v6 + 144) = 0;
  *(_QWORD *)(v6 + 152) = 0;
  *(_QWORD *)(v6 + 160) = 0;
  *(_OWORD *)(v6 + 168) = xmmword_2330B9510;
  *(_OWORD *)(v6 + 192) = xmmword_2330B9520;
  sub_23309B090((uint64_t)a2, v6 + 16);
  sub_23309B090(a3, v6 + 56);
  *(_BYTE *)(v6 + 96) = a4;
  v11 = a2[3];
  v12 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v11);
  if (qword_256034DF0 != -1)
    swift_once();
  v15[0] = qword_256035E80;
  v15[1] = *(_QWORD *)algn_256035E88;
  v13 = *(void (**)(__int128 *__return_ptr, _QWORD *, uint64_t, uint64_t))(v12 + 8);
  swift_bridgeObjectRetain();
  v13(v16, v15, v11, v12);
  __swift_destroy_boxed_opaque_existential_1(a3);
  swift_bridgeObjectRelease();
  sub_23309B0D4(v16, v6 + 104);
  *(_QWORD *)(v6 + 184) = a5;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a2);
  return v6;
}

uint64_t sub_23309B214(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v2 + 376) = v1;
  v4 = sub_2330B8C9C();
  *(_QWORD *)(v2 + 384) = v4;
  *(_QWORD *)(v2 + 392) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 400) = swift_task_alloc();
  *(_QWORD *)(v2 + 408) = swift_task_alloc();
  v5 = sub_2330B8CB4();
  *(_QWORD *)(v2 + 416) = v5;
  *(_QWORD *)(v2 + 424) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 432) = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035438);
  *(_QWORD *)(v2 + 440) = v6;
  *(_QWORD *)(v2 + 448) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v2 + 456) = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035440);
  *(_QWORD *)(v2 + 464) = v7;
  *(_QWORD *)(v2 + 472) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v2 + 480) = swift_task_alloc();
  *(_OWORD *)(v2 + 488) = *(_OWORD *)a1;
  *(_QWORD *)(v2 + 504) = *(_QWORD *)(a1 + 16);
  return swift_task_switch();
}

uint64_t sub_23309B31C()
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
  _UNKNOWN **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  _BYTE *v19;
  id v20;
  id v21;
  char v22;
  _QWORD *v23;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t (*v31)(uint64_t);

  v1 = *(_QWORD *)(v0 + 376);
  v2 = v1;
  if (*(_QWORD *)(v1 + 144))
  {
    swift_retain();
    sub_2330B89B4();
    swift_release();
    v2 = *(_QWORD *)(v0 + 376);
  }
  v4 = *(_QWORD *)(v0 + 472);
  v3 = *(_QWORD *)(v0 + 480);
  v5 = *(_QWORD *)(v0 + 464);
  v29 = *(_QWORD *)(v0 + 448);
  v27 = *(_QWORD *)(v0 + 456);
  v28 = *(_QWORD *)(v0 + 440);
  sub_23309B090(v2 + 56, v0 + 16);
  v6 = type metadata accessor for ItemContentObserverImpl();
  v7 = swift_allocObject();
  *(_QWORD *)(v0 + 512) = v7;
  v8 = v7 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl__state;
  *(_OWORD *)(v0 + 320) = xmmword_2330B9630;
  *(_QWORD *)(v0 + 336) = 0;
  sub_2330B89C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v8, v3, v5);
  *(_QWORD *)(v7 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize) = 20;
  sub_23309B0D4((__int128 *)(v0 + 16), v7 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_store);
  swift_beginAccess();
  sub_2330B89CC();
  swift_endAccess();
  swift_allocObject();
  swift_weakInit();
  sub_23309CA68();
  v9 = sub_2330B8A08();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v27, v28);
  *(_QWORD *)(v1 + 144) = v9;
  swift_release();
  v10 = &protocol witness table for ItemContentObserverImpl;
  if (*(_BYTE *)(v2 + 96) == 1)
  {
    *(_QWORD *)(v0 + 240) = v6;
    *(_QWORD *)(v0 + 248) = &protocol witness table for ItemContentObserverImpl;
    *(_QWORD *)(v0 + 216) = v7;
    v6 = type metadata accessor for ItemContentObserverActivityLoggingDecorator();
    v11 = swift_allocObject();
    sub_23309B0D4((__int128 *)(v0 + 216), v11 + 16);
    v10 = &protocol witness table for ItemContentObserverActivityLoggingDecorator;
  }
  else
  {
    v11 = v7;
  }
  v12 = *(_QWORD *)(v0 + 488);
  v13 = *(_QWORD *)(v0 + 376);
  *(_QWORD *)(v0 + 160) = v6;
  *(_QWORD *)(v0 + 168) = v10;
  *(_QWORD *)(v0 + 136) = v11;
  v14 = *(_QWORD *)(v13 + 160);
  v15 = *(_QWORD *)(v13 + 168);
  v30 = *(_OWORD *)(v0 + 496);
  *(_QWORD *)(v13 + 160) = v12;
  *(_OWORD *)(v13 + 168) = v30;
  swift_retain();
  sub_23309AB3C(v12, v30);
  sub_23309AA20(v14, v15);
  v16 = *(_QWORD *)(v13 + 168);
  if (v16 >> 60 == 15)
  {
    v17 = *(void **)(*(_QWORD *)(v0 + 376) + 152);
    if (!v17)
      goto LABEL_11;
    sub_23309ADE8();
    v18 = (void *)swift_allocError();
    *v19 = 7;
    v20 = v17;
    v21 = v17;
    v22 = == infix(_:_:)();

    if ((v22 & 1) != 0)
    {
      sub_23309B090(*(_QWORD *)(v0 + 376) + 104, v0 + 176);
      v31 = (uint64_t (*)(uint64_t))((char *)&dword_256036078 + dword_256036078);
      v23 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 592) = v23;
      *v23 = v0;
      v23[1] = sub_23309C298;
      return v31(v0 + 176);
    }
    else
    {
LABEL_11:
      swift_release();
      __swift_destroy_boxed_opaque_existential_1(v0 + 136);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  else
  {
    *(_QWORD *)(v0 + 520) = v16;
    v25 = *(_QWORD **)(v0 + 376);
    v26 = v25[20];
    *(_QWORD *)(v0 + 528) = v26;
    *(_QWORD *)(v0 + 536) = v25[22];
    *(_QWORD *)(v0 + 544) = v25[23];
    sub_23309AB3C(v26, v16);
    return swift_task_switch();
  }
}

uint64_t sub_23309B728()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 600) = *(_BYTE *)(*(_QWORD *)(v0 + 544) + 112);
  return swift_task_switch();
}

uint64_t sub_23309B748()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE *v10;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void (*v20)(uint64_t, uint64_t);
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if ((*(_BYTE *)(v0 + 600) & 1) != 0)
  {
    if (qword_256034E00 != -1)
      swift_once();
    v1 = sub_2330B89A8();
    __swift_project_value_buffer(v1, (uint64_t)qword_256037A50);
    v2 = sub_2330B8990();
    v3 = sub_2330B8B94();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_233097000, v2, v3, "ItemContentSession.enumerate() stopping, extension was invalidated", v4, 2u);
      MEMORY[0x23492F2E4](v4, -1, -1);
    }
    v5 = *(_QWORD *)(v0 + 528);
    v6 = *(_QWORD *)(v0 + 520);

    sub_23309B090(v0 + 136, v0 + 56);
    v7 = *(_QWORD *)(v0 + 80);
    v8 = *(_QWORD *)(v0 + 88);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v7);
    sub_23309ADE8();
    v9 = (void *)swift_allocError();
    *v10 = 8;
    (*(void (**)(void *, uint64_t, uint64_t))(v8 + 32))(v9, v7, v8);
    sub_23309AA20(v5, v6);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 136);

    __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 536);
    v13 = *(_QWORD *)(v0 + 528);
    v14 = *(_QWORD *)(v0 + 520);
    v15 = *(_QWORD *)(v0 + 432);
    v16 = *(_QWORD *)(v0 + 400);
    v24 = *(_QWORD *)(v0 + 408);
    v25 = *(_QWORD *)(v0 + 392);
    v17 = *(_QWORD *)(v0 + 376);
    v26 = *(_QWORD *)(v0 + 384);
    swift_beginAccess();
    v23 = 1000000000000000000 * qword_256036060;
    v18 = ((qword_256036060 >> 63) & 0xF21F494C589C0000)
        + (((unint64_t)qword_256036060 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
    sub_23309B090(v0 + 136, v0 + 256);
    v19 = (_QWORD *)swift_allocObject();
    *(_QWORD *)(v0 + 552) = v19;
    v19[2] = v17;
    v19[3] = v13;
    v19[4] = v14;
    v19[5] = v12;
    sub_23309B0D4((__int128 *)(v0 + 256), (uint64_t)(v19 + 6));
    sub_23309AFD8(v13, v14);
    swift_retain();
    sub_2330B8CA8();
    sub_2330B8C84();
    MEMORY[0x23492EC6C](v23, v18);
    v20 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    *(_QWORD *)(v0 + 560) = v20;
    v20(v16, v26);
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 568) = v21;
    v21[2] = &unk_256035458;
    v21[3] = v19;
    v21[4] = v24;
    v21[5] = v15;
    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 576) = v22;
    *v22 = v0;
    v22[1] = sub_23309BAB8;
    return sub_2330B8D14();
  }
}

uint64_t sub_23309BAB8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 584) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23309BB24()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  _BYTE *v10;
  id v11;
  id v12;
  char v13;
  _QWORD *v14;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);

  v1 = *(_QWORD *)(v0 + 528);
  v2 = *(_QWORD *)(v0 + 520);
  v4 = *(_QWORD *)(v0 + 424);
  v3 = *(_QWORD *)(v0 + 432);
  v5 = *(_QWORD *)(v0 + 416);
  (*(void (**)(_QWORD, _QWORD))(v0 + 560))(*(_QWORD *)(v0 + 408), *(_QWORD *)(v0 + 384));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_release();
  sub_23309AA20(v1, v2);
  v6 = *(_QWORD **)(v0 + 376);
  v7 = v6[21];
  if (v7 >> 60 == 15)
  {
    v8 = (void *)v6[19];
    if (!v8)
      goto LABEL_6;
    sub_23309ADE8();
    v9 = (void *)swift_allocError();
    *v10 = 7;
    v11 = v8;
    v12 = v8;
    v13 = == infix(_:_:)();

    if ((v13 & 1) != 0)
    {
      sub_23309B090(*(_QWORD *)(v0 + 376) + 104, v0 + 176);
      v17 = (uint64_t (*)(uint64_t))((char *)&dword_256036078 + dword_256036078);
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 592) = v14;
      *v14 = v0;
      v14[1] = sub_23309C298;
      return v17(v0 + 176);
    }
    else
    {
LABEL_6:
      swift_release();
      __swift_destroy_boxed_opaque_existential_1(v0 + 136);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  else
  {
    *(_QWORD *)(v0 + 520) = v7;
    v16 = v6[20];
    *(_QWORD *)(v0 + 528) = v16;
    *(_QWORD *)(v0 + 536) = v6[22];
    *(_QWORD *)(v0 + 544) = v6[23];
    sub_23309AB3C(v16, v7);
    return swift_task_switch();
  }
}

uint64_t sub_23309BD28()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _BYTE *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  _QWORD *v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  _BYTE *v47;
  id v48;
  id v49;
  char v50;
  _QWORD *v51;
  uint64_t v53;
  _QWORD *v54;
  uint64_t (*v55)(uint64_t);

  v1 = *(void **)(v0 + 584);
  v54 = (_QWORD *)(v0 + 136);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 560);
  v3 = *(_QWORD *)(v0 + 424);
  v4 = *(_QWORD *)(v0 + 432);
  v6 = *(_QWORD *)(v0 + 408);
  v5 = *(_QWORD *)(v0 + 416);
  v7 = *(_QWORD *)(v0 + 384);
  swift_task_dealloc();
  v2(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  swift_release();
  *(_QWORD *)(v0 + 368) = v1;
  v8 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B0);
  if ((swift_dynamicCast() & 1) != 0)
  {

    if (qword_256034E00 != -1)
      swift_once();
    v9 = sub_2330B89A8();
    __swift_project_value_buffer(v9, (uint64_t)qword_256037A50);
    v10 = sub_2330B8990();
    v11 = sub_2330B8B94();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_233097000, v10, v11, "ItemContentSession.enumerate() did timeout", v12, 2u);
      MEMORY[0x23492F2E4](v12, -1, -1);
    }
    v13 = *(_QWORD *)(v0 + 528);
    v14 = *(_QWORD *)(v0 + 520);
    v15 = *(_QWORD **)(v0 + 376);

    sub_23309B090((uint64_t)v54, v0 + 96);
    v16 = *(_QWORD *)(v0 + 120);
    v17 = *(_QWORD *)(v0 + 128);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), v16);
    sub_23309ADE8();
    v18 = (void *)swift_allocError();
    *v19 = 7;
    (*(void (**)(void *, uint64_t, uint64_t))(v17 + 32))(v18, v16, v17);

    __swift_destroy_boxed_opaque_existential_1(v0 + 96);
    v20 = v15[20];
    v21 = v15[21];
    *((_OWORD *)v15 + 10) = xmmword_2330B9530;
    v15[22] = 0;
    sub_23309AA20(v20, v21);
    sub_23309AA20(v13, v14);
    v22 = *(void **)(v0 + 368);
  }
  else
  {

    if (qword_256034E00 != -1)
      swift_once();
    v23 = *(void **)(v0 + 584);
    v24 = sub_2330B89A8();
    __swift_project_value_buffer(v24, (uint64_t)qword_256037A50);
    v25 = v23;
    v26 = v23;
    v27 = sub_2330B8990();
    v28 = sub_2330B8B94();
    v29 = os_log_type_enabled(v27, v28);
    v30 = *(void **)(v0 + 584);
    if (v29)
    {
      v31 = swift_slowAlloc();
      v32 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v31 = 138543362;
      v33 = v30;
      v34 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v31 + 4) = v34;
      *v32 = v34;

      _os_log_impl(&dword_233097000, v27, v28, "ItemContentSession.enumerate() error %{public}@", (uint8_t *)v31, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B8);
      swift_arrayDestroy();
      MEMORY[0x23492F2E4](v32, -1, -1);
      MEMORY[0x23492F2E4](v31, -1, -1);
    }
    else
    {

    }
    v35 = *(void **)(v0 + 584);
    v36 = *(_QWORD *)(v0 + 528);
    v37 = *(_QWORD *)(v0 + 520);
    v38 = *(_QWORD **)(v0 + 376);

    v39 = *(_QWORD *)(v0 + 160);
    v40 = *(_QWORD *)(v0 + 168);
    __swift_project_boxed_opaque_existential_1(v54, v39);
    (*(void (**)(void *, uint64_t, uint64_t))(v40 + 32))(v35, v39, v40);
    v41 = v38[20];
    v42 = v38[21];
    *((_OWORD *)v38 + 10) = xmmword_2330B9530;
    v38[22] = 0;
    sub_23309AA20(v41, v42);
    sub_23309AA20(v36, v37);
    v22 = v35;
  }

  v43 = *(_QWORD **)(v0 + 376);
  v44 = v43[21];
  if (v44 >> 60 == 15)
  {
    v45 = (void *)v43[19];
    if (!v45)
      goto LABEL_18;
    sub_23309ADE8();
    v46 = (void *)swift_allocError();
    *v47 = 7;
    v48 = v45;
    v49 = v45;
    v50 = == infix(_:_:)();

    if ((v50 & 1) != 0)
    {
      sub_23309B090(*(_QWORD *)(v0 + 376) + 104, v0 + 176);
      v55 = (uint64_t (*)(uint64_t))((char *)&dword_256036078 + dword_256036078);
      v51 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 592) = v51;
      *v51 = v0;
      v51[1] = sub_23309C298;
      return v55(v0 + 176);
    }
    else
    {
LABEL_18:
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  else
  {
    *(_QWORD *)(v0 + 520) = v44;
    v53 = v43[20];
    *(_QWORD *)(v0 + 528) = v53;
    *(_QWORD *)(v0 + 536) = v43[22];
    *(_QWORD *)(v0 + 544) = v43[23];
    sub_23309AB3C(v53, v44);
    return swift_task_switch();
  }
}

uint64_t sub_23309C298()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *v0 + 176;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v1);
  return swift_task_switch();
}

uint64_t sub_23309C2F8()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23309C370(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[3];

  v1 = *a1;
  v2 = a1[1];
  v3 = a1[2];
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v5[0] = v1;
    v5[1] = v2;
    v5[2] = v3;
    sub_23309C514((uint64_t)v5);
    return swift_release();
  }
  return result;
}

uint64_t sub_23309C3E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[13] = a5;
  v6[14] = a6;
  v6[11] = a3;
  v6[12] = a4;
  v6[10] = a2;
  return swift_task_switch();
}

uint64_t sub_23309C408()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v6;

  v1 = *(_QWORD *)(v0 + 104);
  v6 = *(_OWORD *)(v0 + 88);
  sub_23309B090(*(_QWORD *)(v0 + 80) + 104, v0 + 16);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v2);
  *(_OWORD *)(v0 + 56) = v6;
  *(_QWORD *)(v0 + 72) = v1;
  *(_QWORD *)&v6 = **(int **)(v3 + 8) + *(_QWORD *)(v3 + 8);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v4;
  *v4 = v0;
  v4[1] = sub_23309C4C0;
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v6)(v0 + 56, *(_QWORD *)(v0 + 112), v2, v3);
}

uint64_t sub_23309C4C0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_23309C514(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23309C55C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t *, uint64_t, uint64_t);
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v4 = v3[10];
  v5 = v3[11];
  __swift_project_boxed_opaque_existential_1(v3 + 7, v4);
  v10 = v2;
  v11 = v1;
  v12 = v0;
  v6 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 96);
  sub_23309AB3C(v2, v1);
  v6(&v10, v4, v5);
  v7 = v3[20];
  v8 = v3[21];
  v3[20] = v2;
  v3[21] = v1;
  v3[22] = v0;
  result = sub_23309AA20(v7, v8);
  v3[24] = 0;
  return result;
}

void sub_23309C65C()
{
  void *v0;
  _QWORD *v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)v1[19];
  v1[19] = v0;
  v3 = v0;
  v4 = v0;

  v5 = v1[10];
  v6 = v1[11];
  __swift_project_boxed_opaque_existential_1(v1 + 7, v5);
  (*(void (**)(void *, uint64_t, uint64_t))(v6 + 112))(v0, v5, v6);
  JUMPOUT(0x23309C6A4);
}

uint64_t ItemContentSession.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  swift_release();

  sub_23309AA20(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168));
  swift_release();
  return v0;
}

uint64_t ItemContentSession.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  swift_release();

  sub_23309AA20(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168));
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ItemContentSession()
{
  return objc_opt_self();
}

uint64_t method lookup function for ItemContentSession()
{
  return swift_lookUpClassMethod();
}

void sub_23309C7C0(void *a1, unint64_t a2)
{
  uint64_t v2;

  v2 = (a2 >> 60) & 3;
  if ((_DWORD)v2 == 2)
  {

  }
  else
  {
    if ((_DWORD)v2 == 1)
    {
      a2 &= 0xCFFFFFFFFFFFFFFFLL;
    }
    else if ((_DWORD)v2)
    {
      return;
    }
    sub_23309AA34((uint64_t)a1, a2);
  }
}

void sub_23309C7EC(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  _BYTE *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (*v12)(void *, uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;

  if ((uint64_t)a1[24] <= 0)
  {
    if (qword_256034E00 != -1)
      swift_once();
    v16 = sub_2330B89A8();
    __swift_project_value_buffer(v16, (uint64_t)qword_256037A50);
    v17 = sub_2330B8990();
    v18 = sub_2330B8B94();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_233097000, v17, v18, "ItemContentSession.enumerate() will retry enumerating the page", v19, 2u);
      MEMORY[0x23492F2E4](v19, -1, -1);
    }

    v20 = a1[24];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      a1[24] = v22;
      return;
    }
    __break(1u);
  }
  else
  {
    if (qword_256034E00 != -1)
      swift_once();
    v2 = sub_2330B89A8();
    __swift_project_value_buffer(v2, (uint64_t)qword_256037A50);
    v3 = sub_2330B8990();
    v4 = sub_2330B8B94();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_233097000, v3, v4, "ItemContentSession.enumerate() did fail to save", v5, 2u);
      MEMORY[0x23492F2E4](v5, -1, -1);
    }

    sub_23309ADE8();
    v6 = swift_allocError();
    *v7 = 2;
    v8 = (void *)a1[19];
    a1[19] = v6;

    sub_23309B090((uint64_t)(a1 + 7), (uint64_t)v23);
    v9 = v24;
    v10 = v25;
    __swift_project_boxed_opaque_existential_1(v23, v24);
    v11 = (void *)a1[19];
    if (v11)
    {
      v12 = *(void (**)(void *, uint64_t, uint64_t))(v10 + 112);
      v13 = v11;
      v12(v11, v9, v10);

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      v14 = a1[20];
      v15 = a1[21];
      *((_OWORD *)a1 + 10) = xmmword_2330B9530;
      a1[22] = 0;
      sub_23309AA20(v14, v15);
      return;
    }
  }
  __break(1u);
}

uint64_t sub_23309CA3C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23309CA60(uint64_t *a1)
{
  return sub_23309C370(a1);
}

unint64_t sub_23309CA68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256035448;
  if (!qword_256035448)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256035438);
    result = MEMORY[0x23492F248](MEMORY[0x24BDB9EE8], v1);
    atomic_store(result, &qword_256035448);
  }
  return result;
}

uint64_t sub_23309CAB4()
{
  uint64_t v0;

  swift_release();
  sub_23309AA34(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  return swift_deallocObject();
}

uint64_t sub_23309CAE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;

  v6 = *(_OWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = sub_23309B0EC;
  *(_QWORD *)(v4 + 104) = v3;
  *(_QWORD *)(v4 + 112) = v0 + 48;
  *(_QWORD *)(v4 + 96) = v2;
  *(_OWORD *)(v4 + 80) = v6;
  return swift_task_switch();
}

uint64_t ItemContentObserverImpl.__allocating_init(suggestedPageSize:store:)(uint64_t a1, __int128 *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  sub_2330B89C0();
  *(_QWORD *)(v4 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize) = a1;
  sub_23309B0D4(a2, v4 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_store);
  return v4;
}

double sub_23309CBFC@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  uint64_t v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330B89E4();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_QWORD *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_23309CC80(uint64_t a1)
{
  void *v1;
  unint64_t v2;

  v1 = *(void **)a1;
  v2 = *(_QWORD *)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23309E53C(v1, v2);
  swift_retain();
  return sub_2330B89F0();
}

uint64_t sub_23309CD10()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330B89E4();
  swift_release();
  return swift_release();
}

uint64_t sub_23309CD74()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256035440);
  sub_2330B89CC();
  return swift_endAccess();
}

uint64_t sub_23309CDD8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t, uint64_t);
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035438);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256035440);
  sub_2330B89D8();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_23309CEE8()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256035440);
  sub_2330B89CC();
  return swift_endAccess();
}

uint64_t sub_23309CF48()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_23309CF8C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23309CFD4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ItemContentObserverImpl.init(suggestedPageSize:store:)(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035440);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v2 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl__state;
  v11 = xmmword_2330B9630;
  v12 = 0;
  sub_2330B89C0();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize) = a1;
  sub_23309B0D4(a2, v2 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_store);
  return v2;
}

uint64_t sub_23309D108(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  void (*v7)(void);
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = sub_23309D51C();
  if ((result & 1) != 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v12 = xmmword_2330B96E0;
    v13 = 0;
    swift_retain();
    result = sub_2330B89F0();
    v4 = *(_QWORD *)(a1 + 16);
    if (v4)
    {
      v11 = v1 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_store;
      swift_bridgeObjectRetain();
      v5 = (_BYTE *)(a1 + 56);
      do
      {
        v8 = (void *)*((_QWORD *)v5 - 3);
        if ((*v5 & 1) != 0)
        {
          sub_23309B090(v11, (uint64_t)&v12);
          v6 = v15;
          __swift_project_boxed_opaque_existential_1(&v12, v14);
          v7 = *(void (**)(void))(v6 + 48);
        }
        else
        {
          sub_23309B090(v11, (uint64_t)&v12);
          v9 = v15;
          __swift_project_boxed_opaque_existential_1(&v12, v14);
          v7 = *(void (**)(void))(v9 + 32);
        }
        sub_23309D674(v8);
        v10 = v8;
        v7();

        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v12);
        sub_23309D698(v8);
        v5 += 32;
        --v4;
      }
      while (v4);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_23309D2D8(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t result;

  v1 = *a1;
  v2 = a1[1];
  result = sub_23309D51C();
  if ((result & 1) != 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_23309AB3C(v1, v2);
    swift_retain();
    return sub_2330B89F0();
  }
  return result;
}

uint64_t sub_23309D368(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = sub_23309D51C();
  if ((result & 1) != 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_23309AB3C(a1, a2);
    swift_retain();
    return sub_2330B89F0();
  }
  return result;
}

uint64_t sub_23309D3FC(void *a1)
{
  uint64_t result;
  id v3;

  result = sub_23309D51C();
  if ((result & 1) != 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v3 = a1;
    swift_retain();
    return sub_2330B89F0();
  }
  return result;
}

void *sub_23309D484@<X0>(_QWORD *a1@<X8>)
{
  void *result;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330B89E4();
  swift_release();
  swift_release();
  result = v5;
  v3 = v6;
  v4 = v7;
  if ((v6 & 0x3000000000000000) != 0)
  {
    sub_23309C7C0(v5, v6);
    result = 0;
    v4 = 0;
    v3 = 0xF000000000000000;
  }
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_23309D51C()
{
  void *v0;
  _BYTE *v1;
  id v2;
  char v3;
  char v4;
  void *v6;
  unint64_t v7;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330B89E4();
  swift_release();
  swift_release();
  sub_23309ADE8();
  v0 = (void *)swift_allocError();
  *v1 = 7;
  sub_23309E53C(v6, v7);
  v2 = v0;
  if ((v7 & 0x3000000000000000) == 0x2000000000000000)
  {
    v3 = == infix(_:_:)();
    sub_23309C7C0(v6, v7);
    sub_23309C7C0(v0, 0x2000000000000000uLL);

    v4 = v3 ^ 1;
  }
  else
  {
    sub_23309C7C0(v6, v7);
    sub_23309C7C0(v0, 0x2000000000000000uLL);

    v4 = 1;
  }
  sub_23309C7C0(v6, v7);
  return v4 & 1;
}

uint64_t sub_23309D674(void *a1)
{
  id v1;

  v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23309D698(void *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t ItemContentObserverImpl.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035440);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_store);
  return v0;
}

uint64_t ItemContentObserverImpl.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035440);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_store);
  return swift_deallocClassInstance();
}

uint64_t sub_23309D780(uint64_t a1)
{
  return sub_23309D108(a1);
}

uint64_t sub_23309D7A0(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t result;

  v1 = *a1;
  v2 = a1[1];
  result = sub_23309D51C();
  if ((result & 1) != 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_23309AB3C(v1, v2);
    swift_retain();
    return sub_2330B89F0();
  }
  return result;
}

uint64_t sub_23309D834(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = sub_23309D51C();
  if ((result & 1) != 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_23309AB3C(a1, a2);
    swift_retain();
    return sub_2330B89F0();
  }
  return result;
}

uint64_t sub_23309D8CC(void *a1)
{
  uint64_t result;
  id v3;

  result = sub_23309D51C();
  if ((result & 1) != 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v3 = a1;
    swift_retain();
    return sub_2330B89F0();
  }
  return result;
}

uint64_t sub_23309D958()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *v0 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_23309D9A0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256035468);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2330B9700;
  sub_2330B8C30();
  swift_bridgeObjectRelease();
  sub_2330B8D50();
  sub_2330B8A74();
  swift_bridgeObjectRelease();
  sub_2330B8A74();
  *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v3 + 32) = 0xD00000000000001BLL;
  *(_QWORD *)(v3 + 40) = 0x80000002330BD000;
  sub_2330B8DF8();
  swift_bridgeObjectRelease();
  v5 = v1[5];
  v4 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v5, v4);
}

uint64_t sub_23309DAE0()
{
  return 32;
}

uint64_t sub_23309DAEC()
{
  return 10;
}

uint64_t sub_23309DAF8(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256035468);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2330B9700;
  sub_2330B8C30();
  v12 = 0;
  v13 = 0xE000000000000000;
  sub_2330B8A74();
  v9 = v2;
  v10 = v3;
  v11 = v4;
  sub_2330B8CC0();
  *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v5 + 32) = 0;
  *(_QWORD *)(v5 + 40) = 0xE000000000000000;
  sub_2330B8DF8();
  swift_bridgeObjectRelease();
  v7 = v1[5];
  v6 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v7);
  v9 = v2;
  v10 = v3;
  v11 = v4;
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v6 + 16))(&v9, v7, v6);
}

uint64_t sub_23309DC28(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256035468);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2330B9700;
  *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v5 + 32) = 0xD000000000000027;
  *(_QWORD *)(v5 + 40) = 0x80000002330BD050;
  sub_2330B8DF8();
  swift_bridgeObjectRelease();
  v6 = v2[5];
  v7 = v2[6];
  __swift_project_boxed_opaque_existential_1(v2 + 2, v6);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, v6, v7);
}

uint64_t sub_23309DCF0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256035468);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2330B9700;
  sub_2330B8C30();
  sub_2330B8A74();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B0);
  sub_2330B8CC0();
  *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = 0xE000000000000000;
  sub_2330B8DF8();
  swift_bridgeObjectRelease();
  v5 = v1[5];
  v4 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(a1, v5, v4);
}

uint64_t sub_23309DE10()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256035468);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2330B9700;
  sub_2330B8C30();
  swift_bridgeObjectRelease();
  sub_2330B8D50();
  sub_2330B8A74();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 32) = 0xD000000000000015;
  *(_QWORD *)(v4 + 40) = 0x80000002330BD0C0;
  sub_2330B8DF8();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t ItemContentObserverActivityLoggingDecorator.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t ItemContentObserverActivityLoggingDecorator.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_23309DF68(uint64_t a1)
{
  return sub_23309D9A0(a1);
}

uint64_t sub_23309DF88(uint64_t *a1)
{
  return sub_23309DAF8(a1);
}

uint64_t sub_23309DFA8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (_QWORD *)*v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256035468);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2330B9700;
  *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v6 + 32) = 0xD000000000000027;
  *(_QWORD *)(v6 + 40) = 0x80000002330BD050;
  sub_23309DAE0();
  sub_23309DAEC();
  sub_2330B8DF8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = v5[5];
  v8 = v5[6];
  __swift_project_boxed_opaque_existential_1(v5 + 2, v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 24))(a1, a2, v7, v8);
}

uint64_t sub_23309E0A4(uint64_t a1)
{
  return sub_23309DCF0(a1);
}

uint64_t sub_23309E0C4()
{
  return sub_23309DE10();
}

uint64_t _s15ContactProvider23ItemContentObserverImplC5StateO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  char v15;
  char v16;
  char v17;
  _QWORD v19[3];

  v3 = *(id *)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v6 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v7 = (v2 >> 60) & 3;
  if ((_DWORD)v7)
  {
    if ((_DWORD)v7 == 2)
    {
      if ((v5 & 0x3000000000000000) == 0x2000000000000000)
      {
        sub_23309E53C(*(id *)a1, v2);
        sub_23309E53C(v6, v5);
        v17 = == infix(_:_:)();
        sub_23309C7C0(v3, v2);
        sub_23309C7C0(v6, v5);
        return v17 & 1;
      }
      goto LABEL_31;
    }
    if ((_DWORD)v7 != 3
      || v3 != (id)1
      || v2 != 0x3000000000000000
      || v4 != 0
      || (v5 & 0x3000000000000000) != 0x3000000000000000
      || v6 != (void *)1
      || v5 != 0x3000000000000000
      || *(_QWORD *)(a2 + 16) != 0)
    {
LABEL_31:
      sub_23309E53C(*(id *)a1, v2);
      sub_23309E53C(v6, v5);
      sub_23309C7C0(v3, v2);
      sub_23309C7C0(v6, v5);
      v15 = 0;
      return v15 & 1;
    }
    v15 = 1;
    sub_23309C7C0((void *)1, 0x3000000000000000uLL);
    sub_23309C7C0((void *)1, 0x3000000000000000uLL);
  }
  else
  {
    if ((v5 & 0x3000000000000000) != 0)
      goto LABEL_31;
    v19[0] = *(_QWORD *)a1;
    v19[1] = v2;
    v19[2] = v4;
    sub_23309E53C(v3, v2);
    sub_23309E53C(v6, v5);
    sub_23309E53C(v3, v2);
    sub_23309E53C(v6, v5);
    _s15ContactProvider0A8ItemPageV2eeoiySbAC_ACtFZ_0((uint64_t)v19);
    v15 = v16;
    sub_23309C7C0(v3, v2);
    sub_23309C7C0(v6, v5);
    sub_23309C7C0(v6, v5);
    sub_23309C7C0(v3, v2);
  }
  return v15 & 1;
}

uint64_t sub_23309E2F4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23309E344(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_23309E390()
{
  return type metadata accessor for ItemContentObserverImpl();
}

uint64_t type metadata accessor for ItemContentObserverImpl()
{
  uint64_t result;

  result = qword_256035498;
  if (!qword_256035498)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23309E3D4()
{
  unint64_t v0;

  sub_23309E4E4();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for ItemContentObserverImpl()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ItemContentObserverImpl.state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.$state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.suggestedPageSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.suggestedPageSize.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.suggestedPageSize.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.__allocating_init(suggestedPageSize:store:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.didEnumerate(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.didFinishEnumeratingPage(upTo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.didFinishEnumeratingContent(upTo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.didFinishEnumeratingContentWithError(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.nextPage.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

void sub_23309E4E4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2560354A8[0])
  {
    v0 = sub_2330B89FC();
    if (!v1)
      atomic_store(v0, qword_2560354A8);
  }
}

id sub_23309E53C(id result, unint64_t a2)
{
  uint64_t v2;

  v2 = (a2 >> 60) & 3;
  if ((_DWORD)v2 == 2)
    return result;
  if ((_DWORD)v2 == 1)
  {
    a2 &= 0xCFFFFFFFFFFFFFFFLL;
  }
  else if ((_DWORD)v2)
  {
    return result;
  }
  return (id)sub_23309AB3C((uint64_t)result, a2);
}

void destroy for ItemContentObserverImpl.State(uint64_t a1)
{
  sub_23309C7C0(*(void **)a1, *(_QWORD *)(a1 + 8));
}

_QWORD *_s15ContactProvider23ItemContentObserverImplC5StateOwCP_0(_QWORD *a1, uint64_t a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  sub_23309E53C(*(id *)a2, v4);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

uint64_t assignWithCopy for ItemContentObserverImpl.State(uint64_t a1, uint64_t a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  sub_23309E53C(*(id *)a2, v4);
  v6 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  sub_23309C7C0(v6, v7);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ItemContentObserverImpl.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  sub_23309C7C0(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ItemContentObserverImpl.State(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ItemContentObserverImpl.State(uint64_t result, int a2, int a3)
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

uint64_t sub_23309E6B4(uint64_t a1)
{
  if (((*(_QWORD *)(a1 + 8) >> 60) & 3) == 3)
    return (*(_DWORD *)a1 + 3);
  else
    return (*(_QWORD *)(a1 + 8) >> 60) & 3;
}

uint64_t sub_23309E6D0(uint64_t result)
{
  *(_QWORD *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  return result;
}

_QWORD *sub_23309E6E0(_QWORD *result, uint64_t a2)
{
  if (a2 < 3)
  {
    result[1] = result[1] & 0xCFFFFFFFFFFFFFFFLL | (a2 << 60);
  }
  else
  {
    *result = (a2 - 3);
    *(_OWORD *)(result + 1) = xmmword_2330B9710;
  }
  return result;
}

ValueMetadata *type metadata accessor for ItemContentObserverImpl.State()
{
  return &type metadata for ItemContentObserverImpl.State;
}

uint64_t type metadata accessor for ItemContentObserverActivityLoggingDecorator()
{
  return objc_opt_self();
}

uint64_t method lookup function for ItemContentObserverActivityLoggingDecorator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ItemContentObserverActivityLoggingDecorator.didEnumerate(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of ItemContentObserverActivityLoggingDecorator.didFinishEnumeratingPage(upTo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of ItemContentObserverActivityLoggingDecorator.didFinishEnumeratingContent(upTo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of ItemContentObserverActivityLoggingDecorator.didFinishEnumeratingContentWithError(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of ItemContentObserverActivityLoggingDecorator.suggestedPageSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of ContactItemEnumerating.enumerator(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ContactItemEnumerator.enumerateContent(in:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 8) + *(_QWORD *)(a4 + 8));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23309B0EC;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of ContactItemEnumerator.enumerateChanges(startingAt:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 16) + *(_QWORD *)(a4 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23309B0EC;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of ContactItemEnumerator.invalidate()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 24) + *(_QWORD *)(a2 + 24));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_233098F04;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ContactItemContentObserver.didFinishEnumeratingPage(upTo:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ContactItemContentObserver.didFinishEnumeratingContent(upTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of ContactItemChangeObserver.didUpdate(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ContactItemChangeObserver.didDelete(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ContactItemChangeObserver.didFinishEnumeratingChanges(upTo:moreComing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of ContactItemChangeObserver.didFinishEnumeratingChangesWithError(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ContactItemChangeObserver.suggestedBatchSize.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t ContactProviderManager.__allocating_init(domainIdentifier:)()
{
  uint64_t v0;

  v0 = swift_allocObject();
  ContactProviderManager.init(domainIdentifier:)();
  return v0;
}

uint64_t ContactProviderManager.init(domainIdentifier:)()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  char v6;
  __int128 v8;
  unint64_t v9;
  ValueMetadata *v10;
  _UNKNOWN **v11;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 16) = 0;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_QWORD *)(v0 + 96) = 0;
  v10 = &type metadata for DefaultContactProviderDomain;
  v11 = &protocol witness table for DefaultContactProviderDomain;
  *(_QWORD *)&v8 = 0;
  *((_QWORD *)&v8 + 1) = 0xE000000000000000;
  v9 = sub_2330A0638(MEMORY[0x24BEE4AF8]);
  sub_23309B0D4(&v8, v0 + 24);
  if (qword_256034E10 != -1)
    swift_once();
  v1 = objc_allocWithZone(MEMORY[0x24BDBACD8]);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2330B8A38();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_initWithDomainIdentifier_, v2);

  v4 = *(void **)(v0 + 16);
  *(_QWORD *)(v0 + 16) = v3;

  v5 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  LOBYTE(v3) = objc_msgSend(v5, sel_isiOSAppOnMac);

  if ((v3 & 1) != 0)
    v6 = 0;
  else
    v6 = objc_msgSend((id)objc_opt_self(), sel_isiOSAppOnVision) ^ 1;
  *(_BYTE *)(v0 + 104) = v6;
  return v0;
}

uint64_t sub_23309EB0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23309B090(v1 + 24, a1);
}

id sub_23309EB18()
{
  uint64_t v0;
  id result;

  if (*(_BYTE *)(v0 + 104) != 1)
    return 0;
  result = *(id *)(v0 + 16);
  if (result)
    return objc_msgSend(result, sel_isDomainEnabled);
  return result;
}

uint64_t sub_23309EB54()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

uint64_t sub_23309EB6C()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  _BYTE *v6;
  uint64_t (*v7)(void);

  v1 = v0[15];
  if (*(_BYTE *)(v1 + 104) == 1)
  {
    v2 = *(void **)(v1 + 16);
    v0[16] = v2;
    if (v2)
    {
      v0[2] = v0;
      v0[3] = sub_23309EC6C;
      v3 = swift_continuation_init();
      v0[10] = MEMORY[0x24BDAC760];
      v4 = v0 + 10;
      v4[1] = 0x40000000;
      v4[2] = sub_23309ECCC;
      v4[3] = &block_descriptor;
      v4[4] = v3;
      objc_msgSend(v2, sel_enableDomainWithCompletionHandler_, v4);
      return swift_continuation_await();
    }
    v7 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    sub_23309ADE8();
    swift_allocError();
    *v6 = 5;
    swift_willThrow();
    v7 = (uint64_t (*)(void))v0[1];
  }
  return v7();
}

uint64_t sub_23309EC6C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 136) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23309ECCC(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B0);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_23309ED40()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

uint64_t sub_23309ED58()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  _BYTE *v6;
  uint64_t (*v7)(void);

  v1 = v0[15];
  if (*(_BYTE *)(v1 + 104) == 1)
  {
    v2 = *(void **)(v1 + 16);
    v0[16] = v2;
    if (v2)
    {
      v0[2] = v0;
      v0[3] = sub_23309EC6C;
      v3 = swift_continuation_init();
      v0[10] = MEMORY[0x24BDAC760];
      v4 = v0 + 10;
      v4[1] = 0x40000000;
      v4[2] = sub_23309ECCC;
      v4[3] = &block_descriptor_2;
      v4[4] = v3;
      objc_msgSend(v2, sel_disableDomainWithCompletionHandler_, v4);
      return swift_continuation_await();
    }
    v7 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    sub_23309ADE8();
    swift_allocError();
    *v6 = 5;
    swift_willThrow();
    v7 = (uint64_t (*)(void))v0[1];
  }
  return v7();
}

uint64_t sub_23309EE58()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

uint64_t sub_23309EE70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t (*v4)(void);
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;

  v1 = *(_QWORD *)(v0 + 120);
  if (*(_BYTE *)(v1 + 104) == 1)
  {
    v2 = v1 + 64;
    swift_beginAccess();
    sub_2330A0F9C(v2, v0 + 56, qword_2560356C0);
    if (*(_QWORD *)(v0 + 80))
    {
      sub_23309B0D4((__int128 *)(v0 + 56), v0 + 16);
    }
    else
    {
      sub_23309B090(*(_QWORD *)(v0 + 120) + 24, v0 + 16);
      sub_2330A0C2C(v0 + 56);
    }
    v5 = *(_QWORD *)(v0 + 120);
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBACE8]), sel_init);
    *(_QWORD *)(v0 + 128) = v6;
    objc_msgSend(v6, sel_setSynchronizationReason_, *MEMORY[0x24BDBA3A8]);
    v7 = *(_QWORD *)(v0 + 40);
    v8 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v7);
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v7, v8);
    v9 = (void *)sub_2330B8A38();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setDisplayName_, v9);

    v10 = *(_QWORD *)(v0 + 40);
    v11 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v10);
    (*(void (**)(uint64_t, uint64_t))(v11 + 24))(v10, v11);
    v12 = (void *)sub_2330B8A20();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setUserInfo_, v12);

    v13 = *(void **)(v5 + 16);
    *(_QWORD *)(v0 + 136) = v13;
    if (v13)
    {
      v13;
      v14 = v6;
      v15 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 144) = v15;
      *v15 = v0;
      v15[1] = sub_23309F0C8;
      return sub_2330B8BAC();
    }

    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    v4 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    sub_23309ADE8();
    swift_allocError();
    *v3 = 5;
    swift_willThrow();
    v4 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v4();
}

uint64_t sub_23309F0C8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 152) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v3 = *(void **)(v2 + 136);

  }
  return swift_task_switch();
}

uint64_t sub_23309F138()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23309F178()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 152);
  v3 = *(void **)(v0 + 128);
  v2 = *(void **)(v0 + 136);

  _s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(v1);
  swift_willThrow();

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23309F1F0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

uint64_t sub_23309F208()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  _BYTE *v6;
  uint64_t (*v7)(void);

  v1 = v0[15];
  if (*(_BYTE *)(v1 + 104) == 1)
  {
    v2 = *(void **)(v1 + 16);
    v0[16] = v2;
    if (v2)
    {
      v0[2] = v0;
      v0[3] = sub_23309F308;
      v3 = swift_continuation_init();
      v0[10] = MEMORY[0x24BDAC760];
      v4 = v0 + 10;
      v4[1] = 0x40000000;
      v4[2] = sub_23309ECCC;
      v4[3] = &block_descriptor_6;
      v4[4] = v3;
      objc_msgSend(v2, sel_invalidateExtensionWithCompletionHandler_, v4);
      return swift_continuation_await();
    }
    v7 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    sub_23309ADE8();
    swift_allocError();
    *v6 = 5;
    swift_willThrow();
    v7 = (uint64_t (*)(void))v0[1];
  }
  return v7();
}

uint64_t sub_23309F308()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 136) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23309F368()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23309F39C()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 128);
  v2 = *(void **)(v0 + 136);
  swift_willThrow();

  _s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(v2);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23309F3FC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

uint64_t sub_23309F414()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  _BYTE *v6;
  uint64_t (*v7)(void);

  v1 = v0[15];
  if (*(_BYTE *)(v1 + 104) == 1)
  {
    v2 = *(void **)(v1 + 16);
    v0[16] = v2;
    if (v2)
    {
      v0[2] = v0;
      v0[3] = sub_23309EC6C;
      v3 = swift_continuation_init();
      v0[10] = MEMORY[0x24BDAC760];
      v4 = v0 + 10;
      v4[1] = 0x40000000;
      v4[2] = sub_23309ECCC;
      v4[3] = &block_descriptor_8;
      v4[4] = v3;
      objc_msgSend(v2, sel_resetEnumerationWithCompletionHandler_, v4);
      return swift_continuation_await();
    }
    v7 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    sub_23309ADE8();
    swift_allocError();
    *v6 = 5;
    swift_willThrow();
    v7 = (uint64_t (*)(void))v0[1];
  }
  return v7();
}

uint64_t ContactProviderManager.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  sub_2330A0C2C(v0 + 64);
  return v0;
}

uint64_t ContactProviderManager.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  sub_2330A0C2C(v0 + 64);
  return swift_deallocClassInstance();
}

void static ContactProviderManager.addDomain(_:)(_QWORD *a1)
{
  id v2;
  unsigned __int8 v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21[2];

  v21[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v3 = objc_msgSend(v2, sel_isiOSAppOnMac);

  if ((v3 & 1) != 0 || (objc_msgSend((id)objc_opt_self(), sel_isiOSAppOnVision) & 1) != 0)
  {
    sub_23309ADE8();
    swift_allocError();
    *v4 = 5;
    swift_willThrow();
  }
  else
  {
    v5 = a1[3];
    v6 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v5);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
    v7 = a1[3];
    v8 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v7);
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v7, v8);
    v9 = a1[3];
    v10 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v9);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v9, v10);
    sub_23309F834(v11);
    swift_bridgeObjectRelease();
    v12 = objc_allocWithZone(MEMORY[0x24BDBACE0]);
    v13 = (void *)sub_2330B8A38();
    swift_bridgeObjectRelease();
    v14 = (void *)sub_2330B8A38();
    swift_bridgeObjectRelease();
    v15 = (void *)sub_2330B8A20();
    swift_bridgeObjectRelease();
    v16 = (void *)sub_2330B8A38();
    v17 = objc_msgSend(v12, sel_initWithDomainIdentifer_displayName_userInfo_bundleIdentifier_enabled_, v13, v14, v15, v16, 0);

    v21[0] = 0;
    if ((objc_msgSend((id)objc_opt_self(), sel_addDomain_error_, v17, v21) & 1) != 0)
    {
      v18 = v21[0];
    }
    else
    {
      v19 = v21[0];
      v20 = (void *)sub_2330B8948();

      swift_willThrow();
      _s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(v20);
      swift_willThrow();

    }
  }
}

uint64_t sub_23309F834(uint64_t a1)
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256035858);
    v2 = sub_2330B8CFC();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
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
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
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
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_2330A0F48(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_2330A0F84(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_2330A0F84(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_2330A0F84(v36, v37);
    sub_2330A0F84(v37, &v33);
    result = sub_2330B8C0C();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_2330A0F84(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_2330A0F94();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
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
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

void static ContactProviderManager.removeDomain(_:)()
{
  id v0;
  unsigned __int8 v1;
  _BYTE *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  id v7;
  void *v8;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v1 = objc_msgSend(v0, sel_isiOSAppOnMac);

  if ((v1 & 1) != 0 || (objc_msgSend((id)objc_opt_self(), sel_isiOSAppOnVision) & 1) != 0)
  {
    sub_23309ADE8();
    swift_allocError();
    *v2 = 5;
    swift_willThrow();
  }
  else
  {
    v3 = (void *)objc_opt_self();
    v4 = (void *)sub_2330B8A38();
    v9[0] = 0;
    v5 = objc_msgSend(v3, sel_removeDomain_error_, v4, v9);

    if (v5)
    {
      v6 = v9[0];
    }
    else
    {
      v7 = v9[0];
      v8 = (void *)sub_2330B8948();

      swift_willThrow();
      _s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(v8);
      swift_willThrow();

    }
  }
}

uint64_t static ContactProviderManager.registeredDomains.getter()
{
  id v0;
  unsigned __int8 v1;
  uint64_t v2;
  unsigned __int8 v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  unint64_t v36;
  ValueMetadata *v37;
  _UNKNOWN **v38;
  uint64_t v39;

  v0 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v1 = objc_msgSend(v0, sel_isiOSAppOnMac);

  if ((v1 & 1) != 0)
    return MEMORY[0x24BEE4AF8];
  v3 = objc_msgSend((id)objc_opt_self(), sel_isiOSAppOnVision);
  v2 = MEMORY[0x24BEE4AF8];
  if ((v3 & 1) != 0)
    return v2;
  sub_2330A0C6C();
  v4 = sub_2330B8BB8();
  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_6;
LABEL_26:
    swift_bridgeObjectRelease();
    return v2;
  }
  swift_bridgeObjectRetain();
  v5 = sub_2330B8CD8();
  swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_26;
LABEL_6:
  v39 = v2;
  result = sub_2330A076C(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    v7 = 0;
    v2 = v39;
    v8 = v4 & 0xC000000000000001;
    v32 = v4 & 0xC000000000000001;
    while (1)
    {
      if (v8)
        v9 = (id)MEMORY[0x23492EC24](v7, v4);
      else
        v9 = *(id *)(v4 + 8 * v7 + 32);
      v10 = v9;
      v11 = objc_msgSend(v9, sel_domainIdentifier);
      v12 = sub_2330B8A44();
      v14 = v13;

      if (qword_256034E10 != -1)
        swift_once();
      if (v12 == qword_256036680 && v14 == *(_QWORD *)algn_256036688)
        break;
      v16 = sub_2330B8D68();
      swift_bridgeObjectRelease();
      if ((v16 & 1) != 0)
        goto LABEL_20;
      v17 = objc_msgSend(v10, sel_domainIdentifier);
      v18 = sub_2330B8A44();
      v33 = v19;
      v34 = v18;

      sub_2330A0638(MEMORY[0x24BEE4AF8]);
      v20 = objc_msgSend(v10, sel_displayName);
      v21 = v5;
      v22 = sub_2330B8A44();
      v24 = v23;

      v25 = objc_msgSend(v10, sel_userInfo);
      v26 = v4;
      v27 = sub_2330B8A2C();
      swift_bridgeObjectRelease();

      v37 = &type metadata for CustomContactProviderDomain;
      v38 = &protocol witness table for CustomContactProviderDomain;
      v28 = (_QWORD *)swift_allocObject();
      *(_QWORD *)&v35 = v28;

      v28[2] = v34;
      v28[3] = v33;
      v28[4] = v22;
      v28[5] = v24;
      v5 = v21;
      v28[6] = v27;
      v8 = v32;
      v4 = v26;
LABEL_21:
      v39 = v2;
      v31 = *(_QWORD *)(v2 + 16);
      v30 = *(_QWORD *)(v2 + 24);
      if (v31 >= v30 >> 1)
      {
        sub_2330A076C(v30 > 1, v31 + 1, 1);
        v2 = v39;
      }
      ++v7;
      *(_QWORD *)(v2 + 16) = v31 + 1;
      sub_23309B0D4(&v35, v2 + 40 * v31 + 32);
      if (v5 == v7)
        goto LABEL_26;
    }
    swift_bridgeObjectRelease();
LABEL_20:
    v37 = &type metadata for DefaultContactProviderDomain;
    v38 = &protocol witness table for DefaultContactProviderDomain;
    v29 = sub_2330A0638(MEMORY[0x24BEE4AF8]);

    *(_QWORD *)&v35 = 0;
    *((_QWORD *)&v35 + 1) = 0xE000000000000000;
    v36 = v29;
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ContactProviderManager.enableExtension(_:)(Swift::String a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  _BYTE *v7;
  id v8;
  void *v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(v1 + 104) == 1)
  {
    v2 = (void *)objc_opt_self();
    v3 = (void *)sub_2330B8A38();
    v4 = (void *)sub_2330B8A38();
    v10[0] = 0;
    v5 = objc_msgSend(v2, sel_enableDomain_bundleIdentifier_shouldSynchronize_error_, v3, v4, 0, v10);

    if (v5)
    {
      v6 = v10[0];
    }
    else
    {
      v8 = v10[0];
      v9 = (void *)sub_2330B8948();

      swift_willThrow();
      _s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(v9);
      swift_willThrow();

    }
  }
  else
  {
    sub_23309ADE8();
    swift_allocError();
    *v7 = 5;
    swift_willThrow();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ContactProviderManager.disableExtension(_:)(Swift::String a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  _BYTE *v7;
  id v8;
  void *v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(v1 + 104) == 1)
  {
    v2 = (void *)objc_opt_self();
    v3 = (void *)sub_2330B8A38();
    v4 = (void *)sub_2330B8A38();
    v10[0] = 0;
    v5 = objc_msgSend(v2, sel_disableDomain_bundleIdentifier_error_, v3, v4, v10);

    if (v5)
    {
      v6 = v10[0];
    }
    else
    {
      v8 = v10[0];
      v9 = (void *)sub_2330B8948();

      swift_willThrow();
      _s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(v9);
      swift_willThrow();

    }
  }
  else
  {
    sub_23309ADE8();
    swift_allocError();
    *v7 = 5;
    swift_willThrow();
  }
}

uint64_t ContactProviderManager.allDomains()()
{
  unint64_t v0;
  void *v1;
  unint64_t v2;
  _BYTE *v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  if (*(_BYTE *)(v0 + 104) != 1)
  {
    sub_23309ADE8();
    swift_allocError();
    *v3 = 5;
    swift_willThrow();
    return v0;
  }
  v0 = sub_2330A0C6C();
  v2 = sub_2330B8BA0();
  if (v1)
  {
    _s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(v1);
    swift_willThrow();

    return v0;
  }
  v5 = v2;
  if (!(v2 >> 62))
  {
    v6 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v6)
      goto LABEL_8;
LABEL_18:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v6 = sub_2330B8CD8();
  swift_bridgeObjectRelease();
  if (!v6)
    goto LABEL_18;
LABEL_8:
  v17 = MEMORY[0x24BEE4AF8];
  result = sub_2330A0788(0, v6 & ~(v6 >> 63), 0);
  if ((v6 & 0x8000000000000000) == 0)
  {
    v7 = 0;
    v0 = v17;
    do
    {
      if ((v5 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x23492EC24](v7, v5);
      else
        v8 = *(id *)(v5 + 8 * v7 + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, sel_bundleIdentifier);
      v11 = sub_2330B8A44();
      v13 = v12;

      v15 = *(_QWORD *)(v17 + 16);
      v14 = *(_QWORD *)(v17 + 24);
      if (v15 >= v14 >> 1)
        sub_2330A0788(v14 > 1, v15 + 1, 1);
      ++v7;
      *(_QWORD *)(v17 + 16) = v15 + 1;
      v16 = v17 + 16 * v15;
      *(_QWORD *)(v16 + 32) = v11;
      *(_QWORD *)(v16 + 40) = v13;
    }
    while (v6 != v7);
    swift_bridgeObjectRelease();
    return v0;
  }
  __break(1u);
  return result;
}

uint64_t ContactProviderManager.overrideDomain(_:)(uint64_t a1)
{
  uint64_t v1;
  _BYTE v3[40];

  sub_23309B090(a1, (uint64_t)v3);
  swift_beginAccess();
  sub_2330A0CDC((uint64_t)v3, v1 + 64);
  return swift_endAccess();
}

unint64_t sub_2330A0638(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256035860);
  v2 = sub_2330B8CFC();
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
    sub_2330A0F9C(v6, (uint64_t)&v15, &qword_256035868);
    v7 = v15;
    v8 = v16;
    result = sub_2330B3E3C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_2330A0F84(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
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

uint64_t sub_2330A076C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2330A07C0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2330A0788(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2330A0960(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2330A07A4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2330A0AC8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2330A07C0(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256035848);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256035850);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2330B8D08();
  __break(1u);
  return result;
}

uint64_t sub_2330A0960(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256036650);
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
  result = sub_2330B8D08();
  __break(1u);
  return result;
}

uint64_t sub_2330A0AC8(char a1, int64_t a2, char a3, char *a4)
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
  size_t v15;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256035840);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  v15 = 32 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2330B8D08();
  __break(1u);
  return result;
}

uint64_t sub_2330A0C2C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_2560356C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2330A0C6C()
{
  unint64_t result;

  result = qword_2560356D8;
  if (!qword_2560356D8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2560356D8);
  }
  return result;
}

uint64_t sub_2330A0CA8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2330A0CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2560356C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ContactProviderManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for ContactProviderManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ContactProviderManager.__allocating_init(domainIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of ContactProviderManager.domain.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of ContactProviderManager.isEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of ContactProviderManager.enable()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 208) + *(_QWORD *)(*(_QWORD *)v0 + 208));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23309B0EC;
  return v4();
}

uint64_t dispatch thunk of ContactProviderManager.disable()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 216) + *(_QWORD *)(*(_QWORD *)v0 + 216));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23309B0EC;
  return v4();
}

uint64_t dispatch thunk of ContactProviderManager.signalEnumerator(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 224) + *(_QWORD *)(*(_QWORD *)v1 + 224));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23309B0EC;
  return v6(a1);
}

uint64_t dispatch thunk of ContactProviderManager.invalidate()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 232) + *(_QWORD *)(*(_QWORD *)v0 + 232));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_233098F04;
  return v4();
}

uint64_t dispatch thunk of ContactProviderManager.reset()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 240) + *(_QWORD *)(*(_QWORD *)v0 + 240));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23309B0EC;
  return v4();
}

uint64_t sub_2330A0F48(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_2330A0F84(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2330A0F94()
{
  return swift_release();
}

uint64_t sub_2330A0F9C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2330A0FE8()
{
  uint64_t v0;
  unsigned int *v1;

  v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitTimeInterval);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2330A102C(int a1)
{
  uint64_t v1;
  _DWORD *v3;
  uint64_t result;

  v3 = (_DWORD *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitTimeInterval);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_2330A1074())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2330A10B8()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_shouldWait);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2330A10FC(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_shouldWait);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_2330A1144())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t StampedeManager.__allocating_init(notifyBatchSize:waitDivisor:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  StampedeManager.init(notifyBatchSize:waitDivisor:)(a1, a2);
  return v4;
}

uint64_t StampedeManager.init(notifyBatchSize:waitDivisor:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_2330B899C();
  *(_QWORD *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount) = 0;
  *(_BYTE *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishBatch) = 0;
  *(_BYTE *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishContent) = 0;
  *(_BYTE *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishChanges) = 0;
  *(_BYTE *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishWithError) = 0;
  *(_DWORD *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitTimeInterval) = 0;
  *(_BYTE *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_shouldWait) = 1;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_notifyBatchSize) = a1;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitDivisor) = a2;
  return v2;
}

void sub_2330A12BC()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount);
  v2 = __OFADD__(v1, 1);
  v3 = v1 + 1;
  if (v2)
    __break(1u);
  else
    *(_QWORD *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount) = v3;
}

uint64_t sub_2330A12DC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount);
  v3 = __OFADD__(v2, result);
  v4 = v2 + result;
  if (v3)
    __break(1u);
  else
    *(_QWORD *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount) = v4;
  return result;
}

void sub_2330A12FC()
{
  uint64_t v0;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishBatch) = 1;
}

void sub_2330A1310()
{
  uint64_t v0;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishContent) = 1;
}

uint64_t sub_2330A1324(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;

  v2 = &OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishBatch;
  if ((result & 1) == 0)
    v2 = &OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishChanges;
  *(_BYTE *)(v1 + *v2) = 1;
  return result;
}

void sub_2330A134C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _BYTE *v3;
  char v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _BYTE *v8;

  v1 = v0;
  *(_BYTE *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishWithError) = 1;
  sub_23309ADE8();
  v2 = (void *)swift_allocError();
  *v3 = 8;
  v4 = == infix(_:_:)();

  if ((v4 & 1) != 0)
  {
    v5 = sub_2330B8990();
    v6 = sub_2330B8B94();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_233097000, v5, v6, "didFinishEnumeratingWithError(extensionInvalidated) - will not wait for stamepede after save", v7, 2u);
      MEMORY[0x23492F2E4](v7, -1, -1);
    }

    v8 = (_BYTE *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_shouldWait);
    swift_beginAccess();
    *v8 = 0;
  }
}

uint64_t sub_2330A146C()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  char v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount);
  v2 = ((*(_BYTE *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishContent) & 1) != 0
     || *(_BYTE *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishChanges) == 1)
    && v1 > 0;
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_notifyBatchSize);
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishBatch) == 1
    && *(_BYTE *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishWithError) == 1)
  {
    if (v1 >= v3)
      v2 = 1;
    if (!v2)
      return v1 > 0;
    return 1;
  }
  v5 = v1 >= v3 || v2;
  return (v5 & 1) != 0;
}

BOOL sub_2330A1514()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount) > 0;
}

uint64_t sub_2330A152C()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int *v2;
  uint64_t result;
  uint64_t v4;
  double v5;
  _BYTE *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;

  v1 = v0;
  v2 = (unsigned int *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitTimeInterval);
  swift_beginAccess();
  *v2 = 0;
  result = sub_2330A146C();
  if ((result & 1) == 0)
    return result;
  v4 = OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount;
  v5 = ceil((double)*(uint64_t *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount)/ (double)*(uint64_t *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitDivisor));
  if ((~*(_QWORD *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v5 <= -1.0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v5 >= 4294967300.0)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  *v2 = v5;
  v6 = (_BYTE *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_shouldWait);
  result = swift_beginAccess();
  if (*v6 == 1)
  {
    swift_retain_n();
    v7 = sub_2330B8990();
    v8 = sub_2330B8B94();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = swift_slowAlloc();
      *(_DWORD *)v9 = 67240448;
      sub_2330B8BE8();
      *(_WORD *)(v9 + 8) = 2050;
      swift_release();
      sub_2330B8BE8();
      swift_release();
      _os_log_impl(&dword_233097000, v7, v8, "didSave() - sleeping %{public}u seconds for %{public}ld items", (uint8_t *)v9, 0x12u);
      MEMORY[0x23492F2E4](v9, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    result = sleep(*v2);
  }
  *(_QWORD *)(v1 + v4) = 0;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishBatch) = 0;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishContent) = 0;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishChanges) = 0;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishWithError) = 0;
  *v6 = 1;
  return result;
}

uint64_t StampedeManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_logger;
  v2 = sub_2330B89A8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t StampedeManager.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_logger;
  v2 = sub_2330B89A8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

void sub_2330A1804()
{
  _QWORD *v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount);
  v2 = __OFADD__(v1, 1);
  v3 = v1 + 1;
  if (v2)
    __break(1u);
  else
    *(_QWORD *)(*v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount) = v3;
}

uint64_t sub_2330A1828(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount);
  v3 = __OFADD__(v2, result);
  v4 = v2 + result;
  if (v3)
    __break(1u);
  else
    *(_QWORD *)(*v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount) = v4;
  return result;
}

void sub_2330A184C()
{
  _QWORD *v0;

  *(_BYTE *)(*v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishBatch) = 1;
}

void sub_2330A1864()
{
  _QWORD *v0;

  *(_BYTE *)(*v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishContent) = 1;
}

uint64_t sub_2330A187C(uint64_t result)
{
  _QWORD *v1;
  uint64_t *v2;

  v2 = &OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishBatch;
  if ((result & 1) == 0)
    v2 = &OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishChanges;
  *(_BYTE *)(*v1 + *v2) = 1;
  return result;
}

void sub_2330A18A8()
{
  sub_2330A134C();
}

uint64_t sub_2330A18C8()
{
  return sub_2330A146C() & 1;
}

BOOL sub_2330A18EC()
{
  _QWORD *v0;

  return *(_QWORD *)(*v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount) > 0;
}

uint64_t sub_2330A1908()
{
  return sub_2330A152C();
}

uint64_t sub_2330A1928(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2330A1938(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_2330A196C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *sub_2330A197C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_2330B8D08();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_2330A1A10@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_2330A1A38@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  _DWORD *v3;
  uint64_t result;

  v3 = (_DWORD *)(*a1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitTimeInterval);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2330A1A88(int *a1, _QWORD *a2)
{
  int v2;
  _DWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_DWORD *)(*a2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitTimeInterval);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_2330A1AD4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_shouldWait);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2330A1B24(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_shouldWait);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t dispatch thunk of StampedeManagerProtocol.didAddItem()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.didUpdateItem()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.didDeleteItems(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.didFinishEnumeratingPage()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.didFinishEnumeratingContent()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.didFinishEnumeratingChanges(moreComing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.didFinishEnumeratingWithError(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.shouldNotify.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.shouldSave.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.didSave()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_2330A1BC0()
{
  return type metadata accessor for StampedeManager();
}

uint64_t type metadata accessor for StampedeManager()
{
  uint64_t result;

  result = qword_2560358D0;
  if (!qword_2560358D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2330A1C04()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2330B89A8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for StampedeManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StampedeManager.waitTimeInterval.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of StampedeManager.waitTimeInterval.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of StampedeManager.waitTimeInterval.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of StampedeManager.shouldWait.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of StampedeManager.shouldWait.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of StampedeManager.shouldWait.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of StampedeManager.__allocating_init(notifyBatchSize:waitDivisor:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 376))();
}

uint64_t dispatch thunk of StampedeManager.didAddItem()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of StampedeManager.didUpdateItem()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of StampedeManager.didDeleteItems(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of StampedeManager.didFinishEnumeratingPage()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of StampedeManager.didFinishEnumeratingContent()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of StampedeManager.didFinishEnumeratingChanges(moreComing:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of StampedeManager.didFinishEnumeratingWithError(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of StampedeManager.shouldNotify.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of StampedeManager.shouldSave.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of StampedeManager.didSave()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t ContactItemPage.init(generationMarker:offset:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t ContactItemPage.generationMarker.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23309AB3C(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t ContactItemPage.generationMarker.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23309AA34(*(_QWORD *)v2, *(_QWORD *)(v2 + 8));
  *(_QWORD *)v2 = a1;
  *(_QWORD *)(v2 + 8) = a2;
  return result;
}

uint64_t (*ContactItemPage.generationMarker.modify())()
{
  return nullsub_1;
}

uint64_t ContactItemPage.offset.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t ContactItemPage.offset.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*ContactItemPage.offset.modify())()
{
  return nullsub_1;
}

uint64_t sub_2330A1E20(char a1)
{
  if ((a1 & 1) != 0)
    return 0x74657366666FLL;
  else
    return 0xD000000000000010;
}

BOOL sub_2330A1E58(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2330A1E70()
{
  sub_2330B8E04();
  sub_2330B8E10();
  return sub_2330B8E1C();
}

uint64_t sub_2330A1EB4()
{
  return sub_2330B8E10();
}

uint64_t sub_2330A1EDC()
{
  sub_2330B8E04();
  sub_2330B8E10();
  return sub_2330B8E1C();
}

uint64_t sub_2330A1F1C()
{
  char *v0;

  return sub_2330A1E20(*v0);
}

uint64_t sub_2330A1F24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2330A28C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2330A1F48()
{
  return 0;
}

void sub_2330A1F54(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2330A1F60()
{
  sub_2330A2408();
  return sub_2330B8E40();
}

uint64_t sub_2330A1F88()
{
  sub_2330A2408();
  return sub_2330B8E4C();
}

uint64_t ContactItemPage.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035AD0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  v11[0] = v1[2];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2330A2408();
  sub_2330B8E34();
  v12 = v8;
  v13 = v7;
  v14 = 0;
  sub_2330A244C();
  v9 = v11[1];
  sub_2330B8D44();
  if (!v9)
  {
    LOBYTE(v12) = 1;
    sub_2330B8D38();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ContactItemPage.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;
  char v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035AE8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2330A2408();
  sub_2330B8E28();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v15 = 0;
  sub_2330A2490();
  sub_2330B8D2C();
  v9 = v13;
  v10 = v14;
  LOBYTE(v13) = 1;
  sub_23309AB3C(v9, v14);
  v11 = sub_2330B8D20();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *a2 = v9;
  a2[1] = v10;
  a2[2] = v11;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_23309AA34(v9, v10);
}

uint64_t sub_2330A2284@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return ContactItemPage.init(from:)(a1, a2);
}

uint64_t sub_2330A2298(_QWORD *a1)
{
  return ContactItemPage.encode(to:)(a1);
}

double static ContactItemPage.initialPage.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = xmmword_2330B9A10;
  *(_QWORD *)(a1 + 16) = 0;
  return result;
}

void _s15ContactProvider0A8ItemPageV2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_2330A2308()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_2330A233C + *((int *)qword_2330A23F8 + (v0 >> 62))))();
}

BOOL sub_2330A234C@<W0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (a1 == BYTE6(v4) && (a1 < 1 || (sub_23309AB3C(v3, v4), sub_2330A7B2C(v1, v2), (v7 & 1) != 0)))
    return v5 == v6;
  else
    return 0;
}

unint64_t sub_2330A2408()
{
  unint64_t result;

  result = qword_256035AD8;
  if (!qword_256035AD8)
  {
    result = MEMORY[0x23492F248](&unk_2330B9B90, &type metadata for ContactItemPage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256035AD8);
  }
  return result;
}

unint64_t sub_2330A244C()
{
  unint64_t result;

  result = qword_256035AE0;
  if (!qword_256035AE0)
  {
    result = MEMORY[0x23492F248](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_256035AE0);
  }
  return result;
}

unint64_t sub_2330A2490()
{
  unint64_t result;

  result = qword_256035AF0;
  if (!qword_256035AF0)
  {
    result = MEMORY[0x23492F248](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_256035AF0);
  }
  return result;
}

uint64_t destroy for ContactItemSyncAnchor(uint64_t a1)
{
  return sub_23309AA34(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t *_s15ContactProvider21ContactItemSyncAnchorVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *a2;
  v5 = a2[1];
  sub_23309AB3C(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = a2[2];
  return a1;
}

uint64_t *assignWithCopy for ContactItemSyncAnchor(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  sub_23309AB3C(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_23309AA34(v6, v7);
  a1[2] = a2[2];
  return a1;
}

uint64_t *assignWithTake for ContactItemSyncAnchor(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_23309AA34(v4, v5);
  a1[2] = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactItemSyncAnchor(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ContactItemSyncAnchor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactItemPage()
{
  return &type metadata for ContactItemPage;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ContactItemPage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ContactItemPage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2330A2758 + 4 * byte_2330B9A25[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2330A278C + 4 * byte_2330B9A20[v4]))();
}

uint64_t sub_2330A278C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2330A2794(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2330A279CLL);
  return result;
}

uint64_t sub_2330A27A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2330A27B0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2330A27B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2330A27BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2330A27C8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2330A27D0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ContactItemPage.CodingKeys()
{
  return &type metadata for ContactItemPage.CodingKeys;
}

unint64_t sub_2330A27F0()
{
  unint64_t result;

  result = qword_256035AF8;
  if (!qword_256035AF8)
  {
    result = MEMORY[0x23492F248](&unk_2330B9B68, &type metadata for ContactItemPage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256035AF8);
  }
  return result;
}

unint64_t sub_2330A2838()
{
  unint64_t result;

  result = qword_256035B00;
  if (!qword_256035B00)
  {
    result = MEMORY[0x23492F248](&unk_2330B9AD8, &type metadata for ContactItemPage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256035B00);
  }
  return result;
}

unint64_t sub_2330A2880()
{
  unint64_t result;

  result = qword_256035B08;
  if (!qword_256035B08)
  {
    result = MEMORY[0x23492F248](&unk_2330B9B00, &type metadata for ContactItemPage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256035B08);
  }
  return result;
}

uint64_t sub_2330A28C4(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x80000002330BD420 || (sub_2330B8D68() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74657366666FLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_2330B8D68();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void Int.init(_:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2330A2A2C@<X0>(int a1@<W8>)
{
  unint64_t v1;
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
  BOOL v12;
  uint64_t v13;

  if (BYTE6(v1) != 8)
  {
    v3 = 0;
    goto LABEL_12;
  }
  v3 = v2;
  if (a1)
  {
    if (a1 == 1)
    {
      if ((int)v2 <= v2 >> 32)
      {
        v4 = sub_2330B8900();
        if (!v4)
        {
LABEL_16:
          sub_2330B890C();
          __break(1u);
          goto LABEL_17;
        }
        v5 = v4;
        v6 = sub_2330B8918();
        v7 = (int)v2 - v6;
        if (!__OFSUB__((int)v2, v6))
        {
          sub_2330B890C();
          v3 = *(_QWORD *)(v5 + v7);
          goto LABEL_12;
        }
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
      __break(1u);
    }
    else
    {
      v8 = *(_QWORD *)(v2 + 16);
      swift_retain();
      swift_retain();
      v9 = sub_2330B8900();
      if (!v9)
      {
LABEL_17:
        sub_2330B890C();
        __break(1u);
        JUMPOUT(0x2330A2B38);
      }
      v10 = v9;
      v11 = sub_2330B8918();
      v12 = __OFSUB__(v8, v11);
      v13 = v8 - v11;
      if (!v12)
      {
        sub_2330B890C();
        v3 = *(_QWORD *)(v10 + v13);
        swift_release();
        swift_release();
        goto LABEL_12;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_12:
  sub_23309AA34(v2, v1);
  return v3;
}

uint64_t ItemChangeObserverImpl.__allocating_init(suggestedBatchSize:store:)(uint64_t a1, __int128 *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  sub_2330B89C0();
  *(_QWORD *)(v4 + 16) = a1;
  sub_23309B0D4(a2, v4 + 24);
  return v4;
}

uint64_t == infix(_:_:)()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  char v13;

  v0 = (void *)sub_2330B893C();
  v1 = (void *)sub_2330B893C();
  v2 = objc_msgSend(v0, sel_code);
  if (v2 != objc_msgSend(v1, sel_code))
    goto LABEL_7;
  v3 = objc_msgSend(v0, sel_domain);
  v4 = sub_2330B8A44();
  v6 = v5;

  v7 = objc_msgSend(v1, sel_domain);
  v8 = sub_2330B8A44();
  v10 = v9;

  if (v4 == v8 && v6 == v10)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_9;
  }
  v12 = sub_2330B8D68();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
  {
LABEL_9:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B0);
    sub_2330B8CC0();
    sub_2330B8CC0();
    v13 = 1;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v13 & 1;
  }
LABEL_7:

  v13 = 0;
  return v13 & 1;
}

uint64_t sub_2330A2DB4()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_2330A2DE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_2330A2E20())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

double sub_2330A2E5C@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  uint64_t v4;
  char v5;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330B89E4();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_2330A2EE8(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;

  v1 = *(_QWORD *)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_BYTE *)(a1 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23309B074(v1, v2, v3, v4);
  swift_retain();
  return sub_2330B89F0();
}

uint64_t sub_2330A2F8C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330B89E4();
  swift_release();
  return swift_release();
}

uint64_t sub_2330A2FF0()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256035288);
  sub_2330B89CC();
  return swift_endAccess();
}

uint64_t sub_2330A3054(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t, uint64_t);
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035280);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256035288);
  sub_2330B89D8();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_2330A3164()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256035288);
  sub_2330B89CC();
  return swift_endAccess();
}

uint64_t ItemChangeObserverImpl.init(suggestedBatchSize:store:)(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035288);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v2 + OBJC_IVAR____TtC15ContactProvider22ItemChangeObserverImpl__state;
  memset(v11, 0, sizeof(v11));
  v12 = 0x80;
  sub_2330B89C0();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  *(_QWORD *)(v2 + 16) = a1;
  sub_23309B0D4(a2, v2 + 24);
  return v2;
}

uint64_t sub_2330A32A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  result = sub_2330A354C();
  if ((result & 1) != 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v6[1] = 0;
    v6[2] = 0;
    v6[0] = 1;
    LOBYTE(v7) = 0x80;
    swift_retain();
    sub_2330B89F0();
    sub_23309B090(v1 + 24, (uint64_t)v6);
    v4 = v7;
    v5 = v8;
    __swift_project_boxed_opaque_existential_1(v6, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a1, v4, v5);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  return result;
}

uint64_t sub_2330A3360(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  result = sub_2330A354C();
  if ((result & 1) != 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v6[1] = 0;
    v6[2] = 0;
    v6[0] = 1;
    LOBYTE(v7) = 0x80;
    swift_retain();
    sub_2330B89F0();
    sub_23309B090(v1 + 24, (uint64_t)v6);
    v4 = v7;
    v5 = v8;
    __swift_project_boxed_opaque_existential_1(v6, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 64))(a1, v4, v5);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  return result;
}

uint64_t sub_2330A3420(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t result;

  v1 = *a1;
  v2 = a1[1];
  result = sub_2330A354C();
  if ((result & 1) != 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_23309AB3C(v1, v2);
    swift_retain();
    return sub_2330B89F0();
  }
  return result;
}

uint64_t sub_2330A34C4(void *a1)
{
  uint64_t result;
  id v3;

  result = sub_2330A354C();
  if ((result & 1) != 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v3 = a1;
    swift_retain();
    return sub_2330B89F0();
  }
  return result;
}

uint64_t sub_2330A354C()
{
  void *v0;
  _BYTE *v1;
  id v2;
  char v3;
  char v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330B89E4();
  swift_release();
  swift_release();
  sub_23309ADE8();
  v0 = (void *)swift_allocError();
  *v1 = 7;
  sub_23309B074(v6, v7, v8, v9);
  v2 = v0;
  if (v9 >> 6 == 1)
  {
    v3 = == infix(_:_:)();
    sub_23309AB20(v6, v7, v8, v9);
    sub_23309AB20((uint64_t)v0, 0, 0, 0x40u);

    v4 = v3 ^ 1;
  }
  else
  {
    sub_23309AB20(v6, v7, v8, v9);
    sub_23309AB20((uint64_t)v0, 0, 0, 0x40u);

    v4 = 1;
  }
  sub_23309AB20(v6, v7, v8, v9);
  return v4 & 1;
}

uint64_t ItemChangeObserverImpl.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  v1 = v0 + OBJC_IVAR____TtC15ContactProvider22ItemChangeObserverImpl__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035288);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t ItemChangeObserverImpl.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  v1 = v0 + OBJC_IVAR____TtC15ContactProvider22ItemChangeObserverImpl__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035288);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2330A3784(uint64_t a1)
{
  return sub_2330A32A0(a1);
}

uint64_t sub_2330A37A4(uint64_t a1)
{
  return sub_2330A3360(a1);
}

uint64_t sub_2330A37C4(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t result;

  v1 = *a1;
  v2 = a1[1];
  result = sub_2330A354C();
  if ((result & 1) != 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_23309AB3C(v1, v2);
    swift_retain();
    return sub_2330B89F0();
  }
  return result;
}

uint64_t sub_2330A386C(void *a1)
{
  uint64_t result;
  id v3;

  result = sub_2330A354C();
  if ((result & 1) != 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v3 = a1;
    swift_retain();
    return sub_2330B89F0();
  }
  return result;
}

uint64_t sub_2330A38F8()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_beginAccess();
  return *(_QWORD *)(v1 + 16);
}

uint64_t static Equatable<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *);
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char v18;
  uint64_t v20;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - v9;
  v11 = *(void (**)(char *))(v5 + 16);
  v11((char *)&v20 - v9);
  v12 = sub_2330B8D5C();
  if (v12)
  {
    v13 = (void *)v12;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, a3);
  }
  else
  {
    v13 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v14, v10, a3);
  }
  ((void (*)(char *, uint64_t, uint64_t))v11)(v8, a2, a3);
  v15 = sub_2330B8D5C();
  if (v15)
  {
    v16 = (void *)v15;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a3);
  }
  else
  {
    v16 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v17, v8, a3);
  }
  v18 = == infix(_:_:)();

  return v18 & 1;
}

uint64_t _s15ContactProvider22ItemChangeObserverImplC5StateO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  char v10;
  char v12;
  char v13;
  _QWORD v14[3];

  v3 = *(_QWORD *)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(unsigned __int8 *)(a1 + 24);
  v7 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(unsigned __int8 *)(a2 + 24);
  if (v5 >> 6)
  {
    if (v5 >> 6 == 1)
    {
      if ((v9 & 0xC0) == 0x40)
      {
        sub_23309B074(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), v8, v9);
        sub_23309B074(v3, v2, v4, v5);
        v10 = == infix(_:_:)();
        sub_23309AB20(v3, v2, v4, v5);
        sub_23309AB20(v7, v6, v8, v9);
        return v10 & 1;
      }
      goto LABEL_15;
    }
    if ((v4 | v2 | v3 || v5 != 128) && (v9 & 0xC0) == 0x80 && v9 == 128 && v7 == 1 && !(v8 | v6))
    {
      v13 = 1;
      sub_23309AB20(1, 0, 0, 0x80u);
      sub_23309AB20(1, 0, 0, 0x80u);
      return v13 & 1;
    }
LABEL_15:
    sub_23309B074(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), v8, v9);
    sub_23309B074(v3, v2, v4, v5);
    sub_23309AB20(v3, v2, v4, v5);
    sub_23309AB20(v7, v6, v8, v9);
    v13 = 0;
    return v13 & 1;
  }
  if (v9 >= 0x40 || ((v5 & 1) == 0) == (v9 & 1))
    goto LABEL_15;
  v14[0] = *(_QWORD *)a1;
  v14[1] = v2;
  v14[2] = v4;
  sub_23309B074(v7, v6, v8, v9);
  sub_23309B074(v3, v2, v4, v5);
  sub_23309B074(v7, v6, v8, v9);
  sub_23309B074(v3, v2, v4, v5);
  _s15ContactProvider0A14ItemSyncAnchorV2eeoiySbAC_ACtFZ_0((uint64_t)v14);
  v13 = v12;
  sub_23309AB20(v3, v2, v4, v5);
  sub_23309AB20(v7, v6, v8, v9);
  sub_23309AB20(v7, v6, v8, v9);
  sub_23309AB20(v3, v2, v4, v5);
  return v13 & 1;
}

uint64_t sub_2330A3D2C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return result;
}

uint64_t sub_2330A3D70(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_QWORD *)(v3 + 16) = v2;
  return result;
}

uint64_t sub_2330A3DB8()
{
  return type metadata accessor for ItemChangeObserverImpl();
}

uint64_t type metadata accessor for ItemChangeObserverImpl()
{
  uint64_t result;

  result = qword_256035B40;
  if (!qword_256035B40)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2330A3DFC()
{
  unint64_t v0;

  sub_2330A3F00();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for ItemChangeObserverImpl()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.suggestedBatchSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.suggestedBatchSize.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.suggestedBatchSize.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.$state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.__allocating_init(suggestedBatchSize:store:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.didUpdate(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.didDelete(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.didFinishEnumeratingChanges(upTo:moreComing:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.didFinishEnumeratingChangesWithError(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

void sub_2330A3F00()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256035B50)
  {
    v0 = sub_2330B89FC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256035B50);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for ItemChangeObserverImpl.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for ItemChangeObserverImpl.State(uint64_t a1)
{
  sub_23309AB20(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t initializeWithCopy for ItemChangeObserverImpl.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23309B074(*(_QWORD *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for ItemChangeObserverImpl.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23309B074(*(_QWORD *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_23309AB20(v7, v8, v9, v10);
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

uint64_t assignWithTake for ItemChangeObserverImpl.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_23309AB20(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ItemChangeObserverImpl.State(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x1FE && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 510);
  v3 = ((*(unsigned __int8 *)(a1 + 24) >> 6) | (4
                                              * ((*(_QWORD *)(a1 + 8) >> 60) & 3 | (4
                                                                                  * ((*(unsigned __int8 *)(a1 + 24) >> 1) & 0x1F))))) ^ 0x1FF;
  if (v3 >= 0x1FD)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ItemChangeObserverImpl.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1FD)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 510;
    if (a3 >= 0x1FE)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0x1FE)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = ((-a2 >> 2) & 3) << 60;
      *(_QWORD *)(result + 16) = 0;
      *(_BYTE *)(result + 24) = ((((-a2 >> 2) & 0x7F) - (a2 << 7)) >> 1) & 0xFE;
    }
  }
  return result;
}

uint64_t sub_2330A4184(uint64_t a1)
{
  unsigned int v1;
  int v2;
  unsigned int v3;

  v1 = *(unsigned __int8 *)(a1 + 24);
  v2 = (char)v1;
  v3 = v1 >> 6;
  if (v2 >= 0)
    return v3;
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_2330A41A4(uint64_t result)
{
  *(_BYTE *)(result + 24) &= 0x3Fu;
  return result;
}

uint64_t sub_2330A41B4(uint64_t result, unsigned int a2)
{
  char v2;

  if (a2 < 2)
  {
    v2 = *(_BYTE *)(result + 24) & 1 | ((_BYTE)a2 << 6);
    *(_QWORD *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
    *(_BYTE *)(result + 24) = v2;
  }
  else
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 2;
    *(_BYTE *)(result + 24) = 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for ItemChangeObserverImpl.State()
{
  return &type metadata for ItemChangeObserverImpl.State;
}

uint64_t sub_2330A4200(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2330A425C()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2330A42A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2330A42F4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2330A4330(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 32) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2330A438C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2330A43C0(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2330A4404())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2330A4440(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 40) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2330A449C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2330A44D0(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 40) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2330A4514())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2330A4550()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t sub_2330A4580(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 48) = a1;
  return result;
}

uint64_t (*sub_2330A45BC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2330A45F8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 56);
  *(_QWORD *)a2 = v4;
  v5 = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(a2 + 8) = v5;
  return sub_23309AB3C(v4, v5);
}

uint64_t sub_2330A464C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = (_QWORD *)*a2;
  swift_beginAccess();
  v6 = v5[7];
  v7 = v5[8];
  v5[7] = v2;
  v5[8] = v3;
  v5[9] = v4;
  sub_23309AB3C(v2, v3);
  return sub_23309AA34(v6, v7);
}

uint64_t sub_2330A46C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 56);
  *(_QWORD *)a1 = v3;
  v4 = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 8) = v4;
  return sub_23309AB3C(v3, v4);
}

uint64_t sub_2330A4710(__int128 *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  __int128 v6;

  v6 = *a1;
  v2 = *((_QWORD *)a1 + 2);
  swift_beginAccess();
  v3 = v1[7];
  v4 = v1[8];
  *(_OWORD *)(v1 + 7) = v6;
  v1[9] = v2;
  return sub_23309AA34(v3, v4);
}

uint64_t (*sub_2330A4764())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2330A47A0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = (_QWORD *)*a1;
  swift_beginAccess();
  v4 = v3[10];
  v5 = v3[11];
  v6 = v3[12];
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  return sub_23309AFD8(v4, v5);
}

uint64_t sub_2330A47F0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = (_QWORD *)*a2;
  swift_beginAccess();
  v6 = v5[10];
  v7 = v5[11];
  v5[10] = v2;
  v5[11] = v3;
  v5[12] = v4;
  sub_23309AFD8(v2, v3);
  return sub_23309AA20(v6, v7);
}

uint64_t sub_2330A4878@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  swift_beginAccess();
  v3 = v1[10];
  v4 = v1[11];
  v5 = v1[12];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return sub_23309AFD8(v3, v4);
}

uint64_t sub_2330A48C4(__int128 *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  __int128 v6;

  v6 = *a1;
  v2 = *((_QWORD *)a1 + 2);
  swift_beginAccess();
  v3 = v1[10];
  v4 = v1[11];
  *((_OWORD *)v1 + 5) = v6;
  v1[12] = v2;
  return sub_23309AA20(v3, v4);
}

uint64_t (*sub_2330A491C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

double LocalStore.__allocating_init(contacts:groups:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  double result;

  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 88) = xmmword_2330B9510;
  *(_QWORD *)(v4 + 32) = a1;
  *(_QWORD *)(v4 + 40) = a2;
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 24) = 0xE000000000000000;
  *(_BYTE *)(v4 + 48) = 0;
  result = 0.0;
  *(_OWORD *)(v4 + 56) = xmmword_2330B9A10;
  *(_QWORD *)(v4 + 72) = 0;
  *(_QWORD *)(v4 + 80) = 0;
  return result;
}

uint64_t LocalStore.init(contacts:groups:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_OWORD *)(v2 + 88) = xmmword_2330B9510;
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0xE000000000000000;
  *(_BYTE *)(v2 + 48) = 0;
  *(_OWORD *)(v2 + 56) = xmmword_2330B9A10;
  *(_QWORD *)(v2 + 72) = 0;
  *(_QWORD *)(v2 + 80) = 0;
  return v2;
}

uint64_t sub_2330A49F0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  id v5;

  v2 = v1;
  v4 = (void *)sub_2330B8A38();
  objc_msgSend(a1, sel_setExternalIdentifier_, v4);

  swift_beginAccess();
  v5 = a1;
  MEMORY[0x23492EA68]();
  if (*(_QWORD *)((*(_QWORD *)(v2 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v2 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_2330B8ABC();
  sub_2330B8AC8();
  sub_2330B8AB0();
  return swift_endAccess();
}

uint64_t sub_2330A4AAC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[2];

  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v3 = (_BYTE *)(swift_bridgeObjectRetain() + 56);
    do
    {
      if ((*v3 & 1) == 0)
      {
        v4 = *((_QWORD *)v3 - 1);
        v5 = (void *)*((_QWORD *)v3 - 3);
        v8[0] = *((_QWORD *)v3 - 2);
        v8[1] = v4;
        v6 = v5;
        swift_bridgeObjectRetain_n();
        v7 = v6;
        sub_2330A4B88(v7, (uint64_t)v8, v1);
        swift_bridgeObjectRelease();

        sub_23309D698(v5);
      }
      v3 += 32;
      --v2;
    }
    while (v2);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2330A4B88(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD *v16;
  id v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v25;
  id v26;

  v5 = objc_msgSend(a1, sel_externalURI);
  if (v5)
  {
    v6 = v5;
    v7 = sub_2330B8A44();
    v9 = v8;

    swift_beginAccess();
    swift_bridgeObjectRetain();
    v10 = swift_bridgeObjectRetain();
    v11 = sub_2330A6654(v10, v7, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    if (v11)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256035C68);
      v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_2330B9CE0;
      *(_QWORD *)(v12 + 32) = v11;
      sub_2330B8AB0();
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_2330B9CE0;
      *(_QWORD *)(v13 + 32) = a1;
      sub_2330B8AB0();
      swift_beginAccess();
      v14 = v11;
      v15 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256035C98);
      sub_2330A5B90(&qword_256035CA0, &qword_256035C98, MEMORY[0x24BEE12E8]);
      sub_2330A5B90(&qword_256035CA8, &qword_256035C98, MEMORY[0x24BEE12E0]);
      sub_2330A5BD0(&qword_256035CB0, &qword_256035CB8);
      sub_2330B8B7C();
      swift_endAccess();

LABEL_6:
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  v16 = (_QWORD *)(a3 + 32);
  swift_beginAccess();
  v17 = a1;
  v18 = swift_bridgeObjectRetain();
  v19 = (void *)sub_2330A67E4(v18, v17);
  swift_bridgeObjectRelease();

  if (v19)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256035C68);
    v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_2330B9CE0;
    *(_QWORD *)(v20 + 32) = v19;
    sub_2330B8AB0();
    v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_2330B9CE0;
    *(_QWORD *)(v21 + 32) = v17;
    sub_2330B8AB0();
    swift_beginAccess();
    v22 = v17;
    v23 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256035C98);
    sub_2330A5B90(&qword_256035CA0, &qword_256035C98, MEMORY[0x24BEE12E8]);
    sub_2330A5B90(&qword_256035CA8, &qword_256035C98, MEMORY[0x24BEE12E0]);
    sub_2330A5BD0(&qword_256035CB0, &qword_256035CB8);
    sub_2330B8B7C();
    swift_endAccess();

    goto LABEL_6;
  }
  v25 = (void *)sub_2330B8A38();
  objc_msgSend(v17, sel_setExternalIdentifier_, v25);

  swift_beginAccess();
  v26 = v17;
  MEMORY[0x23492EA68]();
  if (*(_QWORD *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_2330B8ABC();
  sub_2330B8AC8();
  sub_2330B8AB0();
  return swift_endAccess();
}

uint64_t sub_2330A4FB8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  id v5;

  v2 = v1;
  v4 = (void *)sub_2330B8A38();
  objc_msgSend(a1, sel_setExternalIdentifier_, v4);

  swift_beginAccess();
  v5 = a1;
  MEMORY[0x23492EA68]();
  if (*(_QWORD *)((*(_QWORD *)(v2 + 40) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v2 + 40) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_2330B8ABC();
  sub_2330B8AC8();
  sub_2330B8AB0();
  return swift_endAccess();
}

uint64_t sub_2330A5074(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[2];

  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v3 = (_BYTE *)(swift_bridgeObjectRetain() + 56);
    do
    {
      if (*v3 == 1)
      {
        v4 = *((_QWORD *)v3 - 1);
        v5 = (void *)*((_QWORD *)v3 - 3);
        v8[0] = *((_QWORD *)v3 - 2);
        v8[1] = v4;
        v6 = v5;
        swift_bridgeObjectRetain_n();
        v7 = v6;
        sub_2330A5154(v7, (uint64_t)v8, v1);
        swift_bridgeObjectRelease();

        sub_23309D698(v5);
      }
      v3 += 32;
      --v2;
    }
    while (v2);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2330A5154(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD *v16;
  id v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v25;
  id v26;

  v5 = objc_msgSend(a1, sel_externalURI);
  if (v5)
  {
    v6 = v5;
    v7 = sub_2330B8A44();
    v9 = v8;

    swift_beginAccess();
    swift_bridgeObjectRetain();
    v10 = swift_bridgeObjectRetain();
    v11 = sub_2330A6654(v10, v7, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    if (v11)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256035C68);
      v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_2330B9CE0;
      *(_QWORD *)(v12 + 32) = v11;
      sub_2330B8AB0();
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_2330B9CE0;
      *(_QWORD *)(v13 + 32) = a1;
      sub_2330B8AB0();
      swift_beginAccess();
      v14 = v11;
      v15 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256035C70);
      sub_2330A5B90(&qword_256035C78, &qword_256035C70, MEMORY[0x24BEE12E8]);
      sub_2330A5B90(&qword_256035C80, &qword_256035C70, MEMORY[0x24BEE12E0]);
      sub_2330A5BD0(&qword_256035C88, &qword_256035C90);
      sub_2330B8B7C();
      swift_endAccess();

LABEL_6:
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  v16 = (_QWORD *)(a3 + 40);
  swift_beginAccess();
  v17 = a1;
  v18 = swift_bridgeObjectRetain();
  v19 = (void *)sub_2330A67E4(v18, v17);
  swift_bridgeObjectRelease();

  if (v19)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256035C68);
    v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_2330B9CE0;
    *(_QWORD *)(v20 + 32) = v19;
    sub_2330B8AB0();
    v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_2330B9CE0;
    *(_QWORD *)(v21 + 32) = v17;
    sub_2330B8AB0();
    swift_beginAccess();
    v22 = v17;
    v23 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256035C70);
    sub_2330A5B90(&qword_256035C78, &qword_256035C70, MEMORY[0x24BEE12E8]);
    sub_2330A5B90(&qword_256035C80, &qword_256035C70, MEMORY[0x24BEE12E0]);
    sub_2330A5BD0(&qword_256035C88, &qword_256035C90);
    sub_2330B8B7C();
    swift_endAccess();

    goto LABEL_6;
  }
  v25 = (void *)sub_2330B8A38();
  objc_msgSend(v17, sel_setExternalIdentifier_, v25);

  swift_beginAccess();
  v26 = v17;
  MEMORY[0x23492EA68]();
  if (*(_QWORD *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_2330B8ABC();
  sub_2330B8AC8();
  sub_2330B8AB0();
  return swift_endAccess();
}

_QWORD *sub_2330A5584(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  unint64_t *v46;
  unint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;

  v53 = result[2];
  if (!v53)
    return result;
  v52 = result + 4;
  swift_bridgeObjectRetain();
  v54 = (uint64_t *)(v1 + 32);
  swift_beginAccess();
  v51 = (uint64_t *)(v1 + 40);
  swift_beginAccess();
  v2 = 0;
LABEL_5:
  v4 = &v52[2 * v2];
  v6 = *v4;
  v5 = v4[1];
  v7 = *v54;
  v55 = v2;
  if (!((unint64_t)*v54 >> 62))
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    if (!v8)
      goto LABEL_24;
    goto LABEL_7;
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v8 = sub_2330B8CD8();
  if (v8)
  {
LABEL_7:
    v9 = 4;
    do
    {
      if ((v7 & 0xC000000000000001) != 0)
        result = (_QWORD *)MEMORY[0x23492EC24](v9 - 4, v7);
      else
        result = *(id *)(v7 + 8 * v9);
      v10 = result;
      v11 = v9 - 3;
      if (__OFADD__(v9 - 4, 1))
      {
        __break(1u);
        goto LABEL_56;
      }
      v12 = objc_msgSend(result, sel_externalURI);
      if (v12)
      {
        v13 = v12;
        v14 = sub_2330B8A44();
        v16 = v15;

        if (v14 == v6 && v16 == v5)
        {
LABEL_44:
          swift_bridgeObjectRelease();
LABEL_45:
          v3 = v55;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256035C68);
          v43 = swift_allocObject();
          *(_OWORD *)(v43 + 16) = xmmword_2330B9CE0;
          *(_QWORD *)(v43 + 32) = v10;
          sub_2330B8AB0();
          swift_beginAccess();
          v44 = v10;
          __swift_instantiateConcreteTypeFromMangledName(&qword_256035C98);
          sub_2330A5B90(&qword_256035CA0, &qword_256035C98, MEMORY[0x24BEE12E8]);
          v45 = sub_2330A5B90(&qword_256035CA8, &qword_256035C98, MEMORY[0x24BEE12E0]);
          v46 = &qword_256035CB0;
          v47 = &qword_256035CB8;
LABEL_48:
          v49 = v45;
          v50 = sub_2330A5BD0(v46, v47);
          sub_2330B8B7C();
          swift_endAccess();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
LABEL_4:
          v2 = v3 + 1;
          if (v2 == v53)
            return (_QWORD *)swift_bridgeObjectRelease();
          goto LABEL_5;
        }
        v18 = sub_2330B8D68();
        swift_bridgeObjectRelease();
        if ((v18 & 1) != 0)
          goto LABEL_45;
      }
      v19 = objc_msgSend(v10, sel_identifier, v49, v50);
      v20 = sub_2330B8A44();
      v22 = v21;

      if (v20 == v6 && v22 == v5)
        goto LABEL_44;
      v24 = sub_2330B8D68();
      swift_bridgeObjectRelease();
      if ((v24 & 1) != 0)
        goto LABEL_45;

      ++v9;
    }
    while (v11 != v8);
  }
LABEL_24:
  swift_bridgeObjectRelease_n();
  v25 = *v51;
  if (!((unint64_t)*v51 >> 62))
  {
    v26 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v26)
      goto LABEL_26;
LABEL_3:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v3 = v55;
    goto LABEL_4;
  }
  swift_bridgeObjectRetain_n();
  v26 = sub_2330B8CD8();
  if (!v26)
    goto LABEL_3;
LABEL_26:
  v27 = 4;
  while (1)
  {
    result = (v25 & 0xC000000000000001) != 0
           ? (_QWORD *)MEMORY[0x23492EC24](v27 - 4, v25)
           : *(id *)(v25 + 8 * v27);
    v28 = result;
    v29 = v27 - 3;
    if (__OFADD__(v27 - 4, 1))
      break;
    v30 = objc_msgSend(result, sel_externalURI);
    if (v30)
    {
      v31 = v30;
      v32 = sub_2330B8A44();
      v34 = v33;

      if (v32 == v6 && v34 == v5)
      {
LABEL_46:
        swift_bridgeObjectRelease();
LABEL_47:
        v3 = v55;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256035C68);
        v48 = swift_allocObject();
        *(_OWORD *)(v48 + 16) = xmmword_2330B9CE0;
        *(_QWORD *)(v48 + 32) = v28;
        sub_2330B8AB0();
        swift_beginAccess();
        v44 = v28;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256035C70);
        sub_2330A5B90(&qword_256035C78, &qword_256035C70, MEMORY[0x24BEE12E8]);
        v45 = sub_2330A5B90(&qword_256035C80, &qword_256035C70, MEMORY[0x24BEE12E0]);
        v46 = &qword_256035C88;
        v47 = &qword_256035C90;
        goto LABEL_48;
      }
      v36 = sub_2330B8D68();
      swift_bridgeObjectRelease();
      if ((v36 & 1) != 0)
        goto LABEL_47;
    }
    v37 = objc_msgSend(v28, sel_identifier, v49, v50);
    v38 = sub_2330B8A44();
    v40 = v39;

    if (v38 == v6 && v40 == v5)
      goto LABEL_46;
    v42 = sub_2330B8D68();
    swift_bridgeObjectRelease();
    if ((v42 & 1) != 0)
      goto LABEL_47;

    ++v27;
    if (v29 == v26)
      goto LABEL_3;
  }
LABEL_56:
  __break(1u);
  return result;
}

uint64_t sub_2330A5B90(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23492F248](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2330A5BD0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_2330A5C10(255, a2);
    result = MEMORY[0x23492F248](MEMORY[0x24BEE5BE0], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2330A5C10(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_2330A5C48(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  swift_beginAccess();
  v5 = v1[7];
  v6 = v1[8];
  v1[7] = v2;
  v1[8] = v3;
  v1[9] = v4;
  sub_23309AB3C(v2, v3);
  return sub_23309AA34(v5, v6);
}

uint64_t sub_2330A5CC0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 80);
  v6 = *(_QWORD *)(v2 + 88);
  *(_QWORD *)(v2 + 80) = a1;
  *(_QWORD *)(v2 + 88) = a2;
  *(_QWORD *)(v2 + 96) = 0;
  sub_23309AB3C(a1, a2);
  sub_23309AA20(v5, v6);
  result = swift_beginAccess();
  *(_BYTE *)(v2 + 48) = 1;
  return result;
}

uint64_t sub_2330A5D64(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  swift_beginAccess();
  v5 = v1[10];
  v6 = v1[11];
  v1[10] = v2;
  v1[11] = v3;
  v1[12] = v4;
  sub_23309AB3C(v2, v3);
  return sub_23309AA20(v5, v6);
}

uint64_t sub_2330A5DEC()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 32) = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)(v0 + 40) = v1;
  return swift_bridgeObjectRelease();
}

uint64_t LocalStore.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23309AA34(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
  sub_23309AA20(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
  return v0;
}

uint64_t LocalStore.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23309AA34(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
  sub_23309AA20(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
  return swift_deallocClassInstance();
}

uint64_t sub_2330A5EDC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2330A5F28(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;

  v5 = *v2;
  swift_beginAccess();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2330A5F7C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2330A5FBC(void *a1)
{
  return sub_2330A49F0(a1);
}

uint64_t sub_2330A5FDC(uint64_t a1)
{
  return sub_2330A4AAC(a1);
}

uint64_t sub_2330A5FFC(void *a1)
{
  return sub_2330A4FB8(a1);
}

uint64_t sub_2330A601C(uint64_t a1)
{
  return sub_2330A5074(a1);
}

_QWORD *sub_2330A603C(_QWORD *a1)
{
  return sub_2330A5584(a1);
}

uint64_t sub_2330A605C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_beginAccess();
  return *(unsigned __int8 *)(v1 + 48);
}

uint64_t sub_2330A6098@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v3 = *v1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 56);
  *(_QWORD *)a1 = v4;
  v5 = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(a1 + 8) = v5;
  return sub_23309AB3C(v4, v5);
}

uint64_t sub_2330A60EC@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = (_QWORD *)*v1;
  swift_beginAccess();
  v4 = v3[10];
  v5 = v3[11];
  v6 = v3[12];
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  return sub_23309AFD8(v4, v5);
}

uint64_t sub_2330A613C(uint64_t *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v2 = (_QWORD *)*v1;
  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  swift_beginAccess();
  v6 = v2[7];
  v7 = v2[8];
  v2[7] = v3;
  v2[8] = v4;
  v2[9] = v5;
  sub_23309AB3C(v3, v4);
  return sub_23309AA34(v6, v7);
}

uint64_t sub_2330A61C0(uint64_t a1, unint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;

  v5 = *v2;
  swift_beginAccess();
  v6 = *(_QWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 88);
  *(_QWORD *)(v5 + 80) = a1;
  *(_QWORD *)(v5 + 88) = a2;
  *(_QWORD *)(v5 + 96) = 0;
  sub_23309AB3C(a1, a2);
  sub_23309AA20(v6, v7);
  result = swift_beginAccess();
  *(_BYTE *)(v5 + 48) = 1;
  return result;
}

uint64_t sub_2330A6268(uint64_t *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v2 = (_QWORD *)*v1;
  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  swift_beginAccess();
  v6 = v2[10];
  v7 = v2[11];
  v2[10] = v3;
  v2[11] = v4;
  v2[12] = v5;
  sub_23309AB3C(v3, v4);
  return sub_23309AA20(v6, v7);
}

uint64_t sub_2330A62F4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  *a2 = *(_QWORD *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2330A6340@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2330A638C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 40);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2330A63D8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 48);
  return result;
}

uint64_t sub_2330A641C(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 48) = v2;
  return result;
}

uint64_t type metadata accessor for LocalStore()
{
  return objc_opt_self();
}

uint64_t method lookup function for LocalStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LocalStore.domainIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of LocalStore.domainIdentifier.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of LocalStore.domainIdentifier.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of LocalStore.contacts.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of LocalStore.contacts.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of LocalStore.contacts.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of LocalStore.groups.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of LocalStore.groups.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of LocalStore.groups.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of LocalStore.isContentEnumerated.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of LocalStore.isContentEnumerated.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of LocalStore.isContentEnumerated.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of LocalStore.page.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of LocalStore.page.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of LocalStore.page.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of LocalStore.syncAnchor.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of LocalStore.syncAnchor.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of LocalStore.syncAnchor.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of LocalStore.__allocating_init(contacts:groups:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of LocalStore.add(_:itemIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of LocalStore.update(contactItems:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of LocalStore.update(groupItems:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of LocalStore.remove(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of LocalStore.finishEnumeratingPage(upTo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of LocalStore.finishEnumeratingContent(upTo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of LocalStore.finishEnumeratingContentWithError(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of LocalStore.finishEnumeratingChanges(upTo:moreComing:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of LocalStore.finishEnumeratingChangesWithError(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of LocalStore.save(suppressNotifications:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of LocalStore.reset()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of LocalStore.logState()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

void *sub_2330A6654(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;

  if (a1 >> 62)
    goto LABEL_20;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_2330B8CD8())
  {
    v6 = 4;
    while (1)
    {
      v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x23492EC24](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      v8 = v7;
      v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v10 = objc_msgSend(v7, sel_externalURI);
      if (v10)
      {
        v11 = v10;
        v12 = sub_2330B8A44();
        v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v8;
        }
        v16 = sub_2330B8D68();
        swift_bridgeObjectRelease();
        if ((v16 & 1) != 0)
          goto LABEL_18;
      }

      ++v6;
      if (v9 == v5)
        goto LABEL_21;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2330A67E4(unint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  void *v20;

  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    v3 = sub_2330B8CD8();
    if (v3)
      goto LABEL_3;
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      for (i = 4; ; ++i)
      {
        v5 = i - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          v6 = (id)MEMORY[0x23492EC24](i - 4, a1);
          v7 = i - 3;
          if (__OFADD__(v5, 1))
            goto LABEL_18;
        }
        else
        {
          v6 = *(id *)(a1 + 8 * i);
          v7 = i - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        v20 = v6;
        v8 = objc_msgSend(v6, sel_identifier);
        v9 = sub_2330B8A44();
        v11 = v10;

        v12 = objc_msgSend(a2, sel_identifier);
        v13 = sub_2330B8A44();
        v15 = v14;

        if (v9 == v13 && v11 == v15)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_17:
          v3 = (uint64_t)v20;
          swift_bridgeObjectRelease();
          return v3;
        }
        v17 = sub_2330B8D68();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v17 & 1) != 0)
          goto LABEL_17;

        if (v7 == v3)
        {
          swift_bridgeObjectRelease();
          return 0;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t static ContactItem.Identifier.rootContainer.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  if (qword_256034DF0 != -1)
    swift_once();
  v2 = *(_QWORD *)algn_256035E88;
  *a1 = qword_256035E80;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void ContactItem.hash(into:)()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  sub_2330B8E10();
  v2 = v1;
  sub_2330B8BD0();
  sub_2330B8A68();

}

uint64_t static ContactItem.Identifier.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_2330B8D68();
}

uint64_t ContactItem.hashValue.getter()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  sub_2330B8E04();
  sub_2330B8E10();
  v2 = v1;
  sub_2330B8BD0();
  sub_2330B8A68();

  return sub_2330B8E1C();
}

void sub_2330A6B28()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  sub_2330B8E10();
  v2 = v1;
  sub_2330B8BD0();
  sub_2330B8A68();

}

uint64_t sub_2330A6B9C()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  sub_2330B8E04();
  sub_2330B8E10();
  v2 = v1;
  sub_2330B8BD0();
  sub_2330B8A68();

  return sub_2330B8E1C();
}

uint64_t ContactItem.Identifier.value.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

ContactProvider::ContactItem::Identifier __swiftcall ContactItem.Identifier.init(_:)(ContactProvider::ContactItem::Identifier result)
{
  ContactProvider::ContactItem::Identifier *v1;

  *v1 = result;
  return result;
}

uint64_t ContactItem.Identifier.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_2330B8A68();
  return swift_bridgeObjectRelease();
}

uint64_t ContactItem.Identifier.hashValue.getter()
{
  sub_2330B8E04();
  sub_2330B8A68();
  return sub_2330B8E1C();
}

uint64_t sub_2330A6CDC(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_2330B8D68();
}

uint64_t sub_2330A6D0C()
{
  sub_2330B8E04();
  sub_2330B8A68();
  return sub_2330B8E1C();
}

uint64_t sub_2330A6D54()
{
  return sub_2330B8A68();
}

uint64_t sub_2330A6D5C()
{
  sub_2330B8E04();
  sub_2330B8A68();
  return sub_2330B8E1C();
}

void sub_2330A6DA0()
{
  qword_256035E80 = 0x746F6F722ELL;
  *(_QWORD *)algn_256035E88 = 0xE500000000000000;
}

BOOL _s15ContactProvider0A4ItemO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  char v10;
  void *v11;
  id v13;
  id v14;
  char v15;
  char v16;

  v3 = *(void **)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(void **)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  if ((*(_BYTE *)(a1 + 24) & 1) == 0)
  {
    if ((*(_BYTE *)(a2 + 24) & 1) == 0)
    {
      sub_2330A7494();
      sub_23309D674(v5);
      sub_23309D674(v3);
      v13 = v3;
      v14 = v5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v15 = sub_2330B8BC4();

      if ((v15 & 1) != 0)
      {
        if (v2 == v6 && v4 == v7)
          goto LABEL_13;
        goto LABEL_16;
      }
      goto LABEL_14;
    }
LABEL_8:
    sub_23309D674(*(void **)a2);
    sub_23309D674(v3);
    sub_23309D698(v3);
    v11 = v5;
LABEL_9:
    sub_23309D698(v11);
    return 0;
  }
  if ((*(_BYTE *)(a2 + 24) & 1) == 0)
    goto LABEL_8;
  sub_2330A7494();
  sub_23309D674(v5);
  sub_23309D674(v3);
  v8 = v3;
  v9 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10 = sub_2330B8BC4();

  if ((v10 & 1) == 0)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23309D698(v3);
    v11 = v5;
    goto LABEL_9;
  }
  if (v2 == v6 && v4 == v7)
  {
LABEL_13:
    sub_23309D698(v3);
    sub_23309D698(v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 1;
  }
LABEL_16:
  v16 = sub_2330B8D68();
  sub_23309D698(v3);
  sub_23309D698(v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v16 & 1) != 0;
}

unint64_t sub_2330A70F4()
{
  unint64_t result;

  result = qword_256035E90;
  if (!qword_256035E90)
  {
    result = MEMORY[0x23492F248](&protocol conformance descriptor for ContactItem, &type metadata for ContactItem);
    atomic_store(result, (unint64_t *)&qword_256035E90);
  }
  return result;
}

unint64_t sub_2330A713C()
{
  unint64_t result;

  result = qword_256035E98;
  if (!qword_256035E98)
  {
    result = MEMORY[0x23492F248](&protocol conformance descriptor for ContactItem.Identifier, &type metadata for ContactItem.Identifier);
    atomic_store(result, (unint64_t *)&qword_256035E98);
  }
  return result;
}

uint64_t destroy for ContactItem(void **a1)
{
  return sub_23309D698(*a1);
}

uint64_t initializeWithCopy for ContactItem(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23309D674(*(void **)a2);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for ContactItem(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23309D674(*(void **)a2);
  v7 = *(void **)a1;
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  sub_23309D698(v7);
  return a1;
}

uint64_t assignWithTake for ContactItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  void *v5;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(void **)a1;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = v4;
  sub_23309D698(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactItem(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactItem(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_2330A7338(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_2330A7340(uint64_t result, char a2)
{
  *(_BYTE *)(result + 24) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ContactItem()
{
  return &type metadata for ContactItem;
}

_QWORD *initializeBufferWithCopyOfBuffer for ContactItem.Identifier(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ContactItem.Identifier()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ContactItem.Identifier(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for ContactItem.Identifier(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactItem.Identifier(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactItem.Identifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactItem.Identifier()
{
  return &type metadata for ContactItem.Identifier;
}

unint64_t sub_2330A7494()
{
  unint64_t result;

  result = qword_256035EA0;
  if (!qword_256035EA0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256035EA0);
  }
  return result;
}

uint64_t ContactItemSyncAnchor.init(generationMarker:offset:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t ContactItemSyncAnchor.generationMarker.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23309AB3C(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t ContactItemSyncAnchor.generationMarker.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23309AA34(*(_QWORD *)v2, *(_QWORD *)(v2 + 8));
  *(_QWORD *)v2 = a1;
  *(_QWORD *)(v2 + 8) = a2;
  return result;
}

uint64_t (*ContactItemSyncAnchor.generationMarker.modify())()
{
  return nullsub_1;
}

uint64_t ContactItemSyncAnchor.offset.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t ContactItemSyncAnchor.offset.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*ContactItemSyncAnchor.offset.modify())()
{
  return nullsub_1;
}

uint64_t sub_2330A7578()
{
  sub_2330A7F4C();
  return sub_2330B8E40();
}

uint64_t sub_2330A75A0()
{
  sub_2330A7F4C();
  return sub_2330B8E4C();
}

uint64_t ContactItemSyncAnchor.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035EA8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  v11[0] = v1[2];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2330A7F4C();
  sub_2330B8E34();
  v12 = v8;
  v13 = v7;
  v14 = 0;
  sub_2330A244C();
  v9 = v11[1];
  sub_2330B8D44();
  if (!v9)
  {
    LOBYTE(v12) = 1;
    sub_2330B8D38();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ContactItemSyncAnchor.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;
  char v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256035EB8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2330A7F4C();
  sub_2330B8E28();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v15 = 0;
  sub_2330A2490();
  sub_2330B8D2C();
  v9 = v13;
  v10 = v14;
  LOBYTE(v13) = 1;
  sub_23309AB3C(v9, v14);
  v11 = sub_2330B8D20();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *a2 = v9;
  a2[1] = v10;
  a2[2] = v11;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_23309AA34(v9, v10);
}

uint64_t sub_2330A789C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return ContactItemSyncAnchor.init(from:)(a1, a2);
}

uint64_t sub_2330A78B0(_QWORD *a1)
{
  return ContactItemSyncAnchor.encode(to:)(a1);
}

void sub_2330A78C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_2330A7924(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x2330A7B08);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_2330A7B2C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2330A7B88()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_2330A78C4((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_23309AA34(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_2330A7D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_2330B8900();
  v11 = result;
  if (result)
  {
    result = sub_2330B8918();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_2330B890C();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_2330A78C4(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void _s15ContactProvider0A14ItemSyncAnchorV2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_2330A7E4C()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_2330A7E80 + dword_2330A7F3C[v0 >> 62]))();
}

BOOL sub_2330A7E90@<W0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (a1 == BYTE6(v4) && (a1 < 1 || (sub_23309AB3C(v3, v4), sub_2330A7B2C(v1, v2), (v7 & 1) != 0)))
    return v5 == v6;
  else
    return 0;
}

unint64_t sub_2330A7F4C()
{
  unint64_t result;

  result = qword_256035EB0;
  if (!qword_256035EB0)
  {
    result = MEMORY[0x23492F248](&unk_2330B9FEC, &type metadata for ContactItemSyncAnchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256035EB0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactItemSyncAnchor()
{
  return &type metadata for ContactItemSyncAnchor;
}

uint64_t storeEnumTagSinglePayload for ContactItemSyncAnchor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2330A7FEC + 4 * byte_2330B9E75[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2330A8020 + 4 * asc_2330B9E70[v4]))();
}

uint64_t sub_2330A8020(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2330A8028(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2330A8030);
  return result;
}

uint64_t sub_2330A803C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2330A8044);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2330A8048(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2330A8050(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContactItemSyncAnchor.CodingKeys()
{
  return &type metadata for ContactItemSyncAnchor.CodingKeys;
}

unint64_t sub_2330A8070()
{
  unint64_t result;

  result = qword_256035EC0;
  if (!qword_256035EC0)
  {
    result = MEMORY[0x23492F248](&unk_2330B9FC4, &type metadata for ContactItemSyncAnchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256035EC0);
  }
  return result;
}

unint64_t sub_2330A80B8()
{
  unint64_t result;

  result = qword_256035EC8;
  if (!qword_256035EC8)
  {
    result = MEMORY[0x23492F248](&unk_2330B9F34, &type metadata for ContactItemSyncAnchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256035EC8);
  }
  return result;
}

unint64_t sub_2330A8100()
{
  unint64_t result;

  result = qword_256035ED0;
  if (!qword_256035ED0)
  {
    result = MEMORY[0x23492F248](&unk_2330B9F5C, &type metadata for ContactItemSyncAnchor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256035ED0);
  }
  return result;
}

uint64_t sub_2330A8144(char *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  unint64_t v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v4 = v3;
  v8 = sub_2330B8984();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 40) = 0;
  *(_BYTE *)(v4 + 48) = 0;
  result = sub_2330B899C();
  v34 = a3;
  v33 = a2;
  if ((a3 & 1) == 0)
  {
    if (a1)
      goto LABEL_11;
    __break(1u);
    goto LABEL_16;
  }
  v13 = (unint64_t)a1 >> 32;
  if ((unint64_t)a1 >> 32)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (a1 >> 11 == 27)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  LODWORD(v13) = a1 >> 16;
  if (a1 >> 16 > 0x10)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    v27 = (a1 & 0x3F) << 8;
    v28 = (v27 | (a1 >> 6)) + 33217;
    v29 = (v27 | (a1 >> 6) & 0x3F) << 8;
    v30 = (((v29 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
    v31 = (v29 | (a1 >> 12)) + 8487393;
    if ((_DWORD)v13)
      v14 = v30;
    else
      v14 = v31;
    if (a1 < 0x800)
      v14 = v28;
    goto LABEL_10;
  }
  if ((a1 & 0xFFFFFF80) != 0)
    goto LABEL_18;
  if (a1 > 0xFF)
  {
    __break(1u);
    goto LABEL_25;
  }
  v14 = ((_BYTE)a1 + 1);
LABEL_10:
  v36 = (v14 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v14) >> 3)) & 7)));
LABEL_11:
  v36 = sub_2330B8A5C();
  v37 = v15;
  swift_bridgeObjectRetain();
  sub_2330B8A74();
  swift_bridgeObjectRelease();
  v16 = v36;
  v17 = v37;
  sub_2330B8978();
  sub_2330B896C();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v36 = v16;
  v37 = v17;
  swift_bridgeObjectRetain();
  sub_2330B8A74();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v19 = v36;
  v18 = v37;
  *(_QWORD *)(v4 + 16) = v36;
  *(_QWORD *)(v4 + 24) = v18;
  swift_bridgeObjectRetain_n();
  v20 = sub_2330B8990();
  v21 = sub_2330B8B94();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v36 = v23;
    *(_DWORD *)v22 = 136446210;
    swift_bridgeObjectRetain();
    v35 = sub_2330B37FC(v19, v18, &v36);
    sub_2330B8BE8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_233097000, v20, v21, "Opening transaction - %{public}s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23492F2E4](v23, -1, -1);
    MEMORY[0x23492F2E4](v22, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v24 = v34;
  v25 = v33;
  sub_2330B8A50();
  swift_bridgeObjectRelease();
  v26 = os_transaction_create();
  swift_release();
  *(_QWORD *)(v4 + 32) = v26;
  swift_unknownObjectRelease();
  type metadata accessor for OSActivity();
  swift_allocObject();
  *(_QWORD *)(v4 + 40) = sub_2330A8BCC(a1, v25, v24);
  swift_release();
  return v4;
}

void sub_2330A854C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *oslog;
  uint64_t v15[3];
  uint64_t v16;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + 40);
  swift_retain_n();
  oslog = sub_2330B8990();
  if (v2)
  {
    v3 = sub_2330B8B94();
    if (os_log_type_enabled(oslog, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      v5 = swift_slowAlloc();
      v15[0] = v5;
      *(_DWORD *)v4 = 136446210;
      v6 = *(_QWORD *)(v1 + 16);
      v7 = *(_QWORD *)(v1 + 24);
      swift_bridgeObjectRetain();
      v16 = sub_2330B37FC(v6, v7, v15);
      sub_2330B8BE8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_233097000, oslog, v3, "Closing transaction - %{public}s", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23492F2E4](v5, -1, -1);
      MEMORY[0x23492F2E4](v4, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    v13 = *(_QWORD *)(v1 + 40);
    if (v13)
    {
      swift_beginAccess();
      swift_retain();
      os_activity_scope_leave((os_activity_scope_state_t)(v13 + 24));
      swift_endAccess();
      swift_release();
    }
    *(_QWORD *)(v1 + 40) = 0;
    swift_release();
    *(_QWORD *)(v1 + 32) = 0;
    swift_unknownObjectRelease();
    *(_BYTE *)(v1 + 48) = 1;
  }
  else
  {
    v8 = sub_2330B8B88();
    if (os_log_type_enabled(oslog, (os_log_type_t)v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      v15[0] = v10;
      *(_DWORD *)v9 = 136446210;
      v11 = *(_QWORD *)(v1 + 16);
      v12 = *(_QWORD *)(v1 + 24);
      swift_bridgeObjectRetain();
      v16 = sub_2330B37FC(v11, v12, v15);
      sub_2330B8BE8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_233097000, oslog, (os_log_type_t)v8, "Transaction already closed - %{public}s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23492F2E4](v10, -1, -1);
      MEMORY[0x23492F2E4](v9, -1, -1);

    }
    else
    {
      swift_release_n();

    }
  }
}

uint64_t sub_2330A8860()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = v0;
  if ((*(_BYTE *)(v0 + 48) & 1) == 0)
  {
    if (*(_QWORD *)(v0 + 40))
    {
      swift_retain();
      v2 = sub_2330B8990();
      v3 = sub_2330B8B88();
      if (os_log_type_enabled(v2, v3))
      {
        v4 = (uint8_t *)swift_slowAlloc();
        v5 = swift_slowAlloc();
        v11 = v5;
        *(_DWORD *)v4 = 136446210;
        v6 = *(_QWORD *)(v1 + 16);
        v7 = *(_QWORD *)(v1 + 24);
        swift_bridgeObjectRetain();
        sub_2330B37FC(v6, v7, &v11);
        sub_2330B8BE8();
        swift_release();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_233097000, v2, v3, "Transaction left open - %{public}s. Call complete() on this transaction!", v4, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23492F2E4](v5, -1, -1);
        MEMORY[0x23492F2E4](v4, -1, -1);

      }
      else
      {

        swift_release();
      }
    }
    sub_2330A854C();
  }
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  v8 = v1 + OBJC_IVAR____TtC15ContactProvider13OSTransaction_logger;
  v9 = sub_2330B89A8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  return v1;
}

uint64_t sub_2330A8A24()
{
  sub_2330A8860();
  return swift_deallocClassInstance();
}

uint64_t sub_2330A8A48()
{
  return type metadata accessor for OSTransaction();
}

uint64_t type metadata accessor for OSTransaction()
{
  uint64_t result;

  result = qword_256035F08;
  if (!qword_256035F08)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2330A8A8C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2330B89A8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_2330A8B18()
{
  sub_2330B8C30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2330B8A74();
  swift_bridgeObjectRelease();
  return 0x61736E617254534FLL;
}

uint64_t sub_2330A8BAC()
{
  return sub_2330A8B18();
}

uint64_t sub_2330A8BCC(char *a1, uint64_t a2, char a3)
{
  int v3;
  uint64_t v4;
  NSObject *v6;
  char *v7;
  unsigned int v8;
  unsigned int v9;
  NSObject *v10;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  char description[8];

  *(_QWORD *)(v4 + 24) = 0;
  *(_QWORD *)(v4 + 32) = 0;
  if ((a3 & 1) != 0)
  {
    if ((unint64_t)a1 >> 32)
    {
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    v8 = a1 >> 11;
    if (a1 >> 11 == 27)
    {
      __break(1u);
    }
    else
    {
      v8 = a1 >> 16;
      if (a1 >> 16 > 0x10)
      {
        __break(1u);
      }
      else if ((a1 & 0xFFFFFF80) == 0)
      {
        if (a1 > 0xFF)
        {
          __break(1u);
          goto LABEL_21;
        }
        v9 = ((_BYTE)a1 + 1);
LABEL_11:
        *(_QWORD *)description = (v9 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << ((32 - (__clz(v9) & 0x38)) & 0x38));
        if (qword_256034DF8 == -1)
        {
LABEL_12:
          v6 = qword_256035FB0;
          v7 = description;
          goto LABEL_13;
        }
LABEL_21:
        swift_once();
        goto LABEL_12;
      }
      v3 = (a1 & 0x3F) << 8;
      if (a1 < 0x800)
      {
        v9 = (v3 | (a1 >> 6)) + 33217;
        goto LABEL_11;
      }
    }
    v12 = (v3 | (a1 >> 6) & 0x3F) << 8;
    v13 = (((v12 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
    v14 = (v12 | (a1 >> 12)) + 8487393;
    if (v8)
      v9 = v13;
    else
      v9 = v14;
    goto LABEL_11;
  }
  if (!a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (qword_256034DF8 != -1)
LABEL_16:
    swift_once();
  v6 = qword_256035FB0;
  v7 = a1;
LABEL_13:
  *(_QWORD *)(v4 + 16) = _os_activity_create(&dword_233097000, v7, v6, OS_ACTIVITY_FLAG_DEFAULT);
  swift_beginAccess();
  v10 = swift_unknownObjectRetain();
  os_activity_scope_enter(v10, (os_activity_scope_state_t)(v4 + 24));
  swift_endAccess();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_2330A8DB0()
{
  qword_256035FB0 = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "_os_activity_current");
  return swift_unknownObjectRetain();
}

uint64_t sub_2330A8DD8()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for OSActivity()
{
  return objc_opt_self();
}

void *static SyncManager.shouldInvalidateForError(_:)(void *result)
{
  void *v1;
  void *v2;
  _BYTE *v3;
  id v4;
  char v5;

  if (result)
  {
    v1 = result;
    sub_23309ADE8();
    v2 = (void *)swift_allocError();
    *v3 = 7;
    v4 = v1;
    v5 = == infix(_:_:)();

    return (void *)(v5 & 1);
  }
  return result;
}

uint64_t static SyncManager.invalidateEnumerator(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_256036078 + dword_256036078);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_233098F04;
  return v5(a1);
}

uint64_t sub_2330A8EF8()
{
  uint64_t v0;

  v0 = sub_2330B89A8();
  __swift_allocate_value_buffer(v0, qword_256037A50);
  __swift_project_value_buffer(v0, (uint64_t)qword_256037A50);
  return sub_2330B899C();
}

uint64_t static SyncManager.enumerationTimeoutLimit.getter()
{
  swift_beginAccess();
  return qword_256036060;
}

uint64_t static SyncManager.enumerationTimeoutLimit.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256036060 = a1;
  return result;
}

uint64_t (*static SyncManager.enumerationTimeoutLimit.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static SyncManager.invalidateTimeoutLimit.getter()
{
  swift_beginAccess();
  return qword_256036068;
}

uint64_t static SyncManager.invalidateTimeoutLimit.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_256036068 = a1;
  return result;
}

uint64_t (*static SyncManager.invalidateTimeoutLimit.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2330A90FC()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t sub_2330A912C(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 56) = a1;
  return result;
}

uint64_t SyncManager.__allocating_init(store:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v5[2];

  sub_23309B090(a1, (uint64_t)v5);
  type metadata accessor for ExtensionState();
  v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_WORD *)(v2 + 112) = 0;
  __swift_destroy_boxed_opaque_existential_1(a1);
  type metadata accessor for SyncManager();
  v3 = swift_allocObject();
  *(_BYTE *)(v3 + 56) = 0;
  sub_23309B0D4(v5, v3 + 16);
  *(_QWORD *)(v3 + 64) = v2;
  return v3;
}

uint64_t SyncManager.__allocating_init(store:extensionState:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = __swift_mutable_project_boxed_opaque_existential_1(a1, v5);
  v8 = sub_2330AAA28(v7, a2, v2, v5, v6);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v8;
}

uint64_t SyncManager.init(store:extensionState:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = __swift_mutable_project_boxed_opaque_existential_1(a1, v5);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  v11 = sub_2330AA628((uint64_t)v9, a2, v2, v5, v6);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v11;
}

uint64_t sub_2330A92F0(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[39] = a2;
  v3[40] = v2;
  v4 = a1[1];
  v3[41] = *a1;
  v3[42] = v4;
  return swift_task_switch();
}

uint64_t sub_2330A9310()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 344) = *(_QWORD *)(*(_QWORD *)(v0 + 320) + 64);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_2330A9358()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 448) = *(_BYTE *)(*(_QWORD *)(v0 + 344) + 112);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2330A939C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  char v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  os_log_type_t v16;
  char *v17;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  __int128 v36;

  if ((*(_BYTE *)(v0 + 448) & 1) != 0)
  {
    if (qword_256034E00 != -1)
      swift_once();
    v1 = sub_2330B89A8();
    __swift_project_value_buffer(v1, (uint64_t)qword_256037A50);
    v2 = sub_2330B8990();
    v3 = sub_2330B8B94();
    if (!os_log_type_enabled(v2, v3))
    {
      v5 = 8;
      goto LABEL_14;
    }
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_233097000, v2, v3, "ItemContentSession not starting, extension was invalidated", v4, 2u);
    v5 = 8;
LABEL_12:
    MEMORY[0x23492F2E4](v4, -1, -1);
LABEL_14:

    sub_23309ADE8();
    swift_allocError();
    *v17 = v5;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v6 = *(_QWORD **)(v0 + 320);
  v7 = v6[5];
  v8 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v7);
  (*(void (**)(uint64_t, uint64_t))(v8 + 136))(v7, v8);
  v9 = v6[5];
  v10 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v9);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v10 + 72))(v9, v10) & 1) != 0)
  {
    v11 = *(_QWORD **)(v0 + 320);
    v12 = v11[5];
    v13 = v11[6];
    __swift_project_boxed_opaque_existential_1(v11 + 2, v12);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v13 + 88))(&v35, v12, v13);
    *(_QWORD *)(v0 + 392) = v35;
    v14 = v36;
    *(_OWORD *)(v0 + 400) = v36;
    if (v14 >> 60 == 15)
    {
      if (qword_256034E00 != -1)
        swift_once();
      v15 = sub_2330B89A8();
      __swift_project_value_buffer(v15, (uint64_t)qword_256037A50);
      v2 = sub_2330B8990();
      v16 = sub_2330B8B88();
      v5 = 2;
      if (!os_log_type_enabled(v2, v16))
        goto LABEL_14;
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_233097000, v2, v16, "ItemChangeSession not starting, have no sync anchor, throwing cannot enumerate", v4, 2u);
      goto LABEL_12;
    }
    *(_QWORD *)(v0 + 416) = *(_QWORD *)(*(_QWORD *)(v0 + 320) + 64);
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    if (qword_256034E00 != -1)
      swift_once();
    v34 = v6 + 2;
    v19 = sub_2330B89A8();
    *(_QWORD *)(v0 + 352) = __swift_project_value_buffer(v19, (uint64_t)qword_256037A50);
    v20 = sub_2330B8990();
    v21 = sub_2330B8B94();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_233097000, v20, v21, "ItemContentSession starting", v22, 2u);
      MEMORY[0x23492F2E4](v22, -1, -1);
    }
    v23 = *(_QWORD *)(v0 + 328);
    v24 = *(_QWORD *)(v0 + 336);
    v26 = *(_QWORD *)(v0 + 312);
    v25 = *(_QWORD *)(v0 + 320);

    v35 = v23;
    *(_QWORD *)&v36 = v24;
    sub_23309B090(v26, v0 + 16);
    sub_23309B090((uint64_t)v34, v0 + 56);
    swift_beginAccess();
    v27 = *(_BYTE *)(v25 + 56);
    v28 = *(_QWORD *)(v25 + 64);
    type metadata accessor for ItemContentSession();
    swift_allocObject();
    swift_retain();
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 360) = sub_23309B0F0((uint64_t)&v35, (_QWORD *)(v0 + 16), v0 + 56, v27, v28);
    v29 = v6[5];
    v30 = v6[6];
    __swift_project_boxed_opaque_existential_1(v34, v29);
    (*(void (**)(uint64_t, uint64_t))(v30 + 80))(v29, v30);
    v31 = *(_QWORD *)(v0 + 200);
    *(_QWORD *)(v0 + 176) = v31;
    *(_QWORD *)(v0 + 368) = v31;
    v32 = *(_OWORD *)(v0 + 208);
    *(_QWORD *)(v0 + 376) = v32;
    *(_OWORD *)(v0 + 184) = v32;
    v33 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 384) = v33;
    *v33 = v0;
    v33[1] = sub_2330A9838;
    return sub_23309B214(v0 + 176);
  }
}

uint64_t sub_2330A9838()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 376);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 368);
  swift_task_dealloc();
  sub_23309AA34(v2, v1);
  return swift_task_switch();
}

uint64_t sub_2330A989C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  _BYTE *v25;
  uint64_t v27;
  __int128 v28;

  v1 = *(void **)(*(_QWORD *)(v0 + 360) + 152);
  if (v1)
  {
    v2 = v1;
    v3 = v1;
    v4 = v1;
    v5 = sub_2330B8990();
    v6 = sub_2330B8B94();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v7 = 138412290;
      v9 = v1;
      v10 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 304) = v10;
      sub_2330B8BE8();
      *v8 = v10;

      _os_log_impl(&dword_233097000, v5, v6, "ItemContentSession ended, throwing error %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B8);
      swift_arrayDestroy();
      MEMORY[0x23492F2E4](v8, -1, -1);
      MEMORY[0x23492F2E4](v7, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v11 = *(_QWORD **)(v0 + 320);
  v12 = v11[5];
  v13 = v11[6];
  __swift_project_boxed_opaque_existential_1(v11 + 2, v12);
  (*(void (**)(uint64_t, uint64_t))(v13 + 136))(v12, v13);
  v14 = sub_2330B8990();
  v15 = sub_2330B8B94();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_233097000, v14, v15, "ItemContentSession ended", v16, 2u);
    MEMORY[0x23492F2E4](v16, -1, -1);
  }
  swift_release();

  v17 = *(_QWORD **)(v0 + 320);
  v18 = v17[5];
  v19 = v17[6];
  __swift_project_boxed_opaque_existential_1(v17 + 2, v18);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v19 + 88))(&v27, v18, v19);
  *(_QWORD *)(v0 + 392) = v27;
  v20 = v28;
  *(_OWORD *)(v0 + 400) = v28;
  if (v20 >> 60 == 15)
  {
    if (qword_256034E00 != -1)
      swift_once();
    v21 = sub_2330B89A8();
    __swift_project_value_buffer(v21, (uint64_t)qword_256037A50);
    v22 = sub_2330B8990();
    v23 = sub_2330B8B88();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_233097000, v22, v23, "ItemChangeSession not starting, have no sync anchor, throwing cannot enumerate", v24, 2u);
      MEMORY[0x23492F2E4](v24, -1, -1);
    }

    sub_23309ADE8();
    swift_allocError();
    *v25 = 2;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  *(_QWORD *)(v0 + 416) = *(_QWORD *)(*(_QWORD *)(v0 + 320) + 64);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_2330A9C48()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 449) = *(_BYTE *)(*(_QWORD *)(v0 + 416) + 112);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2330A9C8C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  unint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  __int128 v21;
  uint64_t v22[3];

  if ((*(_BYTE *)(v0 + 449) & 1) != 0)
  {
    if (qword_256034E00 != -1)
      swift_once();
    v1 = sub_2330B89A8();
    __swift_project_value_buffer(v1, (uint64_t)qword_256037A50);
    v2 = sub_2330B8990();
    v3 = sub_2330B8B94();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_233097000, v2, v3, "ItemChangeSession not starting, extension was invalidated", v4, 2u);
      MEMORY[0x23492F2E4](v4, -1, -1);
    }
    v5 = *(_QWORD *)(v0 + 400);
    v6 = *(_QWORD *)(v0 + 392);

    sub_23309ADE8();
    swift_allocError();
    *v7 = 8;
    swift_willThrow();
    sub_23309AA20(v6, v5);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_256034E00 != -1)
      swift_once();
    v9 = sub_2330B89A8();
    *(_QWORD *)(v0 + 424) = __swift_project_value_buffer(v9, (uint64_t)qword_256037A50);
    v10 = sub_2330B8990();
    v11 = sub_2330B8B94();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_233097000, v10, v11, "ItemChangeSession starting", v12, 2u);
      MEMORY[0x23492F2E4](v12, -1, -1);
    }
    v13 = *(_QWORD *)(v0 + 408);
    v21 = *(_OWORD *)(v0 + 392);
    v15 = *(_QWORD *)(v0 + 328);
    v14 = *(_QWORD *)(v0 + 336);
    v17 = *(_QWORD *)(v0 + 312);
    v16 = *(_QWORD *)(v0 + 320);

    v22[0] = v15;
    v22[1] = v14;
    sub_23309B090(v17, v0 + 136);
    sub_23309B090(v16 + 16, v0 + 96);
    swift_beginAccess();
    v18 = *(_BYTE *)(v16 + 56);
    v19 = *(_QWORD *)(v16 + 64);
    type metadata accessor for ItemChangeSession();
    swift_allocObject();
    swift_bridgeObjectRetain();
    swift_retain();
    *(_QWORD *)(v0 + 432) = sub_23309915C(v22, (_QWORD *)(v0 + 136), (__int128 *)(v0 + 96), v18, v19);
    *(_OWORD *)(v0 + 272) = v21;
    *(_QWORD *)(v0 + 288) = v13;
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 440) = v20;
    *v20 = v0;
    v20[1] = sub_2330A9F78;
    return sub_233099244(v0 + 272);
  }
}

uint64_t sub_2330A9F78()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2330A9FCC()
{
  _QWORD *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(void);
  unint64_t v20;
  uint64_t v21;

  v1 = *(void **)(v0[54] + 152);
  if (v1)
  {
    v2 = v1;
    v3 = v1;
    v4 = v1;
    v5 = sub_2330B8990();
    v6 = sub_2330B8B94();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v7 = 138543362;
      v9 = v1;
      v10 = _swift_stdlib_bridgeErrorToNSError();
      v0[37] = v10;
      sub_2330B8BE8();
      *v8 = v10;

      _os_log_impl(&dword_233097000, v5, v6, "ItemChangeSession ended, throwing error %{public}@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B8);
      swift_arrayDestroy();
      MEMORY[0x23492F2E4](v8, -1, -1);
      MEMORY[0x23492F2E4](v7, -1, -1);
    }
    else
    {

    }
    v20 = v0[50];
    v21 = v0[49];

    swift_willThrow();
    swift_release();
    sub_23309AA20(v21, v20);
    v19 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    v11 = (_QWORD *)v0[40];
    v12 = v11[5];
    v13 = v11[6];
    __swift_project_boxed_opaque_existential_1(v11 + 2, v12);
    (*(void (**)(uint64_t, uint64_t))(v13 + 136))(v12, v13);
    v14 = sub_2330B8990();
    v15 = sub_2330B8B94();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_233097000, v14, v15, "ItemChangeSession ended", v16, 2u);
      MEMORY[0x23492F2E4](v16, -1, -1);
    }
    v17 = v0[50];
    v18 = v0[49];
    swift_release();
    sub_23309AA20(v18, v17);

    v19 = (uint64_t (*)(void))v0[1];
  }
  return v19();
}

uint64_t sub_2330AA244(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v5 = a1[1];
  v3[2] = *a1;
  v3[3] = v5;
  v6 = (_QWORD *)swift_task_alloc();
  v3[4] = v6;
  *v6 = v3;
  v6[1] = sub_2330AA2B4;
  v6[39] = a2;
  v6[40] = v2;
  v7 = v3[3];
  v6[41] = v3[2];
  v6[42] = v7;
  return swift_task_switch();
}

uint64_t sub_2330AA2B4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2330AA320()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AA32C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a2;
  return swift_task_switch();
}

uint64_t sub_2330AA344()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 16);
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  v6 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v3 + 24) + *(_QWORD *)(v3 + 24));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v4;
  *v4 = v0;
  v4[1] = sub_2330AA3BC;
  return v6(v2, v3);
}

uint64_t sub_2330AA3BC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t SyncManager.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return v0;
}

uint64_t SyncManager.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_2330AA458(_QWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v5 = *v2;
  v6 = a1[1];
  v3[2] = *a1;
  v3[3] = v6;
  v7 = (_QWORD *)swift_task_alloc();
  v3[4] = v7;
  *v7 = v3;
  v7[1] = sub_2330AA4CC;
  v7[39] = a2;
  v7[40] = v5;
  v8 = v3[3];
  v7[41] = v3[2];
  v7[42] = v8;
  return swift_task_switch();
}

uint64_t sub_2330AA4CC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2330AA538(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_2330AA558(uint64_t (*a1)(void))
{
  return a1();
}

void sub_2330AA578(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_2330B8BE8();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

uint64_t sub_2330AA628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;

  *(_QWORD *)(a3 + 40) = a4;
  *(_QWORD *)(a3 + 48) = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(a3 + 16));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a1, a4);
  *(_BYTE *)(a3 + 56) = 0;
  *(_QWORD *)(a3 + 64) = a2;
  return a3;
}

uint64_t sub_2330AA684(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 88) = a1;
  return swift_task_switch();
}

uint64_t sub_2330AA69C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v1 = *(_QWORD *)(v0 + 88);
  swift_beginAccess();
  sub_23309B090(v1, v0 + 16);
  v2 = swift_allocObject();
  *(_QWORD *)(v0 + 96) = v2;
  sub_23309B0D4((__int128 *)(v0 + 16), v2 + 16);
  v5 = (uint64_t (*)(void))((char *)&dword_256036278 + dword_256036278);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v3;
  *v3 = v0;
  v3[1] = sub_2330AA798;
  return v5();
}

uint64_t sub_2330AA798()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_2330AA804()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AA80C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  swift_release();
  if (qword_256034E00 != -1)
    swift_once();
  v1 = *(void **)(v0 + 112);
  v2 = sub_2330B89A8();
  __swift_project_value_buffer(v2, (uint64_t)qword_256037A50);
  v3 = v1;
  v4 = v1;
  v5 = sub_2330B8990();
  v6 = sub_2330B8B94();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 112);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138543362;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 80) = v12;
    sub_2330B8BE8();
    *v10 = v12;

    _os_log_impl(&dword_233097000, v5, v6, "ContactItemEnumerator.invalidate() error %{public}@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B8);
    swift_arrayDestroy();
    MEMORY[0x23492F2E4](v10, -1, -1);
    MEMORY[0x23492F2E4](v9, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for SyncManager()
{
  return objc_opt_self();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_2330AAA28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v15;

  v9 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SyncManager();
  v12 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, a4);
  *(_QWORD *)(v12 + 40) = a4;
  *(_QWORD *)(v12 + 48) = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v12 + 16));
  (*(void (**)(uint64_t *, char *, uint64_t))(v9 + 32))(boxed_opaque_existential_1, v11, a4);
  *(_BYTE *)(v12 + 56) = 0;
  *(_QWORD *)(v12 + 64) = a2;
  return v12;
}

uint64_t sub_2330AAAE8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 56);
  return result;
}

uint64_t sub_2330AAB2C(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 56) = v2;
  return result;
}

uint64_t dispatch thunk of SyncManagerProtocol.signalEnumerator(for:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 8) + *(_QWORD *)(a4 + 8));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23309B0EC;
  return v11(a1, a2, a3, a4);
}

uint64_t method lookup function for SyncManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SyncManager.verbose.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of SyncManager.verbose.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of SyncManager.verbose.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of SyncManager.__allocating_init(store:extensionState:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of SyncManager.sync(for:using:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 160) + *(_QWORD *)(*(_QWORD *)v2 + 160));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23309B0EC;
  return v8(a1, a2);
}

uint64_t dispatch thunk of SyncManager.signalEnumerator(for:using:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 168) + *(_QWORD *)(*(_QWORD *)v2 + 168));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_233098F04;
  return v8(a1, a2);
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

uint64_t sub_2330AAD84()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_2330AADA8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23309B0EC;
  v2[2] = v0 + 16;
  return swift_task_switch();
}

uint64_t ContactProviderError.hash(into:)()
{
  return sub_2330B8E10();
}

uint64_t ContactProviderError.hashValue.getter()
{
  sub_2330B8E04();
  sub_2330B8E10();
  return sub_2330B8E1C();
}

uint64_t sub_2330AAE7C(char *a1, char *a2)
{
  return sub_2330B5FD4(*a1, *a2);
}

uint64_t sub_2330AAE88()
{
  sub_2330AB5A8();
  return sub_2330B8DBC();
}

uint64_t sub_2330AAEB0()
{
  sub_2330AB5A8();
  return sub_2330B8DB0();
}

uint64_t ContactProviderError.errorDescription.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2330AAF1C + 4 * byte_2330BA1B0[*v0]))(0xD000000000000034, 0x80000002330BD820);
}

unint64_t sub_2330AAF1C()
{
  return 0xD000000000000020;
}

uint64_t sub_2330AAF38@<X0>(uint64_t a1@<X8>)
{
  return a1 + 5;
}

unint64_t ContactProviderError.failureReason.getter()
{
  unsigned __int8 *v0;
  int v1;
  unint64_t v2;

  v1 = *v0;
  v2 = 0xD000000000000066;
  if (v1 != 7)
    v2 = 0;
  if (v1 == 9)
    return 0xD000000000000064;
  else
    return v2;
}

unint64_t sub_2330AB010()
{
  unsigned __int8 *v0;
  int v1;
  unint64_t v2;

  v1 = *v0;
  v2 = 0xD000000000000066;
  if (v1 != 7)
    v2 = 0;
  if (v1 == 9)
    return 0xD000000000000064;
  else
    return v2;
}

unint64_t ContactProviderError.errorUserInfo.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;

  v0 = ContactProviderError.errorDescription.getter();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560361B0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2330B9700;
  *(_QWORD *)(inited + 32) = sub_2330B8A44();
  *(_QWORD *)(inited + 40) = v4;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v0;
  *(_QWORD *)(inited + 56) = v2;
  return sub_2330A0638(inited);
}

uint64_t ContactProviderError.errorCode.getter()
{
  unsigned __int8 *v0;

  return *v0 + 1000;
}

uint64_t sub_2330AB104()
{
  unsigned __int8 *v0;

  return *v0 + 1000;
}

void *_s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(void *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  _BYTE *v10;
  id v11;
  _BYTE *v13;
  _BYTE *v14;
  _BYTE *v15;
  _BYTE *v16;
  _BYTE *v17;
  _BYTE *v18;
  _BYTE *v19;
  _BYTE *v20;
  _BYTE *v21;

  v2 = (void *)sub_2330B893C();
  v3 = objc_msgSend(v2, sel_domain);
  v4 = sub_2330B8A44();
  v6 = v5;

  sub_2330AB5A8();
  if (v4 == sub_2330B88F4() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v9 = sub_2330B8D68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
LABEL_10:
      v11 = a1;
      goto LABEL_11;
    }
  }
  switch((unint64_t)objc_msgSend(v2, sel_code))
  {
    case 0x3E8uLL:
      sub_23309ADE8();
      a1 = (void *)swift_allocError();
      *v10 = 0;
      break;
    case 0x3E9uLL:
      sub_23309ADE8();
      a1 = (void *)swift_allocError();
      *v13 = 1;
      break;
    case 0x3EAuLL:
      sub_23309ADE8();
      a1 = (void *)swift_allocError();
      *v14 = 2;
      break;
    case 0x3EBuLL:
      sub_23309ADE8();
      a1 = (void *)swift_allocError();
      *v15 = 3;
      break;
    case 0x3ECuLL:
      sub_23309ADE8();
      a1 = (void *)swift_allocError();
      *v16 = 4;
      break;
    case 0x3EDuLL:
      sub_23309ADE8();
      a1 = (void *)swift_allocError();
      *v17 = 5;
      break;
    case 0x3EEuLL:
      sub_23309ADE8();
      a1 = (void *)swift_allocError();
      *v18 = 6;
      break;
    case 0x3EFuLL:
      sub_23309ADE8();
      a1 = (void *)swift_allocError();
      *v19 = 7;
      break;
    case 0x3F0uLL:
      sub_23309ADE8();
      a1 = (void *)swift_allocError();
      *v20 = 8;
      break;
    case 0x3F1uLL:
      sub_23309ADE8();
      a1 = (void *)swift_allocError();
      *v21 = 9;
      break;
    default:
      goto LABEL_10;
  }
LABEL_11:

  return a1;
}

unint64_t sub_2330AB3FC()
{
  unint64_t result;

  result = qword_2560361B8;
  if (!qword_2560361B8)
  {
    result = MEMORY[0x23492F248](&protocol conformance descriptor for ContactProviderError, &type metadata for ContactProviderError);
    atomic_store(result, (unint64_t *)&qword_2560361B8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ContactProviderError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactProviderError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_2330AB520 + 4 * byte_2330BA1BF[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_2330AB554 + 4 * byte_2330BA1BA[v4]))();
}

uint64_t sub_2330AB554(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2330AB55C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2330AB564);
  return result;
}

uint64_t sub_2330AB570(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2330AB578);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_2330AB57C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2330AB584(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2330AB590(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ContactProviderError()
{
  return &type metadata for ContactProviderError;
}

unint64_t sub_2330AB5A8()
{
  unint64_t result;

  result = qword_2560361C0[0];
  if (!qword_2560361C0[0])
  {
    result = MEMORY[0x23492F248](&protocol conformance descriptor for ContactProviderError, &type metadata for ContactProviderError);
    atomic_store(result, qword_2560361C0);
  }
  return result;
}

uint64_t sub_2330AB5F0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2330B89A8();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t sub_2330AB688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v6 = sub_2330B8C9C();
  v5[7] = v6;
  v5[8] = *(_QWORD *)(v6 - 8);
  v5[9] = swift_task_alloc();
  v5[10] = swift_task_alloc();
  v7 = sub_2330B8CB4();
  v5[11] = v7;
  v5[12] = *(_QWORD *)(v7 - 8);
  v5[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2330AB728()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  _QWORD *v10;
  __int128 v12;

  v1 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 56);
  v5 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 24);
  v6 = *(_QWORD *)(v0 + 32);
  v12 = *(_OWORD *)(v0 + 40);
  sub_2330B8CA8();
  sub_2330B8C84();
  MEMORY[0x23492EC6C](v7, v6);
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  *(_QWORD *)(v0 + 112) = v8;
  v8(v3, v4);
  v9 = swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v9;
  *(_OWORD *)(v9 + 16) = v12;
  *(_QWORD *)(v9 + 32) = v2;
  *(_QWORD *)(v9 + 40) = v1;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v10;
  *v10 = v0;
  v10[1] = sub_2330AB834;
  return sub_2330B8D14();
}

uint64_t sub_2330AB834()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2330AB8A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(v0 + 112))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 56));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AB91C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 112);
  v3 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 56);
  swift_task_dealloc();
  v1(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AB9AC()
{
  return sub_2330B8E10();
}

uint64_t sub_2330AB9D0()
{
  sub_2330B8E04();
  sub_2330B8E10();
  return sub_2330B8E1C();
}

uint64_t sub_2330ABA14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x23492F248](&unk_2330BA428, a3);
  return static Equatable<>.== infix(_:_:)(a1, a2, a3);
}

uint64_t sub_2330ABA70()
{
  return sub_2330AB9D0();
}

uint64_t sub_2330ABA78()
{
  return sub_2330AB9AC();
}

uint64_t sub_2330ABA80()
{
  sub_2330B8E04();
  sub_2330AB9AC();
  return sub_2330B8E1C();
}

uint64_t sub_2330ABAC4(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256036298);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2330B8B1C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v3;
  v11[5] = a1;
  v11[6] = a2;
  v11[7] = a3;
  v12 = v3;
  v13 = a1;
  swift_retain();
  sub_2330ABC1C((uint64_t)v9, (uint64_t)&unk_256036350, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_2330ABBA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v12;

  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v12;
  *v12 = v7;
  v12[1] = sub_23309B0EC;
  v12[5] = a7;
  v12[6] = a4;
  v12[3] = a5;
  v12[4] = a6;
  return swift_task_switch();
}

uint64_t sub_2330ABC1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2330B8B1C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2330B8B10();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2330AF680(a1, &qword_256036298);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2330B8AD4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_2330ABD68(void *a1, int a2, void *a3, void *aBlock)
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v6 = _Block_copy(aBlock);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v9 = a3;
  v8 = a1;
  sub_2330ABAC4(v9, (uint64_t)sub_2330AFDD4, v7);
  swift_release();

}

void sub_2330ABDF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_2330B893C();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t sub_2330ABE40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v16;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256036298);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2330B8B1C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v4;
  v13[5] = a1;
  v13[6] = a2;
  v13[7] = a3;
  v13[8] = a4;
  v14 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2330ABC1C((uint64_t)v11, (uint64_t)&unk_256036340, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_2330ABF34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v14;

  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v14;
  *v14 = v8;
  v14[1] = sub_23309B0EC;
  v14[11] = a8;
  v14[12] = a4;
  v14[9] = a6;
  v14[10] = a7;
  v14[8] = a5;
  return swift_task_switch();
}

void sub_2330ABFBC(void *a1, int a2, int a3, void *aBlock)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v5 = _Block_copy(aBlock);
  v6 = sub_2330B8A44();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = a1;
  sub_2330ABE40(v6, v8, (uint64_t)sub_2330AFCF8, v9);
  swift_release();
  swift_bridgeObjectRelease();

}

uint64_t sub_2330AC068(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch();
}

uint64_t sub_2330AC084()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = *(_QWORD *)(*(_QWORD *)(v0 + 48)
                                   + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 48)) + 0x70));
  return swift_task_switch();
}

uint64_t sub_2330AC0B8()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 56) + 113) = 1;
  return swift_task_switch();
}

uint64_t sub_2330AC0D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  type metadata accessor for OSTransaction();
  swift_allocObject();
  *(_QWORD *)(v0 + 64) = sub_2330A8144("synchronize", 11, 2);
  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *(_QWORD *)v1 = v0;
  *(_QWORD *)(v1 + 8) = sub_2330AC174;
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v1 + 40) = *(_QWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 24) = v3;
  *(_QWORD *)(v1 + 16) = v2;
  return swift_task_switch();
}

uint64_t sub_2330AC174()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2330AC1D8()
{
  sub_2330A854C();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2330AC21C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 56) + 113) = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AC22C()
{
  _QWORD *v0;
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
  void *v12;
  void (*v13)(void *);
  id v14;

  v1 = (void *)v0[10];
  sub_2330A854C();
  swift_release();
  v2 = v1;
  v3 = v1;
  v4 = sub_2330B8990();
  v5 = sub_2330B8B94();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (void *)v0[10];
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138543362;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v10;
    sub_2330B8BE8();
    *v8 = v10;

    _os_log_impl(&dword_233097000, v4, v5, "handleSynchronize - caught error %{public}@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B8);
    swift_arrayDestroy();
    MEMORY[0x23492F2E4](v8, -1, -1);
    MEMORY[0x23492F2E4](v7, -1, -1);

  }
  else
  {
    v11 = (void *)v0[10];

  }
  v12 = (void *)v0[10];
  v13 = (void (*)(void *))v0[4];
  v14 = v12;
  v13(v12);

  return swift_task_switch();
}

uint64_t sub_2330AC400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_2330AC41C()
{
  uint64_t v0;
  uint64_t v1;

  sub_2330AC52C(*(void **)(v0 + 24));
  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *(_QWORD *)v1 = v0;
  *(_QWORD *)(v1 + 8) = sub_2330AC488;
  *(int8x16_t *)(v1 + 24) = vextq_s8(*(int8x16_t *)(v0 + 16), *(int8x16_t *)(v0 + 16), 8uLL);
  return swift_task_switch();
}

uint64_t sub_2330AC488()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_2330AC4F4()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 32))(0);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AC52C(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *, uint64_t, uint64_t);
  _QWORD v19[5];

  v3 = *v1;
  v4 = *MEMORY[0x24BEE4EA0];
  v5 = objc_msgSend(a1, sel_userInfo);
  v6 = sub_2330B8A2C();

  sub_2330A0638(MEMORY[0x24BEE4AF8]);
  if (qword_256034E10 != -1)
    swift_once();
  v7 = v4 & v3;
  v9 = qword_256036680;
  v8 = *(_QWORD *)algn_256036688;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2330A0638(MEMORY[0x24BEE4AF8]);
  v10 = objc_msgSend(a1, sel_displayName);
  v11 = sub_2330B8A44();
  v13 = v12;
  swift_bridgeObjectRelease();

  v19[3] = &type metadata for CustomContactProviderDomain;
  v19[4] = &protocol witness table for CustomContactProviderDomain;
  v14 = (_QWORD *)swift_allocObject();
  v19[0] = v14;
  v14[2] = v9;
  v14[3] = v8;
  v14[4] = v11;
  v14[5] = v13;
  v14[6] = v6;
  v16 = *(_QWORD *)(v7 + 80);
  v15 = *(_QWORD *)(v7 + 88);
  v17 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v15 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17(v19, v16, v15);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2330AC700(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_2330AC718()
{
  uint64_t v0;
  _QWORD *v1;
  id v2;
  uint64_t *v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  char v26;
  uint64_t v27;
  char v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  void *v32;
  uint64_t v33;

  v1 = *(_QWORD **)(v0 + 32);
  v2 = objc_msgSend(*(id *)(v0 + 24), sel_synchronizationReason);
  *(_QWORD *)(v0 + 40) = v2;
  v3 = (uint64_t *)MEMORY[0x24BEE4EA0];
  *(_QWORD *)(v0 + 48) = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x60);
  v4 = v2;
  v5 = sub_2330B8990();
  v6 = sub_2330B8B94();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v33 = swift_slowAlloc();
    v8 = v33;
    *(_DWORD *)v7 = 136446210;
    v9 = sub_2330B8A44();
    *(_QWORD *)(v0 + 16) = sub_2330B37FC(v9, v10, &v33);
    sub_2330B8BE8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_233097000, v5, v6, "Synchronize reason: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23492F2E4](v8, -1, -1);
    v11 = v7;
    v3 = (uint64_t *)MEMORY[0x24BEE4EA0];
    MEMORY[0x23492F2E4](v11, -1, -1);
  }
  else
  {

  }
  v12 = sub_2330B8A44();
  v14 = v13;
  if (sub_2330B8A44() == v12 && v15 == v14)
    goto LABEL_11;
  v17 = sub_2330B8D68();
  swift_bridgeObjectRelease();
  if ((v17 & 1) != 0)
  {
LABEL_12:
    swift_bridgeObjectRelease();
LABEL_13:
    v19 = sub_2330B8990();
    v20 = sub_2330B8B94();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_233097000, v19, v20, "Will sync contacts", v21, 2u);
      MEMORY[0x23492F2E4](v21, -1, -1);
    }

    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v22;
    *v22 = v0;
    v22[1] = sub_2330ACB04;
    v23 = *(_QWORD **)(v0 + 32);
    v22[21] = v23;
    v24 = *v3;
    v22[22] = *v23;
    v22[23] = v24;
    return swift_task_switch();
  }
  if (sub_2330B8A44() == v12 && v18 == v14)
    goto LABEL_11;
  v26 = sub_2330B8D68();
  swift_bridgeObjectRelease();
  if ((v26 & 1) != 0)
    goto LABEL_12;
  if (sub_2330B8A44() == v12 && v27 == v14)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v28 = sub_2330B8D68();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v28 & 1) != 0)
    goto LABEL_13;
  v29 = sub_2330B8990();
  v30 = sub_2330B8B94();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_233097000, v29, v30, "Unknown synchronize reason", v31, 2u);
    MEMORY[0x23492F2E4](v31, -1, -1);
  }
  v32 = *(void **)(v0 + 40);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330ACB04()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2330ACB68()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  v1 = sub_2330B8990();
  v2 = sub_2330B8B94();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_233097000, v1, v2, "Did sync contacts", v3, 2u);
    MEMORY[0x23492F2E4](v3, -1, -1);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330ACC1C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330ACC50()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  v1[21] = v0;
  v2 = *MEMORY[0x24BEE4EA0];
  v1[22] = *v0;
  v1[23] = v2;
  return swift_task_switch();
}

uint64_t sub_2330ACC7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  char *v8;
  uint64_t v9;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;

  v1 = type metadata accessor for ProviderStore();
  swift_allocObject();
  v2 = sub_2330AFE98();
  *(_QWORD *)(v0 + 192) = v2;
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD **)(v0 + 168);
    v5 = *(_QWORD *)(v0 + 176) & *(_QWORD *)(v0 + 184);
    v6 = *(_QWORD *)((char *)v4 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x70));
    type metadata accessor for SyncManager();
    inited = swift_initStackObject();
    *(_QWORD *)(v0 + 200) = inited;
    *(_QWORD *)(inited + 40) = v1;
    *(_QWORD *)(inited + 48) = &off_250454750;
    *(_QWORD *)(inited + 16) = v3;
    *(_BYTE *)(inited + 56) = 0;
    *(_QWORD *)(inited + 64) = v6;
    swift_beginAccess();
    *(_BYTE *)(inited + 56) = 1;
    v8 = (char *)v4 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x68);
    v9 = *(_QWORD *)(v5 + 80);
    *(_QWORD *)(v0 + 112) = v9;
    *(_QWORD *)(v0 + 120) = *(_QWORD *)(*(_QWORD *)(v5 + 88) + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 88));
    (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(boxed_opaque_existential_1, v8, v9);
    v11 = qword_256034DF0;
    swift_retain();
    swift_retain();
    if (v11 != -1)
      swift_once();
    v12 = *(_QWORD *)algn_256035E88;
    *(_QWORD *)(v0 + 152) = qword_256035E80;
    *(_QWORD *)(v0 + 160) = v12;
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 208) = v13;
    *v13 = v0;
    v13[1] = sub_2330ACF38;
    return sub_2330A92F0((_QWORD *)(v0 + 152), v0 + 88);
  }
  else
  {
    v15 = sub_2330B8990();
    v16 = sub_2330B8B94();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_233097000, v15, v16, "Missing Contact Provider contact store", v17, 2u);
      MEMORY[0x23492F2E4](v17, -1, -1);
    }
    v19 = *(_QWORD *)(v0 + 176);
    v18 = *(_QWORD *)(v0 + 184);

    v21 = type metadata accessor for ExtensionHost.HostError(0, *(_QWORD *)((v19 & v18) + 0x50), *(_QWORD *)((v19 & v18) + 0x58), v20);
    MEMORY[0x23492F248](&unk_2330BA428, v21);
    swift_allocError();
    *v22 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2330ACF38()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 216) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 88);
  return swift_task_switch();
}

uint64_t sub_2330ACFA4()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;

  v1 = sub_2330B8990();
  v2 = sub_2330B8B94();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_233097000, v1, v2, "Synced contacts", v3, 2u);
    MEMORY[0x23492F2E4](v3, -1, -1);
  }
  v4 = *(_QWORD *)(v0 + 200);

  swift_release();
  swift_setDeallocating();
  __swift_destroy_boxed_opaque_existential_1(v4 + 16);
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AD08C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AD0D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[11] = a4;
  v5[12] = v4;
  v5[9] = a2;
  v5[10] = a3;
  v5[8] = a1;
  return swift_task_switch();
}

uint64_t sub_2330AD0F4()
{
  _QWORD *v0;
  _QWORD *v1;
  NSObject *v2;
  os_log_type_t v3;
  unint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v10;

  v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
  swift_bridgeObjectRetain_n();
  v2 = sub_2330B8990();
  v3 = sub_2330B8B94();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = v0[9];
    v5 = v0[8];
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v10 = v7;
    *(_DWORD *)v6 = 136446210;
    swift_bridgeObjectRetain();
    v0[7] = sub_2330B37FC(v5, v4, &v10);
    sub_2330B8BE8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_233097000, v2, v3, "ExtensionHost.handleInvalidate() for %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23492F2E4](v7, -1, -1);
    v8 = v6;
    v1 = (_QWORD *)MEMORY[0x24BEE4EA0];
    MEMORY[0x23492F2E4](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v0[13] = *(_QWORD *)(v0[12] + *(_QWORD *)((*v1 & *(_QWORD *)v0[12]) + 0x70));
  return swift_task_switch();
}

uint64_t sub_2330AD2AC()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 104) + 112) = 1;
  return swift_task_switch();
}

uint64_t sub_2330AD2CC()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = (void *)v0[12];
  swift_beginAccess();
  v2 = 1000000000000000000 * qword_256036068;
  v3 = ((qword_256036068 >> 63) & 0xF21F494C589C0000)
     + (((unint64_t)qword_256036068 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
  v4 = swift_allocObject();
  v0[14] = v4;
  *(_QWORD *)(v4 + 16) = v1;
  v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_256036278 + dword_256036278);
  v5 = v1;
  v6 = (_QWORD *)swift_task_alloc();
  v0[15] = v6;
  *v6 = v0;
  v6[1] = sub_2330AD3BC;
  return v8((uint64_t)v8, v2, v3, (uint64_t)&unk_256036270, v4);
}

uint64_t sub_2330AD3BC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_2330AD428()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = (void *)v0[12];
  v2 = 1000000000000000000 * qword_256036068;
  v3 = ((qword_256036068 >> 63) & 0xF21F494C589C0000)
     + (((unint64_t)qword_256036068 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
  v4 = swift_allocObject();
  v0[17] = v4;
  *(_QWORD *)(v4 + 16) = v1;
  v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_256036278 + dword_256036278);
  v5 = v1;
  v6 = (_QWORD *)swift_task_alloc();
  v0[18] = v6;
  *v6 = v0;
  v6[1] = sub_2330AD500;
  return v8((uint64_t)v8, v2, v3, (uint64_t)&unk_256036288, v4);
}

uint64_t sub_2330AD500()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_2330AD56C()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 80))(0);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AD5A0()
{
  uint64_t v0;
  void *v1;
  id v2;
  _BYTE *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  void (*v14)(void *);
  id v15;

  v1 = *(void **)(v0 + 128);
  swift_release();
  *(_QWORD *)(v0 + 40) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B0);
  if ((swift_dynamicCast() & 1) != 0)
  {

    sub_23309ADE8();
    v1 = (void *)swift_allocError();
    *v3 = 9;
  }

  v4 = v1;
  if (qword_256034E00 != -1)
    swift_once();
  v5 = sub_2330B89A8();
  __swift_project_value_buffer(v5, (uint64_t)qword_256037A50);
  v6 = v1;
  v7 = v1;
  v8 = sub_2330B8990();
  v9 = sub_2330B8B94();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138543362;
    v12 = v1;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 48) = v13;
    sub_2330B8BE8();
    *v11 = v13;

    _os_log_impl(&dword_233097000, v8, v9, "ExtensionHost.handleInvalidate() error %{public}@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B8);
    swift_arrayDestroy();
    MEMORY[0x23492F2E4](v11, -1, -1);
    MEMORY[0x23492F2E4](v10, -1, -1);
  }
  else
  {

  }
  v14 = *(void (**)(void *))(v0 + 80);

  v15 = v1;
  v14(v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AD7FC()
{
  uint64_t v0;
  void *v1;
  id v2;
  _BYTE *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  void (*v14)(void *);
  id v15;

  v1 = *(void **)(v0 + 152);
  swift_release();
  *(_QWORD *)(v0 + 40) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B0);
  if ((swift_dynamicCast() & 1) != 0)
  {

    sub_23309ADE8();
    v1 = (void *)swift_allocError();
    *v3 = 9;
  }

  v4 = v1;
  if (qword_256034E00 != -1)
    swift_once();
  v5 = sub_2330B89A8();
  __swift_project_value_buffer(v5, (uint64_t)qword_256037A50);
  v6 = v1;
  v7 = v1;
  v8 = sub_2330B8990();
  v9 = sub_2330B8B94();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138543362;
    v12 = v1;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 48) = v13;
    sub_2330B8BE8();
    *v11 = v13;

    _os_log_impl(&dword_233097000, v8, v9, "ExtensionHost.handleInvalidate() error %{public}@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B8);
    swift_arrayDestroy();
    MEMORY[0x23492F2E4](v11, -1, -1);
    MEMORY[0x23492F2E4](v10, -1, -1);
  }
  else
  {

  }
  v14 = *(void (**)(void *))(v0 + 80);

  v15 = v1;
  v14(v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330ADA58(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v4 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *a2) + 0x50);
  v3 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *a2) + 0x58);
  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v3 + 32) + *(_QWORD *)(v3 + 32));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_233098F04;
  return v7(v4, v3);
}

uint64_t sub_2330ADADC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a2;
  return swift_task_switch();
}

uint64_t sub_2330ADAF4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16)
                                   + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 16)) + 0x70));
  return swift_task_switch();
}

uint64_t sub_2330ADB28()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 32) = *(_BYTE *)(*(_QWORD *)(v0 + 24) + 113);
  return swift_task_switch();
}

uint64_t sub_2330ADB48()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 32) != 1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  sleep(1u);
  return swift_task_switch();
}

uint64_t sub_2330ADBAC()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 33) = *(_BYTE *)(*(_QWORD *)(v0 + 24) + 113);
  return swift_task_switch();
}

uint64_t sub_2330ADBCC()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 33) != 1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  sleep(1u);
  return swift_task_switch();
}

void sub_2330ADC30()
{
  sub_2330AFCA8();
}

id sub_2330ADC4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for ExtensionHost(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_2330ADC98(char *a1)
{
  _QWORD *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = *MEMORY[0x24BEE4EA0] & *(_QWORD *)a1;
  v4 = &a1[*(_QWORD *)(v3 + 0x60)];
  v5 = sub_2330B89A8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  (*(void (**)(char *))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 8))(&a1[*(_QWORD *)((*v2 & *(_QWORD *)a1)
                                                                                                 + 0x68)]);
  return swift_release();
}

uint64_t type metadata accessor for ExtensionHost(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ExtensionHost);
}

uint64_t sub_2330ADD38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6[5] = a5;
  v6[6] = a6;
  v6[3] = a3;
  v6[4] = a4;
  v6[2] = a2;
  v7 = sub_2330B8CB4();
  v6[7] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[8] = v8;
  v6[9] = *(_QWORD *)(v8 + 64);
  v6[10] = swift_task_alloc();
  v9 = sub_2330B8C9C();
  v6[11] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v6[12] = v10;
  v6[13] = *(_QWORD *)(v10 + 64);
  v6[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256036298);
  v6[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2330ADDF4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = v0[15];
  v2 = v0[12];
  v20 = v0[13];
  v3 = v0[11];
  v19 = v0[10];
  v15 = v0[8];
  v16 = v0[14];
  v17 = v0[6];
  v4 = v0[4];
  v14 = v0[5];
  v5 = v0[3];
  v18 = v0[7];
  v6 = sub_2330B8B1C();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
  v7(v1, 1, 1, v6);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v5;
  v8[5] = v4;
  swift_retain();
  sub_2330AEEB4(v1, (uint64_t)&unk_2560362A8, (uint64_t)v8);
  sub_2330AF680(v1, &qword_256036298);
  v7(v1, 1, 1, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v16, v14, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v19, v17, v18);
  v9 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v10 = (v20 + *(unsigned __int8 *)(v15 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = 0;
  *(_QWORD *)(v11 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v11 + v9, v16, v3);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v15 + 32))(v11 + v10, v19, v18);
  sub_2330AEEB4(v1, (uint64_t)&unk_2560362B8, v11);
  sub_2330AF680(v1, &qword_256036298);
  v12 = (_QWORD *)swift_task_alloc();
  v0[16] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560362C0);
  *v12 = v0;
  v12[1] = sub_2330AE014;
  return sub_2330B8B4C();
}

uint64_t sub_2330AE014()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2330AE078()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B0);
  sub_2330B8B58();
  if ((*(_BYTE *)(v0 + 144) & 1) != 0)
  {
    sub_2330B8B04();
    sub_2330AF5FC(&qword_2560362C8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6838], MEMORY[0x24BEE6848]);
    swift_allocError();
    sub_2330B8A14();
    swift_willThrow();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AE178()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AE1C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[7] = a4;
  v5[8] = a5;
  v5[6] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560362E0);
  v5[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2330AE228()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560362E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560362F0);
  v3 = swift_allocObject();
  *(_QWORD *)(v0 + 80) = v3;
  *(_DWORD *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_2330A0F9C(v1, v3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v3 + 16), &qword_2560362E0);
  sub_2330AF680(v1, &qword_2560362E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560362F8);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 88) = inited;
  *(_DWORD *)(inited + 24) = 0;
  *(_QWORD *)(inited + 16) = 0;
  sub_2330B8B34();
  v5 = swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v5;
  v6 = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v5 + 16) = v3;
  *(_QWORD *)(v5 + 24) = inited;
  *(_OWORD *)(v5 + 32) = v6;
  v7 = swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v7;
  *(_QWORD *)(v7 + 16) = inited;
  *(_QWORD *)(v7 + 24) = v3;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v8;
  *v8 = v0;
  v8[1] = sub_2330AE3F4;
  return sub_2330B8D74();
}

uint64_t sub_2330AE3F4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_2330AE468()
{
  uint64_t v0;

  swift_setDeallocating();
  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AE4C4()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AE524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_2330AE544()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  _QWORD *v3;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  v2 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 32) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v3;
  *v3 = v0;
  v3[1] = sub_2330AE5E8;
  return sub_2330B8D80();
}

uint64_t sub_2330AE5E8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2330AE65C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2330AE690(uint64_t a1, uint64_t a2, os_unfair_lock_s *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  os_unfair_lock_s *v11;
  uint64_t *v12;

  v10 = a2 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)a2 + 16);
  v11 = (os_unfair_lock_s *)(a2 + ((*(unsigned int *)(*(_QWORD *)a2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v11);
  sub_2330AE750(v10, a1);
  os_unfair_lock_unlock(v11);
  v12 = (uint64_t *)&a3[4];
  a3 += 6;
  os_unfair_lock_lock(a3);
  sub_2330AE7D4(v12, a4, a5, a2);
  os_unfair_lock_unlock(a3);
}

uint64_t sub_2330AE750(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_2330AF680(a1, &qword_2560362E0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560362E8);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
}

uint64_t sub_2330AE7D4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t result;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256036298);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_release();
  v11 = sub_2330B8B1C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a2;
  v12[5] = a3;
  v12[6] = a4;
  swift_retain();
  swift_retain();
  result = sub_2330ABC1C((uint64_t)v10, (uint64_t)&unk_256036318, (uint64_t)v12);
  *a1 = result;
  return result;
}

uint64_t sub_2330AE8C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return swift_task_switch();
}

uint64_t sub_2330AE8E4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  sub_2330B8B34();
  v3 = (uint64_t (*)(void))(**(int **)(v0 + 16) + *(_QWORD *)(v0 + 16));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_2330AEA04;
  return v3();
}

uint64_t sub_2330AEA04()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 48) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_2330AEA68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 32);
  swift_task_alloc();
  v3 = v2 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(_QWORD *)v2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v4);
  sub_2330AF86C(v3);
  os_unfair_lock_unlock(v4);
  if (!v1)
  {
    swift_task_dealloc();
    (*(void (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2330AEB20()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;

  v1 = *(void **)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v1;
  v4 = v2 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v2 + 16);
  v5 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(_QWORD *)v2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_2330AEBE8(v4, *(void **)(v3 + 16));
  os_unfair_lock_unlock(v5);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AEBE8(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _QWORD v10[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560362E8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    v10[1] = a2;
    v8 = a2;
    sub_2330B8AE0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_2330AF680(a1, &qword_2560362E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, 1, 1, v4);
}

void sub_2330AECE4(os_unfair_lock_s *a1, uint64_t a2)
{
  uint64_t *v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  BOOL v7;

  v3 = (uint64_t *)&a1[4];
  v4 = a1 + 6;
  os_unfair_lock_lock(a1 + 6);
  sub_2330B7C48(v3, &v7);
  os_unfair_lock_unlock(v4);
  v5 = a2 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)a2 + 16);
  v6 = (os_unfair_lock_s *)(a2 + ((*(unsigned int *)(*(_QWORD *)a2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v6);
  sub_2330AED80(v5);
  os_unfair_lock_unlock(v6);
}

uint64_t sub_2330AED80(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD v8[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560362E8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    sub_2330B8B04();
    sub_2330AF5FC(&qword_2560362C8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6838], MEMORY[0x24BEE6848]);
    v6 = swift_allocError();
    sub_2330B8A14();
    v8[1] = v6;
    sub_2330B8AE0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_2330AF680(a1, &qword_2560362E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(a1, 1, 1, v2);
}

uint64_t sub_2330AEEB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD v17[4];
  _QWORD v18[4];

  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256036298);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2330A0F9C(a1, (uint64_t)v8, &qword_256036298);
  v9 = sub_2330B8B1C();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_2330AF680((uint64_t)v8, &qword_256036298);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v11 = sub_2330B8AD4();
      v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_2330B8B10();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v11 = 0;
  v13 = 0;
LABEL_6:
  v14 = *v4;
  v15 = (_QWORD *)(v13 | v11);
  if (v13 | v11)
  {
    v18[0] = 0;
    v18[1] = 0;
    v15 = v18;
    v18[2] = v11;
    v18[3] = v13;
  }
  v17[1] = 1;
  v17[2] = v15;
  v17[3] = v14;
  swift_task_create();
  return swift_release();
}

uint64_t sub_2330AF044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 40) = a4;
  *(_QWORD *)(v5 + 48) = a5;
  return swift_task_switch();
}

uint64_t sub_2330AF05C()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2330B8B34();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0;
  *(_BYTE *)(v0 + 32) = 1;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  sub_2330B8CB4();
  sub_2330AF5FC(&qword_2560362D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E98], MEMORY[0x24BEE6EA8]);
  *v1 = v0;
  v1[1] = sub_2330AF124;
  return sub_2330B8B40();
}

uint64_t sub_2330AF124()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2330AF188()
{
  uint64_t v0;

  sub_2330AF63C();
  swift_allocError();
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AF1E0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330AF1EC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2330AF210(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  _QWORD *v5;

  v4 = *(_QWORD **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23309B0EC;
  return sub_2330ADA58(a1, v4);
}

uint64_t sub_2330AF268(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2330AF2CC;
  return v6(a1);
}

uint64_t sub_2330AF2CC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2330AF318()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23309B0EC;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_2330AF378(uint64_t a1, uint64_t a2)
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
  v10[1] = sub_23309B0EC;
  return sub_2330ADD38(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_2330AF3F8()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2330AF424(uint64_t a1)
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
  v8[1] = sub_23309B0EC;
  return sub_2330AE1C8(a1, v4, v5, v7, v6);
}

uint64_t sub_2330AF49C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_2330B8C9C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_2330B8CB4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_2330AF558()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v2 = *(_QWORD *)(sub_2330B8C9C() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_2330B8CB4() - 8) + 80);
  v6 = v3 + v4 + v5;
  v7 = v0 + v3;
  v8 = v0 + (v6 & ~v5);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v9;
  *v9 = v1;
  v9[1] = sub_233098F04;
  v9[5] = v7;
  v9[6] = v8;
  return swift_task_switch();
}

uint64_t sub_2330AF5FC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23492F248](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2330AF63C()
{
  unint64_t result;

  result = qword_2560362D8;
  if (!qword_2560362D8)
  {
    result = MEMORY[0x23492F248](&protocol conformance descriptor for AsyncTimeoutError, &type metadata for AsyncTimeoutError);
    atomic_store(result, (unint64_t *)&qword_2560362D8);
  }
  return result;
}

uint64_t sub_2330AF680(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2330AF6BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  v6 = *(_OWORD *)(v1 + 32);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_23309B0EC;
  *(_OWORD *)(v4 + 40) = v6;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

void sub_2330AF728()
{
  uint64_t v0;

  sub_2330AECE4(*(os_unfair_lock_s **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_2330AF730(uint64_t a1)
{
  uint64_t v1;

  sub_2330AE690(a1, *(_QWORD *)(v1 + 16), *(os_unfair_lock_s **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_2330AF73C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2330AF770()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_233098F04;
  *(_QWORD *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  return swift_task_switch();
}

uint64_t sub_2330AF7D8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2330AF7FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23309B0EC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256036320 + dword_256036320))(a1, v4);
}

uint64_t sub_2330AF86C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560362E8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    sub_2330B8AEC();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_2330AF680(a1, &qword_2560362E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(a1, 1, 1, v2);
}

uint64_t type metadata accessor for ExtensionHost.HostError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ExtensionHost.HostError);
}

uint64_t sub_2330AF958()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2330AF98C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2330AF9C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  __int128 v8;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = (_QWORD *)swift_task_alloc();
  v8 = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_23309B0EC;
  v6 = swift_task_alloc();
  v5[2] = v6;
  *(_QWORD *)v6 = v5;
  *(_QWORD *)(v6 + 8) = sub_23309B0EC;
  *(_QWORD *)(v6 + 88) = v4;
  *(_QWORD *)(v6 + 96) = v2;
  *(_OWORD *)(v6 + 72) = v8;
  *(_QWORD *)(v6 + 64) = v3;
  return swift_task_switch();
}

uint64_t sub_2330AFA70()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2330AFAAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  __int128 v7;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = (_QWORD *)swift_task_alloc();
  v7 = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23309B0EC;
  v5 = swift_task_alloc();
  v4[2] = v5;
  *(_QWORD *)v5 = v4;
  *(_QWORD *)(v5 + 8) = sub_23309B0EC;
  *(_QWORD *)(v5 + 40) = v3;
  *(_QWORD *)(v5 + 48) = v2;
  *(_OWORD *)(v5 + 24) = v7;
  return swift_task_switch();
}

id sub_2330AFB50(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  objc_super v11;

  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v4 = *MEMORY[0x24BEE4EA0] & *v1;
  v5 = v1;
  sub_2330B899C();
  v6 = *(_QWORD *)(v4 + 80);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(&v5[*(_QWORD *)((*v3 & *(_QWORD *)v5) + 0x68)], a1, v6);
  type metadata accessor for ExtensionState();
  v7 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_WORD *)(v7 + 112) = 0;
  *(_QWORD *)&v5[*(_QWORD *)((*v3 & *(_QWORD *)v5) + 0x70)] = v7;

  v9 = (objc_class *)type metadata accessor for ExtensionHost(0, v6, *(_QWORD *)(v4 + 88), v8);
  v11.receiver = v5;
  v11.super_class = v9;
  return objc_msgSendSuper2(&v11, sel_init);
}

id sub_2330AFC70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v6;

  v6 = objc_allocWithZone((Class)type metadata accessor for ExtensionHost(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4));
  return sub_2330AFB50(a1);
}

void sub_2330AFCA8()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2330AFCD4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_2330AFCF8(uint64_t a1)
{
  uint64_t v1;

  sub_2330ABDF4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2330AFD00()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2330AFD08(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2330AFD54 + 4 * byte_2330BA355[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2330AFD88 + 4 * byte_2330BA350[v4]))();
}

uint64_t sub_2330AFD88(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2330AFD90(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2330AFD98);
  return result;
}

uint64_t sub_2330AFDA4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2330AFDACLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2330AFDB0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2330AFDB8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_2330AFDC4()
{
  JUMPOUT(0x23492F248);
}

uint64_t dispatch thunk of ProviderStoreProtocol.domainIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.domainIdentifier.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.domainIdentifier.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.add(_:itemIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.update(contactItems:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.update(groupItems:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.remove(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.isContentEnumerated.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.page.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.syncAnchor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.finishEnumeratingPage(upTo:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.finishEnumeratingContent(upTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 104))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.finishEnumeratingContentWithError(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.finishEnumeratingChanges(upTo:moreComing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.finishEnumeratingChangesWithError(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 128))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.logState()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t sub_2330AFE98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  unint64_t v24;
  id v25;
  id v26;
  void *v27;
  uint64_t *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  _UNKNOWN **v41;
  uint64_t v42;

  v1 = v0;
  v42 = *MEMORY[0x24BDAC8D0];
  v2 = v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_logger;
  sub_2330B899C();
  v3 = OBJC_IVAR____TtC15ContactProvider13ProviderStore_contactProviderSupport;
  v4 = objc_allocWithZone(MEMORY[0x24BDBACD8]);
  v5 = (void *)sub_2330B8A38();
  v6 = objc_msgSend(v4, sel_initWithDomainIdentifier_, v5);

  *(_QWORD *)(v1 + v3) = v6;
  v7 = sub_2330B8990();
  v8 = sub_2330B8B94();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_233097000, v7, v8, "ProviderStore.init", v9, 2u);
    MEMORY[0x23492F2E4](v9, -1, -1);
  }

  v10 = *(void **)(v1 + v3);
  v11 = objc_msgSend(v10, sel_contactStore);
  if (!v11)
    goto LABEL_16;
  v12 = v11;
  v13 = objc_msgSend(v10, sel_domainContainerIdentifier);
  if (!v13)
  {

LABEL_16:
    v36 = sub_2330B89A8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 8))(v2, v36);

    type metadata accessor for ProviderStore();
    swift_deallocPartialClassInstance();
    return 0;
  }
  v14 = v13;
  v15 = sub_2330B8A44();
  v17 = v16;

  v18 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256036650);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_2330B9700;
  *(_QWORD *)(v19 + 32) = v15;
  *(_QWORD *)(v19 + 40) = v17;
  swift_bridgeObjectRetain();
  v20 = (void *)sub_2330B8A98();
  swift_bridgeObjectRelease();
  v21 = objc_msgSend(v18, sel_predicateForContainersWithIdentifiers_, v20);

  *(_QWORD *)&v39 = 0;
  v22 = objc_msgSend(v12, sel_containersMatchingPredicate_error_, v21, &v39);

  v23 = (void *)v39;
  if (!v22)
  {
    v33 = (id)v39;
    swift_bridgeObjectRelease();
    v34 = (void *)sub_2330B8948();

    swift_willThrow();
    goto LABEL_16;
  }
  sub_2330A5C10(0, &qword_256036670);
  v24 = sub_2330B8AA4();
  v25 = v23;

  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    v35 = sub_2330B8CD8();
    swift_bridgeObjectRelease();
    if (v35)
      goto LABEL_8;
    goto LABEL_15;
  }
  if (!*(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_15:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
LABEL_8:
  if ((v24 & 0xC000000000000001) != 0)
  {
    v26 = (id)MEMORY[0x23492EC24](0, v24);
  }
  else
  {
    if (!*(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10))
      __break(1u);
    v26 = *(id *)(v24 + 32);
  }
  v27 = v26;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_store) = v12;
  v28 = (uint64_t *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_containerIdentifier);
  *v28 = v15;
  v28[1] = v17;
  v29 = v12;
  objc_msgSend(v27, sel_mutableCopy);
  sub_2330B8C00();
  swift_unknownObjectRelease();
  sub_2330A5C10(0, &qword_256036678);
  swift_dynamicCast();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container) = v38;
  v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBADA8]), sel_init);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest) = v30;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 0;
  v31 = type metadata accessor for StampedeManager();
  swift_allocObject();
  v32 = StampedeManager.init(notifyBatchSize:waitDivisor:)(1000, 350);
  v40 = v31;
  v41 = &protocol witness table for StampedeManager;

  *(_QWORD *)&v39 = v32;
  sub_23309B0D4(&v39, v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager);
  return v1;
}

uint64_t sub_2330B037C(void *a1, uint64_t a2)
{
  return sub_2330B11F4(a1, a2, (SEL *)&selRef_addContact_toContainerWithIdentifier_);
}

uint64_t sub_2330B0388(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  _BYTE *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;
  void *v41;
  char v42;
  id v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t result;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  id v60;
  _QWORD *v61;

  v2 = v1;
  swift_retain();
  isUniquelyReferenced_nonNull_native = (uint64_t)sub_2330B4FA8(a1);
  swift_release();
  v5 = *(_QWORD *)(a1 + 16);
  v58 = v1;
  if (!v5)
  {
    v10 = MEMORY[0x24BEE4B00];
LABEL_21:
    if (qword_256034E08 != -1)
      goto LABEL_33;
    goto LABEL_22;
  }
  v55 = isUniquelyReferenced_nonNull_native;
  swift_bridgeObjectRetain();
  v59 = (_QWORD *)MEMORY[0x24BEE4B00];
  v6 = (_BYTE *)(a1 + 56);
  while (1)
  {
    v9 = (void *)*((_QWORD *)v6 - 3);
    v8 = *((_QWORD *)v6 - 2);
    v10 = *((_QWORD *)v6 - 1);
    if ((*v6 & 1) != 0)
    {
      v11 = v9;
      swift_bridgeObjectRetain();
      v12 = sub_2330B8990();
      v13 = sub_2330B8B88();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_233097000, v12, v13, "update contact items - failed to map a contact by its identifier", v14, 2u);
        MEMORY[0x23492F2E4](v14, -1, -1);
      }

      v7 = v9;
      goto LABEL_4;
    }
    sub_23309D674(*((void **)v6 - 3));
    sub_23309D674(v9);
    v15 = v9;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v61 = v59;
    v17 = sub_2330B3E3C(v8, v10);
    v18 = v59[2];
    v19 = (v16 & 1) == 0;
    v20 = v18 + v19;
    if (__OFADD__(v18, v19))
      break;
    v2 = v16;
    if (v59[3] >= v20)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_2330B4D08();
    }
    else
    {
      sub_2330B49FC(v20, isUniquelyReferenced_nonNull_native);
      v21 = sub_2330B3E3C(v8, v10);
      if ((v2 & 1) != (v22 & 1))
        goto LABEL_50;
      v17 = v21;
    }
    v23 = v61;
    v59 = v61;
    if ((v2 & 1) != 0)
    {
      v24 = v61[7];

      *(_QWORD *)(v24 + 8 * v17) = v15;
    }
    else
    {
      v61[(v17 >> 6) + 8] |= 1 << v17;
      v25 = (uint64_t *)(v23[6] + 16 * v17);
      *v25 = v8;
      v25[1] = v10;
      *(_QWORD *)(v23[7] + 8 * v17) = v15;
      v26 = v23[2];
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (v27)
        goto LABEL_32;
      v23[2] = v28;
      swift_bridgeObjectRetain();
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v7 = v9;
LABEL_4:
    sub_23309D698(v7);
    v6 += 32;
    if (!--v5)
    {
      swift_bridgeObjectRelease();
      v2 = v58;
      v10 = (uint64_t)v59;
      isUniquelyReferenced_nonNull_native = v55;
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  swift_once();
LABEL_22:
  v29 = sub_2330B2514(isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  v61 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    v30 = sub_2330B8CD8();
    if (!v30)
      goto LABEL_35;
LABEL_24:
    if (v30 >= 1)
    {
      v31 = 0;
      do
      {
        if ((v29 & 0xC000000000000001) != 0)
          v32 = (id)MEMORY[0x23492EC24](v31, v29);
        else
          v32 = *(id *)(v29 + 8 * v31 + 32);
        v33 = v32;
        ++v31;
        v60 = v32;
        sub_2330B09E0(&v60, v10, v2, &v61);

      }
      while (v30 != v31);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_36;
    }
    __break(1u);
LABEL_50:
    result = sub_2330B8D98();
    __break(1u);
  }
  else
  {
    v30 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v30)
      goto LABEL_24;
LABEL_35:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_36:
    swift_bridgeObjectRelease();
    v34 = swift_bridgeObjectRetain();
    v35 = sub_2330B5164(v34);
    swift_retain();
    v36 = swift_bridgeObjectRetain();
    v37 = sub_2330B51F8(v36, v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    v38 = *(_QWORD *)(v37 + 16);
    if (v38)
    {
      v57 = OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest;
      v56 = (_QWORD *)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager);
      swift_bridgeObjectRetain();
      v39 = (_BYTE *)(v37 + 56);
      v40 = 1;
      while (1)
      {
        v41 = (void *)*((_QWORD *)v39 - 3);
        v42 = *v39;
        v43 = v41;
        swift_bridgeObjectRetain();
        if ((v42 & 1) != 0)
        {
          v44 = sub_2330B8990();
          v45 = sub_2330B8B88();
          if (os_log_type_enabled(v44, v45))
          {
            v46 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v46 = 0;
            _os_log_impl(&dword_233097000, v44, v45, "update contact items - failed to add an item", v46, 2u);
            MEMORY[0x23492F2E4](v46, -1, -1);
          }

          v47 = v41;
        }
        else
        {
          v48 = v43;
          swift_bridgeObjectRetain();
          v49 = (void *)sub_2330B8A38();
          objc_msgSend(v48, sel_setExternalUUID_, v49);

          v50 = *(id *)(v58 + v57);
          v51 = (void *)sub_2330B8A38();
          objc_msgSend(v50, sel_addContact_toContainerWithIdentifier_, v48, v51);

          v52 = v56[3];
          v53 = v56[4];
          __swift_project_boxed_opaque_existential_1(v56, v52);
          (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v53);
          swift_bridgeObjectRelease();

          v47 = v41;
        }
        sub_23309D698(v47);
        if (v38 == v40)
          break;
        v39 += 32;
        v27 = __OFADD__(v40++, 1);
        if (v27)
        {
          __break(1u);
          break;
        }
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_2330B09E0(id *a1, uint64_t a2, uint64_t a3, _QWORD **a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37[4];
  id v38;

  v7 = *a1;
  v8 = objc_msgSend(*a1, sel_externalUUID);
  if (!v8)
    goto LABEL_12;
  v9 = v8;
  v10 = sub_2330B8A44();
  v12 = v11;

  if (!*(_QWORD *)(a2 + 16))
  {
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    v27 = v7;
    v28 = sub_2330B8990();
    v29 = sub_2330B8B88();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v37[0] = v31;
      *(_DWORD *)v30 = 136446210;
      v32 = objc_msgSend(v27, sel_externalUUID, v37[0]);
      if (v32)
      {
        v33 = v32;
        v34 = sub_2330B8A44();
        v36 = v35;

      }
      else
      {
        v36 = 0xE500000000000000;
        v34 = 0x3E6C696E3CLL;
      }
      v38 = (id)sub_2330B37FC(v34, v36, v37);
      sub_2330B8BE8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_233097000, v28, v29, "update contact items - failed find update contact for identifier %{public}s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23492F2E4](v31, -1, -1);
      MEMORY[0x23492F2E4](v30, -1, -1);
    }
    else
    {

    }
    return;
  }
  swift_bridgeObjectRetain();
  v13 = sub_2330B3E3C(v10, v12);
  if ((v14 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v15 = *(id *)(*(_QWORD *)(a2 + 56) + 8 * v13);
  swift_bridgeObjectRelease();
  v16 = sub_2330B0D6C(v15, v7);
  if (v16)
  {
    v17 = v16;
    v18 = *(id *)(a3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest);
    objc_msgSend(v17, sel_mutableCopy);
    sub_2330B8C00();
    swift_unknownObjectRelease();
    sub_2330A5C10(0, &qword_256035CB8);
    swift_dynamicCast();
    objc_msgSend(v18, sel_updateContact_, v38);

    v19 = (_QWORD *)(a3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager);
    v20 = *(_QWORD *)(a3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
    v21 = v19[4];
    __swift_project_boxed_opaque_existential_1(v19, v20);
    (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v20, v21);
    v22 = *a4;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a4 = v22;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v22 = sub_2330B3680(0, v22[2] + 1, 1, v22);
      *a4 = v22;
    }
    v25 = v22[2];
    v24 = v22[3];
    if (v25 >= v24 >> 1)
    {
      v22 = sub_2330B3680((_QWORD *)(v24 > 1), v25 + 1, 1, v22);
      *a4 = v22;
    }
    v22[2] = v25 + 1;
    v26 = &v22[2 * v25];
    v26[4] = v10;
    v26[5] = v12;

  }
  else
  {
    swift_bridgeObjectRelease();

  }
}

id sub_2330B0D6C(void *a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  _QWORD *v30;
  id v31;
  void *v32;
  id result;
  id v34;
  _QWORD *v35;
  id v36[2];

  v36[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBACB0]), sel_init);
  objc_msgSend(v4, sel_setIgnoreUnavailableKeys_, 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256035C68);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2330BA470;
  v6 = (void *)*MEMORY[0x24BDBA2D8];
  v7 = (void *)*MEMORY[0x24BDBA2B8];
  *(_QWORD *)(v5 + 32) = *MEMORY[0x24BDBA2D8];
  *(_QWORD *)(v5 + 40) = v7;
  sub_2330B8AB0();
  v8 = v6;
  v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256036620);
  v10 = (void *)sub_2330B8A98();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setIgnoredKeys_, v10);

  v11 = (void *)objc_opt_self();
  v36[0] = 0;
  v12 = v4;
  v13 = a1;
  v14 = a2;
  v15 = objc_msgSend(v11, sel_diffContact_to_options_error_, v14, v13, v12, v36);
  if (!v15)
  {
    v23 = v36[0];
    v24 = (void *)sub_2330B8948();

    swift_willThrow();
    v25 = v24;
    v26 = v24;
    v27 = sub_2330B8990();
    v28 = sub_2330B8B88();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v29 = 138543362;
      v31 = v24;
      v32 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v36[0] = v32;
      sub_2330B8BE8();
      *v30 = v32;

      _os_log_impl(&dword_233097000, v27, v28, "update contact items - failed contact diff: %{public}@", v29, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B8);
      swift_arrayDestroy();
      MEMORY[0x23492F2E4](v30, -1, -1);
      MEMORY[0x23492F2E4](v29, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  v16 = v15;
  v17 = v36[0];

  v18 = v16;
  v19 = sub_2330B8990();
  v20 = sub_2330B8B94();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v35 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v21 = 138412290;
    v36[0] = v18;
    v22 = v18;
    sub_2330B8BE8();
    *v35 = v16;

    _os_log_impl(&dword_233097000, v19, v20, "update contact items - contact diff: %@", v21, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B8);
    swift_arrayDestroy();
    MEMORY[0x23492F2E4](v35, -1, -1);
    MEMORY[0x23492F2E4](v21, -1, -1);
  }
  else
  {

  }
  result = objc_msgSend(v18, sel_contactByApplyingUpdatesToContact_, v14);
  if (result)
  {
    v34 = result;

    return v34;
  }
  __break(1u);
  return result;
}

uint64_t sub_2330B11E8(void *a1, uint64_t a2)
{
  return sub_2330B11F4(a1, a2, (SEL *)&selRef_addGroup_toContainerWithIdentifier_);
}

uint64_t sub_2330B11F4(void *a1, uint64_t a2, SEL *a3)
{
  uint64_t v3;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v6 = (void *)sub_2330B8A38();
  objc_msgSend(a1, sel_setExternalUUID_, v6);

  v7 = *(id *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest);
  v8 = (void *)sub_2330B8A38();
  objc_msgSend(v7, *a3, a1, v8);

  v9 = *(_QWORD *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
  v10 = *(_QWORD *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager), v9);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
}

uint64_t sub_2330B12C4(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;

  v2 = sub_2330B2514(a1);
  v3 = v2;
  v4 = v2 >> 62;
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_2330B8CD8();
    v5 = result;
    if (result)
      goto LABEL_3;
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v5 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v5)
    goto LABEL_11;
LABEL_3:
  if (v5 < 1)
  {
    __break(1u);
    return result;
  }
  v15 = v4;
  v7 = 0;
  v8 = OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest;
  do
  {
    if ((v3 & 0xC000000000000001) != 0)
      v9 = (id)MEMORY[0x23492EC24](v7, v3);
    else
      v9 = *(id *)(v3 + 8 * v7 + 32);
    v10 = v9;
    ++v7;
    v11 = *(id *)(v1 + v8);
    objc_msgSend(v10, sel_mutableCopy);
    sub_2330B8C00();
    swift_unknownObjectRelease();
    sub_2330A5C10(0, &qword_256035CB8);
    swift_dynamicCast();
    objc_msgSend(v11, sel_deleteContact_, v16);

  }
  while (v5 != v7);
  swift_bridgeObjectRelease();
  v4 = v15;
LABEL_12:
  v12 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
  v13 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager), v12);
  if (v4)
  {
    swift_bridgeObjectRetain();
    v14 = sub_2330B8CD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 24))(v14, v12, v13);
}

id sub_2330B14C0()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  v2 = objc_msgSend(v1, sel_providerMetadata);
  if (!v2)
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBADA0]), sel_init);
  v3 = objc_msgSend(v1, sel_providerMetadata);

  if (!v3)
    objc_msgSend(v1, sel_setProviderMetadata_, v2);
  v4 = objc_msgSend(v2, sel_isContentEnumerated);

  return v4;
}

void sub_2330B1578(uint64_t *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  v4 = objc_msgSend(v3, sel_providerMetadata);
  if (!v4)
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBADA0]), sel_init);
  v5 = objc_msgSend(v3, sel_providerMetadata);

  if (!v5)
    objc_msgSend(v3, sel_setProviderMetadata_, v4);
  v6 = objc_msgSend(v4, sel_itemAnchor);
  if (v6)
  {
    v7 = sub_2330B8960();
    v9 = v8;

    v6 = objc_msgSend(v4, sel_itemOffset);
  }
  else
  {
    v7 = 0;
    v9 = 0xC000000000000000;
  }

  *a1 = v7;
  a1[1] = v9;
  a1[2] = (uint64_t)v6;
}

void sub_2330B1680(uint64_t *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  const char *v15;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  v4 = objc_msgSend(v3, sel_providerMetadata);
  if (!v4)
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBADA0]), sel_init);
  v5 = objc_msgSend(v3, sel_providerMetadata);

  if (!v5)
    objc_msgSend(v3, sel_setProviderMetadata_, v4);
  if (!objc_msgSend(v4, sel_isContentEnumerated))
  {
    v12 = sub_2330B8990();
    v13 = sub_2330B8B88();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      v15 = "syncAnchor not available as all content is not enumerated";
LABEL_12:
      _os_log_impl(&dword_233097000, v12, v13, v15, v14, 2u);
      MEMORY[0x23492F2E4](v14, -1, -1);
    }
LABEL_13:

    v8 = 0;
    v11 = 0;
    v10 = 0xF000000000000000;
    goto LABEL_14;
  }
  v6 = objc_msgSend(v4, sel_itemAnchor);
  if (!v6)
  {
    v12 = sub_2330B8990();
    v13 = sub_2330B8B88();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      v15 = "syncAnchor is missing after all content was enumerated";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v7 = v6;
  v8 = sub_2330B8960();
  v10 = v9;

  v11 = objc_msgSend(v4, sel_itemOffset);
LABEL_14:

  *a1 = v8;
  a1[1] = v10;
  a1[2] = (uint64_t)v11;
}

void sub_2330B1868(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v1;
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(void **)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  v5 = objc_msgSend(v4, sel_providerMetadata);
  if (!v5)
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBADA0]), sel_init);
  v6 = objc_msgSend(v4, sel_providerMetadata);

  if (!v6)
    objc_msgSend(v4, sel_setProviderMetadata_, v5);
  v7 = (void *)sub_2330B8954();
  objc_msgSend(v5, sel_setItemAnchor_, v7);

  objc_msgSend(v5, sel_setItemOffset_, v3);
  objc_msgSend(v4, sel_setProviderMetadata_, v5);
  *(_BYTE *)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 1;
  v8 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
  v9 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager), v8);
  (*(void (**)(uint64_t, uint64_t))(v9 + 32))(v8, v9);
  sub_2330B28F8();

}

void sub_2330B19CC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = v0;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  v3 = objc_msgSend(v2, sel_providerMetadata);
  if (!v3)
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBADA0]), sel_init);
  v4 = objc_msgSend(v2, sel_providerMetadata);

  if (!v4)
    objc_msgSend(v2, sel_setProviderMetadata_, v3);
  v5 = (void *)sub_2330B8954();
  objc_msgSend(v3, sel_setItemAnchor_, v5);

  objc_msgSend(v3, sel_setItemOffset_, 0);
  objc_msgSend(v3, sel_setIsContentEnumerated_, 1);
  objc_msgSend(v2, sel_setProviderMetadata_, v3);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 1;
  v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
  v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager), v6);
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v6, v7);
  sub_2330B28F8();

}

void sub_2330B1B3C(uint64_t a1)
{
  sub_2330B1CF0(a1, 3, "page expired, reset provider metadata");
}

void sub_2330B1B54(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = v2;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(void **)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  v7 = objc_msgSend(v6, sel_providerMetadata);
  if (!v7)
    v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBADA0]), sel_init);
  v8 = objc_msgSend(v6, sel_providerMetadata);

  if (!v8)
    objc_msgSend(v6, sel_setProviderMetadata_, v7);
  v9 = (void *)sub_2330B8954();
  objc_msgSend(v7, sel_setItemAnchor_, v9);

  objc_msgSend(v7, sel_setItemOffset_, v5);
  v10 = a2 & 1;
  objc_msgSend(v7, sel_setIsMoreComing_, v10);
  objc_msgSend(v6, sel_setProviderMetadata_, v7);
  *(_BYTE *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 1;
  v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
  v12 = *(_QWORD *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager), v11);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, v11, v12);
  sub_2330B28F8();

}

void sub_2330B1CD8(uint64_t a1)
{
  sub_2330B1CF0(a1, 4, "change anchor expired, reset provider metadata");
}

void sub_2330B1CF0(uint64_t a1, char a2, const char *a3)
{
  uint64_t v3;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  _BYTE *v11;
  char v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = v3;
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBADA8]), sel_init);
  v9 = *(void **)(v6 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest);
  *(_QWORD *)(v6 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest) = v8;

  sub_23309ADE8();
  v10 = (void *)swift_allocError();
  *v11 = a2;
  v12 = == infix(_:_:)();

  if ((v12 & 1) != 0)
  {
    v13 = sub_2330B8990();
    v14 = sub_2330B8B94();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_233097000, v13, v14, a3, v15, 2u);
      MEMORY[0x23492F2E4](v15, -1, -1);
    }

    sub_2330B224C();
  }
  else
  {
    v16 = (_QWORD *)(v6 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager);
    v17 = *(_QWORD *)(v6 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
    v18 = *(_QWORD *)(v6 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 32);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v6 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager), v17);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 56))(a1, v17, v18);
    v19 = v16[3];
    v20 = v16[4];
    __swift_project_boxed_opaque_existential_1(v16, v19);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v20 + 72))(v19, v20) & 1) != 0)
      sub_2330B28F8();
  }
}

void sub_2330B200C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  os_log_type_t v5;
  uint64_t v6;
  NSObject *oslog;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  v2 = objc_msgSend(v1, sel_providerMetadata);
  if (!v2)
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBADA0]), sel_init);
  v3 = objc_msgSend(v1, sel_providerMetadata);

  if (!v3)
    objc_msgSend(v1, sel_setProviderMetadata_, v2);
  v4 = v2;
  oslog = sub_2330B8990();
  v5 = sub_2330B8B94();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = swift_slowAlloc();
    *(_DWORD *)v6 = 67240960;
    objc_msgSend(v4, sel_isResetRequested);
    sub_2330B8BE8();
    *(_WORD *)(v6 + 8) = 1026;
    objc_msgSend(v4, sel_isContentEnumerated);
    sub_2330B8BE8();
    *(_WORD *)(v6 + 14) = 1026;
    objc_msgSend(v4, sel_isMoreComing);
    sub_2330B8BE8();

    *(_WORD *)(v6 + 20) = 2050;
    objc_msgSend(v4, sel_itemOffset);

    sub_2330B8BE8();
    _os_log_impl(&dword_233097000, oslog, v5, "isResetRequested = %{BOOL,public}d, isContentEnumerated = %{BOOL,public}d, isMoreComing = %{BOOL,public}d, itemOffset = %{public}ld", (uint8_t *)v6, 0x1Eu);
    MEMORY[0x23492F2E4](v6, -1, -1);

  }
  else
  {

  }
}

void sub_2330B224C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  v2 = objc_msgSend(v1, sel_providerMetadata);
  if (!v2)
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBADA0]), sel_init);
  v5 = v2;
  v3 = objc_msgSend(v1, sel_providerMetadata);

  if (!v3)
    objc_msgSend(v1, sel_setProviderMetadata_, v5);
  v4 = (void *)sub_2330B8954();
  objc_msgSend(v5, sel_setItemAnchor_, v4);

  objc_msgSend(v5, sel_setItemOffset_, 0);
  objc_msgSend(v5, sel_setIsContentEnumerated_, 0);
  objc_msgSend(v5, sel_setIsMoreComing_, 0);
  objc_msgSend(v1, sel_setProviderMetadata_, v5);
  *(_BYTE *)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 1;
  sub_2330B28F8();

}

uint64_t sub_2330B2514(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35[2];

  v2 = v1;
  v35[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = objc_allocWithZone(MEMORY[0x24BDBACB8]);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256036620);
  v5 = (void *)sub_2330B8A98();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithKeysToFetch_, v5);

  v7 = *(_QWORD *)(a1 + 16);
  if (v7)
  {
    v35[0] = (id)MEMORY[0x24BEE4AF8];
    sub_2330A0788(0, v7, 0);
    v8 = v35[0];
    v9 = (uint64_t *)(a1 + 40);
    do
    {
      v11 = *(v9 - 1);
      v10 = *v9;
      v35[0] = v8;
      v12 = v8[2];
      v13 = v8[3];
      swift_bridgeObjectRetain();
      if (v12 >= v13 >> 1)
      {
        sub_2330A0788(v13 > 1, v12 + 1, 1);
        v8 = v35[0];
      }
      v9 += 2;
      v8[2] = v12 + 1;
      v14 = &v8[2 * v12];
      v14[4] = v11;
      v14[5] = v10;
      --v7;
    }
    while (v7);
  }
  v15 = (void *)objc_opt_self();
  v16 = (void *)sub_2330B8A98();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v15, sel_predicateForContactsMatchingExternalUUIDs_, v16);

  objc_msgSend(v6, sel_setPredicate_, v17);
  objc_msgSend(v6, sel_setUnifyResults_, 0);
  v18 = *(void **)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_store);
  v35[0] = 0;
  v19 = objc_msgSend(v18, sel_executeFetchRequest_error_, v6, v35);
  if (v19)
  {
    v20 = v19;
    v21 = v35[0];
    v22 = objc_msgSend(v20, sel_value);

    v35[0] = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256036628);
    swift_dynamicCast();
    return v34;
  }
  else
  {
    v24 = v35[0];
    v25 = (void *)sub_2330B8948();

    swift_willThrow();
    v26 = v25;
    v27 = v25;
    v28 = sub_2330B8990();
    v29 = sub_2330B8B88();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v30 = 138543362;
      v32 = v25;
      v33 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v35[0] = v33;
      sub_2330B8BE8();
      *v31 = v33;

      _os_log_impl(&dword_233097000, v28, v29, "fetchContacts() - failed to fetch: %{public}@", v30, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B8);
      swift_arrayDestroy();
      MEMORY[0x23492F2E4](v31, -1, -1);
      MEMORY[0x23492F2E4](v30, -1, -1);

    }
    else
    {

    }
    return MEMORY[0x24BEE4AF8];
  }
}

void sub_2330B28F8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD *v34;
  id v35[2];

  v1 = v0;
  v35[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
  v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager), v3);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 64))(v3, v4);
  if ((v5 & 1) != 0)
  {
    v6 = sub_2330B8990();
    v7 = sub_2330B8B94();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_233097000, v6, v7, "save() - will notify", v8, 2u);
      MEMORY[0x23492F2E4](v8, -1, -1);
    }

  }
  v9 = OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest;
  v10 = *(void **)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  v11 = *(id *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest);
  v12 = objc_msgSend(v10, sel_providerIdentifier);
  objc_msgSend(v11, sel_setTransactionAuthor_, v12);

  objc_msgSend(*(id *)(v1 + v9), sel_setIgnoresContactProviderRestrictions_, 1);
  objc_msgSend(*(id *)(v1 + v9), sel_setSuppressChangeNotifications_, (v5 & 1) == 0);
  v13 = OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) == 1)
  {
    objc_msgSend(*(id *)(v1 + v9), sel_updateContainer_, v10);
    *(_BYTE *)(v1 + v13) = 0;
  }
  v14 = *(void **)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_store);
  v15 = *(_QWORD *)(v1 + v9);
  v35[0] = 0;
  if (objc_msgSend(v14, sel_executeSaveRequest_error_, v15, v35))
  {
    v16 = v35[0];
    v17 = sub_2330B8990();
    v18 = sub_2330B8B94();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_233097000, v17, v18, "save() - did save", v19, 2u);
      MEMORY[0x23492F2E4](v19, -1, -1);
    }

    v20 = v2[3];
    v21 = v2[4];
    __swift_project_boxed_opaque_existential_1(v2, v20);
    (*(void (**)(uint64_t, uint64_t))(v21 + 80))(v20, v21);
  }
  else
  {
    v22 = v35[0];
    v23 = (void *)sub_2330B8948();

    swift_willThrow();
    v24 = v23;
    v25 = v23;
    v26 = sub_2330B8990();
    v27 = sub_2330B8B88();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v34 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v28 = 138543362;
      v29 = v23;
      v30 = v23;
      v31 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v35[0] = v31;
      sub_2330B8BE8();
      *v34 = v31;

      _os_log_impl(&dword_233097000, v26, v27, "save() - did fail: %{public}@", v28, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560352B8);
      swift_arrayDestroy();
      MEMORY[0x23492F2E4](v34, -1, -1);
      MEMORY[0x23492F2E4](v28, -1, -1);

    }
    else
    {

    }
    swift_willThrow();
  }
  v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBADA8]), sel_init);
  v33 = *(void **)(v1 + v9);
  *(_QWORD *)(v1 + v9) = v32;

}

id sub_2330B2D24()
{
  uint64_t v0;
  void **v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void **v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void **v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
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
  id v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256035C68);
  v0 = swift_allocObject();
  v1 = (void **)MEMORY[0x24BDBA3F0];
  *(_OWORD *)(v0 + 16) = xmmword_2330BA480;
  v2 = *v1;
  v3 = (void *)*MEMORY[0x24BDBA318];
  *(_QWORD *)(v0 + 32) = *v1;
  *(_QWORD *)(v0 + 40) = v3;
  v4 = (void *)*MEMORY[0x24BDBA2C8];
  v5 = (void *)*MEMORY[0x24BDBA310];
  *(_QWORD *)(v0 + 48) = *MEMORY[0x24BDBA2C8];
  *(_QWORD *)(v0 + 56) = v5;
  v6 = (void *)*MEMORY[0x24BDBA2C0];
  v7 = (void *)*MEMORY[0x24BDBA380];
  v8 = (void **)MEMORY[0x24BDBA320];
  *(_QWORD *)(v0 + 64) = *MEMORY[0x24BDBA2C0];
  *(_QWORD *)(v0 + 72) = v7;
  v9 = *v8;
  v10 = (void *)*MEMORY[0x24BDBA328];
  *(_QWORD *)(v0 + 80) = *v8;
  *(_QWORD *)(v0 + 88) = v10;
  v11 = (void *)*MEMORY[0x24BDBA340];
  v53 = (void *)*MEMORY[0x24BDBA280];
  v12 = *MEMORY[0x24BDBA280];
  *(_QWORD *)(v0 + 96) = *MEMORY[0x24BDBA340];
  *(_QWORD *)(v0 + 104) = v12;
  v52 = (void *)*MEMORY[0x24BDBA300];
  v54 = (void *)*MEMORY[0x24BDBA360];
  v13 = *MEMORY[0x24BDBA360];
  v14 = (void **)MEMORY[0x24BDBA368];
  *(_QWORD *)(v0 + 112) = *MEMORY[0x24BDBA300];
  *(_QWORD *)(v0 + 120) = v13;
  v55 = *v14;
  v58 = (void *)*MEMORY[0x24BDBA358];
  v15 = *MEMORY[0x24BDBA358];
  *(_QWORD *)(v0 + 128) = v55;
  *(_QWORD *)(v0 + 136) = v15;
  v56 = (void *)*MEMORY[0x24BDBA370];
  v59 = (void *)*MEMORY[0x24BDBA2F0];
  v16 = *MEMORY[0x24BDBA2F0];
  *(_QWORD *)(v0 + 144) = *MEMORY[0x24BDBA370];
  *(_QWORD *)(v0 + 152) = v16;
  v57 = (void *)*MEMORY[0x24BDBA348];
  v60 = (void *)*MEMORY[0x24BDBA288];
  v17 = *MEMORY[0x24BDBA288];
  v18 = (void **)MEMORY[0x24BDBA378];
  *(_QWORD *)(v0 + 160) = *MEMORY[0x24BDBA348];
  *(_QWORD *)(v0 + 168) = v17;
  v61 = *v18;
  v64 = (void *)*MEMORY[0x24BDBA3F8];
  v19 = *MEMORY[0x24BDBA3F8];
  *(_QWORD *)(v0 + 176) = v61;
  *(_QWORD *)(v0 + 184) = v19;
  v62 = (void *)*MEMORY[0x24BDBA3C0];
  v65 = (void *)*MEMORY[0x24BDBA3C8];
  v20 = *MEMORY[0x24BDBA3C8];
  *(_QWORD *)(v0 + 192) = *MEMORY[0x24BDBA3C0];
  *(_QWORD *)(v0 + 200) = v20;
  v63 = (void *)*MEMORY[0x24BDBA2F8];
  v66 = (void *)*MEMORY[0x24BDBA258];
  v21 = *MEMORY[0x24BDBA258];
  v22 = (void **)MEMORY[0x24BDBA330];
  *(_QWORD *)(v0 + 208) = *MEMORY[0x24BDBA2F8];
  *(_QWORD *)(v0 + 216) = v21;
  v23 = *v22;
  v67 = *v22;
  v24 = *MEMORY[0x24BDBA278];
  v69 = (void *)*MEMORY[0x24BDBA278];
  *(_QWORD *)(v0 + 224) = v23;
  *(_QWORD *)(v0 + 232) = v24;
  v68 = (void *)*MEMORY[0x24BDBA2B8];
  *(_QWORD *)(v0 + 240) = *MEMORY[0x24BDBA2B8];
  v70 = v0;
  sub_2330B8AB0();
  qword_2560363E0 = v70;
  v25 = v2;
  v26 = v3;
  v27 = v4;
  v28 = v5;
  v29 = v6;
  v30 = v7;
  v31 = v9;
  v32 = v10;
  v33 = v11;
  v34 = v53;
  v35 = v52;
  v36 = v54;
  v37 = v55;
  v38 = v58;
  v39 = v56;
  v40 = v59;
  v41 = v57;
  v42 = v60;
  v43 = v61;
  v44 = v64;
  v45 = v62;
  v46 = v65;
  v47 = v63;
  v48 = v66;
  v49 = v67;
  v50 = v69;
  return v68;
}

uint64_t sub_2330B3014()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_logger;
  v2 = sub_2330B89A8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager);
  return swift_deallocClassInstance();
}

uint64_t sub_2330B30C8()
{
  return type metadata accessor for ProviderStore();
}

uint64_t type metadata accessor for ProviderStore()
{
  uint64_t result;

  result = qword_256036410;
  if (!qword_256036410)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2330B310C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2330B89A8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_2330B31A8()
{
  _QWORD *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(*v0
                                                             + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container), sel_externalIdentifier));
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2330B8A44();

  return v3;
}

void sub_2330B3218()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *v0;
  v2 = *(void **)(*v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  v3 = (void *)sub_2330B8A38();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setExternalIdentifier_, v3);

  *(_BYTE *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 1;
}

void (*sub_2330B3284(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = *v1;
  v4 = OBJC_IVAR____TtC15ContactProvider13ProviderStore_container;
  a1[2] = *v1;
  a1[3] = v4;
  v5 = objc_msgSend(*(id *)(v3 + v4), sel_externalIdentifier);
  if (v5)
  {
    v6 = v5;
    v7 = sub_2330B8A44();
    v9 = v8;

  }
  else
  {
    v7 = 0;
    v9 = 0xE000000000000000;
  }
  *a1 = v7;
  a1[1] = v9;
  return sub_2330B3304;
}

void sub_2330B3304(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(void **)(v2 + *(_QWORD *)(a1 + 24));
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_2330B8A38();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_setExternalIdentifier_, v4);

    *(_BYTE *)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 1;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = (void *)sub_2330B8A38();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_setExternalIdentifier_, v5);

    *(_BYTE *)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 1;
  }
}

uint64_t sub_2330B33D0(void *a1, uint64_t a2)
{
  return sub_2330B037C(a1, a2);
}

uint64_t sub_2330B33F0(uint64_t a1)
{
  return sub_2330B0388(a1);
}

uint64_t sub_2330B3410(void *a1, uint64_t a2)
{
  return sub_2330B11E8(a1, a2);
}

uint64_t sub_2330B3430(uint64_t a1)
{
  return sub_2330B12C4(a1);
}

unint64_t sub_2330B3450()
{
  return (unint64_t)sub_2330B14C0() & 1;
}

void sub_2330B3474(uint64_t *a1@<X8>)
{
  sub_2330B1578(a1);
}

void sub_2330B3494(uint64_t *a1@<X8>)
{
  sub_2330B1680(a1);
}

void sub_2330B34B4(uint64_t a1)
{
  sub_2330B1868(a1);
}

void sub_2330B34D4()
{
  sub_2330B19CC();
}

void sub_2330B34F4(uint64_t a1)
{
  sub_2330B1B3C(a1);
}

void sub_2330B3514(uint64_t a1, char a2)
{
  sub_2330B1B54(a1, a2);
}

void sub_2330B3534(uint64_t a1)
{
  sub_2330B1CD8(a1);
}

void sub_2330B3554()
{
  sub_2330B200C();
}

_QWORD *sub_2330B3574(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256036668);
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
    sub_2330B4EB8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2330B3680(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256036650);
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
    sub_2330B54E4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2330B378C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_2330B37FC(v6, v7, a3);
  v8 = *a1 + 8;
  sub_2330B8BE8();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2330B37FC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2330B38CC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2330A0F48((uint64_t)v12, *a3);
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
      sub_2330A0F48((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2330B38CC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2330B8BF4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2330B3A84(a5, a6);
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
  v8 = sub_2330B8C6C();
  if (!v8)
  {
    sub_2330B8CCC();
    __break(1u);
LABEL_17:
    result = sub_2330B8D08();
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

uint64_t sub_2330B3A84(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2330B3B18(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2330B3CF0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2330B3CF0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2330B3B18(uint64_t a1, unint64_t a2)
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
      v3 = sub_2330B3C8C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2330B8C3C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2330B8CCC();
      __break(1u);
LABEL_10:
      v2 = sub_2330B8A80();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2330B8D08();
    __break(1u);
LABEL_14:
    result = sub_2330B8CCC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2330B3C8C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256036660);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2330B3CF0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256036660);
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
  result = sub_2330B8D08();
  __break(1u);
  return result;
}

unint64_t sub_2330B3E3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2330B8E04();
  sub_2330B8A68();
  v4 = sub_2330B8E1C();
  return sub_2330B3EA0(a1, a2, v4);
}

unint64_t sub_2330B3EA0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2330B8D68() & 1) == 0)
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
      while (!v14 && (sub_2330B8D68() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2330B3F80(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_2330B8E04();
  swift_bridgeObjectRetain();
  sub_2330B8A68();
  v8 = sub_2330B8E1C();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2330B8D68() & 1) != 0)
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
      if (v19 || (sub_2330B8D68() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2330B4408(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2330B412C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256036648);
  v3 = sub_2330B8C24();
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
      sub_2330B8E04();
      sub_2330B8A68();
      result = sub_2330B8E1C();
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

uint64_t sub_2330B4408(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2330B412C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2330B45A0();
      goto LABEL_22;
    }
    sub_2330B4750();
  }
  v11 = *v4;
  sub_2330B8E04();
  sub_2330B8A68();
  result = sub_2330B8E1C();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_2330B8D68(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_2330B8D8C();
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
          result = sub_2330B8D68();
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

void *sub_2330B45A0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256036648);
  v2 = *v0;
  v3 = sub_2330B8C18();
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

uint64_t sub_2330B4750()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256036648);
  v3 = sub_2330B8C24();
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
    sub_2330B8E04();
    swift_bridgeObjectRetain();
    sub_2330B8A68();
    result = sub_2330B8E1C();
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

uint64_t sub_2330B49FC(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256036640);
  v38 = a2;
  v6 = sub_2330B8CF0();
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
    sub_2330B8E04();
    sub_2330B8A68();
    result = sub_2330B8E1C();
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

id sub_2330B4D08()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256036640);
  v2 = *v0;
  v3 = sub_2330B8CE4();
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

uint64_t sub_2330B4EB8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2330B8D08();
  __break(1u);
  return result;
}

_QWORD *sub_2330B4FA8(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _QWORD *v10;
  uint8_t *v11;
  uint8_t *v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v2 = (_BYTE *)(swift_bridgeObjectRetain() + 56);
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v5 = *((_QWORD *)v2 - 2);
    v4 = *((_QWORD *)v2 - 1);
    if ((*v2 & 1) != 0)
    {
      v6 = (void *)*((_QWORD *)v2 - 3);
      v7 = v6;
      swift_bridgeObjectRetain();
      v8 = sub_2330B8990();
      v9 = sub_2330B8B88();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = v3;
        v11 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_233097000, v8, v9, "update contact items - failed to map a contact's identifier", v11, 2u);
        v12 = v11;
        v3 = v10;
        MEMORY[0x23492F2E4](v12, -1, -1);
      }

      sub_23309D698(v6);
    }
    else
    {
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = sub_2330B3574(0, v3[2] + 1, 1, v3);
      v14 = v3[2];
      v13 = v3[3];
      if (v14 >= v13 >> 1)
        v3 = sub_2330B3574((_QWORD *)(v13 > 1), v14 + 1, 1, v3);
      v3[2] = v14 + 1;
      v15 = &v3[2 * v14];
      v15[4] = v5;
      v15[5] = v4;
    }
    v2 += 32;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_2330B5164(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_2330B8B70();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2330B3F80(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_2330B51F8(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint8_t *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  BOOL v22;
  uint64_t v23;
  _QWORD *v24;
  BOOL v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v2 = *(_QWORD *)(result + 16);
  if (!v2)
    return MEMORY[0x24BEE4AF8];
  v4 = 0;
  v32 = result + 32;
  v30 = MEMORY[0x24BEE4AF8];
  v34 = a2 + 56;
  v31 = *(_QWORD *)(result + 16);
  do
  {
    if (v4 <= v2)
      v5 = v2;
    else
      v5 = v4;
    v33 = v5;
    while (1)
    {
      if (v4 == v33)
      {
        __break(1u);
        return result;
      }
      v6 = v32 + 32 * v4;
      v7 = *(void **)v6;
      v8 = *(_QWORD *)(v6 + 8);
      v9 = *(_QWORD *)(v6 + 16);
      ++v4;
      if ((*(_BYTE *)(v6 + 24) & 1) != 0)
      {
        v10 = v7;
        swift_bridgeObjectRetain();
        v11 = sub_2330B8990();
        v12 = sub_2330B8B88();
        if (os_log_type_enabled(v11, v12))
        {
          v13 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_233097000, v11, v12, "update contact items - failed filter an add item", v13, 2u);
          v14 = v13;
          v2 = v31;
          MEMORY[0x23492F2E4](v14, -1, -1);
        }

        goto LABEL_8;
      }
      v15 = *(_QWORD *)(a2 + 16);
      swift_bridgeObjectRetain_n();
      v16 = v7;
      if (!v15)
        goto LABEL_28;
      sub_2330B8E04();
      sub_2330B8A68();
      v17 = sub_2330B8E1C();
      v18 = -1 << *(_BYTE *)(a2 + 32);
      v19 = v17 & ~v18;
      if (((*(_QWORD *)(v34 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
        goto LABEL_28;
      v20 = *(_QWORD *)(a2 + 48);
      v21 = (_QWORD *)(v20 + 16 * v19);
      v22 = *v21 == v8 && v9 == v21[1];
      if (!v22 && (sub_2330B8D68() & 1) == 0)
        break;
LABEL_27:
      swift_bridgeObjectRelease();
      v2 = v31;
LABEL_8:
      result = sub_23309D698(v7);
      if (v4 == v2)
        return v30;
    }
    v23 = ~v18;
    while (1)
    {
      v19 = (v19 + 1) & v23;
      if (((*(_QWORD *)(v34 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
        break;
      v24 = (_QWORD *)(v20 + 16 * v19);
      v25 = *v24 == v8 && v9 == v24[1];
      if (v25 || (sub_2330B8D68() & 1) != 0)
        goto LABEL_27;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    v26 = v30;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = sub_2330A07A4(0, *(_QWORD *)(v30 + 16) + 1, 1);
      v26 = v30;
    }
    v28 = *(_QWORD *)(v26 + 16);
    v27 = *(_QWORD *)(v26 + 24);
    if (v28 >= v27 >> 1)
    {
      result = sub_2330A07A4(v27 > 1, v28 + 1, 1);
      v26 = v30;
    }
    *(_QWORD *)(v26 + 16) = v28 + 1;
    v30 = v26;
    v29 = v26 + 32 * v28;
    *(_QWORD *)(v29 + 32) = v7;
    *(_QWORD *)(v29 + 40) = v8;
    *(_QWORD *)(v29 + 48) = v9;
    *(_BYTE *)(v29 + 56) = 0;
    v2 = v31;
  }
  while (v4 != v31);
  return v30;
}

uint64_t sub_2330B54E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2330B8D08();
  __break(1u);
  return result;
}

uint64_t static DefaultContactProviderDomain.identifier.getter()
{
  uint64_t v0;

  if (qword_256034E10 != -1)
    swift_once();
  v0 = qword_256036680;
  swift_bridgeObjectRetain();
  return v0;
}

ContactProvider::DefaultContactProviderDomain __swiftcall DefaultContactProviderDomain.init()()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;
  void *v3;
  void *v4;
  ContactProvider::DefaultContactProviderDomain result;

  v1 = v0;
  v2 = sub_2330A0638(MEMORY[0x24BEE4AF8]);
  *v1 = 0;
  v1[1] = 0xE000000000000000;
  v1[2] = v2;
  result.userInfo._rawValue = v4;
  result.displayName._object = v3;
  result.displayName._countAndFlagsBits = v2;
  return result;
}

void __swiftcall CustomContactProviderDomain.init(identifier:)(ContactProvider::CustomContactProviderDomain *__return_ptr retstr, Swift::String identifier)
{
  void *object;
  uint64_t countAndFlagsBits;
  void *v5;

  object = identifier._object;
  countAndFlagsBits = identifier._countAndFlagsBits;
  v5 = (void *)sub_2330A0638(MEMORY[0x24BEE4AF8]);
  retstr->identifier._countAndFlagsBits = countAndFlagsBits;
  retstr->identifier._object = object;
  retstr->displayName._countAndFlagsBits = 0;
  retstr->displayName._object = (void *)0xE000000000000000;
  retstr->userInfo._rawValue = v5;
}

uint64_t DefaultContactProviderDomain.identifier.getter()
{
  uint64_t v0;

  if (qword_256034E10 != -1)
    swift_once();
  v0 = qword_256036680;
  swift_bridgeObjectRetain();
  return v0;
}

void sub_2330B5708()
{
  strcpy((char *)&qword_256036680, "defaultDomain");
  *(_WORD *)&algn_256036688[6] = -4864;
}

uint64_t DefaultContactProviderDomain.displayName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DefaultContactProviderDomain.userInfo.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2330B576C()
{
  uint64_t v0;

  if (qword_256034E10 != -1)
    swift_once();
  v0 = qword_256036680;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_2330B57C8()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2330B57F4()
{
  return swift_bridgeObjectRetain();
}

uint64_t CustomContactProviderDomain.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CustomContactProviderDomain.displayName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CustomContactProviderDomain.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*CustomContactProviderDomain.displayName.modify())()
{
  return nullsub_1;
}

uint64_t CustomContactProviderDomain.userInfo.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CustomContactProviderDomain.userInfo.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t (*CustomContactProviderDomain.userInfo.modify())()
{
  return nullsub_1;
}

uint64_t sub_2330B58D8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2330B5904()
{
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of ContactProviderDomain.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ContactProviderDomain.displayName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ContactProviderDomain.userInfo.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t destroy for DefaultContactProviderDomain()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s15ContactProvider28DefaultContactProviderDomainVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DefaultContactProviderDomain(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DefaultContactProviderDomain(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DefaultContactProviderDomain(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DefaultContactProviderDomain(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DefaultContactProviderDomain()
{
  return &type metadata for DefaultContactProviderDomain;
}

uint64_t destroy for CustomContactProviderDomain()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for CustomContactProviderDomain(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CustomContactProviderDomain(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CustomContactProviderDomain(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CustomContactProviderDomain(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CustomContactProviderDomain(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CustomContactProviderDomain()
{
  return &type metadata for CustomContactProviderDomain;
}

uint64_t withTimeout<A>(_:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  v7 = sub_2330B8C9C();
  v6[8] = v7;
  v6[9] = *(_QWORD *)(v7 - 8);
  v6[10] = swift_task_alloc();
  v6[11] = swift_task_alloc();
  v8 = sub_2330B8CB4();
  v6[12] = v8;
  v6[13] = *(_QWORD *)(v8 - 8);
  v6[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2330B5D7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(v0 + 32);
  sub_2330B8CA8();
  sub_2330B8C84();
  MEMORY[0x23492EC6C](v5, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(_QWORD *)(v0 + 120) = v6;
  v6(v1, v2);
  v7 = swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v7;
  v8 = sub_2330AF5FC(&qword_2560362D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E98], MEMORY[0x24BEE6EA8]);
  *(_QWORD *)v7 = v0;
  *(_QWORD *)(v7 + 8) = sub_2330B5E78;
  v9 = *(_QWORD *)(v0 + 112);
  v10 = *(_QWORD *)(v0 + 88);
  v11 = *(_QWORD *)(v0 + 56);
  v12 = *(_QWORD *)(v0 + 16);
  v13 = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v7 + 64) = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v7 + 72) = v8;
  *(_QWORD *)(v7 + 56) = v11;
  *(_OWORD *)(v7 + 40) = v13;
  *(_QWORD *)(v7 + 24) = v10;
  *(_QWORD *)(v7 + 32) = v9;
  *(_QWORD *)(v7 + 16) = v12;
  return swift_task_switch();
}

uint64_t sub_2330B5E78()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2330B5EDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 104);
  (*(void (**)(_QWORD, _QWORD))(v0 + 120))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 64));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330B5F58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 104);
  (*(void (**)(_QWORD, _QWORD))(v0 + 120))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 64));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330B5FD4(char a1, char a2)
{
  uint64_t v3;
  void *v4;
  _BYTE *v5;
  uint64_t v6;
  void *v7;
  _BYTE *v8;
  char v9;
  char v11;

  sub_23309ADE8();
  v3 = sub_2330B8D5C();
  if (v3)
  {
    v4 = (void *)v3;
  }
  else
  {
    v4 = (void *)swift_allocError();
    *v5 = a1;
  }
  v11 = a2;
  v6 = sub_2330B8D5C();
  if (v6)
  {
    v7 = (void *)v6;
  }
  else
  {
    v7 = (void *)swift_allocError();
    *v8 = v11;
  }
  v9 = == infix(_:_:)();

  return v9 & 1;
}

uint64_t sub_2330B60BC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  char v4;

  sub_2330AF63C();
  v0 = sub_2330B8D5C();
  if (!v0)
    v0 = swift_allocError();
  v1 = (void *)v0;
  v2 = sub_2330B8D5C();
  if (!v2)
    v2 = swift_allocError();
  v3 = (void *)v2;
  v4 = == infix(_:_:)();

  return v4 & 1;
}

uint64_t AsyncTimeoutError.hash(into:)()
{
  return sub_2330B8E10();
}

uint64_t AsyncTimeoutError.hashValue.getter()
{
  sub_2330B8E04();
  sub_2330B8E10();
  return sub_2330B8E1C();
}

uint64_t sub_2330B61D0()
{
  sub_2330B8E04();
  sub_2330B8E10();
  return sub_2330B8E1C();
}

uint64_t sub_2330B6210()
{
  return sub_2330B8E10();
}

uint64_t sub_2330B6234()
{
  sub_2330B8E04();
  sub_2330B8E10();
  return sub_2330B8E1C();
}

uint64_t withDeadline<A, B>(_:clock:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[8] = a7;
  v8[9] = a8;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  v8[2] = a1;
  v8[3] = a2;
  return swift_task_switch();
}

uint64_t sub_2330B6294()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v2;
  v3 = *(_OWORD *)(v0 + 40);
  v4 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v2 + 32) = v1;
  *(_OWORD *)(v2 + 40) = v3;
  *(_OWORD *)(v2 + 56) = v4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v5;
  *v5 = v0;
  v5[1] = sub_2330B6338;
  return sub_2330B8D14();
}

uint64_t sub_2330B6338()
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

uint64_t sub_2330B63AC()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t withTimeout<A, B>(_:clock:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t AssociatedTypeWitness;

  v8[8] = a7;
  v8[9] = a8;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  v8[2] = a1;
  v8[3] = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[10] = AssociatedTypeWitness;
  v8[11] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8[12] = swift_task_alloc();
  v8[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2330B6474()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  sub_2330B8DA4();
  swift_getAssociatedConformanceWitness();
  sub_2330B8C78();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(_QWORD *)(v0 + 112) = v4;
  v4(v1, v2);
  v5 = swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v5;
  *(_QWORD *)v5 = v0;
  *(_QWORD *)(v5 + 8) = sub_2330B656C;
  v6 = *(_QWORD *)(v0 + 104);
  v7 = *(_QWORD *)(v0 + 16);
  v8 = *(_OWORD *)(v0 + 32);
  v9 = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v5 + 48) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v5 + 64) = v9;
  *(_OWORD *)(v5 + 32) = v8;
  *(_QWORD *)(v5 + 16) = v7;
  *(_QWORD *)(v5 + 24) = v6;
  return swift_task_switch();
}

uint64_t sub_2330B656C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2330B65D0()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(v0 + 112))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330B6620()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(v0 + 112))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330B6670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v15;

  v8[9] = a8;
  v8[10] = v15;
  v8[7] = a6;
  v8[8] = a7;
  v8[5] = a4;
  v8[6] = a5;
  v8[3] = a2;
  v8[4] = a3;
  v8[2] = a1;
  v10 = sub_2330B8BDC();
  v8[11] = v10;
  v8[12] = *(_QWORD *)(v10 - 8);
  v8[13] = swift_task_alloc();
  v8[14] = swift_task_alloc();
  v11 = *(_QWORD *)(a8 - 8);
  v8[15] = v11;
  v8[16] = *(_QWORD *)(v11 + 64);
  v8[17] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[18] = AssociatedTypeWitness;
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8[19] = v13;
  v8[20] = *(_QWORD *)(v13 + 64);
  v8[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256036298);
  v8[22] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2330B678C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  _QWORD *v13;
  void (*v15)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = v0[22];
  v20 = v0[21];
  v22 = v0[20];
  v17 = v0[19];
  v19 = v0[18];
  v21 = v0[17];
  v23 = v0[15];
  v2 = v0[9];
  v3 = v0[10];
  v4 = v0[8];
  v18 = v0[7];
  v5 = v0[5];
  v16 = v0[6];
  v6 = v0[4];
  v7 = sub_2330B8B1C();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v15(v1, 1, 1, v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v4;
  v8[5] = v2;
  v8[6] = v3;
  v8[7] = v6;
  v8[8] = v5;
  swift_retain();
  v0[23] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2560352B0);
  sub_2330B8B64();
  sub_2330B7E08(v1, (uint64_t)&unk_2560366C8, (uint64_t)v8);
  sub_2330B83D8(v1);
  v15(v1, 1, 1, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v20, v16, v19);
  v9 = v2;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v21, v18, v2);
  v10 = (*(unsigned __int8 *)(v17 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v11 = (v22 + *(unsigned __int8 *)(v23 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  v12 = (char *)swift_allocObject();
  *((_QWORD *)v12 + 2) = 0;
  *((_QWORD *)v12 + 3) = 0;
  *((_QWORD *)v12 + 4) = v4;
  *((_QWORD *)v12 + 5) = v9;
  *((_QWORD *)v12 + 6) = v3;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(&v12[v10], v20, v19);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 32))(&v12[v11], v21, v9);
  sub_2330B7E08(v1, (uint64_t)&unk_2560366D8, (uint64_t)v12);
  sub_2330B83D8(v1);
  v13 = (_QWORD *)swift_task_alloc();
  v0[24] = v13;
  *v13 = v0;
  v13[1] = sub_2330B69FC;
  return sub_2330B8B4C();
}

uint64_t sub_2330B69FC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2330B6A60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 64);
  sub_2330B8B58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v1, 1, v5);
  v8 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  if (v7 == 1)
  {
    v9 = *(_QWORD *)(v0 + 112);
    v10 = *(_QWORD *)(v0 + 88);
    v8(*(_QWORD *)(v0 + 104), v10);
    sub_2330B8B04();
    sub_2330AF5FC(&qword_2560362C8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6838], MEMORY[0x24BEE6848]);
    swift_allocError();
    sub_2330B8A14();
    swift_willThrow();
    v8(v9, v10);
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 104);
    v12 = *(_QWORD *)(v0 + 64);
    v13 = *(_QWORD *)(v0 + 16);
    v8(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 88));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v13, v11, v12);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330B6C10()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330B6C7C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[5];
  v9 = v2[6];
  v10 = v2[7];
  v11 = v2[8];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = sub_233098F04;
  return sub_2330B6670(a1, a2, v8, v9, v10, v11, v6, v7);
}

uint64_t sub_2330B6D20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;

  v8[10] = a7;
  v8[11] = a8;
  v8[8] = a5;
  v8[9] = a6;
  v8[6] = a1;
  v8[7] = a4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2560352B0);
  v8[12] = sub_2330B8AF8();
  v9 = sub_2330B8BDC();
  v8[13] = v9;
  v8[14] = *(_QWORD *)(v9 - 8);
  v8[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2330B6DB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  _QWORD *v11;
  _QWORD *v12;

  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 104);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 96) - 8) + 56))(v1, 1, 1);
  v4 = sub_2330B8608();
  *(_QWORD *)(v0 + 128) = v4;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560362F8);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 136) = inited;
  *(_DWORD *)(inited + 24) = 0;
  *(_QWORD *)(inited + 16) = 0;
  sub_2330B8B34();
  v7 = *(_QWORD *)(v0 + 80);
  v6 = *(_QWORD *)(v0 + 88);
  v8 = *(_QWORD *)(v0 + 72);
  v9 = swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v9;
  v10 = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v7;
  *(_QWORD *)(v9 + 32) = v6;
  *(_QWORD *)(v9 + 40) = v4;
  *(_QWORD *)(v9 + 48) = inited;
  *(_OWORD *)(v9 + 56) = v10;
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v11;
  v11[2] = v8;
  v11[3] = v7;
  v11[4] = v6;
  v11[5] = inited;
  v11[6] = v4;
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v12;
  *v12 = v0;
  v12[1] = sub_2330B6F38;
  return sub_2330B8D74();
}

uint64_t sub_2330B6F38()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 168) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_2330B6FAC()
{
  uint64_t v0;

  swift_setDeallocating();
  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330B7008()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330B7068(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[8] = a7;
  v8[9] = a8;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  v8[2] = a1;
  v8[3] = a2;
  return swift_task_switch();
}

uint64_t sub_2330B708C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v2;
  v3 = *(_OWORD *)(v0 + 24);
  v4 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v2 + 32) = v1;
  *(_OWORD *)(v2 + 40) = v3;
  *(_OWORD *)(v2 + 56) = v4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v5;
  *v5 = v0;
  v5[1] = sub_2330B713C;
  return sub_2330B8D80();
}

uint64_t sub_2330B713C()
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

void sub_2330B71B0(uint64_t a1, uint64_t a2, os_unfair_lock_s *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  os_unfair_lock_s *v17;
  uint64_t *v18;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2560352B0);
  sub_2330B8AF8();
  sub_2330B8BDC();
  v16 = a2 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)a2 + 16);
  v17 = (os_unfair_lock_s *)(a2 + ((*(unsigned int *)(*(_QWORD *)a2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v17);
  sub_2330B72CC(v16, a1);
  os_unfair_lock_unlock(v17);
  v18 = (uint64_t *)&a3[4];
  a3 += 6;
  os_unfair_lock_lock(a3);
  sub_2330B7380(v18, a4, a5, a2, a6, a7, a8);
  os_unfair_lock_unlock(a3);
}

uint64_t sub_2330B72CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2560352B0);
  v4 = sub_2330B8AF8();
  v5 = sub_2330B8BDC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  v6 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v4);
}

uint64_t sub_2330B7380(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t result;
  uint64_t v20;

  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256036298);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_release();
  v17 = sub_2330B8B1C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = a5;
  v18[5] = a6;
  v18[6] = a7;
  v18[7] = a2;
  v18[8] = a3;
  v18[9] = a4;
  swift_retain();
  swift_retain();
  result = sub_2330ABC1C((uint64_t)v16, (uint64_t)&unk_2560366F8, (uint64_t)v18);
  *a1 = result;
  return result;
}

uint64_t sub_2330B7494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;

  v8[6] = a8;
  v8[7] = v10;
  v8[4] = a6;
  v8[5] = a7;
  v8[2] = a4;
  v8[3] = a5;
  v8[8] = *(_QWORD *)(a7 - 8);
  v8[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2330B74F4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  sub_2330B8B34();
  v3 = (uint64_t (*)(_QWORD))(**(int **)(v0 + 16) + *(_QWORD *)(v0 + 16));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = sub_2330B7650;
  return v3(*(_QWORD *)(v0 + 72));
}

uint64_t sub_2330B7650()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2330B76B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  __int128 v9;

  v2 = *(_QWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = (uint64_t *)swift_task_alloc();
  v9 = *(_OWORD *)(v0 + 40);
  *((_OWORD *)v5 + 1) = v9;
  v5[4] = v3;
  v5[5] = v1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2560352B0);
  sub_2330B8AF8();
  sub_2330B8BDC();
  v6 = v4 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v4 + 16);
  v7 = (os_unfair_lock_s *)(v4 + ((*(unsigned int *)(*(_QWORD *)v4 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v7);
  sub_2330B78C0(v6, v5[5], v5[2]);
  os_unfair_lock_unlock(v7);
  swift_task_dealloc();
  (*(void (**)(uint64_t, _QWORD))(v2 + 8))(v1, v9);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330B77C4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *v6;

  v1 = *(void **)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = swift_task_alloc();
  *(_OWORD *)(v4 + 16) = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v4 + 32) = v2;
  *(_QWORD *)(v4 + 40) = v1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2560352B0);
  sub_2330B8AF8();
  sub_2330B8BDC();
  v5 = v3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v3 + 16);
  v6 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v6);
  sub_2330B7A24(v5, *(void **)(v4 + 40));
  os_unfair_lock_unlock(v6);

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330B78C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD v15[2];

  v6 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2560352B0);
  v9 = sub_2330B8AF8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v15 - v11;
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, a3);
    sub_2330B8AEC();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  v13 = sub_2330B8BDC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a1, v13);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a1, 1, 1, v9);
}

uint64_t sub_2330B7A24(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  _QWORD v11[2];

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2560352B0);
  v4 = sub_2330B8AF8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v11 - v6;
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    v11[1] = a2;
    v8 = a2;
    sub_2330B8AE0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v9 = sub_2330B8BDC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, 1, 1, v4);
}

void sub_2330B7B48(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;

  v4 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  if (*(_QWORD *)(a1 + 16))
    sub_2330B8B28();
  os_unfair_lock_unlock(v4);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2560352B0);
  sub_2330B8AF8();
  sub_2330B8BDC();
  v5 = a2 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)a2 + 16);
  v6 = (os_unfair_lock_s *)(a2 + ((*(unsigned int *)(*(_QWORD *)a2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v6);
  sub_2330B7CAC(v5);
  os_unfair_lock_unlock(v6);
}

uint64_t *sub_2330B7C48@<X0>(uint64_t *result@<X0>, BOOL *a2@<X8>)
{
  uint64_t v3;

  v3 = *result;
  if (*result)
    result = (uint64_t *)sub_2330B8B28();
  *a2 = v3 == 0;
  return result;
}

uint64_t sub_2330B7CAC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2560352B0);
  v2 = sub_2330B8AF8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v9 - v4;
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    sub_2330B8B04();
    sub_2330AF5FC(&qword_2560362C8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6838], MEMORY[0x24BEE6848]);
    v6 = swift_allocError();
    sub_2330B8A14();
    v9[1] = v6;
    sub_2330B8AE0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  v7 = sub_2330B8BDC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(a1, 1, 1, v2);
}

uint64_t sub_2330B7E08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD v18[4];
  _QWORD v19[4];

  v4 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256036298);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2330B85C0(a1, (uint64_t)v9);
  v10 = sub_2330B8B1C();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_2330B83D8((uint64_t)v9);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v12 = sub_2330B8AD4();
      v14 = v13;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_2330B8B10();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v15 = *v4;
  v16 = (_QWORD *)(v14 | v12);
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v16 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  v18[1] = 1;
  v18[2] = v16;
  v18[3] = v15;
  swift_task_create();
  return swift_release();
}

uint64_t sub_2330B7F8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;

  v8[4] = a7;
  v8[5] = a8;
  v8[2] = a4;
  v8[3] = a5;
  v8[6] = swift_getAssociatedTypeWitness();
  v9 = sub_2330B8BDC();
  v8[7] = v9;
  v8[8] = *(_QWORD *)(v9 - 8);
  v8[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2330B8018()
{
  _QWORD *v0;
  _QWORD *v1;

  sub_2330B8B34();
  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v0[6] - 8) + 56))(v0[9], 1, 1);
  v1 = (_QWORD *)swift_task_alloc();
  v0[10] = v1;
  *v1 = v0;
  v1[1] = sub_2330B80C4;
  return sub_2330B8B40();
}

uint64_t sub_2330B80C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return swift_task_switch();
}

uint64_t sub_2330B8144()
{
  uint64_t v0;

  sub_2330AF63C();
  swift_allocError();
  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330B81A4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2330B81DC()
{
  unint64_t result;

  result = qword_2560366B8;
  if (!qword_2560366B8)
  {
    result = MEMORY[0x23492F248](&protocol conformance descriptor for AsyncTimeoutError, &type metadata for AsyncTimeoutError);
    atomic_store(result, &qword_2560366B8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AsyncTimeoutError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AsyncTimeoutError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2330B82B4 + 4 * asc_2330BA5F0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2330B82D4 + 4 * byte_2330BA5F5[v4]))();
}

_BYTE *sub_2330B82B4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2330B82D4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2330B82DC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2330B82E4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2330B82EC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2330B82F4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2330B8300()
{
  return 0;
}

ValueMetadata *type metadata accessor for AsyncTimeoutError()
{
  return &type metadata for AsyncTimeoutError;
}

uint64_t sub_2330B8318()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2330B8344(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[4];
  v5 = v1[5];
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_23309B0EC;
  return sub_2330B6D20(a1, v6, v7, v9, v10, v4, v5, v8);
}

uint64_t sub_2330B83D8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256036298);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2330B8418()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = *(_QWORD *)(v0 + 40);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v1 - 8);
  v6 = (v4 + *(_QWORD *)(v3 + 64) + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, AssociatedTypeWitness);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v6, v1);
  return swift_deallocObject();
}

uint64_t sub_2330B84E0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v4 = v1[4];
  v5 = v1[5];
  v6 = v1[6];
  v7 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v10 = v1[2];
  v11 = v1[3];
  v12 = (uint64_t)v1 + v8;
  v13 = (uint64_t)v1 + ((v8 + *(_QWORD *)(v7 + 64) + v9) & ~v9);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v14;
  *v14 = v2;
  v14[1] = sub_23309B0EC;
  return sub_2330B7F8C(a1, v10, v11, v12, v13, v4, v5, v6);
}

uint64_t sub_2330B85C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256036298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2330B8608()
{
  type metadata accessor for os_unfair_lock_s(255);
  sub_2330B8C60();
  return sub_2330B8C54();
}

uint64_t sub_2330B8674(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v1 + 40);
  v7 = *(_OWORD *)(v1 + 56);
  v8 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_23309B0EC;
  *(_QWORD *)(v5 + 72) = v4;
  *(_OWORD *)(v5 + 56) = v8;
  *(_OWORD *)(v5 + 40) = v7;
  *(_OWORD *)(v5 + 24) = v6;
  *(_QWORD *)(v5 + 16) = a1;
  return swift_task_switch();
}

void sub_2330B86FC()
{
  uint64_t v0;

  sub_2330B7B48(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

void sub_2330B870C(uint64_t a1)
{
  uint64_t v1;

  sub_2330B71B0(a1, *(_QWORD *)(v1 + 40), *(os_unfair_lock_s **)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_2330B8720()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2330B8754()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v0 + 56);
  v6 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = sub_233098F04;
  *(_QWORD *)(v4 + 56) = v2;
  *(_OWORD *)(v4 + 40) = v6;
  *(_QWORD *)(v4 + 32) = v3;
  *(_OWORD *)(v4 + 16) = v5;
  *(_QWORD *)(v4 + 64) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 72) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2330B87F4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *a1;
  *(_DWORD *)((char *)a1 + ((*(unsigned int *)(*a1 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v4 + *MEMORY[0x24BEE27A8]) - 8) + 16))(a2, v3);
}

uint64_t sub_2330B8850(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 112) = result;
  return result;
}

uint64_t sub_2330B8858(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 113) = result;
  return result;
}

uint64_t ExtensionState.deinit()
{
  uint64_t v0;

  swift_defaultActor_destroy();
  return v0;
}

uint64_t ExtensionState.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t ExtensionState.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2330B88A4()
{
  uint64_t v0;

  return v0;
}

uint64_t type metadata accessor for ExtensionState()
{
  return objc_opt_self();
}

uint64_t method lookup function for ExtensionState()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ExtensionState.setShouldInvalidate(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of ExtensionState.setIsSynchronizing(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t sub_2330B88F4()
{
  return MEMORY[0x24BDCB9D8]();
}

uint64_t sub_2330B8900()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2330B890C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2330B8918()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2330B8924()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_2330B8930()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_2330B893C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2330B8948()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2330B8954()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2330B8960()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2330B896C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2330B8978()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2330B8984()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2330B8990()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2330B899C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2330B89A8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2330B89B4()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_2330B89C0()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_2330B89CC()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_2330B89D8()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_2330B89E4()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_2330B89F0()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_2330B89FC()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_2330B8A08()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2330B8A14()
{
  return MEMORY[0x24BEE67F8]();
}

uint64_t sub_2330B8A20()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2330B8A2C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2330B8A38()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2330B8A44()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2330B8A50()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_2330B8A5C()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_2330B8A68()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2330B8A74()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2330B8A80()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2330B8A8C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2330B8A98()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2330B8AA4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2330B8AB0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2330B8ABC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2330B8AC8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2330B8AD4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2330B8AE0()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2330B8AEC()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2330B8AF8()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_2330B8B04()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_2330B8B10()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2330B8B1C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2330B8B28()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_2330B8B34()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_2330B8B40()
{
  return MEMORY[0x24BEE6B38]();
}

uint64_t sub_2330B8B4C()
{
  return MEMORY[0x24BEE6BA0]();
}

uint64_t sub_2330B8B58()
{
  return MEMORY[0x24BEE6BE0]();
}

uint64_t sub_2330B8B64()
{
  return MEMORY[0x24BEE6BE8]();
}

uint64_t sub_2330B8B70()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2330B8B7C()
{
  return MEMORY[0x24BEE7640]();
}

uint64_t sub_2330B8B88()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2330B8B94()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2330B8BA0()
{
  return MEMORY[0x24BDBA1D8]();
}

uint64_t sub_2330B8BAC()
{
  return MEMORY[0x24BDBA1E0]();
}

uint64_t sub_2330B8BB8()
{
  return MEMORY[0x24BDBA1F0]();
}

uint64_t sub_2330B8BC4()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2330B8BD0()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_2330B8BDC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2330B8BE8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2330B8BF4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2330B8C00()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2330B8C0C()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2330B8C18()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2330B8C24()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2330B8C30()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2330B8C3C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2330B8C48()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2330B8C54()
{
  return MEMORY[0x24BEE2788]();
}

uint64_t sub_2330B8C60()
{
  return MEMORY[0x24BEE2798]();
}

uint64_t sub_2330B8C6C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2330B8C78()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_2330B8C84()
{
  return MEMORY[0x24BEE6E28]();
}

uint64_t sub_2330B8C90()
{
  return MEMORY[0x24BEE6E60]();
}

uint64_t sub_2330B8C9C()
{
  return MEMORY[0x24BEE6E70]();
}

uint64_t sub_2330B8CA8()
{
  return MEMORY[0x24BEE6E90]();
}

uint64_t sub_2330B8CB4()
{
  return MEMORY[0x24BEE6E98]();
}

uint64_t sub_2330B8CC0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2330B8CCC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2330B8CD8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2330B8CE4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2330B8CF0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2330B8CFC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2330B8D08()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2330B8D14()
{
  return MEMORY[0x24BEE6FA8]();
}

uint64_t sub_2330B8D20()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_2330B8D2C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2330B8D38()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2330B8D44()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2330B8D50()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2330B8D5C()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_2330B8D68()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2330B8D74()
{
  return MEMORY[0x24BEE7098]();
}

uint64_t sub_2330B8D80()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2330B8D8C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2330B8D98()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2330B8DA4()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_2330B8DB0()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_2330B8DBC()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_2330B8DC8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2330B8DD4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2330B8DE0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2330B8DEC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2330B8DF8()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_2330B8E04()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2330B8E10()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2330B8E1C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2330B8E28()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2330B8E34()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2330B8E40()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2330B8E4C()
{
  return MEMORY[0x24BEE4A10]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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


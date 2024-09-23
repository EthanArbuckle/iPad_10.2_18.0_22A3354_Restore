id DILogHandleDropInSession()
{
  if (DILogHandleDropInSession_once != -1)
    dispatch_once(&DILogHandleDropInSession_once, &__block_literal_global_148);
  return (id)DILogHandleDropInSession_logger;
}

void sub_23A745F40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
}

void sub_23A7460B4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

id DILogHandleDevice()
{
  if (DILogHandleDevice_once != -1)
    dispatch_once(&DILogHandleDevice_once, &__block_literal_global_0);
  return (id)DILogHandleDevice_logger;
}

void sub_23A747338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23A748618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DILogHandleDropInRequest()
{
  if (DILogHandleDropInRequest_once != -1)
    dispatch_once(&DILogHandleDropInRequest_once, &__block_literal_global_1);
  return (id)DILogHandleDropInRequest_logger;
}

id DILogHandleDropInCenter()
{
  if (DILogHandleDropInCenter_once != -1)
    dispatch_once(&DILogHandleDropInCenter_once, &__block_literal_global_2);
  return (id)DILogHandleDropInCenter_logger;
}

id DILogHandleAudioPowerController()
{
  if (DILogHandleAudioPowerController_once != -1)
    dispatch_once(&DILogHandleAudioPowerController_once, &__block_literal_global_31);
  return (id)DILogHandleAudioPowerController_logger;
}

id DILogHandleDIDropInSessionManager()
{
  if (DILogHandleDIDropInSessionManager_once != -1)
    dispatch_once(&DILogHandleDIDropInSessionManager_once, &__block_literal_global_53);
  return (id)DILogHandleDIDropInSessionManager_logger;
}

id DILogHandleDeviceManager()
{
  if (DILogHandleDeviceManager_once != -1)
    dispatch_once(&DILogHandleDeviceManager_once, &__block_literal_global_53_0);
  return (id)DILogHandleDeviceManager_logger;
}

void sub_23A74CB78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23A74CDAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23A74D198(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23A74D428(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23A74D7D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id DILogHandleAudioSystemController()
{
  if (DILogHandleAudioSystemController_once[0] != -1)
    dispatch_once(DILogHandleAudioSystemController_once, &__block_literal_global_65);
  return (id)DILogHandleAudioSystemController_logger;
}

void sub_23A74DB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23A74DCBC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_23A74E130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23A74E29C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_23A74EB14(void *a1, void (**a2)(_QWORD))
{
  objc_msgSend(a1, sel_lock);
  a2[2](a2);
  objc_msgSend(a1, sel_unlock);
  _Block_release(a2);
}

id NSRecursiveLock.di_synchronize(_:)(void (*a1)(id))
{
  void *v1;

  a1(objc_msgSend(v1, sel_lock));
  return objc_msgSend(v1, sel_unlock);
}

void sub_23A74EBAC(void *a1, int a2, void *aBlock)
{
  void *v4;
  id v5;

  v4 = _Block_copy(aBlock);
  _Block_copy(v4);
  v5 = a1;
  sub_23A74EB14(v5, (void (**)(_QWORD))v4);
  _Block_release(v4);

}

void type metadata accessor for HandleType(uint64_t a1)
{
  sub_23A74EF44(a1, &qword_2569B7450);
}

void type metadata accessor for StateReason(uint64_t a1)
{
  sub_23A74EF44(a1, &qword_2569B7458);
}

void type metadata accessor for State(uint64_t a1)
{
  sub_23A74EF44(a1, &qword_2569B7460);
}

void _s3__C5StateOMa_0(uint64_t a1)
{
  sub_23A74EF44(a1, &qword_2569B7468);
}

uint64_t sub_23A74EC4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_23A76949C();
  v2 = v1;
  if (v0 == sub_23A76949C() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23A7697E4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_23A74ECD0(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL sub_23A74ECDC(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23A74ECEC()
{
  uint64_t *v0;

  return sub_23A74F0C0(*v0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_23A74ED10(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_23A769484();
  *a2 = 0;
  return result;
}

uint64_t sub_23A74ED88(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_23A769490();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23A74EE04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23A74EE28();
  *a1 = result;
  return result;
}

uint64_t sub_23A74EE28()
{
  uint64_t v0;

  sub_23A76949C();
  v0 = sub_23A769478();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23A74EE5C()
{
  return sub_23A74EC4C();
}

void sub_23A74EE68(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_23A74EE98();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

void sub_23A74EEA0()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_1();
  *v0 = nullsub_1(v1);
  OUTLINED_FUNCTION_0();
}

BOOL sub_23A74EEC0(uint64_t *a1, uint64_t *a2)
{
  return sub_23A74ECD0(*a1, *a2);
}

uint64_t sub_23A74EECC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23A769478();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_23A74EF10()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_1();
  *v0 = sub_23A754354();
  v0[1] = v1;
  OUTLINED_FUNCTION_0();
}

void type metadata accessor for Category(uint64_t a1)
{
  sub_23A74EF44(a1, &qword_2569B7470);
}

void sub_23A74EF44(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23A74EF88()
{
  sub_23A74F03C(&qword_2569B7490, (uint64_t)&unk_23A76AE70);
  sub_23A74F03C(&qword_2569B7498, (uint64_t)&unk_23A76AE18);
  return sub_23A7697B4();
}

uint64_t sub_23A74EFF4()
{
  return sub_23A74F03C(&qword_2569B7478, (uint64_t)&unk_23A76ADE0);
}

uint64_t sub_23A74F018()
{
  return sub_23A74F03C(&qword_2569B7480, (uint64_t)&unk_23A76ADB8);
}

uint64_t sub_23A74F03C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Category(255);
    result = MEMORY[0x23B856A18](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A74F07C()
{
  return sub_23A74F03C(&qword_2569B7488, (uint64_t)&unk_23A76AE48);
}

uint64_t sub_23A74F0A0()
{
  uint64_t *v0;

  return sub_23A74F0C0(*v0, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_23A74F0C0(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_23A76949C();
  v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_23A74F0F8()
{
  return sub_23A74F100();
}

uint64_t sub_23A74F100()
{
  sub_23A76949C();
  sub_23A7694B4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A74F140()
{
  return sub_23A74F148();
}

uint64_t sub_23A74F148()
{
  uint64_t v0;

  sub_23A76949C();
  sub_23A769850();
  sub_23A7694B4();
  v0 = sub_23A769868();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t OUTLINED_FUNCTION_1()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_23A74F1D0()
{
  uint64_t v1;

  if (qword_2569B7320 != -1)
    swift_once();
  v1 = qword_2569B7AB8;
  swift_bridgeObjectRetain();
  sub_23A7694C0();
  sub_23A7694C0();
  return v1;
}

id sub_23A74F260()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char v3;
  id v5;

  v1 = v0;
  sub_23A74F304();
  v2 = (void *)sub_23A769634();
  v3 = sub_23A7696B8();

  if ((v3 & 1) != 0)
    return objc_msgSend((id)objc_opt_self(), sel_mainQueue);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1710]), sel_init);
  objc_msgSend(v5, sel_setUnderlyingQueue_, v1);
  return v5;
}

unint64_t sub_23A74F304()
{
  unint64_t result;

  result = qword_2542D4A90;
  if (!qword_2542D4A90)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542D4A90);
  }
  return result;
}

uint64_t sub_23A74F340()
{
  return sub_23A76985C();
}

uint64_t sub_23A74F364()
{
  sub_23A769850();
  sub_23A76985C();
  return sub_23A769868();
}

BOOL sub_23A74F3A8(char *a1, char *a2)
{
  return sub_23A74ECDC(*a1, *a2);
}

uint64_t sub_23A74F3B4()
{
  return sub_23A74F364();
}

uint64_t sub_23A74F3BC()
{
  return sub_23A74F340();
}

uint64_t sub_23A74F3C4()
{
  sub_23A769850();
  sub_23A76985C();
  return sub_23A769868();
}

uint64_t sub_23A74F414(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC6DropIn11AudioPlayer_playHandler);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC6DropIn11AudioPlayer_playHandler);
  *v3 = a1;
  v3[1] = a2;
  return sub_23A74FDDC(v4);
}

void sub_23A74F434(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC6DropIn11AudioPlayer_timeoutTimer);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6DropIn11AudioPlayer_timeoutTimer) = a1;

}

char *sub_23A74F448(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  char *v12;
  id v13;
  void *v14;
  objc_class *v15;
  objc_super v17;
  uint64_t v18;

  v3 = v1;
  v5 = sub_23A7692D4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t *)&v3[OBJC_IVAR____TtC6DropIn11AudioPlayer_playHandler];
  *v9 = 0;
  v9[1] = 0;
  v10 = OBJC_IVAR____TtC6DropIn11AudioPlayer_timeoutTimer;
  *(_QWORD *)&v3[OBJC_IVAR____TtC6DropIn11AudioPlayer_timeoutTimer] = 0;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v18 = a1;
  v11(v8, a1, v5);
  objc_allocWithZone(MEMORY[0x24BDB1848]);
  v12 = v3;
  v13 = sub_23A74FF68((uint64_t)v8);
  if (v2)
  {
    OUTLINED_FUNCTION_0_0();
    sub_23A74FDDC(*v9);
    v14 = *(void **)&v3[v10];

    type metadata accessor for AudioPlayer();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)&v12[OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer] = v13;

    v15 = (objc_class *)type metadata accessor for AudioPlayer();
    v17.receiver = v12;
    v17.super_class = v15;
    v3 = (char *)objc_msgSendSuper2(&v17, sel_init);
    objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer], sel_setDelegate_, v3);
    OUTLINED_FUNCTION_0_0();
  }
  return v3;
}

uint64_t sub_23A74F5B4(double a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = v1;
  *(double *)(v2 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_23A74F5D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[2];
  v2 = swift_allocObject();
  v0[4] = v2;
  swift_unknownObjectWeakInit();
  v3 = swift_task_alloc();
  v0[5] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_23A74F6A8;
  return sub_23A7697F0();
}

uint64_t sub_23A74F6A8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_23A74F71C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A74F728()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23A74F764(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  id v24;
  char *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;

  v6 = sub_23A76934C();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A80);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v13 = MEMORY[0x23B856B50](a2 + 16);
  if (v13)
  {
    v14 = (char *)v13;
    v15 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    v15((char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
    v16 = *(unsigned __int8 *)(v10 + 80);
    v32 = v8;
    v17 = v9;
    v18 = a1;
    v19 = (v16 + 16) & ~v16;
    v20 = swift_allocObject();
    v21 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 32);
    v21(v20 + v19, v12, v17);
    sub_23A74F414((uint64_t)sub_23A74FE60, v20);
    v31 = v18;
    v15(v12, v18, v17);
    v22 = swift_allocObject();
    v21(v22 + v19, v12, v17);
    v23 = (uint64_t)v32;
    sub_23A769340();
    v24 = objc_allocWithZone((Class)type metadata accessor for OneshotTimer());
    v25 = OneshotTimer.init(timeInterval:queue:identifier:label:timerFiredHandler:)(0, v23, 0x54746F6873656E4FLL, 0xEC00000072656D69, (uint64_t)sub_23A74FF0C, v22, a3);
    sub_23A74F434((uint64_t)v25);
    v26 = OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer;
    if ((objc_msgSend(*(id *)&v14[OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer], sel_play) & 1) == 0)
    {
      sub_23A74F414(0, 0);
      v27 = *(void **)&v14[OBJC_IVAR____TtC6DropIn11AudioPlayer_timeoutTimer];
      if (v27)
      {
        v28 = v27;
        sub_23A766938();

      }
      objc_msgSend(*(id *)&v14[v26], sel_stop);
      sub_23A74FD90();
      v29 = swift_allocError();
      *v30 = 1;
      v33 = v29;
      sub_23A769538();
    }

  }
}

uint64_t sub_23A74FA00(void *a1, char a2)
{
  id v3;

  if ((a2 & 1) != 0)
  {
    v3 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A80);
    return sub_23A769538();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A80);
    return sub_23A769544();
  }
}

uint64_t sub_23A74FA60()
{
  _BYTE *v0;

  sub_23A74FD90();
  swift_allocError();
  *v0 = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A80);
  return sub_23A769538();
}

void sub_23A74FAC4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void (*v4)(_QWORD, _QWORD);

  v1 = v0;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC6DropIn11AudioPlayer_timeoutTimer);
  if (v2)
  {
    v3 = v2;
    sub_23A766938();

  }
  v4 = *(void (**)(_QWORD, _QWORD))(v1 + OBJC_IVAR____TtC6DropIn11AudioPlayer_playHandler);
  if (v4)
  {
    swift_retain();
    v4(0, 0);
    sub_23A74FDDC((uint64_t)v4);
  }
}

void sub_23A74FB90(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  id v6;
  void (*v7)(void *, uint64_t);
  void *v8;
  _BYTE *v9;
  id v10;

  v3 = v2;
  v5 = *(void **)(v2 + OBJC_IVAR____TtC6DropIn11AudioPlayer_timeoutTimer);
  if (v5)
  {
    v6 = v5;
    sub_23A766938();

  }
  v7 = *(void (**)(void *, uint64_t))(v3 + OBJC_IVAR____TtC6DropIn11AudioPlayer_playHandler);
  if (v7)
  {
    if (a2)
    {
      v8 = a2;
    }
    else
    {
      sub_23A74FD90();
      v8 = (void *)swift_allocError();
      *v9 = 0;
    }
    sub_23A74FDCC((uint64_t)v7);
    v10 = a2;
    v7(v8, 1);
    sub_23A74FDDC((uint64_t)v7);

  }
}

void sub_23A74FCBC()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_23A74FCF4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioPlayer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AudioPlayer()
{
  return objc_opt_self();
}

unint64_t sub_23A74FD90()
{
  unint64_t result;

  result = qword_2569B7608;
  if (!qword_2569B7608)
  {
    result = MEMORY[0x23B856A18](&unk_23A76AF8C, &type metadata for AudioPlayer.PlaybackError);
    atomic_store(result, (unint64_t *)&qword_2569B7608);
  }
  return result;
}

uint64_t sub_23A74FDCC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_23A74FDDC(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23A74FDEC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_23A74FE10(uint64_t a1)
{
  uint64_t v1;

  sub_23A74F764(a1, *(_QWORD *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B856A00]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A74FE60(void *a1, char a2)
{
  char v3;

  v3 = a2 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A80);
  OUTLINED_FUNCTION_1_0();
  return sub_23A74FA00(a1, v3);
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A80);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23A74FF0C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A80);
  OUTLINED_FUNCTION_1_0();
  return sub_23A74FA60();
}

id sub_23A74FF68(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  uint64_t v11;
  id v13[2];

  v2 = v1;
  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)sub_23A7692BC();
  v13[0] = 0;
  v5 = objc_msgSend(v2, sel_initWithContentsOfURL_error_, v4, v13);

  v6 = v13[0];
  if (v5)
  {
    v7 = sub_23A7692D4();
    v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
    v9 = v6;
    v8(a1, v7);
  }
  else
  {
    v10 = v13[0];
    sub_23A7692B0();

    swift_willThrow();
    v11 = sub_23A7692D4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioPlayer.PlaybackError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioPlayer.PlaybackError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A750154 + 4 * byte_23A76AF01[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A750188 + 4 * byte_23A76AEFC[v4]))();
}

uint64_t sub_23A750188(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A750190(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A750198);
  return result;
}

uint64_t sub_23A7501A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A7501ACLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A7501B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A7501B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A7501C4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A7501D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AudioPlayer.PlaybackError()
{
  return &type metadata for AudioPlayer.PlaybackError;
}

unint64_t sub_23A7501EC()
{
  unint64_t result;

  result = qword_2569B7618;
  if (!qword_2569B7618)
  {
    result = MEMORY[0x23B856A18](&unk_23A76AF64, &type metadata for AudioPlayer.PlaybackError);
    atomic_store(result, (unint64_t *)&qword_2569B7618);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v1 + 8))(*(_QWORD *)(v2 - 72), v0);
}

uint64_t ActivationState.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0 - 1;
}

DropIn::ActivationState_optional __swiftcall ActivationState.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 12;
  if ((unint64_t)(rawValue + 1) < 0xC)
    v2 = rawValue + 1;
  *v1 = v2;
  return (DropIn::ActivationState_optional)rawValue;
}

void *static ActivationState.allCases.getter()
{
  return &unk_250B96960;
}

unint64_t sub_23A750280()
{
  unint64_t result;

  result = qword_2569B7620;
  if (!qword_2569B7620)
  {
    result = MEMORY[0x23B856A18](&protocol conformance descriptor for ActivationState, &type metadata for ActivationState);
    atomic_store(result, (unint64_t *)&qword_2569B7620);
  }
  return result;
}

uint64_t sub_23A7502BC()
{
  unsigned __int8 *v0;

  return sub_23A75D400(*v0);
}

void sub_23A7502C4()
{
  sub_23A75D428();
}

uint64_t sub_23A7502CC(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_23A75D44C(a1, *v1);
}

DropIn::ActivationState_optional sub_23A7502D4(Swift::Int *a1)
{
  return ActivationState.init(rawValue:)(*a1);
}

uint64_t sub_23A7502DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = ActivationState.rawValue.getter();
  *a1 = result;
  return result;
}

unint64_t sub_23A750304()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B7628;
  if (!qword_2569B7628)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B7630);
    result = MEMORY[0x23B856A18](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2569B7628);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B856A0C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_23A75038C(_QWORD *a1@<X8>)
{
  *a1 = &unk_250B96960;
}

uint64_t getEnumTagSinglePayload for ActivationState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF5)
  {
    if (a2 + 11 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 11) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 12;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v5 = v6 - 12;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivationState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A750470 + 4 * byte_23A76AFD5[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_23A7504A4 + 4 * byte_23A76AFD0[v4]))();
}

uint64_t sub_23A7504A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A7504AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A7504B4);
  return result;
}

uint64_t sub_23A7504C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A7504C8);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_23A7504CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A7504D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for ActivationState()
{
  OUTLINED_FUNCTION_43();
}

void sub_23A7504EC()
{
  uint64_t v0;
  void (*v1)(unint64_t *);
  void *v2;
  void *v3;
  _QWORD *v4;
  id v5;
  unint64_t v6;
  char v7;

  v1 = *(void (**)(unint64_t *))(v0 + 112);
  if (*(_BYTE *)(v0 + 128))
  {
    if (v1)
    {
      v6 = *(unsigned __int8 *)(v0 + 128);
      v7 = 0;
      swift_retain();
      v1(&v6);
      sub_23A74FDDC((uint64_t)v1);
    }
  }
  else if (v1)
  {
    v2 = *(void **)(v0 + 136);
    if (v2)
    {
      v3 = *(void **)(v0 + 136);
    }
    else
    {
      sub_23A7519C8();
      v3 = (void *)swift_allocError();
      *v4 = 0;
      v4[1] = 0;
    }
    v6 = (unint64_t)v3;
    v7 = 1;
    sub_23A74FDCC((uint64_t)v1);
    v5 = v2;
    v1(&v6);
    sub_23A74FDDC((uint64_t)v1);

  }
}

void sub_23A7505D4(char *a1)
{
  OUTLINED_FUNCTION_22(*a1);
}

uint64_t sub_23A7505DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v1 = sub_23A76937C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 136) = 0;
  *(_QWORD *)(v0 + 112) = 0;
  *(_QWORD *)(v0 + 120) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_session) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_startTonePlayer) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_ongoingTonePlayer) = 0;
  sub_23A769370();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_logger, v4, v1);
  *(_BYTE *)(v0 + 128) = 1;
  return v0;
}

uint64_t sub_23A7506D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 112);
  *(_QWORD *)(v2 + 112) = a1;
  *(_QWORD *)(v2 + 120) = a2;
  swift_retain();
  return sub_23A74FDDC(v3);
}

uint64_t sub_23A750708(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6DropIn18AppStateActivation_session) = a1;
  v3 = a1;

  OUTLINED_FUNCTION_22(2);
  return sub_23A750854();
}

uint64_t sub_23A750740(char *a1)
{
  OUTLINED_FUNCTION_22(*a1);
  return sub_23A750854();
}

uint64_t sub_23A750758(void *a1)
{
  uint64_t v1;
  id v2;
  char v4;

  *(_QWORD *)(v1 + 136) = a1;
  v2 = a1;
  OUTLINED_FUNCTION_3();
  v4 = 0;
  return sub_23A750740(&v4);
}

void sub_23A750794()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 136);
  *(_QWORD *)(v0 + 136) = 0;

  v2 = *(void **)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_session) = 0;

  OUTLINED_FUNCTION_22(1);
  OUTLINED_FUNCTION_35(OBJC_IVAR____TtC6DropIn18AppStateActivation_startTonePlayer);
  v3 = OBJC_IVAR____TtC6DropIn18AppStateActivation_ongoingTonePlayer;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_ongoingTonePlayer))
  {
    swift_retain();
    sub_23A763C1C();
    OUTLINED_FUNCTION_34();
  }
  *(_QWORD *)(v0 + v3) = 0;
  swift_release();
  if (qword_2569B7318 != -1)
    swift_once();
  sub_23A752CCC();
}

uint64_t sub_23A750854()
{
  uint64_t v0;

  return ((uint64_t (*)())((char *)sub_23A750870 + 4 * byte_23A76AFDA[*(unsigned __int8 *)(v0 + 128)]))();
}

void sub_23A750874()
{
  OUTLINED_FUNCTION_22(1);
}

uint64_t sub_23A75088C()
{
  uint64_t v0;
  Swift::Int v1;
  char v2;
  char v4;

  v1 = *(unsigned __int8 *)(v0 + 128);
  if (v1 == 11)
  {
    v2 = 11;
  }
  else
  {
    ActivationState.init(rawValue:)(v1);
    v2 = v4;
    if (v4 == 12)
      v2 = 1;
  }
  OUTLINED_FUNCTION_22(v2);
  return sub_23A750854();
}

void sub_23A7508D0()
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
  void *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;

  v7 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A00);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8]();
  v8 = OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_28();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7850);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_38();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_20();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_36();
  static ToneProvider.startToneURL.getter(v9);
  if (__swift_getEnumTagSinglePayload(v6, 1, v3) == 1)
  {
    sub_23A7518A4(v6);
    sub_23A7519C8();
    v10 = (void *)OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_8(v10, v11, 0xD000000000000016);
    v12 = v10;
  }
  else
  {
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_9((__n128)xmmword_23A76B230);
    OUTLINED_FUNCTION_23(v1);
    *(_DWORD *)(v2 + *(int *)(v8 + 28)) = 1065353216;
    if (qword_2569B7318 != -1)
      swift_once();
    v13 = OUTLINED_FUNCTION_42();
    if (!v1)
    {
      *(_QWORD *)(v7 + OBJC_IVAR____TtC6DropIn18AppStateActivation_startTonePlayer) = v13;
      OUTLINED_FUNCTION_19();
      swift_release();
      v16 = OUTLINED_FUNCTION_39();
      OUTLINED_FUNCTION_18(v5, v17, v18, v16);
      v19 = (_QWORD *)OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_14(v19);
      OUTLINED_FUNCTION_40();
      swift_release();
      OUTLINED_FUNCTION_34();
      OUTLINED_FUNCTION_41();
      OUTLINED_FUNCTION_23(v4);
      goto LABEL_8;
    }
    OUTLINED_FUNCTION_21(OBJC_IVAR____TtC6DropIn18AppStateActivation_startTonePlayer);
    sub_23A7519C8();
    v14 = (void *)OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_8(v14, v15, 0xD000000000000022);
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_23(v4);
    v12 = v14;
  }

LABEL_8:
  OUTLINED_FUNCTION_16();
}

uint64_t sub_23A750AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_23A750B0C()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_2569B7318 != -1)
    swift_once();
  sub_23A752BEC();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_23A750C0C;
  return sub_23A763A40();
}

uint64_t sub_23A750C0C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_23A750C68()
{
  uint64_t v0;

  OUTLINED_FUNCTION_37();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A750C8C()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;

  *(_QWORD *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR____TtC6DropIn18AppStateActivation_startTonePlayer) = 0;
  swift_release();
  sub_23A752CCC();
  sub_23A7519C8();
  v1 = (void *)OUTLINED_FUNCTION_6();
  *v2 = 0xD000000000000019;
  v2[1] = 0x800000023A76CAD0;
  sub_23A750758(v1);

  OUTLINED_FUNCTION_3();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23A750D2C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  id v9;
  void *v10;
  _OWORD *v11;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A00);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2569B7310 != -1)
    swift_once();
  if ((byte_2569B9D60 & 1) == 0)
  {
    v3 = *(void **)(v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
    if (v3)
    {
      v4 = OUTLINED_FUNCTION_39();
      v7 = OUTLINED_FUNCTION_18((uint64_t)v2, v5, v6, v4);
      v8 = (_QWORD *)OUTLINED_FUNCTION_17();
      v8[2] = v0;
      v8[3] = v7;
      v8[4] = v3;
      v8[5] = v0;
      OUTLINED_FUNCTION_19();
      v9 = v3;
      sub_23A758694();
      swift_release();
    }
    else
    {
      sub_23A7519C8();
      v10 = (void *)OUTLINED_FUNCTION_6();
      *v11 = xmmword_23A76B240;
      sub_23A750758(v10);

    }
  }
}

uint64_t sub_23A750E60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 120) = a4;
  *(_QWORD *)(v5 + 128) = a5;
  return swift_task_switch();
}

uint64_t sub_23A750E78()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)v0[15];
  v0[2] = v0;
  v0[3] = sub_23A750F04;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_23A75D47C;
  v3[3] = &block_descriptor;
  v3[4] = v2;
  objc_msgSend(v1, sel_startWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_23A750F04()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_32();
  *v1 = *v0;
  *(_QWORD *)(v2 + 136) = *(_QWORD *)(v2 + 48);
  return swift_task_switch();
}

uint64_t sub_23A750F5C()
{
  uint64_t v0;
  id v1;
  void *v2;
  os_log_type_t v3;
  void *v4;
  _DWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v11;

  v1 = *(id *)(v0 + 120);
  v2 = (void *)sub_23A769364();
  v3 = sub_23A7695E0();
  if (OUTLINED_FUNCTION_10(v3))
  {
    v4 = *(void **)(v0 + 120);
    v5 = (_DWORD *)OUTLINED_FUNCTION_7();
    v11 = (_QWORD *)OUTLINED_FUNCTION_7();
    *v5 = 138412290;
    *(_QWORD *)(v0 + 80) = v4;
    v6 = v4;
    sub_23A7696D0();
    *v11 = v4;

    OUTLINED_FUNCTION_26(&dword_23A742000, v7, v8, "Drop in session start issued: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }
  v9 = *(void **)(v0 + 120);

  return OUTLINED_FUNCTION_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A75108C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  void *v4;
  _DWORD *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v1 = *(_QWORD *)(v0 + 128);
  swift_willThrow();
  v2 = (void *)(v1 + OBJC_IVAR____TtC6DropIn18AppStateActivation_logger);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_24();
  sub_23A769364();
  v3 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_10(v3))
  {
    v4 = *(void **)(v0 + 136);
    v5 = (_DWORD *)OUTLINED_FUNCTION_7();
    v6 = (_QWORD *)OUTLINED_FUNCTION_7();
    *v5 = 138412290;
    v7 = v4;
    v8 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 80) = v8;
    sub_23A7696D0();
    *v6 = v8;

    OUTLINED_FUNCTION_26(&dword_23A742000, v9, v10, "Failed to start Drop In session. Error: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3();
  v11 = *(void **)(v0 + 136);
  sub_23A750794();
  sub_23A750758(v11);
  OUTLINED_FUNCTION_3();
  return OUTLINED_FUNCTION_4(*(uint64_t (**)(void))(v0 + 8));
}

void sub_23A7511D8()
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
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;

  v7 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A00);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8]();
  v8 = OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_28();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7850);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_38();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_20();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_36();
  static ToneProvider.ongoingToneURL.getter(v9);
  if (__swift_getEnumTagSinglePayload(v6, 1, v3) == 1)
  {
    sub_23A7518A4(v6);
    v10 = (v7 + OBJC_IVAR____TtC6DropIn18AppStateActivation_logger);
    sub_23A769364();
    v11 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_10(v11))
    {
      v12 = (uint8_t *)OUTLINED_FUNCTION_7();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_23A742000, v10, (os_log_type_t)v1, "Invalid ongoing tone URL", v12, 2u);
      OUTLINED_FUNCTION_0_1();
    }

    sub_23A75088C();
  }
  else
  {
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_9((__n128)xmmword_23A76B250);
    OUTLINED_FUNCTION_23(v1);
    *(_DWORD *)(v2 + *(int *)(v8 + 28)) = 1065353216;
    if (qword_2569B7318 != -1)
      swift_once();
    v13 = OUTLINED_FUNCTION_42();
    if (v1)
    {
      OUTLINED_FUNCTION_21(OBJC_IVAR____TtC6DropIn18AppStateActivation_ongoingTonePlayer);
      v14 = (v7 + OBJC_IVAR____TtC6DropIn18AppStateActivation_logger);
      OUTLINED_FUNCTION_44();
      OUTLINED_FUNCTION_44();
      sub_23A769364();
      v15 = OUTLINED_FUNCTION_30();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)OUTLINED_FUNCTION_7();
        v21 = (_QWORD *)OUTLINED_FUNCTION_7();
        *(_DWORD *)v16 = 138412290;
        OUTLINED_FUNCTION_44();
        v22 = _swift_stdlib_bridgeErrorToNSError();
        sub_23A7696D0();
        *v21 = v22;
        OUTLINED_FUNCTION_13();
        OUTLINED_FUNCTION_13();
        _os_log_impl(&dword_23A742000, v14, v15, "Failed to create ongoing tone player: %@", v16, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
        OUTLINED_FUNCTION_33();
        OUTLINED_FUNCTION_0_1();
      }

      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_13();
      sub_23A75088C();
      OUTLINED_FUNCTION_13();
    }
    else
    {
      *(_QWORD *)(v7 + OBJC_IVAR____TtC6DropIn18AppStateActivation_ongoingTonePlayer) = v13;
      OUTLINED_FUNCTION_19();
      swift_release();
      v17 = OUTLINED_FUNCTION_39();
      OUTLINED_FUNCTION_18(v5, v18, v19, v17);
      v20 = (_QWORD *)OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_14(v20);
      OUTLINED_FUNCTION_40();
      swift_release();
      OUTLINED_FUNCTION_34();
    }
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_23(v4);
  }
  OUTLINED_FUNCTION_16();
}

uint64_t sub_23A7514FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  *(_QWORD *)(v5 + 24) = a5;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 32) = v6;
  *v6 = v5;
  v6[1] = sub_23A751548;
  return sub_23A763A40();
}

uint64_t sub_23A751548()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_32();
  *v2 = *v1;
  *(_QWORD *)(v3 + 40) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_23A75159C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 24);
  OUTLINED_FUNCTION_35(OBJC_IVAR____TtC6DropIn18AppStateActivation_ongoingTonePlayer);
  v2 = (v1 + OBJC_IVAR____TtC6DropIn18AppStateActivation_logger);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_24();
  sub_23A769364();
  v3 = OUTLINED_FUNCTION_30();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)OUTLINED_FUNCTION_7();
    v5 = (_QWORD *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v4 = 138412290;
    OUTLINED_FUNCTION_24();
    v6 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v6;
    sub_23A7696D0();
    *v5 = v6;
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    _os_log_impl(&dword_23A742000, v2, v3, "Failed to schedule ongoing tone: %@", v4, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }
  OUTLINED_FUNCTION_3();

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_37();
  return OUTLINED_FUNCTION_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A7516FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23A74FDDC(*(_QWORD *)(v0 + 112));

  v1 = v0 + OBJC_IVAR____TtC6DropIn18AppStateActivation_logger;
  v2 = sub_23A76937C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_23A751788()
{
  sub_23A7516FC();
  return swift_defaultActor_deallocate();
}

uint64_t sub_23A7517A0()
{
  return type metadata accessor for AppStateActivation();
}

uint64_t type metadata accessor for AppStateActivation()
{
  uint64_t result;

  result = qword_2569B7670;
  if (!qword_2569B7670)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A7517E0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A76937C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_23A751878()
{
  OUTLINED_FUNCTION_43();
}

void sub_23A751880()
{
  sub_23A751878();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_23A7518A4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7850);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A7518E4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DropInPlayer.Settings(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

unint64_t sub_23A75192C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B7868;
  if (!qword_2569B7868)
  {
    v1 = type metadata accessor for AppStateActivation();
    result = MEMORY[0x23B856A18](&unk_23A76B1A8, v1);
    atomic_store(result, (unint64_t *)&qword_2569B7868);
  }
  return result;
}

uint64_t sub_23A751970()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_29();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_1_1(v1);
  return sub_23A7514FC(v2, v3, v4, v5, v6);
}

unint64_t sub_23A7519C8()
{
  unint64_t result;

  result = qword_2569B7878;
  if (!qword_2569B7878)
  {
    result = MEMORY[0x23B856A18](&unk_23A76B1E8, &unk_250B96EE8);
    atomic_store(result, &qword_2569B7878);
  }
  return result;
}

uint64_t sub_23A751A04()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A751A38()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_29();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_1_1(v1);
  return sub_23A750E60(v2, v3, v4, v5, v6);
}

uint64_t sub_23A751A90()
{
  uint64_t *v0;
  uint64_t v2;

  OUTLINED_FUNCTION_32();
  v2 = *v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A751B00()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_29();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_1_1(v1);
  return sub_23A750AF4(v2, v3, v4, v5, v6);
}

unint64_t sub_23A751B5C(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23A751B74(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *sub_23A751BBC(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23A751C68(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23A751CC8(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t sub_23A751D1C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

uint64_t sub_23A751D78(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23A751D90(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

void type metadata accessor for AppStateActivationError()
{
  OUTLINED_FUNCTION_43();
}

void OUTLINED_FUNCTION_0_1()
{
  JUMPOUT(0x23B856ACCLL);
}

uint64_t OUTLINED_FUNCTION_1_1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

void OUTLINED_FUNCTION_3()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_5(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_8@<X0>(void *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  *a2 = a3;
  a2[1] = (v3 - 32) | 0x8000000000000000;
  return sub_23A750758(a1);
}

uint64_t OUTLINED_FUNCTION_9(__n128 a1)
{
  uint64_t v1;
  uint64_t v2;
  __n128 *v3;
  uint64_t v4;
  uint64_t (*v5)(char *, uint64_t, uint64_t);

  *v3 = a1;
  v3[1].n128_u64[0] = 0x4014000000000000;
  return v5((char *)v3 + *(int *)(v1 + 24), v2, v4);
}

BOOL OUTLINED_FUNCTION_10(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return sub_23A7692D4();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return type metadata accessor for DropInPlayer.Settings(0);
}

void OUTLINED_FUNCTION_13()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_14(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  a1[2] = v1;
  a1[3] = v3;
  a1[4] = v2;
  a1[5] = v1;
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return swift_allocObject();
}

unint64_t OUTLINED_FUNCTION_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
  return sub_23A75192C();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_21@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + a1) = 0;
  return swift_release();
}

void OUTLINED_FUNCTION_22(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 128) = a1;
  sub_23A7504EC();
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

id OUTLINED_FUNCTION_24()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v2, v1);
}

void OUTLINED_FUNCTION_26(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  NSObject *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_27()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_30()
{
  return sub_23A7695D4();
}

void OUTLINED_FUNCTION_32()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_35@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + a1) = 0;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return sub_23A75088C();
}

uint64_t OUTLINED_FUNCTION_39()
{
  return sub_23A769568();
}

void OUTLINED_FUNCTION_40()
{
  sub_23A758694();
}

uint64_t OUTLINED_FUNCTION_41()
{
  uint64_t v0;

  return sub_23A7518E4(v0);
}

uint64_t OUTLINED_FUNCTION_42()
{
  uint64_t v0;

  return sub_23A7524F0(v0);
}

id OUTLINED_FUNCTION_44()
{
  void *v0;

  return v0;
}

uint64_t sub_23A75205C()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v1 = objc_msgSend(v0, sel_processName);

  v2 = sub_23A76949C();
  v4 = v3;

  if (v2 == 0x747365746378 && v4 == 0xE600000000000000)
  {
    result = swift_bridgeObjectRelease();
    v6 = 1;
  }
  else
  {
    v6 = sub_23A7697E4();
    result = swift_bridgeObjectRelease();
  }
  byte_2569B9D60 = v6 & 1;
  return result;
}

uint64_t sub_23A752134()
{
  uint64_t v0;

  swift_weakInit();
  swift_weakAssign();
  swift_release();
  return v0;
}

uint64_t sub_23A752170()
{
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

void sub_23A752194()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v1 = *(void **)(v0 + 48);
  if (!v1)
  {
    v2 = v0;
    v3 = sub_23A74F260();
    v4 = *(void **)(v0 + 48);
    *(_QWORD *)(v2 + 48) = v3;
    v5 = v3;

    v1 = 0;
  }
  v6 = v1;
  OUTLINED_FUNCTION_0();
}

void sub_23A7521E4()
{
  type metadata accessor for DropInPlayerManager();
  swift_allocObject();
  qword_2569B78A0 = (uint64_t)sub_23A752258();
  OUTLINED_FUNCTION_0();
}

uint64_t static DropInPlayerManager.shared.getter()
{
  if (qword_2569B7318 != -1)
    swift_once();
  return swift_retain();
}

_QWORD *sub_23A752258()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = v0;
  v2 = sub_23A769628();
  v11 = *(_QWORD *)(v2 - 8);
  v12 = v2;
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A769604();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8]();
  sub_23A769400();
  MEMORY[0x24BDAC7A8]();
  v0[6] = 0;
  v5 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v6 = (void *)*MEMORY[0x24BDB1590];
  v1[2] = v5;
  v1[3] = v6;
  v7 = MEMORY[0x24BEE4AF8];
  v1[4] = MEMORY[0x24BEE4AF8];
  sub_23A754980(0, (unint64_t *)&qword_2542D4A90);
  v8 = v6;
  sub_23A74F1D0();
  sub_23A7693F4();
  v13 = v7;
  sub_23A7549B8(&qword_2569B7AA0, v4, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7AA8);
  sub_23A7549F4(&qword_2569B7AB0, &qword_2569B7AA8);
  sub_23A7696F4();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v10, *MEMORY[0x24BEE5750], v12);
  v1[5] = sub_23A76964C();
  sub_23A753BB8();
  return v1;
}

id *DropInPlayerManager.deinit()
{
  id *v0;

  sub_23A7540B0();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DropInPlayerManager.__deallocating_deinit()
{
  DropInPlayerManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_23A7524F0(uint64_t a1)
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
  uint64_t v12;
  void *v13;
  NSObject *v14;
  char v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char isEscapingClosureAtFileLocation;
  _QWORD aBlock[6];

  v3 = v1;
  type metadata accessor for DropInPlayer.Settings(0);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_2();
  v7 = v6 - v5;
  v8 = sub_23A769430();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_2();
  v12 = v11 - v10;
  v13 = *(void **)(v3 + 40);
  *(_QWORD *)(v11 - v10) = v13;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 104))(v11 - v10, *MEMORY[0x24BEE5608], v8);
  v14 = v13;
  v15 = sub_23A769448();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);
  if ((v15 & 1) != 0)
  {
    sub_23A754150(a1, v7);
    type metadata accessor for DropInPlayer(0);
    swift_allocObject();
    v17 = sub_23A7637D0(v7);
    if (v2)
      return v17;
    sub_23A7638E8(*(_QWORD *)(v3 + 16), 0);
    v18 = OUTLINED_FUNCTION_4_0();
    *(_QWORD *)(v18 + 16) = v3;
    *(_QWORD *)(v18 + 24) = v17;
    v19 = OUTLINED_FUNCTION_4_0();
    *(_QWORD *)(v19 + 16) = sub_23A7541C0;
    *(_QWORD *)(v19 + 24) = v18;
    aBlock[4] = sub_23A7541D8;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23A752BD0;
    aBlock[3] = &block_descriptor_0;
    v20 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v14, v20);
    _Block_release(v20);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
      return v17;
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23A75273C(uint64_t a1)
{
  unint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int isUniquelyReferenced_nonNull_bridgeObject;
  int v18;
  uint64_t v20;
  uint64_t v21;

  v2 = (unint64_t *)(a1 + 32);
  swift_beginAccess();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 >> 62)
  {
LABEL_67:
    swift_bridgeObjectRetain();
    v4 = sub_23A76979C();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease();
    if (*v2 >> 62)
      goto LABEL_71;
    v5 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_12;
  }
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v4)
    goto LABEL_10;
LABEL_3:
  v5 = 0;
  while (1)
  {
    if ((v3 & 0xC000000000000001) != 0)
      MEMORY[0x23B8563B8](v5, v3);
    else
      swift_retain();
    Strong = swift_weakLoadStrong();
    swift_release();
    swift_release();
    if (!Strong)
      break;
    v7 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
LABEL_61:
      __break(1u);
LABEL_62:
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    ++v5;
    if (v7 == v4)
      goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  if (__OFADD__(v5, 1))
  {
    __break(1u);
  }
  else
  {
    v3 = *v2;
    if (!(*v2 >> 62))
    {
      v10 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_19;
    }
  }
  swift_bridgeObjectRetain();
  v10 = sub_23A76979C();
  swift_bridgeObjectRelease();
LABEL_19:
  if (v5 + 1 != v10)
  {
    v11 = v5 + 5;
    do
    {
      v12 = v11 - 4;
      v13 = *v2;
      if ((*v2 & 0xC000000000000001) != 0)
      {
        v3 = MEMORY[0x23B8563B8](v11 - 4);
      }
      else
      {
        if ((v12 & 0x8000000000000000) != 0)
          goto LABEL_57;
        if (v12 >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_58;
        v3 = *(_QWORD *)(v13 + 8 * v11);
        swift_retain();
      }
      v14 = swift_weakLoadStrong();
      swift_release();
      swift_release();
      if (v14)
      {
        if (v12 != v5)
        {
          v3 = *v2;
          if ((*v2 & 0xC000000000000001) != 0)
          {
            v15 = MEMORY[0x23B8563B8](v5, *v2);
            v3 = *v2;
          }
          else
          {
            if (v5 < 0)
              goto LABEL_61;
            if ((unint64_t)v5 >= *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_62;
            v15 = *(_QWORD *)(v3 + 8 * v5 + 32);
            swift_retain();
          }
          if ((v3 & 0xC000000000000001) != 0)
          {
            v16 = MEMORY[0x23B8563B8](v11 - 4, v3);
            v3 = *v2;
          }
          else
          {
            if ((v12 & 0x8000000000000000) != 0)
              goto LABEL_63;
            if (v12 >= *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_64;
            v16 = *(_QWORD *)(v3 + 8 * v11);
            swift_retain();
          }
          isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
          *v2 = v3;
          if (!isUniquelyReferenced_nonNull_bridgeObject
            || (v3 & 0x8000000000000000) != 0
            || (v3 & 0x4000000000000000) != 0)
          {
            sub_23A754910(v3);
          }
          *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20) = v16;
          swift_release();
          sub_23A769508();
          v3 = *v2;
          v18 = swift_isUniquelyReferenced_nonNull_bridgeObject();
          *v2 = v3;
          if (!v18 || (v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
            sub_23A754910(v3);
          if ((v12 & 0x8000000000000000) != 0)
            goto LABEL_65;
          if (v12 >= *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_66;
          *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 8 * v11) = v15;
          swift_release();
          v3 = (unint64_t)v2;
          sub_23A769508();
        }
        if (__OFADD__(v5++, 1))
          goto LABEL_60;
      }
      v20 = v11 - 3;
      if (__OFADD__(v12, 1))
        goto LABEL_59;
      v3 = *v2;
      if (*v2 >> 62)
      {
        swift_bridgeObjectRetain();
        v21 = sub_23A76979C();
        swift_bridgeObjectRelease();
      }
      else
      {
        v21 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      ++v11;
    }
    while (v20 != v21);
  }
  while (1)
  {
LABEL_12:
    if (*v2 >> 62)
    {
      swift_bridgeObjectRetain();
      v8 = sub_23A76979C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    if (v8 >= v5)
      break;
    __break(1u);
LABEL_71:
    swift_bridgeObjectRetain();
    v5 = sub_23A76979C();
    swift_bridgeObjectRelease();
  }
  sub_23A754694(v5, v8);
  type metadata accessor for DropInPlayerManager.WeakDropInPlayer();
  swift_allocObject();
  swift_retain();
  sub_23A752134();
  MEMORY[0x23B856154]();
  sub_23A758408(*(_QWORD *)((*v2 & 0xFFFFFFFFFFFFF8) + 0x10));
  sub_23A769520();
  sub_23A769508();
  return swift_endAccess();
}

void sub_23A752BB4(void (*a1)(void))
{
  a1();
  OUTLINED_FUNCTION_0();
}

void sub_23A752BD0(uint64_t a1)
{
  (*(void (**)(void))(a1 + 32))();
  OUTLINED_FUNCTION_0();
}

void sub_23A752BEC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4[2];

  v4[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (qword_2569B7310 != -1)
    swift_once();
  if ((byte_2569B9D60 & 1) == 0)
  {
    sub_23A753A58();
    v1 = *(void **)(v0 + 16);
    v4[0] = 0;
    if (objc_msgSend(v1, sel_setActive_error_, 1, v4))
    {
      v2 = v4[0];
    }
    else
    {
      v3 = v4[0];
      sub_23A7692B0();

      swift_willThrow();
    }
  }
}

void sub_23A752CCC()
{
  uint64_t v0;
  void *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (qword_2569B7310 != -1)
    swift_once();
  if ((byte_2569B9D60 & 1) == 0)
  {
    v1 = *(void **)(v0 + 16);
    if (objc_msgSend(v1, sel_isActive))
    {
      v11[0] = 0;
      if (objc_msgSend(v1, sel_setActive_withOptions_error_, 0, 0, v11))
      {
        v8 = v11[0];
      }
      else
      {
        OUTLINED_FUNCTION_7_0(0, v11[0], v2, v3, v4, v5, v6, v7, v10);
        v9 = (void *)OUTLINED_FUNCTION_8_0();

        swift_willThrow();
      }
    }
  }
}

uint64_t sub_23A752DE0()
{
  return sub_23A753318((uint64_t)sub_23A754978, (uint64_t)&block_descriptor_21);
}

uint64_t sub_23A752DF4()
{
  unint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t Strong;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int isUniquelyReferenced_nonNull_bridgeObject;
  int v17;
  uint64_t v19;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
    return result;
  v2 = result;
  v3 = (uint64_t *)(result + 32);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 + 32);
  if (v4 >> 62)
    goto LABEL_79;
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_23A76979C())
  {
    v6 = 0;
    while (1)
    {
      if ((v4 & 0xC000000000000001) != 0)
      {
        v0 = MEMORY[0x23B8563B8](v6, v4);
      }
      else
      {
        v0 = *(_QWORD *)(v4 + 8 * v6 + 32);
        swift_retain();
      }
      Strong = swift_weakLoadStrong();
      swift_release();
      swift_release();
      if (!Strong)
      {
        swift_bridgeObjectRelease();
        v0 = v6 + 1;
        if (!__OFADD__(v6, 1))
        {
          if (!((unint64_t)*v3 >> 62))
          {
            v12 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
            goto LABEL_31;
          }
          goto LABEL_91;
        }
        goto LABEL_90;
      }
      v8 = v6 + 1;
      if (__OFADD__(v6, 1))
        break;
      ++v6;
      if (v8 == v5)
        goto LABEL_11;
    }
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  if ((unint64_t)*v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_23A76979C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  while (1)
  {
    if ((unint64_t)*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      v9 = sub_23A76979C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v9 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    if (v9 < v6)
    {
      __break(1u);
    }
    else
    {
      sub_23A754694(v6, v9);
      swift_endAccess();
      v6 = *v3;
      if (!((unint64_t)*v3 >> 62))
      {
        v10 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n();
        if (!v10)
          goto LABEL_26;
        goto LABEL_18;
      }
    }
    if (v6 < 0)
      v3 = (uint64_t *)v6;
    else
      v3 = (uint64_t *)(v6 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain_n();
    v10 = sub_23A76979C();
    if (!v10)
      goto LABEL_26;
LABEL_18:
    if (v10 >= 1)
      break;
    __break(1u);
LABEL_90:
    __break(1u);
LABEL_91:
    swift_bridgeObjectRetain();
    v12 = sub_23A76979C();
    swift_bridgeObjectRelease();
LABEL_31:
    if (v0 != v12)
    {
      v13 = v6 + 5;
      do
      {
        v4 = v13 - 4;
        if ((*v3 & 0xC000000000000001) != 0)
        {
          MEMORY[0x23B8563B8](v13 - 4);
        }
        else
        {
          if ((v4 & 0x8000000000000000) != 0)
            goto LABEL_69;
          if (v4 >= *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_70;
          swift_retain();
        }
        v0 = swift_weakLoadStrong();
        swift_release();
        swift_release();
        if (v0)
        {
          if (v4 != v6)
          {
            v0 = *v3;
            if ((*v3 & 0xC000000000000001) != 0)
            {
              v14 = MEMORY[0x23B8563B8](v6, *v3);
              v0 = *v3;
            }
            else
            {
              if (v6 < 0)
                goto LABEL_73;
              if ((unint64_t)v6 >= *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10))
                goto LABEL_74;
              v14 = *(_QWORD *)(v0 + 8 * v6 + 32);
              swift_retain();
            }
            if ((v0 & 0xC000000000000001) != 0)
            {
              v15 = MEMORY[0x23B8563B8](v13 - 4, v0);
              v0 = *v3;
            }
            else
            {
              if ((v4 & 0x8000000000000000) != 0)
                goto LABEL_75;
              if (v4 >= *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10))
                goto LABEL_76;
              v15 = *(_QWORD *)(v0 + 8 * v13);
              swift_retain();
            }
            isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
            *v3 = v0;
            if (!isUniquelyReferenced_nonNull_bridgeObject
              || (v0 & 0x8000000000000000) != 0
              || (v0 & 0x4000000000000000) != 0)
            {
              sub_23A754910(v0);
            }
            *(_QWORD *)((v0 & 0xFFFFFFFFFFFFFF8) + 8 * v6 + 0x20) = v15;
            swift_release();
            sub_23A769508();
            v0 = *v3;
            v17 = swift_isUniquelyReferenced_nonNull_bridgeObject();
            *v3 = v0;
            if (!v17 || (v0 & 0x8000000000000000) != 0 || (v0 & 0x4000000000000000) != 0)
              sub_23A754910(v0);
            if ((v4 & 0x8000000000000000) != 0)
              goto LABEL_77;
            if (v4 >= *(_QWORD *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_78;
            *(_QWORD *)((v0 & 0xFFFFFFFFFFFFFF8) + 8 * v13) = v14;
            swift_release();
            sub_23A769508();
          }
          if (__OFADD__(v6++, 1))
            goto LABEL_72;
        }
        v0 = v13 - 3;
        if (__OFADD__(v4, 1))
          goto LABEL_71;
        if ((unint64_t)*v3 >> 62)
        {
          swift_bridgeObjectRetain();
          v19 = sub_23A76979C();
          swift_bridgeObjectRelease();
        }
        else
        {
          v19 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        ++v13;
      }
      while (v0 != v19);
    }
  }
  for (i = 0; i != v10; ++i)
  {
    if ((v6 & 0xC000000000000001) != 0)
      MEMORY[0x23B8563B8](i, v6);
    else
      swift_retain();
    if (swift_weakLoadStrong())
    {
      sub_23A763C1C();
      swift_release();
    }
    swift_release();
  }
LABEL_26:
  swift_release();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_23A753304()
{
  return sub_23A753318((uint64_t)sub_23A7545AC, (uint64_t)&block_descriptor_17);
}

uint64_t sub_23A753318(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  _QWORD aBlock[6];

  v4 = sub_23A7693DC();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v17 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_2();
  v8 = v7 - v6;
  v9 = sub_23A769400();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_2();
  v13 = v12 - v11;
  v14 = OUTLINED_FUNCTION_1_2();
  swift_weakInit();
  aBlock[4] = a1;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A754D58;
  aBlock[3] = a2;
  v15 = _Block_copy(aBlock);
  swift_retain();
  sub_23A7693E8();
  sub_23A7549B8((unint64_t *)&qword_2542D4A60, v5, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A70);
  sub_23A7549F4((unint64_t *)&qword_2542D4A78, &qword_2542D4A70);
  sub_23A7696F4();
  MEMORY[0x23B8562BC](0, v13, v8, v15);
  _Block_release(v15);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v8, v4);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
  swift_release();
  return swift_release();
}

uint64_t sub_23A7534FC()
{
  uint64_t result;
  uint64_t v1;
  unint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int isUniquelyReferenced_nonNull_bridgeObject;
  unint64_t v19;
  int v20;
  uint64_t v22;
  uint64_t v23;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    v2 = (unint64_t *)(result + 32);
    swift_beginAccess();
    v3 = *(_QWORD *)(v1 + 32);
    if (v3 >> 62)
      goto LABEL_80;
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_4;
LABEL_11:
    swift_bridgeObjectRelease();
    if (*v2 >> 62)
    {
      swift_bridgeObjectRetain();
      v5 = sub_23A76979C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v5 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    while (1)
    {
      v3 = *v2;
      if (*v2 >> 62)
      {
        swift_bridgeObjectRetain();
        v8 = sub_23A76979C();
        swift_bridgeObjectRelease();
      }
      else
      {
        v8 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      if (v8 < v5)
      {
        __break(1u);
      }
      else
      {
        sub_23A754694(v5, v8);
        swift_endAccess();
        v3 = *v2;
        if (!(*v2 >> 62))
        {
          v9 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain_n();
          swift_retain();
          if (!v9)
            goto LABEL_26;
          goto LABEL_18;
        }
      }
      swift_bridgeObjectRetain_n();
      swift_retain();
      v9 = sub_23A76979C();
      if (!v9)
      {
LABEL_26:
        swift_release_n();
        return swift_bridgeObjectRelease_n();
      }
LABEL_18:
      v10 = 4;
      while (1)
      {
        v2 = (unint64_t *)(v10 - 4);
        if ((v3 & 0xC000000000000001) != 0)
          MEMORY[0x23B8563B8](v10 - 4, v3);
        else
          swift_retain();
        v11 = v10 - 3;
        if (__OFADD__(v2, 1))
          break;
        if (swift_weakLoadStrong())
        {
          sub_23A7638E8(*(_QWORD *)(v1 + 16), 1);
          swift_release();
        }
        swift_release();
        ++v10;
        if (v11 == v9)
          goto LABEL_26;
      }
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
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
      swift_bridgeObjectRetain();
      v4 = sub_23A76979C();
      if (!v4)
        goto LABEL_11;
LABEL_4:
      v5 = 0;
      while (1)
      {
        if ((v3 & 0xC000000000000001) != 0)
          MEMORY[0x23B8563B8](v5, v3);
        else
          swift_retain();
        Strong = swift_weakLoadStrong();
        swift_release();
        swift_release();
        if (!Strong)
          break;
        v7 = v5 + 1;
        if (__OFADD__(v5, 1))
          goto LABEL_69;
        ++v5;
        if (v7 == v4)
          goto LABEL_11;
      }
      swift_bridgeObjectRelease();
      if (__OFADD__(v5, 1))
      {
        __break(1u);
LABEL_88:
        swift_bridgeObjectRetain();
        v12 = sub_23A76979C();
        swift_bridgeObjectRelease();
        goto LABEL_31;
      }
      if (*v2 >> 62)
        goto LABEL_88;
      v12 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_31:
      if (v5 + 1 != v12)
      {
        v13 = v5 + 5;
        do
        {
          v3 = v13 - 4;
          if ((*v2 & 0xC000000000000001) != 0)
          {
            MEMORY[0x23B8563B8](v13 - 4);
          }
          else
          {
            if ((v3 & 0x8000000000000000) != 0)
              goto LABEL_70;
            if (v3 >= *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_71;
            swift_retain();
          }
          v14 = swift_weakLoadStrong();
          swift_release();
          swift_release();
          if (v14)
          {
            if (v3 != v5)
            {
              v15 = *v2;
              if ((*v2 & 0xC000000000000001) != 0)
              {
                v16 = MEMORY[0x23B8563B8](v5, *v2);
                v15 = *v2;
              }
              else
              {
                if (v5 < 0)
                  goto LABEL_74;
                if ((unint64_t)v5 >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
                  goto LABEL_75;
                v16 = *(_QWORD *)(v15 + 8 * v5 + 32);
                swift_retain();
              }
              if ((v15 & 0xC000000000000001) != 0)
              {
                v17 = MEMORY[0x23B8563B8](v13 - 4, v15);
                v15 = *v2;
              }
              else
              {
                if ((v3 & 0x8000000000000000) != 0)
                  goto LABEL_76;
                if (v3 >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
                  goto LABEL_77;
                v17 = *(_QWORD *)(v15 + 8 * v13);
                swift_retain();
              }
              isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
              *v2 = v15;
              if (!isUniquelyReferenced_nonNull_bridgeObject
                || (v15 & 0x8000000000000000) != 0
                || (v15 & 0x4000000000000000) != 0)
              {
                sub_23A754910(v15);
              }
              *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20) = v17;
              swift_release();
              sub_23A769508();
              v19 = *v2;
              v20 = swift_isUniquelyReferenced_nonNull_bridgeObject();
              *v2 = v19;
              if (!v20 || (v19 & 0x8000000000000000) != 0 || (v19 & 0x4000000000000000) != 0)
                sub_23A754910(v19);
              if ((v3 & 0x8000000000000000) != 0)
                goto LABEL_78;
              if (v3 >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
                goto LABEL_79;
              *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 8 * v13) = v16;
              swift_release();
              sub_23A769508();
            }
            if (__OFADD__(v5++, 1))
              goto LABEL_73;
          }
          v22 = v13 - 3;
          if (__OFADD__(v3, 1))
            goto LABEL_72;
          if (*v2 >> 62)
          {
            swift_bridgeObjectRetain();
            v23 = sub_23A76979C();
            swift_bridgeObjectRelease();
          }
          else
          {
            v23 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFF8) + 0x10);
          }
          ++v13;
        }
        while (v22 != v23);
      }
    }
  }
  return result;
}

void sub_23A753A58()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19[2];

  v19[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = *(void **)(v0 + 16);
  v2 = objc_msgSend(v1, sel_category);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = sub_23A76949C();
  v6 = v5;
  if (v4 == sub_23A76949C() && v6 == v7)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v9 = sub_23A7697E4();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      v19[0] = 0;
      if (objc_msgSend(v1, sel_setCategory_error_, v3, v19))
      {
        v16 = v19[0];
      }
      else
      {
        OUTLINED_FUNCTION_7_0(0, v19[0], v10, v11, v12, v13, v14, v15, v18);
        v17 = (void *)OUTLINED_FUNCTION_8_0();

        swift_willThrow();
      }
    }
  }
}

void sub_23A753BB8()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_defaultCenter);
  v3 = *MEMORY[0x24BDB15D8];
  v4 = *(_QWORD *)(v0 + 16);
  sub_23A752194();
  v6 = v5;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5_0();
  v7 = OUTLINED_FUNCTION_9_0((uint64_t)&block_descriptor_9, MEMORY[0x24BDAC760], 1107296256, v15, v17);
  swift_release();
  v8 = objc_msgSend(v2, sel_addObserverForName_object_queue_usingBlock_, v3, v4, v6, v7);
  _Block_release(v7);
  swift_unknownObjectRelease();

  v9 = objc_msgSend(v1, sel_defaultCenter);
  v10 = *MEMORY[0x24BDB1610];
  sub_23A752194();
  v12 = v11;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5_0();
  v13 = OUTLINED_FUNCTION_9_0((uint64_t)&block_descriptor_13, MEMORY[0x24BDAC760], 1107296256, v16, v18);
  swift_release();
  v14 = objc_msgSend(v9, sel_addObserverForName_object_queue_usingBlock_, v10, v4, v12, v13);
  _Block_release(v13);
  swift_unknownObjectRelease();

}

void sub_23A753D94()
{
  uint64_t Strong;
  uint64_t v1;
  void *v2;
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  __int128 *v7;
  uint64_t v8;
  _BYTE v9[24];
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v1 = Strong;
    sub_23A769280();
    if (v10)
    {
      sub_23A754980(0, &qword_2569B7A90);
      if ((swift_dynamicCast() & 1) == 0)
      {
LABEL_13:
        swift_release();
        return;
      }
      v2 = (void *)v11;
      sub_23A754980(0, &qword_2569B7A98);
      v3 = *(id *)(v1 + 16);
      v4 = sub_23A7696B8();

      if ((v4 & 1) == 0 || (v5 = sub_23A76928C()) == 0)
      {
LABEL_12:

        goto LABEL_13;
      }
      v6 = v5;
      v8 = sub_23A76949C();
      sub_23A769718();
      sub_23A753F68((uint64_t)v9, v6, &v11);
      swift_bridgeObjectRelease();
      sub_23A754320((uint64_t)v9);
      if (v12)
      {
        if ((swift_dynamicCast() & 1) != 0 && v8 == 1)
        {
          sub_23A752DE0();
          sub_23A752CCC();
          swift_release();

          return;
        }
        goto LABEL_12;
      }

      swift_release();
      v7 = &v11;
    }
    else
    {
      swift_release();
      v7 = (__int128 *)v9;
    }
    sub_23A7542E0((uint64_t)v7);
  }
}

double sub_23A753F68@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_23A7543DC(a1), (v6 & 1) != 0))
  {
    sub_23A75440C(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_23A753FB8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_23A769298();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_23A769274();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_23A75405C()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_23A753304();
    return swift_release();
  }
  return result;
}

void sub_23A7540B0()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_defaultCenter);
  OUTLINED_FUNCTION_3_0(v1, v2, v3, *MEMORY[0x24BDB15D8]);

  v6 = objc_msgSend(v0, sel_defaultCenter);
  OUTLINED_FUNCTION_3_0(v6, v4, v5, *MEMORY[0x24BDB1610]);

}

uint64_t sub_23A754150(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DropInPlayer.Settings(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A754194()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A7541C0()
{
  uint64_t v0;

  return sub_23A75273C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23A7541C8()
{
  return swift_deallocObject();
}

void sub_23A7541D8()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_0();
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

uint64_t type metadata accessor for DropInPlayerManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for DropInPlayerManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DropInPlayerManager.player(settings:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of DropInPlayerManager.activateAudioSession()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of DropInPlayerManager.deactivateAudioSession()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t type metadata accessor for DropInPlayerManager.WeakDropInPlayer()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for DropInPlayerManager.AudioSessionConfiguration()
{
  return &type metadata for DropInPlayerManager.AudioSessionConfiguration;
}

uint64_t sub_23A7542AC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_23A7542D0()
{
  sub_23A753D94();
}

uint64_t sub_23A7542D8()
{
  return sub_23A75405C();
}

uint64_t sub_23A7542E0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4880);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A754320(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

char *sub_23A754358(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_23A7697A8();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

unint64_t sub_23A7543DC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A769700();
  return sub_23A7544AC(a1, v2);
}

uint64_t sub_23A75440C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23A754448(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23A769850();
  sub_23A7694B4();
  v4 = sub_23A769868();
  return sub_23A7545B4(a1, a2, v4);
}

unint64_t sub_23A7544AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_23A754570(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B856388](v9, a1);
      sub_23A754320((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_23A754570(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_23A7545AC()
{
  return sub_23A7534FC();
}

unint64_t sub_23A7545B4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23A7697E4() & 1) == 0)
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
      while (!v14 && (sub_23A7697E4() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23A754694(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      v6 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  v6 = sub_23A76979C();
  swift_bridgeObjectRelease();
LABEL_4:
  if (v6 < v2)
  {
    __break(1u);
    goto LABEL_32;
  }
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v2 - v4))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (!(*v3 >> 62))
  {
    v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_9;
  }
LABEL_34:
  swift_bridgeObjectRetain();
  v7 = sub_23A76979C();
  swift_bridgeObjectRelease();
LABEL_9:
  v8 = v7 + v5;
  if (__OFADD__(v7, v5))
  {
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    v12 = sub_23A76979C();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_17;
  }
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_20;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_36;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x23B8563C4](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_20:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  type metadata accessor for DropInPlayerManager.WeakDropInPlayer();
  swift_arrayDestroy();
  if (!v5)
    return sub_23A769508();
  if (*v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = sub_23A76979C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (__OFSUB__(v15, v2))
  {
    __break(1u);
  }
  else
  {
    result = (uint64_t)sub_23A754358((char *)(v13 + 8 * v2), v15 - v2, v14);
    if (!(*v3 >> 62))
    {
      v17 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_26;
    }
  }
  swift_bridgeObjectRetain();
  v17 = sub_23A76979C();
  result = swift_bridgeObjectRelease();
LABEL_26:
  if (!__OFADD__(v17, v5))
  {
    *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v17 + v5;
    return sub_23A769508();
  }
  __break(1u);
  return result;
}

void sub_23A754910(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_23A76979C();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x23B8563C4);
}

uint64_t sub_23A754978()
{
  return sub_23A752DF4();
}

uint64_t sub_23A754980(uint64_t a1, unint64_t *a2)
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

void sub_23A7549B8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x23B856A18](a3, v5), a1);
  }
  OUTLINED_FUNCTION_0();
}

void sub_23A7549F4(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x23B856A18](MEMORY[0x24BEE12C8], v3), a1);
  }
  OUTLINED_FUNCTION_0();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_allocObject();
}

id OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  return objc_msgSend(a1, (SEL)(v6 + 3144), v4, a4, v5);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_weakInit();
}

id OUTLINED_FUNCTION_7_0(int a1, id a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_23A7692B0();
}

void *OUTLINED_FUNCTION_9_0@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  a4 = v5;
  a5 = a1;
  return _Block_copy(&a2);
}

uint64_t sub_23A754AB8()
{
  uint64_t result;
  uint64_t v1;

  result = sub_23A76949C();
  qword_2569B7AB8 = result;
  unk_2569B7AC0 = v1;
  return result;
}

uint64_t static Constants.dropInBundleID.getter()
{
  return sub_23A754CE8(&qword_2569B7320, &qword_2569B7AB8);
}

uint64_t sub_23A754B04()
{
  uint64_t result;
  uint64_t v1;

  result = sub_23A76949C();
  qword_2542D4B78 = result;
  unk_2542D4B80 = v1;
  return result;
}

uint64_t static Constants.dropInMachServiceName.getter()
{
  return sub_23A754CE8(&qword_2542D4B88, &qword_2542D4B78);
}

uint64_t sub_23A754B50()
{
  uint64_t result;
  uint64_t v1;

  result = sub_23A76949C();
  qword_2542D4B50 = result;
  *(_QWORD *)algn_2542D4B58 = v1;
  return result;
}

uint64_t static Constants.dropInEntitlement.getter()
{
  return sub_23A754CE8(qword_2542D4B60, &qword_2542D4B50);
}

uint64_t sub_23A754B9C()
{
  uint64_t result;
  uint64_t v1;

  result = sub_23A76949C();
  qword_2569B7AC8 = result;
  unk_2569B7AD0 = v1;
  return result;
}

uint64_t static Constants.dropInDeviceStateManagementEntitlement.getter()
{
  return sub_23A754CE8(&qword_2569B7328, &qword_2569B7AC8);
}

uint64_t sub_23A754BE8()
{
  uint64_t result;
  uint64_t v1;

  result = sub_23A76949C();
  qword_2569B7AD8 = result;
  unk_2569B7AE0 = v1;
  return result;
}

uint64_t static Constants.audioManagementEntitlement.getter()
{
  return sub_23A754CE8(qword_2569B7330, &qword_2569B7AD8);
}

uint64_t sub_23A754C34()
{
  uint64_t result;
  uint64_t v1;

  result = sub_23A76949C();
  qword_2542D4868 = result;
  *(_QWORD *)algn_2542D4870 = v1;
  return result;
}

uint64_t static Constants.dropInUserDefaultsDomain.getter()
{
  return sub_23A754CE8(&qword_2542D49D8, &qword_2542D4868);
}

unint64_t static Constants.dropInCoreDaemonUp.getter()
{
  return 0xD000000000000023;
}

uint64_t sub_23A754C9C()
{
  uint64_t result;
  uint64_t v1;

  result = sub_23A76949C();
  qword_2542D49E0 = result;
  *(_QWORD *)algn_2542D49E8 = v1;
  return result;
}

uint64_t static Constants.IDS.dropInCommunicationServiceName.getter()
{
  return sub_23A754CE8(qword_2542D49F0, &qword_2542D49E0);
}

uint64_t sub_23A754CE8(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

ValueMetadata *type metadata accessor for Constants()
{
  return &type metadata for Constants;
}

ValueMetadata *type metadata accessor for Constants.IDS()
{
  return &type metadata for Constants.IDS;
}

uint64_t sub_23A754D58(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_23A754D84(uint64_t a1)
{
  return OUTLINED_FUNCTION_1_3(a1);
}

uint64_t sub_23A754D90(uint64_t a1)
{
  return OUTLINED_FUNCTION_1_3(a1);
}

char *DeviceStateUpdateThrottler.__allocating_init(throttleTimeInterval:)(double a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return DeviceStateUpdateThrottler.init(throttleTimeInterval:)(a1);
}

char *DeviceStateUpdateThrottler.init(throttleTimeInterval:)(double a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;
  uint64_t v19;

  v3 = sub_23A769628();
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0_2();
  v15 = v6 - v5;
  sub_23A769604();
  v7 = (void (*)(uint64_t))MEMORY[0x24BEE5688];
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_0_2();
  sub_23A769400();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0_2();
  *(_QWORD *)&v1[OBJC_IVAR___DIDeviceStateUpdateThrottler_cancellable] = 0;
  *(double *)&v1[OBJC_IVAR___DIDeviceStateUpdateThrottler_throttleTimeInterval] = a1;
  type metadata accessor for DeviceStateUpdateThrottler.DeviceStateUpdateRequest();
  OUTLINED_FUNCTION_3_1();
  v10 = v1;
  sub_23A75591C(0, 0, 0xE000000000000000, (uint64_t)nullsub_1, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7AF8);
  swift_allocObject();
  *(_QWORD *)&v10[OBJC_IVAR___DIDeviceStateUpdateThrottler_subject] = sub_23A7693AC();
  sub_23A74F304();
  sub_23A74F1D0();
  sub_23A7693F4();
  v19 = MEMORY[0x24BEE4AF8];
  sub_23A755B70((uint64_t *)&qword_2569B7AA0, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7AA8);
  sub_23A755BA8((uint64_t *)&qword_2569B7AB0, &qword_2569B7AA8);
  sub_23A7696F4();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 104))(v15, *MEMORY[0x24BEE5750], v17);
  *(_QWORD *)&v10[OBJC_IVAR___DIDeviceStateUpdateThrottler_queue] = sub_23A76964C();

  v18.receiver = v10;
  v18.super_class = (Class)type metadata accessor for DeviceStateUpdateThrottler();
  v11 = (char *)objc_msgSendSuper2(&v18, sel_init);
  v12 = swift_retain();
  v13 = sub_23A7550B8(v12);
  swift_release();

  *(_QWORD *)&v11[OBJC_IVAR___DIDeviceStateUpdateThrottler_cancellable] = v13;
  swift_release();
  return v11;
}

uint64_t type metadata accessor for DeviceStateUpdateThrottler.DeviceStateUpdateRequest()
{
  return objc_opt_self();
}

uint64_t sub_23A7550B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_23A76961C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7C08);
  v13 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a1;
  sub_23A769610();
  v14 = *(_QWORD *)(v1 + OBJC_IVAR___DIDeviceStateUpdateThrottler_queue);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7AF8);
  sub_23A74F304();
  sub_23A755BA8(&qword_2569B7C10, &qword_2569B7AF8);
  sub_23A755B70(&qword_2569B7C18, (void (*)(uint64_t))sub_23A74F304);
  sub_23A7693C4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_23A755BA8(&qword_2569B7C20, &qword_2569B7C08);
  v10 = sub_23A7693B8();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v7);
  return v10;
}

id DeviceStateUpdateThrottler.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  if (*(_QWORD *)&v0[OBJC_IVAR___DIDeviceStateUpdateThrottler_cancellable])
  {
    swift_retain();
    sub_23A769388();
    swift_release();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeviceStateUpdateThrottler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23A755380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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
  _QWORD *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[6];

  v10 = sub_23A7693DC();
  v26 = *(_QWORD *)(v10 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_0_2();
  v14 = v13 - v12;
  v15 = sub_23A769400();
  v24 = *(_QWORD *)(v15 - 8);
  v25 = v15;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_0_2();
  v19 = v18 - v17;
  v20 = OUTLINED_FUNCTION_3_1();
  swift_unknownObjectWeakInit();
  v21 = (_QWORD *)OUTLINED_FUNCTION_3_1();
  v21[2] = v20;
  v21[3] = a1;
  v21[4] = a2;
  v21[5] = a3;
  v21[6] = a4;
  v21[7] = a5;
  aBlock[4] = sub_23A7559C0;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A754D58;
  aBlock[3] = &block_descriptor_1;
  v22 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23A7693E8();
  sub_23A755B70(&qword_2542D4A60, (void (*)(uint64_t))MEMORY[0x24BEE5458]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A70);
  sub_23A755BA8(&qword_2542D4A78, &qword_2542D4A70);
  sub_23A7696F4();
  MEMORY[0x23B8562BC](0, v19, v14, v22);
  _Block_release(v22);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v14, v10);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v19, v25);
  swift_release();
  return swift_release();
}

uint64_t sub_23A7555B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t result;
  char *v13;
  _QWORD *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;

  v11 = a1 + 16;
  swift_beginAccess();
  result = MEMORY[0x23B856B50](v11);
  if (result)
  {
    v13 = (char *)result;
    type metadata accessor for DeviceStateUpdateThrottler.DeviceStateUpdateRequest();
    swift_allocObject();
    swift_bridgeObjectRetain();
    swift_retain();
    v14 = sub_23A75591C(a2, a3, a4, a5, a6);
    swift_retain();
    sub_23A7693A0();
    swift_release();
    v15 = sub_23A755AF0(v19, v14);
    swift_release();
    if ((v15 & 1) != 0)
    {
      swift_retain();
      sub_23A769394();
      swift_release();

    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7AF8);
      swift_allocObject();
      swift_retain();
      v16 = sub_23A7693AC();
      sub_23A754D84(v16);
      if (*(_QWORD *)&v13[OBJC_IVAR___DIDeviceStateUpdateThrottler_cancellable])
      {
        swift_retain();
        sub_23A769388();
        swift_release();
      }
      v17 = swift_retain();
      v18 = sub_23A7550B8(v17);
      swift_release();
      sub_23A754D90(v18);
      sub_23A755A18(0);

    }
    return swift_release();
  }
  return result;
}

void sub_23A755840(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  id v8;

  v8 = (id)sub_23A769478();
  (*(void (**)(uint64_t, uint64_t, id, _QWORD))(a5 + 16))(a5, a1, v8, a4 & 1);

}

id DeviceStateUpdateThrottler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void DeviceStateUpdateThrottler.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23A7558F8()
{
  return sub_23A755A18(0);
}

_QWORD *sub_23A75591C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a1;
  v5[3] = a2;
  v5[4] = a3;
  v5[5] = a4;
  v5[6] = a5;
  sub_23A74FDDC(0);
  return v5;
}

uint64_t type metadata accessor for DeviceStateUpdateThrottler()
{
  return objc_opt_self();
}

uint64_t sub_23A755968()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A75598C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A7559C0()
{
  uint64_t *v0;

  return sub_23A7555B0(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7]);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t method lookup function for DeviceStateUpdateThrottler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DeviceStateUpdateThrottler.__allocating_init(throttleTimeInterval:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of DeviceStateUpdateThrottler.handle(state:reason:handler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t sub_23A755A18(char a1)
{
  _QWORD *v1;
  _QWORD *v2;
  void (*v3)(uint64_t, uint64_t, uint64_t, _QWORD);
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v1;
  v4 = v1 + 5;
  v3 = (void (*)(uint64_t, uint64_t, uint64_t, _QWORD))v1[5];
  if (v3)
  {
    v6 = v2[2];
    v7 = v2[3];
    v8 = v2[4];
    swift_retain();
    v3(v6, v7, v8, a1 & 1);
    sub_23A74FDDC((uint64_t)v3);
    v9 = v2[5];
  }
  else
  {
    v9 = 0;
  }
  *v4 = 0;
  v4[1] = 0;
  return sub_23A74FDDC(v9);
}

uint64_t sub_23A755AA8()
{
  uint64_t v0;

  sub_23A755A18(1);
  swift_bridgeObjectRelease();
  sub_23A74FDDC(*(_QWORD *)(v0 + 40));
  return v0;
}

uint64_t sub_23A755AD4()
{
  sub_23A755AA8();
  return swift_deallocClassInstance();
}

uint64_t sub_23A755AF0(_QWORD *a1, _QWORD *a2)
{
  if (a1[2] != a2[2])
    return 0;
  if (a1[3] == a2[3] && a1[4] == a2[4])
    return 1;
  else
    return sub_23A7697E4();
}

uint64_t sub_23A755B38(_QWORD **a1, _QWORD **a2)
{
  return sub_23A755AF0(*a1, *a2);
}

uint64_t sub_23A755B44()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_23A755B68(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;

  sub_23A755840(a1, a2, a3, a4, *(_QWORD *)(v4 + 16));
}

uint64_t sub_23A755B70(uint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    a2(255);
    OUTLINED_FUNCTION_4_1();
  }
  return result;
}

uint64_t sub_23A755BA8(uint64_t *a1, uint64_t *a2)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_4_1();
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + v1) = a1;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_4_1()
{
  JUMPOUT(0x23B856A18);
}

uint64_t DIDropInSessionState.description.getter(uint64_t a1)
{
  return sub_23A755C30(a1, (SEL *)&selRef_stringForDropInSessionState_);
}

uint64_t sub_23A755C1C()
{
  uint64_t *v0;

  return DIDropInSessionState.description.getter(*v0);
}

uint64_t DIDropInSessionStateReason.description.getter(uint64_t a1)
{
  return sub_23A755C30(a1, (SEL *)&selRef_stringForDropInSessionStateReason_);
}

uint64_t sub_23A755C30(uint64_t a1, SEL *a2)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend((id)objc_opt_self(), *a2, a1);
  v3 = sub_23A76949C();

  return v3;
}

uint64_t sub_23A755C94()
{
  uint64_t *v0;

  return DIDropInSessionStateReason.description.getter(*v0);
}

uint64_t DIDeviceState.description.getter(uint64_t a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_msgSend((id)objc_opt_self(), sel_stringForDeviceState_, a1);
  v2 = sub_23A76949C();

  return v2;
}

uint64_t sub_23A755D00()
{
  uint64_t *v0;

  return DIDeviceState.description.getter(*v0);
}

uint64_t sub_23A755D08(unint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (a1 >> 62)
    goto LABEL_11;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_23A76979C())
  {
    v5 = 4;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v6 = (void *)MEMORY[0x23B8563B8](v5 - 4, a1);
      }
      else
      {
        v6 = *(void **)(a1 + 8 * v5);
        swift_unknownObjectRetain();
      }
      v7 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      objc_msgSend(v6, sel_xpcManagerDidPerformDaemonCheckIn_, a2);
      swift_unknownObjectRelease();
      ++v5;
      if (v7 == v4)
        goto LABEL_9;
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
LABEL_9:

  return swift_bridgeObjectRelease();
}

id XPCManager.clientContext.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___DIXPCManager_clientContext);
}

uint64_t sub_23A755E54()
{
  return sub_23A755F34(&OBJC_IVAR___DIXPCManager_clientQueue);
}

void sub_23A755EA8(void *a1)
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_23_0();

  OUTLINED_FUNCTION_22_0();
}

void sub_23A755EDC(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_23A755EA8(v1);
}

uint64_t sub_23A755F28()
{
  return sub_23A755F34(&OBJC_IVAR___DIXPCManager_delegate);
}

uint64_t sub_23A755F34(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *a1;
  OUTLINED_FUNCTION_12_0();
  return MEMORY[0x23B856B50](v2);
}

void sub_23A755FC0()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_23_0();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_22_0();
}

void sub_23A755FF8()
{
  swift_unknownObjectRetain();
  sub_23A755FC0();
}

void (*sub_23A756020(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___DIXPCManager_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  OUTLINED_FUNCTION_12_0();
  v3[3] = MEMORY[0x23B856B50](v5);
  return sub_23A75608C;
}

void sub_23A75608C(void **a1, char a2)
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

void sub_23A7560F8()
{
  void *v0;
  id v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  v1 = v0;
  oslog = sub_23A769364();
  v2 = sub_23A7695E0();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v3 = 67109120;
    sub_23A7696D0();

    _os_log_impl(&dword_23A742000, oslog, v2, "Needs Check in = %{BOOL}d", v3, 8u);
    MEMORY[0x23B856ACC](v3, -1, -1);
  }
  else
  {

  }
}

void sub_23A7561FC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR___DIXPCManager__connection);
  *(_QWORD *)(v1 + OBJC_IVAR___DIXPCManager__connection) = a1;

}

id XPCManager.__allocating_init(clientContext:dispatcher:clientQueue:)(void *a1, void *a2, void *a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return XPCManager.init(clientContext:dispatcher:clientQueue:)(a1, a2, a3);
}

id XPCManager.init(clientContext:dispatcher:clientQueue:)(void *a1, void *a2, void *a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  id v12;
  id v13;
  objc_class *v14;
  id v15;
  uint64_t v17;
  objc_super v18;

  v7 = sub_23A76937C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_14_0();
  *(_QWORD *)&v3[OBJC_IVAR___DIXPCManager__connection] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___DIXPCManager_clientContext] = a1;
  OUTLINED_FUNCTION_12_0();
  swift_unknownObjectWeakAssign();
  OUTLINED_FUNCTION_23_0();
  v11 = v3;
  v12 = a1;
  sub_23A769370();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v11[OBJC_IVAR___DIXPCManager_logger], v10, v7);
  v11[OBJC_IVAR___DIXPCManager_needsCheckIn] = 1;
  v11[OBJC_IVAR___DIXPCManager_isConnectionValid] = 0;
  *(_DWORD *)&v11[OBJC_IVAR___DIXPCManager_notifyRegisterToken] = -1;
  *(_QWORD *)&v11[OBJC_IVAR___DIXPCManager_checkInObservers] = MEMORY[0x24BEE4AF8];
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1788]), sel_init);
  *(_QWORD *)&v11[OBJC_IVAR___DIXPCManager_lock] = v13;

  v14 = (objc_class *)type metadata accessor for XPCManager();
  v18.receiver = v11;
  v18.super_class = v14;
  v15 = objc_msgSendSuper2(&v18, sel_init);

  return v15;
}

uint64_t type metadata accessor for XPCManager()
{
  uint64_t result;

  result = qword_2542D4A30;
  if (!qword_2542D4A30)
    return swift_getSingletonMetadata();
  return result;
}

id XPCManager.__deallocating_deinit()
{
  char *v0;
  void *v1;
  objc_super v3;

  v1 = *(void **)&v0[OBJC_IVAR___DIXPCManager__connection];
  if (v1)
    objc_msgSend(v1, sel_invalidate);
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for XPCManager();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_23A7565F8(uint64_t a1)
{
  char *v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v9[6];

  v3 = *(void **)&v1[OBJC_IVAR___DIXPCManager_lock];
  v4 = OUTLINED_FUNCTION_3_1();
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = a1;
  v5 = OUTLINED_FUNCTION_3_1();
  *(_QWORD *)(v5 + 16) = sub_23A7567D8;
  *(_QWORD *)(v5 + 24) = v4;
  v9[4] = sub_23A7567E4;
  v9[5] = v5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23A752BD0;
  v9[3] = &block_descriptor_2;
  _Block_copy(v9);
  v6 = v1;
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_16_0(v3, sel_di_synchronize_);
  OUTLINED_FUNCTION_15_0();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = OUTLINED_FUNCTION_21_0();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_23A756728(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)(a1 + OBJC_IVAR___DIXPCManager_checkInObservers);
  swift_beginAccess();
  v2 = swift_unknownObjectRetain();
  MEMORY[0x23B856154](v2);
  sub_23A75840C(*(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x10));
  sub_23A769520();
  sub_23A769508();
  return swift_endAccess();
}

uint64_t sub_23A7567AC()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A7567D8()
{
  uint64_t v0;

  return sub_23A756728(*(_QWORD *)(v0 + 16));
}

void sub_23A7567E4()
{
  uint64_t v0;

  sub_23A752BB4(*(void (**)(void))(v0 + 16));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

id sub_23A756874()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __n128 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __n128 v25;
  uint64_t v26;
  __n128 *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __n128 v35;
  uint64_t v36;
  __n128 *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __n128 v45;
  uint64_t v46;
  __n128 *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __n128 v55;
  uint64_t v56;
  __n128 *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  __n128 v65;
  uint64_t v66;
  __n128 *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __n128 v75;
  uint64_t v76;
  __n128 *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __n128 v85;
  uint64_t v86;
  __n128 *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  __n128 v95;
  uint64_t v96;
  int v97;
  char aBlock;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  void *v106;
  uint64_t v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  uint64_t v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  void *v130;
  uint32_t v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;

  v1 = v0;
  v166 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(v0 + OBJC_IVAR___DIXPCManager__connection);
  if (v2 && *(_BYTE *)(v0 + OBJC_IVAR___DIXPCManager_isConnectionValid) == 1)
    return v2;
  OUTLINED_FUNCTION_7_1((uint64_t)v2, &qword_2569B7C60);
  if (qword_2542D4B88 != -1)
    swift_once();
  v4 = qword_2542D4B78;
  v5 = unk_2542D4B80;
  swift_bridgeObjectRetain();
  v6 = sub_23A756E6C(v4, v5, 4096);
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_2569BDAF8);
  objc_msgSend(v6, sel_setRemoteObjectInterface_, v8);
  sub_23A757F84();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A76B450;
  v10 = OUTLINED_FUNCTION_7_1(inited, (unint64_t *)&qword_2542D4AA0);
  *(_QWORD *)(inited + 32) = v10;
  v11 = OUTLINED_FUNCTION_7_1(v10, &qword_2542D4A98);
  *(_QWORD *)(inited + 40) = v11;
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(inited);
  swift_setDeallocating();
  sub_23A757F84();
  v12 = swift_initStackObject();
  *(_OWORD *)(v12 + 16) = xmmword_23A76B460;
  *(_QWORD *)(v12 + 32) = OUTLINED_FUNCTION_7_1(v12, &qword_2542D4A88);
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v12);
  OUTLINED_FUNCTION_27_0();
  v13 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_2569BCAC0);
  objc_msgSend(v6, sel_setExportedInterface_, v13);
  v14 = (void *)MEMORY[0x23B856B50](v0 + OBJC_IVAR___DIXPCManager_dispatcher);
  OUTLINED_FUNCTION_19_0((uint64_t)v14, sel_setExportedObject_);

  sub_23A757F84();
  v15 = swift_initStackObject();
  *(_OWORD *)(v15 + 16) = xmmword_23A76B460;
  *(_QWORD *)(v15 + 32) = type metadata accessor for ClientContext();
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v15);
  OUTLINED_FUNCTION_27_0();
  sub_23A757F84();
  v16 = swift_initStackObject();
  *(_OWORD *)(v16 + 16) = xmmword_23A76B450;
  *(_QWORD *)(v16 + 32) = v10;
  *(_QWORD *)(v16 + 40) = v11;
  OUTLINED_FUNCTION_0_3(v16);
  OUTLINED_FUNCTION_27_0();
  sub_23A757F84();
  v17 = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_6_0(v17, v18, v19, v20, v21, v22, v23, v24, 2, 4, v25);
  OUTLINED_FUNCTION_0_3(v26);
  OUTLINED_FUNCTION_13_0();
  sub_23A757F84();
  v27 = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_6_0(v27, v28, v29, v30, v31, v32, v33, v34, v133, v143, v35);
  OUTLINED_FUNCTION_0_3(v36);
  OUTLINED_FUNCTION_13_0();
  sub_23A757F84();
  v37 = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_6_0(v37, v38, v39, v40, v41, v42, v43, v44, v134, v144, v45);
  OUTLINED_FUNCTION_0_3(v46);
  OUTLINED_FUNCTION_13_0();
  sub_23A757F84();
  v47 = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_2_1(v47, v48, v49, v50, v51, v52, v53, v54, v135, v145, v55);
  OUTLINED_FUNCTION_0_3(v56);
  OUTLINED_FUNCTION_9_1();
  sub_23A757F84();
  v57 = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_2_1(v57, v58, v59, v60, v61, v62, v63, v64, v136, v146, v65);
  OUTLINED_FUNCTION_0_3(v66);
  OUTLINED_FUNCTION_9_1();
  sub_23A757F84();
  v67 = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_2_1(v67, v68, v69, v70, v71, v72, v73, v74, v137, v147, v75);
  OUTLINED_FUNCTION_0_3(v76);
  OUTLINED_FUNCTION_9_1();
  sub_23A757F84();
  v77 = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_2_1(v77, v78, v79, v80, v81, v82, v83, v84, v138, v148, v85);
  OUTLINED_FUNCTION_0_3(v86);
  OUTLINED_FUNCTION_9_1();
  sub_23A757F84();
  v87 = (__n128 *)swift_initStackObject();
  OUTLINED_FUNCTION_2_1(v87, v88, v89, v90, v91, v92, v93, v94, v139, v149, v95);
  OUTLINED_FUNCTION_0_3(v96);
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_3_1();
  v97 = OUTLINED_FUNCTION_10_0();
  aBlock = MEMORY[0x24BDAC760];
  v106 = OUTLINED_FUNCTION_20_0(v97, v99, v100, v101, v102, v103, v104, v105, v140, v150, 1, 2, v157, v160, MEMORY[0x24BDAC760]);
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_16_0(v6, sel_setInterruptionHandler_);
  _Block_release(v106);
  v107 = OUTLINED_FUNCTION_3_1();
  v108 = OUTLINED_FUNCTION_10_0();
  v164 = sub_23A757FEC;
  v165 = v107;
  v161 = 1107296256;
  v162 = sub_23A754D58;
  v163 = &block_descriptor_13_0;
  v116 = OUTLINED_FUNCTION_20_0(v108, v109, v110, v111, v112, v113, v114, v115, v141, v151, v153, v155, v158, v160, aBlock);
  v117 = OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_19_0(v117, sel_setInvalidationHandler_);
  _Block_release(v116);
  v119 = OBJC_IVAR___DIXPCManager_notifyRegisterToken;
  if (*(_DWORD *)(v1 + OBJC_IVAR___DIXPCManager_notifyRegisterToken) == -1)
  {
    HIDWORD(v160) = -1;
    OUTLINED_FUNCTION_7_1(v118, (unint64_t *)&qword_2542D4A90);
    v120 = sub_23A769634();
    v121 = OUTLINED_FUNCTION_3_1();
    v122 = OUTLINED_FUNCTION_10_0();
    v164 = sub_23A757FF4;
    v165 = v121;
    v161 = 1107296256;
    v162 = sub_23A75716C;
    v163 = &block_descriptor_17_0;
    v130 = OUTLINED_FUNCTION_20_0(v122, v123, v124, v125, v126, v127, v128, v129, v142, v152, v154, v156, v159, v160, aBlock);
    OUTLINED_FUNCTION_17_0();
    v131 = notify_register_dispatch("com.apple.dropin.dropInCoreDaemonUp", (int *)&v160 + 1, v120, v130);
    OUTLINED_FUNCTION_15_0();

    if (!v131)
      *(_DWORD *)(v1 + v119) = HIDWORD(v160);
  }
  *(_BYTE *)(v1 + OBJC_IVAR___DIXPCManager_needsCheckIn) = 0;
  sub_23A7560F8();
  objc_msgSend(v6, sel_resume);
  *(_BYTE *)(v1 + OBJC_IVAR___DIXPCManager_isConnectionValid) = 1;
  v132 = v6;
  sub_23A7561FC((uint64_t)v6);

  return v132;
}

id sub_23A756E6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_23A769478();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithMachServiceName_options_, v5, a3);

  return v6;
}

void sub_23A756EE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  char *v7;
  void *v8;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x23B856B50](v1);
  if (v2)
  {
    v3 = (_BYTE *)v2;
    v4 = sub_23A769364();
    v5 = sub_23A7695E0();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23A742000, v4, v5, "Connection to DropInCore was interrupted", v6, 2u);
      MEMORY[0x23B856ACC](v6, -1, -1);
    }

    v3[OBJC_IVAR___DIXPCManager_needsCheckIn] = 1;
    sub_23A7560F8();
    v7 = &v3[OBJC_IVAR___DIXPCManager_delegate];
    swift_beginAccess();
    v8 = (void *)MEMORY[0x23B856B50](v7);
    if (v8)
    {
      objc_msgSend(v8, sel_managerDidInterruptConnection_, v3);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

void sub_23A757018(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x23B856B50](v1);
  if (v2)
  {
    v3 = (_BYTE *)v2;
    v4 = sub_23A769364();
    v5 = sub_23A7695E0();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23A742000, v4, v5, "Connection to DropInCore was invalidated", v6, 2u);
      MEMORY[0x23B856ACC](v6, -1, -1);
    }

    v3[OBJC_IVAR___DIXPCManager_needsCheckIn] = 1;
    sub_23A7560F8();
    v3[OBJC_IVAR___DIXPCManager_isConnectionValid] = 0;

  }
}

void sub_23A757108(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x23B856B50](v2);
  if (v3)
  {
    v4 = (void *)v3;
    if (*(_BYTE *)(v3 + OBJC_IVAR___DIXPCManager_needsCheckIn) == 1)
      sub_23A7571A8();

  }
}

uint64_t sub_23A75716C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_23A7571A8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD *v5;
  int EnumTagSinglePayload;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A00);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23A769568();
  __swift_storeEnumTagSinglePayload((uint64_t)v3, 1, 1, v4);
  v5 = (_QWORD *)OUTLINED_FUNCTION_3_1();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v0;
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4);
  v7 = v0;
  if (EnumTagSinglePayload == 1)
  {
    sub_23A758310((uint64_t)v3);
    v8 = 0;
    v9 = 0;
  }
  else
  {
    sub_23A76955C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
    if (v5[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v8 = sub_23A76952C();
      v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
  }
  v11 = OUTLINED_FUNCTION_3_1();
  *(_QWORD *)(v11 + 16) = &unk_2569B7C78;
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

uint64_t sub_23A757358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4[20] = a4;
  v5 = sub_23A7693DC();
  v4[21] = v5;
  v4[22] = *(_QWORD *)(v5 - 8);
  v4[23] = swift_task_alloc();
  v6 = sub_23A769400();
  v4[24] = v6;
  v4[25] = *(_QWORD *)(v6 - 8);
  v4[26] = swift_task_alloc();
  v7 = (_QWORD *)swift_task_alloc();
  v4[27] = v7;
  *v7 = v4;
  v7[1] = sub_23A7573F4;
  return sub_23A7579CC();
}

uint64_t sub_23A7573F4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 224) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A757458()
{
  _QWORD *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = sub_23A769364();
  v2 = sub_23A7695E0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)OUTLINED_FUNCTION_7();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_23A742000, v1, v2, "Checked in with DropInCore Daemon", v3, 2u);
    OUTLINED_FUNCTION_0_1();
  }
  v4 = v0[26];
  v5 = v0[23];
  v18 = v0[25];
  v19 = v0[24];
  v6 = v0[21];
  v17 = v0[22];
  v7 = (char *)v0[20];

  OUTLINED_FUNCTION_7_1(v8, (unint64_t *)&qword_2542D4A90);
  v9 = (void *)sub_23A769634();
  v10 = OUTLINED_FUNCTION_3_1();
  swift_unknownObjectWeakInit();
  v0[6] = sub_23A758438;
  v0[7] = v10;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_23A754D58;
  v0[5] = &block_descriptor_47;
  v11 = _Block_copy(v0 + 2);
  swift_retain();
  sub_23A7693E8();
  v0[19] = MEMORY[0x24BEE4AF8];
  sub_23A758440();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A70);
  sub_23A758480();
  sub_23A7696F4();
  MEMORY[0x23B8562BC](0, v4, v5, v11);
  _Block_release(v11);

  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v4, v19);
  OUTLINED_FUNCTION_21_0();
  swift_release();
  v12 = *(void **)&v7[OBJC_IVAR___DIXPCManager_lock];
  v13 = OUTLINED_FUNCTION_3_1();
  *(_QWORD *)(v13 + 16) = v7;
  v14 = OUTLINED_FUNCTION_3_1();
  *(_QWORD *)(v14 + 16) = sub_23A7584E8;
  *(_QWORD *)(v14 + 24) = v13;
  v0[12] = sub_23A758544;
  v0[13] = v14;
  v0[8] = MEMORY[0x24BDAC760];
  v0[9] = 1107296256;
  v0[10] = sub_23A752BD0;
  v0[11] = &block_descriptor_57;
  _Block_copy(v0 + 8);
  v15 = v7;
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_16_0(v12, sel_di_synchronize_);
  OUTLINED_FUNCTION_15_0();
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = OUTLINED_FUNCTION_21_0();
  if ((v7 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_26_0();
    swift_task_dealloc();
    return ((uint64_t (*)(void))v0[1])();
  }
  return result;
}

uint64_t sub_23A757764()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v1 = *(void **)(v0 + 224);
  v2 = v1;
  v3 = v1;
  v4 = sub_23A769364();
  v5 = sub_23A7695D4();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_7();
    v10 = OUTLINED_FUNCTION_7();
    *(_DWORD *)v6 = 136315138;
    swift_getErrorValue();
    v7 = sub_23A769814();
    *(_QWORD *)(v0 + 144) = sub_23A760AD0(v7, v8, &v10);
    sub_23A7696D0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_13();
    _os_log_impl(&dword_23A742000, v4, v5, "Failed to check in with daemon %s", v6, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_1();
  }
  OUTLINED_FUNCTION_25_0();

  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_26_0();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23A7578FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x23B856B50](v1);
  if (v2)
  {
    v3 = (void *)v2;
    *(_BYTE *)(v2 + OBJC_IVAR___DIXPCManager_needsCheckIn) = 0;
    sub_23A7560F8();

  }
}

uint64_t sub_23A757958(void *a1)
{
  id v2;
  unint64_t v3;

  swift_beginAccess();
  v2 = a1;
  v3 = swift_bridgeObjectRetain();
  sub_23A755D08(v3, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A7579CC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23A7579E4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[2];
  v2 = swift_task_alloc();
  v0[3] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[4] = v3;
  *v3 = v0;
  v3[1] = sub_23A757A7C;
  return sub_23A7697F0();
}

uint64_t sub_23A757A7C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A757AE8()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A757B14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void (*v7)(char *, uint64_t, uint64_t);
  unint64_t v8;
  uint64_t v9;
  void (*v10)(unint64_t, char *, uint64_t);
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[2];
  uint64_t aBlock;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  uint64_t (*v22)(uint64_t);
  uint64_t v23;

  v17[0] = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A80);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A756874();
  v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v7(v5, a1, v2);
  v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v9 = swift_allocObject();
  v10 = *(void (**)(unint64_t, char *, uint64_t))(v3 + 32);
  v10(v9 + v8, v5, v2);
  v22 = sub_23A7581E0;
  v23 = v9;
  aBlock = MEMORY[0x24BDAC760];
  v19 = 1107296256;
  v20 = sub_23A757D9C;
  v21 = &block_descriptor_27;
  v11 = _Block_copy(&aBlock);
  swift_release();
  v12 = objc_msgSend(v6, sel_remoteObjectProxyWithErrorHandler_, v11);
  _Block_release(v11);

  sub_23A7696E8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A58);
  swift_dynamicCast();
  v13 = (void *)v17[1];
  v7(v5, v17[0], v2);
  v14 = swift_allocObject();
  v10(v14 + v8, v5, v2);
  v22 = sub_23A7581F0;
  v23 = v14;
  aBlock = MEMORY[0x24BDAC760];
  v19 = 1107296256;
  v20 = sub_23A757E4C;
  v21 = &block_descriptor_33;
  v15 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v13, sel_checkInWithCompletionHandler_, v15);
  _Block_release(v15);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A757D58(void *a1)
{
  id v1;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A80);
  return sub_23A769538();
}

void sub_23A757D9C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_23A757DEC(void *a1)
{
  id v1;

  if (a1)
  {
    v1 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A80);
    return sub_23A769538();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A80);
    return sub_23A769544();
  }
}

void sub_23A757E4C(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

id XPCManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void XPCManager.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23A757EF8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A757F5C;
  return v6(a1);
}

uint64_t sub_23A757F5C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_4();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A757F84()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4AA8);
  if (dynamic_cast_existential_0_class_conditional(v0))
    return __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A08);
  else
    return __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4AB0);
}

uint64_t sub_23A757FC0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_23A757FE4()
{
  uint64_t v0;

  sub_23A756EE4(v0);
}

void sub_23A757FEC()
{
  uint64_t v0;

  sub_23A757018(v0);
}

void sub_23A757FF4(uint64_t a1)
{
  uint64_t v1;

  sub_23A757108(a1, v1);
}

uint64_t sub_23A757FFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23A755E54();
  *a1 = result;
  return result;
}

uint64_t sub_23A758028@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23A755F28();
  *a1 = result;
  return result;
}

uint64_t sub_23A758054()
{
  return type metadata accessor for XPCManager();
}

uint64_t sub_23A75805C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A76937C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for XPCManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCManager.clientQueue.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of XPCManager.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of XPCManager.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of XPCManager.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of XPCManager.__allocating_init(clientContext:dispatcher:clientQueue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t dispatch thunk of XPCManager.addCheckInObserver(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of XPCManager.connection.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t sub_23A7581D4(uint64_t a1)
{
  return sub_23A757B14(a1);
}

uint64_t sub_23A7581E0(uint64_t a1)
{
  return sub_23A7581FC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_23A757D58);
}

uint64_t sub_23A7581F0(uint64_t a1)
{
  return sub_23A7581FC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_23A757DEC);
}

uint64_t sub_23A7581FC(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A80) - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

uint64_t sub_23A75824C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_23A758278(uint64_t a1)
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
  v7[1] = sub_23A7582E4;
  return sub_23A757358(a1, v4, v5, v6);
}

uint64_t sub_23A7582E4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A758310(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A758350()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A758374(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A7583E4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2569B7C80 + dword_2569B7C80))(a1, v4);
}

uint64_t sub_23A7583E4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_4();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A75840C(uint64_t result)
{
  _QWORD *v1;

  if (result + 1 > *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
    return sub_23A769514();
  return result;
}

void sub_23A758438()
{
  uint64_t v0;

  sub_23A7578FC(v0);
}

unint64_t sub_23A758440()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542D4A60;
  if (!qword_2542D4A60)
  {
    v1 = sub_23A7693DC();
    result = MEMORY[0x23B856A18](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_2542D4A60);
  }
  return result;
}

unint64_t sub_23A758480()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542D4A78;
  if (!qword_2542D4A78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2542D4A70);
    result = MEMORY[0x23B856A18](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2542D4A78);
  }
  return result;
}

uint64_t sub_23A7584C4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_23A7584E8()
{
  uint64_t v0;

  return sub_23A757958(*(void **)(v0 + 16));
}

uint64_t sub_23A7584F4(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t dynamic_cast_existential_0_class_conditional(uint64_t a1)
{
  if (swift_isClassType())
    return a1;
  else
    return 0;
}

void OUTLINED_FUNCTION_0_3(uint64_t a1)
{
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(a1);
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

__n128 OUTLINED_FUNCTION_2_1(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 a11)
{
  unint64_t v11;
  __n128 result;

  result = a11;
  a1[1] = a11;
  a1[2].n128_u64[0] = v11;
  return result;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_deallocObject();
}

__n128 OUTLINED_FUNCTION_6_0(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 a11)
{
  unint64_t v11;
  __n128 result;

  result = a11;
  a1[1] = a11;
  a1[2].n128_u64[0] = v11;
  return result;
}

uint64_t OUTLINED_FUNCTION_7_1(uint64_t a1, unint64_t *a2)
{
  return sub_23A754980(0, a2);
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_setDeallocating();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_setDeallocating();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_unknownObjectWeakInit();
}

void OUTLINED_FUNCTION_15_0()
{
  const void *v0;

  _Block_release(v0);
}

id OUTLINED_FUNCTION_16_0(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_release();
}

id OUTLINED_FUNCTION_19_0(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

void *OUTLINED_FUNCTION_20_0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char aBlock)
{
  return _Block_copy(&aBlock);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_unknownObjectWeakAssign();
}

void OUTLINED_FUNCTION_25_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return swift_setDeallocating();
}

void sub_23A758694()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v3 = OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_63(v3);
  if (v4)
  {
    sub_23A75B57C(v1, &qword_2542D4A00);
  }
  else
  {
    sub_23A76955C();
    OUTLINED_FUNCTION_27_1();
  }
  if (*(_QWORD *)(v0 + 16))
  {
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_52();
  }
  v5 = OUTLINED_FUNCTION_3_1();
  *(_QWORD *)(v5 + 16) = v2;
  *(_QWORD *)(v5 + 24) = v0;
  swift_task_create();
  OUTLINED_FUNCTION_25_1();
}

void sub_23A758760()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v3 = OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_63(v3);
  if (v4)
  {
    sub_23A75B57C(v1, &qword_2542D4A00);
  }
  else
  {
    sub_23A76955C();
    OUTLINED_FUNCTION_27_1();
  }
  if (*(_QWORD *)(v0 + 16))
  {
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_52();
  }
  v5 = OUTLINED_FUNCTION_3_1();
  *(_QWORD *)(v5 + 16) = v2;
  *(_QWORD *)(v5 + 24) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7F90);
  swift_task_create();
  OUTLINED_FUNCTION_25_1();
}

void AppStateController.__allocating_init()()
{
  swift_allocObject();
  AppStateController.init()();
  OUTLINED_FUNCTION_0();
}

uint64_t AppStateController.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v2 = OUTLINED_FUNCTION_43_0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_47();
  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 120) = 0;
  swift_unknownObjectWeakInit();
  OUTLINED_FUNCTION_54(OBJC_IVAR____TtC6DropIn18AppStateController_lastDropInState);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateController____lazy_storage___activation) = 0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7CA8);
  OUTLINED_FUNCTION_34_0(v4);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateController____lazy_storage___deactivation) = 0;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7CC0);
  OUTLINED_FUNCTION_34_0(v5);
  v6 = objc_msgSend(objc_allocWithZone((Class)DIDropInCenter), sel_init);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateController_center) = v6;
  sub_23A769370();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v0 + OBJC_IVAR____TtC6DropIn18AppStateController_logger, v1, v2);
  v7 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AppStateControllerSessionObserver()), sel_init);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6DropIn18AppStateController_observer) = v7;
  v8 = *(void **)(v0 + OBJC_IVAR____TtC6DropIn18AppStateController_center);
  objc_msgSend(v8, sel_setDelegate_, v7);
  v9 = objc_msgSend(v8, sel_sessionManager);
  objc_msgSend(v9, sel_setDelegate_, v7);

  swift_weakAssign();
  return v0;
}

uint64_t sub_23A758A34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_23A758A48()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[3] = v0;
  v2 = OUTLINED_FUNCTION_43_0();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_39_0();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_23A758A8C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = sub_23A758E48();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_23A758AC4()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(v0 + 56) + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
  *(_QWORD *)(v0 + 64) = v1;
  v2 = v1;
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_23A758B10()
{
  uint64_t v0;
  void *v1;
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;

  v1 = *(void **)(v0 + 64);

  if (v1)
    goto LABEL_2;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR____TtC6DropIn18AppStateController_center), sel_sessionManager);
  v4 = objc_msgSend(v3, sel_incomingPendingSession);
  *(_QWORD *)(v0 + 72) = v4;

  if (!v4)
    goto LABEL_2;
  if (objc_msgSend(v4, sel_state) != (id)2)
  {

LABEL_2:
    swift_task_dealloc();
    return OUTLINED_FUNCTION_8_2(*(uint64_t (**)(void))(v0 + 8));
  }
  v5 = *(NSObject **)(v0 + 48);
  OUTLINED_FUNCTION_16_1(*(_QWORD *)(v0 + 40));
  v6 = v4;
  sub_23A769364();
  v7 = OUTLINED_FUNCTION_32_0();
  if (os_log_type_enabled(v5, v7))
  {
    v8 = (uint8_t *)OUTLINED_FUNCTION_7();
    v11 = (_QWORD *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v8 = 138412290;
    *(_QWORD *)(v0 + 16) = v6;
    v9 = v6;
    OUTLINED_FUNCTION_69();
    *v11 = v4;

    OUTLINED_FUNCTION_33_0(&dword_23A742000, v5, v7, "Handling the pending session: %@", v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v10;
  *v10 = v0;
  v10[1] = sub_23A758D18;
  return sub_23A759F04((uint64_t)v6);
}

uint64_t sub_23A758D18()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  OUTLINED_FUNCTION_22_1(&v2);
  OUTLINED_FUNCTION_39_0();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_23A758D60()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

void sub_23A758D90()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A00);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_46();
  v1 = sub_23A769568();
  OUTLINED_FUNCTION_45(v1);
  v2 = (_QWORD *)OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_30_0(v2);
  OUTLINED_FUNCTION_67();
  swift_release();
  OUTLINED_FUNCTION_56();
}

uint64_t sub_23A758E00()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A75B6D8;
  return sub_23A7597B0();
}

uint64_t sub_23A758E48()
{
  return sub_23A758E9C(&OBJC_IVAR____TtC6DropIn18AppStateController____lazy_storage___activation, (void (*)(void))type metadata accessor for AppStateActivation, sub_23A7505DC);
}

uint64_t sub_23A758E64()
{
  return sub_23A758F30((uint64_t *)&unk_2569B7FE0);
}

uint64_t sub_23A758E80()
{
  return sub_23A758E9C(&OBJC_IVAR____TtC6DropIn18AppStateController____lazy_storage___deactivation, (void (*)(void))type metadata accessor for AppStateDeactivation, sub_23A75D85C);
}

uint64_t sub_23A758E9C(uint64_t *a1, void (*a2)(void), uint64_t (*a3)(void))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v4 = *a1;
  v5 = *(_QWORD *)(v3 + *a1);
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    v8 = v3;
    a2();
    swift_allocObject();
    v6 = a3();
    *(_QWORD *)(v8 + v4) = v6;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v6;
}

uint64_t sub_23A758F14()
{
  return sub_23A758F30(&qword_2569B7FD8);
}

uint64_t sub_23A758F30(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v1 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_0();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE6CA0], v1);
  sub_23A76958C();
  return swift_release();
}

uint64_t sub_23A758FFC(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_47();
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v12 = result;
    v13 = __swift_instantiateConcreteTypeFromMangledName(a4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v5, a1, v13);
    __swift_storeEnumTagSinglePayload(v5, 0, 1, v13);
    v14 = v12 + *a5;
    swift_beginAccess();
    sub_23A75B688(v5, v14, a3);
    swift_endAccess();
    return swift_release();
  }
  return result;
}

void sub_23A7590F8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A00);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_54(OBJC_IVAR____TtC6DropIn18AppStateController_lastDropInState);
  v1 = sub_23A769568();
  OUTLINED_FUNCTION_45(v1);
  v2 = (_QWORD *)OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_30_0(v2);
  OUTLINED_FUNCTION_67();
  swift_release();
  OUTLINED_FUNCTION_56();
}

uint64_t sub_23A759174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_23A75918C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = sub_23A758E48();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_23A7591C4()
{
  sub_23A750794();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_23A7591F8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = sub_23A758E80();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_23A759230()
{
  uint64_t v0;

  sub_23A75DA00();
  OUTLINED_FUNCTION_34();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A75925C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7FB0);
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_39_0();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_23A7592A8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = sub_23A758E48();
  *(_QWORD *)(v0 + 64) = OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_0();
  swift_retain();
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_4_2();
}

uint64_t sub_23A759308()
{
  uint64_t v0;

  sub_23A7506D0((uint64_t)sub_23A75B53C, *(_QWORD *)(v0 + 64));
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_68();
  return OUTLINED_FUNCTION_4_2();
}

void sub_23A759358()
{
  OUTLINED_FUNCTION_61();
}

uint64_t sub_23A759380(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(v1 + 24) + 120);
    swift_getObjectType();
    sub_23A758E64();
    OUTLINED_FUNCTION_40_0(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_50();
  }
  *(_QWORD *)(v1 + 72) = sub_23A758E48();
  return OUTLINED_FUNCTION_10_1();
}

uint64_t sub_23A7593DC()
{
  uint64_t v0;

  sub_23A750708(*(void **)(v0 + 16));
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_6_1(*(uint64_t (**)(void))(v0 + 8));
}

void sub_23A759418(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  char v18;
  uint64_t Strong;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7CA8);
  v29 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7D08);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v29 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v29 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7FB8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(void **)a1;
  v18 = *(_BYTE *)(a1 + 8);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v20 = Strong + OBJC_IVAR____TtC6DropIn18AppStateController_activationStatesContinuation;
    if ((v18 & 1) != 0)
    {
      swift_beginAccess();
      sub_23A75B544(v20, (uint64_t)v8, &qword_2569B7D08);
      if (!__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v2))
      {
        v23 = v29;
        (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v4, v8, v2);
        v24 = v17;
        sub_23A75B57C((uint64_t)v8, &qword_2569B7D08);
        v30 = v17;
        v25 = v17;
        sub_23A769580();
        swift_release();
        sub_23A75B570(v17, 1);
        (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v2);
        return;
      }
      swift_release();
      v21 = (uint64_t)v8;
      goto LABEL_12;
    }
    swift_beginAccess();
    sub_23A75B544(v20, (uint64_t)v13, &qword_2569B7D08);
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v2))
    {
      sub_23A75B57C((uint64_t)v13, &qword_2569B7D08);
      v22 = 1;
    }
    else
    {
      v26 = v29;
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v4, v13, v2);
      sub_23A75B57C((uint64_t)v13, &qword_2569B7D08);
      LOBYTE(v30) = (_BYTE)v17;
      sub_23A769574();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v4, v2);
      v22 = 0;
    }
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7FC0);
    __swift_storeEnumTagSinglePayload((uint64_t)v16, v22, 1, v27);
    sub_23A75B57C((uint64_t)v16, &qword_2569B7FB8);
    if (v17 == 11)
    {
      sub_23A75B544(v20, (uint64_t)v11, &qword_2569B7D08);
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v2))
      {
        swift_release();
        v21 = (uint64_t)v11;
LABEL_12:
        sub_23A75B57C(v21, &qword_2569B7D08);
        return;
      }
      v28 = v29;
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v4, v11, v2);
      sub_23A75B57C((uint64_t)v11, &qword_2569B7D08);
      v30 = 0;
      sub_23A769580();
      swift_release();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v4, v2);
    }
    else
    {
      swift_release();
    }
  }
}

uint64_t sub_23A7597B0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7F98);
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_39_0();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_23A7597FC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = sub_23A758E80();
  *(_QWORD *)(v0 + 56) = OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_0();
  swift_retain();
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_4_2();
}

uint64_t sub_23A75985C()
{
  uint64_t v0;

  sub_23A7506D0((uint64_t)sub_23A75B534, *(_QWORD *)(v0 + 56));
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_68();
  return OUTLINED_FUNCTION_4_2();
}

void sub_23A7598AC()
{
  OUTLINED_FUNCTION_61();
}

uint64_t sub_23A7598D4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  if (a1)
  {
    v2 = *(_QWORD *)(v1[2] + 120);
    swift_getObjectType();
    sub_23A758F14();
    OUTLINED_FUNCTION_40_0(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 24));
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_50();
  }
  v1[8] = sub_23A758E80();
  v1[9] = sub_23A758E48();
  return OUTLINED_FUNCTION_10_1();
}

uint64_t sub_23A759938()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(v0 + 72) + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
  *(_QWORD *)(v0 + 80) = v1;
  v2 = v1;
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_23A759984()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 88) = sub_23A758E48();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_23A7599BC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 96) = *(_QWORD *)(*(_QWORD *)(v0 + 88) + OBJC_IVAR____TtC6DropIn18AppStateActivation_ongoingTonePlayer);
  swift_retain();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_23A759A08()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 80);
  sub_23A75D948(v1, *(_QWORD *)(v0 + 96));
  swift_release();

  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_35_0();
  return OUTLINED_FUNCTION_6_1(*(uint64_t (**)(void))(v0 + 8));
}

void sub_23A759A64(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  char v18;
  uint64_t Strong;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7CC0);
  v29 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7D10);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v29 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v29 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7FA0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(void **)a1;
  v18 = *(_BYTE *)(a1 + 8);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v20 = Strong + OBJC_IVAR____TtC6DropIn18AppStateController_deactivationStatesContinuation;
    if ((v18 & 1) != 0)
    {
      swift_beginAccess();
      sub_23A75B544(v20, (uint64_t)v8, &qword_2569B7D10);
      if (!__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v2))
      {
        v23 = v29;
        (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v4, v8, v2);
        v24 = v17;
        sub_23A75B57C((uint64_t)v8, &qword_2569B7D10);
        v30 = v17;
        v25 = v17;
        sub_23A769580();
        swift_release();
        sub_23A75B570(v17, 1);
        (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v2);
        return;
      }
      swift_release();
      v21 = (uint64_t)v8;
      goto LABEL_12;
    }
    swift_beginAccess();
    sub_23A75B544(v20, (uint64_t)v13, &qword_2569B7D10);
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v2))
    {
      sub_23A75B57C((uint64_t)v13, &qword_2569B7D10);
      v22 = 1;
    }
    else
    {
      v26 = v29;
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v4, v13, v2);
      sub_23A75B57C((uint64_t)v13, &qword_2569B7D10);
      LOBYTE(v30) = (_BYTE)v17;
      sub_23A769574();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v4, v2);
      v22 = 0;
    }
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7FA8);
    __swift_storeEnumTagSinglePayload((uint64_t)v16, v22, 1, v27);
    sub_23A75B57C((uint64_t)v16, &qword_2569B7FA0);
    if (v17 == 11)
    {
      sub_23A75B544(v20, (uint64_t)v11, &qword_2569B7D10);
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v2))
      {
        swift_release();
        v21 = (uint64_t)v11;
LABEL_12:
        sub_23A75B57C(v21, &qword_2569B7D10);
        return;
      }
      v28 = v29;
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v4, v11, v2);
      sub_23A75B57C((uint64_t)v11, &qword_2569B7D10);
      v30 = 0;
      sub_23A769580();
      swift_release();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v4, v2);
    }
    else
    {
      swift_release();
    }
  }
}

uint64_t sub_23A759DFC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_38_0();
}

uint64_t sub_23A759E10()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = sub_23A758E48();
  *(_BYTE *)(v0 + 32) = 8;
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_23A759E50()
{
  uint64_t v0;

  sub_23A750740((char *)(v0 + 32));
  OUTLINED_FUNCTION_34();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A759E80()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_38_0();
}

uint64_t sub_23A759E94()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = sub_23A758E80();
  *(_BYTE *)(v0 + 32) = 5;
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_23A759ED4()
{
  uint64_t v0;

  sub_23A75D9AC((char *)(v0 + 32));
  OUTLINED_FUNCTION_34();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A759F04(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[20] = a1;
  v2[21] = v1;
  v3 = OUTLINED_FUNCTION_43_0();
  v2[22] = v3;
  v2[23] = *(_QWORD *)(v3 - 8);
  v2[24] = OUTLINED_FUNCTION_14_1();
  v2[25] = OUTLINED_FUNCTION_14_1();
  v2[26] = OUTLINED_FUNCTION_14_1();
  v2[27] = OUTLINED_FUNCTION_14_1();
  v2[28] = OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_39_0();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_23A759F74()
{
  _QWORD *v0;
  os_log_type_t v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  id v6;
  os_log_type_t v7;
  void *v8;
  uint8_t *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  _QWORD *v16;

  v2 = (void *)v0[20];
  v3 = v0[28];
  v4 = v0[23];
  v0[29] = OBJC_IVAR____TtC6DropIn18AppStateController_logger;
  v5 = *(uint64_t (**)(uint64_t))(v4 + 16);
  v0[30] = v5;
  OUTLINED_FUNCTION_28_0(v5);
  v6 = v2;
  sub_23A769364();
  v7 = OUTLINED_FUNCTION_32_0();
  if (OUTLINED_FUNCTION_15_1(v7))
  {
    v8 = (void *)v0[20];
    v9 = (uint8_t *)OUTLINED_FUNCTION_7();
    v16 = (_QWORD *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v9 = 138412290;
    v0[19] = v8;
    v10 = v8;
    sub_23A7696D0();
    *v16 = v8;

    OUTLINED_FUNCTION_33_0(&dword_23A742000, v3, v1, "Did receive incoming pending session %@.", v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }
  v11 = (void *)v0[20];

  v12 = v0[28];
  v13 = v0[22];
  v14 = *(void (**)(uint64_t, uint64_t))(v0[23] + 8);
  v0[31] = v14;
  v14(v12, v13);
  v0[32] = sub_23A758E48();
  return swift_task_switch();
}

uint64_t sub_23A75A0F4()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(v0 + 256) + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
  *(_QWORD *)(v0 + 264) = v1;
  v2 = v1;
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_23A75A140()
{
  uint64_t v0;
  void *v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;

  v1 = *(void **)(v0 + 264);
  if (!v1)
    OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_28_0(*(uint64_t (**)(uint64_t))(v0 + 240));
  v2 = v1;
  v3 = sub_23A769364();
  v4 = sub_23A7695E0();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(void **)(v0 + 264);
  if (v5)
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_7();
    v8 = (_QWORD *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v7 = 138412290;
    *(_QWORD *)(v0 + 144) = v6;
    v9 = v6;
    OUTLINED_FUNCTION_57();
    *v8 = v6;

    OUTLINED_FUNCTION_33_0(&dword_23A742000, v3, v4, "Already processing a different Drop In session. Ignoring incoming session for now. Active Session: %@.", v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }

  (*(void (**)(_QWORD, _QWORD))(v0 + 248))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 176));
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_35_0();
  return OUTLINED_FUNCTION_9_2(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A75A50C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 280) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_23A75A564()
{
  uint64_t v0;
  void (*v1)(NSObject *, uint64_t, uint64_t);
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  os_log_type_t v8;
  void *v9;
  uint8_t *v10;
  id v11;
  void (*v12)(uint64_t);
  uint64_t v13;
  _QWORD *v15;

  v2 = *(_QWORD *)(v0 + 232);
  v1 = *(void (**)(NSObject *, uint64_t, uint64_t))(v0 + 240);
  v3 = *(NSObject **)(v0 + 200);
  v5 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 176);
  v6 = *(void **)(v0 + 160);

  v1(v3, v5 + v2, v4);
  v7 = v6;
  sub_23A769364();
  v8 = OUTLINED_FUNCTION_32_0();
  if (os_log_type_enabled(v3, v8))
  {
    v9 = *(void **)(v0 + 160);
    v10 = (uint8_t *)OUTLINED_FUNCTION_7();
    v15 = (_QWORD *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v10 = 138412290;
    *(_QWORD *)(v0 + 136) = v9;
    v11 = v9;
    sub_23A7696D0();
    *v15 = v9;

    OUTLINED_FUNCTION_33_0(&dword_23A742000, v3, v8, "Canceled session: %@", v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }

  v12 = *(void (**)(uint64_t))(v0 + 248);
  v13 = OUTLINED_FUNCTION_65();
  v12(v13);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_35_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A75A6F0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v3 = *v0;
  v1 = *v0;
  OUTLINED_FUNCTION_22_1(&v3);
  swift_task_dealloc();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_35_0();
  return OUTLINED_FUNCTION_6_1(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23A75A754()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *log;

  v1 = *(void **)(v0 + 272);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 240);
  v3 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 176);
  v5 = *(void **)(v0 + 160);
  v6 = *(_QWORD *)(v0 + 168) + *(_QWORD *)(v0 + 232);
  swift_willThrow();

  v2(v3, v6, v4);
  v7 = v5;
  OUTLINED_FUNCTION_62();
  v8 = v7;
  OUTLINED_FUNCTION_62();
  v9 = sub_23A769364();
  v10 = sub_23A7695D4();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(void **)(v0 + 160);
    log = v9;
    v12 = OUTLINED_FUNCTION_7();
    v13 = (_QWORD *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v12 = 138412546;
    OUTLINED_FUNCTION_62();
    v14 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 120) = v14;
    sub_23A7696D0();
    *v13 = v14;
    OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_25_0();
    *(_WORD *)(v12 + 12) = 2112;
    *(_QWORD *)(v0 + 128) = v11;
    v15 = v11;
    OUTLINED_FUNCTION_69();
    v13[1] = v11;

    _os_log_impl(&dword_23A742000, log, v10, "Failed to cancel session: %@. Session: %@.", (uint8_t *)v12, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_1();
  }
  v16 = *(void **)(v0 + 160);
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_25_0();

  (*(void (**)(_QWORD, _QWORD))(v0 + 248))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 176));
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_35_0();
  return OUTLINED_FUNCTION_8_2(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A75A944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[8] = a3;
  v4[9] = v3;
  v4[6] = a1;
  v4[7] = a2;
  v5 = OUTLINED_FUNCTION_43_0();
  v4[10] = v5;
  v4[11] = *(_QWORD *)(v5 - 8);
  v4[12] = OUTLINED_FUNCTION_14_1();
  v4[13] = OUTLINED_FUNCTION_14_1();
  v4[14] = OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_39_0();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_23A75A9A8()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint8_t *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v14;
  void (*v15)(uint64_t);

  v2 = *(_QWORD *)(v0 + 72);
  v3 = OBJC_IVAR____TtC6DropIn18AppStateController_lastDropInState;
  *(_QWORD *)(v0 + 120) = OBJC_IVAR____TtC6DropIn18AppStateController_lastDropInState;
  v4 = v2 + v3;
  if ((*(_BYTE *)(v4 + 8) & 1) != 0 || *(_QWORD *)v4 != *(_QWORD *)(v0 + 56))
  {
    *(_QWORD *)(v0 + 128) = sub_23A758E48();
    return swift_task_switch();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 88) + 16))(*(_QWORD *)(v0 + 96), v2 + OBJC_IVAR____TtC6DropIn18AppStateController_logger, *(_QWORD *)(v0 + 80));
    v5 = sub_23A769364();
    v6 = sub_23A7695BC();
    if (OUTLINED_FUNCTION_15_1(v6))
    {
      v7 = *(_QWORD *)(v0 + 56);
      v8 = (uint8_t *)OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_7();
      *(_DWORD *)v8 = 136315138;
      v9 = objc_msgSend((id)objc_opt_self(), sel_stringForDropInSessionState_, v7);
      sub_23A76949C();

      v10 = OUTLINED_FUNCTION_65();
      *(_QWORD *)(v0 + 40) = sub_23A760AD0(v10, v11, v12);
      OUTLINED_FUNCTION_69();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_33_0(&dword_23A742000, v5, v1, "Ignoring repeated state update: %s", v8);
      OUTLINED_FUNCTION_33();
      OUTLINED_FUNCTION_0_1();
    }

    v14 = OUTLINED_FUNCTION_65();
    v15(v14);
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_11_0();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A75ABB4()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(v0 + 128) + OBJC_IVAR____TtC6DropIn18AppStateActivation_session);
  *(_QWORD *)(v0 + 136) = v1;
  v2 = v1;
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_18_0();
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_23A75AC00()
{
  uint64_t v0;
  os_log_type_t v1;
  void *v2;
  unsigned int v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  os_log_type_t v20;
  _BOOL4 v21;
  void *v22;
  uint8_t *v23;
  _QWORD *v24;
  id v25;
  uint64_t v27;
  void (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;

  v2 = *(void **)(v0 + 136);
  if (!v2
    || (v3 = objc_msgSend(*(id *)(v0 + 136), sel_isEqual_, *(_QWORD *)(v0 + 48)), v2, !v3))
  {
    v17 = *(NSObject **)(v0 + 104);
    v18 = *(void **)(v0 + 48);
    OUTLINED_FUNCTION_16_1(*(_QWORD *)(v0 + 88));
    v19 = v18;
    sub_23A769364();
    v20 = OUTLINED_FUNCTION_32_0();
    v21 = OUTLINED_FUNCTION_15_1(v20);
    v22 = *(void **)(v0 + 48);
    if (v21)
    {
      v23 = (uint8_t *)OUTLINED_FUNCTION_7();
      v24 = (_QWORD *)OUTLINED_FUNCTION_7();
      *(_DWORD *)v23 = 138412290;
      *(_QWORD *)(v0 + 16) = v22;
      v25 = v22;
      OUTLINED_FUNCTION_57();
      *v24 = v22;

      OUTLINED_FUNCTION_33_0(&dword_23A742000, v17, v1, "Ignoring session update from %@. A different session is already processing.", v23);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
      OUTLINED_FUNCTION_33();
      OUTLINED_FUNCTION_0_1();
    }

    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80));
    goto LABEL_8;
  }
  v4 = *(NSObject **)(v0 + 112);
  OUTLINED_FUNCTION_16_1(*(_QWORD *)(v0 + 88));
  sub_23A769364();
  v5 = OUTLINED_FUNCTION_32_0();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v0 + 56);
    v33 = *(_QWORD *)(v0 + 64);
    v7 = OUTLINED_FUNCTION_7();
    v34 = OUTLINED_FUNCTION_7();
    *(_DWORD *)v7 = 136315394;
    v8 = (void *)objc_opt_self();
    v9 = objc_msgSend(v8, sel_stringForDropInSessionState_, v6);
    v10 = sub_23A76949C();
    v12 = v11;

    *(_QWORD *)(v0 + 24) = sub_23A760AD0(v10, v12, &v34);
    sub_23A7696D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    v13 = objc_msgSend(v8, sel_stringForDropInSessionStateReason_, v33);
    v14 = sub_23A76949C();
    v16 = v15;

    *(_QWORD *)(v0 + 32) = sub_23A760AD0(v14, v16, &v34);
    sub_23A7696D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A742000, v4, v5, "Drop in session updated state: %s. Reason: %s.", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_1();
  }

  v27 = OUTLINED_FUNCTION_65();
  v28(v27);
  v29 = *(_QWORD *)(v0 + 56);
  v30 = *(_QWORD *)(v0 + 72) + *(_QWORD *)(v0 + 120);
  *(_QWORD *)v30 = v29;
  *(_BYTE *)(v30 + 8) = 0;
  if ((unint64_t)(v29 - 6) < 2)
  {
    v31 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v31;
    *v31 = v0;
    v31[1] = sub_23A75B01C;
    OUTLINED_FUNCTION_19_1();
    return sub_23A759E80();
  }
  if (v29 != 4)
  {
LABEL_8:
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_11_0();
    return OUTLINED_FUNCTION_9_2(*(uint64_t (**)(void))(v0 + 8));
  }
  v32 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v32;
  *v32 = v0;
  v32[1] = sub_23A75AFD4;
  OUTLINED_FUNCTION_19_1();
  return sub_23A759DFC();
}

uint64_t sub_23A75AFD4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v3 = *v0;
  v1 = *v0;
  OUTLINED_FUNCTION_22_1(&v3);
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_6_1(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_23A75B01C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v3 = *v0;
  v1 = *v0;
  OUTLINED_FUNCTION_22_1(&v3);
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_6_1(*(uint64_t (**)(void))(v1 + 8));
}

void AppStateController.deinit()
{
  uint64_t v0;
  uint64_t v1;

  sub_23A7584F4(v0 + 112);
  v1 = OUTLINED_FUNCTION_43_0();
  OUTLINED_FUNCTION_37_0(v1);

  swift_release();
  sub_23A75B57C(v0 + OBJC_IVAR____TtC6DropIn18AppStateController_activationStatesContinuation, &qword_2569B7D08);
  swift_release();
  sub_23A75B57C(v0 + OBJC_IVAR____TtC6DropIn18AppStateController_deactivationStatesContinuation, &qword_2569B7D10);
  swift_defaultActor_destroy();
  OUTLINED_FUNCTION_0();
}

uint64_t AppStateController.__deallocating_deinit()
{
  AppStateController.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t AppStateController.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23A75B134()
{
  return AppStateController.unownedExecutor.getter();
}

unint64_t sub_23A75B14C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B7CF8;
  if (!qword_2569B7CF8)
  {
    v1 = type metadata accessor for AppStateController();
    result = MEMORY[0x23B856A18](&protocol conformance descriptor for AppStateController, v1);
    atomic_store(result, (unint64_t *)&qword_2569B7CF8);
  }
  return result;
}

uint64_t type metadata accessor for AppStateController()
{
  uint64_t result;

  result = qword_2569B7D40;
  if (!qword_2569B7D40)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A75B1C8()
{
  uint64_t v0;
  _QWORD *v1;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_59(v0);
  OUTLINED_FUNCTION_42_0(v1);
  return sub_23A758E00();
}

uint64_t dispatch thunk of AppStateControllerDelegate.shouldProceedWithIncomingSession()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppStateControllerDelegate.willActivate(stateStream:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of AppStateControllerDelegate.willDeactivate(stateStream:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_23A75B234()
{
  return type metadata accessor for AppStateController();
}

void sub_23A75B23C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23A76937C();
  if (v0 <= 0x3F)
  {
    sub_23A75B3C8(319, &qword_2569B7D80, &qword_2569B7CA8);
    if (v1 <= 0x3F)
    {
      sub_23A75B3C8(319, qword_2569B7D88, &qword_2569B7CC0);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for AppStateController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppStateController.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AppStateController.setDelegate(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of AppStateController.checkPendingSession()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 176) + *(_QWORD *)(*(_QWORD *)v0 + 176));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A75B6D8;
  return OUTLINED_FUNCTION_5(v4);
}

uint64_t dispatch thunk of AppStateController.announceDropIn()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of AppStateController.cancelSession()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of AppStateController.endSession()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

void sub_23A75B3C8(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_23A7696C4();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_23A75B414(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_23A75B47C;
  return v5(v2 + 32);
}

uint64_t sub_23A75B47C()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v5;

  v1 = *v0;
  v5 = v1;
  v2 = *(_BYTE **)(v1 + 16);
  v3 = *v0;
  OUTLINED_FUNCTION_22_1(&v5);
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_23A75B4C8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_59(v0);
  v2 = OUTLINED_FUNCTION_29_0(v1);
  return OUTLINED_FUNCTION_23_1(v2, v3, v4, v5);
}

uint64_t sub_23A75B510()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_23A75B534(uint64_t a1)
{
  sub_23A759A64(a1);
}

void sub_23A75B53C(uint64_t a1)
{
  sub_23A759418(a1);
}

void sub_23A75B544(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_53(a1, a2, a3);
  OUTLINED_FUNCTION_66(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_0();
}

void sub_23A75B570(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

void sub_23A75B57C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_37_0(v2);
  OUTLINED_FUNCTION_0();
}

uint64_t objectdestroyTm_0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A75B5D4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_59(v0);
  v2 = OUTLINED_FUNCTION_42_0(v1);
  return sub_23A759174(v2, v3, v4, v5);
}

uint64_t sub_23A75B628(uint64_t a1)
{
  uint64_t v1;

  return sub_23A758FFC(a1, v1, &qword_2569B7D10, &qword_2569B7CC0, &OBJC_IVAR____TtC6DropIn18AppStateController_deactivationStatesContinuation);
}

uint64_t sub_23A75B658(uint64_t a1)
{
  uint64_t v1;

  return sub_23A758FFC(a1, v1, &qword_2569B7D08, &qword_2569B7CA8, &OBJC_IVAR____TtC6DropIn18AppStateController_activationStatesContinuation);
}

void sub_23A75B688(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_53(a1, a2, a3);
  OUTLINED_FUNCTION_66(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40));
  OUTLINED_FUNCTION_0();
}

uint64_t sub_23A75B6B4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_8_2(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_9_2(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return swift_task_alloc();
}

BOOL OUTLINED_FUNCTION_15_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_16_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(v3, v1 + v2);
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_22_1@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_23_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_28_0@<X0>(uint64_t (*a1)(uint64_t)@<X8>)
{
  uint64_t v1;

  return a1(v1);
}

uint64_t OUTLINED_FUNCTION_29_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_30_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  a1[2] = v1;
  a1[3] = v2;
  a1[4] = v1;
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return sub_23A7695E0();
}

void OUTLINED_FUNCTION_33_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_34_0(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_37_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_40_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_42_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return sub_23A76937C();
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return sub_23A769568();
}

unint64_t OUTLINED_FUNCTION_45(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return sub_23A75B14C();
}

uint64_t OUTLINED_FUNCTION_49()
{
  return sub_23A76952C();
}

uint64_t OUTLINED_FUNCTION_50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_52()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_53(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

void OUTLINED_FUNCTION_54(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + a1;
  *(_QWORD *)v2 = 0;
  *(_BYTE *)(v2 + 8) = 1;
}

uint64_t OUTLINED_FUNCTION_55()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_57()
{
  return sub_23A7696D0();
}

uint64_t OUTLINED_FUNCTION_58()
{
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_59(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_getObjectType();
}

void OUTLINED_FUNCTION_61()
{
  JUMPOUT(0x23B856B50);
}

id OUTLINED_FUNCTION_62()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_63(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_64()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_65()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_66@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void OUTLINED_FUNCTION_67()
{
  sub_23A758694();
}

uint64_t OUTLINED_FUNCTION_68()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_69()
{
  return sub_23A7696D0();
}

void sub_23A75BA68(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A00);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0_2();
  v7 = v6 - v5;
  sub_23A769550();
  v8 = OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_5_2(v7, v9, v10, v8);
  v11 = (_QWORD *)OUTLINED_FUNCTION_3_1();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v2;
  v11[5] = a2;
  v12 = v2;
  v13 = a2;
  sub_23A758760();
  swift_release();
  OUTLINED_FUNCTION_56();
}

uint64_t sub_23A75BB04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23A75BB20()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = OUTLINED_FUNCTION_11_1();
  v0[5] = v1;
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc();
    v0[6] = (uint64_t)v2;
    *v2 = v0;
    v2[1] = sub_23A75BB94;
    return sub_23A759F04(v0[4]);
  }
  else
  {
    v4 = (uint64_t (*)(void))OUTLINED_FUNCTION_4_3();
    return OUTLINED_FUNCTION_5(v4);
  }
}

uint64_t sub_23A75BB94()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_12_1();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_23A75BBCC()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_2_2(*(_QWORD *)(v0 + 40));
}

void sub_23A75BC34(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  id v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A00);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0_2();
  v10 = v9 - v8;
  sub_23A769550();
  v11 = OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_5_2(v10, v12, v13, v11);
  v14 = (_QWORD *)OUTLINED_FUNCTION_3_1();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = v3;
  v14[5] = a1;
  v14[6] = a2;
  v14[7] = a3;
  v15 = v3;
  v16 = a1;
  sub_23A758760();
  swift_release();
  OUTLINED_FUNCTION_14_2();
}

uint64_t sub_23A75BCE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23A75BD00()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = OUTLINED_FUNCTION_11_1();
  v0[7] = v1;
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc();
    v0[8] = (uint64_t)v2;
    *v2 = v0;
    v2[1] = sub_23A75BD78;
    return sub_23A75A944(v0[4], v0[5], v0[6]);
  }
  else
  {
    v4 = (uint64_t (*)(void))OUTLINED_FUNCTION_4_3();
    return OUTLINED_FUNCTION_5(v4);
  }
}

uint64_t sub_23A75BD78()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_12_1();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_23A75BDB0()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_2_2(*(_QWORD *)(v0 + 56));
}

void sub_23A75BE1C(void *a1, void *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  id v14;
  id v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A00);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0_2();
  v8 = v7 - v6;
  sub_23A769550();
  v9 = OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_5_2(v8, v10, v11, v9);
  v12 = (_QWORD *)OUTLINED_FUNCTION_3_1();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v2;
  v12[5] = a1;
  v12[6] = a2;
  v13 = v2;
  v14 = a1;
  v15 = a2;
  sub_23A758760();
  swift_release();
  OUTLINED_FUNCTION_14_2();
}

uint64_t sub_23A75BECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a4;
  return swift_task_switch();
}

uint64_t sub_23A75BEE4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = OUTLINED_FUNCTION_11_1();
  *(_QWORD *)(v0 + 32) = v1;
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 40) = v2;
    *v2 = v0;
    v2[1] = sub_23A75BF50;
    return sub_23A759E80();
  }
  else
  {
    v4 = (uint64_t (*)(void))OUTLINED_FUNCTION_4_3();
    return OUTLINED_FUNCTION_5(v4);
  }
}

uint64_t sub_23A75BF50()
{
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_12_1();
  return OUTLINED_FUNCTION_0_4();
}

void sub_23A75BFE8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A00);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_0_2();
  v4 = v3 - v2;
  sub_23A769550();
  v5 = OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_5_2(v4, v6, v7, v5);
  v8 = (_QWORD *)OUTLINED_FUNCTION_3_1();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v0;
  v9 = v0;
  sub_23A758760();
  swift_release();
  OUTLINED_FUNCTION_56();
}

uint64_t sub_23A75C07C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a4;
  return swift_task_switch();
}

uint64_t sub_23A75C094()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  v1 = OUTLINED_FUNCTION_11_1();
  *(_QWORD *)(v0 + 32) = v1;
  if (v1)
    return OUTLINED_FUNCTION_0_4();
  v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_4_3();
  return OUTLINED_FUNCTION_5(v3);
}

uint64_t sub_23A75C0E4()
{
  sub_23A7590F8();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_12_1();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_23A75C118()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_2_2(*(_QWORD *)(v0 + 32));
}

id sub_23A75C16C()
{
  void *v0;
  objc_class *ObjectType;
  objc_super v3;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_23A75C1E0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AppStateControllerSessionObserver()
{
  return objc_opt_self();
}

uint64_t sub_23A75C244()
{
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_16_2();
  return swift_deallocObject();
}

uint64_t sub_23A75C268(uint64_t a1)
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
  v7[1] = sub_23A75C2D4;
  return sub_23A75C07C(a1, v4, v5, v6);
}

uint64_t sub_23A75C2D4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_3_2();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A75C300()
{
  uint64_t v0;

  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_16_2();

  return swift_deallocObject();
}

uint64_t sub_23A75C334(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A75C4B8;
  v5[2] = a1;
  v5[3] = v4;
  OUTLINED_FUNCTION_12_1();
  return swift_task_switch();
}

uint64_t sub_23A75C394()
{
  return objectdestroy_9Tm();
}

uint64_t sub_23A75C39C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v0[5];
  v4 = v0[6];
  v3 = v0[7];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  v6 = OUTLINED_FUNCTION_9_3(v5);
  return sub_23A75BCE0(v6, v7, v8, v9, v2, v4, v3);
}

uint64_t sub_23A75C414()
{
  return objectdestroy_9Tm();
}

uint64_t objectdestroy_9Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_16_2();

  return swift_deallocObject();
}

uint64_t sub_23A75C454()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(v0 + 40);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  v4 = OUTLINED_FUNCTION_9_3(v3);
  return sub_23A75BB04(v4, v5, v6, v7, v2);
}

uint64_t OUTLINED_FUNCTION_2_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  **(_BYTE **)(v1 + 16) = a1 == 0;
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 16) = 1;
  return *(_QWORD *)(v0 + 8);
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 0, 1, a4);
}

uint64_t OUTLINED_FUNCTION_9_3(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_weakLoadStrong();
}

void OUTLINED_FUNCTION_16_2()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return swift_unknownObjectRelease();
}

void NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF0]), sel_init);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    v4 = 0;
    do
    {
      ++v4;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4AA8);
      objc_msgSend(v2, sel_addObject_, sub_23A7697FC());
      swift_unknownObjectRelease();
    }
    while (v3 != v4);
    swift_bridgeObjectRelease();
  }
  v5 = v2;
  sub_23A7695B0();

  sub_23A769790();
  __break(1u);
}

void __swiftcall DIDropInError.nsError(localizedDescription:localizedFailureReason:debugDescription:)(NSError *__return_ptr retstr, Swift::String_optional localizedDescription, Swift::String_optional localizedFailureReason, Swift::String_optional debugDescription)
{
  uint64_t v4;
  uint64_t v5;
  void *object;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
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
  id v27;
  uint64_t countAndFlagsBits;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v5 = v4;
  object = debugDescription.value._object;
  countAndFlagsBits = debugDescription.value._countAndFlagsBits;
  v7 = localizedFailureReason.value._object;
  v8 = localizedFailureReason.value._countAndFlagsBits;
  v9 = localizedDescription.value._object;
  v10 = localizedDescription.value._countAndFlagsBits;
  v11 = MEMORY[0x24BEE0D00];
  v32 = sub_23A769460();
  v12 = (unint64_t)v9;
  if (!v9)
  {
    v10 = 0xD000000000000012;
    if (v5 == 2)
    {
      v13 = "Unsupported Device";
    }
    else
    {
      if (v5 != 3)
        goto LABEL_8;
      v10 = 0xD000000000000013;
      v13 = "Drop In Not Allowed";
    }
    v12 = (unint64_t)(v13 - 32) | 0x8000000000000000;
  }
  v14 = sub_23A76949C();
  v16 = v15;
  v31 = v11;
  v29 = v10;
  v30 = v12;
  swift_bridgeObjectRetain();
  sub_23A75C910((uint64_t)&v29, v14, v16);
LABEL_8:
  if (v7)
  {
    v17 = sub_23A76949C();
    v19 = v18;
    v31 = v11;
    v29 = v8;
    v30 = (unint64_t)v7;
    swift_bridgeObjectRetain();
    sub_23A75C910((uint64_t)&v29, v17, v19);
  }
  if (object)
  {
    v20 = sub_23A76949C();
    v22 = v21;
    v31 = v11;
    v29 = countAndFlagsBits;
    v30 = (unint64_t)object;
    swift_bridgeObjectRetain();
    sub_23A75C910((uint64_t)&v29, v20, v22);
  }
  v23 = sub_23A76949C();
  v25 = v24;
  v26 = v32;
  v27 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  sub_23A75C990(v23, v25, v5, v26);
}

void DIDropInError.nsError.getter(NSError *a1@<X8>)
{
  DIDropInError.nsError(localizedDescription:localizedFailureReason:debugDescription:)(a1, (Swift::String_optional)0, (Swift::String_optional)0, (Swift::String_optional)0);
}

uint64_t sub_23A75C910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_23A75CB60((_OWORD *)a1, v6);
    sub_23A75CB70(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_23A7542E0(a1);
    sub_23A75CA3C(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_23A7542E0((uint64_t)v6);
  }
}

id sub_23A75C990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v7;
  void *v8;
  id v9;

  v7 = (void *)sub_23A769478();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v8 = (void *)sub_23A769454();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

double sub_23A75CA3C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  double result;
  uint64_t v11;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_23A754448(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    *v4 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B8190);
    sub_23A76976C();
    swift_bridgeObjectRelease();
    sub_23A75CB60((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_23A769778();
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

_OWORD *sub_23A75CB60(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23A75CB70(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_23A75CBEC(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

_OWORD *sub_23A75CBEC(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  _OWORD *v16;
  _OWORD *result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_23A754448(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B8190);
  if ((sub_23A76976C() & 1) == 0)
    goto LABEL_5;
  v13 = sub_23A754448(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = (_OWORD *)sub_23A769808();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = (_OWORD *)(v15[7] + 32 * v11);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    return sub_23A75CB60(a1, v16);
  }
  else
  {
    sub_23A75CD08(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

_OWORD *sub_23A75CD08(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_23A75CB60(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
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

void sub_23A75CD90(void *a1, uint64_t a2, void (**a3)(_QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[6];

  v5 = sub_23A7693DC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23A769400();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  if (a1)
  {
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = sub_23A75D2A4;
    *(_QWORD *)(v14 + 24) = v13;
    aBlock[4] = sub_23A75D2BC;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23A754D58;
    aBlock[3] = &block_descriptor_10;
    v15 = _Block_copy(aBlock);
    v21 = v6;
    v16 = v15;
    _Block_copy(a3);
    v17 = a1;
    v20 = v9;
    v18 = v17;
    swift_retain();
    sub_23A7693E8();
    v22 = MEMORY[0x24BEE4AF8];
    sub_23A758440();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A70);
    sub_23A758480();
    sub_23A7696F4();
    MEMORY[0x23B8562BC](0, v12, v8, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v5);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v20);
    swift_release();
  }
  else
  {
    _Block_copy(a3);
    a3[2](a3);
  }
  swift_release();
  _Block_release(a3);
}

uint64_t static DIUtilities.onQueue(_:block:)(void *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v19[2];
  _QWORD aBlock[6];

  v6 = sub_23A7693DC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23A769400();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    return a2(v12);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a2;
  *(_QWORD *)(v15 + 24) = a3;
  aBlock[4] = sub_23A75D1D4;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A754D58;
  aBlock[3] = &block_descriptor_4;
  v16 = _Block_copy(aBlock);
  v17 = a1;
  swift_retain();
  sub_23A7693E8();
  v19[1] = MEMORY[0x24BEE4AF8];
  sub_23A758440();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A70);
  sub_23A758480();
  sub_23A7696F4();
  MEMORY[0x23B8562BC](0, v14, v9, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  return swift_release();
}

uint64_t sub_23A75D1B0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A75D1D4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_23A75D280()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_23A75D2A4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_23A75D2C0()
{
  uint64_t v0;

  v0 = sub_23A76937C();
  __swift_allocate_value_buffer(v0, qword_2542D4E90);
  __swift_project_value_buffer(v0, (uint64_t)qword_2542D4E90);
  return sub_23A769370();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t DIHandleType.description.getter(uint64_t a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_msgSend((id)objc_opt_self(), sel_stringForHandleType_, a1);
  v2 = sub_23A76949C();

  return v2;
}

uint64_t sub_23A75D3F8()
{
  uint64_t *v0;

  return DIHandleType.description.getter(*v0);
}

void sub_23A75D404()
{
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_9_4();
}

void sub_23A75D428()
{
  sub_23A76985C();
  OUTLINED_FUNCTION_0();
}

void sub_23A75D450()
{
  sub_23A769850();
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_9_4();
}

uint64_t sub_23A75D47C(uint64_t a1, void *a2)
{
  if (a2)
    return sub_23A75D4B8(*(_QWORD *)(a1 + 32), (uint64_t)a2);
  else
    return j__swift_continuation_throwingResume();
}

uint64_t sub_23A75D4B8(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4AB8);
  swift_allocError();
  *v3 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t DeactivationState.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0 - 1;
}

DropIn::DeactivationState_optional __swiftcall DeactivationState.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 12;
  if ((unint64_t)(rawValue + 1) < 0xC)
    v2 = rawValue + 1;
  *v1 = v2;
  return (DropIn::DeactivationState_optional)rawValue;
}

void *static DeactivationState.allCases.getter()
{
  return &unk_250B96990;
}

BOOL sub_23A75D53C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_23A75D54C()
{
  sub_23A76985C();
  OUTLINED_FUNCTION_0();
}

void sub_23A75D56C()
{
  OUTLINED_FUNCTION_15_2();
  sub_23A76985C();
  OUTLINED_FUNCTION_25_2();
  OUTLINED_FUNCTION_9_4();
}

unint64_t sub_23A75D59C()
{
  unint64_t result;

  result = qword_2569B8198;
  if (!qword_2569B8198)
  {
    result = MEMORY[0x23B856A18](&protocol conformance descriptor for DeactivationState, &type metadata for DeactivationState);
    atomic_store(result, (unint64_t *)&qword_2569B8198);
  }
  return result;
}

void sub_23A75D5D8()
{
  sub_23A75D404();
}

void sub_23A75D5F0()
{
  sub_23A75D450();
}

DropIn::DeactivationState_optional sub_23A75D608(Swift::Int *a1)
{
  return DeactivationState.init(rawValue:)(*a1);
}

void sub_23A75D610(uint64_t *a1@<X8>)
{
  *a1 = DeactivationState.rawValue.getter();
  OUTLINED_FUNCTION_0();
}

unint64_t sub_23A75D634()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B81A0;
  if (!qword_2569B81A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569B81A8);
    result = MEMORY[0x23B856A18](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2569B81A0);
  }
  return result;
}

void sub_23A75D678(_QWORD *a1@<X8>)
{
  *a1 = &unk_250B96990;
}

uint64_t storeEnumTagSinglePayload for DeactivationState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A75D6D4 + 4 * byte_23A76B645[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_23A75D708 + 4 * byte_23A76B640[v4]))();
}

uint64_t sub_23A75D708(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A75D710(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A75D718);
  return result;
}

uint64_t sub_23A75D724(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A75D72CLL);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_23A75D730(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A75D738(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for DeactivationState()
{
  OUTLINED_FUNCTION_43();
}

BOOL sub_23A75D750(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23A75D53C(*a1, *a2);
}

void sub_23A75D75C()
{
  sub_23A75D56C();
}

void sub_23A75D764()
{
  sub_23A75D54C();
}

void sub_23A75D76C()
{
  uint64_t v0;
  void (*v1)(unint64_t *);
  void *v2;
  void *v3;
  _BYTE *v4;
  id v5;
  unint64_t v6;
  char v7;

  v1 = *(void (**)(unint64_t *))(v0 + 112);
  if (*(_BYTE *)(v0 + 128))
  {
    if (v1)
    {
      v6 = *(unsigned __int8 *)(v0 + 128);
      v7 = 0;
      swift_retain();
      v1(&v6);
      sub_23A74FDDC((uint64_t)v1);
    }
  }
  else if (v1)
  {
    v2 = *(void **)(v0 + 136);
    if (v2)
    {
      v3 = *(void **)(v0 + 136);
    }
    else
    {
      sub_23A75E7E0();
      v3 = (void *)swift_allocError();
      *v4 = 0;
    }
    v6 = (unint64_t)v3;
    v7 = 1;
    sub_23A74FDCC((uint64_t)v1);
    v5 = v2;
    v1(&v6);
    sub_23A74FDDC((uint64_t)v1);

  }
}

void sub_23A75D854(char *a1)
{
  OUTLINED_FUNCTION_7_2(*a1);
}

uint64_t sub_23A75D85C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = sub_23A76937C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_0_2();
  v5 = v4 - v3;
  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 136) = 0;
  *(_QWORD *)(v0 + 112) = 0;
  *(_QWORD *)(v0 + 120) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_session) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_endTonePlayer) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_ongoingTonePlayer) = 0;
  sub_23A769370();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_logger, v5, v1);
  *(_BYTE *)(v0 + 128) = 1;
  return v0;
}

uint64_t sub_23A75D948(void *a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  id v5;

  v4 = *(void **)(v2 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_session);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_session) = a1;
  v5 = a1;

  *(_QWORD *)(v2 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_ongoingTonePlayer) = a2;
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_7_2(2);
  return sub_23A75DA48();
}

uint64_t sub_23A75D9AC(char *a1)
{
  OUTLINED_FUNCTION_7_2(*a1);
  return sub_23A75DA48();
}

uint64_t sub_23A75D9C4(void *a1)
{
  uint64_t v1;
  id v2;
  char v4;

  *(_QWORD *)(v1 + 136) = a1;
  v2 = a1;
  OUTLINED_FUNCTION_3();
  v4 = 0;
  return sub_23A75D9AC(&v4);
}

uint64_t sub_23A75DA00()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 136);
  *(_QWORD *)(v0 + 136) = 0;

  v2 = *(void **)(v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_session);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_session) = 0;

  OUTLINED_FUNCTION_7_2(1);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_endTonePlayer) = 0;
  return swift_release();
}

uint64_t sub_23A75DA48()
{
  uint64_t v0;

  return ((uint64_t (*)())((char *)sub_23A75DA64 + 4 * byte_23A76B64A[*(unsigned __int8 *)(v0 + 128)]))();
}

void sub_23A75DA68()
{
  OUTLINED_FUNCTION_7_2(1);
}

uint64_t sub_23A75DA7C()
{
  uint64_t v0;
  Swift::Int v1;
  char v2;
  char v4;

  v1 = *(unsigned __int8 *)(v0 + 128);
  if (v1 == 11)
  {
    v2 = 11;
  }
  else
  {
    DeactivationState.init(rawValue:)(v1);
    v2 = v4;
    if (v4 == 12)
      v2 = 1;
  }
  OUTLINED_FUNCTION_7_2(v2);
  return sub_23A75DA48();
}

void sub_23A75DAC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  id v9;
  void *v10;
  _BYTE *v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A00);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_0_2();
  v4 = v3 - v2;
  if (qword_2569B7310 != -1)
    swift_once();
  if ((byte_2569B9D60 & 1) == 0)
  {
    v5 = *(void **)(v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_session);
    if (v5)
    {
      v6 = sub_23A769568();
      __swift_storeEnumTagSinglePayload(v4, 1, 1, v6);
      v7 = sub_23A75E70C();
      v8 = (_QWORD *)OUTLINED_FUNCTION_17();
      v8[2] = v0;
      v8[3] = v7;
      v8[4] = v5;
      v8[5] = v0;
      OUTLINED_FUNCTION_19();
      v9 = v5;
      sub_23A758694();
      swift_release();
    }
    else
    {
      sub_23A75E7E0();
      v10 = (void *)swift_allocError();
      *v11 = 1;
      sub_23A75D9C4(v10);

    }
  }
}

uint64_t sub_23A75DC00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 120) = a4;
  *(_QWORD *)(v5 + 128) = a5;
  return swift_task_switch();
}

uint64_t sub_23A75DC18()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)v0[15];
  v0[2] = v0;
  v0[3] = sub_23A75DCA4;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_23A75D47C;
  v3[3] = &block_descriptor_5;
  v3[4] = v2;
  objc_msgSend(v1, sel_endWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_23A75DCA4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_32();
  *v1 = *v0;
  *(_QWORD *)(v2 + 136) = *(_QWORD *)(v2 + 48);
  return swift_task_switch();
}

uint64_t sub_23A75DCFC()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  v1 = sub_23A769364();
  v2 = sub_23A7695E0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)OUTLINED_FUNCTION_7();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_23A742000, v1, v2, "Drop in session end issued", v3, 2u);
    OUTLINED_FUNCTION_0_1();
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A75DD9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  uint8_t *v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  char v11[9];

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  swift_willThrow();
  v3 = (v1 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_logger);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_24();
  sub_23A769364();
  v4 = OUTLINED_FUNCTION_30();
  if (OUTLINED_FUNCTION_10(v4))
  {
    v5 = *(void **)(v0 + 136);
    v6 = (uint8_t *)OUTLINED_FUNCTION_7();
    v7 = (_QWORD *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v6 = 138412290;
    v8 = v5;
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 80) = v9;
    sub_23A7696D0();
    *v7 = v9;

    OUTLINED_FUNCTION_33_0(&dword_23A742000, v3, (os_log_type_t)v2, "Failed to end active drop in session: %@", v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3();
  v11[0] = 10;
  sub_23A75D9AC(v11);
  OUTLINED_FUNCTION_3();
  return OUTLINED_FUNCTION_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A75DEF8()
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
  char *v19;
  uint64_t v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  void (*v26)(char *, char *, uint64_t);
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t v32;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A00);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_2();
  v5 = v4 - v3;
  v6 = type metadata accessor for DropInPlayer.Settings(0);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0_2();
  v10 = v9 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7850);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_0_2();
  v14 = v13 - v12;
  v15 = sub_23A7692D4();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v32 - v20;
  static ToneProvider.endToneURL.getter(v14);
  if (__swift_getEnumTagSinglePayload(v14, 1, v15) == 1)
  {
    sub_23A7518A4(v14);
    v22 = (v1 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_logger);
    sub_23A769364();
    v23 = OUTLINED_FUNCTION_30();
    if (OUTLINED_FUNCTION_10(v23))
    {
      v24 = (uint8_t *)OUTLINED_FUNCTION_7();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_23A742000, v22, (os_log_type_t)v19, "Invalid end tone URL", v24, 2u);
      OUTLINED_FUNCTION_0_1();
    }

    return OUTLINED_FUNCTION_16_3();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(v21, v14, v15);
    v26 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
    v26(v19, v21, v15);
    *(_OWORD *)v10 = xmmword_23A76B230;
    *(_QWORD *)(v10 + 16) = 0x4014000000000000;
    v26((char *)(v10 + *(int *)(v6 + 24)), v19, v15);
    v27 = *(void (**)(char *, uint64_t))(v16 + 8);
    v27(v19, v15);
    *(_DWORD *)(v10 + *(int *)(v6 + 28)) = 1065353216;
    if (qword_2569B7318 != -1)
      swift_once();
    v28 = sub_23A7524F0(v10);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_endTonePlayer) = v28;
    OUTLINED_FUNCTION_19();
    swift_release();
    v29 = sub_23A769568();
    __swift_storeEnumTagSinglePayload(v5, 1, 1, v29);
    v30 = sub_23A75E70C();
    v31 = (_QWORD *)OUTLINED_FUNCTION_17();
    v31[2] = v1;
    v31[3] = v30;
    v31[4] = v28;
    v31[5] = v1;
    OUTLINED_FUNCTION_19();
    sub_23A758694();
    swift_release();
    swift_release();
    sub_23A7518E4(v10);
    return ((uint64_t (*)(char *, uint64_t))v27)(v21, v15);
  }
}

uint64_t sub_23A75E2FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  *(_QWORD *)(v5 + 24) = a5;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 32) = v6;
  *v6 = v5;
  v6[1] = sub_23A75E348;
  return sub_23A763A40();
}

uint64_t sub_23A75E348()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_32();
  *v2 = *v1;
  *(_QWORD *)(v3 + 40) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A75E3A4()
{
  uint64_t v0;

  if (qword_2569B7318 != -1)
    swift_once();
  sub_23A752CCC();
  OUTLINED_FUNCTION_16_3();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A75E408()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  _QWORD *v4;
  uint64_t v5;

  v1 = (*(_QWORD *)(v0 + 24) + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_logger);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_24();
  sub_23A769364();
  v2 = OUTLINED_FUNCTION_30();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)OUTLINED_FUNCTION_7();
    v4 = (_QWORD *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v3 = 138412290;
    OUTLINED_FUNCTION_24();
    v5 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v5;
    sub_23A7696D0();
    *v4 = v5;
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_33_0(&dword_23A742000, v1, v2, "Failed to end start tone: %@", v3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }
  OUTLINED_FUNCTION_3();

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3();
  if (qword_2569B7318 != -1)
    swift_once();
  sub_23A752CCC();
  OUTLINED_FUNCTION_16_3();
  return OUTLINED_FUNCTION_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A75E590()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23A74FDDC(*(_QWORD *)(v0 + 112));

  v1 = v0 + OBJC_IVAR____TtC6DropIn20AppStateDeactivation_logger;
  v2 = sub_23A76937C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_23A75E61C()
{
  sub_23A75E590();
  return swift_defaultActor_deallocate();
}

uint64_t sub_23A75E634()
{
  return type metadata accessor for AppStateDeactivation();
}

uint64_t type metadata accessor for AppStateDeactivation()
{
  uint64_t result;

  result = qword_2569B81F0;
  if (!qword_2569B81F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A75E674()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A76937C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_23A75E70C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B83D8;
  if (!qword_2569B83D8)
  {
    v1 = type metadata accessor for AppStateDeactivation();
    result = MEMORY[0x23B856A18](&unk_23A76B818, v1);
    atomic_store(result, (unint64_t *)&qword_2569B83D8);
  }
  return result;
}

uint64_t sub_23A75E74C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A75E780()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_1_1(v1);
  return sub_23A75E2FC(v2, v3, v4, v5, v6);
}

unint64_t sub_23A75E7E0()
{
  unint64_t result;

  result = qword_2569B83E8;
  if (!qword_2569B83E8)
  {
    result = MEMORY[0x23B856A18](&unk_23A76B8C4, &unk_250B978D8);
    atomic_store(result, &qword_2569B83E8);
  }
  return result;
}

uint64_t sub_23A75E81C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A75E850()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_1_1(v1);
  return sub_23A75DC00(v2, v3, v4, v5, v6);
}

uint64_t sub_23A75E8B0()
{
  uint64_t *v0;
  uint64_t v2;

  OUTLINED_FUNCTION_32();
  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A75E8F0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_23A75E978(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A75E9C4 + 4 * byte_23A76B65B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A75E9F8 + 4 * byte_23A76B656[v4]))();
}

uint64_t sub_23A75E9F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A75EA00(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A75EA08);
  return result;
}

uint64_t sub_23A75EA14(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A75EA1CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A75EA20(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A75EA28(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23A75EA34(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void type metadata accessor for AppStateDeactivationError()
{
  OUTLINED_FUNCTION_43();
}

unint64_t sub_23A75EA50()
{
  unint64_t result;

  result = qword_2569B8400;
  if (!qword_2569B8400)
  {
    result = MEMORY[0x23B856A18](&unk_23A76B89C, &unk_250B978D8);
    atomic_store(result, (unint64_t *)&qword_2569B8400);
  }
  return result;
}

void OUTLINED_FUNCTION_7_2(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 128) = a1;
  sub_23A75D76C();
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  return sub_23A76985C();
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return sub_23A769850();
}

uint64_t OUTLINED_FUNCTION_16_3()
{
  return sub_23A75DA7C();
}

uint64_t OUTLINED_FUNCTION_25_2()
{
  return sub_23A769868();
}

double sub_23A75EAD4@<D0>(_OWORD *a1@<X8>)
{
  void *v1;
  void *v3;
  id v4;
  double result;
  __int128 v6;
  _OWORD v7[2];

  v3 = (void *)sub_23A769478();
  v4 = objc_msgSend(v1, sel_valueForKey_, v3);

  if (v4)
  {
    sub_23A7696E8();
    swift_unknownObjectRelease();
    sub_23A75CB60(&v6, v7);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4880);
  if ((swift_dynamicCast() & 1) == 0)
  {
    result = 0.0;
    *a1 = xmmword_23A76B910;
  }
  return result;
}

uint64_t sub_23A75EB94@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  void *v2;
  void *v3;
  void *v6;
  id v7;
  int v8;
  __int128 v10;
  _OWORD v11[2];

  v3 = v2;
  v6 = (void *)sub_23A769478();
  v7 = objc_msgSend(v3, sel_valueForKey_, v6);

  if (v7)
  {
    sub_23A7696E8();
    swift_unknownObjectRelease();
    sub_23A75CB60(&v10, v11);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4880);
  v8 = swift_dynamicCast();
  return __swift_storeEnumTagSinglePayload(a2, v8 ^ 1u, 1, a1);
}

void sub_23A75EC5C(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
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
  __int128 v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int EnumTagSinglePayload;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  __int128 v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;

  v6 = sub_23A7696C4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v41 - v9;
  v11 = *(_QWORD *)(a2 - 8);
  v12 = MEMORY[0x24BDAC7A8](v8);
  v45 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v46 = (char *)&v41 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v47 = (char *)&v41 - v16;
  v48 = a1;
  sub_23A75EAD4(&v51);
  if (*((_QWORD *)&v51 + 1) >> 60 == 15)
  {
    __swift_storeEnumTagSinglePayload(a3, 1, 1, a2);
  }
  else
  {
    v44 = a3;
    v49 = a2;
    v17 = v51;
    v18 = objc_allocWithZone(MEMORY[0x24BDD1620]);
    sub_23A75F7DC(v17, *((unint64_t *)&v17 + 1));
    v43 = v17;
    v19 = sub_23A75F6BC(v17, *((unint64_t *)&v17 + 1));
    v20 = v49;
    sub_23A7695F8();
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v20);
    if (EnumTagSinglePayload == 1)
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      if (qword_2542D4888 != -1)
        swift_once();
      v24 = OUTLINED_FUNCTION_43_0();
      __swift_project_value_buffer(v24, (uint64_t)qword_2542D4E90);
      OUTLINED_FUNCTION_17_2();
      v25 = sub_23A769364();
      v26 = sub_23A7695D4();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = OUTLINED_FUNCTION_7();
        *(_QWORD *)&v51 = OUTLINED_FUNCTION_7();
        *(_DWORD *)v27 = 136315394;
        v50 = v49;
        swift_getMetatypeMetadata();
        v28 = OUTLINED_FUNCTION_13_2();
        v50 = OUTLINED_FUNCTION_9_5(v28, v29);
        OUTLINED_FUNCTION_11_2();
        swift_bridgeObjectRelease();
        *(_WORD *)(v27 + 12) = 2080;
        OUTLINED_FUNCTION_6_2();
        v50 = OUTLINED_FUNCTION_2_3();
        OUTLINED_FUNCTION_11_2();
        OUTLINED_FUNCTION_7_3();
        OUTLINED_FUNCTION_14_4(&dword_23A742000, v25, v26, "Failed to decode %s) data. Key = %s", (uint8_t *)v27);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0_1();
      }
      OUTLINED_FUNCTION_3_3();

      OUTLINED_FUNCTION_8_3();
      v21 = v44;
      v22 = 1;
    }
    else
    {
      v30 = v11;
      v31 = v47;
      v42 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
      v42(v47, v10, v20);
      if (qword_2542D4888 != -1)
        swift_once();
      v32 = OUTLINED_FUNCTION_43_0();
      __swift_project_value_buffer(v32, (uint64_t)qword_2542D4E90);
      v33 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
      v34 = v46;
      v33(v46, v31, v20);
      OUTLINED_FUNCTION_17_2();
      v35 = sub_23A769364();
      v36 = sub_23A7695E0();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = OUTLINED_FUNCTION_7();
        *(_QWORD *)&v51 = OUTLINED_FUNCTION_7();
        *(_DWORD *)v37 = 136315394;
        v41 = v30;
        OUTLINED_FUNCTION_6_2();
        v50 = OUTLINED_FUNCTION_2_3();
        sub_23A7696D0();
        OUTLINED_FUNCTION_7_3();
        *(_WORD *)(v37 + 12) = 2080;
        v33(v45, v34, v49);
        v38 = sub_23A7694A8();
        v50 = OUTLINED_FUNCTION_9_5(v38, v39);
        sub_23A7696D0();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v41 + 8))(v34, v49);
        OUTLINED_FUNCTION_14_4(&dword_23A742000, v35, v36, "Decoded Value for Key = %s, Value = %s", (uint8_t *)v37);
        OUTLINED_FUNCTION_16_4();
        OUTLINED_FUNCTION_0_1();
      }
      OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_8_3();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v34, v20);

      v40 = v44;
      v42((char *)v44, v31, v20);
      v21 = v40;
      v22 = 0;
    }
    __swift_storeEnumTagSinglePayload(v21, v22, 1, v20);
    OUTLINED_FUNCTION_16();
  }
}

void sub_23A75F380(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v2 = v1;
  v3 = MEMORY[0x24BDAC7A8](a1);
  MEMORY[0x24BDAC7A8](v3);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1618]), sel_initRequiringSecureCoding_, 0);
  sub_23A7695EC();
  v4 = objc_msgSend(v10, sel_encodedData);
  v5 = sub_23A7692EC();
  v7 = v6;

  v8 = (void *)sub_23A7692E0();
  sub_23A75F798(v5, v7);
  v9 = (void *)sub_23A769478();
  objc_msgSend(v2, sel_setValue_forKey_, v8, v9);

}

id sub_23A75F6BC(uint64_t a1, unint64_t a2)
{
  void *v2;
  void *v3;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v11[2];

  v3 = v2;
  v11[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = (void *)sub_23A7692E0();
  v11[0] = 0;
  v7 = objc_msgSend(v3, sel_initForReadingFromData_error_, v6, v11);

  if (v7)
  {
    v8 = v11[0];
  }
  else
  {
    v9 = v11[0];
    sub_23A7692B0();

    swift_willThrow();
  }
  sub_23A75F798(a1, a2);
  return v7;
}

uint64_t sub_23A75F798(uint64_t a1, unint64_t a2)
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

uint64_t sub_23A75F7DC(uint64_t a1, unint64_t a2)
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

uint64_t sub_23A75F820(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23A75F798(a1, a2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  unint64_t v0;
  uint64_t v1;

  return sub_23A760AD0(*(_QWORD *)(v1 - 160), v0, (uint64_t *)(v1 - 96));
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  uint64_t v0;

  return sub_23A75F820(*(_QWORD *)(v0 - 208), *(_QWORD *)(v0 - 200));
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_9_5(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_23A760AD0(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return sub_23A7696D0();
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return sub_23A7696D0();
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return sub_23A7694A8();
}

void OUTLINED_FUNCTION_14_4(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_15_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_16_4()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_17_2()
{
  return swift_bridgeObjectRetain_n();
}

void UserDefaultsAccessible.value.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v5 = OUTLINED_FUNCTION_30_1(a1, a2);
  if (v5)
  {
    v11 = (id)v5;
    (*(void (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
    v6 = OUTLINED_FUNCTION_21_2();
    sub_23A75EB94(v6, v2);
    OUTLINED_FUNCTION_19_2();

  }
  else
  {
    OUTLINED_FUNCTION_21_2();
    v7 = OUTLINED_FUNCTION_29_1();
    __swift_storeEnumTagSinglePayload(v7, v8, v9, v10);
  }
}

void UserDefaultsAccessible.value.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t AssociatedTypeWitness;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;

  OUTLINED_FUNCTION_13_3();
  a19 = v21;
  a20 = v22;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  OUTLINED_FUNCTION_24_0();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v30 = sub_23A7696C4();
  OUTLINED_FUNCTION_32_1();
  MEMORY[0x24BDAC7A8](v31);
  v33 = (char *)&a9 - v32;
  v34 = OUTLINED_FUNCTION_27_2(v28);
  v35 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 24))(v26, v24);
  v36 = (void *)v35;
  if (v34 == 1)
  {
    if (v35)
    {
      OUTLINED_FUNCTION_10_2();
      v37 = (void *)OUTLINED_FUNCTION_22_2();
      v38 = OUTLINED_FUNCTION_3_4();
      OUTLINED_FUNCTION_36_0(v38, sel_removeObjectForKey_);

LABEL_9:
    }
  }
  else if (v35)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v33, v28, v30);
    if (OUTLINED_FUNCTION_27_2((uint64_t)v33) == 1)
    {
      v39 = 0;
    }
    else
    {
      v39 = sub_23A7697D8();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v33, AssociatedTypeWitness);
    }
    OUTLINED_FUNCTION_10_2();
    v40 = (void *)OUTLINED_FUNCTION_22_2();
    OUTLINED_FUNCTION_3_4();
    objc_msgSend(v36, sel_setObject_forKey_, v39, v40);

    swift_unknownObjectRelease();
    goto LABEL_9;
  }
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v28, v30);
  OUTLINED_FUNCTION_16();
}

uint64_t (*sub_23A75FAF8(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  UserDefaultsAccessible.value.modify(v6, a2, a3);
  v6[4] = v7;
  return sub_23A75FB54;
}

void UserDefaultsAccessible.value.modify(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;

  v7 = malloc(0x38uLL);
  *a1 = v7;
  v7[1] = a3;
  v7[2] = v3;
  *v7 = a2;
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_21_2();
  v8 = OUTLINED_FUNCTION_6_3();
  v7[3] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[4] = v9;
  v10 = *(_QWORD *)(v9 + 64);
  v7[5] = malloc(v10);
  v7[6] = malloc(v10);
  UserDefaultsAccessible.value.getter(a2, a3);
  OUTLINED_FUNCTION_14_2();
}

#error "23A75FC5C: call analysis failed (funcsize=37)"

void sub_23A75FC8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UserDefaultsAccessible.value.getter(*(_QWORD *)(a3 + a2 - 16), *(_QWORD *)(a3 + a2 - 8));
}

#error "23A75FD4C: call analysis failed (funcsize=43)"

void UserDefaultsAccessible.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  OUTLINED_FUNCTION_24_0();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_15_4();
  MEMORY[0x24BDAC7A8](v3);
  sub_23A769724();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_0_5(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32));
  OUTLINED_FUNCTION_26_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_20_1();
  sub_23A7694A8();
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_5(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 64));
  OUTLINED_FUNCTION_26_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_4();
}

uint64_t UserDefaultsAccessible<>.value.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = OUTLINED_FUNCTION_30_1(a1, a2);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
    v8 = OUTLINED_FUNCTION_35_1();
    sub_23A75EC5C(v7, v8, v2);

    return swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_35_1();
    v10 = OUTLINED_FUNCTION_29_1();
    return __swift_storeEnumTagSinglePayload(v10, v11, v12, v13);
  }
}

uint64_t sub_23A75FF4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return UserDefaultsAccessible<>.value.getter(*(_QWORD *)(a3 + a2 - 32), *(_QWORD *)(a3 + a2 - 24));
}

uint64_t sub_23A75FF78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = *(_QWORD *)(a4 + a3 - 32);
  v6 = *(_QWORD *)(a4 + a3 - 24);
  v7 = *(_QWORD *)(a4 + a3 - 8);
  swift_getAssociatedTypeWitness();
  v8 = sub_23A7696C4();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v14 - v9, a1);
  return UserDefaultsAccessible<>.value.setter((uint64_t)v10, v5, v6, v12, v7);
}

uint64_t UserDefaultsAccessible<>.value.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness;
  int EnumTagSinglePayload;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, 1, AssociatedTypeWitness);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  v12 = (void *)v11;
  if (EnumTagSinglePayload == 1)
  {
    if (v11)
    {
      OUTLINED_FUNCTION_9_6();
      v13 = (void *)OUTLINED_FUNCTION_22_2();
      v14 = OUTLINED_FUNCTION_3_4();
      OUTLINED_FUNCTION_36_0(v14, sel_removeObjectForKey_);

    }
  }
  else if (v11)
  {
    OUTLINED_FUNCTION_9_6();
    v15 = OUTLINED_FUNCTION_23_2();
    v18 = *(_QWORD *)(a5 + 8);
    MEMORY[0x23B856A18](MEMORY[0x24BEE4AA8], v15, &v18);
    sub_23A75F380(a1);

    swift_bridgeObjectRelease();
  }
  v16 = OUTLINED_FUNCTION_23_2();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a1, v16);
}

void UserDefaultsAccessible<>.value.modify(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;

  v11 = malloc(0x48uLL);
  *a1 = v11;
  v11[3] = a5;
  v11[4] = v5;
  v11[1] = a3;
  v11[2] = a4;
  *v11 = a2;
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_35_1();
  v12 = OUTLINED_FUNCTION_6_3();
  v11[5] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v11[6] = v13;
  v14 = *(_QWORD *)(v13 + 64);
  v11[7] = malloc(v14);
  v11[8] = malloc(v14);
  UserDefaultsAccessible<>.value.getter(a2, a3);
  OUTLINED_FUNCTION_7_4();
}

void sub_23A760220()
{
  uint64_t **v0;
  uint64_t v1;
  uint64_t *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_13_3();
  v2 = *v0;
  v3 = (void *)(*v0)[7];
  v4 = (void *)(*v0)[8];
  if ((v5 & 1) != 0)
  {
    v6 = v2[6];
    v7 = v2[3];
    v9 = *v2;
    v8 = v2[1];
    OUTLINED_FUNCTION_14_5(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
    UserDefaultsAccessible<>.value.setter((uint64_t)v3, v9, v8, v10, v7);
    OUTLINED_FUNCTION_34_1((uint64_t)v4, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  }
  else
  {
    UserDefaultsAccessible<>.value.setter((*v0)[8], *v2, v2[1], v1, v2[3]);
  }
  free(v4);
  free(v3);
  free(v2);
}

void UserDefaultsAccessible<>.resolvedValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  _BYTE *v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  os_log_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  int v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  uint64_t v36;
  unint64_t v37;
  void (*v38)(os_log_t, uint64_t);
  uint64_t v39;
  unint64_t v40;
  void (*v41)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v42;
  void (*v43)(_BYTE *, _BYTE *, uint64_t);
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t);
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void (*v53)(os_log_t, uint64_t);
  _BYTE v54[12];
  int v55;
  os_log_t v56;
  _BYTE *v57;
  os_log_t v58;
  _BYTE *v59;
  _BYTE *v60;
  _BYTE *v61;
  void (*v62)(_QWORD, _QWORD, _QWORD);
  uint64_t v63;
  _BYTE *v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE *v67;

  OUTLINED_FUNCTION_13_3();
  v3 = v2;
  v5 = v4;
  v64 = v6;
  v63 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_28_1();
  v59 = (_BYTE *)v7;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v58 = (os_log_t)&v54[-v10];
  MEMORY[0x24BDAC7A8](v9);
  v57 = &v54[-v11];
  v62 = v12;
  v13 = OUTLINED_FUNCTION_21_2();
  sub_23A7696C4();
  OUTLINED_FUNCTION_32_1();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = &v54[-v16];
  v18 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_28_1();
  v61 = v19;
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = &v54[-v22];
  MEMORY[0x24BDAC7A8](v21);
  v25 = &v54[-v24];
  v26 = *(void (**)(uint64_t, uint64_t))(v3 + 40);
  v65 = v0;
  v60 = (_BYTE *)v3;
  v26(v5, v3);
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v13) == 1)
  {
    OUTLINED_FUNCTION_34_1((uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    if (qword_2542D4888 != -1)
      swift_once();
    v27 = sub_23A76937C();
    __swift_project_value_buffer(v27, (uint64_t)qword_2542D4E90);
    v28 = v63;
    v29 = v58;
    OUTLINED_FUNCTION_37_1((uint64_t)v58);
    v30 = (uint64_t)v59;
    OUTLINED_FUNCTION_37_1((uint64_t)v59);
    v31 = sub_23A769364();
    v32 = sub_23A7695C8();
    v33 = v32;
    if (os_log_type_enabled(v31, v32))
    {
      v34 = OUTLINED_FUNCTION_7();
      v57 = (_BYTE *)OUTLINED_FUNCTION_7();
      v67 = v57;
      *(_DWORD *)v34 = 136315394;
      v56 = v31;
      v35 = (uint64_t (*)(uint64_t))*((_QWORD *)v60 + 4);
      v55 = v33;
      v36 = v35(v5);
      v66 = OUTLINED_FUNCTION_5_3(v36, v37);
      sub_23A7696D0();
      OUTLINED_FUNCTION_3_4();
      v38 = *(void (**)(os_log_t, uint64_t))(v28 + 8);
      v38(v29, v5);
      *(_WORD *)(v34 + 12) = 2080;
      v63 = v34 + 14;
      (*((void (**)(uint64_t, void (*)(_QWORD, _QWORD, _QWORD)))v62 + 2))(v5, v62);
      v39 = sub_23A7694A8();
      v66 = OUTLINED_FUNCTION_5_3(v39, v40);
      sub_23A7696D0();
      OUTLINED_FUNCTION_3_4();
      v38((os_log_t)v30, v5);
      _os_log_impl(&dword_23A742000, v56, (os_log_type_t)v55, "[Defaults Default Value] Key = %s, Value = %s", (uint8_t *)v34, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_1();
    }
    v53 = *(void (**)(os_log_t, uint64_t))(v28 + 8);
    v53(v29, v5);
    v53((os_log_t)v30, v5);

    (*((void (**)(uint64_t))v62 + 2))(v5);
  }
  else
  {
    v41 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v18 + 32);
    v41(v25, v17, v13);
    if (qword_2542D4888 != -1)
      swift_once();
    v42 = sub_23A76937C();
    __swift_project_value_buffer(v42, (uint64_t)qword_2542D4E90);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v63 + 16))(v57, v65, v5);
    v43 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v18 + 16);
    v43(v23, v25, v13);
    v44 = sub_23A769364();
    v45 = sub_23A7695E0();
    LODWORD(v65) = v45;
    if (os_log_type_enabled(v44, v45))
    {
      v46 = OUTLINED_FUNCTION_7();
      v62 = (void (*)(_QWORD, _QWORD, _QWORD))v41;
      v47 = v46;
      v59 = (_BYTE *)OUTLINED_FUNCTION_7();
      v67 = v59;
      *(_DWORD *)v47 = 136315394;
      v56 = (os_log_t)(v47 + 4);
      v48 = (uint64_t (*)(uint64_t))*((_QWORD *)v60 + 4);
      v58 = v44;
      v49 = v48(v5);
      v66 = OUTLINED_FUNCTION_5_3(v49, v50);
      v60 = v25;
      sub_23A7696D0();
      OUTLINED_FUNCTION_3_4();
      OUTLINED_FUNCTION_12_3();
      *(_WORD *)(v47 + 12) = 2080;
      v43(v61, v23, v13);
      v51 = sub_23A7694A8();
      v66 = sub_23A760AD0(v51, v52, (uint64_t *)&v67);
      sub_23A7696D0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_17_3();
      _os_log_impl(&dword_23A742000, v58, (os_log_type_t)v65, "[Defaults Custom Value] Key = %s, Value = %s", (uint8_t *)v47, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_1();
    }
    OUTLINED_FUNCTION_12_3();
    OUTLINED_FUNCTION_17_3();

    v41(v64, v25, v13);
  }
  OUTLINED_FUNCTION_16();
}

uint64_t UserDefaultsAccessible<>.description.getter()
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

  OUTLINED_FUNCTION_13_3();
  v1 = v0;
  v10 = v2;
  v4 = v3;
  v6 = v5;
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_15_4();
  MEMORY[0x24BDAC7A8](v7);
  sub_23A7696C4();
  OUTLINED_FUNCTION_15_4();
  MEMORY[0x24BDAC7A8](v8);
  sub_23A769724();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_0_5(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 32));
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_20_1();
  sub_23A7694A8();
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_19_2();
  OUTLINED_FUNCTION_1_5();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v6, v4);
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_1_5();
  (*(void (**)(uint64_t))(v10 + 16))(v6);
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_5(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 64));
  sub_23A7694C0();
  swift_bridgeObjectRelease();
  return 0;
}

void sub_23A7609F8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  UserDefaultsAccessible.value.modify(v6, a2, a3);
  v6[4] = v7;
  OUTLINED_FUNCTION_14_2();
}

void sub_23A760A48(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void sub_23A760A74(uint64_t a1)
{
  MEMORY[0x23B856A18](&protocol conformance descriptor for Default<A>, a1);
  MEMORY[0x23B856A18](&protocol conformance descriptor for Default<A>, a1);
  UserDefaultsAccessible<>.resolvedValue.getter();
}

uint64_t sub_23A760AD0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_23A760C18(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A75440C((uint64_t)v12, *a3);
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
      sub_23A75440C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23A760BA8()
{
  return 16;
}

__n128 sub_23A760BB4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_23A760BC8()
{
  return 32;
}

__n128 sub_23A760BD4(uint64_t a1, _OWORD *a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t dispatch thunk of DefaultValueProviding.defaultValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of UserDefaultsAccessible.userDefaults.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of UserDefaultsAccessible.key.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of UserDefaultsAccessible.value.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of UserDefaultsAccessible.value.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of UserDefaultsAccessible.value.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of UserDefaultsAccessible.localizedDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_23A760C18(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_23A760D6C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_23A7696DC();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_23A760E30(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_23A769754();
    if (!v8)
    {
      result = sub_23A769784();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_23A760D6C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23A7697A8();
  __break(1u);
  return result;
}

uint64_t sub_23A760E30(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A760EC4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_23A761098(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_23A761098((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A760EC4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_23A7694CC();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_23A761034(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_23A769730();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_23A7697A8();
  __break(1u);
LABEL_14:
  result = sub_23A769784();
  __break(1u);
  return result;
}

_QWORD *sub_23A761034(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B8408);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23A761098(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B8408);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_23A761230(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23A76116C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_23A76116C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23A7697A8();
  __break(1u);
  return result;
}

char *sub_23A761230(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_23A7697A8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t OUTLINED_FUNCTION_0_5@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return sub_23A7694C0();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5_3(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_23A760AD0(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return sub_23A7696C4();
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return sub_23A7694C0();
}

uint64_t OUTLINED_FUNCTION_9_6()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 32))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 32))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_14_5@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_16_5()
{
  return sub_23A7697CC();
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_21_2()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return sub_23A769478();
}

uint64_t OUTLINED_FUNCTION_23_2()
{
  return sub_23A7696C4();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_25_3()
{
  return sub_23A7694C0();
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return sub_23A7694C0();
}

uint64_t OUTLINED_FUNCTION_27_2(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_29_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_30_1(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_23A7694C0();
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_34_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_35_1()
{
  return swift_getAssociatedTypeWitness();
}

id OUTLINED_FUNCTION_36_0(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_37_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v3, v1);
}

id sub_23A7614A0(id a1)
{
  return a1;
}

void sub_23A7614AC()
{
  sub_23A76186C();
}

uint64_t sub_23A761504()
{
  return sub_23A7618FC();
}

uint64_t sub_23A761510()
{
  swift_unknownObjectRetain();
  return sub_23A761504();
}

void sub_23A761538()
{
  void *v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_9_7();
  v1 = OUTLINED_FUNCTION_18_2((uint64_t)v0);
  OUTLINED_FUNCTION_0_6(v1, OBJC_IVAR___DIXPCDispatcher_deviceListDelegate);
  OUTLINED_FUNCTION_8_5();
}

void sub_23A761560(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  OUTLINED_FUNCTION_56();
}

id sub_23A761590(id a1)
{
  return a1;
}

void sub_23A76159C()
{
  sub_23A76186C();
}

uint64_t sub_23A7615F4()
{
  return sub_23A7618FC();
}

uint64_t sub_23A761600()
{
  swift_unknownObjectRetain();
  return sub_23A7615F4();
}

void sub_23A761628()
{
  void *v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_9_7();
  v1 = OUTLINED_FUNCTION_18_2((uint64_t)v0);
  OUTLINED_FUNCTION_0_6(v1, OBJC_IVAR___DIXPCDispatcher_deviceStatusDelegate);
  OUTLINED_FUNCTION_8_5();
}

void sub_23A761650(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  OUTLINED_FUNCTION_56();
}

id sub_23A76167C(id a1)
{
  return a1;
}

void sub_23A761688()
{
  sub_23A76186C();
}

uint64_t sub_23A7616E0()
{
  return sub_23A7618FC();
}

uint64_t sub_23A7616EC()
{
  swift_unknownObjectRetain();
  return sub_23A7616E0();
}

void sub_23A761714()
{
  void *v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_9_7();
  v1 = OUTLINED_FUNCTION_18_2((uint64_t)v0);
  OUTLINED_FUNCTION_0_6(v1, OBJC_IVAR___DIXPCDispatcher_sessionStatusDelegate);
  OUTLINED_FUNCTION_8_5();
}

void sub_23A76173C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  OUTLINED_FUNCTION_56();
}

id sub_23A761768(id a1)
{
  return a1;
}

void sub_23A761774()
{
  sub_23A76186C();
}

uint64_t sub_23A7617CC()
{
  return sub_23A7618FC();
}

uint64_t sub_23A7617D8()
{
  swift_unknownObjectRetain();
  return sub_23A7617CC();
}

void sub_23A761800()
{
  void *v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_9_7();
  v1 = OUTLINED_FUNCTION_18_2((uint64_t)v0);
  OUTLINED_FUNCTION_0_6(v1, OBJC_IVAR___DIXPCDispatcher_audioPowerDelegate);
  OUTLINED_FUNCTION_8_5();
}

void sub_23A761828(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  OUTLINED_FUNCTION_56();
}

id sub_23A761854(id a1)
{
  return a1;
}

void sub_23A761860()
{
  sub_23A76186C();
}

void sub_23A76186C()
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_8_5();
}

uint64_t sub_23A7618F0()
{
  return sub_23A7618FC();
}

uint64_t sub_23A7618FC()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t sub_23A761950()
{
  swift_unknownObjectRetain();
  return sub_23A7618F0();
}

void sub_23A761978()
{
  void *v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_9_7();
  v1 = OUTLINED_FUNCTION_18_2((uint64_t)v0);
  OUTLINED_FUNCTION_0_6(v1, OBJC_IVAR___DIXPCDispatcher_audioStatusDelegate);
  OUTLINED_FUNCTION_8_5();
}

void sub_23A7619A0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  OUTLINED_FUNCTION_56();
}

void sub_23A7619B8(void **a1, char a2)
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
    OUTLINED_FUNCTION_11_3();
  }
  free(v3);
}

id XPCDispatcher.__allocating_init(clientContext:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return XPCDispatcher.init(clientContext:)(a1);
}

id XPCDispatcher.init(clientContext:)(void *a1)
{
  void *v1;
  char *v3;
  id v4;
  id v5;
  objc_super v7;

  v3 = v1;
  sub_23A769370();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_7_5();
  *(_QWORD *)&v3[OBJC_IVAR___DIXPCDispatcher_clientContext] = a1;
  v4 = a1;

  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for XPCDispatcher();
  v5 = objc_msgSendSuper2(&v7, sel_init);

  return v5;
}

uint64_t type metadata accessor for XPCDispatcher()
{
  uint64_t result;

  result = qword_2542D4A48;
  if (!qword_2542D4A48)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A761BA8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23A761BC0()
{
  uint64_t v0;

  return (*(uint64_t (**)(id))(v0 + 8))(objc_retain(*(id *)(*(_QWORD *)(v0 + 16)
                                                                    + OBJC_IVAR___DIXPCDispatcher_clientContext)));
}

uint64_t sub_23A761C60(const void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_23A761CC0;
  return sub_23A761BA8();
}

uint64_t sub_23A761CC0(void *a1)
{
  void *v1;
  uint64_t *v2;
  void *v3;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;

  v3 = v1;
  v5 = *(void **)(*v2 + 16);
  v6 = *v2;
  swift_task_dealloc();

  v7 = *(void (***)(_QWORD, _QWORD, _QWORD))(v6 + 24);
  if (v3)
  {
    v8 = (void *)sub_23A7692A4();

    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v8);
    _Block_release(v7);
  }
  else
  {
    ((void (**)(_QWORD, void *, _QWORD))v7)[2](v7, a1, 0);
    _Block_release(v7);

  }
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_23A761D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A00);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A769568();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_2569B8440;
  v9[5] = v8;
  sub_23A762DC0((uint64_t)v6, (uint64_t)&unk_2569B8450, (uint64_t)v9);
  return swift_release();
}

void sub_23A761E58()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9[3];

  v1 = (v0 + OBJC_IVAR___DIXPCDispatcher_logger);
  swift_bridgeObjectRetain_n();
  sub_23A769364();
  v2 = OUTLINED_FUNCTION_32_0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)OUTLINED_FUNCTION_7();
    v9[0] = OUTLINED_FUNCTION_7();
    *(_DWORD *)v3 = 136315138;
    v4 = sub_23A761FF8();
    v5 = swift_bridgeObjectRetain();
    v6 = MEMORY[0x23B856178](v5, v4);
    v8 = v7;
    swift_bridgeObjectRelease();
    sub_23A760AD0(v6, v8, v9);
    sub_23A7696D0();
    OUTLINED_FUNCTION_24_1();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_33_0(&dword_23A742000, v1, v2, "Did load devices %s", v3);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }
  OUTLINED_FUNCTION_24_1();

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_21_3();
}

void sub_23A761FB4(void *a1)
{
  void *v2;

  if (a1)
  {
    sub_23A761FF8();
    v2 = (void *)sub_23A7694E4();
    objc_msgSend(a1, sel_didLoadDevices_, v2);

    OUTLINED_FUNCTION_11_3();
  }
  OUTLINED_FUNCTION_10_3();
}

unint64_t sub_23A761FF8()
{
  unint64_t result;

  result = qword_2542D4AA0;
  if (!qword_2542D4AA0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542D4AA0);
  }
  return result;
}

uint64_t sub_23A762070()
{
  void *v0;

  return swift_bridgeObjectRelease();
}

void sub_23A762084(void *a1)
{
  sub_23A7622D0(a1, "Did add device %@");
}

void sub_23A7620D8()
{
  void *v0;
  void *v1;

}

void sub_23A7620F4(void *a1)
{
  sub_23A7622D0(a1, "Did remove device %@");
}

void sub_23A762148()
{
  void *v0;
  void *v1;

}

void sub_23A762164(void *a1)
{
  sub_23A7622D0(a1, "Did update device %@");
}

void sub_23A7621B8()
{
  void *v0;
  void *v1;

}

void sub_23A7621D4(void *a1)
{
  sub_23A7622D0(a1, "Did Add Session %@");
}

void sub_23A762228()
{
  void *v0;
  void *v1;

}

void sub_23A762244(void *a1)
{
  sub_23A7622D0(a1, "Did Remove Session %@");
}

void sub_23A762298()
{
  void *v0;
  void *v1;

}

void sub_23A7622B4(void *a1)
{
  sub_23A7622D0(a1, "Did Update Session %@");
}

void sub_23A7622D0(void *a1, const char *a2)
{
  NSObject *v2;
  id v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  _QWORD *v8;
  const char *v9;

  v4 = OUTLINED_FUNCTION_22_3(a1);
  sub_23A769364();
  v5 = OUTLINED_FUNCTION_32_0();
  if (os_log_type_enabled(v2, v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_7();
    v8 = (_QWORD *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v6 = 138412290;
    v9 = a2;
    v7 = v4;
    sub_23A7696D0();
    *v8 = v4;

    OUTLINED_FUNCTION_33_0(&dword_23A742000, v2, v5, v9, v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_8_5();
}

void *sub_23A762424(void *result)
{
  uint64_t v1;
  SEL *v2;

  if (result)
  {
    objc_msgSend(result, *v2, v1);
    return (void *)OUTLINED_FUNCTION_11_3();
  }
  return result;
}

void sub_23A762494()
{
  void *v0;
  void *v1;

}

void sub_23A7624B0(void *a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10[3];

  OUTLINED_FUNCTION_22_3(a1);
  OUTLINED_FUNCTION_26_2();
  v2 = v1;
  OUTLINED_FUNCTION_26_2();
  v3 = sub_23A769364();
  v4 = sub_23A7695D4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = OUTLINED_FUNCTION_7();
    v6 = (_QWORD *)OUTLINED_FUNCTION_7();
    v10[0] = OUTLINED_FUNCTION_7();
    *(_DWORD *)v5 = 138412546;
    v7 = v1;
    sub_23A7696D0();
    *v6 = v1;

    *(_WORD *)(v5 + 12) = 2080;
    swift_getErrorValue();
    v8 = sub_23A769814();
    sub_23A760AD0(v8, v9, v10);
    sub_23A7696D0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    _os_log_impl(&dword_23A742000, v3, v4, "Session Did Fail %@. Error = %s", (uint8_t *)v5, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_21_3();
}

uint64_t sub_23A762684(uint64_t result)
{
  uint64_t v1;
  void *v2;
  void *v3;

  if (result)
  {
    v2 = (void *)result;
    v3 = (void *)sub_23A7692A4();
    objc_msgSend(v2, sel_session_didFailWithError_, v1, v3);

    return OUTLINED_FUNCTION_11_3();
  }
  return result;
}

void sub_23A762718()
{
  void *v0;
  void *v1;
  void *v2;

}

void sub_23A762738(void *a1)
{
  NSObject *v1;
  os_log_type_t v2;
  id v3;
  os_log_type_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;

  v3 = OUTLINED_FUNCTION_22_3(a1);
  sub_23A769364();
  v4 = OUTLINED_FUNCTION_32_0();
  if (OUTLINED_FUNCTION_14_6(v4))
  {
    v5 = OUTLINED_FUNCTION_7();
    v6 = (_QWORD *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v5 = 67109378;
    OUTLINED_FUNCTION_20_2();
    *(_WORD *)(v5 + 8) = 2112;
    v7 = v3;
    sub_23A7696D0();
    *v6 = v3;

    _os_log_impl(&dword_23A742000, v1, v2, "Did Update Mute State %{BOOL}d for Session %@", (uint8_t *)v5, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_8_5();
}

void sub_23A762880(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, char a10)
{
  uint64_t v10;

  if (a1)
  {
    objc_msgSend(a1, sel_session_didUpdateUplinkMuteStatus_, v10, a10 & 1);
    OUTLINED_FUNCTION_11_3();
  }
  OUTLINED_FUNCTION_10_3();
}

void sub_23A7628EC()
{
  void *v0;
  void *v1;

}

void sub_23A762908()
{
  NSObject *v0;
  os_log_type_t v1;
  uint8_t *v2;

  v0 = sub_23A769364();
  v1 = sub_23A7695BC();
  if (os_log_type_enabled(v0, v1))
  {
    v2 = (uint8_t *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v2 = 134217984;
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_33_0(&dword_23A742000, v0, v1, "Did update audio power %f", v2);
    OUTLINED_FUNCTION_0_1();
  }

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_8_5();
}

void *sub_23A7629D8(void *result, double a2)
{
  int v2;

  if (result)
  {
    LODWORD(a2) = v2;
    objc_msgSend(result, sel_didUpdateAudioPower_, a2);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void sub_23A762A40()
{
  void *v0;

}

void sub_23A762A58(uint64_t a1)
{
  sub_23A762AC0(a1, "Did update uplink muted to: %{BOOL}d");
}

void sub_23A762A98()
{
  void *v0;

}

void sub_23A762AAC(uint64_t a1)
{
  sub_23A762AC0(a1, "Did update downlink muted to: %{BOOL}d");
}

void sub_23A762AC0(uint64_t a1, const char *a2)
{
  uint64_t v2;
  os_log_type_t v3;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v5 = (v2 + OBJC_IVAR___DIXPCDispatcher_logger);
  sub_23A769364();
  v6 = OUTLINED_FUNCTION_32_0();
  if (OUTLINED_FUNCTION_14_6(v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v7 = 67109120;
    OUTLINED_FUNCTION_20_2();
    _os_log_impl(&dword_23A742000, v5, v3, a2, v7, 8u);
    OUTLINED_FUNCTION_0_1();
  }

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_21_3();
}

void *sub_23A762B88(void *result)
{
  SEL *v1;
  char v2;

  if (result)
  {
    objc_msgSend(result, *v1, v2 & 1);
    return (void *)OUTLINED_FUNCTION_11_3();
  }
  return result;
}

void sub_23A762BE8()
{
  void *v0;

}

id XPCDispatcher.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void XPCDispatcher.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id XPCDispatcher.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCDispatcher();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23A762D18(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_23A763634;
  return v6();
}

uint64_t sub_23A762D6C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_23A763634;
  return v7();
}

uint64_t sub_23A762DC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23A769568();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_23A758310(a1);
  }
  else
  {
    sub_23A76955C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23A76952C();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

void sub_23A762EFC()
{
  OUTLINED_FUNCTION_15_5();
  sub_23A7614AC();
}

void sub_23A762F10(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  OUTLINED_FUNCTION_0();
}

void sub_23A762F20()
{
  OUTLINED_FUNCTION_15_5();
  sub_23A76159C();
}

void sub_23A762F34(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  OUTLINED_FUNCTION_0();
}

void sub_23A762F44()
{
  OUTLINED_FUNCTION_15_5();
  sub_23A761688();
}

void sub_23A762F58(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  OUTLINED_FUNCTION_0();
}

void sub_23A762F68()
{
  OUTLINED_FUNCTION_15_5();
  sub_23A761774();
}

void sub_23A762F7C(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  OUTLINED_FUNCTION_0();
}

void sub_23A762F8C()
{
  OUTLINED_FUNCTION_15_5();
  sub_23A761860();
}

void sub_23A762FA0(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  OUTLINED_FUNCTION_0();
}

uint64_t sub_23A762FB0()
{
  return type metadata accessor for XPCDispatcher();
}

uint64_t sub_23A762FB8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A76937C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for XPCDispatcher()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCDispatcher.deviceListDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of XPCDispatcher.deviceListDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of XPCDispatcher.deviceListDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of XPCDispatcher.deviceStatusDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of XPCDispatcher.deviceStatusDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of XPCDispatcher.deviceStatusDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of XPCDispatcher.sessionStatusDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of XPCDispatcher.sessionStatusDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of XPCDispatcher.sessionStatusDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of XPCDispatcher.audioPowerDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of XPCDispatcher.audioPowerDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of XPCDispatcher.audioPowerDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of XPCDispatcher.audioStatusDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of XPCDispatcher.audioStatusDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of XPCDispatcher.audioStatusDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of XPCDispatcher.__allocating_init(clientContext:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of XPCDispatcher.fetchClientContext()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x108);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23A76325C;
  return OUTLINED_FUNCTION_5(v5);
}

uint64_t sub_23A76325C(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_1_4();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

uint64_t dispatch thunk of XPCDispatcher.didLoadDevices(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of XPCDispatcher.didAddDevice(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of XPCDispatcher.didRemoveDevice(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of XPCDispatcher.didUpdateDevice(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of XPCDispatcher.didAddSession(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of XPCDispatcher.didRemoveSession(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of XPCDispatcher.didUpdateSession(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of XPCDispatcher.session(_:didFailWithError:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of XPCDispatcher.session(_:didUpdateUplinkMuteStatus:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of XPCDispatcher.didUpdateAudioPower(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of XPCDispatcher.didUpdateUplinkMuteStatus(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of XPCDispatcher.didUpdateDownlinkMuteStatus(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t sub_23A7633E0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_23A76340C()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23A7582E4;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_2569B8428 + dword_2569B8428))(v2, v3);
}

uint64_t sub_23A763474()
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
  v5[1] = sub_23A763634;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2569B8438 + dword_2569B8438))(v2, v3, v4);
}

uint64_t objectdestroy_13Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A76351C(uint64_t a1)
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
  v7[1] = sub_23A763634;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2569B8448 + dword_2569B8448))(a1, v4, v5, v6);
}

uint64_t sub_23A7635A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A7635C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A7583E4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2569B8458 + dword_2569B8458))(a1, v4);
}

uint64_t OUTLINED_FUNCTION_0_6@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(a1 + 32) = v2;
  *(_QWORD *)(a1 + 40) = a2;
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  return swift_unknownObjectWeakInit();
}

void OUTLINED_FUNCTION_8_5()
{
  JUMPOUT(0x23B856B50);
}

void *OUTLINED_FUNCTION_9_7()
{
  return malloc(0x30uLL);
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return swift_unknownObjectRelease();
}

BOOL OUTLINED_FUNCTION_14_6(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_16_6@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23A7584F4(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_18_2(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return sub_23A7696D0();
}

void OUTLINED_FUNCTION_21_3()
{
  JUMPOUT(0x23B856B50);
}

id OUTLINED_FUNCTION_22_3(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return swift_bridgeObjectRelease_n();
}

id OUTLINED_FUNCTION_26_2()
{
  void *v0;

  return v0;
}

void DropInPlayer.Settings.init(repeating:timeout:toneURL:volume:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, float a6@<S1>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  float v14;

  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  *(double *)(a4 + 16) = a5;
  v9 = type metadata accessor for DropInPlayer.Settings(0);
  v10 = a4 + *(int *)(v9 + 24);
  v11 = OUTLINED_FUNCTION_6_4();
  v12 = *(_QWORD *)(v11 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, a3, v11);
  v13.n128_u32[0] = 1.0;
  if (a6 <= 1.0)
    v13.n128_f32[0] = a6;
  if (a6 >= 0.0)
    v14 = v13.n128_f32[0];
  else
    v14 = 0.0;
  (*(void (**)(uint64_t, uint64_t, __n128))(v12 + 8))(a3, v11, v13);
  *(float *)(a4 + *(int *)(v9 + 28)) = v14;
  OUTLINED_FUNCTION_4_4();
}

uint64_t type metadata accessor for DropInPlayer.Settings(uint64_t a1)
{
  return sub_23A764064(a1, qword_2569B85F0);
}

void sub_23A7637B0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;

}

void sub_23A7637BC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC6DropIn12DropInPlayer_timer);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6DropIn12DropInPlayer_timer) = a1;

}

uint64_t sub_23A7637D0(uint64_t a1)
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
  id v11;
  char *v12;

  v3 = v1;
  v5 = sub_23A7692D4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_2();
  v9 = v8 - v7;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC6DropIn12DropInPlayer_timer) = 0;
  v10 = type metadata accessor for DropInPlayer.Settings(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v9, a1 + *(int *)(v10 + 24), v5);
  v11 = objc_allocWithZone((Class)type metadata accessor for AudioPlayer());
  v12 = sub_23A74F448(v9);
  if (v2)
  {
    sub_23A7518E4(a1);

    type metadata accessor for DropInPlayer(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v12;
    sub_23A7647B8(a1, v3 + OBJC_IVAR____TtC6DropIn12DropInPlayer_settings);
  }
  return v3;
}

char *sub_23A7638E8(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  char *result;

  v4 = v2;
  v6 = sub_23A7692D4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_2();
  v10 = v9 - v8;
  v11 = type metadata accessor for DropInPlayer.Settings(0);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0_2();
  v15 = v14 - v13;
  if ((a2 & 1) != 0)
  {
    sub_23A754150(v4 + OBJC_IVAR____TtC6DropIn12DropInPlayer_settings, v15);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v10, v15 + *(int *)(v11 + 24), v6);
    v16 = objc_allocWithZone((Class)type metadata accessor for AudioPlayer());
    result = sub_23A74F448(v10);
    if (v3)
      return result;
    sub_23A7637B0((uint64_t)result);
  }
  LODWORD(v12) = *(_DWORD *)(v4 + OBJC_IVAR____TtC6DropIn12DropInPlayer_settings + *(int *)(v11 + 28));
  objc_msgSend(*(id *)(*(_QWORD *)(v4 + 16) + OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer), sel_setVolume_, v12);
  return (char *)objc_msgSend(*(id *)(*(_QWORD *)(v4 + 16) + OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer), sel_setAudioSession_, a1);
}

uint64_t sub_23A763A40()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23A763A58()
{
  uint64_t v0;
  uint64_t v1;
  double *v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  id v9;
  _QWORD *v10;
  double v11;

  if (qword_2569B7310 != -1)
    swift_once();
  if ((byte_2569B9D60 & 1) == 0)
  {
    v1 = *(_QWORD *)(v0 + 16);
    if ((objc_msgSend(*(id *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer), sel_isPlaying) & 1) == 0)
    {
      v2 = (double *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC6DropIn12DropInPlayer_settings);
      v3 = *v2;
      *(double *)(v0 + 24) = *v2;
      v4 = v2[1];
      *(double *)(v0 + 32) = v4;
      v5 = LOBYTE(v3);
      v6 = LOBYTE(v3) & 1;
      if (v5 == 2 || v6 != 0)
      {
        v8 = *(void **)(v1 + 16);
        *(_QWORD *)(v0 + 40) = v8;
        v9 = v8;
        v10 = (_QWORD *)OUTLINED_FUNCTION_8_6();
        *(_QWORD *)(v0 + 48) = v10;
        v11 = OUTLINED_FUNCTION_7_6(v10, (uint64_t)sub_23A763B50);
        return OUTLINED_FUNCTION_2_4(v11);
      }
      sub_23A763CA0(v4);
    }
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A763B50()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)

  return OUTLINED_FUNCTION_15();
}

uint64_t sub_23A763BB4()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 24) != 2)
    sub_23A763CA0(*(double *)(v0 + 32));
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23A763BF0()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

id sub_23A763C1C()
{
  uint64_t v0;
  id result;

  if (qword_2569B7310 != -1)
    result = (id)swift_once();
  if ((byte_2569B9D60 & 1) == 0)
  {
    objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6DropIn12DropInPlayer_timer), sel_invalidate);
    sub_23A7637BC(0);
    return objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC6DropIn11AudioPlayer_avAudioPlayer), sel_stop);
  }
  return result;
}

void sub_23A763CA0(double a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t);
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v2 = sub_23A76931C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v15 - v7;
  sub_23A769310();
  sub_23A769304();
  v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  v9(v6, v2);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  v10 = swift_allocObject();
  swift_weakInit();
  v11 = objc_allocWithZone(MEMORY[0x24BDBCF40]);
  v12 = sub_23A76461C((uint64_t)v6, 1, (uint64_t)sub_23A764614, v10, a1);
  v13 = v12;
  sub_23A7637BC((uint64_t)v12);
  v14 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
  objc_msgSend(v14, sel_addTimer_forMode_, v13, *MEMORY[0x24BDBCA90]);

  v9(v8, v2);
  OUTLINED_FUNCTION_4_4();
}

uint64_t sub_23A763E1C()
{
  uint64_t v0;
  char *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A00);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = result;
    v4 = sub_23A769568();
    __swift_storeEnumTagSinglePayload((uint64_t)v1, 1, 1, v4);
    v5 = (_QWORD *)swift_allocObject();
    v5[2] = 0;
    v5[3] = 0;
    v5[4] = v3;
    sub_23A758760();
    return swift_release();
  }
  return result;
}

uint64_t sub_23A763EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a4;
  return swift_task_switch();
}

uint64_t sub_23A763F08()
{
  _QWORD *v0;
  void *v1;
  id v2;
  _QWORD *v3;
  double v4;

  v1 = *(void **)(v0[3] + 16);
  v0[4] = v1;
  v2 = v1;
  v3 = (_QWORD *)OUTLINED_FUNCTION_8_6();
  v0[5] = v3;
  v4 = OUTLINED_FUNCTION_7_6(v3, (uint64_t)sub_23A763F64);
  return OUTLINED_FUNCTION_2_4(v4);
}

uint64_t sub_23A763F64()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(*(_QWORD *)v1 + 32);
  *(_QWORD *)(*(_QWORD *)v1 + 48) = v0;
  swift_task_dealloc();

  if (v0)
  return OUTLINED_FUNCTION_15();
}

uint64_t sub_23A763FCC()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 16) = *(_QWORD *)(v0 + 48) != 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DropInPlayer.deinit()
{
  uint64_t v0;

  sub_23A7518E4(v0 + OBJC_IVAR____TtC6DropIn12DropInPlayer_settings);
  return v0;
}

uint64_t DropInPlayer.__deallocating_deinit()
{
  DropInPlayer.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_23A764048()
{
  return type metadata accessor for DropInPlayer(0);
}

uint64_t type metadata accessor for DropInPlayer(uint64_t a1)
{
  return sub_23A764064(a1, (uint64_t *)&unk_2569B84A8);
}

uint64_t sub_23A764064(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A764094()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for DropInPlayer.Settings(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for DropInPlayer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DropInPlayer.start()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 168) + *(_QWORD *)(*(_QWORD *)v0 + 168));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A7583E4;
  return OUTLINED_FUNCTION_5(v4);
}

uint64_t dispatch thunk of DropInPlayer.stop()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t *initializeBufferWithCopyOfBuffer for DropInPlayer.Settings(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    v7 = *(int *)(a3 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_23A7692D4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    *(_DWORD *)((char *)v4 + *(int *)(a3 + 28)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 28));
  }
  return v4;
}

uint64_t destroy for DropInPlayer.Settings(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 24);
  v3 = sub_23A7692D4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

uint64_t initializeWithCopy for DropInPlayer.Settings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A7692D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  *(_DWORD *)(a1 + *(int *)(a3 + 28)) = *(_DWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t assignWithCopy for DropInPlayer.Settings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A7692D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_DWORD *)(a1 + *(int *)(a3 + 28)) = *(_DWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t initializeWithTake for DropInPlayer.Settings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A7692D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_DWORD *)(a1 + *(int *)(a3 + 28)) = *(_DWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t assignWithTake for DropInPlayer.Settings(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A7692D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  *(_DWORD *)(a1 + *(int *)(a3 + 28)) = *(_DWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t getEnumTagSinglePayload for DropInPlayer.Settings()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A764470(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 253)
  {
    v4 = *a1;
    if (v4 >= 2)
      v5 = ((v4 + 2147483646) & 0x7FFFFFFF) - 1;
    else
      v5 = -2;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = OUTLINED_FUNCTION_6_4();
    return __swift_getEnumTagSinglePayload((uint64_t)&a1[*(int *)(a3 + 24)], a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for DropInPlayer.Settings()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_23A764500(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = OUTLINED_FUNCTION_6_4();
    return (_BYTE *)__swift_storeEnumTagSinglePayload((uint64_t)&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_23A764564()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A7692D4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A7645F0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A764614()
{
  return sub_23A763E1C();
}

id sub_23A76461C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, double a5)
{
  void *v5;
  void *v6;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v17[6];

  v6 = v5;
  v12 = (void *)sub_23A7692F8();
  v17[4] = a3;
  v17[5] = a4;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 1107296256;
  v17[2] = sub_23A757D9C;
  v17[3] = &block_descriptor_6;
  v13 = _Block_copy(v17);
  v14 = objc_msgSend(v6, sel_initWithFireDate_interval_repeats_block_, v12, a2 & 1, v13, a5);
  _Block_release(v13);

  v15 = sub_23A76931C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a1, v15);
  swift_release();
  return v14;
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_23A764720()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A76474C(uint64_t a1)
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
  v7[1] = sub_23A7582E4;
  return sub_23A763EF0(a1, v4, v5, v6);
}

uint64_t sub_23A7647B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DropInPlayer.Settings(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_2_4(double a1)
{
  return sub_23A74F5B4(a1);
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return sub_23A7692D4();
}

double OUTLINED_FUNCTION_7_6@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double v3;

  *a1 = v2;
  a1[1] = a2;
  return v3;
}

uint64_t OUTLINED_FUNCTION_8_6()
{
  return swift_task_alloc();
}

void Feature.domain.getter()
{
  OUTLINED_FUNCTION_0_7();
}

void Feature.feature.getter()
{
  OUTLINED_FUNCTION_0_7();
}

uint64_t Feature.isEnabled.getter()
{
  char v0;
  _BYTE v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  v3 = &type metadata for Feature;
  v4 = sub_23A7648B0();
  v0 = sub_23A769358();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  return v0 & 1;
}

unint64_t sub_23A7648B0()
{
  unint64_t result;

  result = qword_2542D4920;
  if (!qword_2542D4920)
  {
    result = MEMORY[0x23B856A18](&protocol conformance descriptor for Feature, &type metadata for Feature);
    atomic_store(result, (unint64_t *)&qword_2542D4920);
  }
  return result;
}

uint64_t static Feature.== infix(_:_:)()
{
  return 1;
}

uint64_t Feature.hash(into:)()
{
  return sub_23A76985C();
}

uint64_t Feature.hashValue.getter()
{
  sub_23A769850();
  sub_23A76985C();
  return sub_23A769868();
}

uint64_t sub_23A764958()
{
  return 1;
}

uint64_t sub_23A764960()
{
  return Feature.hashValue.getter();
}

uint64_t sub_23A764974()
{
  return Feature.hash(into:)();
}

uint64_t sub_23A764988()
{
  sub_23A769850();
  sub_23A76985C();
  return sub_23A769868();
}

unint64_t sub_23A7649C8()
{
  unint64_t result;

  result = qword_2569B8640;
  if (!qword_2569B8640)
  {
    result = MEMORY[0x23B856A18](&protocol conformance descriptor for Feature, &type metadata for Feature);
    atomic_store(result, (unint64_t *)&qword_2569B8640);
  }
  return result;
}

const char *sub_23A764A04()
{
  return "DropIn";
}

const char *sub_23A764A18()
{
  return "Server";
}

uint64_t getEnumTagSinglePayload for Feature(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Feature(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A764AC0 + 4 * byte_23A76BAC0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A764AE0 + 4 * byte_23A76BAC5[v4]))();
}

_BYTE *sub_23A764AC0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A764AE0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A764AE8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A764AF0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A764AF8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A764B00(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23A764B0C()
{
  return 0;
}

ValueMetadata *type metadata accessor for Feature()
{
  return &type metadata for Feature;
}

void ClientContext.homeIdentifier.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_23A764F84(v1 + OBJC_IVAR___DIClientContext_homeIdentifier, a1, (uint64_t *)&unk_2542D4B90);
}

void ClientContext.__allocating_init(homeIdentifier:)()
{
  objc_class *v0;
  id v1;
  objc_super v2;

  v1 = OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_10_4((uint64_t)v1, (uint64_t)v1 + OBJC_IVAR___DIClientContext_homeIdentifier);
  v2.receiver = v1;
  v2.super_class = v0;
  objc_msgSendSuper2(&v2, sel_init);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_7_7();
}

void ClientContext.init(homeIdentifier:)()
{
  void *v0;
  objc_class *v1;
  objc_super v2;

  v1 = (objc_class *)OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_10_4((uint64_t)v1, (uint64_t)v0 + OBJC_IVAR___DIClientContext_homeIdentifier);
  v2.receiver = v0;
  v2.super_class = v1;
  objc_msgSendSuper2(&v2, sel_init);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_7_7();
}

uint64_t ClientContext.isEqual(_:)()
{
  void *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  _BYTE *v29;
  BOOL v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  id v34;
  _BYTE v35[24];
  uint64_t v36;

  v2 = v0;
  OUTLINED_FUNCTION_12_4();
  v3 = OUTLINED_FUNCTION_8_7();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_47();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D4B90);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569B8648);
  OUTLINED_FUNCTION_2();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_2_5(v10, v13, &qword_2542D4880);
  if (v36)
  {
    v14 = OUTLINED_FUNCTION_0_8();
    if ((v14 & 1) != 0)
    {
      v16 = v12;
      v17 = v7;
      v18 = v1;
      v19 = v3;
      v20 = v4;
      v21 = v34;

      v31 = v21 == v2;
      v4 = v20;
      v3 = v19;
      v1 = v18;
      v7 = v17;
      v12 = v16;
      if (v31)
        goto LABEL_5;
    }
  }
  else
  {
    sub_23A764FC4((uint64_t)v35, &qword_2542D4880);
  }
  OUTLINED_FUNCTION_2_5(v14, v15, &qword_2542D4880);
  if (!v36)
    goto LABEL_16;
  if ((OUTLINED_FUNCTION_0_8() & 1) == 0)
  {
LABEL_18:
    v22 = 0;
    return v22 & 1;
  }

  OUTLINED_FUNCTION_2_5(v23, v24, &qword_2542D4880);
  if (!v36)
  {
LABEL_16:
    v28 = &qword_2542D4880;
    v29 = v35;
LABEL_17:
    sub_23A764FC4((uint64_t)v29, v28);
    goto LABEL_18;
  }
  if ((OUTLINED_FUNCTION_0_8() & 1) == 0)
    goto LABEL_18;
  v25 = v34;
  v26 = (uint64_t)v2 + OBJC_IVAR___DIClientContext_homeIdentifier;
  v27 = (uint64_t)&v12[*(int *)(v8 + 48)];
  sub_23A764F84((uint64_t)v34 + OBJC_IVAR___DIClientContext_homeIdentifier, (uint64_t)v12, (uint64_t *)&unk_2542D4B90);
  sub_23A764F84(v26, v27, (uint64_t *)&unk_2542D4B90);
  OUTLINED_FUNCTION_4_5((uint64_t)v12);
  if (!v31)
  {
    sub_23A764F84((uint64_t)v12, (uint64_t)v7, (uint64_t *)&unk_2542D4B90);
    OUTLINED_FUNCTION_4_5(v27);
    if (!v31)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v1, v27, v3);
      sub_23A764FFC();
      v22 = sub_23A76946C();

      v32 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
      v32(v1, v3);
      v32((uint64_t)v7, v3);
      sub_23A764FC4((uint64_t)v12, (uint64_t *)&unk_2542D4B90);
      return v22 & 1;
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    goto LABEL_23;
  }

  OUTLINED_FUNCTION_4_5(v27);
  if (!v31)
  {
LABEL_23:
    v28 = (uint64_t *)&unk_2569B8648;
    v29 = v12;
    goto LABEL_17;
  }
  sub_23A764FC4((uint64_t)v12, (uint64_t *)&unk_2542D4B90);
LABEL_5:
  v22 = 1;
  return v22 & 1;
}

void sub_23A764F84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_0();
}

void sub_23A764FC4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_0();
}

unint64_t sub_23A764FFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569B8658;
  if (!qword_2569B8658)
  {
    v1 = sub_23A76934C();
    result = MEMORY[0x23B856A18](MEMORY[0x24BDCEA98], v1);
    atomic_store(result, (unint64_t *)&qword_2569B8658);
  }
  return result;
}

unint64_t ClientContext.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D4B90);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_6_5();
  sub_23A769724();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_4(v0 + OBJC_IVAR___DIClientContext_homeIdentifier);
  sub_23A7694A8();
  sub_23A7694C0();
  swift_bridgeObjectRelease();
  return 0xD000000000000011;
}

uint64_t static ClientContext.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall ClientContext.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D4B90);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_13_4(v1 + OBJC_IVAR___DIClientContext_homeIdentifier);
  v5 = OUTLINED_FUNCTION_8_7();
  v6 = 0;
  if (__swift_getEnumTagSinglePayload(v2, 1, v5) != 1)
  {
    v6 = (void *)sub_23A769328();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v2, v5);
  }
  v7 = (void *)sub_23A769478();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v6, v7);

}

void ClientContext.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_11_4();
  ClientContext.init(coder:)(a1);
  OUTLINED_FUNCTION_0();
}

id ClientContext.init(coder:)(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  objc_class *ObjectType;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  objc_super v14;

  v3 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D4B90);
  OUTLINED_FUNCTION_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_47();
  sub_23A765444();
  v7 = v3;
  v8 = sub_23A7696AC();
  if (v8)
  {
    v9 = (void *)v8;
    sub_23A769334();

    v10 = OUTLINED_FUNCTION_8_7();
    v11 = 0;
  }
  else
  {
    v10 = sub_23A76934C();
    v11 = 1;
  }
  __swift_storeEnumTagSinglePayload(v2, v11, 1, v10);
  sub_23A765480(v2, (uint64_t)v7 + OBJC_IVAR___DIClientContext_homeIdentifier);

  v14.receiver = v7;
  v14.super_class = ObjectType;
  v12 = objc_msgSendSuper2(&v14, sel_init);

  return v12;
}

unint64_t sub_23A765444()
{
  unint64_t result;

  result = qword_2542D4B70;
  if (!qword_2542D4B70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542D4B70);
  }
  return result;
}

uint64_t sub_23A765480(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D4B90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id ClientContext.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_11_4(), sel_init);
}

void ClientContext.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ClientContext.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_12_4();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23A765598()
{
  return type metadata accessor for ClientContext();
}

uint64_t type metadata accessor for ClientContext()
{
  uint64_t result;

  result = qword_2542D4BB0;
  if (!qword_2542D4BB0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23A7655D8()
{
  unint64_t v0;

  sub_23A765660();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for ClientContext()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ClientContext.__allocating_init(homeIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of ClientContext.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_23A765660()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2542D4BA0)
  {
    sub_23A76934C();
    v0 = sub_23A7696C4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2542D4BA0);
  }
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_2_5(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_23A764F84(v3, v4 - 112, a3);
}

void OUTLINED_FUNCTION_3_6()
{
  uint64_t v0;
  uint64_t *v1;

  sub_23A764FC4(v0, v1);
}

uint64_t OUTLINED_FUNCTION_4_5(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_8_7()
{
  return sub_23A76934C();
}

void OUTLINED_FUNCTION_10_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;

  sub_23A764F84(v2, a2, v3);
}

id OUTLINED_FUNCTION_11_4()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return swift_getObjectType();
}

void OUTLINED_FUNCTION_13_4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  sub_23A764F84(a1, v2, v1);
}

char *OneshotTimer.__allocating_init(timeInterval:queue:identifier:label:timerFiredHandler:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  objc_class *v7;
  id v15;

  v15 = objc_allocWithZone(v7);
  return OneshotTimer.init(timeInterval:queue:identifier:label:timerFiredHandler:)(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_23A765830()
{
  sub_23A769724();
  sub_23A7694C0();
  sub_23A769760();
  OUTLINED_FUNCTION_7_8();
  swift_bridgeObjectRetain();
  sub_23A7694C0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_8_7();
  sub_23A766EB8(&qword_2569B8728, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_23A7697C0();
  sub_23A7694C0();
  swift_bridgeObjectRelease();
  sub_23A7694C0();
  sub_23A769598();
  sub_23A7694C0();
  sub_23A769418();
  sub_23A7697C0();
  sub_23A7694C0();
  swift_bridgeObjectRelease();
  return 0;
}

char *OneshotTimer.init(timeInterval:queue:identifier:label:timerFiredHandler:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  void *v7;
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
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  objc_class *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  _QWORD *v46;
  char *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  _QWORD *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
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
  id v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD aBlock[6];
  objc_super v87;

  v82 = a6;
  v72 = a5;
  v66 = a4;
  v65 = a3;
  v83 = a1;
  v84 = a2;
  v9 = sub_23A7693DC();
  v76 = *(_QWORD *)(v9 - 8);
  v77 = v9;
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_9_8(v10);
  v75 = sub_23A769400();
  OUTLINED_FUNCTION_10_5(*(_QWORD *)(v75 - 8));
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_9_8(v12);
  v69 = sub_23A7693D0();
  OUTLINED_FUNCTION_10_5(*(_QWORD *)(v69 - 8));
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_9_8(v14);
  v85 = sub_23A769424();
  v80 = *(_QWORD *)(v85 - 8);
  v15 = MEMORY[0x24BDAC7A8](v85);
  v79 = (uint64_t)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v63 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v81 = (uint64_t)&v63 - v20;
  v64 = sub_23A76937C();
  OUTLINED_FUNCTION_10_5(*(_QWORD *)(v64 - 8));
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_0_2();
  v24 = v23 - v22;
  v25 = sub_23A769658();
  v26 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE57C0];
  v27 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_0_2();
  v30 = v29 - v28;
  sub_23A7660E0();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_23A766EB8(&qword_2569B8740, v26, MEMORY[0x24BEE57D0]);
  v31 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569B8748);
  sub_23A766EF8(&qword_2569B8750, &qword_2569B8748);
  sub_23A7696F4();
  v32 = sub_23A769664();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v30, v25);
  *(_QWORD *)&v31[OBJC_IVAR___DIOneshotTimer_timer] = v32;
  v33 = &v31[OBJC_IVAR___DIOneshotTimer_label];
  v34 = v66;
  *(_QWORD *)v33 = v65;
  *((_QWORD *)v33 + 1) = v34;
  v35 = &v31[OBJC_IVAR___DIOneshotTimer_identifier];
  v36 = OUTLINED_FUNCTION_8_7();
  v78 = *(_QWORD *)(v36 - 8);
  v37 = *(void (**)(char *, uint64_t))(v78 + 16);
  v70 = v36;
  v37(v35, v84);
  *(double *)&v31[OBJC_IVAR___DIOneshotTimer_timeInterval] = a7;
  swift_bridgeObjectRetain();
  sub_23A769370();
  (*(void (**)(char *, uint64_t, uint64_t))(v63 + 32))(&v31[OBJC_IVAR___DIOneshotTimer_logger], v24, v64);
  v38 = v81;
  sub_23A76940C();
  MEMORY[0x23B8560B8](v38, a7);
  v39 = v80;
  v40 = v85;
  (*(void (**)(char *, char *, uint64_t))(v80 + 32))(&v31[OBJC_IVAR___DIOneshotTimer_deadline], v19, v85);

  v41 = (objc_class *)type metadata accessor for OneshotTimer();
  v87.receiver = v31;
  v87.super_class = v41;
  v42 = (char *)objc_msgSendSuper2(&v87, sel_init);
  v43 = OBJC_IVAR___DIOneshotTimer_timer;
  v44 = OUTLINED_FUNCTION_12_4();
  v45 = &v42[OBJC_IVAR___DIOneshotTimer_deadline];
  v46 = v67;
  sub_23A766154(v67);
  v47 = v42;
  MEMORY[0x23B85631C](v45, v46, v44, INFINITY);
  (*(void (**)(_QWORD *, uint64_t))(v68 + 8))(v46, v69);
  v69 = (uint64_t)v42;
  v68 = v43;
  OUTLINED_FUNCTION_12_4();
  v48 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v49 = (_QWORD *)swift_allocObject();
  v50 = v72;
  v49[2] = v48;
  v49[3] = v50;
  v49[4] = v82;
  aBlock[4] = sub_23A7663F8;
  aBlock[5] = v49;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A754D58;
  aBlock[3] = &block_descriptor_7;
  v51 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  v52 = v71;
  sub_23A7693E8();
  v53 = v73;
  sub_23A76641C();
  sub_23A76967C();
  _Block_release(v51);
  (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v53, v77);
  (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v52, v75);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v79, v38, v40);
  v54 = v47;
  v55 = sub_23A769364();
  v56 = sub_23A7695E0();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = OUTLINED_FUNCTION_7();
    v58 = (_QWORD *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v57 = 138412546;
    aBlock[0] = v54;
    v59 = v54;
    sub_23A7696D0();
    *v58 = v54;

    *(_WORD *)(v57 + 12) = 2048;
    v60 = v79;
    v61 = sub_23A769418();
    OUTLINED_FUNCTION_12_5(v60);
    aBlock[0] = v61;
    sub_23A7696D0();
    _os_log_impl(&dword_23A742000, v55, v56, "Timer created: %@, Now = %llu", (uint8_t *)v57, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }
  OUTLINED_FUNCTION_12_5(v79);

  OUTLINED_FUNCTION_12_4();
  sub_23A769694();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v84, v70);
  OUTLINED_FUNCTION_12_5(v81);
  return v54;
}

unint64_t sub_23A7660E0()
{
  unint64_t result;

  result = qword_2569B8738;
  if (!qword_2569B8738)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2569B8738);
  }
  return result;
}

uint64_t type metadata accessor for OneshotTimer()
{
  uint64_t result;

  result = qword_2569B8798;
  if (!qword_2569B8798)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A766154@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = 0;
  v2 = *MEMORY[0x24BEE5400];
  v3 = sub_23A7693D0();
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_23A76619C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_23A7661C0(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, double))
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  char *v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  double v16;
  void (*v17)(_QWORD, _QWORD, _QWORD, double);

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x23B856B50](v3);
  if (v4)
  {
    v5 = (void *)v4;
    if ((sub_23A766BBC() & 1) != 0)
    {

    }
    else
    {
      v6 = v5;
      v7 = sub_23A769364();
      v8 = sub_23A7695E0();
      if (os_log_type_enabled(v7, v8))
      {
        v17 = a2;
        v9 = (uint8_t *)swift_slowAlloc();
        v10 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v9 = 138412290;
        v11 = v6;
        sub_23A7696D0();
        *v10 = v5;

        _os_log_impl(&dword_23A742000, v7, v8, "Timer fired: %@", v9, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
        swift_arrayDestroy();
        MEMORY[0x23B856ACC](v10, -1, -1);
        v12 = v9;
        a2 = v17;
        MEMORY[0x23B856ACC](v12, -1, -1);
      }
      else
      {

      }
      sub_23A766938();
      v13 = *(_QWORD *)&v6[OBJC_IVAR___DIOneshotTimer_label];
      v14 = *(_QWORD *)&v6[OBJC_IVAR___DIOneshotTimer_label + 8];
      v15 = &v6[OBJC_IVAR___DIOneshotTimer_identifier];
      v16 = *(double *)&v6[OBJC_IVAR___DIOneshotTimer_timeInterval];
      swift_bridgeObjectRetain();
      a2(v13, v14, v15, v16);

      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_23A7663CC()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23A7663F8()
{
  uint64_t v0;

  sub_23A7661C0(*(_QWORD *)(v0 + 16), *(void (**)(_QWORD, _QWORD, _QWORD, double))(v0 + 24));
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

uint64_t sub_23A76641C()
{
  sub_23A7693DC();
  sub_23A766EB8((unint64_t *)&qword_2542D4A60, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D4A70);
  sub_23A766EF8((unint64_t *)&qword_2542D4A78, &qword_2542D4A70);
  return sub_23A7696F4();
}

void sub_23A7665BC(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  id v8;

  v7 = (void *)sub_23A769478();
  v8 = (id)sub_23A769328();
  (*(void (**)(uint64_t, void *, id, double))(a5 + 16))(a5, v7, v8, a1);

}

id OneshotTimer.__deallocating_deinit()
{
  void *v0;
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
  void *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD *v16;
  id v17;
  objc_super v19;
  _QWORD aBlock[6];

  v1 = sub_23A7693DC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_0_2();
  v5 = v4 - v3;
  v6 = sub_23A769400();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_0_2();
  v10 = v9 - v8;
  OUTLINED_FUNCTION_12_4();
  aBlock[4] = nullsub_1;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A754D58;
  aBlock[3] = &block_descriptor_6;
  v11 = _Block_copy(aBlock);
  sub_23A7693E8();
  sub_23A76641C();
  sub_23A76967C();
  _Block_release(v11);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  sub_23A766938();
  v12 = v0;
  v13 = sub_23A769364();
  v14 = sub_23A7695E0();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)OUTLINED_FUNCTION_7();
    v16 = (_QWORD *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v15 = 138412290;
    aBlock[0] = v12;
    v17 = v12;
    OUTLINED_FUNCTION_8_8();
    *v16 = v12;

    OUTLINED_FUNCTION_33_0(&dword_23A742000, v13, v14, "Timer destroyed %@", v15);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }

  v19.receiver = v12;
  v19.super_class = (Class)type metadata accessor for OneshotTimer();
  return objc_msgSendSuper2(&v19, sel_dealloc);
}

void sub_23A766938()
{
  id v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  _QWORD *v11;
  NSObject *v12;

  swift_getObjectType();
  if ((sub_23A769670() & 1) != 0)
  {
    v0 = OUTLINED_FUNCTION_11_5();
    v1 = sub_23A769364();
    v2 = sub_23A7695BC();
    if (os_log_type_enabled(v1, v2))
    {
      v12 = v1;
      v3 = (uint8_t *)OUTLINED_FUNCTION_7();
      v11 = (_QWORD *)OUTLINED_FUNCTION_7();
      *(_DWORD *)v3 = 138412290;
      v4 = v0;
      sub_23A7696D0();
      *v11 = v0;

      OUTLINED_FUNCTION_33_0(&dword_23A742000, v12, v2, "Timer is already canceled %@", v3);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
      OUTLINED_FUNCTION_33();
      OUTLINED_FUNCTION_0_1();
    }

  }
  sub_23A769688();
  v5 = OUTLINED_FUNCTION_11_5();
  v6 = sub_23A769364();
  v7 = sub_23A7695E0();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)OUTLINED_FUNCTION_7();
    v9 = (_QWORD *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v8 = 138412290;
    v10 = v5;
    OUTLINED_FUNCTION_8_8();
    *v9 = v5;

    OUTLINED_FUNCTION_33_0(&dword_23A742000, v6, v7, "Timer cancelled %@", v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }

}

uint64_t sub_23A766BBC()
{
  void *v0;
  char v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;

  OUTLINED_FUNCTION_12_4();
  v1 = sub_23A769670();
  v2 = v0;
  v3 = sub_23A769364();
  v4 = sub_23A7695E0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = OUTLINED_FUNCTION_7();
    v6 = (_QWORD *)OUTLINED_FUNCTION_7();
    *(_DWORD *)v5 = 67109378;
    sub_23A7696D0();
    *(_WORD *)(v5 + 8) = 2112;
    v7 = v2;
    sub_23A7696D0();
    *v6 = v2;

    _os_log_impl(&dword_23A742000, v3, v4, "Timer isCancelled: %{BOOL}d, %@", (uint8_t *)v5, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569B7858);
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_0_1();
  }

  return v1 & 1;
}

id OneshotTimer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void OneshotTimer.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23A766D90()
{
  return type metadata accessor for OneshotTimer();
}

uint64_t sub_23A766D98()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_23A76934C();
  if (v1 <= 0x3F)
  {
    result = sub_23A769424();
    if (v2 <= 0x3F)
    {
      result = sub_23A76937C();
      if (v3 <= 0x3F)
        return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t method lookup function for OneshotTimer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of OneshotTimer.__allocating_init(timeInterval:queue:identifier:label:timerFiredHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of OneshotTimer.cancelTimer()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t sub_23A766E8C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_23A766EB0(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v4;

  sub_23A7665BC(a4, a1, a2, a3, *(_QWORD *)(v4 + 16));
}

uint64_t sub_23A766EB8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B856A18](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A766EF8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B856A18](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_6_6(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_7_8()
{
  return sub_23A7694C0();
}

uint64_t OUTLINED_FUNCTION_8_8()
{
  return sub_23A7696D0();
}

uint64_t OUTLINED_FUNCTION_9_8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

void OUTLINED_FUNCTION_10_5(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

id OUTLINED_FUNCTION_11_5()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_12_5(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, _QWORD);
  uint64_t v2;

  return v1(a1, *(_QWORD *)(v2 - 176));
}

uint64_t static ToneProvider.startToneURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A767020(0x74536E49706F7244, 0xEF656E6F54747261, a1);
}

uint64_t static ToneProvider.ongoingToneURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A767020(0xD000000000000011, 0x800000023A76DA30, a1);
}

uint64_t static ToneProvider.endToneURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A767020(0x6E456E49706F7244, 0xED0000656E6F5464, a1);
}

uint64_t sub_23A767020@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  if (qword_2569B7340 != -1)
    swift_once();
  v6 = sub_23A767120(a1, a2, 7758199, 0xE300000000000000, (void *)qword_2569B87A8);
  if (v6)
  {
    v7 = v6;
    sub_23A7692C8();

    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  v9 = sub_23A7692D4();
  return __swift_storeEnumTagSinglePayload(a3, v8, 1, v9);
}

id sub_23A7670CC()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  sub_23A7671C0();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2569B87A8 = (uint64_t)result;
  return result;
}

id sub_23A767120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)sub_23A769478();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_23A769478();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(a5, sel_URLForResource_withExtension_, v6, v7);

  return v8;
}

ValueMetadata *type metadata accessor for ToneProvider()
{
  return &type metadata for ToneProvider;
}

unint64_t sub_23A7671C0()
{
  unint64_t result;

  result = qword_2569B87B0;
  if (!qword_2569B87B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2569B87B0);
  }
  return result;
}

id sub_23A7671FC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id result;

  if (qword_2542D49D8 != -1)
    swift_once();
  v0 = qword_2542D4868;
  v1 = *(_QWORD *)algn_2542D4870;
  v2 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  swift_bridgeObjectRetain();
  result = sub_23A769184(v0, v1);
  qword_2542D4860 = (uint64_t)result;
  return result;
}

uint64_t dropInUserDefaults.getter()
{
  uint64_t v0;
  id v1;

  if (qword_2542D4898 != -1)
    swift_once();
  v0 = qword_2542D4860;
  v1 = (id)qword_2542D4860;
  return v0;
}

id Default.userDefaults.getter()
{
  id *v0;
  id v1;
  id v2;

  v1 = *v0;
  v2 = *v0;
  return v1;
}

uint64_t Default.key.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  OUTLINED_FUNCTION_3_8();
  return v1;
}

uint64_t Default.defaultValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 32));
}

uint64_t Default.localizedDescription.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 36));
  OUTLINED_FUNCTION_3_8();
  return v2;
}

uint64_t sub_23A767378(uint64_t a1)
{
  MEMORY[0x23B856A18](&protocol conformance descriptor for Default<A>, a1);
  MEMORY[0x23B856A18](&protocol conformance descriptor for Default<A>, a1);
  MEMORY[0x23B856A18](&protocol conformance descriptor for Default<A>, a1);
  return UserDefaultsAccessible<>.description.getter();
}

id sub_23A7673E4()
{
  qword_2569B87D0 = 0x4012000000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B87B8 = qword_2542D4860;
  unk_2569B87C0 = 0xD00000000000001CLL;
  qword_2569B87C8 = 0x800000023A76E460;
  qword_2569B87D8 = 0xD00000000000002CLL;
  unk_2569B87E0 = 0x800000023A76E480;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.dropInSessionAutoAnswerDelay.getter()
{
  if (qword_2569B7350 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B87B8);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A7674C8()
{
  qword_2569B8800 = 0x407E000000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B87E8 = qword_2542D4860;
  unk_2569B87F0 = 0xD00000000000001ALL;
  qword_2569B87F8 = 0x800000023A76E410;
  qword_2569B8808 = 0xD000000000000028;
  unk_2569B8810 = 0x800000023A76E430;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.dropInAvailabilityDuration.getter()
{
  if (qword_2569B7358 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B87E8);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A7675AC()
{
  qword_2569B8830 = 0x403E000000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B8818 = qword_2542D4860;
  unk_2569B8820 = 0xD000000000000022;
  qword_2569B8828 = 0x800000023A76E380;
  qword_2569B8838 = 0xD000000000000055;
  unk_2569B8840 = 0x800000023A76E3B0;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.dropInSessionAutoAnswerWaitTimeout.getter()
{
  if (qword_2569B7360 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B8818);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A767690()
{
  qword_2569B8860 = 0x404E000000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B8848 = qword_2542D4860;
  unk_2569B8850 = 0xD000000000000019;
  qword_2569B8858 = 0x800000023A76E310;
  qword_2569B8868 = 0xD000000000000049;
  unk_2569B8870 = 0x800000023A76E330;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.dropInSessionStartTimeout.getter()
{
  if (qword_2569B7368 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B8848);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A767774()
{
  qword_2569B8890 = 0x407E000000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B8878 = qword_2542D4860;
  unk_2569B8880 = 0xD000000000000017;
  qword_2569B8888 = 0x800000023A76E2C0;
  qword_2569B8898 = 0xD000000000000026;
  unk_2569B88A0 = 0x800000023A76E2E0;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.pseudonymExpiryDuration.getter()
{
  if (qword_2569B7370 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B8878);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A767858()
{
  qword_2569B88C0 = 0x40AC200000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B88A8 = qword_2542D4860;
  unk_2569B88B0 = 0xD000000000000023;
  qword_2569B88B8 = 0x800000023A76E250;
  qword_2569B88C8 = 0xD000000000000033;
  unk_2569B88D0 = 0x800000023A76E280;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.pregeneratedPseudonymExpiryDuration.getter()
{
  if (qword_2569B7378 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B88A8);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A767940()
{
  qword_2569B88F0 = 0x4082C00000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B88D8 = qword_2542D4860;
  unk_2569B88E0 = 0xD000000000000023;
  qword_2569B88E8 = 0x800000023A76E150;
  qword_2569B88F8 = 0xD0000000000000C7;
  unk_2569B8900 = 0x800000023A76E180;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.pregeneratedPseudonymRenewThreshold.getter()
{
  if (qword_2569B7380 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B88D8);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A767A28()
{
  qword_2569B8920 = 0x407E000000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B8908 = qword_2542D4860;
  unk_2569B8910 = 0xD000000000000018;
  qword_2569B8918 = 0x800000023A76E100;
  qword_2569B8928 = 0xD000000000000027;
  unk_2569B8930 = 0x800000023A76E120;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.dropInSessionMaxDuration.getter()
{
  if (qword_2569B7388 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B8908);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A767B0C()
{
  qword_2569B8950 = 0x404E000000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B8938 = qword_2542D4860;
  unk_2569B8940 = 0xD000000000000013;
  qword_2569B8948 = 0x800000023A76E0B0;
  qword_2569B8958 = 0xD00000000000002FLL;
  unk_2569B8960 = 0x800000023A76E0D0;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.idsSendEventTimeout.getter()
{
  if (qword_2569B7390 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B8938);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A767BF0()
{
  qword_2569B8980 = 0x404E000000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B8968 = qword_2542D4860;
  unk_2569B8970 = 0xD000000000000015;
  qword_2569B8978 = 0x800000023A76E060;
  qword_2569B8988 = 0xD000000000000027;
  unk_2569B8990 = 0x800000023A76E080;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.idsSendRequestTimeout.getter()
{
  if (qword_2569B7398 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B8968);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A767CD4()
{
  qword_2569B89B0 = 0x404E000000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B8998 = qword_2542D4860;
  unk_2569B89A0 = 0xD000000000000016;
  qword_2569B89A8 = 0x800000023A76E010;
  qword_2569B89B8 = 0xD000000000000028;
  unk_2569B89C0 = 0x800000023A76E030;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.idsSendResponseTimeout.getter()
{
  if (qword_2569B73A0 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B8998);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A767DB8()
{
  qword_2569B89E0 = 0x404E000000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B89C8 = qword_2542D4860;
  unk_2569B89D0 = 0xD000000000000016;
  qword_2569B89D8 = 0x800000023A76DFA0;
  qword_2569B89E8 = 0xD000000000000045;
  unk_2569B89F0 = 0x800000023A76DFC0;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.idsResponseWaitTimeout.getter()
{
  if (qword_2569B73A8 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B89C8);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A767E9C()
{
  qword_2569B8A10 = 0x404E000000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B89F8 = qword_2542D4860;
  unk_2569B8A00 = 0xD000000000000017;
  qword_2569B8A08 = 0x800000023A76DF40;
  qword_2569B8A18 = 0xD000000000000033;
  unk_2569B8A20 = 0x800000023A76DF60;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.rapportSendEventTimeout.getter()
{
  if (qword_2569B73B0 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B89F8);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A767F80()
{
  qword_2569B8A40 = 0x404E000000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B8A28 = qword_2542D4860;
  unk_2569B8A30 = 0xD000000000000028;
  qword_2569B8A38 = 0x800000023A76DED0;
  qword_2569B8A48 = 0xD00000000000003DLL;
  unk_2569B8A50 = 0x800000023A76DF00;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.rapportSendRequestAndResponseWaitTimeout.getter()
{
  if (qword_2569B73B8 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B8A28);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A768068()
{
  qword_2569B8A70 = 0x404E000000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B8A58 = qword_2542D4860;
  unk_2569B8A60 = 0xD00000000000001ALL;
  qword_2569B8A68 = 0x800000023A76DE80;
  qword_2569B8A78 = 0xD00000000000002CLL;
  unk_2569B8A80 = 0x800000023A76DEA0;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.rapportSendResponseTimeout.getter()
{
  if (qword_2569B73C0 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B8A58);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A76814C()
{
  qword_2569B8AA0 = 0x403E000000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B8A88 = qword_2542D4860;
  unk_2569B8A90 = 0xD000000000000025;
  qword_2569B8A98 = 0x800000023A76DE10;
  qword_2569B8AA8 = 0xD00000000000003DLL;
  unk_2569B8AB0 = 0x800000023A76DE40;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.startDropInRequestResponseWaitTimeout.getter()
{
  if (qword_2569B73C8 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2569B8A88);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A768230()
{
  byte_2569B8AD0 = 0;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B8AB8 = qword_2542D4860;
  unk_2569B8AC0 = 0xD000000000000010;
  qword_2569B8AC8 = 0x800000023A76DDC0;
  qword_2569B8AD8 = 0xD00000000000002ELL;
  unk_2569B8AE0 = 0x800000023A76DDE0;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.dropInAutoAnswer.getter()
{
  if (qword_2569B73D0 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_6((__int128 *)&qword_2569B8AB8);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A768310()
{
  byte_2569B8B00 = 0;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B8AE8 = qword_2542D4860;
  unk_2569B8AF0 = 0xD000000000000014;
  qword_2569B8AF8 = 0x800000023A76DD60;
  qword_2569B8B08 = 0xD000000000000037;
  unk_2569B8B10 = 0x800000023A76DD80;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.dropInAnytimeEnabled.getter()
{
  if (qword_2569B73D8 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_6((__int128 *)&qword_2569B8AE8);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A7683F4()
{
  byte_2569B8B30 = 0;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2569B8B18 = qword_2542D4860;
  unk_2569B8B20 = 0xD000000000000016;
  qword_2569B8B28 = 0x800000023A76DCF0;
  qword_2569B8B38 = 0xD000000000000045;
  unk_2569B8B40 = 0x800000023A76DD10;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.multiUserDropInEnabled.getter()
{
  if (qword_2569B73E0 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_6((__int128 *)&qword_2569B8B18);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A7684D4()
{
  byte_2542D4B28 = 0;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2542D4B10 = qword_2542D4860;
  *(_QWORD *)algn_2542D4B18 = 0xD000000000000023;
  qword_2542D4B20 = 0x800000023A76DC80;
  qword_2542D4B30 = 0xD000000000000030;
  unk_2542D4B38 = 0x800000023A76DCB0;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.forceDropInAccessAllowedForAllUsers.getter()
{
  if (qword_2542D4B48 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_6((__int128 *)&qword_2542D4B10);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A7685B4()
{
  qword_2542D4940 = 0x403E000000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2542D4928 = qword_2542D4860;
  unk_2542D4930 = 0xD00000000000002CLL;
  qword_2542D4938 = 0x800000023A76DBE0;
  qword_2542D4948 = 0xD00000000000006ELL;
  unk_2542D4950 = 0x800000023A76DC10;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.dropInAvailableBroadcastThrottleTimeInterval.getter()
{
  if (qword_2542D4960 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2542D4928);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A76869C()
{
  qword_2542D4980 = 0x4051800000000000;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2542D4968 = qword_2542D4860;
  unk_2542D4970 = 0xD000000000000014;
  qword_2542D4978 = 0x800000023A76DB60;
  qword_2542D4988 = 0xD000000000000059;
  unk_2542D4990 = 0x800000023A76DB80;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.messageDedupeTimeout.getter()
{
  if (qword_2542D4998 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_9((__int128 *)&qword_2542D4968);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A768784()
{
  byte_2542D49B8 = 1;
  if (qword_2542D4898 != -1)
    swift_once();
  qword_2542D49A0 = qword_2542D4860;
  *(_QWORD *)algn_2542D49A8 = 0xD000000000000026;
  qword_2542D49B0 = 0x800000023A76DAA0;
  qword_2542D49C0 = 0xD00000000000008BLL;
  unk_2542D49C8 = 0x800000023A76DAD0;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.specifyBundleIDForConversationProvider.getter()
{
  if (qword_2542D49D0 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_6((__int128 *)&qword_2542D49A0);
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

id sub_23A768868()
{
  dword_2569B8B60 = 1059145646;
  if (qword_2542D4898 != -1)
    swift_once();
  *(_QWORD *)&xmmword_2569B8B48 = qword_2542D4860;
  *((_QWORD *)&xmmword_2569B8B48 + 1) = 0x6C6143656E6F6870;
  qword_2569B8B58 = 0xEF656D756C6F566CLL;
  qword_2569B8B68 = 0xD000000000000045;
  unk_2569B8B70 = 0x800000023A76DA50;
  return (id)qword_2542D4860;
}

uint64_t static Defaults.phoneCallVolume.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (qword_2569B73E8 != -1)
    swift_once();
  v2 = qword_2569B8B58;
  v3 = dword_2569B8B60;
  v4 = qword_2569B8B68;
  v5 = unk_2569B8B70;
  v6 = (void *)xmmword_2569B8B48;
  *(_OWORD *)a1 = xmmword_2569B8B48;
  *(_QWORD *)(a1 + 16) = v2;
  *(_DWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  v7 = v6;
  OUTLINED_FUNCTION_3_8();
  return OUTLINED_FUNCTION_1_6();
}

uint64_t sub_23A768980(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x23B856A18](&protocol conformance descriptor for Default<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23A7689AC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23A7689B4()
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

void **sub_23A768A34(void **a1, void **a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  char *v9;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  char *v17;
  _QWORD *v18;
  _QWORD *v19;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64) + 7;
  v8 = *(_DWORD *)(v5 + 80) & 0x100000;
  v9 = (char *)*a2;
  *a1 = *a2;
  if (v6 > 7 || v8 != 0 || ((v7 + ((v6 + 24) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    a1 = (void **)&v9[(v6 & 0xF8 ^ 0x1F8) & (v6 + 16)];
    swift_retain();
  }
  else
  {
    v12 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    v13 = (_QWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
    *v12 = *v13;
    v12[1] = v13[1];
    v14 = ((unint64_t)v12 + v6 + 16) & ~v6;
    v15 = ((unint64_t)v13 + v6 + 16) & ~v6;
    v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    v17 = v9;
    swift_bridgeObjectRetain();
    v16(v14, v15, v4);
    v18 = (_QWORD *)((v7 + v14) & 0xFFFFFFFFFFFFFFF8);
    v19 = (_QWORD *)((v7 + v15) & 0xFFFFFFFFFFFFFFF8);
    *v18 = *v19;
    v18[1] = v19[1];
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_23A768B50(id *a1, uint64_t a2)
{
  unint64_t v3;

  v3 = (unint64_t)a1 + 15;

  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))(((v3 & 0xFFFFFFFFFFFFFFF8)
                                                                                            + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)
                                                                                            + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
  return swift_bridgeObjectRelease();
}

void **sub_23A768BC4(void **a1, void **a2, uint64_t a3)
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;

  v4 = *a2;
  *a1 = *a2;
  v5 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_QWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  v5[1] = v6[1];
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = ((unint64_t)v5 + v9 + 16) & ~v9;
  v11 = ((unint64_t)v6 + v9 + 16) & ~v9;
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  v13 = v4;
  swift_bridgeObjectRetain();
  v12(v10, v11, v7);
  v14 = *(_QWORD *)(v8 + 64) + 7;
  v15 = (_QWORD *)((v14 + v10) & 0xFFFFFFFFFFFFFFF8);
  v16 = (_QWORD *)((v14 + v11) & 0xFFFFFFFFFFFFFFF8);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  return a1;
}

void **sub_23A768C8C(void **a1, void **a2, uint64_t a3)
{
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;

  v6 = (unint64_t)a2 + 15;
  v5 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = (unint64_t)a1 + 15;
  v9 = v5;

  v10 = (_QWORD *)(v8 & 0xFFFFFFFFFFFFFFF8);
  *v10 = *(_QWORD *)(v6 & 0xFFFFFFFFFFFFFFF8);
  v10[1] = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v12 = *(unsigned __int8 *)(v11 + 80);
  v13 = (v12 + 16 + (v8 & 0xFFFFFFFFFFFFFFF8)) & ~v12;
  v14 = (v12 + 16 + (v6 & 0xFFFFFFFFFFFFFFF8)) & ~v12;
  (*(void (**)(unint64_t, unint64_t))(v11 + 24))(v13, v14);
  v15 = *(_QWORD *)(v11 + 64) + 7;
  v16 = (_QWORD *)((v15 + v13) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_QWORD *)((v15 + v14) & 0xFFFFFFFFFFFFFFF8);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_23A768D6C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _OWORD *v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = (_OWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v5 = (_OWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v4 = *v5;
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)v4 + v7 + 16) & ~v7;
  v9 = ((unint64_t)v5 + v7 + 16) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(v8, v9);
  *(_OWORD *)((*(_QWORD *)(v6 + 64) + 7 + v8) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v6 + 64) + 7 + v9) & 0xFFFFFFFFFFFFF8);
  return a1;
}

void **sub_23A768E00(void **a1, void **a2, uint64_t a3)
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;

  v5 = (unint64_t)a2 + 15;
  v6 = *a1;
  *a1 = *a2;
  v7 = (unint64_t)a1 + 15;

  v7 &= 0xFFFFFFFFFFFFFFF8;
  v5 &= 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v7 = *(_QWORD *)v5;
  *(_QWORD *)(v7 + 8) = *(_QWORD *)(v5 + 8);
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v9 + 16 + v7) & ~v9;
  v11 = (v9 + 16 + v5) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v10, v11);
  v12 = *(_QWORD *)(v8 + 64) + 7;
  v13 = (_QWORD *)((v12 + v10) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)((v12 + v11) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23A768ECC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v13;
  unint64_t v14;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(unsigned __int8 *)(v5 + 80);
  if (v7 >= a2)
  {
    v13 = (a1 + 15) & 0xFFFFFFFFFFFFFFF8;
    if ((v6 & 0x80000000) != 0)
    {
      return __swift_getEnumTagSinglePayload((v13 + v8 + 16) & ~v8, v6, v4);
    }
    else
    {
      v14 = *(_QWORD *)(v13 + 8);
      if (v14 >= 0xFFFFFFFF)
        LODWORD(v14) = -1;
      return (v14 + 1);
    }
  }
  else
  {
    if (((((*(_QWORD *)(v5 + 64) + ((v8 + 24) & ~v8) + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
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
    return ((uint64_t (*)(void))((char *)&loc_23A768F58 + 4 * byte_23A76BC10[v11]))();
  }
}

void sub_23A768FDC(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(_QWORD *)(v5 + 64)
       + ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
       + 7) & 0xFFFFFFFFFFFFFFF8)
     + 16;
  if (v6 >= a3)
  {
    v10 = 0;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + ((*(unsigned __int8 *)(v5 + 80) + 24) & ~*(unsigned __int8 *)(v5 + 80)) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v8 = a3 - v6 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
  }
  if (a2 > v6)
  {
    if ((_DWORD)v7)
    {
      v11 = ~v6 + a2;
      bzero(a1, v7);
      *a1 = v11;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X12 }
}

uint64_t sub_23A7690DC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t result;

  *(_BYTE *)(v5 + v6) = 0;
  if ((_DWORD)a1)
  {
    v7 = (_QWORD *)((v5 + 15) & 0xFFFFFFFFFFFFFFF8);
    if ((a2 & 0x80000000) != 0)
    {
      return __swift_storeEnumTagSinglePayload(((unint64_t)v7 + v4 + 16) & a4, a1, a2, a3);
    }
    else if ((a1 & 0x80000000) != 0)
    {
      *v7 = a1 ^ 0x80000000;
      v7[1] = 0;
    }
    else
    {
      v7[1] = (a1 - 1);
    }
  }
  return result;
}

uint64_t type metadata accessor for Default(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Default);
}

ValueMetadata *type metadata accessor for Defaults()
{
  return &type metadata for Defaults;
}

id sub_23A769184(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  if (a2)
  {
    v3 = (void *)sub_23A769478();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B8569B8](a1, v6, a5);
}

id OUTLINED_FUNCTION_0_9@<X0>(__int128 *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v2 = *((_QWORD *)a1 + 2);
  v3 = *((_QWORD *)a1 + 3);
  v4 = *((_QWORD *)a1 + 4);
  v5 = *((_QWORD *)a1 + 5);
  v6 = *a1;
  *(_OWORD *)v1 = *a1;
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v3;
  *(_QWORD *)(v1 + 32) = v4;
  *(_QWORD *)(v1 + 40) = v5;
  return (id)v6;
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_2_6@<X0>(__int128 *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v2 = *((_QWORD *)a1 + 2);
  v3 = *((_BYTE *)a1 + 24);
  v4 = *((_QWORD *)a1 + 4);
  v5 = *((_QWORD *)a1 + 5);
  v6 = *a1;
  *(_OWORD *)v1 = *a1;
  *(_QWORD *)(v1 + 16) = v2;
  *(_BYTE *)(v1 + 24) = v3;
  *(_QWORD *)(v1 + 32) = v4;
  *(_QWORD *)(v1 + 40) = v5;
  return (id)v6;
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A769274()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_23A769280()
{
  return MEMORY[0x24BDCB910]();
}

uint64_t sub_23A76928C()
{
  return MEMORY[0x24BDCB918]();
}

uint64_t sub_23A769298()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_23A7692A4()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23A7692B0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23A7692BC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23A7692C8()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23A7692D4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23A7692E0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23A7692EC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23A7692F8()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23A769304()
{
  return MEMORY[0x24BDCE600]();
}

uint64_t sub_23A769310()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23A76931C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23A769328()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_23A769334()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23A769340()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23A76934C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A769358()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_23A769364()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A769370()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23A76937C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A769388()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_23A769394()
{
  return MEMORY[0x24BDB9CC0]();
}

uint64_t sub_23A7693A0()
{
  return MEMORY[0x24BDB9CD0]();
}

uint64_t sub_23A7693AC()
{
  return MEMORY[0x24BDB9D00]();
}

uint64_t sub_23A7693B8()
{
  return MEMORY[0x24BDB9FB0]();
}

uint64_t sub_23A7693C4()
{
  return MEMORY[0x24BDBA0B0]();
}

uint64_t sub_23A7693D0()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_23A7693DC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23A7693E8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23A7693F4()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_23A769400()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23A76940C()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_23A769418()
{
  return MEMORY[0x24BEE5588]();
}

uint64_t sub_23A769424()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_23A769430()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_23A76943C()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_23A769448()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_23A769454()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23A769460()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_23A76946C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23A769478()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A769484()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_23A769490()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23A76949C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A7694A8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23A7694B4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A7694C0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A7694CC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A7694D8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23A7694E4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23A7694F0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23A7694FC()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23A769508()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23A769514()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23A769520()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23A76952C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23A769538()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_23A769544()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23A769550()
{
  return MEMORY[0x24BEE6970]();
}

uint64_t sub_23A76955C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23A769568()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23A769574()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_23A769580()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_23A76958C()
{
  return MEMORY[0x24BEE6D30]();
}

uint64_t sub_23A769598()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_23A7695A4()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23A7695B0()
{
  return MEMORY[0x24BDCFCD0]();
}

uint64_t sub_23A7695BC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23A7695C8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23A7695D4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23A7695E0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23A7695EC()
{
  return MEMORY[0x24BDCFF70]();
}

uint64_t sub_23A7695F8()
{
  return MEMORY[0x24BDCFFC8]();
}

uint64_t sub_23A769604()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23A769610()
{
  return MEMORY[0x24BEE5718]();
}

uint64_t sub_23A76961C()
{
  return MEMORY[0x24BEE5728]();
}

uint64_t sub_23A769628()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23A769634()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_23A769640()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23A76964C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23A769658()
{
  return MEMORY[0x24BEE57C0]();
}

uint64_t sub_23A769664()
{
  return MEMORY[0x24BEE5828]();
}

uint64_t sub_23A769670()
{
  return MEMORY[0x24BEE58B0]();
}

uint64_t sub_23A76967C()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_23A769688()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_23A769694()
{
  return MEMORY[0x24BEE58E8]();
}

uint64_t sub_23A7696A0()
{
  return MEMORY[0x24BEE5960]();
}

uint64_t sub_23A7696AC()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_23A7696B8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23A7696C4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23A7696D0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A7696DC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A7696E8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A7696F4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23A769700()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23A76970C()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_23A769718()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23A769724()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A769730()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A76973C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23A769748()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23A769754()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A769760()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23A76976C()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_23A769778()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_23A769784()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A769790()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23A76979C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23A7697A8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A7697B4()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23A7697C0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A7697CC()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_23A7697D8()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_23A7697E4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A7697F0()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23A7697FC()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_23A769808()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A769814()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23A769820()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A76982C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23A769838()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A769844()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A769850()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A76985C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A769868()
{
  return MEMORY[0x24BEE4328]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
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


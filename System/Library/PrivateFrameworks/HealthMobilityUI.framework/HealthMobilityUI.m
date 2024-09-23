uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

id WalkingSteadinessOnboardingAnalyticsManager.__allocating_init(healthStore:detailsProvider:presentation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  char *v9;
  char *v10;
  objc_super v12;

  v9 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v9[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_healthStore] = a1;
  v10 = &v9[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_presentation];
  *(_QWORD *)v10 = a3;
  *((_QWORD *)v10 + 1) = a4;
  *(_QWORD *)&v9[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_detailsProvider] = a2;
  v12.receiver = v9;
  v12.super_class = v4;
  return objc_msgSendSuper2(&v12, sel_init);
}

id WalkingSteadinessOnboardingAnalyticsManager.init(healthStore:detailsProvider:presentation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  char *v5;
  objc_super v7;

  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_healthStore] = a1;
  v5 = &v4[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_presentation];
  *(_QWORD *)v5 = a3;
  *((_QWORD *)v5 + 1) = a4;
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_detailsProvider] = a2;
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingAnalyticsManager();
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingAnalyticsManager()
{
  return objc_opt_self();
}

void sub_1D77C2704(char *a1, uint64_t *a2, char a3)
{
  char *v3;
  char v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  objc_class *v15;
  _BYTE *v16;
  _QWORD *v17;
  char *v18;
  char *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t ObjectType;
  _QWORD aBlock[6];
  objc_super v28;

  ObjectType = swift_getObjectType();
  v6 = *a1;
  v7 = *a2;
  v8 = *(void **)&v3[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_healthStore];
  v9 = *((_BYTE *)a2 + 8);
  v11 = *(_QWORD *)&v3[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_presentation];
  v10 = *(_QWORD *)&v3[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_presentation + 8];
  v12 = *(_QWORD *)&v3[OBJC_IVAR____TtC16HealthMobilityUI43WalkingSteadinessOnboardingAnalyticsManager_detailsProvider];
  v13 = *(_QWORD *)(v12 + 88);
  v14 = *(_BYTE *)(v12 + 96);
  v15 = (objc_class *)type metadata accessor for WalkingSteadinessAnalyticsOnboardingEventDataSource();
  v16 = objc_allocWithZone(v15);
  *(_QWORD *)&v16[OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_healthStore] = v8;
  v17 = &v16[OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_presentation];
  *v17 = v11;
  v17[1] = v10;
  v16[OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep] = v6;
  v18 = &v16[OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_changedDetailItems];
  *(_QWORD *)v18 = v7;
  v18[8] = v9;
  v19 = &v16[OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_defaultDetailItems];
  *(_QWORD *)v19 = v13;
  v19[8] = v14;
  v16[OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_acceptDefaults] = a3;
  v28.receiver = v16;
  v28.super_class = v15;
  v20 = v8;
  swift_bridgeObjectRetain();
  v21 = objc_msgSendSuper2(&v28, sel_init);
  v22 = swift_allocObject();
  *(_BYTE *)(v22 + 16) = v6;
  *(_QWORD *)(v22 + 24) = ObjectType;
  aBlock[4] = sub_1D77C2C84;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D77C2C90;
  aBlock[3] = &block_descriptor;
  v23 = _Block_copy(aBlock);
  v24 = v21;
  swift_release();
  objc_msgSend(v3, sel_submitOnboardingEventWithDataSource_resultHandler_, v24, v23);
  _Block_release(v23);

}

void sub_1D77C28E8(void *a1, char a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, char a12)
{
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;

  if (objc_msgSend(a1, sel_status) == (id)1)
  {
    if (qword_1F012EBF8 != -1)
      swift_once();
    v14 = sub_1D77F486C();
    __swift_project_value_buffer(v14, (uint64_t)qword_1F012F710);
    v20 = a1;
    v15 = sub_1D77F4854();
    v16 = sub_1D77F4BB4();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v21 = swift_slowAlloc();
      *(_DWORD *)v17 = 136446979;
      v18 = sub_1D77F4E78();
      sub_1D77C3A1C(v18, v19, &v21);
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2082;
      sub_1D77C3A1C(0xD000000000000041, 0x80000001D77F7F80, &v21);
      sub_1D77F4D04();
      *(_WORD *)(v17 + 22) = 2081;
      __asm { BR              X10 }
    }

  }
}

uint64_t sub_1D77C2C74()
{
  return swift_deallocObject();
}

void sub_1D77C2C84(void *a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, char a12)
{
  uint64_t v12;

  sub_1D77C28E8(a1, *(_BYTE *)(v12 + 16), *(_QWORD *)(v12 + 24), a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

void sub_1D77C2C90(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

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

id WalkingSteadinessOnboardingAnalyticsManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void WalkingSteadinessOnboardingAnalyticsManager.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WalkingSteadinessOnboardingAnalyticsManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingAnalyticsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for WalkingSteadinessOnboardingAnalyticsManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingAnalyticsManager.__allocating_init(healthStore:detailsProvider:presentation:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingAnalyticsManager.submitOnboardingEvent(forStep:changedDetailItems:acceptDefaults:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

void type metadata accessor for HKAppleWalkingSteadinessClassification(uint64_t a1)
{
  sub_1D77C3458(a1, &qword_1F012ED78);
}

void type metadata accessor for HKError(uint64_t a1)
{
  sub_1D77C3458(a1, &qword_1F012ED80);
}

uint64_t sub_1D77C2E44()
{
  sub_1D77C31B8(&qword_1F012ED98, (uint64_t (*)(uint64_t))type metadata accessor for HKError, (uint64_t)&unk_1D77F5A6C);
  return sub_1D77F4E18();
}

uint64_t sub_1D77C2E84()
{
  sub_1D77C31B8(&qword_1F012ED98, (uint64_t (*)(uint64_t))type metadata accessor for HKError, (uint64_t)&unk_1D77F5A6C);
  return sub_1D77F4E0C();
}

uint64_t sub_1D77C2EC8()
{
  sub_1D77C31B8((unint64_t *)&qword_1F012EDD0, (uint64_t (*)(uint64_t))type metadata accessor for HKError, (uint64_t)&unk_1D77F5AB0);
  return sub_1D77F4404();
}

id sub_1D77C2F08()
{
  id *v0;

  return *v0;
}

uint64_t sub_1D77C2F10@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1D77C2F18()
{
  return sub_1D77F4AE8();
}

uint64_t sub_1D77C2F28()
{
  sub_1D77C31B8((unint64_t *)&qword_1F012EDD0, (uint64_t (*)(uint64_t))type metadata accessor for HKError, (uint64_t)&unk_1D77F5AB0);
  return sub_1D77F4440();
}

uint64_t sub_1D77C2F68()
{
  sub_1D77C31B8((unint64_t *)&qword_1F012EDD0, (uint64_t (*)(uint64_t))type metadata accessor for HKError, (uint64_t)&unk_1D77F5AB0);
  return sub_1D77F441C();
}

uint64_t sub_1D77C2FA8(void *a1)
{
  id v2;

  sub_1D77C31B8((unint64_t *)&qword_1F012EDD0, (uint64_t (*)(uint64_t))type metadata accessor for HKError, (uint64_t)&unk_1D77F5AB0);
  v2 = a1;
  return sub_1D77F4410();
}

uint64_t sub_1D77C300C()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = sub_1D77F4CEC();

  return v2;
}

uint64_t sub_1D77C3040()
{
  sub_1D77C31B8((unint64_t *)&qword_1F012EDD0, (uint64_t (*)(uint64_t))type metadata accessor for HKError, (uint64_t)&unk_1D77F5AB0);
  return sub_1D77F4434();
}

uint64_t sub_1D77C3090()
{
  sub_1D77F4E3C();
  sub_1D77F4AB8();
  return sub_1D77F4E54();
}

_QWORD *sub_1D77C30EC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1D77C30FC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1D77C3108()
{
  sub_1D77C31B8((unint64_t *)&qword_1F012EDD0, (uint64_t (*)(uint64_t))type metadata accessor for HKError, (uint64_t)&unk_1D77F5AB0);
  return sub_1D77F4428();
}

uint64_t sub_1D77C3160()
{
  return sub_1D77C31B8(&qword_1F012ED88, (uint64_t (*)(uint64_t))type metadata accessor for HKError, (uint64_t)&unk_1D77F5984);
}

uint64_t sub_1D77C318C()
{
  return sub_1D77C31B8(&qword_1F012ED90, (uint64_t (*)(uint64_t))type metadata accessor for HKError, (uint64_t)&unk_1D77F59B0);
}

uint64_t sub_1D77C31B8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1D829C838](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D77C31F8()
{
  return sub_1D77C31B8(&qword_1F012ED98, (uint64_t (*)(uint64_t))type metadata accessor for HKError, (uint64_t)&unk_1D77F5A6C);
}

uint64_t sub_1D77C3224()
{
  return sub_1D77C31B8(&qword_1F012EDA0, (uint64_t (*)(uint64_t))type metadata accessor for HKError, (uint64_t)&unk_1D77F5A38);
}

uint64_t sub_1D77C3250()
{
  return sub_1D77C31B8(&qword_1F012EDA8, (uint64_t (*)(uint64_t))type metadata accessor for HKError, (uint64_t)&unk_1D77F59F4);
}

uint64_t sub_1D77C327C()
{
  return sub_1D77C31B8(&qword_1F012EDB0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1D77F5B58);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_1D77C3458(a1, &qword_1F012EDF0);
}

uint64_t sub_1D77C32BC()
{
  return sub_1D77C31B8(&qword_1F012EDB8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1D77F5B1C);
}

unint64_t sub_1D77C32EC()
{
  unint64_t result;

  result = qword_1F012EDC0;
  if (!qword_1F012EDC0)
  {
    result = MEMORY[0x1D829C838](MEMORY[0x1E0DEB470], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&qword_1F012EDC0);
  }
  return result;
}

uint64_t sub_1D77C3330()
{
  return sub_1D77C31B8(&qword_1F012EDC8, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1D77F5B94);
}

uint64_t sub_1D77C335C()
{
  return sub_1D77C31B8((unint64_t *)&qword_1F012EDD0, (uint64_t (*)(uint64_t))type metadata accessor for HKError, (uint64_t)&unk_1D77F5AB0);
}

BOOL sub_1D77C3388(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_1D77C339C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012EDD8)
  {
    sub_1D77C33F0();
    v0 = sub_1D77F4CF8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012EDD8);
  }
}

unint64_t sub_1D77C33F0()
{
  unint64_t result;

  result = qword_1F012EDE0;
  if (!qword_1F012EDE0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012EDE0);
  }
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_1D77C3458(a1, &qword_1F012EDE8);
}

void sub_1D77C3458(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1D77C349C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1D77F486C();
  __swift_allocate_value_buffer(v0, qword_1F012EDF8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012EDF8);
  if (qword_1F012EBF0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F6F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

_QWORD *WalkingSteadinessOnboardingViewControllerFactory.__allocating_init(healthStore:healthExperienceStore:pinnedContentManager:detailsProvider:model:)(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;

  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a1;
  sub_1D77C35F4(a2, (uint64_t)(v10 + 3));
  sub_1D77C35F4(a3, (uint64_t)(v10 + 10));
  v10[8] = a4;
  v10[9] = a5;
  return v10;
}

_QWORD *WalkingSteadinessOnboardingViewControllerFactory.init(healthStore:healthExperienceStore:pinnedContentManager:detailsProvider:model:)(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a1;
  sub_1D77C35F4(a2, (uint64_t)(v5 + 3));
  sub_1D77C35F4(a3, (uint64_t)(v5 + 10));
  v5[8] = a4;
  v5[9] = a5;
  return v5;
}

uint64_t sub_1D77C35F4(__int128 *a1, uint64_t a2)
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

void sub_1D77C360C(uint64_t a1)
{
  __asm { BR              X10 }
}

id sub_1D77C364C()
{
  id v0;

  v0 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessOnboardingStartViewController());
  return WalkingSteadinessOnboardingStartViewController.init()();
}

uint64_t WalkingSteadinessOnboardingViewControllerFactory.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 24);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 80);
  return v0;
}

uint64_t WalkingSteadinessOnboardingViewControllerFactory.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 24);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 80);
  return swift_deallocClassInstance();
}

uint64_t sub_1D77C3A1C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1D77C3AEC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1D77C4498((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1D77C4498((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1D77C3AEC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1D77F4D10();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1D77C3CA4(a5, a6);
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
  v8 = sub_1D77F4D7C();
  if (!v8)
  {
    sub_1D77F4D94();
    __break(1u);
LABEL_17:
    result = sub_1D77F4DD0();
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

uint64_t sub_1D77C3CA4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1D77C3D38(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1D77C3F0C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1D77C3F0C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1D77C3D38(uint64_t a1, unint64_t a2)
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
      v3 = sub_1D77C3EAC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1D77F4D58();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1D77F4D94();
      __break(1u);
LABEL_10:
      v2 = sub_1D77F4B3C();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1D77F4DD0();
    __break(1u);
LABEL_14:
    result = sub_1D77F4D94();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1D77C3EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  sub_1D77C44D4();
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1D77C3F0C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1D77C44D4();
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1D77F4DD0();
  __break(1u);
  return result;
}

char *sub_1D77C4054(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  double v17;
  __int128 v19[2];
  _QWORD v20[5];

  v20[3] = type metadata accessor for ConfirmDetailsValueFormatterImpl();
  v20[4] = &protocol witness table for ConfirmDetailsValueFormatterImpl;
  a3[qword_1F012EEE0] = 1;
  v20[0] = a2;
  *(_QWORD *)&a3[qword_1F012EEE8 + 8] = 0;
  swift_unknownObjectWeakInit();
  v6 = &a3[qword_1F012EEF0];
  *v6 = 0xD00000000000002DLL;
  v6[1] = 0x80000001D77F80A0;
  *(_QWORD *)&a3[qword_1F012EEF8] = 0;
  sub_1D77C4434((uint64_t)v20, (uint64_t)v19);
  type metadata accessor for ConfirmDetailsModel();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 24) = 0;
  swift_unknownObjectWeakInit();
  v8 = v7 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  v9 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(_BYTE *)(v7 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker) = 3;
  sub_1D77C35F4(v19, v7 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter);
  type metadata accessor for ConfirmDetailsDataSource();
  swift_allocObject();
  v10 = a3;
  swift_retain();
  swift_retain();
  *(_QWORD *)&v10[qword_1F012EF00] = ConfirmDetailsDataSource.init(detailsProvider:model:)(a1, v7);

  if (qword_1F012EBC8 != -1)
    swift_once();
  v11 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v12 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  swift_retain();
  v13 = (char *)sub_1D77F4728();
  v14 = *(_QWORD *)&v13[qword_1F012EF00] + qword_1F0130048;
  swift_beginAccess();
  *(_QWORD *)(v14 + 8) = &protocol witness table for WalkingSteadinessOnboardingConfirmDetailsViewController;
  swift_unknownObjectWeakAssign();
  v15 = v13;
  v16 = objc_msgSend(v15, sel_headerView, 0xE000000000000001);
  LODWORD(v17) = 1036831949;
  objc_msgSend(v16, sel_setTitleHyphenationFactor_, v17);
  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  return v15;
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingViewControllerFactory()
{
  return objc_opt_self();
}

uint64_t method lookup function for WalkingSteadinessOnboardingViewControllerFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerFactory.__allocating_init(healthStore:healthExperienceStore:pinnedContentManager:detailsProvider:model:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerFactory.makeOnboardingViewController(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t sub_1D77C4434(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_1D77C4498(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1D77C44D4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012EED8)
  {
    v0 = sub_1D77F4DF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012EED8);
  }
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

char *WalkingSteadinessOnboardingConfirmDetailsViewController.__allocating_init(detailsProvider:valueFormatter:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;

  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = __swift_mutable_project_boxed_opaque_existential_1(a2, v5);
  v8 = sub_1D77C5198(a1, v7, v2, v5, v6);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v8;
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

void WalkingSteadinessOnboardingConfirmDetailsViewController.stage.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + qword_1F012EEE0);
}

uint64_t sub_1D77C4610()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + qword_1F012EEE8;
  swift_beginAccess();
  return MEMORY[0x1D829C934](v1);
}

uint64_t sub_1D77C465C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + qword_1F012EEE8;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_1D77C46C4(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = qword_1F012EEE8;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x1D829C934](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1D77C4738;
}

char *WalkingSteadinessOnboardingConfirmDetailsViewController.init(detailsProvider:valueFormatter:)(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = __swift_mutable_project_boxed_opaque_existential_1(a2, v5);
  MEMORY[0x1E0C80A78](v7, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  v11 = sub_1D77C4E00(a1, (uint64_t)v9, v2, v5, v6);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v11;
}

void sub_1D77C47E8()
{
  char *v0;
  char *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t (*v7)(void);
  id v8;
  void *v9;
  objc_super v10;

  v1 = v0;
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingConfirmDetailsViewController();
  objc_msgSendSuper2(&v10, sel_viewDidLoad);
  v2 = (void *)sub_1D77F4ADC();
  v3 = objc_msgSend(v1, sel_addNextButtonWithBaseIdentifier_, v2);

  v4 = qword_1F012EEF8;
  v5 = *(void **)&v1[qword_1F012EEF8];
  *(_QWORD *)&v1[qword_1F012EEF8] = v3;

  v6 = *(void **)&v1[v4];
  if (v6)
  {
    v7 = *(uint64_t (**)(void))(**(_QWORD **)(*(_QWORD *)&v1[qword_1F012EF00] + qword_1F0130050) + 112);
    v8 = v6;
    objc_msgSend(v8, sel_setEnabled_, v7() & 1);

  }
  v9 = (void *)sub_1D77F4ADC();

}

void sub_1D77C4910(void *a1)
{
  id v1;

  v1 = a1;
  sub_1D77C47E8();

}

uint64_t sub_1D77C4944(char *a1)
{
  char *v2;
  uint64_t result;
  uint64_t v4;
  void (*v5)(void);
  char *v6;

  v2 = &a1[qword_1F012EEE8];
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v2);
  if (result)
  {
    v4 = *((_QWORD *)v2 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 8);
    v6 = a1;
    v5();

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1D77C49E0(char *a1)
{
  char *v2;
  uint64_t result;
  uint64_t v4;
  void (*v5)(void);
  char *v6;

  v2 = &a1[qword_1F012EEE8];
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v2);
  if (result)
  {
    v4 = *((_QWORD *)v2 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 24);
    v6 = a1;
    v5();

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1D77C4A7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(v1 + qword_1F012EF00) + qword_1F0130050)
     + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  return sub_1D77C5280(v3, a1);
}

void sub_1D77C4AE8(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t (*v3)(void);
  id v4;

  v2 = *(void **)(v1 + qword_1F012EEF8);
  if (v2)
  {
    v3 = *(uint64_t (**)(void))(**(_QWORD **)(a1 + qword_1F0130050) + 112);
    v4 = v2;
    objc_msgSend(v4, sel_setEnabled_, v3() & 1);

  }
}

void sub_1D77C4B64(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;

  v4 = a1;
  v1 = objc_msgSend(v4, sel_presentedViewController);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v3 = v2;
  }
  else
  {
    v3 = v4;
  }

}

void WalkingSteadinessOnboardingConfirmDetailsViewController.__allocating_init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void WalkingSteadinessOnboardingConfirmDetailsViewController.init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1D77C4C28()
{
  uint64_t v0;

  sub_1D77C564C(v0 + qword_1F012EEE8);
  swift_bridgeObjectRelease();

  return swift_release();
}

id WalkingSteadinessOnboardingConfirmDetailsViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingConfirmDetailsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D77C4CAC(uint64_t a1)
{
  sub_1D77C564C(a1 + qword_1F012EEE8);
  swift_bridgeObjectRelease();

  return swift_release();
}

void sub_1D77C4D08(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + qword_1F012EEE0);
}

void sub_1D77C4D1C(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48) + 8) = *(_QWORD *)(*(_QWORD *)a1 + 32);
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

uint64_t sub_1D77C4D90@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(*v1 + qword_1F012EF00) + qword_1F0130050)
     + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  return sub_1D77C5280(v3, a1);
}

char *sub_1D77C4E00(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  char *v17;
  uint64_t v18;
  char *v19;
  id v20;
  double v21;
  __int128 v23[2];
  uint64_t v24[5];

  v24[3] = a4;
  v24[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v24);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  a3[qword_1F012EEE0] = 1;
  *(_QWORD *)&a3[qword_1F012EEE8 + 8] = 0;
  swift_unknownObjectWeakInit();
  v10 = &a3[qword_1F012EEF0];
  *v10 = 0xD00000000000002DLL;
  v10[1] = 0x80000001D77F80A0;
  *(_QWORD *)&a3[qword_1F012EEF8] = 0;
  sub_1D77C4434((uint64_t)v24, (uint64_t)v23);
  type metadata accessor for ConfirmDetailsModel();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 24) = 0;
  swift_unknownObjectWeakInit();
  v12 = v11 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  v13 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  *(_BYTE *)(v11 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker) = 3;
  sub_1D77C35F4(v23, v11 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter);
  type metadata accessor for ConfirmDetailsDataSource();
  swift_allocObject();
  v14 = a3;
  swift_retain();
  swift_retain();
  *(_QWORD *)&v14[qword_1F012EF00] = ConfirmDetailsDataSource.init(detailsProvider:model:)(a1, v11);

  if (qword_1F012EBC8 != -1)
    swift_once();
  v15 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v16 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  swift_retain();
  v17 = (char *)sub_1D77F4728();
  v18 = *(_QWORD *)&v17[qword_1F012EF00] + qword_1F0130048;
  swift_beginAccess();
  *(_QWORD *)(v18 + 8) = &protocol witness table for WalkingSteadinessOnboardingConfirmDetailsViewController;
  swift_unknownObjectWeakAssign();
  v19 = v17;
  v20 = objc_msgSend(v19, sel_headerView, 0xE000000000000001);
  LODWORD(v21) = 1036831949;
  objc_msgSend(v20, sel_setTitleHyphenationFactor_, v21);
  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  return v19;
}

char *sub_1D77C5198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _BYTE *v12;
  uint64_t v14;

  v9 = *(_QWORD *)(a4 - 8);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessOnboardingConfirmDetailsViewController());
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, a4);
  return sub_1D77C4E00(a1, (uint64_t)v11, v12, a4, a5);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingConfirmDetailsViewController()
{
  uint64_t result;

  result = qword_1F012EF10;
  if (!qword_1F012EF10)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D77C5280(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77C52C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1D77C52C4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012EF08)
  {
    type metadata accessor for ConfirmDetailsProvider.Details();
    v0 = sub_1D77F4CF8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012EF08);
  }
}

void sub_1D77C5318()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v1 = v0;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), sel_initWithBarButtonSystemItem_target_action_, 0, v0, sel_dismissPresentedViewController);
  v3 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsViewController());
  v4 = WalkingSteadinessOnboardingAboutHealthDetailsViewController.init()();
  v5 = objc_msgSend(v4, sel_navigationItem);
  objc_msgSend(v5, sel_setRightBarButtonItem_, v2);

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D2F7B8]), sel_initWithRootViewController_, v4);
  objc_msgSend(v1, sel_presentViewController_animated_completion_, v6, 1, 0);

}

uint64_t sub_1D77C5400@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + qword_1F012EEE8;
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1D77C5458(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + qword_1F012EEE8;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingChangedHealthDetailProviding.details.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1D77C54C0()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for WalkingSteadinessOnboardingConfirmDetailsViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingConfirmDetailsViewController.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingConfirmDetailsViewController
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 40))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingConfirmDetailsViewController.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingConfirmDetailsViewController
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 48))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingConfirmDetailsViewController.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingConfirmDetailsViewController
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 56))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingConfirmDetailsViewController.__allocating_init(detailsProvider:valueFormatter:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingConfirmDetailsViewController
                              + v0
                              + 88))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingConfirmDetailsViewController.details.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingConfirmDetailsViewController
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 96))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingConfirmDetailsViewController.detailsDataSourceDidUpdate(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingConfirmDetailsViewController
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 104))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingConfirmDetailsViewController.detailsDataSourceDidTapLearnMore(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingConfirmDetailsViewController
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 112))();
}

uint64_t sub_1D77C5644()
{
  return type metadata accessor for WalkingSteadinessOnboardingConfirmDetailsViewController();
}

uint64_t sub_1D77C564C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
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

uint64_t MultiselectItem.reuseIdentifier.getter()
{
  type metadata accessor for MultiselectTableViewCell();
  sub_1D77C56E0();
  return sub_1D77F4698();
}

unint64_t sub_1D77C56E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F012EF60;
  if (!qword_1F012EF60)
  {
    v1 = type metadata accessor for MultiselectTableViewCell();
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for MultiselectTableViewCell, v1);
    atomic_store(result, (unint64_t *)&qword_1F012EF60);
  }
  return result;
}

uint64_t MultiselectItem.uniqueIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MultiselectItem.uniqueIdentifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MultiselectItem.uniqueIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t MultiselectItem.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MultiselectItem.subtitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MultiselectItem.state.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 48);
}

void __swiftcall MultiselectItem.init(title:subtitle:state:identifier:)(HealthMobilityUI::MultiselectItem *__return_ptr retstr, Swift::String title, Swift::String subtitle, Swift::Bool state, Swift::String identifier)
{
  void *object;
  uint64_t countAndFlagsBits;
  void *v8;
  uint64_t v9;

  object = subtitle._object;
  countAndFlagsBits = subtitle._countAndFlagsBits;
  v8 = title._object;
  v9 = title._countAndFlagsBits;
  swift_bridgeObjectRetain();
  sub_1D77F4B24();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  retstr->uniqueIdentifier = identifier;
  retstr->title._countAndFlagsBits = v9;
  retstr->title._object = v8;
  retstr->subtitle._countAndFlagsBits = countAndFlagsBits;
  retstr->subtitle._object = object;
  retstr->state = state;
}

uint64_t sub_1D77C58D0()
{
  type metadata accessor for MultiselectTableViewCell();
  sub_1D77C56E0();
  return sub_1D77F4698();
}

uint64_t sub_1D77C5904()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t initializeBufferWithCopyOfBuffer for MultiselectItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MultiselectItem()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MultiselectItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MultiselectItem(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for MultiselectItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for MultiselectItem(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MultiselectItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
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
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MultiselectItem()
{
  return &type metadata for MultiselectItem;
}

uint64_t sub_1D77C5BA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1D77F486C();
  __swift_allocate_value_buffer(v0, qword_1F012EF70);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012EF70);
  if (qword_1F012EBF0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F6F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

id WalkingSteadinessOnboardingCoordinator.__allocating_init(rootViewController:model:factory:analyticsManager:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  objc_class *v5;
  char *v10;
  id v11;
  id v12;
  objc_super v14;

  v10 = (char *)objc_allocWithZone(v5);
  *(_QWORD *)&v10[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController + 8] = 0;
  *(_QWORD *)(swift_unknownObjectWeakInit() + 8) = a2;
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v10[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model] = a3;
  *(_QWORD *)&v10[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_factory] = a4;
  *(_QWORD *)&v10[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_analyticsManager] = a5;
  v14.receiver = v10;
  v14.super_class = v5;
  swift_retain();
  swift_retain();
  v11 = a5;
  v12 = objc_msgSendSuper2(&v14, sel_init);
  sub_1D77C5E70();

  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return v12;
}

id WalkingSteadinessOnboardingCoordinator.init(rootViewController:model:factory:analyticsManager:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  char *v5;
  id v9;
  id v10;
  objc_super v12;

  *(_QWORD *)&v5[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController + 8] = 0;
  *(_QWORD *)(swift_unknownObjectWeakInit() + 8) = a2;
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v5[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model] = a3;
  *(_QWORD *)&v5[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_factory] = a4;
  *(_QWORD *)&v5[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_analyticsManager] = a5;
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingCoordinator();
  swift_retain();
  swift_retain();
  v9 = a5;
  v10 = objc_msgSendSuper2(&v12, sel_init);
  sub_1D77C5E70();

  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return v10;
}

void sub_1D77C5E70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t v6;
  void (*v7)(uint64_t, _QWORD, uint64_t, uint64_t);
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model);
  v15 = 5;
  (*(void (**)(uint64_t *__return_ptr, char *))(*(_QWORD *)v2 + 224))(&v16, &v15);
  if (v16 == 5)
  {
    sub_1D77F4DA0();
    __break(1u);
  }
  else
  {
    v14 = v16;
    v12 = sub_1D77C61B4(&v14);
    v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController;
    if (MEMORY[0x1D829C934](v1 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController))
    {
      v4 = *(_QWORD *)(v3 + 8);
      ObjectType = swift_getObjectType();
      sub_1D77CA958(0, (unint64_t *)&qword_1F012F050, MEMORY[0x1E0DEE9B0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
      v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_1D77F5E10;
      *(_QWORD *)(v6 + 32) = v12;
      v13 = v6;
      sub_1D77F4B54();
      v7 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v4 + 24);
      v8 = v12;
      v7(v13, 0, ObjectType, v4);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    if (MEMORY[0x1D829C934](v3))
    {
      v9 = *(_QWORD *)(v3 + 8);
      v10 = swift_getObjectType();
      v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v9);
      swift_unknownObjectRelease();
      if (v11)
      {
        objc_msgSend(v11, sel_setDelegate_, v1);

      }
    }

  }
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingCoordinator()
{
  return objc_opt_self();
}

void sub_1D77C605C(_BYTE *a1, unsigned __int8 *a2, char a3)
{
  uint64_t v3;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  _QWORD *(*v11)(uint64_t *__return_ptr, uint64_t);
  _QWORD *v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  char v18;
  _OWORD v19[2];

  v5 = *a2;
  LOBYTE(v19[0]) = *a1;
  v6 = sub_1D77C61B4((char *)v19);
  v7 = v3 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController;
  v8 = MEMORY[0x1D829C934](v3 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController);
  if (v8)
  {
    v9 = *(_QWORD *)(v7 + 8);
    ObjectType = swift_getObjectType();
    memset(v19, 0, sizeof(v19));
    (*(void (**)(void *, _OWORD *, uint64_t, uint64_t))(v9 + 32))(v6, v19, ObjectType, v9);
    swift_unknownObjectRelease();
    v8 = sub_1D77CA770((uint64_t)v19, (uint64_t)&unk_1F012F048, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1D77CA958);
  }
  v18 = v5;
  v11 = *(_QWORD *(**)(uint64_t *__return_ptr, uint64_t))(**(_QWORD **)(v3
                                                                               + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model)
                                                                 + 184);
  v12 = v11((uint64_t *)v19, v8);
  v16 = *(_QWORD *)&v19[0];
  v17 = BYTE8(v19[0]);
  if (v5 == 3)
  {
    v13 = (a3 & 1) == 0;
  }
  else if (v5 == 1)
  {
    v11(&v14, (uint64_t)v12);
    v13 = v15 | (v14 == 0);
  }
  else
  {
    v13 = 1;
  }
  sub_1D77C2704(&v18, &v16, v13 & 1);

}

void *sub_1D77C61B4(char *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  id v7;
  id v8;
  void *v9;
  void (*v10)(uint64_t, _UNKNOWN **, uint64_t, uint64_t);
  uint64_t v11;
  char v13;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_factory);
  v13 = *a1;
  v3 = (void *)(*(uint64_t (**)(char *))(*(_QWORD *)v2 + 128))(&v13);
  v5 = v4;
  ObjectType = swift_getObjectType();
  v7 = objc_msgSend(v3, sel_navigationItem);
  if (qword_1F012EBC8 != -1)
    swift_once();
  v8 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v9 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setBackButtonTitle_, v9, 0xE000000000000000);

  v10 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v5 + 24);
  v11 = swift_unknownObjectRetain();
  v10(v11, &protocol witness table for WalkingSteadinessOnboardingCoordinator, ObjectType, v5);
  return v3;
}

uint64_t sub_1D77C6344(void *a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t ObjectType;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t *, id, uint64_t, uint64_t, uint64_t (*)(), uint64_t);
  id v26;
  char *v27;
  uint64_t v29;
  uint64_t v30;

  v3 = v2;
  ObjectType = swift_getObjectType();
  if (qword_1F012EB98 != -1)
    swift_once();
  v7 = sub_1D77F486C();
  __swift_project_value_buffer(v7, (uint64_t)qword_1F012EF70);
  v8 = a1;
  v9 = sub_1D77F4854();
  v10 = sub_1D77F4BCC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v12 = swift_slowAlloc();
    v30 = v12;
    *(_DWORD *)v11 = 136446722;
    v13 = sub_1D77F4E78();
    sub_1D77C3A1C(v13, v14, &v30);
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2082;
    v29 = sub_1D77C3A1C(0xD00000000000002FLL, 0x80000001D77F84A0, &v30);
    sub_1D77F4D04();
    *(_WORD *)(v11 + 22) = 2082;
    v15 = swift_getObjectType();
    v16 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8);
    v16(&v29, v15, a2);
    v17 = sub_1D77F4B00();
    v29 = sub_1D77C3A1C(v17, v18, &v30);
    sub_1D77F4D04();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D77C0000, v9, v10, "[%{public}s.%{public}s]: Primary button tapped for stage: %{public}s", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v12, -1, -1);
    v19 = v11;
    v20 = ObjectType;
    MEMORY[0x1D829C8C8](v19, -1, -1);

  }
  else
  {

    v16 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8);
    v20 = ObjectType;
  }
  v21 = swift_getObjectType();
  v16(&v30, v21, a2);
  v22 = v30;
  v23 = *(_QWORD *)&v3[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model];
  v24 = swift_allocObject();
  *(_BYTE *)(v24 + 16) = v22;
  *(_QWORD *)(v24 + 24) = v3;
  *(_BYTE *)(v24 + 32) = 0;
  *(_QWORD *)(v24 + 40) = v8;
  *(_QWORD *)(v24 + 48) = a2;
  *(_QWORD *)(v24 + 56) = v20;
  v25 = *(void (**)(uint64_t *, id, uint64_t, uint64_t, uint64_t (*)(), uint64_t))(*(_QWORD *)v23
                                                                                                  + 232);
  v26 = v8;
  v27 = v3;
  v25(&v30, v26, a2, 1, sub_1D77CA3D8, v24);
  return swift_release();
}

uint64_t sub_1D77C6640(void *a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t ObjectType;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t *, id, uint64_t, _QWORD, uint64_t (*)(), uint64_t);
  id v26;
  char *v27;
  uint64_t v29;
  uint64_t v30;

  v3 = v2;
  ObjectType = swift_getObjectType();
  if (qword_1F012EB98 != -1)
    swift_once();
  v7 = sub_1D77F486C();
  __swift_project_value_buffer(v7, (uint64_t)qword_1F012EF70);
  v8 = a1;
  v9 = sub_1D77F4854();
  v10 = sub_1D77F4BCC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v12 = swift_slowAlloc();
    v30 = v12;
    *(_DWORD *)v11 = 136446722;
    v13 = sub_1D77F4E78();
    sub_1D77C3A1C(v13, v14, &v30);
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2082;
    v29 = sub_1D77C3A1C(0xD000000000000031, 0x80000001D77F84D0, &v30);
    sub_1D77F4D04();
    *(_WORD *)(v11 + 22) = 2082;
    v15 = swift_getObjectType();
    v16 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8);
    v16(&v29, v15, a2);
    v17 = sub_1D77F4B00();
    v29 = sub_1D77C3A1C(v17, v18, &v30);
    sub_1D77F4D04();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D77C0000, v9, v10, "[%{public}s.%{public}s]: Secondary button tapped for stage: %{public}s", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v12, -1, -1);
    v19 = v11;
    v20 = ObjectType;
    MEMORY[0x1D829C8C8](v19, -1, -1);

  }
  else
  {

    v16 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8);
    v20 = ObjectType;
  }
  v21 = swift_getObjectType();
  v16(&v30, v21, a2);
  v22 = v30;
  v23 = *(_QWORD *)&v3[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model];
  v24 = swift_allocObject();
  *(_BYTE *)(v24 + 16) = v22;
  *(_QWORD *)(v24 + 24) = v3;
  *(_BYTE *)(v24 + 32) = 1;
  *(_QWORD *)(v24 + 40) = v8;
  *(_QWORD *)(v24 + 48) = a2;
  *(_QWORD *)(v24 + 56) = v20;
  v25 = *(void (**)(uint64_t *, id, uint64_t, _QWORD, uint64_t (*)(), uint64_t))(*(_QWORD *)v23 + 232);
  v26 = v8;
  v27 = v3;
  v25(&v30, v26, a2, 0, sub_1D77CA3D8, v24);
  return swift_release();
}

uint64_t sub_1D77C6944(unsigned __int8 *a1, char a2, void *a3, char a4, void *a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void (__cdecl *v26)();
  _BYTE *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  _QWORD *v37;
  void *v38;
  id v39;
  id v40;
  _BYTE *v41;
  uint64_t (*v42)(uint64_t);
  _BOOL8 v44;
  uint64_t v45;
  id v46;
  _BYTE *v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  os_log_type_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t ObjectType;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  os_log_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  id v68;
  _BYTE *v69;
  uint64_t (*v70)(uint64_t);
  _BYTE v71[4];
  int v72;
  os_log_t v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t aBlock;
  uint64_t v83;
  uint64_t (*v84)(uint64_t);
  void *v85;
  void (*v86)();
  _QWORD *v87;

  v80 = a6;
  v11 = sub_1D77F4A34();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v13);
  v15 = &v71[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = sub_1D77F4A58();
  v18 = MEMORY[0x1E0C80A78](v16, v17);
  v21 = *a1;
  if (v21 >> 6)
  {
    v22 = a4 & 1;
    if (v21 >> 6 == 1)
    {
      v23 = swift_allocObject();
      *(_QWORD *)(v23 + 16) = a3;
      *(_QWORD *)(v23 + 24) = a5;
      v24 = v80;
      *(_QWORD *)(v23 + 32) = v80;
      *(_BYTE *)(v23 + 40) = a2;
      *(_BYTE *)(v23 + 41) = v22;
      v25 = a5;
      v26 = (void (__cdecl *)())sub_1D77CA870;
    }
    else
    {
      v23 = swift_allocObject();
      *(_QWORD *)(v23 + 16) = a3;
      *(_BYTE *)(v23 + 24) = a2;
      *(_BYTE *)(v23 + 25) = v22;
      v26 = sub_1D77CA8E0;
      v24 = v80;
    }
    if (a2 == 3)
    {
      v44 = v22 == 0;
      v45 = swift_allocObject();
      *(_QWORD *)(v45 + 16) = v26;
      *(_QWORD *)(v45 + 24) = v23;
      a3;
      sub_1D77CA510((uint64_t)v26);
      sub_1D77C90F0(v44, a5, v24, (uint64_t)sub_1D77CA894, v45);
      sub_1D77CA884((uint64_t)v26);
      return swift_release();
    }
    else
    {
      v46 = a3;
      sub_1D77CA510((uint64_t)v26);
      v26();
      sub_1D77CA884((uint64_t)v26);
      return sub_1D77CA884((uint64_t)v26);
    }
  }
  else
  {
    v76 = &v71[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
    v77 = v20;
    v78 = v12;
    v79 = v18;
    if (a2 == 3 && v21 == 3)
    {
      v27 = v15;
      if (qword_1F012EB98 != -1)
        swift_once();
      v28 = sub_1D77F486C();
      __swift_project_value_buffer(v28, (uint64_t)qword_1F012EF70);
      v29 = sub_1D77F4854();
      v30 = sub_1D77F4BCC();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = swift_slowAlloc();
        v32 = swift_slowAlloc();
        aBlock = v32;
        *(_DWORD *)v31 = 136446466;
        v75 = v31 + 4;
        v33 = sub_1D77F4E78();
        v81 = sub_1D77C3A1C(v33, v34, &aBlock);
        sub_1D77F4D04();
        swift_bridgeObjectRelease();
        *(_WORD *)(v31 + 12) = 2082;
        v81 = sub_1D77C3A1C(0xD000000000000028, 0x80000001D77F89A0, &aBlock);
        sub_1D77F4D04();
        _os_log_impl(&dword_1D77C0000, v29, v30, "[%{public}s.%{public}s]: User previously denied notification authorization, alerting but not proceeding", (uint8_t *)v31, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D829C8C8](v32, -1, -1);
        MEMORY[0x1D829C8C8](v31, -1, -1);
      }

      v35 = v78;
      sub_1D77CA478();
      v36 = (void *)sub_1D77F4C74();
      v37 = (_QWORD *)swift_allocObject();
      v37[2] = a3;
      v37[3] = a5;
      v37[4] = v80;
      v86 = sub_1D77CA820;
      v87 = v37;
      aBlock = MEMORY[0x1E0C809B0];
      v83 = 1107296256;
      v84 = sub_1D77CDEB0;
      v85 = &block_descriptor_57;
      v38 = _Block_copy(&aBlock);
      v39 = a5;
      v40 = a3;
      swift_release();
      v41 = v76;
      sub_1D77F4A4C();
      aBlock = MEMORY[0x1E0DEE9D8];
      v42 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
      sub_1D77C31B8((unint64_t *)&unk_1EDA11FF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      sub_1D77CA580(0, (unint64_t *)&unk_1EDA12000, v42, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
      sub_1D77CA520();
      sub_1D77F4D28();
      MEMORY[0x1D829C244](0, v41, v27, v38);
      _Block_release(v38);

      (*(void (**)(_BYTE *, uint64_t))(v35 + 8))(v27, v11);
      return (*(uint64_t (**)(_BYTE *, uint64_t))(v77 + 8))(v41, v79);
    }
    else
    {
      v47 = v15;
      if (qword_1F012EB98 != -1)
        swift_once();
      v48 = sub_1D77F486C();
      __swift_project_value_buffer(v48, (uint64_t)qword_1F012EF70);
      v49 = a5;
      v50 = sub_1D77F4854();
      v51 = sub_1D77F4BCC();
      v52 = v51;
      if (os_log_type_enabled(v50, v51))
      {
        v53 = swift_slowAlloc();
        v74 = swift_slowAlloc();
        aBlock = v74;
        *(_DWORD *)v53 = 136446978;
        v73 = v50;
        v54 = sub_1D77F4E78();
        v72 = v52;
        v81 = sub_1D77C3A1C(v54, v55, &aBlock);
        v75 = v11;
        sub_1D77F4D04();
        swift_bridgeObjectRelease();
        *(_WORD *)(v53 + 12) = 2082;
        v81 = sub_1D77C3A1C(0xD000000000000028, 0x80000001D77F89A0, &aBlock);
        sub_1D77F4D04();
        *(_WORD *)(v53 + 22) = 2080;
        ObjectType = swift_getObjectType();
        v57 = v80;
        (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v80 + 8))(&v81, ObjectType, v80);
        v58 = sub_1D77F4B00();
        v81 = sub_1D77C3A1C(v58, v59, &aBlock);
        sub_1D77F4D04();

        swift_bridgeObjectRelease();
        *(_WORD *)(v53 + 32) = 2080;
        LOBYTE(v81) = v21;
        v60 = sub_1D77F4B00();
        v81 = sub_1D77C3A1C(v60, v61, &aBlock);
        v11 = v75;
        sub_1D77F4D04();
        swift_bridgeObjectRelease();
        v62 = v73;
        _os_log_impl(&dword_1D77C0000, v73, (os_log_type_t)v72, "[%{public}s.%{public}s]: Unable to proceed to next stage from %s due to reason: %s", (uint8_t *)v53, 0x2Au);
        v63 = v74;
        swift_arrayDestroy();
        MEMORY[0x1D829C8C8](v63, -1, -1);
        MEMORY[0x1D829C8C8](v53, -1, -1);

      }
      else
      {

        v57 = v80;
      }
      sub_1D77CA478();
      v64 = (void *)sub_1D77F4C74();
      v65 = swift_allocObject();
      *(_QWORD *)(v65 + 16) = a3;
      *(_BYTE *)(v65 + 24) = v21;
      *(_QWORD *)(v65 + 32) = v49;
      *(_QWORD *)(v65 + 40) = v57;
      v86 = sub_1D77CA7E4;
      v87 = (_QWORD *)v65;
      aBlock = MEMORY[0x1E0C809B0];
      v83 = 1107296256;
      v84 = sub_1D77CDEB0;
      v85 = &block_descriptor_51;
      v66 = _Block_copy(&aBlock);
      v67 = v49;
      v68 = a3;
      swift_release();
      v69 = v76;
      sub_1D77F4A4C();
      aBlock = MEMORY[0x1E0DEE9D8];
      v70 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
      sub_1D77C31B8((unint64_t *)&unk_1EDA11FF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      sub_1D77CA580(0, (unint64_t *)&unk_1EDA12000, v70, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
      sub_1D77CA520();
      sub_1D77F4D28();
      MEMORY[0x1D829C244](0, v69, v47, v66);
      _Block_release(v66);

      (*(void (**)(_BYTE *, uint64_t))(v78 + 8))(v47, v11);
      return (*(uint64_t (**)(_BYTE *, uint64_t))(v77 + 8))(v69, v79);
    }
  }
}

uint64_t sub_1D77C722C(uint64_t a1, void *a2, uint64_t a3, char a4, char a5)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = a5 & 1;
  v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_BYTE *)(v9 + 24) = a4;
  *(_BYTE *)(v9 + 25) = v7;
  v10 = swift_retain();
  sub_1D77C7A5C(v10, a2, v11, (uint64_t)sub_1D77CA948, v9);
  swift_release();
  return swift_release();
}

void sub_1D77C72D8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4, char a5)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;

  v9 = a3 + 16;
  swift_beginAccess();
  v10 = MEMORY[0x1D829C934](v9);
  if (v10)
  {
    v11 = (void *)v10;
    v12 = a4;
    sub_1D77C7360(&v12, a5 & 1, a1, a2);

  }
}

void sub_1D77C7360(unsigned __int8 *a1, char a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  char *v5;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *(*v30)(uint64_t *__return_ptr);
  _QWORD *v31;
  char v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  char *v49;
  uint64_t (*v50)(uint64_t);
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t aBlock;
  uint64_t v60;
  uint64_t (*v61)(uint64_t);
  void *v62;
  void (*v63)();
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  char v68;
  char v69;

  v5 = v4;
  v53 = a3;
  v54 = a4;
  swift_getObjectType();
  v8 = a2 & 1;
  v9 = sub_1D77F4A34();
  v57 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1D77F4A58();
  v55 = *(_QWORD *)(v13 - 8);
  v56 = v13;
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *a1;
  v18 = *(_QWORD *)&v5[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model];
  LOBYTE(v67) = v17;
  (*(void (**)(uint64_t *__return_ptr, uint64_t *))(*(_QWORD *)v18 + 224))(&aBlock, &v67);
  v19 = aBlock;
  if (aBlock == 5)
  {
    if (qword_1F012EB98 != -1)
      swift_once();
    v20 = sub_1D77F486C();
    __swift_project_value_buffer(v20, (uint64_t)qword_1F012EF70);
    v21 = sub_1D77F4854();
    v22 = sub_1D77F4BCC();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc();
      v24 = swift_slowAlloc();
      v52 = v5;
      v25 = v24;
      aBlock = v24;
      *(_DWORD *)v23 = 136446722;
      v26 = sub_1D77F4E78();
      v67 = sub_1D77C3A1C(v26, v27, &aBlock);
      v58 = v8;
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2082;
      v67 = sub_1D77C3A1C(0xD000000000000035, 0x80000001D77F8930, &aBlock);
      sub_1D77F4D04();
      *(_WORD *)(v23 + 22) = 2080;
      LOBYTE(v67) = v17;
      v28 = sub_1D77F4B00();
      v67 = sub_1D77C3A1C(v28, v29, &aBlock);
      sub_1D77F4D04();
      v8 = v58;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D77C0000, v21, v22, "[%{public}s.%{public}s]: No stage after %s, finishing", (uint8_t *)v23, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v25, -1, -1);
      MEMORY[0x1D829C8C8](v23, -1, -1);
    }

    v69 = v17;
    v30 = *(_QWORD *(**)(uint64_t *__return_ptr))(*(_QWORD *)v18 + 184);
    v31 = v30(&aBlock);
    v67 = aBlock;
    v68 = v60;
    if (v17 == 3)
    {
      v32 = v8 == 0;
    }
    else if (v17 == 1)
    {
      ((void (*)(uint64_t *__return_ptr, _QWORD *))v30)(&v65, v31);
      v32 = v66 | (v65 == 0);
    }
    else
    {
      v32 = 1;
    }
    sub_1D77C2704(&v69, &v67, v32 & 1);
    sub_1D77C99C0(1, 1, v53, v54);
  }
  else
  {
    if (qword_1F012EB98 != -1)
      swift_once();
    v58 = a2 & 1;
    v33 = sub_1D77F486C();
    __swift_project_value_buffer(v33, (uint64_t)qword_1F012EF70);
    v34 = sub_1D77F4854();
    v35 = sub_1D77F4B9C();
    v36 = v35;
    if (os_log_type_enabled(v34, v35))
    {
      v37 = swift_slowAlloc();
      LODWORD(v53) = v36;
      v38 = v37;
      v54 = swift_slowAlloc();
      aBlock = v54;
      *(_DWORD *)v38 = 136446978;
      v39 = sub_1D77F4E78();
      v67 = sub_1D77C3A1C(v39, v40, &aBlock);
      v52 = v5;
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 12) = 2082;
      v67 = sub_1D77C3A1C(0xD000000000000035, 0x80000001D77F8930, &aBlock);
      sub_1D77F4D04();
      *(_WORD *)(v38 + 22) = 2080;
      LOBYTE(v67) = v17;
      v41 = sub_1D77F4B00();
      v67 = sub_1D77C3A1C(v41, v42, &aBlock);
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 32) = 2080;
      LOBYTE(v67) = v19;
      v43 = sub_1D77F4B00();
      v67 = sub_1D77C3A1C(v43, v44, &aBlock);
      v5 = v52;
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D77C0000, v34, (os_log_type_t)v53, "[%{public}s.%{public}s]: Transitioning from %s to %s", (uint8_t *)v38, 0x2Au);
      v45 = v54;
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v45, -1, -1);
      MEMORY[0x1D829C8C8](v38, -1, -1);
    }

    sub_1D77CA478();
    v46 = (void *)sub_1D77F4C74();
    v47 = swift_allocObject();
    *(_QWORD *)(v47 + 16) = v5;
    *(_BYTE *)(v47 + 24) = v19;
    *(_BYTE *)(v47 + 25) = v17;
    *(_BYTE *)(v47 + 26) = v58;
    v63 = sub_1D77CA728;
    v64 = v47;
    aBlock = MEMORY[0x1E0C809B0];
    v60 = 1107296256;
    v61 = sub_1D77CDEB0;
    v62 = &block_descriptor_45;
    v48 = _Block_copy(&aBlock);
    v49 = v5;
    swift_release();
    sub_1D77F4A4C();
    aBlock = MEMORY[0x1E0DEE9D8];
    v50 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
    sub_1D77C31B8((unint64_t *)&unk_1EDA11FF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1D77CA580(0, (unint64_t *)&unk_1EDA12000, v50, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1D77CA520();
    sub_1D77F4D28();
    MEMORY[0x1D829C244](0, v16, v12, v48);
    _Block_release(v48);

    (*(void (**)(char *, uint64_t))(v57 + 8))(v12, v9);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v16, v56);
  }
}

void sub_1D77C7A5C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t aBlock;
  uint64_t v37;
  void (*v38)(uint64_t, void *);
  void *v39;
  uint64_t (*v40)();
  uint64_t v41;

  swift_getObjectType();
  if (qword_1F012EBC8 != -1)
    swift_once();
  v7 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a4;
  *(_QWORD *)(v8 + 24) = a5;
  swift_retain();
  v9 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v40 = sub_1D77CA6AC;
  v41 = v8;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v38 = sub_1D77C2C90;
  v39 = &block_descriptor_33;
  v10 = _Block_copy(&aBlock);
  swift_release();
  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_actionWithTitle_style_handler_, v9, 0, v10, 0xE000000000000000);
  _Block_release(v10);

  v34 = a4;
  v13 = (void *)qword_1F012F678;
  v14 = v12;
  v15 = v13;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v16 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v17 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v18 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v17, v18, 0, 0xE000000000000000);

  v20 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v34;
  *(_QWORD *)(v21 + 24) = a5;
  swift_retain();
  v22 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v40 = sub_1D77CA6D8;
  v41 = v21;
  aBlock = MEMORY[0x1E0C809B0];
  v37 = 1107296256;
  v38 = sub_1D77C2C90;
  v39 = &block_descriptor_39;
  v23 = _Block_copy(&aBlock);
  swift_release();
  v24 = objc_msgSend(v11, sel_actionWithTitle_style_handler_, v22, 1, v23, 0xE000000000000000);
  _Block_release(v23);

  objc_msgSend(v19, sel_addAction_, v24);
  if (v14)
  {
    objc_msgSend(v19, sel_addAction_, v14);

  }
  if (qword_1F012EB98 != -1)
    swift_once();
  v25 = sub_1D77F486C();
  __swift_project_value_buffer(v25, (uint64_t)qword_1F012EF70);
  v26 = sub_1D77F4854();
  v27 = sub_1D77F4BCC();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = swift_slowAlloc();
    v29 = swift_slowAlloc();
    aBlock = v29;
    *(_DWORD *)v28 = 136446722;
    v30 = sub_1D77F4E78();
    sub_1D77C3A1C(v30, v31, &aBlock);
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2082;
    sub_1D77C3A1C(0xD000000000000038, 0x80000001D77F88D0, &aBlock);
    sub_1D77F4D04();
    *(_WORD *)(v28 + 22) = 2082;
    v32 = sub_1D77F4B00();
    sub_1D77C3A1C(v32, v33, &aBlock);
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D77C0000, v26, v27, "[%{public}s.%{public}s]: Showing warning due to reason %{public}s", (uint8_t *)v28, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v29, -1, -1);
    MEMORY[0x1D829C8C8](v28, -1, -1);
  }

  objc_msgSend(a2, sel_presentViewController_animated_completion_, v19, 1, 0);
}

uint64_t sub_1D77C809C()
{
  return sub_1D77F4B0C();
}

void sub_1D77C80B8(uint64_t a1)
{
  swift_getObjectType();
  __asm { BR              X9 }
}

void sub_1D77C8118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  sub_1D77C7A5C(a1, v3, a3, (uint64_t)sub_1D77C87EC, 0);
}

void sub_1D77C8148(uint64_t a1@<X8>)
{
  _QWORD *v1;
  void *v2;
  id *v3;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22[13];

  if (v1[377] != -1)
    swift_once();
  v5 = *v3;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  if (*(_QWORD *)(a1 + 2968) != -1)
    swift_once();
  v6 = sub_1D77F486C();
  __swift_project_value_buffer(v6, (uint64_t)qword_1F012EF70);
  v7 = sub_1D77F4854();
  v8 = sub_1D77F4BCC();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v21 = v2;
    v10 = swift_slowAlloc();
    v22[0] = v10;
    *(_DWORD *)v9 = 136446722;
    v11 = sub_1D77F4E78();
    sub_1D77C3A1C(v11, v12, v22);
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2082;
    sub_1D77C3A1C(0xD00000000000002BLL, 0x80000001D77F87C0, v22);
    sub_1D77F4D04();
    *(_WORD *)(v9 + 22) = 2082;
    v13 = sub_1D77F4B00();
    sub_1D77C3A1C(v13, v14, v22);
    sub_1D77F4D04();
    v1 = &unk_1F012E000;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D77C0000, v7, v8, "[%{public}s.%{public}s]: Showing blocking alert due to reason %{public}s", (uint8_t *)v9, 0x20u);
    swift_arrayDestroy();
    v15 = v10;
    v2 = v21;
    MEMORY[0x1D829C8C8](v15, -1, -1);
    MEMORY[0x1D829C8C8](v9, -1, -1);
  }

  swift_bridgeObjectRetain();
  v16 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, 0, v16, 1, 0xE000000000000000);

  if (v1[377] != -1)
    swift_once();
  v18 = *v3;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v19 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v19, 1, 0, 0xE000000000000000);

  objc_msgSend(v17, sel_addAction_, v20);
  objc_msgSend(v2, sel_presentViewController_animated_completion_, v17, 1, 0);
  swift_bridgeObjectRelease();

}

uint64_t sub_1D77C87EC(uint64_t (*a1)(void))
{
  return a1();
}

void sub_1D77C880C(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t aBlock;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  uint64_t (*v22)(uint64_t);
  uint64_t v23;

  if (qword_1F012EBC8 != -1)
    swift_once();
  v1 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v2 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v3 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v3, v4, 1, 0xE000000000000000);

  v6 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v8 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v22 = sub_1D77CA678;
  v23 = v7;
  aBlock = MEMORY[0x1E0C809B0];
  v19 = 1107296256;
  v20 = sub_1D77C2C90;
  v21 = &block_descriptor_23;
  v9 = _Block_copy(&aBlock);
  swift_release();
  v10 = (void *)objc_opt_self();
  v11 = objc_msgSend(v10, sel_actionWithTitle_style_handler_, v8, 1, v9, 0xE000000000000000);
  _Block_release(v9);
  swift_release();

  v12 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v14 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v22 = sub_1D77CA680;
  v23 = v13;
  aBlock = MEMORY[0x1E0C809B0];
  v19 = 1107296256;
  v20 = sub_1D77C2C90;
  v21 = &block_descriptor_27;
  v15 = _Block_copy(&aBlock);
  swift_release();
  v16 = objc_msgSend(v10, sel_actionWithTitle_style_handler_, v14, 0, v15, 0xE000000000000000);
  _Block_release(v15);
  swift_release();

  objc_msgSend(v5, sel_addAction_, v11);
  objc_msgSend(v5, sel_addAction_, v16);
  objc_msgSend(v5, sel_setPreferredAction_, v16);
  objc_msgSend(a1, sel_presentViewController_animated_completion_, v5, 1, 0);

}

uint64_t sub_1D77C8C80(uint64_t a1, uint64_t a2)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t result;
  void *v22;
  uint64_t v23;

  v3 = sub_1D77F4764();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1D77F477C();
  v23 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1D77F4758();
  v13 = *(_QWORD *)(v12 - 8);
  v15 = MEMORY[0x1E0C80A78](v12, v14);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15, v18);
  v20 = (char *)&v23 - v19;
  swift_beginAccess();
  result = MEMORY[0x1D829C934](a2 + 16);
  if (result)
  {
    v22 = (void *)result;
    (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v20, *MEMORY[0x1E0D2B940], v12);
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x1E0D2B950], v3);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v20, v12);
    sub_1D77F4770();
    sub_1D77C31B8(&qword_1F012F040, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2B968], MEMORY[0x1E0D2B920]);
    sub_1D77F4638();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v8);

    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v20, v12);
  }
  return result;
}

uint64_t sub_1D77C8E80(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v3 = sub_1D77F4620();
  v32 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_1D77F4764();
  v7 = *(_QWORD *)(v30 - 8);
  MEMORY[0x1E0C80A78](v30, v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1D77F477C();
  v31 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1D77F4758();
  v16 = *(_QWORD *)(v15 - 8);
  v18 = MEMORY[0x1E0C80A78](v15, v17);
  v20 = (char *)&v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18, v21);
  v23 = (char *)&v29 - v22;
  swift_beginAccess();
  v24 = MEMORY[0x1D829C934](a2 + 16);
  if (v24)
  {
    v25 = (void *)v24;
    (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v23, *MEMORY[0x1E0D2B928], v15);
    (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v10, *MEMORY[0x1E0D2B950], v30);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v20, v23, v15);
    sub_1D77F4770();
    sub_1D77C31B8(&qword_1F012F040, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2B968], MEMORY[0x1E0D2B920]);
    sub_1D77F4638();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v14, v11);

    (*(void (**)(char *, uint64_t))(v16 + 8))(v23, v15);
  }
  v27 = v32;
  v26 = v33;
  (*(void (**)(char *, _QWORD, uint64_t))(v32 + 104))(v6, *MEMORY[0x1E0D29C00], v33);
  sub_1D77F4614();
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v6, v26);
}

uint64_t sub_1D77C90F0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  void *v6;
  uint64_t ObjectType;
  uint64_t v13;
  _QWORD *v14;
  void (*v15)(uint64_t, uint64_t (*)(char, void *), _QWORD *);
  id v16;
  id v17;

  v6 = v5;
  ObjectType = swift_getObjectType();
  v13 = *(_QWORD *)&v5[OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_model];
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = v6;
  v14[5] = a2;
  v14[6] = a3;
  v14[7] = ObjectType;
  v15 = *(void (**)(uint64_t, uint64_t (*)(char, void *), _QWORD *))(*(_QWORD *)v13 + 240);
  swift_retain();
  v16 = v6;
  v17 = a2;
  v15(a1, sub_1D77CA60C, v14);
  return swift_release();
}

uint64_t sub_1D77C91AC(char a1, void *a2, uint64_t (*a3)(_QWORD), uint64_t a4, void *a5, void *a6, uint64_t a7)
{
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
  char *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  _QWORD *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t (*v53)(uint64_t);
  uint64_t v55;
  uint64_t (*v56)(_QWORD);
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t aBlock[6];

  v62 = a7;
  v63 = a5;
  v12 = sub_1D77F4A34();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12, v14);
  v16 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1D77F4A58();
  v19 = MEMORY[0x1E0C80A78](v17, v18);
  v22 = (char *)&v55 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    v58 = v20;
    v59 = v19;
    v60 = v13;
    v61 = a4;
    v57 = a6;
    if (a2)
    {
      v24 = a2;
      if (qword_1F012EB98 != -1)
        swift_once();
      v25 = sub_1D77F486C();
      __swift_project_value_buffer(v25, (uint64_t)qword_1F012EF70);
      v26 = a2;
      v27 = a2;
      v28 = sub_1D77F4854();
      v29 = sub_1D77F4BB4();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = swift_slowAlloc();
        v55 = swift_slowAlloc();
        aBlock[0] = v55;
        *(_DWORD *)v30 = 136446722;
        v56 = a3;
        v31 = sub_1D77F4E78();
        v64 = sub_1D77C3A1C(v31, v32, aBlock);
        sub_1D77F4D04();
        swift_bridgeObjectRelease();
        *(_WORD *)(v30 + 12) = 2082;
        v64 = sub_1D77C3A1C(0xD00000000000004CLL, 0x80000001D77F8620, aBlock);
        sub_1D77F4D04();
        *(_WORD *)(v30 + 22) = 2082;
        v64 = (uint64_t)a2;
        v33 = a2;
        sub_1D77C33F0();
        v34 = sub_1D77F4B00();
        v64 = sub_1D77C3A1C(v34, v35, aBlock);
        a3 = v56;
        sub_1D77F4D04();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1D77C0000, v28, v29, "[%{public}s.%{public}s]: Attempted to complete onboarding but received error: %{public}s", (uint8_t *)v30, 0x20u);
        v36 = v55;
        swift_arrayDestroy();
        MEMORY[0x1D829C8C8](v36, -1, -1);
        MEMORY[0x1D829C8C8](v30, -1, -1);

LABEL_14:
        sub_1D77CA478();
        v45 = (void *)sub_1D77F4C74();
        v46 = (_QWORD *)swift_allocObject();
        v47 = v62;
        v48 = v63;
        v49 = v57;
        v46[2] = v63;
        v46[3] = v49;
        v46[4] = v47;
        aBlock[4] = (uint64_t)sub_1D77CA648;
        aBlock[5] = (uint64_t)v46;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_1D77CDEB0;
        aBlock[3] = (uint64_t)&block_descriptor_17;
        v50 = _Block_copy(aBlock);
        v51 = v48;
        v52 = v49;
        swift_release();
        sub_1D77F4A4C();
        aBlock[0] = MEMORY[0x1E0DEE9D8];
        v53 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
        sub_1D77C31B8((unint64_t *)&unk_1EDA11FF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
        sub_1D77CA580(0, (unint64_t *)&unk_1EDA12000, v53, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
        sub_1D77CA520();
        sub_1D77F4D28();
        MEMORY[0x1D829C244](0, v22, v16, v50);
        _Block_release(v50);

        (*(void (**)(char *, uint64_t))(v60 + 8))(v16, v12);
        (*(void (**)(char *, uint64_t))(v58 + 8))(v22, v59);
        v23 = 0;
        return a3(v23);
      }

    }
    else
    {
      if (qword_1F012EB98 != -1)
        swift_once();
      v37 = sub_1D77F486C();
      __swift_project_value_buffer(v37, (uint64_t)qword_1F012EF70);
      v28 = sub_1D77F4854();
      v38 = sub_1D77F4BB4();
      if (os_log_type_enabled(v28, v38))
      {
        v39 = swift_slowAlloc();
        v40 = swift_slowAlloc();
        v56 = a3;
        v41 = v40;
        aBlock[0] = v40;
        *(_DWORD *)v39 = 136446466;
        v42 = sub_1D77F4E78();
        v64 = sub_1D77C3A1C(v42, v43, aBlock);
        sub_1D77F4D04();
        swift_bridgeObjectRelease();
        *(_WORD *)(v39 + 12) = 2082;
        v64 = sub_1D77C3A1C(0xD00000000000004CLL, 0x80000001D77F8620, aBlock);
        sub_1D77F4D04();
        _os_log_impl(&dword_1D77C0000, v28, v38, "[%{public}s.%{public}s]: Attempted to complete onboarding but received error: UNKNOWN", (uint8_t *)v39, 0x16u);
        swift_arrayDestroy();
        v44 = v41;
        a3 = v56;
        MEMORY[0x1D829C8C8](v44, -1, -1);
        MEMORY[0x1D829C8C8](v39, -1, -1);
      }
    }

    goto LABEL_14;
  }
  v23 = 1;
  return a3(v23);
}

void sub_1D77C97A0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  if (qword_1F012EBC8 != -1)
    swift_once();
  v3 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRetain();
  v4 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, 0, v4, 1, 0xE000000000000000);

  v5 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v6 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v6, 1, 0, 0xE000000000000000);

  objc_msgSend(v8, sel_addAction_, v7);
  objc_msgSend(a2, sel_presentViewController_animated_completion_, v8, 1, 0);
  swift_bridgeObjectRelease();

}

void sub_1D77C99C0(int a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  char *v30;
  uint64_t (*v31)(uint64_t);
  uint64_t v32;
  int v33;
  int v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t aBlock[6];

  v37 = a3;
  swift_getObjectType();
  v7 = sub_1D77F4A34();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1D77F4A58();
  v39 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12, v13);
  v38 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1F012EB98 != -1)
    swift_once();
  v15 = sub_1D77F486C();
  __swift_project_value_buffer(v15, (uint64_t)qword_1F012EF70);
  v16 = sub_1D77F4854();
  v17 = sub_1D77F4B9C();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v35 = a4;
    v19 = v18;
    v32 = swift_slowAlloc();
    aBlock[0] = v32;
    *(_DWORD *)v19 = 136446466;
    v33 = a1;
    v20 = sub_1D77F4E78();
    v40 = sub_1D77C3A1C(v20, v21, aBlock);
    v34 = a2;
    LOBYTE(a1) = v33;
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    v40 = sub_1D77C3A1C(0xD000000000000035, 0x80000001D77F85E0, aBlock);
    LOBYTE(a2) = v34;
    sub_1D77F4D04();
    _os_log_impl(&dword_1D77C0000, v16, v17, "[%{public}s.%{public}s]: Onboarding finished", (uint8_t *)v19, 0x16u);
    v22 = v32;
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v22, -1, -1);
    v23 = v19;
    a4 = v35;
    MEMORY[0x1D829C8C8](v23, -1, -1);
  }

  if ((a1 & 1) != 0)
  {
    sub_1D77CA478();
    v24 = (void *)sub_1D77F4C74();
    v25 = swift_allocObject();
    v27 = v36;
    v26 = v37;
    *(_QWORD *)(v25 + 16) = v36;
    *(_BYTE *)(v25 + 24) = a2 & 1;
    *(_QWORD *)(v25 + 32) = v26;
    *(_QWORD *)(v25 + 40) = a4;
    aBlock[4] = (uint64_t)sub_1D77CA4E8;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1D77CDEB0;
    aBlock[3] = (uint64_t)&block_descriptor_0;
    v28 = _Block_copy(aBlock);
    v29 = v27;
    sub_1D77CA510(v26);
    swift_release();
    v30 = v38;
    sub_1D77F4A4C();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    v31 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
    sub_1D77C31B8((unint64_t *)&unk_1EDA11FF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1D77CA580(0, (unint64_t *)&unk_1EDA12000, v31, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1D77CA520();
    sub_1D77F4D28();
    MEMORY[0x1D829C244](0, v30, v11, v28);
    _Block_release(v28);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v30, v12);
  }
}

uint64_t sub_1D77C9DB0(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t ObjectType;
  id v16;
  uint64_t v17;
  uint64_t (*v18)(void);
  uint64_t v19;

  sub_1D77CA580(0, (unint64_t *)&qword_1F012F030, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v19 - v10;
  v12 = a1 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController;
  result = MEMORY[0x1D829C934](a1 + OBJC_IVAR____TtC16HealthMobilityUI38WalkingSteadinessOnboardingCoordinator_rootViewController);
  if (result)
  {
    v14 = *(_QWORD *)(v12 + 8);
    ObjectType = swift_getObjectType();
    v16 = (id)HKMobilityWalkingSteadinessDetailRoomURL();
    sub_1D77F447C();

    v17 = sub_1D77F4488();
    v18 = MEMORY[0x1E0CAFFF8];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v11, 0, 1, v17);
    (*(void (**)(_QWORD, char *, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 40))(a2 & 1, v11, a3, a4, ObjectType, v14);
    swift_unknownObjectRelease();
    return sub_1D77CA770((uint64_t)v11, (uint64_t)&qword_1F012F030, (uint64_t)v18, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1D77CA580);
  }
  return result;
}

id WalkingSteadinessOnboardingCoordinator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void WalkingSteadinessOnboardingCoordinator.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WalkingSteadinessOnboardingCoordinator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingCoordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1D77C9FFC()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  swift_getObjectType();
  if (qword_1F012EB98 != -1)
    swift_once();
  v0 = sub_1D77F486C();
  __swift_project_value_buffer(v0, (uint64_t)qword_1F012EF70);
  v1 = sub_1D77F4854();
  v2 = sub_1D77F4BCC();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = swift_slowAlloc();
    v4 = swift_slowAlloc();
    v7 = v4;
    *(_DWORD *)v3 = 136446466;
    v5 = sub_1D77F4E78();
    sub_1D77C3A1C(v5, v6, &v7);
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2082;
    sub_1D77C3A1C(0xD00000000000002ELL, 0x80000001D77F8970, &v7);
    sub_1D77F4D04();
    _os_log_impl(&dword_1D77C0000, v1, v2, "[%{public}s.%{public}s]: User pressed cancel button", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v4, -1, -1);
    MEMORY[0x1D829C8C8](v3, -1, -1);
  }

  sub_1D77C99C0(1, 0, 0, 0);
}

void sub_1D77CA1D4()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  swift_getObjectType();
  if (qword_1F012EB98 != -1)
    swift_once();
  v0 = sub_1D77F486C();
  __swift_project_value_buffer(v0, (uint64_t)qword_1F012EF70);
  v1 = sub_1D77F4854();
  v2 = sub_1D77F4B9C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = swift_slowAlloc();
    v4 = swift_slowAlloc();
    v7 = v4;
    *(_DWORD *)v3 = 136446466;
    v5 = sub_1D77F4E78();
    sub_1D77C3A1C(v5, v6, &v7);
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2082;
    sub_1D77C3A1C(0xD000000000000025, 0x80000001D77F89D0, &v7);
    sub_1D77F4D04();
    _os_log_impl(&dword_1D77C0000, v1, v2, "[%{public}s.%{public}s]: User dismissed modal view", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v4, -1, -1);
    MEMORY[0x1D829C8C8](v3, -1, -1);
  }

  sub_1D77C99C0(0, 0, 0, 0);
}

uint64_t sub_1D77CA3AC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1D77CA3DC(unsigned __int8 *a1)
{
  uint64_t v1;

  return sub_1D77C6944(a1, *(_BYTE *)(v1 + 16), *(void **)(v1 + 24), *(_BYTE *)(v1 + 32), *(void **)(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t method lookup function for WalkingSteadinessOnboardingCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingCoordinator.__allocating_init(rootViewController:model:factory:analyticsManager:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingCoordinator.presentationControllerWillDismiss(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingCoordinator.onboardingViewControllerDidTapPrimaryButton(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingCoordinator.onboardingViewControllerDidTapSecondaryButton(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingCoordinator.onboardingViewControllerDidTapCancelButton(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

unint64_t sub_1D77CA478()
{
  unint64_t result;

  result = qword_1EDA11E30[0];
  if (!qword_1EDA11E30[0])
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, qword_1EDA11E30);
  }
  return result;
}

uint64_t sub_1D77CA4B4()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 32))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D77CA4E8()
{
  uint64_t v0;

  return sub_1D77C9DB0(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
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

uint64_t sub_1D77CA510(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

unint64_t sub_1D77CA520()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDA12010;
  if (!qword_1EDA12010)
  {
    sub_1D77CA580(255, (unint64_t *)&unk_1EDA12000, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1D829C838](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EDA12010);
  }
  return result;
}

void sub_1D77CA580(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_1D77CA5D8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1D77CA60C(char a1, void *a2)
{
  uint64_t v2;

  return sub_1D77C91AC(a1, a2, *(uint64_t (**)(_QWORD))(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32), *(void **)(v2 + 40), *(_QWORD *)(v2 + 48));
}

uint64_t sub_1D77CA61C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1D77CA648()
{
  uint64_t v0;

  sub_1D77C97A0(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1D77CA654()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1D77CA678(uint64_t a1)
{
  uint64_t v1;

  return sub_1D77C8C80(a1, v1);
}

uint64_t sub_1D77CA680(uint64_t a1)
{
  uint64_t v1;

  return sub_1D77C8E80(a1, v1);
}

uint64_t sub_1D77CA688()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D77CA6AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t (*)(), _QWORD))(v0 + 16))(sub_1D77C809C, 0);
}

uint64_t sub_1D77CA6D8()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t (*)(), _QWORD))(v0 + 16))(nullsub_1, 0);
}

uint64_t sub_1D77CA704()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1D77CA728()
{
  _BYTE *v0;
  unsigned __int8 v1;
  char v2;
  unsigned __int8 v3;
  char v4;

  v1 = v0[25];
  v2 = v0[26];
  v4 = v0[24];
  v3 = v1;
  sub_1D77C605C(&v4, &v3, v2);
}

uint64_t sub_1D77CA770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v5;

  v5 = a4(0, a2, a3, MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

uint64_t sub_1D77CA7B8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1D77CA7E4()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 24);
  sub_1D77C80B8((uint64_t)&v1);
}

void sub_1D77CA820()
{
  uint64_t v0;

  sub_1D77C880C(*(void **)(v0 + 24));
}

uint64_t sub_1D77CA844()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1D77CA870()
{
  uint64_t v0;

  return sub_1D77C722C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40), *(_BYTE *)(v0 + 41));
}

uint64_t sub_1D77CA884(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1D77CA894(uint64_t result)
{
  uint64_t v1;

  if ((result & 1) != 0)
    return (*(uint64_t (**)(void))(v1 + 16))();
  return result;
}

uint64_t sub_1D77CA8BC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1D77CA8E0()
{
  uint64_t v0;
  char v1;
  unsigned __int8 v2;

  v1 = *(_BYTE *)(v0 + 25);
  v2 = *(_BYTE *)(v0 + 24);
  sub_1D77C7360(&v2, v1, 0, 0);
}

uint64_t sub_1D77CA924()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1D77CA948(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1D77C72D8(a1, a2, *(_QWORD *)(v2 + 16), *(_BYTE *)(v2 + 24), *(_BYTE *)(v2 + 25));
}

void sub_1D77CA958(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
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

uint64_t sub_1D77CA9EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1D77F486C();
  __swift_allocate_value_buffer(v0, qword_1F012F0C0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F0C0);
  if (qword_1F012EBF0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F6F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_1D77CAA7C(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _BYTE v5[40];

  sub_1D77CB068(a1, (uint64_t)v5);
  v3 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item;
  swift_beginAccess();
  sub_1D77CB148((uint64_t)v5, v3);
  swift_endAccess();
  sub_1D77CAB04();
  return sub_1D77CB794((uint64_t)v5, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
}

void sub_1D77CAB04()
{
  char *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  swift_getObjectType();
  v1 = (uint64_t)&v0[OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item];
  swift_beginAccess();
  sub_1D77CB068(v1, (uint64_t)&v25);
  if (*((_QWORD *)&v26 + 1))
  {
    sub_1D77CB828(0, (unint64_t *)&qword_1F012F0E8);
    sub_1D77CB828(0, &qword_1F012F1F0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v2 = (void *)v22;
      v3 = *(void **)&v0[OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView];
      ObjectType = swift_getObjectType();
      objc_msgSend(v3, sel_setDelegate_, v22);
      objc_msgSend(v3, sel_setDataSource_, v22);
      objc_msgSend(v3, sel_reloadAllComponents);
      v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(ObjectType, v23);
      v6 = *(_QWORD *)(v5 + 16);
      if (v6)
      {
        v7 = (_QWORD *)(v5 + 40);
        do
        {
          objc_msgSend(v3, sel_selectRow_inComponent_animated_, *(v7 - 1), *v7, 0);
          v7 += 2;
          --v6;
        }
        while (v6);
      }
      swift_bridgeObjectRelease();
      sub_1D77CB068(v1, (uint64_t)&v22);
      if (v24)
      {
        sub_1D77CB828(0, (unint64_t *)&unk_1F012F200);
        if ((swift_dynamicCast() & 1) != 0)
        {
          if (*((_QWORD *)&v26 + 1))
          {
            __swift_project_boxed_opaque_existential_1(&v25, *((uint64_t *)&v26 + 1));
            v8 = sub_1D77F474C();
            v10 = v9;
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v25);
            if (v10)
              v11 = v8;
            else
              v11 = 0;
            goto LABEL_21;
          }
        }
        else
        {
          v27 = 0;
          v25 = 0u;
          v26 = 0u;
        }
      }
      else
      {
        sub_1D77CB794((uint64_t)&v22, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
        v25 = 0u;
        v26 = 0u;
        v27 = 0;
      }
      sub_1D77CB794((uint64_t)&v25, &qword_1F012F1F8, (unint64_t *)&unk_1F012F200);
      v11 = 0;
      v10 = 0;
LABEL_21:
      sub_1D77CB2E4(v11, v10);
      swift_bridgeObjectRelease();
      if ((objc_msgSend(v2, sel_respondsToSelector_, sel_pickerView_didSelectRow_inComponent_) & 1) != 0)
      {
        swift_unknownObjectRetain();
        objc_msgSend(v2, sel_pickerView_didSelectRow_inComponent_, v3, objc_msgSend(v3, sel_selectedRowInComponent_, 0), 0);
        swift_unknownObjectRelease_n();
      }
      else
      {
        swift_unknownObjectRelease();
      }
      return;
    }
  }
  else
  {
    sub_1D77CB794((uint64_t)&v25, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
  }
  if (qword_1F012EBA0 != -1)
    swift_once();
  v12 = sub_1D77F486C();
  __swift_project_value_buffer(v12, (uint64_t)qword_1F012F0C0);
  v13 = v0;
  v14 = sub_1D77F4854();
  v15 = sub_1D77F4BB4();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v17 = swift_slowAlloc();
    *(_QWORD *)&v25 = v17;
    *(_DWORD *)v16 = 136446722;
    v18 = sub_1D77F4E78();
    sub_1D77C3A1C(v18, v19, (uint64_t *)&v25);
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2082;
    sub_1D77C3A1C(1835365481, 0xE400000000000000, (uint64_t *)&v25);
    sub_1D77F4D04();
    *(_WORD *)(v16 + 22) = 2082;
    sub_1D77CB7D0(0, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
    sub_1D77CB744();
    v20 = sub_1D77F4B00();
    v22 = sub_1D77C3A1C(v20, v21, (uint64_t *)&v25);
    sub_1D77F4D04();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D77C0000, v14, v15, "[%{public}s.%{public}s]: Attempted to set item (%{public}s) that did not conform to PickerTableViewCellSource", (uint8_t *)v16, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v17, -1, -1);
    MEMORY[0x1D829C8C8](v16, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_1D77CB018@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item;
  swift_beginAccess();
  return sub_1D77CB068(v3, a1);
}

uint64_t sub_1D77CB068(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77CB7D0(0, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D77CB0C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item;
  swift_beginAccess();
  sub_1D77CB148(a1, v3);
  swift_endAccess();
  sub_1D77CAB04();
  return sub_1D77CB794(a1, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
}

uint64_t sub_1D77CB148(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77CB7D0(0, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void (*sub_1D77CB1A4(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D77CB1EC;
}

void sub_1D77CB1EC(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_1D77CAB04();
}

id PickerTableViewCell.pickerView.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView);
}

void sub_1D77CB2E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a2)
  {
    v5 = *(void **)(v2 + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView);
    sub_1D77CB3E0();
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1D77F5EA0;
    *(_QWORD *)(v6 + 32) = a1;
    *(_QWORD *)(v6 + 40) = a2;
    *(_QWORD *)(v6 + 48) = 0x72656B636950;
    *(_QWORD *)(v6 + 56) = 0xE600000000000000;
    swift_bridgeObjectRetain();
    v7 = (void *)sub_1D77F4B48();
    swift_bridgeObjectRelease();
    v8 = (id)HKUIJoinStringsForAutomationIdentifier();

    objc_msgSend(v5, sel_setAccessibilityIdentifier_, v8);
  }
  else
  {
    objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView), sel_setAccessibilityIdentifier_, 0);
  }
}

void sub_1D77CB3E0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012F0F8)
  {
    v0 = sub_1D77F4DF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012F0F8);
  }
}

id PickerTableViewCell.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PickerTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PickerTableViewCell()
{
  return objc_opt_self();
}

void sub_1D77CB4D8(uint64_t a1, uint64_t a2)
{
  sub_1D77CB2E4(a1, a2);
}

uint64_t sub_1D77CB4F8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item;
  swift_beginAccess();
  return sub_1D77CB068(v3, a2);
}

uint64_t dispatch thunk of PickerTableViewCellSource.initialSelections.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t method lookup function for PickerTableViewCell()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PickerTableViewCell.item.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of PickerTableViewCell.item.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of PickerTableViewCell.item.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of PickerTableViewCell.updateAutomationIdentifiers(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

char *sub_1D77CB5D4(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v4;
  id v5;
  char *v6;
  id v7;
  void *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  objc_super v17;

  v4 = &v2[OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_item];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = objc_allocWithZone(MEMORY[0x1E0DC3AE0]);
  v6 = v2;
  v7 = objc_msgSend(v5, sel_init);
  *(_QWORD *)&v6[OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView] = v7;

  if (a2)
  {
    v8 = (void *)sub_1D77F4ADC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v17.receiver = v6;
  v17.super_class = (Class)type metadata accessor for PickerTableViewCell();
  v9 = (char *)objc_msgSendSuper2(&v17, sel_initWithStyle_reuseIdentifier_, 0, v8);

  v10 = OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView;
  v11 = *(void **)&v9[OBJC_IVAR____TtC16HealthMobilityUI19PickerTableViewCell_pickerView];
  v12 = v9;
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v13 = objc_msgSend(v12, sel_contentView);
  objc_msgSend(v13, sel_addSubview_, v11);

  v14 = *(id *)&v9[v10];
  v15 = objc_msgSend(v12, sel_contentView);
  objc_msgSend(v14, sel_hk_alignConstraintsWithView_, v15);

  return v12;
}

unint64_t sub_1D77CB744()
{
  unint64_t result;

  result = qword_1F012F1E8;
  if (!qword_1F012F1E8)
  {
    sub_1D77CB7D0(255, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012F1E8);
  }
  return result;
}

uint64_t sub_1D77CB794(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t v4;

  sub_1D77CB7D0(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_1D77CB7D0(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_1D77CB828(255, a3);
    v4 = sub_1D77F4CF8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_1D77CB828(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_1D77CB898()
{
  sub_1D77F4DA0();
  __break(1u);
}

void OnboardingViewControllerProxy.dismiss(dueToCompletion:deepLinkUrlToUse:completion:)()
{
  sub_1D77F4DA0();
  __break(1u);
}

uint64_t dispatch thunk of OnboardingViewControllerProxy.presentationController.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of OnboardingViewControllerProxy.present(_:animated:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of OnboardingViewControllerProxy.setViewControllers(_:animated:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of OnboardingViewControllerProxy.show(_:sender:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of OnboardingViewControllerProxy.dismiss(dueToCompletion:deepLinkUrlToUse:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 40))();
}

uint64_t dispatch thunk of OnboardingViewControllerProxy.dismiss(animated:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t WeightItem.reuseIdentifier.getter()
{
  type metadata accessor for TitleValueTableViewCell();
  sub_1D77CB9AC();
  return sub_1D77F4698();
}

unint64_t sub_1D77CB9AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F012F210;
  if (!qword_1F012F210)
  {
    v1 = type metadata accessor for TitleValueTableViewCell();
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for TitleValueTableViewCell, v1);
    atomic_store(result, (unint64_t *)&qword_1F012F210);
  }
  return result;
}

uint64_t WeightItem.uniqueIdentifier.getter()
{
  void **v0;
  uint64_t v1;
  void *v2;
  id v3;

  sub_1D77CBAA8();
  v1 = sub_1D77F4B00();
  v2 = *v0;
  sub_1D77CBAE0();
  v3 = v2;
  sub_1D77F4B00();
  swift_bridgeObjectRetain();
  sub_1D77F4B24();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

unint64_t sub_1D77CBAA8()
{
  unint64_t result;

  result = qword_1F012F218;
  if (!qword_1F012F218)
  {
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012F218);
  }
  return result;
}

void sub_1D77CBAE0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012F220)
  {
    sub_1D77CBB34();
    v0 = sub_1D77F4CF8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012F220);
  }
}

unint64_t sub_1D77CBB34()
{
  unint64_t result;

  result = qword_1F012F228;
  if (!qword_1F012F228)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012F228);
  }
  return result;
}

uint64_t WeightItem.baseIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WeightItem.baseIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*WeightItem.baseIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t WeightItem.init(weight:valueFormatter:)@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, _QWORD *a3@<X8>)
{
  a3[6] = 0;
  a3[7] = 0;
  *a3 = a1;
  return sub_1D77C35F4(a2, (uint64_t)(a3 + 1));
}

uint64_t sub_1D77CBBF8()
{
  type metadata accessor for TitleValueTableViewCell();
  sub_1D77CB9AC();
  return sub_1D77F4698();
}

uint64_t sub_1D77CBC30()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1D77CBC5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*sub_1D77CBC90())()
{
  return nullsub_1;
}

uint64_t WeightItem.title.getter()
{
  id v0;
  uint64_t v1;

  if (qword_1F012EBC0 != -1)
    swift_once();
  v0 = (id)qword_1F012F660;
  swift_bridgeObjectRetain();
  v1 = sub_1D77F43F8();
  swift_bridgeObjectRelease();

  return v1;
}

uint64_t WeightItem.value.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(char *, id, uint64_t, uint64_t);
  id v5;
  uint64_t v6;
  id v8;
  uint64_t v9;
  char v10;

  v1 = *(void **)v0;
  if (*(_QWORD *)v0)
  {
    v2 = *(_QWORD *)(v0 + 32);
    v3 = *(_QWORD *)(v0 + 40);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 8), v2);
    v10 = 0;
    v4 = *(uint64_t (**)(char *, id, uint64_t, uint64_t))(v3 + 16);
    v5 = v1;
    v6 = v4(&v10, v5, v2, v3);

    return v6;
  }
  else
  {
    if (qword_1F012EBC0 != -1)
      swift_once();
    v8 = (id)qword_1F012F660;
    swift_bridgeObjectRetain();
    v9 = sub_1D77F43F8();
    swift_bridgeObjectRelease();

    return v9;
  }
}

uint64_t sub_1D77CBE90()
{
  id v0;
  uint64_t v1;

  if (qword_1F012EBC0 != -1)
    swift_once();
  v0 = (id)qword_1F012F660;
  swift_bridgeObjectRetain();
  v1 = sub_1D77F43F8();
  swift_bridgeObjectRelease();

  return v1;
}

uint64_t destroy for WeightItem(id *a1)
{

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(a1 + 1));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WeightItem(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  id v10;
  uint64_t v11;

  v4 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = a1 + 8;
  v6 = a2 + 8;
  v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v7;
  v8 = v7;
  v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  v10 = v4;
  v9(v5, v6, v8);
  v11 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v11;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WeightItem(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for WeightItem(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WeightItem(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WeightItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WeightItem()
{
  return &type metadata for WeightItem;
}

uint64_t sub_1D77CC2F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1D77F486C();
  __swift_allocate_value_buffer(v0, qword_1F012F230);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F230);
  if (qword_1F012EBF0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F6F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_1D77CC388()
{
  sub_1D77CC3A8();
}

void sub_1D77CC3A8()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v1 = objc_msgSend(v0, sel_dateOfBirthComponentsWithError_, v6);
  v2 = v6[0];
  if (v1)
  {
    v3 = v1;
    sub_1D77F43E0();
    v4 = v2;

  }
  else
  {
    v5 = v6[0];
    sub_1D77F4464();

    swift_willThrow();
  }
}

id sub_1D77CC468()
{
  return sub_1D77CC4B8((SEL *)&selRef__heightCharacteristicQuantityWithError_);
}

id sub_1D77CC490()
{
  return sub_1D77CC4B8((SEL *)&selRef__bodyMassCharacteristicQuantityWithError_);
}

id sub_1D77CC4B8(SEL *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v2 = objc_msgSend(v1, *a1, v6);
  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_1D77F4464();

    swift_willThrow();
  }
  return v2;
}

id sub_1D77CC568(uint64_t a1)
{
  return sub_1D77CC588(a1);
}

id sub_1D77CC588(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  id v13;
  id v14[2];

  v2 = v1;
  v14[1] = *(id *)MEMORY[0x1E0C80C00];
  sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)v14 - v6;
  sub_1D77CC914(a1, (uint64_t)v14 - v6);
  v8 = sub_1D77F43EC();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
  {
    v10 = (void *)sub_1D77F43D4();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
  }
  v14[0] = 0;
  v11 = objc_msgSend(v2, sel__setDateOfBirthComponents_error_, v10, v14);

  if ((v11 & 1) != 0)
    return v14[0];
  v13 = v14[0];
  sub_1D77F4464();

  return (id)swift_willThrow();
}

id sub_1D77CC6E4(uint64_t a1)
{
  return sub_1D77CC734(a1, (SEL *)&selRef__setBodyMassCharacteristicQuantity_error_);
}

id sub_1D77CC70C(uint64_t a1)
{
  return sub_1D77CC734(a1, (SEL *)&selRef__setHeightCharacteristicQuantity_error_);
}

id sub_1D77CC734(uint64_t a1, SEL *a2)
{
  void *v2;
  id v4;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x1E0C80C00];
  v5[0] = 0;
  if (objc_msgSend(v2, *a2, a1, v5))
    return v5[0];
  v4 = v5[0];
  sub_1D77F4464();

  return (id)swift_willThrow();
}

void ConfirmDetailsProvider.Details.init(dateOfBirthComponents:weight:height:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = sub_1D77F43EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(a4, 1, 1, v8);
  v9 = type metadata accessor for ConfirmDetailsProvider.Details();
  v10 = *(int *)(v9 + 20);
  *(_QWORD *)(a4 + v10) = 0;
  v11 = *(int *)(v9 + 24);
  *(_QWORD *)(a4 + v11) = 0;
  sub_1D77CC8AC(a1, a4);

  *(_QWORD *)(a4 + v10) = a2;
  *(_QWORD *)(a4 + v11) = a3;
}

uint64_t type metadata accessor for ConfirmDetailsProvider.Details()
{
  uint64_t result;

  result = qword_1F012F3F0;
  if (!qword_1F012F3F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D77CC8AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t ConfirmDetailsProvider.Details.dateOfBirthComponents.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D77CC914(v1, a1);
}

uint64_t sub_1D77CC914(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ConfirmDetailsProvider.Details.dateOfBirthComponents.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_1D77CC8AC(a1, v1);
}

uint64_t (*ConfirmDetailsProvider.Details.dateOfBirthComponents.modify())()
{
  return nullsub_1;
}

void *ConfirmDetailsProvider.Details.weight.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for ConfirmDetailsProvider.Details() + 20));
  v2 = v1;
  return v1;
}

void ConfirmDetailsProvider.Details.weight.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(type metadata accessor for ConfirmDetailsProvider.Details() + 20);

  *(_QWORD *)(v1 + v3) = a1;
}

uint64_t (*ConfirmDetailsProvider.Details.weight.modify())()
{
  type metadata accessor for ConfirmDetailsProvider.Details();
  return nullsub_1;
}

void *ConfirmDetailsProvider.Details.height.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for ConfirmDetailsProvider.Details() + 24));
  v2 = v1;
  return v1;
}

void ConfirmDetailsProvider.Details.height.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(type metadata accessor for ConfirmDetailsProvider.Details() + 24);

  *(_QWORD *)(v1 + v3) = a1;
}

uint64_t (*ConfirmDetailsProvider.Details.height.modify())()
{
  type metadata accessor for ConfirmDetailsProvider.Details();
  return nullsub_1;
}

uint64_t ConfirmDetailsProvider.DetailItems.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

HealthMobilityUI::ConfirmDetailsProvider::DetailItems __swiftcall ConfirmDetailsProvider.DetailItems.init(rawValue:)(HealthMobilityUI::ConfirmDetailsProvider::DetailItems rawValue)
{
  HealthMobilityUI::ConfirmDetailsProvider::DetailItems *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static ConfirmDetailsProvider.DetailItems.dateOfBirthComponents.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static ConfirmDetailsProvider.DetailItems.weight.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static ConfirmDetailsProvider.DetailItems.height.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

_QWORD *sub_1D77CCAEC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1D77CCAF8(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_1D77CCB00@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_1D77CCB14@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_1D77CCB28@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1D77CCB3C(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_1D77CCB6C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1D77CCB98@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_1D77CCBBC(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_1D77CCBD0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_1D77CCBE4(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_1D77CCBF8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1D77CCC0C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_1D77CCC20(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_1D77CCC34(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_1D77CCC48()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_1D77CCC58()
{
  return sub_1D77F4D1C();
}

_QWORD *sub_1D77CCC70(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_1D77CCC88@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_1D77CCCDC()
{
  sub_1D77CEF9C();
  sub_1D77C31B8(&qword_1F012F258, (uint64_t (*)(uint64_t))sub_1D77CEF9C, MEMORY[0x1E0C95FB8]);
  return sub_1D77F49F8();
}

uint64_t ConfirmDetailsProvider.__allocating_init(source:dateGenerator:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  swift_allocObject();
  v6 = sub_1D77CF018(a1, a2, a3);
  swift_release();
  return v6;
}

uint64_t ConfirmDetailsProvider.init(source:dateGenerator:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = sub_1D77CF018(a1, a2, a3);
  swift_release();
  return v3;
}

uint64_t ConfirmDetailsProvider.aboveAgeThreshold.getter()
{
  return 0;
}

uint64_t sub_1D77CCDD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  void *v23;
  uint64_t (*v24)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD aBlock[6];

  v4 = v3;
  v7 = *v4;
  v27 = a2;
  v28 = v7;
  v8 = sub_1D77F4A34();
  v32 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1D77F4A58();
  v30 = *(_QWORD *)(v12 - 8);
  v31 = v12;
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for ConfirmDetailsProvider.Details();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(_QWORD *)(v17 + 64);
  MEMORY[0x1E0C80A78](v16, v19);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = 0;
  v29 = v4[9];
  sub_1D77CF2F4(a1, (uint64_t)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = (*(unsigned __int8 *)(v17 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = v27;
  v22[3] = a3;
  v22[4] = v20;
  v22[5] = v4;
  sub_1D77CF414((uint64_t)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v22 + v21);
  *(_QWORD *)((char *)v22 + ((v18 + v21 + 7) & 0xFFFFFFFFFFFFFFF8)) = v28;
  aBlock[4] = sub_1D77CF458;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D77CDEB0;
  aBlock[3] = &block_descriptor_1;
  v23 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1D77F4A4C();
  v33 = MEMORY[0x1E0DEE9D8];
  v24 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  sub_1D77C31B8((unint64_t *)&unk_1EDA11FF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1D77CA580(0, (unint64_t *)&unk_1EDA12000, v24, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1D77CF4B8((unint64_t *)&qword_1EDA12010, (unint64_t *)&unk_1EDA12000, v24);
  sub_1D77F4D28();
  MEMORY[0x1D829C244](0, v15, v11, v23);
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v15, v31);
  swift_release();
  return swift_release();
}

uint64_t sub_1D77CD094(uint64_t a1, unint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v15[4];

  if (qword_1F012EBA8 != -1)
    swift_once();
  v5 = sub_1D77F486C();
  __swift_project_value_buffer(v5, (uint64_t)qword_1F012F230);
  swift_bridgeObjectRetain_n();
  v6 = sub_1D77F4854();
  v7 = sub_1D77F4BCC();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v9 = swift_slowAlloc();
    v15[0] = v9;
    *(_DWORD *)v8 = 136446722;
    v10 = sub_1D77F4E78();
    sub_1D77C3A1C(v10, v11, v15);
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2082;
    sub_1D77C3A1C(0xD00000000000001FLL, 0x80000001D77F8D20, v15);
    sub_1D77F4D04();
    *(_WORD *)(v8 + 22) = 2082;
    swift_bridgeObjectRetain();
    sub_1D77C3A1C(a1, a2, v15);
    sub_1D77F4D04();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1D77C0000, v6, v7, "[%{public}s.%{public}s]: Saving changes to characteristic %{public}s", (uint8_t *)v8, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v9, -1, -1);
    MEMORY[0x1D829C8C8](v8, -1, -1);

  }
  else
  {

    v12 = swift_bridgeObjectRelease_n();
  }
  return a3(v12);
}

void sub_1D77CD564(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  _BYTE *v53;
  _BYTE *v54;
  void (*v55)(_BYTE *, uint64_t);
  uint64_t v56;
  uint64_t (*v57)(uint64_t);
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  char v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  char v69;
  void **v70;
  void *v71;
  BOOL v72;
  char v73;
  void *v74;
  id v75;
  _BYTE v76[4];
  int v77;
  _BYTE *v78;
  _BYTE *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void **v86;
  uint64_t v87;
  void (*v88)(uint64_t *);
  uint64_t v89;
  char v90;
  uint64_t v91[3];
  void *v92;

  v85 = a6;
  v81 = a5;
  v87 = a2;
  v88 = a1;
  v8 = sub_1D77F43EC();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0];
  v82 = v8;
  v80 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v78 = &v76[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1D77CFF48();
  v13 = v12;
  MEMORY[0x1E0C80A78](v12, v14);
  v16 = &v76[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1D77CA580(0, &qword_1F012F248, v9, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v20 = MEMORY[0x1E0C80A78](v18, v19);
  v79 = &v76[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v20, v22);
  v24 = &v76[-v23];
  sub_1D77CA580(0, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, v17);
  MEMORY[0x1E0C80A78](v25, v26);
  v28 = &v76[-v27];
  v29 = type metadata accessor for ConfirmDetailsProvider.Details();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29, v31);
  v33 = &v76[-((v32 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v83 = a3;
  v84 = a4;
  v86 = (void **)(a3 + 16);
  v92 = 0;
  swift_retain();
  sub_1D77F49C8();
  swift_release();
  v34 = v29;
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29) == 1)
  {
    sub_1D77CFF04((uint64_t)v28, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
    if (qword_1F012EBA8 != -1)
      swift_once();
    v35 = sub_1D77F486C();
    __swift_project_value_buffer(v35, (uint64_t)qword_1F012F230);
    v36 = sub_1D77F4854();
    v37 = sub_1D77F4BC0();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = swift_slowAlloc();
      v39 = swift_slowAlloc();
      v91[0] = v39;
      *(_DWORD *)v38 = 136446466;
      v40 = sub_1D77F4E78();
      v89 = sub_1D77C3A1C(v40, v41, v91);
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 12) = 2082;
      v89 = sub_1D77C3A1C(0xD000000000000021, 0x80000001D77F8CF0, v91);
      sub_1D77F4D04();
      _os_log_impl(&dword_1D77C0000, v36, v37, "[%{public}s.%{public}s]: Attempted to save new details before we received our first set of details.", (uint8_t *)v38, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v39, -1, -1);
      MEMORY[0x1D829C8C8](v38, -1, -1);
    }

    goto LABEL_30;
  }
  sub_1D77CF414((uint64_t)v28, (uint64_t)v33);
  v42 = v81;
  sub_1D77CC914(v81, (uint64_t)v24);
  v43 = (uint64_t)&v16[*(int *)(v13 + 48)];
  sub_1D77CC914((uint64_t)v33, (uint64_t)v16);
  sub_1D77CC914((uint64_t)v24, v43);
  v44 = v80;
  v45 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v80 + 48);
  v46 = v82;
  if (v45((uint64_t)v16, 1, v82) == 1)
  {
    sub_1D77CFF04((uint64_t)v24, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
    v47 = v45(v43, 1, v46);
    v48 = v84;
    v49 = v34;
    if (v47 == 1)
    {
      v50 = sub_1D77CFF04((uint64_t)v16, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
      goto LABEL_15;
    }
  }
  else
  {
    v52 = v79;
    sub_1D77CC914((uint64_t)v16, (uint64_t)v79);
    if (v45(v43, 1, v46) != 1)
    {
      v53 = v78;
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v44 + 32))(v78, v43, v46);
      sub_1D77C31B8(&qword_1F012F438, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], MEMORY[0x1E0CAEAE0]);
      v77 = sub_1D77F4AD0();
      v54 = v52;
      v55 = *(void (**)(_BYTE *, uint64_t))(v44 + 8);
      v55(v53, v46);
      v56 = (uint64_t)v24;
      v57 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0];
      sub_1D77CFF04(v56, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
      v55(v54, v46);
      v50 = sub_1D77CFF04((uint64_t)v16, &qword_1F012F248, v57);
      v48 = v84;
      v49 = v34;
      if ((v77 & 1) != 0)
        goto LABEL_15;
      goto LABEL_14;
    }
    sub_1D77CFF04((uint64_t)v24, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
    (*(void (**)(_BYTE *, uint64_t))(v44 + 8))(v52, v46);
    v48 = v84;
    v49 = v34;
  }
  v50 = sub_1D77CFFCC((uint64_t)v16, (uint64_t (*)(_QWORD))sub_1D77CFF48);
LABEL_14:
  MEMORY[0x1E0C80A78](v50, v51);
  *(_QWORD *)&v76[-32] = v48;
  *(_QWORD *)&v76[-24] = v42;
  *(_QWORD *)&v76[-16] = &v92;
  v50 = sub_1D77CD094(0x20666F2065746144, 0xED00006874726942, (uint64_t (*)(uint64_t))sub_1D77D0008);
LABEL_15:
  v58 = *(int *)(v49 + 20);
  v59 = *(void **)&v33[v58];
  v60 = *(void **)(v42 + v58);
  if (!v59)
  {
    if (!v60)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (!v60
    || (sub_1D77D005C(0, (unint64_t *)&qword_1F012F228),
        v61 = v60,
        v62 = v59,
        v63 = sub_1D77F4CE0(),
        v62,
        v61,
        (v63 & 1) == 0))
  {
LABEL_20:
    MEMORY[0x1E0C80A78](v50, v51);
    *(_QWORD *)&v76[-32] = v48;
    *(_QWORD *)&v76[-24] = v42;
    *(_QWORD *)&v76[-16] = &v92;
    v50 = sub_1D77CD094(0x746867696557, 0xE600000000000000, (uint64_t (*)(uint64_t))sub_1D77D0024);
  }
LABEL_21:
  v64 = *(int *)(v49 + 24);
  v65 = *(void **)&v33[v64];
  v66 = *(void **)(v42 + v64);
  if (v65)
  {
    if (v66)
    {
      sub_1D77D005C(0, (unint64_t *)&qword_1F012F228);
      v67 = v66;
      v68 = v65;
      v69 = sub_1D77F4CE0();

      if ((v69 & 1) != 0)
        goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (v66)
  {
LABEL_26:
    MEMORY[0x1E0C80A78](v50, v51);
    *(_QWORD *)&v76[-32] = v48;
    *(_QWORD *)&v76[-24] = v42;
    *(_QWORD *)&v76[-16] = &v92;
    sub_1D77CD094(0x746867696548, 0xE600000000000000, (uint64_t (*)(uint64_t))sub_1D77D0040);
  }
LABEL_27:
  if (v92)
    sub_1D77CDEDC();
  sub_1D77CFFCC((uint64_t)v33, (uint64_t (*)(_QWORD))type metadata accessor for ConfirmDetailsProvider.Details);
LABEL_30:
  v70 = v86;
  swift_beginAccess();
  v71 = *v70;
  v72 = *v70 == 0;
  v73 = *v70 != 0;
  if (v72)
    v74 = v92;
  else
    v74 = v71;
  v89 = (uint64_t)v74;
  v90 = v73;
  v75 = v71;
  v88(&v89);
  sub_1D77CFFC0(v74, v73);
}

uint64_t sub_1D77CDD24(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v6 = a1[5];
  v7 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v6);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a2, v6, v7);
  if (!v3 && (*a3 & 2) == 0)
    *a3 |= 2uLL;
  return result;
}

uint64_t sub_1D77CDDA0(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a1[5];
  v7 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v6);
  v8 = type metadata accessor for ConfirmDetailsProvider.Details();
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v7 + 40))(*(_QWORD *)(a2 + *(int *)(v8 + 20)), v6, v7);
  if (!v3 && (*a3 & 4) == 0)
    *a3 |= 4uLL;
  return result;
}

uint64_t sub_1D77CDE28(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a1[5];
  v7 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v6);
  v8 = type metadata accessor for ConfirmDetailsProvider.Details();
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v7 + 48))(*(_QWORD *)(a2 + *(int *)(v8 + 24)), v6, v7);
  if (!v3 && (*a3 & 8) == 0)
    *a3 |= 8uLL;
  return result;
}

uint64_t sub_1D77CDEB0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1D77CDEDC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = *v0;
  v3 = sub_1D77F4A34();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v17 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1D77F4A58();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = v1[9];
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v1;
  *(_QWORD *)(v13 + 24) = v2;
  aBlock[4] = sub_1D77CFEB4;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D77CDEB0;
  aBlock[3] = &block_descriptor_9;
  v14 = _Block_copy(aBlock);
  swift_retain();
  sub_1D77F4A4C();
  v18 = MEMORY[0x1E0DEE9D8];
  sub_1D77C31B8((unint64_t *)&unk_1EDA11FF0, v4, MEMORY[0x1E0DEF510]);
  sub_1D77CA580(0, (unint64_t *)&unk_1EDA12000, v4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1D77CF4B8((unint64_t *)&qword_1EDA12010, (unint64_t *)&unk_1EDA12000, v4);
  sub_1D77F4D28();
  MEMORY[0x1D829C244](0, v12, v7, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v3);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  return swift_release();
}

uint64_t sub_1D77CE0E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_1D77CE3E0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  uint64_t v4;

  a3(&v4);
  return v4;
}

uint64_t sub_1D77CE6C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t (*v7)(uint64_t);
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
  void *v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;

  v2 = type metadata accessor for ConfirmDetailsProvider.Details();
  v34 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1D77CA580(0, (unint64_t *)&qword_1F012EF08, v7, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v8, v9);
  v33 = (uint64_t)&v31 - v10;
  sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], v6);
  v13 = MEMORY[0x1E0C80A78](v11, v12);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13, v16);
  v18 = (char *)&v31 - v17;
  sub_1D77CE0E0(0x20666F2065746164, 0xED00006874726962, (uint64_t (*)(void))sub_1D77CFEBC);
  v19 = (void *)sub_1D77CE3E0(0x746867696568, 0xE600000000000000, (void (*)(uint64_t *__return_ptr))sub_1D77CFED4);
  v20 = (void *)sub_1D77CE3E0(0x746867696577, 0xE600000000000000, (void (*)(uint64_t *__return_ptr))sub_1D77CFEEC);
  if (*(_BYTE *)(a1 + 96) == 1)
  {
    v21 = sub_1D77F43EC();
    v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 48))(v18, 1, v21) != 1;
    if (v19)
      v23 = (2 * v22) | 8;
    else
      v23 = 2 * v22;
    if (v20)
      v23 |= 4uLL;
    *(_QWORD *)(a1 + 88) = v23;
    *(_BYTE *)(a1 + 96) = 0;
  }
  sub_1D77CC914((uint64_t)v18, (uint64_t)v15);
  v24 = sub_1D77F43EC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v5, 1, 1, v24);
  v25 = v2;
  v26 = *(int *)(v2 + 20);
  *(_QWORD *)&v5[v26] = 0;
  v27 = *(int *)(v25 + 24);
  *(_QWORD *)&v5[v27] = 0;
  v32 = v19;
  swift_retain();
  v28 = v20;
  sub_1D77CC8AC((uint64_t)v15, (uint64_t)v5);

  *(_QWORD *)&v5[v26] = v20;
  *(_QWORD *)&v5[v27] = v19;
  v29 = v33;
  sub_1D77CF414((uint64_t)v5, v33);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v34 + 56))(v29, 0, 1, v25);
  sub_1D77F49BC();

  swift_release();
  sub_1D77CFF04(v29, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  return sub_1D77CFF04((uint64_t)v18, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
}

uint64_t sub_1D77CE9E4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v4 = a1[5];
  v5 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v4);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  if (!v2)
  {
    v7 = sub_1D77F43EC();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a2, 0, 1, v7);
  }
  return result;
}

uint64_t sub_1D77CEA74@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = a1[5];
  v5 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v4);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_1D77CEAD8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = a1[5];
  v5 = a1[6];
  __swift_project_boxed_opaque_existential_1(a1 + 2, v4);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t ConfirmDetailsProvider.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();

  swift_release();
  return v0;
}

uint64_t ConfirmDetailsProvider.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t _s16HealthMobilityUI22ConfirmDetailsProviderC0E0V2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unsigned int (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v29)(uint64_t);
  uint64_t (*v30)(uint64_t);
  uint64_t (*v31)(uint64_t);
  char v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  char v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  char v47;
  uint64_t v49;
  uint64_t v50;

  v4 = sub_1D77F43EC();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0];
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v7);
  v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77CFF48();
  v11 = v10;
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77CA580(0, &qword_1F012F248, v5, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v17 = MEMORY[0x1E0C80A78](v15, v16);
  v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x1E0C80A78](v17, v20);
  v23 = (char *)&v49 - v22;
  MEMORY[0x1E0C80A78](v21, v24);
  v26 = (char *)&v49 - v25;
  sub_1D77CC914(a1, (uint64_t)&v49 - v25);
  v50 = a2;
  sub_1D77CC914(a2, (uint64_t)v23);
  v27 = (uint64_t)&v14[*(int *)(v11 + 48)];
  sub_1D77CC914((uint64_t)v26, (uint64_t)v14);
  sub_1D77CC914((uint64_t)v23, v27);
  v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v28((uint64_t)v14, 1, v4) != 1)
  {
    sub_1D77CC914((uint64_t)v14, (uint64_t)v19);
    if (v28(v27, 1, v4) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v9, v27, v4);
      v31 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0];
      sub_1D77C31B8(&qword_1F012F438, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], MEMORY[0x1E0CAEAE0]);
      v32 = sub_1D77F4AD0();
      v33 = *(void (**)(char *, uint64_t))(v6 + 8);
      v33(v9, v4);
      sub_1D77CFF04((uint64_t)v23, &qword_1F012F248, v31);
      sub_1D77CFF04((uint64_t)v26, &qword_1F012F248, v31);
      v33(v19, v4);
      sub_1D77CFF04((uint64_t)v14, &qword_1F012F248, v31);
      if ((v32 & 1) == 0)
        return 0;
      goto LABEL_8;
    }
    v30 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0];
    sub_1D77CFF04((uint64_t)v23, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
    sub_1D77CFF04((uint64_t)v26, &qword_1F012F248, v30);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v19, v4);
LABEL_6:
    sub_1D77CFFCC((uint64_t)v14, (uint64_t (*)(_QWORD))sub_1D77CFF48);
    return 0;
  }
  v29 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0];
  sub_1D77CFF04((uint64_t)v23, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
  sub_1D77CFF04((uint64_t)v26, &qword_1F012F248, v29);
  if (v28(v27, 1, v4) != 1)
    goto LABEL_6;
  sub_1D77CFF04((uint64_t)v14, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
LABEL_8:
  v34 = type metadata accessor for ConfirmDetailsProvider.Details();
  v35 = *(int *)(v34 + 20);
  v36 = *(void **)(a1 + v35);
  v37 = v50;
  v38 = *(void **)(v50 + v35);
  if (v36)
  {
    if (!v38)
      return 0;
    sub_1D77D005C(0, (unint64_t *)&qword_1F012F228);
    v39 = v38;
    v40 = v36;
    v41 = sub_1D77F4CE0();

    if ((v41 & 1) == 0)
      return 0;
  }
  else if (v38)
  {
    return 0;
  }
  v42 = *(int *)(v34 + 24);
  v43 = *(void **)(a1 + v42);
  v44 = *(void **)(v37 + v42);
  if (v43)
  {
    if (v44)
    {
      sub_1D77D005C(0, (unint64_t *)&qword_1F012F228);
      v45 = v44;
      v46 = v43;
      v47 = sub_1D77F4CE0();

      if ((v47 & 1) != 0)
        return 1;
    }
  }
  else if (!v44)
  {
    return 1;
  }
  return 0;
}

void sub_1D77CEF9C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012F250)
  {
    sub_1D77CA580(255, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    v0 = sub_1D77F49D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012F250);
  }
}

uint64_t sub_1D77CF018(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[2];
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v24 = a2;
  v25 = a3;
  v23 = a1;
  sub_1D77CA580(0, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4, v5);
  v22 = (char *)v20 - v6;
  v21 = sub_1D77F4C68();
  v7 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21, v8);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1D77F4C44();
  v12 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v11, v13);
  v14 = sub_1D77F4A58();
  MEMORY[0x1E0C80A78](v14, v15);
  v20[1] = sub_1D77D005C(0, qword_1EDA11E30);
  sub_1D77F4A4C();
  v26 = MEMORY[0x1E0DEE9D8];
  sub_1D77C31B8(&qword_1EDA12028, v12, MEMORY[0x1E0DEF828]);
  sub_1D77CA580(0, &qword_1EDA12018, v12, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1D77CF4B8(&qword_1EDA12020, &qword_1EDA12018, v12);
  sub_1D77F4D28();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v10, *MEMORY[0x1E0DEF8D0], v21);
  *(_QWORD *)(v3 + 72) = sub_1D77F4C8C();
  v16 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v22, 1, 1, v16);
  sub_1D77CEF9C();
  swift_allocObject();
  *(_QWORD *)(v3 + 80) = sub_1D77F49E0();
  *(_QWORD *)(v3 + 88) = 0;
  *(_WORD *)(v3 + 96) = 1;
  v17 = v23;
  sub_1D77C4434(v23, v3 + 16);
  v18 = v25;
  *(_QWORD *)(v3 + 56) = v24;
  *(_QWORD *)(v3 + 64) = v18;
  swift_retain();
  sub_1D77CDEDC();
  __swift_destroy_boxed_opaque_existential_1Tm(v17);
  return v3;
}

uint64_t sub_1D77CF2D0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1D77CF2F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D77CF338()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for ConfirmDetailsProvider.Details();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 48) & ~v2;
  swift_release();
  swift_release();
  swift_release();
  v4 = v0 + v3;
  v5 = sub_1D77F43EC();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);

  return swift_deallocObject();
}

uint64_t sub_1D77CF414(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1D77CF458()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for ConfirmDetailsProvider.Details() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  sub_1D77CD564(*(void (**)(uint64_t *))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), v0 + v2, *(_QWORD *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)));
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

uint64_t sub_1D77CF4B8(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_1D77CA580(255, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1D829C838](MEMORY[0x1E0DEAF38], v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1D77CF504()
{
  unint64_t result;

  result = qword_1F012F260;
  if (!qword_1F012F260)
  {
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for ConfirmDetailsProvider.DetailItems, &type metadata for ConfirmDetailsProvider.DetailItems);
    atomic_store(result, (unint64_t *)&qword_1F012F260);
  }
  return result;
}

unint64_t sub_1D77CF54C()
{
  unint64_t result;

  result = qword_1F012F268;
  if (!qword_1F012F268)
  {
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for ConfirmDetailsProvider.DetailItems, &type metadata for ConfirmDetailsProvider.DetailItems);
    atomic_store(result, (unint64_t *)&qword_1F012F268);
  }
  return result;
}

unint64_t sub_1D77CF594()
{
  unint64_t result;

  result = qword_1F012F270;
  if (!qword_1F012F270)
  {
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for ConfirmDetailsProvider.DetailItems, &type metadata for ConfirmDetailsProvider.DetailItems);
    atomic_store(result, (unint64_t *)&qword_1F012F270);
  }
  return result;
}

unint64_t sub_1D77CF5DC()
{
  unint64_t result;

  result = qword_1F012F278;
  if (!qword_1F012F278)
  {
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for ConfirmDetailsProvider.DetailItems, &type metadata for ConfirmDetailsProvider.DetailItems);
    atomic_store(result, (unint64_t *)&qword_1F012F278);
  }
  return result;
}

uint64_t dispatch thunk of ConfirmDetailsSource.dateOfBirthComponents()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ConfirmDetailsSource._heightCharacteristicQuantity()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ConfirmDetailsSource._bodyMassCharacteristicQuantity()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ConfirmDetailsSource._setDate(ofBirthComponents:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ConfirmDetailsSource._setBodyMassCharacteristicQuantity(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of ConfirmDetailsSource._setHeightCharacteristicQuantity(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t type metadata accessor for ConfirmDetailsProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for ConfirmDetailsProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ConfirmDetailsProvider.detailsPublisher.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of ConfirmDetailsProvider.__allocating_init(source:dateGenerator:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of ConfirmDetailsProvider.saveUpdatedDetails(_:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t *initializeBufferWithCopyOfBuffer for ConfirmDetailsProvider.Details(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

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
    v7 = sub_1D77F43EC();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = *(int *)(a3 + 20);
    v12 = *(int *)(a3 + 24);
    v13 = *(void **)((char *)a2 + v11);
    *(uint64_t *)((char *)a1 + v11) = (uint64_t)v13;
    v14 = *(void **)((char *)a2 + v12);
    *(uint64_t *)((char *)a1 + v12) = (uint64_t)v14;
    v15 = v13;
    v16 = v14;
  }
  return a1;
}

void destroy for ConfirmDetailsProvider.Details(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1D77F43EC();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);

}

char *initializeWithCopy for ConfirmDetailsProvider.Details(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v6 = sub_1D77F43EC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = *(int *)(a3 + 20);
  v10 = *(int *)(a3 + 24);
  v11 = *(void **)&a2[v9];
  *(_QWORD *)&a1[v9] = v11;
  v12 = *(void **)&a2[v10];
  *(_QWORD *)&a1[v10] = v12;
  v13 = v11;
  v14 = v12;
  return a1;
}

char *assignWithCopy for ConfirmDetailsProvider.Details(char *a1, char *a2, uint64_t a3)
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
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v6 = sub_1D77F43EC();
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
    sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
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

  v16 = *(int *)(a3 + 24);
  v17 = *(void **)&a1[v16];
  v18 = *(void **)&a2[v16];
  *(_QWORD *)&a1[v16] = v18;
  v19 = v18;

  return a1;
}

char *initializeWithTake for ConfirmDetailsProvider.Details(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_1D77F43EC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = *(int *)(a3 + 24);
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  *(_QWORD *)&a1[v9] = *(_QWORD *)&a2[v9];
  return a1;
}

char *assignWithTake for ConfirmDetailsProvider.Details(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = sub_1D77F43EC();
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
    sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = *(void **)&a1[v12];
  *(_QWORD *)&a1[v12] = *(_QWORD *)&a2[v12];

  v14 = *(int *)(a3 + 24);
  v15 = *(void **)&a1[v14];
  *(_QWORD *)&a1[v14] = *(_QWORD *)&a2[v14];

  return a1;
}

uint64_t getEnumTagSinglePayload for ConfirmDetailsProvider.Details()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D77CFCB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
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

uint64_t storeEnumTagSinglePayload for ConfirmDetailsProvider.Details()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1D77CFD64(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;

  sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, v8);
  else
    *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
}

void sub_1D77CFDF4()
{
  unint64_t v0;

  sub_1D77CA580(319, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

ValueMetadata *type metadata accessor for ConfirmDetailsProvider.DetailItems()
{
  return &type metadata for ConfirmDetailsProvider.DetailItems;
}

uint64_t sub_1D77CFE90()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D77CFEB4()
{
  uint64_t v0;

  return sub_1D77CE6C4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1D77CFEBC@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_1D77CE9E4(v1, a1);
}

uint64_t sub_1D77CFED4@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;

  return sub_1D77CEA74(v1, a1);
}

uint64_t sub_1D77CFEEC@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;

  return sub_1D77CEAD8(v1, a1);
}

uint64_t sub_1D77CFF04(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_1D77CA580(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_1D77CFF48()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1F012F430)
  {
    sub_1D77CA580(255, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1F012F430);
  }
}

void sub_1D77CFFC0(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

uint64_t sub_1D77CFFCC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1D77D0008()
{
  uint64_t v0;

  return sub_1D77CDD24(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD **)(v0 + 32));
}

uint64_t sub_1D77D0024()
{
  uint64_t v0;

  return sub_1D77CDDA0(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD **)(v0 + 32));
}

uint64_t sub_1D77D0040()
{
  uint64_t v0;

  return sub_1D77CDE28(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD **)(v0 + 32));
}

uint64_t sub_1D77D005C(uint64_t a1, unint64_t *a2)
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

id HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus.onboardingStatus.getter()
{
  id *v0;

  return *v0;
}

id HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus.notificationStatus.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

id HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus.isFitnessTrackingEnabled.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 8), sel_fitnessTrackingEnabled);
}

BOOL HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus.isOnboarded.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_state) == (id)1;
}

BOOL HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus.isNotificationAvailable.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 8), sel_state) != 0;
}

BOOL HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus.isDeviceSupported.getter()
{
  uint64_t v0;

  return ((unint64_t)objc_msgSend(*(id *)(v0 + 8), sel_notificationUnavailableReasons) & 4) == 0;
}

id HKMobilityWalkingSteadinessFeatureStatusManager.makeFeatureStatusPublisher(queue:)@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  void *v5;
  id v6;
  id v7;
  id result;

  v5 = (void *)objc_opt_self();
  v6 = v2;
  v7 = a1;
  result = objc_msgSend(v5, sel_defaultCenter);
  *a2 = v6;
  a2[1] = result;
  a2[2] = v7;
  return result;
}

uint64_t HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatusPublisher.init(featureStatusManager:notificationCenter:queue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

id HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatusPublisher.featureStatusManager.getter()
{
  id *v0;

  return *v0;
}

uint64_t HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatusPublisher.receive<A>(subscriber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];

  v6 = *(void **)v4;
  v7 = *(void **)(v4 + 8);
  v8 = *(void **)(v4 + 16);
  v9 = _s22FeatureStatusPublisherV5InnerCMa(0, a2, a3, a4);
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = sub_1D77D2914(a1, v10, v11, v12);

  v15[3] = v9;
  v15[4] = MEMORY[0x1D829C838](&unk_1D77F64A0, v9);
  v15[0] = v13;
  sub_1D77F498C();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
}

uint64_t sub_1D77D0294@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_1D77C4434((uint64_t)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x60), a1);
}

uint64_t sub_1D77D02B8@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  char *v3;
  uint64_t v4;

  v3 = (char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x68);
  swift_beginAccess();
  v4 = sub_1D77F483C();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1D77D0338(uint64_t a1)
{
  _QWORD *v1;
  char *v3;
  uint64_t v4;

  v3 = (char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x68);
  swift_beginAccess();
  v4 = sub_1D77F483C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_1D77D03C0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_1D77D0418(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x88);
  v3 = *(void **)((char *)v1 + v2);
  *(_QWORD *)((char *)v1 + v2) = a1;

}

void sub_1D77D043C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x90);
  v3 = *(void **)((char *)v1 + v2);
  *(_QWORD *)((char *)v1 + v2) = a1;

}

uint64_t sub_1D77D0460(uint64_t a1)
{
  _QWORD *v1;

  *(_QWORD *)((char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x98)) = a1;
  return swift_release();
}

uint64_t sub_1D77D0488()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
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
  _QWORD *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD aBlock[6];

  v1 = v0;
  v2 = (_QWORD *)(*MEMORY[0x1E0DEEDD8] & *v0);
  v3 = sub_1D77F4A34();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v6);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D77F4A58();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[0] = *(_QWORD *)((char *)v1 + v2[16]);
  v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v2[10];
  v15[3] = v2[11];
  v15[4] = v14;
  aBlock[4] = sub_1D77D2ED8;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D77CDEB0;
  aBlock[3] = &block_descriptor_24;
  v16 = _Block_copy(aBlock);
  swift_retain();
  sub_1D77F4A4C();
  v18[1] = MEMORY[0x1E0DEE9D8];
  sub_1D77C31B8((unint64_t *)&unk_1EDA11FF0, v4, MEMORY[0x1E0DEF510]);
  sub_1D77CA580(0, (unint64_t *)&unk_1EDA12000, v4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1D77CA520();
  sub_1D77F4D28();
  MEMORY[0x1D829C244](0, v13, v8, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  swift_release();
  return swift_release();
}

void sub_1D77D06C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1D829C934](v1);
  if (v2)
  {
    v3 = (void *)v2;
    sub_1D77D0710();

  }
}

uint64_t sub_1D77D0710()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  char *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  _QWORD *v35;
  id v36;
  _QWORD *v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v54;
  os_log_t v55;
  int v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  id v64[3];

  v1 = v0;
  v64[2] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v3 = (_QWORD *)(*MEMORY[0x1E0DEEDD8] & *v0);
  v4 = v3[10];
  v5 = v3[11];
  v6 = sub_1D77F4824();
  MEMORY[0x1D829C838](MEMORY[0x1E0D2BF28], v6);
  v61 = sub_1D77F4E6C();
  v7 = *(_QWORD *)(v61 - 8);
  MEMORY[0x1E0C80A78](v61, v8);
  v62 = (char *)&v54 - v9;
  v10 = (_QWORD *)((char *)v0 + v3[12]);
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  sub_1D77F47A0();
  v11 = *(void **)((char *)v1 + *(_QWORD *)((*v2 & *v1) + 0x70));
  v64[0] = 0;
  v12 = objc_msgSend(v11, sel_onboardingStatusWithError_, v64);
  v13 = v64[0];
  v60 = v5;
  if (v12)
  {
    v14 = v4;
    v15 = *(_QWORD *)((*v2 & *v0) + 0x88);
    v16 = *(void **)((char *)v0 + v15);
    *(_QWORD *)((char *)v0 + v15) = v12;
    v17 = v12;
    v18 = v13;

    v64[0] = 0;
    v19 = objc_msgSend(v11, sel_notificationStatusWithError_, v64);
    v20 = v64[0];
    if (v19)
    {
      v21 = v19;
      v22 = *(_QWORD *)((*v2 & *v1) + 0x90);
      v23 = *(void **)((char *)v1 + v22);
      *(_QWORD *)((char *)v1 + v22) = v19;
      v24 = v20;
      v25 = v21;

      __swift_project_boxed_opaque_existential_1(v10, v10[3]);
      v26 = v62;
      v27 = v17;
      v28 = v25;
      sub_1D77F47AC();
      v64[0] = v27;
      v64[1] = v28;
      v30 = _s22FeatureStatusPublisherV5InnerCMa(0, v14, v60, v29);
      MEMORY[0x1D829C838](&unk_1D77F6428, v30);
      sub_1D77F47F4();

      (*(void (**)(char *, uint64_t))(v7 + 8))(v26, v61);
      return sub_1D77D0CB4();
    }
    v59 = v7;
    v33 = v64[0];
    v32 = (void *)sub_1D77F4464();

    swift_willThrow();
    v4 = v14;
    v5 = v60;
  }
  else
  {
    v59 = v7;
    v31 = v64[0];
    v32 = (void *)sub_1D77F4464();

    swift_willThrow();
  }
  if (qword_1EDA12040 != -1)
    swift_once();
  v34 = sub_1D77F486C();
  __swift_project_value_buffer(v34, (uint64_t)qword_1EDA12048);
  v35 = v1;
  v36 = v32;
  v37 = v35;
  v38 = v32;
  v39 = sub_1D77F4854();
  v40 = sub_1D77F4BB4();
  v41 = v40;
  if (os_log_type_enabled(v39, v40))
  {
    v42 = swift_slowAlloc();
    v56 = v41;
    v43 = v42;
    v44 = (_QWORD *)swift_slowAlloc();
    v57 = (void *)swift_slowAlloc();
    v64[0] = v57;
    *(_DWORD *)v43 = 138543618;
    v55 = v39;
    v58 = v4;
    v63 = (uint64_t)v37;
    v45 = v37;
    sub_1D77F4D04();
    *v44 = v37;

    v5 = v60;
    *(_WORD *)(v43 + 12) = 2082;
    swift_getErrorValue();
    v46 = sub_1D77F4E24();
    v63 = sub_1D77C3A1C(v46, v47, (uint64_t *)v64);
    v4 = v58;
    sub_1D77F4D04();
    swift_bridgeObjectRelease();

    v39 = v55;
    _os_log_impl(&dword_1D77C0000, v55, (os_log_type_t)v56, "[%{public}@] Failed to create feature status: %{public}s", (uint8_t *)v43, 0x16u);
    sub_1D77CA580(0, (unint64_t *)&qword_1EDA12070, (uint64_t (*)(uint64_t))sub_1D77D2DB4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v44, -1, -1);
    v48 = v57;
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v48, -1, -1);
    MEMORY[0x1D829C8C8](v43, -1, -1);
  }
  else
  {

  }
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  sub_1D77F47AC();
  v64[0] = v32;
  v49 = v32;
  v51 = _s22FeatureStatusPublisherV5InnerCMa(0, v4, v5, v50);
  MEMORY[0x1D829C838](&unk_1D77F6428, v51);
  v52 = v62;
  sub_1D77F4800();

  (*(void (**)(char *, uint64_t))(v59 + 8))(v52, v61);
  return sub_1D77D0CB4();
}

uint64_t sub_1D77D0CB4()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  id v16;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v3 = (_QWORD *)(*MEMORY[0x1E0DEEDD8] & *v0);
  v4 = v3[10];
  v5 = v3[11];
  v6 = sub_1D77F483C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)aBlock - v9;
  __swift_project_boxed_opaque_existential_1((_QWORD *)((char *)v1 + v3[12]), *(_QWORD *)((char *)v1 + v3[12] + 24));
  sub_1D77F47A0();
  sub_1D77D02B8((uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t))(v7 + 88))(v10, v6) == *MEMORY[0x1E0D2BF38])
  {
    (*(void (**)(char *, uint64_t))(v7 + 96))(v10, v6);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v10, v4);
    objc_msgSend(*(id *)((char *)v1 + *(_QWORD *)((*v2 & *v1) + 0x70)), sel_addObserver_queue_, v1, *(_QWORD *)((char *)v1 + *(_QWORD *)((*v2 & *v1) + 0x80)));
    v11 = *(void **)((char *)v1 + *(_QWORD *)((*v2 & *v1) + 0x78));
    v12 = (void *)sub_1D77F4CA4();
    v13 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = v4;
    v14[3] = v5;
    v14[4] = v13;
    aBlock[4] = sub_1D77D2E64;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1D77D1174;
    aBlock[3] = &block_descriptor_11;
    v15 = _Block_copy(aBlock);
    swift_release();
    v16 = objc_msgSend(v11, sel_addObserverForName_object_queue_usingBlock_, v12, 0, 0, v15);
    _Block_release(v15);
    swift_unknownObjectRelease();

  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return sub_1D77D0EF4(v1);
}

uint64_t sub_1D77D0EF4(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)((char *)a1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *a1) + 0x60));
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  return sub_1D77F47AC();
}

_QWORD *sub_1D77D0F4C(uint64_t a1, uint64_t a2)
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
  char *v12;
  _QWORD *result;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t (*v18)(uint64_t);
  _QWORD v19[3];
  _QWORD aBlock[6];

  v3 = sub_1D77F4A34();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1D77F4A58();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = (_QWORD *)MEMORY[0x1D829C934](a2 + 16);
  if (result)
  {
    v14 = result;
    v19[1] = *(_QWORD *)((char *)result + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *result) + 0x80));
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v14;
    aBlock[4] = sub_1D77D2E94;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1D77CDEB0;
    aBlock[3] = &block_descriptor_17_0;
    v16 = _Block_copy(aBlock);
    v17 = v14;
    sub_1D77F4A4C();
    v19[2] = MEMORY[0x1E0DEE9D8];
    v18 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
    sub_1D77C31B8((unint64_t *)&unk_1EDA11FF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1D77CA580(0, (unint64_t *)&unk_1EDA12000, v18, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1D77CA520();
    sub_1D77F4D28();
    MEMORY[0x1D829C244](0, v12, v7, v16);
    _Block_release(v16);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);

    return (_QWORD *)swift_release();
  }
  return result;
}

uint64_t sub_1D77D1174(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(char *);
  uint64_t v9;

  v2 = sub_1D77F43C8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(char *))(a1 + 32);
  sub_1D77F43BC();
  swift_retain();
  v7(v6);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

id sub_1D77D1218()
{
  _QWORD *v0;

  return objc_msgSend(*(id *)((char *)v0 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70)), sel_removeObserver_, v0);
}

void sub_1D77D1244(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  sub_1D77D2EE4(v7);

}

void sub_1D77D12A8(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  sub_1D77D2FA0(v7);

}

uint64_t sub_1D77D130C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  _QWORD *v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t (*v28)(uint64_t);
  uint64_t v29;
  char *v30;
  char *v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD aBlock[6];

  v1 = *v0;
  v2 = *MEMORY[0x1E0DEEDD8];
  v3 = sub_1D77F4A28();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (uint64_t *)((char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v46 = sub_1D77F4A70();
  v44 = *(_QWORD *)(v46 - 8);
  v9 = MEMORY[0x1E0C80A78](v46, v8);
  v43 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9, v11);
  v45 = (char *)&v36 - v12;
  v42 = sub_1D77F4A34();
  MEMORY[0x1E0C80A78](v42, v13);
  if (qword_1EDA12040 != -1)
    swift_once();
  v14 = sub_1D77F486C();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EDA12048);
  v15 = v0;
  v16 = sub_1D77F4854();
  v17 = sub_1D77F4BCC();
  if (os_log_type_enabled(v16, v17))
  {
    v41 = v3;
    v18 = swift_slowAlloc();
    v39 = v1;
    v19 = (uint8_t *)v18;
    v37 = (_QWORD *)swift_slowAlloc();
    v38 = v2;
    *(_DWORD *)v19 = 138543362;
    aBlock[0] = v15;
    v20 = v15;
    v40 = v7;
    v21 = v4;
    v22 = v20;
    v3 = v41;
    v2 = v38;
    sub_1D77F4D04();
    v23 = v37;
    *v37 = v15;

    v4 = v21;
    v7 = v40;
    _os_log_impl(&dword_1D77C0000, v16, v17, "[%{public}@] Enqueuing send feature status", v19, 0xCu);
    sub_1D77CA580(0, (unint64_t *)&qword_1EDA12070, (uint64_t (*)(uint64_t))sub_1D77D2DB4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v23, -1, -1);
    v24 = v19;
    v1 = v39;
    MEMORY[0x1D829C8C8](v24, -1, -1);

  }
  else
  {

  }
  if (*(uint64_t *)((char *)v15 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v15) + 0x98)))
  {
    swift_retain();
    sub_1D77F4A88();
    swift_release();
  }
  v25 = v2 & v1;
  v26 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v27 = (_QWORD *)swift_allocObject();
  v27[2] = *(_QWORD *)(v25 + 80);
  v27[3] = *(_QWORD *)(v25 + 88);
  v27[4] = v26;
  aBlock[4] = sub_1D77D2E40;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D77CDEB0;
  aBlock[3] = &block_descriptor_2;
  _Block_copy(aBlock);
  v47 = MEMORY[0x1E0DEE9D8];
  v28 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  sub_1D77C31B8((unint64_t *)&unk_1EDA11FF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1D77CA580(0, (unint64_t *)&unk_1EDA12000, v28, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1D77CA520();
  swift_retain();
  sub_1D77F4D28();
  sub_1D77F4A94();
  swift_allocObject();
  v29 = sub_1D77F4A7C();
  swift_release();
  swift_release();
  *(uint64_t *)((char *)v15 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v15) + 0x98)) = v29;
  swift_retain();
  swift_release();
  v30 = v43;
  sub_1D77F4A64();
  *v7 = 100;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x1E0DEF490], v3);
  v31 = v45;
  MEMORY[0x1D829C064](v30, v7);
  (*(void (**)(_QWORD *, uint64_t))(v4 + 8))(v7, v3);
  v32 = *(void (**)(char *, uint64_t))(v44 + 8);
  v33 = v30;
  v34 = v46;
  v32(v33, v46);
  sub_1D77F4C50();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v32)(v31, v34);
}

void sub_1D77D1814(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1D829C934](v1);
  if (v2)
  {
    v3 = (void *)v2;
    sub_1D77D1864();

  }
}

void sub_1D77D1864()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char *v25;
  _QWORD *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char *v31;
  id v32;
  void *v33;

  v1 = (_QWORD *)(*MEMORY[0x1E0DEEDD8] & *v0);
  v2 = v1[10];
  v3 = v1[11];
  v4 = sub_1D77F4824();
  MEMORY[0x1D829C838](MEMORY[0x1E0D2BF28], v4);
  v5 = sub_1D77F4E6C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v31 = (char *)&v26 - v8;
  v9 = (_QWORD *)((char *)v0 + v1[12]);
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  sub_1D77F47A0();
  sub_1D77D1BA4(&v32);
  v10 = v32;
  if (v32)
  {
    v29 = v33;
    v30 = v6;
    __swift_project_boxed_opaque_existential_1(v9, v9[3]);
    sub_1D77F47AC();
    if (qword_1EDA12040 != -1)
      swift_once();
    v11 = sub_1D77F486C();
    __swift_project_value_buffer(v11, (uint64_t)qword_1EDA12048);
    v12 = v0;
    v13 = sub_1D77F4854();
    v14 = sub_1D77F4BCC();
    if (os_log_type_enabled(v13, v14))
    {
      v28 = v2;
      v15 = swift_slowAlloc();
      v27 = v10;
      v16 = (uint8_t *)v15;
      v26 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v16 = 138543362;
      v32 = v12;
      v17 = v5;
      v18 = v12;
      v2 = v28;
      sub_1D77F4D04();
      v19 = v26;
      *v26 = v12;

      v5 = v17;
      _os_log_impl(&dword_1D77C0000, v13, v14, "[%{public}@] Sending feature status", v16, 0xCu);
      sub_1D77CA580(0, (unint64_t *)&qword_1EDA12070, (uint64_t (*)(uint64_t))sub_1D77D2DB4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v19, -1, -1);
      v20 = v16;
      v10 = v27;
      MEMORY[0x1D829C8C8](v20, -1, -1);

    }
    else
    {

    }
    v23 = v29;
    v22 = v30;
    v32 = v10;
    v33 = v29;
    v24 = _s22FeatureStatusPublisherV5InnerCMa(0, v2, v3, v21);
    MEMORY[0x1D829C838](&unk_1D77F6428, v24);
    v25 = v31;
    sub_1D77F47F4();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v5);
    sub_1D77D2DF0(v10, v23);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v9, v9[3]);
    sub_1D77F47AC();
  }
}

void sub_1D77D1BA4(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  v2 = *(void **)((char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x88));
  if (v2 && (v3 = *(void **)((char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x90))) != 0)
  {
    *a1 = v2;
    a1[1] = v3;
    v6 = v3;
    v4 = v2;
    v5 = v6;
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
  }
}

void sub_1D77D1C08()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  os_log_t v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  os_log_t v34;
  id v35;
  void *v36;
  _QWORD *v37;
  id v38;
  _QWORD *v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  unint64_t v48;
  os_log_t v49;
  void (**v50)(_QWORD, _QWORD);
  uint64_t v51;
  os_log_t v52;
  int v53;
  void *v54;
  uint64_t v55;
  os_log_t v56;
  void (**v57)(_QWORD, _QWORD);
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v1 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v2 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x50);
  v3 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58);
  v4 = sub_1D77F4824();
  MEMORY[0x1D829C838](MEMORY[0x1E0D2BF28], v4);
  v5 = sub_1D77F4E6C();
  v57 = *(void (***)(_QWORD, _QWORD))(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v6);
  v56 = (os_log_t)((char *)&v51 - v7);
  if (qword_1EDA12078 != -1)
    swift_once();
  v8 = sub_1D77F486C();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EDA12080);
  v9 = v0;
  v10 = sub_1D77F4854();
  v11 = sub_1D77F4BCC();
  v12 = v11;
  if (os_log_type_enabled(v10, v11))
  {
    v13 = swift_slowAlloc();
    v53 = v12;
    v14 = v13;
    v15 = (_QWORD *)swift_slowAlloc();
    v54 = (void *)swift_slowAlloc();
    v59 = v54;
    *(_DWORD *)v14 = 138543618;
    v58 = (uint64_t)v9;
    v55 = v8;
    v16 = v9;
    v52 = v10;
    v17 = v5;
    v18 = v3;
    v19 = v2;
    v20 = v16;
    v1 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    sub_1D77F4D04();
    *v15 = v9;

    v2 = v19;
    v3 = v18;
    v5 = v17;
    *(_WORD *)(v14 + 12) = 2082;
    v58 = sub_1D77C3A1C(0xD000000000000028, 0x80000001D77F8E60, (uint64_t *)&v59);
    v8 = v55;
    sub_1D77F4D04();
    v21 = v52;
    _os_log_impl(&dword_1D77C0000, v52, (os_log_type_t)v53, "[%{public}@.%{public}s] Notified that notification settings changed, updating downstream.", (uint8_t *)v14, 0x16u);
    sub_1D77CA580(0, (unint64_t *)&qword_1EDA12070, (uint64_t (*)(uint64_t))sub_1D77D2DB4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v15, -1, -1);
    v22 = v54;
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v22, -1, -1);
    MEMORY[0x1D829C8C8](v14, -1, -1);

  }
  else
  {

  }
  v23 = (_QWORD *)((char *)v9 + *(_QWORD *)((*v1 & *v9) + 0x60));
  __swift_project_boxed_opaque_existential_1(v23, v23[3]);
  sub_1D77F47A0();
  v24 = *(void **)((char *)v9 + *(_QWORD *)((*v1 & *v9) + 0x70));
  v59 = 0;
  v25 = objc_msgSend(v24, sel_notificationStatusWithError_, &v59);
  v26 = v59;
  if (v25)
  {
    v27 = *(_QWORD *)((*v1 & *v9) + 0x90);
    v28 = *(void **)((char *)v9 + v27);
    *(_QWORD *)((char *)v9 + v27) = v25;
    v29 = v26;

    sub_1D77D1BA4(&v59);
    v30 = v59;
    if (v59)
    {
      v31 = v60;
      __swift_project_boxed_opaque_existential_1(v23, v23[3]);
      sub_1D77F47AC();
      v59 = v30;
      v60 = v31;
      v33 = _s22FeatureStatusPublisherV5InnerCMa(0, v2, v3, v32);
      MEMORY[0x1D829C838](&unk_1D77F6428, v33);
      v34 = v56;
      sub_1D77F47F4();
      ((void (**)(os_log_t, uint64_t))v57)[1](v34, v5);
      sub_1D77D2DF0(v30, v31);
    }
    else
    {
      __swift_project_boxed_opaque_existential_1(v23, v23[3]);
      sub_1D77F47AC();
    }
  }
  else
  {
    v35 = v59;
    v36 = (void *)sub_1D77F4464();

    swift_willThrow();
    if (qword_1EDA12040 != -1)
      swift_once();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EDA12048);
    v37 = v9;
    v38 = v36;
    v39 = v37;
    v40 = v36;
    v41 = sub_1D77F4854();
    v42 = sub_1D77F4BB4();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v44 = (_QWORD *)swift_slowAlloc();
      v57 = (void (**)(_QWORD, _QWORD))swift_slowAlloc();
      v59 = v57;
      *(_DWORD *)v43 = 138543618;
      v56 = v41;
      v58 = (uint64_t)v39;
      v45 = v39;
      sub_1D77F4D04();
      v46 = v44;
      *v44 = v39;

      *(_WORD *)(v43 + 12) = 2082;
      swift_getErrorValue();
      v47 = sub_1D77F4E24();
      v58 = sub_1D77C3A1C(v47, v48, (uint64_t *)&v59);
      sub_1D77F4D04();
      swift_bridgeObjectRelease();

      v49 = v56;
      _os_log_impl(&dword_1D77C0000, v56, v42, "[%{public}@] Failed to create feature status: %{public}s", (uint8_t *)v43, 0x16u);
      sub_1D77CA580(0, (unint64_t *)&qword_1EDA12070, (uint64_t (*)(uint64_t))sub_1D77D2DB4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v46, -1, -1);
      v50 = v57;
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v50, -1, -1);
      MEMORY[0x1D829C8C8](v43, -1, -1);

    }
    else
    {

    }
    __swift_project_boxed_opaque_existential_1(v23, v23[3]);
    sub_1D77F47AC();

  }
}

id sub_1D77D22E4(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  sub_1D77D2338();

  v2 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1D77D2338()
{
  sub_1D77F4B24();
  sub_1D77F4B24();
  swift_bridgeObjectRelease();
  sub_1D77F4B24();
  sub_1D77F4D88();
  sub_1D77F4B24();
  return 0;
}

void sub_1D77D23F4()
{
  sub_1D77D305C();
}

id sub_1D77D2410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)_s22FeatureStatusPublisherV5InnerCMa(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_1D77D245C(_QWORD *a1)
{
  _QWORD *v2;
  char *v3;
  uint64_t v4;

  v2 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *a1) + 0x60));
  v3 = (char *)a1 + *(_QWORD *)((*v2 & *a1) + 0x68);
  v4 = sub_1D77F483C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  return swift_release();
}

void (*sub_1D77D256C(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1D77D03C0();
  return sub_1D77D25B0;
}

void sub_1D77D25B0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_1D77D25DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _s22FeatureStatusPublisherV5InnerCMa(0, *(_QWORD *)(a2 + 80), *(_QWORD *)(a2 + 88), a4);
  return sub_1D77F47F4();
}

uint64_t sub_1D77D2628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _s22FeatureStatusPublisherV5InnerCMa(0, *(_QWORD *)(a2 + 80), *(_QWORD *)(a2 + 88), a4);
  return sub_1D77F4800();
}

uint64_t sub_1D77D267C()
{
  MEMORY[0x1D829C838](&unk_1D77F6428);
  return sub_1D77F4818();
}

uint64_t sub_1D77D26C4(uint64_t a1)
{
  MEMORY[0x1D829C838](&unk_1D77F6428, a1);
  return sub_1D77F480C();
}

uint64_t sub_1D77D2700()
{
  return sub_1D77F4950();
}

uint64_t _s22FeatureStatusPublisherV5InnerCMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s22FeatureStatusPublisherV5InnerCMn);
}

id sub_1D77D272C(uint64_t a1, void *a2, void *a3, void *a4)
{
  char *v4;
  char *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  objc_class *v27;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v5 = v4;
  v31 = a3;
  v32 = a4;
  v29 = a1;
  v30 = a2;
  v6 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v7 = (_QWORD *)(*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v4);
  v8 = v7[10];
  v9 = v7[11];
  v10 = sub_1D77F483C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (char *)&v29 - v13;
  v15 = (uint64_t *)&v5[v7[12]];
  v16 = sub_1D77F45C0();
  swift_allocObject();
  v17 = v5;
  v18 = sub_1D77F45B4();
  v15[3] = v16;
  v15[4] = sub_1D77C31B8(&qword_1EDA12038, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D4A8], MEMORY[0x1E0D2D480]);
  *v15 = v18;
  *(_QWORD *)&v17[*(_QWORD *)((*v6 & *(_QWORD *)v17) + 0x88)] = 0;
  *(_QWORD *)&v17[*(_QWORD *)((*v6 & *(_QWORD *)v17) + 0x90)] = 0;
  *(_QWORD *)&v17[*(_QWORD *)((*v6 & *(_QWORD *)v17) + 0x98)] = 0;
  sub_1D77F4830();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v17[*(_QWORD *)((*v6 & *(_QWORD *)v17) + 0x68)], v14, v10);
  v19 = v30;
  v20 = v31;
  *(_QWORD *)&v17[*(_QWORD *)((*v6 & *(_QWORD *)v17) + 0x70)] = v30;
  *(_QWORD *)&v17[*(_QWORD *)((*v6 & *(_QWORD *)v17) + 0x78)] = v20;
  v21 = *(_QWORD *)((*v6 & *(_QWORD *)v17) + 0x80);
  v22 = v32;
  *(_QWORD *)&v17[v21] = v32;
  v23 = v19;
  v24 = v20;
  v25 = v22;

  v27 = (objc_class *)_s22FeatureStatusPublisherV5InnerCMa(0, v8, v9, v26);
  v33.receiver = v17;
  v33.super_class = v27;
  return objc_msgSendSuper2(&v33, sel_init, v29);
}

id sub_1D77D2914(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4;
  id v9;

  v9 = objc_allocWithZone((Class)_s22FeatureStatusPublisherV5InnerCMa(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), (uint64_t)a4));
  return sub_1D77D272C(a1, a2, a3, a4);
}

uint64_t sub_1D77D2974()
{
  return MEMORY[0x1E0DEDB38];
}

_QWORD *_s13FeatureStatusVwCP(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

void _s13FeatureStatusVwxx(id *a1)
{

}

uint64_t _s13FeatureStatusVwca(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t _s13FeatureStatusVwta(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t _s13FeatureStatusVwet(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s13FeatureStatusVwst(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus()
{
  return &type metadata for HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatus;
}

_QWORD *_s22FeatureStatusPublisherVwCP(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(void **)(a2 + 16);
  a1[2] = v5;
  v6 = v3;
  v7 = v4;
  v8 = v5;
  return a1;
}

void _s22FeatureStatusPublisherVwxx(id *a1)
{

}

uint64_t _s22FeatureStatusPublisherVwca(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  v10 = *(void **)(a2 + 16);
  v11 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  v12 = v10;

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

uint64_t _s22FeatureStatusPublisherVwta(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  return a1;
}

uint64_t _s22FeatureStatusPublisherVwet(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s22FeatureStatusPublisherVwst(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatusPublisher()
{
  return &type metadata for HKMobilityWalkingSteadinessFeatureStatusManager.FeatureStatusPublisher;
}

uint64_t sub_1D77D2CE0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1D77F483C();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_1D77D2D7C()
{
  JUMPOUT(0x1D829C838);
}

uint64_t sub_1D77D2D8C(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 88);
}

void sub_1D77D2D94()
{
  JUMPOUT(0x1D829C838);
}

void sub_1D77D2DA4()
{
  JUMPOUT(0x1D829C838);
}

unint64_t sub_1D77D2DB4()
{
  unint64_t result;

  result = qword_1EDA12068;
  if (!qword_1EDA12068)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDA12068);
  }
  return result;
}

void sub_1D77D2DF0(void *a1, void *a2)
{
  if (a1)
  {

  }
}

uint64_t sub_1D77D2E1C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1D77D2E40()
{
  uint64_t v0;

  sub_1D77D1814(*(_QWORD *)(v0 + 32));
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

_QWORD *sub_1D77D2E64(uint64_t a1)
{
  uint64_t v1;

  return sub_1D77D0F4C(a1, *(_QWORD *)(v1 + 32));
}

uint64_t sub_1D77D2E70()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1D77D2E94()
{
  sub_1D77D1C08();
}

uint64_t sub_1D77D2EB4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1D77D2ED8()
{
  uint64_t v0;

  sub_1D77D06C0(*(_QWORD *)(v0 + 32));
}

uint64_t sub_1D77D2EE4(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = v1;
  v4 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v5 = (_QWORD *)((char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x60));
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1D77F47A0();
  v6 = *(_QWORD *)((*v4 & *v1) + 0x88);
  v7 = *(void **)((char *)v1 + v6);
  *(_QWORD *)((char *)v2 + v6) = a1;
  v8 = a1;

  sub_1D77D130C();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  return sub_1D77F47AC();
}

uint64_t sub_1D77D2FA0(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = v1;
  v4 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v5 = (_QWORD *)((char *)v1 + *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x60));
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1D77F47A0();
  v6 = *(_QWORD *)((*v4 & *v1) + 0x90);
  v7 = *(void **)((char *)v1 + v6);
  *(_QWORD *)((char *)v2 + v6) = a1;
  v8 = a1;

  sub_1D77D130C();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  return sub_1D77F47AC();
}

void sub_1D77D305C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1D829C7E4](a1, v6, a5);
}

id WalkingSteadinessOnboardingStartViewController.__allocating_init()()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return WalkingSteadinessOnboardingStartViewController.init()();
}

uint64_t sub_1D77D3104()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1D77F486C();
  __swift_allocate_value_buffer(v0, qword_1F012F4A0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F4A0);
  if (qword_1F012EBF0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F6F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void WalkingSteadinessOnboardingStartViewController.stage.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_stage);
}

uint64_t sub_1D77D31A8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  swift_beginAccess();
  return MEMORY[0x1D829C934](v1);
}

uint64_t sub_1D77D31F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_1D77D325C(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x1D829C934](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1D77C4738;
}

id WalkingSteadinessOnboardingStartViewController.init()()
{
  _BYTE *v0;
  _QWORD *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  id v13;
  objc_super v15;

  v1 = &v0[OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_baseIdentifier];
  *v1 = 0xD000000000000024;
  v1[1] = 0x80000001D77F8F20;
  v0[OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_stage] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  if (qword_1F012EBC8 != -1)
    swift_once();
  v2 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v3 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v4 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v5 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  if (qword_1EDA12030 != -1)
    swift_once();
  v6 = (id)qword_1EDA11EC0;
  v7 = (void *)sub_1D77F4ADC();
  v8 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v7, v6, 0, 0xE000000000000000);

  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingStartViewController();
  v9 = objc_msgSendSuper2(&v15, sel_initWithTitle_detailText_icon_contentLayout_, v3, v5, v8, 2);

  v10 = v9;
  v11 = objc_msgSend(v10, sel_headerView);
  LODWORD(v12) = 1036831949;
  objc_msgSend(v11, sel_setTitleHyphenationFactor_, v12);

  v13 = objc_msgSend(v10, sel_headerView);
  objc_msgSend(v13, sel_setAllowFullWidthIcon_, 1);

  return v10;
}

void sub_1D77D35B4()
{
  void *v0;
  uint64_t ObjectType;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  ObjectType = swift_getObjectType();
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingStartViewController();
  objc_msgSendSuper2(&v7, sel_viewDidLoad);
  sub_1D77CA580(0, (unint64_t *)&qword_1F012F4D0, (uint64_t (*)(uint64_t))sub_1D77D3F4C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1D77F64E0;
  v3 = sub_1D77F4884();
  v4 = MEMORY[0x1E0DC2160];
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = v4;
  *(_QWORD *)(swift_allocObject() + 16) = ObjectType;
  sub_1D77F4C08();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v5 = (void *)sub_1D77F4ADC();

  v6 = (void *)sub_1D77F4ADC();
}

void sub_1D77D3744(void *a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  uint64_t v17;

  v2 = objc_msgSend(a1, sel_traitCollection);
  if (qword_1EDA12030 != -1)
    swift_once();
  v3 = (id)qword_1EDA11EC0;
  v4 = v2;
  v5 = (void *)sub_1D77F4ADC();
  v6 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v5, v3, v4);

  if (v6)
  {
    v15 = objc_msgSend(a1, sel_headerView);
    objc_msgSend(v15, sel_setIcon_accessibilityLabel_, v6, 0);

  }
  else
  {
    if (qword_1F012EBB0 != -1)
      swift_once();
    v7 = sub_1D77F486C();
    __swift_project_value_buffer(v7, (uint64_t)qword_1F012F4A0);
    v15 = a1;
    v8 = sub_1D77F4854();
    v9 = sub_1D77F4BC0();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = swift_slowAlloc();
      v11 = (_QWORD *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v17 = v12;
      *(_DWORD *)v10 = 136446466;
      v13 = sub_1D77F4E78();
      sub_1D77C3A1C(v13, v14, &v17);
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2112;
      v16 = objc_msgSend(v15, sel_traitCollection);
      sub_1D77F4D04();
      *v11 = v16;

      _os_log_impl(&dword_1D77C0000, v8, v9, "[%{public}s] Unable to load icon for %@", (uint8_t *)v10, 0x16u);
      sub_1D77CA580(0, (unint64_t *)&qword_1EDA12070, (uint64_t (*)(uint64_t))sub_1D77D2DB4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v11, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v12, -1, -1);
      MEMORY[0x1D829C8C8](v10, -1, -1);

      return;
    }

  }
}

id WalkingSteadinessOnboardingStartViewController.__allocating_init(title:detailText:symbolName:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_class *v7;
  objc_class *v8;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = v7;
  v12 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    v13 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  v13 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v14 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
LABEL_6:
  v15 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_contentLayout_, v12, v13, v14, a7);

  return v15;
}

void WalkingSteadinessOnboardingStartViewController.init(title:detailText:symbolName:contentLayout:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WalkingSteadinessOnboardingStartViewController.__allocating_init(title:detailText:icon:contentLayout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  objc_class *v6;
  objc_class *v7;
  void *v11;
  void *v12;
  id v13;

  v7 = v6;
  v11 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v12 = (void *)sub_1D77F4ADC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_contentLayout_, v11, v12, a5, a6);

  return v13;
}

void WalkingSteadinessOnboardingStartViewController.init(title:detailText:icon:contentLayout:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WalkingSteadinessOnboardingStartViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingStartViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1D77D3F18(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_stage);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingStartViewController()
{
  return objc_opt_self();
}

unint64_t sub_1D77D3F4C()
{
  unint64_t result;

  result = qword_1F012F4D8;
  if (!qword_1F012F4D8)
  {
    sub_1D77D3F84();
    result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012F4D8);
  }
  return result;
}

unint64_t sub_1D77D3F84()
{
  unint64_t result;

  result = qword_1F012F4E0;
  if (!qword_1F012F4E0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012F4E0);
  }
  return result;
}

uint64_t sub_1D77D3FD8()
{
  return swift_deallocObject();
}

void sub_1D77D3FE8(void *a1)
{
  sub_1D77D3744(a1);
}

uint64_t sub_1D77D3FF0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1D77D4048(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t method lookup function for WalkingSteadinessOnboardingStartViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingStartViewController.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingStartViewController.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingStartViewController.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingStartViewController.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1D77D4110()
{
  uint64_t v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1D77D414C
                                                                     + 4
                                                                     * byte_1D77F6550[*(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep)]))(0xD000000000000016, 0x80000001D77F7FF0);
}

uint64_t sub_1D77D414C()
{
  return 0x446D7269666E6F63;
}

uint64_t sub_1D77D4170(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_1D77D4188()
{
  return 0x6163696669746F6ELL;
}

uint64_t sub_1D77D41AC()
{
  return 0x6974656C706D6F63;
}

id sub_1D77D4214()
{
  void *v0;

  v0 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1D77D42B0()
{
  return sub_1D77F4DE8();
}

uint64_t sub_1D77D4348()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_presentation);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1D77D43CC()
{
  id v0;
  uint64_t v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_activeWatchProductType);
  v1 = sub_1D77F4AE8();

  return v1;
}

uint64_t sub_1D77D44B0(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t result;
  void *v6;

  if (*(_BYTE *)(v1
                + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep) != 1)
    return 0;
  if ((*(_BYTE *)(v1
                 + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_defaultDetailItems
                 + 8) & 1) != 0)
  {
    if (a1)
    {
      type metadata accessor for HKError(0);
      sub_1D77D4C48(MEMORY[0x1E0DEE9D8]);
      sub_1D77D4D6C();
      sub_1D77F444C();
      v3 = (void *)sub_1D77F4458();

      v4 = v3;
      result = 0;
      *a1 = v3;
      return result;
    }
    return 0;
  }
  return sub_1D77F4B6C();
}

uint64_t sub_1D77D45BC(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t result;
  void *v6;

  if (*(_BYTE *)(v1
                + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep) != 1)
    return 0;
  if ((*(_BYTE *)(v1
                 + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_defaultDetailItems
                 + 8) & 1) != 0)
  {
    if (a1)
    {
      type metadata accessor for HKError(0);
      sub_1D77D4C48(MEMORY[0x1E0DEE9D8]);
      sub_1D77D4D6C();
      sub_1D77F444C();
      v3 = (void *)sub_1D77F4458();

      v4 = v3;
      result = 0;
      *a1 = v3;
      return result;
    }
    return 0;
  }
  return sub_1D77F4B6C();
}

uint64_t sub_1D77D46C8(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t result;
  void *v6;

  if (*(_BYTE *)(v1
                + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep) != 1)
    return 0;
  if ((*(_BYTE *)(v1
                 + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_changedDetailItems
                 + 8) & 1) != 0)
  {
    if (a1)
    {
      type metadata accessor for HKError(0);
      sub_1D77D4C48(MEMORY[0x1E0DEE9D8]);
      sub_1D77D4D6C();
      sub_1D77F444C();
      v3 = (void *)sub_1D77F4458();

      v4 = v3;
      result = 0;
      *a1 = v3;
      return result;
    }
    return 0;
  }
  return sub_1D77F4B6C();
}

uint64_t sub_1D77D47D8(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t result;
  void *v6;

  if (*(_BYTE *)(v1
                + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep) != 1)
    return 0;
  if ((*(_BYTE *)(v1
                 + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_changedDetailItems
                 + 8) & 1) != 0)
  {
    if (a1)
    {
      type metadata accessor for HKError(0);
      sub_1D77D4C48(MEMORY[0x1E0DEE9D8]);
      sub_1D77D4D6C();
      sub_1D77F444C();
      v3 = (void *)sub_1D77F4458();

      v4 = v3;
      result = 0;
      *a1 = v3;
      return result;
    }
    return 0;
  }
  return sub_1D77F4B6C();
}

uint64_t sub_1D77D48E8()
{
  uint64_t v0;

  if (*(_BYTE *)(v0
                + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep) == 3
    && *(_BYTE *)(v0
                + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_acceptDefaults) != 2)
  {
    return sub_1D77F4B6C();
  }
  else
  {
    return 0;
  }
}

id sub_1D77D4980(_QWORD *a1)
{
  return sub_1D77D4A50(a1, (SEL *)&selRef_ageWithHealthStore_error_);
}

id sub_1D77D4A04(_QWORD *a1)
{
  return sub_1D77D4A50(a1, (SEL *)&selRef_biologicalSexWithHealthStore_error_);
}

id sub_1D77D4A50(_QWORD *a1, SEL *a2)
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v14[2];

  v14[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_self();
  v6 = *(_QWORD *)(v2
                 + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_healthStore);
  v14[0] = 0;
  v7 = objc_msgSend(v5, *a2, v6, v14);
  v8 = v14[0];
  if (!v7)
  {
    v9 = v8;
    v10 = (void *)sub_1D77F4464();

    swift_willThrow();
    if (a1)
    {
      v11 = (void *)sub_1D77F4458();
      v12 = v11;
      *a1 = v11;
    }

    return 0;
  }
  return v7;
}

id WalkingSteadinessAnalyticsOnboardingEventDataSource.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void WalkingSteadinessAnalyticsOnboardingEventDataSource.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WalkingSteadinessAnalyticsOnboardingEventDataSource.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessAnalyticsOnboardingEventDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1D77D4C48(uint64_t a1)
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
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  sub_1D77D4F14();
  v2 = sub_1D77F4DB8();
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
    sub_1D77D4FE0(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_1D77D4F7C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1D77D508C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1D77D4D6C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F012EDD0;
  if (!qword_1F012EDD0)
  {
    type metadata accessor for HKError(255);
    result = MEMORY[0x1D829C838](&unk_1D77F5AB0, v1);
    atomic_store(result, (unint64_t *)&qword_1F012EDD0);
  }
  return result;
}

uint64_t type metadata accessor for WalkingSteadinessAnalyticsOnboardingEventDataSource()
{
  return objc_opt_self();
}

uint64_t method lookup function for WalkingSteadinessAnalyticsOnboardingEventDataSource()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.stepWithError(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.featureVersionWithError(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.provenanceWithError(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.activeWatchProductTypeWithError(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.hasDefaultHeightWithError(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.hasDefaultWeightWithError(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.acceptDefaultHeightWithError(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.acceptDefaultWeightWithError(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.acceptDefaultNotificationsWithError(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.ageWithError(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of WalkingSteadinessAnalyticsOnboardingEventDataSource.biologicalSexWithError(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

void sub_1D77D4F14()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012F5D0)
  {
    v0 = sub_1D77F4DC4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012F5D0);
  }
}

unint64_t sub_1D77D4F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77F4E3C();
  sub_1D77F4B18();
  v4 = sub_1D77F4E54();
  return sub_1D77D509C(a1, a2, v4);
}

uint64_t sub_1D77D4FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77D5024();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1D77D5024()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1F012F5D8)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1F012F5D8);
  }
}

_OWORD *sub_1D77D508C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1D77D509C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_1D77F4E00() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_1D77F4E00() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_1D77F4E00() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

void sub_1D77D51E0()
{
  id v0;
  double v1;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_meterUnitWithMetricPrefix_, 5);
  objc_msgSend((id)objc_opt_self(), sel_defaultCentimeterValue);
  v2 = objc_msgSend((id)objc_opt_self(), sel_quantityWithUnit_doubleValue_, v0, v1);

  qword_1F0133090 = (uint64_t)v2;
}

uint64_t sub_1D77D527C()
{
  type metadata accessor for PickerTableViewCell();
  sub_1D77D52B0();
  return sub_1D77F4698();
}

unint64_t sub_1D77D52B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F012F5E0;
  if (!qword_1F012F5E0)
  {
    v1 = type metadata accessor for PickerTableViewCell();
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for PickerTableViewCell, v1);
    atomic_store(result, (unint64_t *)&qword_1F012F5E0);
  }
  return result;
}

uint64_t sub_1D77D52F8()
{
  swift_getObjectType();
  sub_1D77D5330();
  return sub_1D77F4B00();
}

unint64_t sub_1D77D5330()
{
  unint64_t result;

  result = qword_1F012F5E8;
  if (!qword_1F012F5E8)
  {
    type metadata accessor for HeightPickerItem();
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012F5E8);
  }
  return result;
}

uint64_t type metadata accessor for HeightPickerItem()
{
  return objc_opt_self();
}

uint64_t sub_1D77D5384()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate;
  swift_beginAccess();
  return MEMORY[0x1D829C934](v1);
}

uint64_t sub_1D77D53D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1D77D5438(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x1D829C934](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1D77C4D1C;
}

uint64_t sub_1D77D54AC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  char v8;
  char v10;

  v1 = OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem____lazy_storage___usesImperialUnits;
  v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem____lazy_storage___usesImperialUnits);
  if (v2 == 2)
  {
    v3 = v0;
    sub_1D77D6630();
    v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter + 24);
    v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter + 32);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter), v4);
    v10 = 1;
    v6 = (void *)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 8))(&v10, v4, v5);
    v7 = objc_msgSend((id)objc_opt_self(), sel_footUnit);
    v8 = sub_1D77F4CE0();

    *(_BYTE *)(v3 + v1) = v8 & 1;
  }
  else
  {
    v8 = v2 & 1;
  }
  return v8 & 1;
}

uint64_t sub_1D77D5590(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D77D55F8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1D77D564C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1D77D56A8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id HeightPickerItem.__allocating_init(initialValue:valueFormatter:)(void *a1, uint64_t a2)
{
  objc_class *v2;
  _BYTE *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  _BYTE *v9;
  id v10;
  id v11;
  objc_super v13;

  v5 = objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v6 = OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight;
  *(_QWORD *)&v5[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight] = 0;
  v5[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem____lazy_storage___usesImperialUnits] = 2;
  v7 = &v5[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier];
  *v7 = 0;
  v7[1] = 0;
  v8 = *(void **)&v5[v6];
  *(_QWORD *)&v5[v6] = a1;
  v9 = v5;
  v10 = a1;

  sub_1D77C4434(a2, (uint64_t)&v9[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter]);
  v13.receiver = v9;
  v13.super_class = v2;
  v11 = objc_msgSendSuper2(&v13, sel_init);

  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v11;
}

id HeightPickerItem.init(initialValue:valueFormatter:)(void *a1, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _BYTE *v8;
  id v9;
  id v10;
  objc_super v12;

  *(_QWORD *)&v2[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v5 = OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight] = 0;
  v2[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem____lazy_storage___usesImperialUnits] = 2;
  v6 = &v2[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier];
  *v6 = 0;
  v6[1] = 0;
  v7 = *(void **)&v2[v5];
  *(_QWORD *)&v2[v5] = a1;
  v8 = v2;
  v9 = a1;

  sub_1D77C4434(a2, (uint64_t)&v8[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter]);
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for HeightPickerItem();
  v10 = objc_msgSendSuper2(&v12, sel_init);

  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v10;
}

id HeightPickerItem.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void HeightPickerItem.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HeightPickerItem.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeightPickerItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D77D59A8()
{
  swift_getObjectType();
  sub_1D77D5330();
  return sub_1D77F4B00();
}

uint64_t sub_1D77D59E0()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(*v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1D77D5A38(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v5;

  v5 = (_QWORD *)(*v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1D77D5A98())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t HeightPickerItem.initialSelections.getter()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight);
  if (!v1)
  {
    if (qword_1F012EBB8 != -1)
      goto LABEL_13;
    goto LABEL_4;
  }
  v2 = *(id *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight);
  while (1)
  {
    v3 = v1;
    if ((sub_1D77D54AC() & 1) == 0)
      break;
    sub_1D77D5ED0(v2);
    v5 = v4;
    v7 = v6;
    sub_1D77D5BF4();
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1D77F5EA0;
    if (!__OFSUB__(v5, 1))
    {
      v9 = v8;
      *(_QWORD *)(v8 + 32) = v5 - 1;
      *(_QWORD *)(v8 + 40) = 0;
      *(_QWORD *)(v8 + 48) = v7;
      *(_QWORD *)(v8 + 56) = 1;
      goto LABEL_10;
    }
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    swift_once();
LABEL_4:
    v2 = (id)qword_1F0133090;
    v1 = 0;
  }
  sub_1D77D5BF4();
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1D77F64E0;
  sub_1D77D5FD8(v2);
  if (__OFSUB__(v10, 30))
    goto LABEL_12;
  *(_QWORD *)(v9 + 32) = v10 - 30;
  *(_QWORD *)(v9 + 40) = 0;
LABEL_10:

  return v9;
}

void sub_1D77D5BF4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012FD50)
  {
    sub_1D77D5C48();
    v0 = sub_1D77F4DF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012FD50);
  }
}

void sub_1D77D5C48()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1F012F620)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1F012F620);
  }
}

Swift::Int __swiftcall HeightPickerItem.numberOfComponents(in:)(UIPickerView *in)
{
  if ((sub_1D77D54AC() & 1) != 0)
    return 2;
  else
    return 1;
}

Swift::Int __swiftcall HeightPickerItem.pickerView(_:numberOfRowsInComponent:)(UIPickerView *_, Swift::Int numberOfRowsInComponent)
{
  char v3;
  Swift::Int v4;
  Swift::Int v5;

  v3 = sub_1D77D54AC();
  v4 = 246;
  if (numberOfRowsInComponent)
    v4 = 0;
  v5 = 12;
  if (numberOfRowsInComponent != 1)
    v5 = 0;
  if (!numberOfRowsInComponent)
    v5 = 9;
  if ((v3 & 1) != 0)
    return v5;
  else
    return v4;
}

Swift::String_optional __swiftcall HeightPickerItem.pickerView(_:titleForRow:forComponent:)(UIPickerView *_, Swift::Int titleForRow, Swift::Int forComponent)
{
  id v3;
  void *v4;
  Swift::String_optional result;

  v3 = sub_1D77D60C4(titleForRow, forComponent);
  result.value._object = v4;
  result.value._countAndFlagsBits = (uint64_t)v3;
  return result;
}

void sub_1D77D5ED0(void *a1)
{
  id v2;
  double v3;
  double v4;
  double v5;

  v2 = objc_msgSend((id)objc_opt_self(), sel_inchUnit);
  objc_msgSend(a1, sel_doubleValueForUnit_, v2);
  v4 = v3;

  v5 = round(v4);
  if ((~*(_QWORD *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v5 < 9.22337204e18)
  {
    sub_1D77F4AC4();
    return;
  }
LABEL_7:
  __break(1u);
}

void sub_1D77D5FD8(void *a1)
{
  id v2;
  double v3;
  double v4;
  double v5;

  v2 = objc_msgSend((id)objc_opt_self(), sel_meterUnitWithMetricPrefix_, 5);
  objc_msgSend(a1, sel_doubleValueForUnit_, v2);
  v4 = v3;

  v5 = round(v4);
  if ((~*(_QWORD *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v5 < 9.22337204e18)
  {
    sub_1D77F4AC4();
    return;
  }
LABEL_7:
  __break(1u);
}

id sub_1D77D60C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id result;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  char v14;

  if ((sub_1D77D54AC() & 1) == 0)
  {
    if (a2)
      return 0;
    result = objc_msgSend((id)objc_opt_self(), sel_meterUnitWithMetricPrefix_, 5);
    if (!__OFADD__(a1, 30))
    {
      v8 = result;
      v9 = objc_msgSend((id)objc_opt_self(), sel_quantityWithUnit_doubleValue_, result, (double)(a1 + 30));

      v10 = *(_QWORD *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter + 24);
      v11 = *(_QWORD *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter + 32);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter), v10);
      v14 = 1;
      v12 = (*(uint64_t (**)(char *, id, uint64_t, uint64_t))(v11 + 16))(&v14, v9, v10, v11);

      return (id)v12;
    }
    __break(1u);
    goto LABEL_17;
  }
  if (a2 != 1)
  {
    if (a2)
      return 0;
    result = objc_msgSend((id)objc_opt_self(), sel_sharedFormatter);
    if (!result)
      goto LABEL_18;
    if (!__OFADD__(a1, 1))
    {
      v6 = result;
      v7 = objc_msgSend(result, sel_formattedValueForFeet_, (double)(a1 + 1));
      goto LABEL_12;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  result = objc_msgSend((id)objc_opt_self(), sel_sharedFormatter);
  if (result)
  {
    v6 = result;
    v7 = objc_msgSend(result, sel_formattedValueForInches_, (double)a1);
LABEL_12:
    v13 = v7;

    if (v13)
    {
      v12 = sub_1D77F4AE8();

      return (id)v12;
    }
    return 0;
  }
LABEL_19:
  __break(1u);
  return result;
}

void _s16HealthMobilityUI16HeightPickerItemC10pickerView_12didSelectRow11inComponentySo08UIPickerH0C_S2itF_0(void *a1, uint64_t a2)
{
  uint64_t v2;
  char *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t ObjectType;

  if ((sub_1D77D54AC() & 1) == 0)
  {
    v11 = __OFADD__(a2, 30);
    v9 = a2 + 30;
    if (!v11)
    {
      v10 = objc_msgSend((id)objc_opt_self(), sel_meterUnitWithMetricPrefix_, 5);
      goto LABEL_8;
    }
LABEL_14:
    __break(1u);
    return;
  }
  v5 = (char *)objc_msgSend(a1, sel_selectedRowInComponent_, 0);
  v6 = (uint64_t)(v5 + 1);
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_12;
  }
  v7 = objc_msgSend(a1, sel_selectedRowInComponent_, 1);
  v8 = 12 * v6;
  if ((unsigned __int128)(v6 * (__int128)12) >> 64 != (12 * v6) >> 63)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v9 = (uint64_t)v7 + v8;
  if (__OFADD__(v8, v7))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v10 = objc_msgSend((id)objc_opt_self(), sel_inchUnit);
LABEL_8:
  v12 = v10;
  v13 = objc_msgSend((id)objc_opt_self(), sel_quantityWithUnit_doubleValue_, v12, (double)v9);

  v14 = *(void **)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight) = v13;
  v15 = v13;

  v16 = v2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate;
  swift_beginAccess();
  if (MEMORY[0x1D829C934](v16))
  {
    v17 = *(_QWORD *)(v16 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v17 + 8))(v2, v15, ObjectType, v17);
    swift_unknownObjectRelease();
  }

}

uint64_t sub_1D77D6424@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate;
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1D77D647C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1D77D64DC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of HeightPickerItemDelegate.heightPickerItem(_:didSelectHeight:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t method lookup function for HeightPickerItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HeightPickerItem.reuseIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of HeightPickerItem.uniqueIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of HeightPickerItem.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of HeightPickerItem.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of HeightPickerItem.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of HeightPickerItem.baseIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of HeightPickerItem.baseIdentifier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of HeightPickerItem.baseIdentifier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of HeightPickerItem.__allocating_init(initialValue:valueFormatter:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 232))();
}

unint64_t sub_1D77D6630()
{
  unint64_t result;

  result = qword_1F012F650;
  if (!qword_1F012F650)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012F650);
  }
  return result;
}

uint64_t localized(_:locale:source:value:comment:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result;
  uint64_t v10;

  result = sub_1D77F43F8();
  if (*(_QWORD *)(a9 + 16))
  {
    v10 = sub_1D77F4AF4();
    swift_bridgeObjectRelease();
    return v10;
  }
  return result;
}

id sub_1D77D66FC()
{
  if (qword_1EDA12030 != -1)
    swift_once();
  qword_1F012F660 = qword_1EDA11EC0;
  *(_QWORD *)algn_1F012F668 = 0xD00000000000001CLL;
  qword_1F012F670 = 0x80000001D77F9380;
  return (id)qword_1EDA11EC0;
}

HealthMobilityUI::LocalizationSource __swiftcall LocalizationSource.init(bundle:table:)(NSBundle bundle, Swift::String table)
{
  uint64_t v2;
  HealthMobilityUI::LocalizationSource result;

  *(NSBundle *)v2 = bundle;
  *(Swift::String *)(v2 + 8) = table;
  result.table = table;
  result.bundle = bundle;
  return result;
}

uint64_t static LocalizationSource.main.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (qword_1F012EBC0 != -1)
    swift_once();
  v2 = (void *)qword_1F012F660;
  v3 = *(_QWORD *)algn_1F012F668;
  v4 = qword_1F012F670;
  *a1 = qword_1F012F660;
  a1[1] = v3;
  a1[2] = v4;
  v5 = v2;
  return swift_bridgeObjectRetain();
}

id sub_1D77D67D4()
{
  if (qword_1EDA12030 != -1)
    swift_once();
  qword_1F012F678 = qword_1EDA11EC0;
  unk_1F012F680 = 0xD00000000000001DLL;
  qword_1F012F688 = 0x80000001D77F9360;
  return (id)qword_1EDA11EC0;
}

uint64_t static LocalizationSource.walkingSteadiness.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (qword_1F012EBC8 != -1)
    swift_once();
  v2 = (void *)qword_1F012F678;
  v3 = unk_1F012F680;
  v4 = qword_1F012F688;
  *a1 = qword_1F012F678;
  a1[1] = v3;
  a1[2] = v4;
  v5 = v2;
  return swift_bridgeObjectRetain();
}

id sub_1D77D68A0()
{
  if (qword_1F012EC78 != -1)
    swift_once();
  qword_1F012F690 = qword_1F0133130;
  *(_QWORD *)algn_1F012F698 = 0xD000000000000014;
  qword_1F012F6A0 = 0x80000001D77F9340;
  return (id)qword_1F0133130;
}

uint64_t static LocalizationSource.healthUI.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (qword_1F012EBD0 != -1)
    swift_once();
  v2 = (void *)qword_1F012F690;
  v3 = *(_QWORD *)algn_1F012F698;
  v4 = qword_1F012F6A0;
  *a1 = qword_1F012F690;
  a1[1] = v3;
  a1[2] = v4;
  v5 = v2;
  return swift_bridgeObjectRetain();
}

id sub_1D77D696C()
{
  if (qword_1F012EC80 != -1)
    swift_once();
  qword_1F012F6A8 = qword_1F0133138;
  unk_1F012F6B0 = 0xD00000000000001DLL;
  qword_1F012F6B8 = 0x80000001D77F9320;
  return (id)qword_1F0133138;
}

uint64_t static LocalizationSource.legacy.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (qword_1F012EBD8 != -1)
    swift_once();
  v2 = (void *)qword_1F012F6A8;
  v3 = unk_1F012F6B0;
  v4 = qword_1F012F6B8;
  *a1 = qword_1F012F6A8;
  a1[1] = v3;
  a1[2] = v4;
  v5 = v2;
  return swift_bridgeObjectRetain();
}

uint64_t localized(_:locale:source:value:comment:arguments:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result;
  uint64_t v10;

  result = sub_1D77F43F8();
  if (*(_QWORD *)(a9 + 16))
  {
    v10 = sub_1D77F4AF4();
    swift_bridgeObjectRelease();
    return v10;
  }
  return result;
}

uint64_t String.localized(source:locale:value:comment:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1D77F43F8();
  if (*(_QWORD *)(a7 + 16))
  {
    v9 = sub_1D77F4AF4();
    swift_bridgeObjectRelease();
    return v9;
  }
  return result;
}

uint64_t LocalizationSource.localized(_:locale:value:comment:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v10;

  result = sub_1D77F43F8();
  if (*(_QWORD *)(a8 + 16))
  {
    v10 = sub_1D77F4AF4();
    swift_bridgeObjectRelease();
    return v10;
  }
  return result;
}

id HKMobilityLocalizedString()
{
  id v0;
  void *v1;

  sub_1D77F4AE8();
  if (qword_1F012EBC0 != -1)
    swift_once();
  v0 = (id)qword_1F012F660;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v1 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  return v1;
}

Swift::String __swiftcall localizedStringForObjC(_:)(Swift::String a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  Swift::String result;

  if (qword_1F012EBC0 != -1)
    swift_once();
  v1 = (id)qword_1F012F660;
  swift_bridgeObjectRetain();
  v2 = sub_1D77F43F8();
  v4 = v3;
  swift_bridgeObjectRelease();

  v5 = v2;
  v6 = v4;
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

id HKMobilityHBXLocalizedString()
{
  id v0;
  void *v1;

  sub_1D77F4AE8();
  if (qword_1F012EBD8 != -1)
    swift_once();
  v0 = (id)qword_1F012F6A8;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v1 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  return v1;
}

Swift::String __swiftcall localizedHBXStringForObjC(_:)(Swift::String a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  Swift::String result;

  if (qword_1F012EBD8 != -1)
    swift_once();
  v1 = (id)qword_1F012F6A8;
  swift_bridgeObjectRetain();
  v2 = sub_1D77F43F8();
  v4 = v3;
  swift_bridgeObjectRelease();

  v5 = v2;
  v6 = v4;
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t destroy for LocalizationSource(id *a1)
{

  return swift_bridgeObjectRelease();
}

_QWORD *_s16HealthMobilityUI18LocalizationSourceVwCP_0(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  a1[2] = *(_QWORD *)(a2 + 16);
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LocalizationSource(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for LocalizationSource(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v5 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for LocalizationSource()
{
  return &type metadata for LocalizationSource;
}

uint64_t static DeepLink.openMotionAndFitnessSettings()()
{
  return sub_1D77F4B0C();
}

unint64_t static DeepLink.walkingSteadinessKnowledgeBaseLink.getter()
{
  return 0xD000000000000025;
}

unint64_t static DeepLink.motionAndFitnessSettingsLink.getter()
{
  return 0xD00000000000001ELL;
}

unint64_t static DeepLink.walkingSteadinessRegionGatedLink.getter()
{
  return 0xD00000000000002FLL;
}

uint64_t static DeepLink.heightDataTypeDetailLink.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  sub_1D77D7284();
  v2 = MEMORY[0x1E0C80A78](v0, v1);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2, v5);
  v7 = (char *)&v15 - v6;
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D28E60]), sel_init);
  sub_1D77D72D8();
  v9 = (void *)MEMORY[0x1D829C19C]((id)*MEMORY[0x1E0CB5CC0]);
  v10 = objc_msgSend(v8, sel_URLForDataTypeDetailWithObjectType_, v9);

  if (v10)
  {
    sub_1D77F447C();

    v11 = sub_1D77F4488();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v4, 0, 1, v11);
  }
  else
  {
    v11 = sub_1D77F4488();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v4, 1, 1, v11);
  }
  sub_1D77D7314((uint64_t)v4, (uint64_t)v7);
  sub_1D77F4488();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) == 1)
  {
    sub_1D77D7358((uint64_t)v7);
    v13 = 0;
  }
  else
  {
    v13 = sub_1D77F4470();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v11);
  }

  return v13;
}

void sub_1D77D7284()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012F030)
  {
    sub_1D77F4488();
    v0 = sub_1D77F4CF8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012F030);
  }
}

unint64_t sub_1D77D72D8()
{
  unint64_t result;

  result = qword_1F012F6C0;
  if (!qword_1F012F6C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012F6C0);
  }
  return result;
}

uint64_t sub_1D77D7314(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77D7284();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D77D7358(uint64_t a1)
{
  uint64_t v2;

  sub_1D77D7284();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t static DeepLink.healthProfileLink.getter()
{
  return 0xD00000000000001ELL;
}

uint64_t static DeepLink.openWalkingSteadinessAgeGatedLearnMore()()
{
  return sub_1D77F4B0C();
}

uint64_t static DeepLink.openWalkingSteadinessRegionGatedLearnMore()()
{
  return sub_1D77F4B0C();
}

ValueMetadata *type metadata accessor for DeepLink()
{
  return &type metadata for DeepLink;
}

uint64_t sub_1D77D73FC()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1D77F4B30();
  qword_1EDA12098 = result;
  unk_1EDA120A0 = v1;
  return result;
}

uint64_t sub_1D77D7428(uint64_t a1)
{
  return sub_1D77D7594(a1, qword_1F012F6C8);
}

uint64_t static Logger.Mobility.default.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D77D7488(&qword_1F012EBE0, (uint64_t)qword_1F012F6C8, a1);
}

uint64_t sub_1D77D7458(uint64_t a1)
{
  return sub_1D77D7594(a1, qword_1EDA12048);
}

uint64_t static Logger.Mobility.plugin.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D77D7488(&qword_1EDA12040, (uint64_t)qword_1EDA12048, a1);
}

uint64_t sub_1D77D7488@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_1D77F486C();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_1D77D74F0(uint64_t a1)
{
  return sub_1D77D7594(a1, qword_1F012F6E0);
}

uint64_t static Logger.Mobility.notification.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D77D7488(&qword_1F012EBE8, (uint64_t)qword_1F012F6E0, a1);
}

uint64_t sub_1D77D7520(uint64_t a1)
{
  return sub_1D77D7594(a1, qword_1F012F6F8);
}

uint64_t static Logger.Mobility.view.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D77D7488(&qword_1F012EBF0, (uint64_t)qword_1F012F6F8, a1);
}

uint64_t sub_1D77D7550(uint64_t a1)
{
  return sub_1D77D7594(a1, qword_1F012F710);
}

uint64_t static Logger.Mobility.analytics.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D77D7488(&qword_1F012EBF8, (uint64_t)qword_1F012F710, a1);
}

uint64_t sub_1D77D7580(uint64_t a1)
{
  return sub_1D77D7594(a1, qword_1EDA12080);
}

uint64_t sub_1D77D7594(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1D77F486C();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_1EDA120A8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1D77F4B30();
  return sub_1D77F4860();
}

uint64_t static Logger.Mobility.generation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1D77D7488(&qword_1EDA12078, (uint64_t)qword_1EDA12080, a1);
}

ValueMetadata *type metadata accessor for Logger.Mobility()
{
  return &type metadata for Logger.Mobility;
}

void *WalkingSteadinessOnboardingAboutHealthDetailsViewController.__allocating_init()()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return WalkingSteadinessOnboardingAboutHealthDetailsViewController.init()();
}

void *WalkingSteadinessOnboardingAboutHealthDetailsViewController.init()()
{
  id v0;
  id v1;
  void *v2;

  type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsDataSource();
  swift_allocObject();
  sub_1D77DC224();
  if (qword_1F012EBC8 != -1)
    swift_once();
  v0 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v1 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  swift_retain();
  v2 = (void *)sub_1D77F4728();
  objc_msgSend(v2, sel_setModalInPresentation_, 0, 0xE000000000000000);
  swift_release();
  return v2;
}

void sub_1D77D7850()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  double v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsViewController();
  objc_msgSendSuper2(&v7, sel_viewDidLoad);
  v1 = objc_msgSend(v0, sel_tableView);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_setSeparatorStyle_, 0);

    v3 = objc_msgSend(v0, sel_tableView);
    if (v3)
    {
      v4 = v3;
      objc_msgSend(v3, sel_setContentInset_, -7.0, 0.0, 0.0, 0.0);

      v5 = objc_msgSend(v0, sel_headerView);
      LODWORD(v6) = 1036831949;
      objc_msgSend(v5, sel_setTitleHyphenationFactor_, v6);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_1D77D7944(void *a1)
{
  id v1;

  v1 = a1;
  sub_1D77D7850();

}

void WalkingSteadinessOnboardingAboutHealthDetailsViewController.__allocating_init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void WalkingSteadinessOnboardingAboutHealthDetailsViewController.init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WalkingSteadinessOnboardingAboutHealthDetailsViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsViewController()
{
  uint64_t result;

  result = qword_1F012F728;
  if (!qword_1F012F728)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D77D7A40()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for WalkingSteadinessOnboardingAboutHealthDetailsViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingAboutHealthDetailsViewController.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0
                              + class metadata base offset for WalkingSteadinessOnboardingAboutHealthDetailsViewController))();
}

uint64_t sub_1D77D7A98()
{
  return type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsViewController();
}

void sub_1D77D7AA0()
{
  qword_1F012F778 = 0;
}

uint64_t ConfirmDetailsFooterView.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView_configuration;
  v4 = sub_1D77F4938();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

id sub_1D77D7AF0()
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
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void (*v15)(char *, uint64_t);
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;

  v1 = v0;
  v2 = sub_1D77F48E4();
  v3 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x1E0C80A78](v2, v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5, v8);
  v10 = (char *)&v24 - v9;
  v11 = OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView____lazy_storage___titleLabel;
  v12 = *(void **)(v0 + OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView____lazy_storage___titleLabel);
  if (v12)
  {
    v13 = *(id *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView____lazy_storage___titleLabel);
  }
  else
  {
    sub_1D77F48FC();
    v14 = (void *)sub_1D77F48B4();
    v15 = *(void (**)(char *, uint64_t))(v3 + 8);
    v15(v10, v2);
    sub_1D77F48FC();
    v16 = (void *)sub_1D77F48CC();
    v15(v7, v2);
    sub_1D77F4920();
    v18 = v17;
    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
    objc_msgSend(v19, sel_setNumberOfLines_, 0);
    objc_msgSend(v19, sel_setFont_, v14);
    objc_msgSend(v19, sel_setTextColor_, v16);
    v20 = v19;
    if (v18)
    {
      v20 = (void *)sub_1D77F4ADC();
      swift_bridgeObjectRelease();
      objc_msgSend(v19, sel_setText_, v20);

    }
    v21 = *(void **)(v1 + v11);
    *(_QWORD *)(v1 + v11) = v19;
    v13 = v19;

    v12 = 0;
  }
  v22 = v12;
  return v13;
}

id sub_1D77D7CC0(uint64_t a1, double a2)
{
  char *v2;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  double v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v35;
  objc_super v36;

  *(_QWORD *)&v2[OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView____lazy_storage___titleLabel] = 0;
  v5 = &v2[OBJC_IVAR____TtC16HealthMobilityUI24ConfirmDetailsFooterView_configuration];
  v6 = sub_1D77F4938();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a1, v6);
  v36.receiver = v2;
  v36.super_class = (Class)type metadata accessor for ConfirmDetailsFooterView();
  v8 = objc_msgSendSuper2(&v36, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v9 = qword_1F012EC00;
  v10 = v8;
  if (v9 != -1)
    swift_once();
  v11 = a2 - (*(double *)&qword_1F012F778 + *(double *)&qword_1F012F778);
  v12 = sub_1D77D7AF0();
  objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v13 = sub_1D77D7AF0();
  objc_msgSend(v13, sel_setPreferredMaxLayoutWidth_, v11);

  v14 = v10;
  v15 = sub_1D77D7AF0();
  objc_msgSend(v14, sel_addSubview_, v15);

  v35 = (id)objc_opt_self();
  sub_1D77D82D4();
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_1D77F6740;
  v17 = sub_1D77D7AF0();
  v18 = objc_msgSend(v17, sel_topAnchor);

  v19 = objc_msgSend(v14, sel_topAnchor);
  v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_constant_, v19, 18.0);

  *(_QWORD *)(v16 + 32) = v20;
  v21 = sub_1D77D7AF0();
  v22 = objc_msgSend(v21, sel_leadingAnchor);

  v23 = objc_msgSend(v14, sel_leadingAnchor);
  v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v23, *(double *)&qword_1F012F778);

  *(_QWORD *)(v16 + 40) = v24;
  v25 = sub_1D77D7AF0();
  v26 = objc_msgSend(v25, sel_trailingAnchor);

  v27 = objc_msgSend(v14, sel_trailingAnchor);
  v28 = objc_msgSend(v26, sel_constraintLessThanOrEqualToAnchor_constant_, v27, -*(double *)&qword_1F012F778);

  *(_QWORD *)(v16 + 48) = v28;
  v29 = sub_1D77D7AF0();
  v30 = objc_msgSend(v29, sel_bottomAnchor);

  v31 = objc_msgSend(v14, sel_bottomAnchor);
  v32 = objc_msgSend(v30, sel_constraintEqualToAnchor_constant_, v31, -18.0);

  *(_QWORD *)(v16 + 56) = v32;
  sub_1D77F4B54();
  sub_1D77D832C();
  v33 = (void *)sub_1D77F4B48();
  swift_bridgeObjectRelease();
  objc_msgSend(v35, sel_activateConstraints_, v33);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  return v14;
}

id ConfirmDetailsFooterView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void ConfirmDetailsFooterView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ConfirmDetailsFooterView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfirmDetailsFooterView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ConfirmDetailsFooterView()
{
  uint64_t result;

  result = qword_1F012F7B0;
  if (!qword_1F012F7B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D77D824C()
{
  return type metadata accessor for ConfirmDetailsFooterView();
}

uint64_t sub_1D77D8254()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1D77F4938();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ConfirmDetailsFooterView()
{
  return swift_lookUpClassMethod();
}

void sub_1D77D82D4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012F050)
  {
    v0 = sub_1D77F4DF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012F050);
  }
}

unint64_t sub_1D77D832C()
{
  unint64_t result;

  result = qword_1F012F7C0;
  if (!qword_1F012F7C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012F7C0);
  }
  return result;
}

id WalkingSteadinessOnboardingSetupCompleteViewController.__allocating_init(healthExperienceStore:pinnedContentManager:notificationsEnabled:)(uint64_t a1, _QWORD *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return WalkingSteadinessOnboardingSetupCompleteViewController.init(healthExperienceStore:pinnedContentManager:notificationsEnabled:)(a1, a2);
}

uint64_t sub_1D77D83B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1D77F486C();
  __swift_allocate_value_buffer(v0, qword_1F012F7C8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F7C8);
  if (qword_1F012EBF0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F6F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void WalkingSteadinessOnboardingSetupCompleteViewController.stage.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + qword_1F012F7E0);
}

uint64_t sub_1D77D8454()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + qword_1F012F7E8;
  swift_beginAccess();
  return MEMORY[0x1D829C934](v1);
}

uint64_t sub_1D77D84A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + qword_1F012F7E8;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_1D77D8508(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = qword_1F012F7E8;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x1D829C934](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1D77C4738;
}

id WalkingSteadinessOnboardingSetupCompleteViewController.init(healthExperienceStore:pinnedContentManager:notificationsEnabled:)(uint64_t a1, _QWORD *a2)
{
  _BYTE *v2;
  _QWORD *v5;
  char *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  double v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[40];
  _BYTE v23[40];

  v2[qword_1F012F7E0] = 4;
  *(_QWORD *)&v2[qword_1F012F7E8 + 8] = 0;
  swift_unknownObjectWeakInit();
  v5 = &v2[qword_1F012F7F0];
  *v5 = 0xD000000000000028;
  v5[1] = 0x80000001D77F9640;
  v6 = v2;
  v7 = (id)HKMobilityWalkingSteadinessType();
  v21 = a1;
  sub_1D77C4434(a1, (uint64_t)v23);
  sub_1D77C4434((uint64_t)a2, (uint64_t)v22);
  sub_1D77F4740();
  swift_allocObject();
  *(_QWORD *)&v6[qword_1F012F7F8] = sub_1D77F4734();

  if (qword_1F012EBC8 != -1)
    swift_once();
  v8 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v9 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v10 = qword_1EDA12030;
  swift_retain();
  if (v10 != -1)
    swift_once();
  v11 = (id)qword_1EDA11EC0;
  v12 = (void *)sub_1D77F4ADC();
  v13 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v12, v11, 0, 0xE000000000000000);

  LOWORD(v20) = 0;
  v14 = (id)sub_1D77F4728();
  v15 = objc_msgSend(v14, sel_headerView, v20);
  LODWORD(v16) = 1036831949;
  objc_msgSend(v15, sel_setTitleHyphenationFactor_, v16);

  v17 = objc_msgSend(v14, sel_headerView);
  objc_msgSend(v17, sel_setAllowFullWidthIcon_, 1);

  sub_1D77D005C(0, (unint64_t *)&qword_1F012F6C0);
  v18 = (void *)MEMORY[0x1D829C19C]((id)*MEMORY[0x1E0CB5A70]);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_1D77F45D8();

  __swift_destroy_boxed_opaque_existential_1Tm(v21);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a2);
  return v14;
}

void sub_1D77D8964()
{
  char *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingSetupCompleteViewController();
  objc_msgSendSuper2(&v7, sel_viewDidLoad);
  if (qword_1F012EBC8 != -1)
    swift_once();
  v1 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v2 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  sub_1D77CB3E0();
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1D77F67A0;
  v4 = *(_QWORD *)&v0[qword_1F012F7F0 + 8];
  *(_QWORD *)(v3 + 32) = *(_QWORD *)&v0[qword_1F012F7F0];
  *(_QWORD *)(v3 + 40) = v4;
  *(_QWORD *)(v3 + 48) = 1701736260;
  *(_QWORD *)(v3 + 56) = 0xE400000000000000;
  *(_QWORD *)(v3 + 64) = 0x6E6F74747542;
  *(_QWORD *)(v3 + 72) = 0xE600000000000000;
  swift_bridgeObjectRetain();
  v5 = (void *)sub_1D77F4B48();
  swift_bridgeObjectRelease();
  v6 = (id)HKUIJoinStringsForAutomationIdentifier();

}

void sub_1D77D8B28(void *a1)
{
  id v1;

  v1 = a1;
  sub_1D77D8964();

}

void sub_1D77D8B5C(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingSetupCompleteViewController();
  v4 = v6.receiver;
  objc_msgSendSuper2(&v6, sel_viewWillAppear_, a3);
  v5 = objc_msgSend(v4, sel_navigationItem, v6.receiver, v6.super_class);
  objc_msgSend(v5, sel_setHidesBackButton_, 1);

}

uint64_t sub_1D77D8BEC(char *a1)
{
  char *v2;
  uint64_t result;
  uint64_t v4;
  void (*v5)(void);
  char *v6;

  v2 = &a1[qword_1F012F7E8];
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v2);
  if (result)
  {
    v4 = *((_QWORD *)v2 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 8);
    v6 = a1;
    v5();

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1D77D8C88(char *a1)
{
  char *v2;
  uint64_t result;
  uint64_t v4;
  void (*v5)(void);
  char *v6;

  v2 = &a1[qword_1F012F7E8];
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v2);
  if (result)
  {
    v4 = *((_QWORD *)v2 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 24);
    v6 = a1;
    v5();

    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_1D77D8D24(void *a1)
{
  void *v1;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;

  swift_getObjectType();
  v24.receiver = v1;
  v24.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingSetupCompleteViewController();
  objc_msgSendSuper2(&v24, sel_traitCollectionDidChange_, a1);
  v3 = objc_msgSend(v1, sel_traitCollection);
  v4 = objc_msgSend(v3, sel_userInterfaceStyle);
  if (a1 && v4 == objc_msgSend(a1, sel_userInterfaceStyle))
  {

  }
  else
  {
    v5 = qword_1EDA12030;
    v6 = v3;
    if (v5 != -1)
      swift_once();
    v7 = (void *)qword_1EDA11EC0;
    v8 = v6;
    v9 = v7;
    v10 = (void *)sub_1D77F4ADC();
    v11 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v10, v9, v8);

    if (v11)
    {
      v12 = objc_msgSend(v1, sel_headerView);
      objc_msgSend(v12, sel_setIcon_accessibilityLabel_, v11, 0);

    }
    else
    {
      if (qword_1F012EC08 != -1)
        swift_once();
      v13 = sub_1D77F486C();
      __swift_project_value_buffer(v13, (uint64_t)qword_1F012F7C8);
      v14 = v8;
      v15 = sub_1D77F4854();
      v16 = sub_1D77F4BC0();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = swift_slowAlloc();
        v18 = (_QWORD *)swift_slowAlloc();
        v22 = swift_slowAlloc();
        v23 = v22;
        *(_DWORD *)v17 = 136446466;
        v19 = sub_1D77F4E78();
        sub_1D77C3A1C(v19, v20, &v23);
        sub_1D77F4D04();
        swift_bridgeObjectRelease();
        *(_WORD *)(v17 + 12) = 2112;
        v21 = v14;
        sub_1D77F4D04();
        *v18 = v3;

        _os_log_impl(&dword_1D77C0000, v15, v16, "[%{public}s] Unable to load icon for %@", (uint8_t *)v17, 0x16u);
        sub_1D77D925C();
        swift_arrayDestroy();
        MEMORY[0x1D829C8C8](v18, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x1D829C8C8](v22, -1, -1);
        MEMORY[0x1D829C8C8](v17, -1, -1);

      }
      else
      {

      }
    }
  }
}

void sub_1D77D909C(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a1;
  sub_1D77D8D24(a3);

}

void WalkingSteadinessOnboardingSetupCompleteViewController.__allocating_init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void WalkingSteadinessOnboardingSetupCompleteViewController.init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1D77D914C()
{
  uint64_t v0;

  sub_1D77C564C(v0 + qword_1F012F7E8);
  swift_release();
  return swift_bridgeObjectRelease();
}

id WalkingSteadinessOnboardingSetupCompleteViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingSetupCompleteViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D77D91C0(uint64_t a1)
{
  sub_1D77C564C(a1 + qword_1F012F7E8);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_1D77D920C(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + qword_1F012F7E0);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingSetupCompleteViewController()
{
  uint64_t result;

  result = qword_1F012F800;
  if (!qword_1F012F800)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1D77D925C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDA12070)
  {
    sub_1D77D005C(255, (unint64_t *)&qword_1EDA12068);
    v0 = sub_1D77F4CF8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDA12070);
  }
}

uint64_t sub_1D77D92C0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + qword_1F012F7E8;
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1D77D9318(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + qword_1F012F7E8;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1D77D9378()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for WalkingSteadinessOnboardingSetupCompleteViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingSetupCompleteViewController.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingSetupCompleteViewController
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 32))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingSetupCompleteViewController.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingSetupCompleteViewController
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 40))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingSetupCompleteViewController.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingSetupCompleteViewController
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 48))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingSetupCompleteViewController.__allocating_init(healthExperienceStore:pinnedContentManager:notificationsEnabled:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingSetupCompleteViewController
                              + v0
                              + 56))();
}

uint64_t sub_1D77D9478()
{
  return type metadata accessor for WalkingSteadinessOnboardingSetupCompleteViewController();
}

uint64_t sub_1D77D9480()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1D77F486C();
  __swift_allocate_value_buffer(v0, qword_1F012F850);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F850);
  if (qword_1F012EBF0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F6F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

id sub_1D77D9510()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3578]), sel_init);
  objc_msgSend(v0, sel_setTimeStyle_, 0);
  result = objc_msgSend(v0, sel_setDateStyle_, 2);
  qword_1F012F868 = (uint64_t)v0;
  return result;
}

id sub_1D77D9570()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37F0]), sel_init);
  qword_1F012F870 = (uint64_t)result;
  return result;
}

uint64_t sub_1D77D95A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_1D77F4518();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0, v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1D77F456C();
  __swift_allocate_value_buffer(v5, qword_1F012F878);
  __swift_project_value_buffer(v5, (uint64_t)qword_1F012F878);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x1E0CB0EF8], v0);
  sub_1D77F4524();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

uint64_t DateOfBirthItem.reuseIdentifier.getter()
{
  type metadata accessor for TitleValueTableViewCell();
  sub_1D77C31B8((unint64_t *)&qword_1F012F210, (uint64_t (*)(uint64_t))type metadata accessor for TitleValueTableViewCell, (uint64_t)&protocol conformance descriptor for TitleValueTableViewCell);
  return sub_1D77F4698();
}

uint64_t DateOfBirthItem.uniqueIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v1, v2);
  v4 = (char *)v10 - v3;
  v5 = type metadata accessor for DateOfBirthItem();
  v10[0] = v5;
  sub_1D77D97EC();
  v6 = sub_1D77F4B00();
  v8 = v7;
  sub_1D77CC914(v0 + *(int *)(v5 + 20), (uint64_t)v4);
  sub_1D77F4B00();
  v10[0] = v6;
  v10[1] = v8;
  swift_bridgeObjectRetain();
  sub_1D77F4B24();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10[0];
}

uint64_t type metadata accessor for DateOfBirthItem()
{
  uint64_t result;

  result = qword_1F012F8F0;
  if (!qword_1F012F8F0)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_1D77D97EC()
{
  unint64_t result;

  result = qword_1F012F890;
  if (!qword_1F012F890)
  {
    type metadata accessor for DateOfBirthItem();
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012F890);
  }
  return result;
}

uint64_t DateOfBirthItem.baseIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DateOfBirthItem.baseIdentifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*DateOfBirthItem.baseIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t DateOfBirthItem.init(dateOfBirthComponents:dateGenerator:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t result;
  _QWORD *v10;

  v8 = type metadata accessor for DateOfBirthItem();
  *a4 = 0;
  a4[1] = 0;
  result = sub_1D77D98FC(a1, (uint64_t)a4 + *(int *)(v8 + 20));
  v10 = (_QWORD *)((char *)a4 + *(int *)(v8 + 24));
  *v10 = a2;
  v10[1] = a3;
  return result;
}

uint64_t sub_1D77D98FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D77D9958()
{
  type metadata accessor for TitleValueTableViewCell();
  sub_1D77C31B8((unint64_t *)&qword_1F012F210, (uint64_t (*)(uint64_t))type metadata accessor for TitleValueTableViewCell, (uint64_t)&protocol conformance descriptor for TitleValueTableViewCell);
  return sub_1D77F4698();
}

uint64_t sub_1D77D99A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)v11 - v5;
  v11[0] = a1;
  sub_1D77D97EC();
  v7 = sub_1D77F4B00();
  v9 = v8;
  sub_1D77CC914(v1 + *(int *)(a1 + 20), (uint64_t)v6);
  sub_1D77F4B00();
  v11[0] = v7;
  v11[1] = v9;
  swift_bridgeObjectRetain();
  sub_1D77F4B24();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11[0];
}

uint64_t sub_1D77D9A98(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_1D77D9ACC())()
{
  return nullsub_1;
}

uint64_t DateOfBirthItem.title.getter()
{
  id v0;
  uint64_t v1;

  if (qword_1F012EBC0 != -1)
    swift_once();
  v0 = (id)qword_1F012F660;
  swift_bridgeObjectRetain();
  v1 = sub_1D77F43F8();
  swift_bridgeObjectRelease();

  return v1;
}

uint64_t DateOfBirthItem.value.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v15;

  v1 = sub_1D77F43EC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77CA580(0, &qword_1F012F248, v6, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v15 - v9;
  v11 = type metadata accessor for DateOfBirthItem();
  sub_1D77CC914(v0 + *(int *)(v11 + 20), (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v10, 1, v1) == 1)
  {
    if (qword_1F012EBC0 != -1)
      swift_once();
    v12 = (id)qword_1F012F660;
    swift_bridgeObjectRetain();
    v13 = sub_1D77F43F8();
    swift_bridgeObjectRelease();

  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v5, v10, v1);
    v13 = sub_1D77D9D60((uint64_t)v5);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  return v13;
}

uint64_t sub_1D77D9D60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(uint64_t, uint64_t);
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void (*v36)(char *, uint64_t);
  id v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;

  v3 = sub_1D77F43EC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1D77CA580(0, &qword_1F012F930, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0E38], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v9, v10);
  v65 = (char *)&v64 - v11;
  sub_1D77CA580(0, (unint64_t *)&qword_1F012F938, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], v8);
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v64 - v14;
  v16 = sub_1D77F44DC();
  v17 = *(_QWORD *)(v16 - 8);
  v19 = MEMORY[0x1E0C80A78](v16, v18);
  v21 = (char *)&v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19, v22);
  v64 = (char *)&v64 - v23;
  if (qword_1F012EC28 != -1)
    swift_once();
  v24 = sub_1D77F456C();
  __swift_project_value_buffer(v24, (uint64_t)qword_1F012F878);
  sub_1D77F453C();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_1D77CFF04((uint64_t)v15, (unint64_t *)&qword_1F012F938, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870]);
    if (qword_1F012EC10 != -1)
      swift_once();
    v25 = sub_1D77F486C();
    __swift_project_value_buffer(v25, (uint64_t)qword_1F012F850);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v3);
    v26 = sub_1D77F4854();
    v27 = sub_1D77F4BC0();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = swift_slowAlloc();
      v29 = swift_slowAlloc();
      v67 = v29;
      *(_DWORD *)v28 = 136446722;
      v66 = sub_1D77C3A1C(0x6942664F65746144, 0xEF6D657449687472, &v67);
      sub_1D77F4D04();
      *(_WORD *)(v28 + 12) = 2082;
      v66 = sub_1D77C3A1C(0xD000000000000020, 0x80000001D77F9830, &v67);
      sub_1D77F4D04();
      *(_WORD *)(v28 + 22) = 2080;
      sub_1D77C31B8(&qword_1F012F940, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], MEMORY[0x1E0CAEAF0]);
      v30 = sub_1D77F4DE8();
      v66 = sub_1D77C3A1C(v30, v31, &v67);
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      _os_log_impl(&dword_1D77C0000, v26, v27, "[%{public}s.%{public}s]: Unable to create date from birth day components: %s", (uint8_t *)v28, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v29, -1, -1);
      MEMORY[0x1D829C8C8](v28, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }

    return 0;
  }
  v32 = v64;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v64, v15, v16);
  v33 = (void *)sub_1D77F43D4();
  v34 = type metadata accessor for DateOfBirthItem();
  (*(void (**)(void))(v1 + *(int *)(v34 + 24)))();
  v35 = (void *)sub_1D77F44B8();
  v36 = *(void (**)(char *, uint64_t))(v17 + 8);
  v36(v21, v16);
  v37 = objc_msgSend(v33, sel_hk_ageWithCurrentDate_, v35);

  if (qword_1F012EC20 != -1)
    swift_once();
  v38 = (void *)qword_1F012F870;
  v39 = (void *)sub_1D77F4B84();
  v40 = objc_msgSend(v38, sel_stringFromNumber_, v39);

  if (!v40)
  {
    if (qword_1F012EC10 != -1)
      swift_once();
    v57 = sub_1D77F486C();
    __swift_project_value_buffer(v57, (uint64_t)qword_1F012F850);
    v58 = sub_1D77F4854();
    v59 = sub_1D77F4BC0();
    if (os_log_type_enabled(v58, v59))
    {
      v60 = swift_slowAlloc();
      v61 = swift_slowAlloc();
      v67 = v61;
      *(_DWORD *)v60 = 136446723;
      v66 = sub_1D77C3A1C(0x6942664F65746144, 0xEF6D657449687472, &v67);
      sub_1D77F4D04();
      *(_WORD *)(v60 + 12) = 2082;
      v66 = sub_1D77C3A1C(0xD000000000000020, 0x80000001D77F9830, &v67);
      sub_1D77F4D04();
      *(_WORD *)(v60 + 22) = 2049;
      v66 = (uint64_t)v37;
      sub_1D77F4D04();
      _os_log_impl(&dword_1D77C0000, v58, v59, "[%{public}s.%{public}s]: Unable to create age string from age: %{private}ld", (uint8_t *)v60, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v61, -1, -1);
      v62 = v60;
      v32 = v64;
      MEMORY[0x1D829C8C8](v62, -1, -1);
    }

    v36(v32, v16);
    return 0;
  }
  v41 = sub_1D77F4AE8();
  v43 = v42;

  v44 = sub_1D77F450C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v65, 1, 1, v44);
  sub_1D77CA580(0, &qword_1F012F948, (uint64_t (*)(uint64_t))sub_1D77DAF08, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_1D77F5EA0;
  if (qword_1F012EC18 != -1)
    swift_once();
  v46 = (void *)qword_1F012F868;
  v47 = (void *)sub_1D77F44B8();
  v48 = objc_msgSend(v46, sel_stringFromDate_, v47);

  v49 = sub_1D77F4AE8();
  v51 = v50;

  v52 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v45 + 56) = MEMORY[0x1E0DEA968];
  v53 = sub_1D77DAF5C();
  *(_QWORD *)(v45 + 32) = v49;
  *(_QWORD *)(v45 + 40) = v51;
  *(_QWORD *)(v45 + 96) = v52;
  *(_QWORD *)(v45 + 104) = v53;
  *(_QWORD *)(v45 + 64) = v53;
  *(_QWORD *)(v45 + 72) = v41;
  *(_QWORD *)(v45 + 80) = v43;
  if (qword_1F012EBC0 != -1)
    swift_once();
  v54 = (id)qword_1F012F660;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  v55 = (uint64_t)v65;
  v56 = sub_1D77F4AF4();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D77CFF04(v55, &qword_1F012F930, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0E38]);
  v36(v32, v16);
  return v56;
}

uint64_t sub_1D77DA604()
{
  id v0;
  uint64_t v1;

  if (qword_1F012EBC0 != -1)
    swift_once();
  v0 = (id)qword_1F012F660;
  swift_bridgeObjectRetain();
  v1 = sub_1D77F43F8();
  swift_bridgeObjectRelease();

  return v1;
}

uint64_t *initializeBufferWithCopyOfBuffer for DateOfBirthItem(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1D77F43EC();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = *(int *)(a3 + 24);
    v17 = (uint64_t *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
  }
  swift_retain();
  return v4;
}

uint64_t destroy for DateOfBirthItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_1D77F43EC();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return swift_release();
}

_QWORD *initializeWithCopy for DateOfBirthItem(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1D77F43EC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = *(int *)(a3 + 24);
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for DateOfBirthItem(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1D77F43EC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  v15 = *(int *)(a3 + 24);
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *initializeWithTake for DateOfBirthItem(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1D77F43EC();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *assignWithTake for DateOfBirthItem(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1D77F43EC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DateOfBirthItem()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1D77DAD38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for DateOfBirthItem()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1D77DADDC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;

  sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, v8);
  else
    *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
}

void sub_1D77DAE70()
{
  unint64_t v0;

  sub_1D77CA580(319, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

unint64_t sub_1D77DAF08()
{
  unint64_t result;

  result = qword_1F012F950;
  if (!qword_1F012F950)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012F950);
  }
  return result;
}

unint64_t sub_1D77DAF5C()
{
  unint64_t result;

  result = qword_1F012F958;
  if (!qword_1F012F958)
  {
    result = MEMORY[0x1D829C838](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1F012F958);
  }
  return result;
}

uint64_t WalkingSteadinessAdvertisableFeatureSourceProvider.currentCountry.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1D77DAFB4(v1 + OBJC_IVAR____TtC16HealthMobilityUI50WalkingSteadinessAdvertisableFeatureSourceProvider_currentCountry, a1);
}

uint64_t sub_1D77DAFB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77DAFF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1D77DAFF8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012F960)
  {
    sub_1D77F45E4();
    sub_1D77F45CC();
    sub_1D77C31B8(&qword_1F012F968, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E150], MEMORY[0x1E0D2E160]);
    v0 = sub_1D77F4E6C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012F960);
  }
}

uint64_t WalkingSteadinessAdvertisableFeatureSourceProvider.__allocating_init(context:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v10[4];

  sub_1D77DAFF8();
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v10[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77F4668();
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  sub_1D77F4680();
  v6 = sub_1D77F4674();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  type metadata accessor for WalkingSteadinessAdvertisableFeatureSourceProvider();
  v7 = swift_allocObject();
  sub_1D77DB21C((uint64_t)v5, v7 + OBJC_IVAR____TtC16HealthMobilityUI50WalkingSteadinessAdvertisableFeatureSourceProvider_currentCountry);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  return v7;
}

uint64_t WalkingSteadinessAdvertisableFeatureSourceProvider.__allocating_init(currentCountry:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  sub_1D77DB21C(a1, v2 + OBJC_IVAR____TtC16HealthMobilityUI50WalkingSteadinessAdvertisableFeatureSourceProvider_currentCountry);
  return v2;
}

uint64_t type metadata accessor for WalkingSteadinessAdvertisableFeatureSourceProvider()
{
  uint64_t result;

  result = qword_1F012F9A8;
  if (!qword_1F012F9A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t WalkingSteadinessAdvertisableFeatureSourceProvider.init(currentCountry:)(uint64_t a1)
{
  uint64_t v1;

  sub_1D77DB21C(a1, v1 + OBJC_IVAR____TtC16HealthMobilityUI50WalkingSteadinessAdvertisableFeatureSourceProvider_currentCountry);
  return v1;
}

uint64_t sub_1D77DB21C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77DAFF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D77DB260@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x1E0D29D50];
  v3 = sub_1D77F462C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

id sub_1D77DB2A4()
{
  return (id)*MEMORY[0x1E0CB50B8];
}

uint64_t sub_1D77DB2B4()
{
  id v0;
  id v1;
  id v2;
  void *v3;
  id v4;

  if (qword_1F012EBC8 != -1)
    swift_once();
  v0 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v1 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  if (qword_1EDA12030 != -1)
    swift_once();
  v2 = (id)qword_1EDA11EC0;
  v3 = (void *)sub_1D77F4ADC();
  v4 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v3, v2, 0xE000000000000000);

  return sub_1D77F465C();
}

id sub_1D77DB498()
{
  void *v0;
  id v1;

  v0 = (void *)sub_1D77F4794();
  v1 = objc_msgSend(v0, sel_areAllRequirementsSatisfied);

  return v1;
}

uint64_t sub_1D77DB4E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;
  uint64_t v8;

  v1 = sub_1D77F486C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v0;
  sub_1D77F4848();
  type metadata accessor for WalkingSteadinessAdvertisableFeatureSourceProvider();
  sub_1D77C31B8(&qword_1F012F970, (uint64_t (*)(uint64_t))type metadata accessor for WalkingSteadinessAdvertisableFeatureSourceProvider, (uint64_t)&protocol conformance descriptor for WalkingSteadinessAdvertisableFeatureSourceProvider);
  sub_1D77F45F0();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
}

uint64_t sub_1D77DB5C0(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  uint64_t v18;
  _QWORD v19[4];

  v18 = *v4;
  sub_1D77DBF88();
  v10 = v9;
  v11 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v12);
  v14 = (char *)&v19[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77F45FC();
  __swift_project_boxed_opaque_existential_1(v19, v19[3]);
  sub_1D77F47B8();
  swift_getObjectType();
  sub_1D77F4AE8();
  sub_1D77F4C14();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  *(_QWORD *)(v15 + 24) = a4;
  *(_QWORD *)(v15 + 32) = a1;
  *(_BYTE *)(v15 + 40) = a2;
  *(_QWORD *)(v15 + 48) = v18;
  swift_retain();
  v16 = a1;
  sub_1D77F4CB0();
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
}

uint64_t sub_1D77DB724(char a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
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
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint8_t *v32;
  char v33;
  char *v34;
  _QWORD *v35;
  uint8_t *v37;
  void (*v38)(_QWORD);
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47[4];

  v44 = a6;
  v45 = a5;
  sub_1D77DC0F8();
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77DBF88();
  v42 = *(_QWORD *)(v16 - 8);
  v43 = v16;
  MEMORY[0x1E0C80A78](v16, v17);
  v41 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1D77F486C();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19, v21);
  v23 = (char *)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    sub_1D77F4848();
    v24 = sub_1D77F4854();
    v25 = sub_1D77F4BCC();
    v26 = os_log_type_enabled(v24, v25);
    v40 = a7;
    if (v26)
    {
      v39 = a4;
      v27 = swift_slowAlloc();
      v38 = a3;
      v28 = (uint8_t *)v27;
      v29 = swift_slowAlloc();
      v47[0] = v29;
      *(_DWORD *)v28 = 136446210;
      v37 = v28 + 4;
      v30 = sub_1D77F4E78();
      v46 = sub_1D77C3A1C(v30, v31, v47);
      sub_1D77F4D04();
      a4 = v39;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D77C0000, v24, v25, "[%{public}s] Notification defaults written and synced", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v29, -1, -1);
      v32 = v28;
      a3 = v38;
      MEMORY[0x1D829C8C8](v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
    v33 = v44;
    sub_1D77F4608();
    if ((v33 & 1) != 0)
    {
      sub_1D77F45FC();
      __swift_project_boxed_opaque_existential_1(v47, v47[3]);
      sub_1D77F47B8();
      swift_getObjectType();
      v34 = v41;
      sub_1D77F4C20();
      v35 = (_QWORD *)swift_allocObject();
      v35[2] = a3;
      v35[3] = a4;
      v35[4] = v40;
      swift_retain();
      sub_1D77F4CB0();
      swift_unknownObjectRelease();
      swift_release();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v34, v43);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v47);
    }
    sub_1D77F4650();
    sub_1D77C31B8(&qword_1F012FA70, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2A090], MEMORY[0x1E0D2A0A0]);
    sub_1D77F4E60();
  }
  else
  {
    if (a2)
    {
      swift_getErrorValue();
      sub_1D77F4E24();
    }
    else
    {
      v47[0] = 0;
      v47[1] = 0xE000000000000000;
      sub_1D77F4D4C();
      sub_1D77F4B24();
      sub_1D77F4E78();
      sub_1D77F4B24();
      swift_bridgeObjectRelease();
      sub_1D77F4B24();
    }
    sub_1D77F4644();
    swift_storeEnumTagMultiPayload();
  }
  a3(v15);
  return sub_1D77CFFCC((uint64_t)v15, (uint64_t (*)(_QWORD))sub_1D77DC0F8);
}

uint64_t sub_1D77DBB18(char a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint8_t *v27;
  void (*v28)(_QWORD);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[2];

  sub_1D77DC0F8();
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1D77F486C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12, v14);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    sub_1D77F4848();
    v17 = sub_1D77F4854();
    v18 = sub_1D77F4BCC();
    v19 = os_log_type_enabled(v17, v18);
    v29 = a4;
    if (v19)
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v28 = a3;
      v22 = v21;
      v31[0] = v21;
      *(_DWORD *)v20 = 136446210;
      v27 = v20 + 4;
      v23 = sub_1D77F4E78();
      v30 = sub_1D77C3A1C(v23, v24, v31);
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D77C0000, v17, v18, "[%{public}s] Onboarding acknowledged written and synced", v20, 0xCu);
      swift_arrayDestroy();
      v25 = v22;
      a3 = v28;
      MEMORY[0x1D829C8C8](v25, -1, -1);
      MEMORY[0x1D829C8C8](v20, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    sub_1D77F4650();
    sub_1D77C31B8(&qword_1F012FA70, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2A090], MEMORY[0x1E0D2A0A0]);
    sub_1D77F4E60();
  }
  else
  {
    if (a2)
    {
      swift_getErrorValue();
      sub_1D77F4E24();
    }
    else
    {
      v31[0] = 0;
      v31[1] = 0xE000000000000000;
      sub_1D77F4D4C();
      sub_1D77F4B24();
      sub_1D77F4E78();
      sub_1D77F4B24();
      swift_bridgeObjectRelease();
      sub_1D77F4B24();
    }
    sub_1D77F4644();
    swift_storeEnumTagMultiPayload();
  }
  a3(v11);
  return sub_1D77CFFCC((uint64_t)v11, (uint64_t (*)(_QWORD))sub_1D77DC0F8);
}

uint64_t sub_1D77DBE04()
{
  return MEMORY[0x1E0DEE9D8];
}

uint64_t WalkingSteadinessAdvertisableFeatureSourceProvider.deinit()
{
  uint64_t v0;

  sub_1D77CFFCC(v0 + OBJC_IVAR____TtC16HealthMobilityUI50WalkingSteadinessAdvertisableFeatureSourceProvider_currentCountry, (uint64_t (*)(_QWORD))sub_1D77DAFF8);
  return v0;
}

uint64_t WalkingSteadinessAdvertisableFeatureSourceProvider.__deallocating_deinit()
{
  uint64_t v0;

  sub_1D77CFFCC(v0 + OBJC_IVAR____TtC16HealthMobilityUI50WalkingSteadinessAdvertisableFeatureSourceProvider_currentCountry, (uint64_t (*)(_QWORD))sub_1D77DAFF8);
  return swift_deallocClassInstance();
}

uint64_t sub_1D77DBE74@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_1D77DAFB4(*v1 + OBJC_IVAR____TtC16HealthMobilityUI50WalkingSteadinessAdvertisableFeatureSourceProvider_currentCountry, a1);
}

uint64_t sub_1D77DBE8C()
{
  return sub_1D77DB2B4();
}

uint64_t sub_1D77DBEA0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD v7[2];

  v1 = sub_1D77F486C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v3);
  v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7[1] = *v0;
  sub_1D77F4848();
  type metadata accessor for WalkingSteadinessAdvertisableFeatureSourceProvider();
  sub_1D77F45F0();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
}

uint64_t sub_1D77DBF68(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  return sub_1D77DB5C0(a1, a2, a3, a4);
}

void sub_1D77DBF88()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012F978)
  {
    v0 = sub_1D77F4C38();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012F978);
  }
}

uint64_t sub_1D77DBFDC()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1D77DC008(char a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1D77DB724(a1, a2, *(void (**)(_QWORD))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(unsigned __int8 *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

uint64_t sub_1D77DC01C()
{
  return type metadata accessor for WalkingSteadinessAdvertisableFeatureSourceProvider();
}

void sub_1D77DC024()
{
  unint64_t v0;

  sub_1D77DAFF8();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for WalkingSteadinessAdvertisableFeatureSourceProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.__allocating_init(currentCountry:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.identifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.featureIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.makeConfiguration(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.queue_determineShouldAdvertise(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.queue_performPrerequisiteWorkIfNecessary(_:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.queue_commitEnablement(_:enabled:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of WalkingSteadinessAdvertisableFeatureSourceProvider.determinePostCommitWorkItems(_:enabled:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

void sub_1D77DC0F8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012FA68)
  {
    sub_1D77F4650();
    sub_1D77C31B8(&qword_1F012FA70, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2A090], MEMORY[0x1E0D2A0A0]);
    v0 = sub_1D77F4E6C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012FA68);
  }
}

uint64_t sub_1D77DC17C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D77DC1A0(char a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1D77DBB18(a1, a2, *(void (**)(_QWORD))(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsDataSource()
{
  uint64_t result;

  result = qword_1F012FA78;
  if (!qword_1F012FA78)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D77DC1E8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1D77DC224()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void (*v5)(char *, uint64_t);
  _QWORD v7[2];

  v0 = sub_1D77F4500();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0, v2);
  v4 = (char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77DC4A8();
  sub_1D77F46C8();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1D77F64E0;
  sub_1D77F194C((uint64_t)&unk_1E9C30E78);
  sub_1D77F44F4();
  sub_1D77F44E8();
  v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v4, v0);
  sub_1D77F46BC();
  v7[0] = 0x3C53447961727241;
  v7[1] = 0xE800000000000000;
  sub_1D77F44F4();
  sub_1D77F44E8();
  v5(v4, v0);
  sub_1D77F4B24();
  swift_bridgeObjectRelease();
  sub_1D77F4B24();
  return sub_1D77F46A4();
}

void sub_1D77DC3A8()
{
  sub_1D77DC3D8();
}

void sub_1D77DC3C0()
{
  sub_1D77DC3D8();
}

void sub_1D77DC3D8()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1D77DC400()
{
  sub_1D77F46B0();
  return swift_deallocClassInstance();
}

uint64_t sub_1D77DC41C()
{
  return type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsDataSource();
}

uint64_t sub_1D77DC424()
{
  type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsCell();
  sub_1D77DC460();
  return sub_1D77F4B90();
}

unint64_t sub_1D77DC460()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F012FAC8;
  if (!qword_1F012FAC8)
  {
    v1 = type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsCell();
    result = MEMORY[0x1D829C838](&unk_1D77F7CC4, v1);
    atomic_store(result, (unint64_t *)&qword_1F012FAC8);
  }
  return result;
}

void sub_1D77DC4A8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012FAD0)
  {
    sub_1D77F46C8();
    v0 = sub_1D77F4DF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012FAD0);
  }
}

uint64_t sub_1D77DC4FC(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x6E41746867696568;
  else
    v3 = 0x6942664F65746164;
  if (v2)
    v4 = 0xEB00000000687472;
  else
    v4 = 0xEF74686769655764;
  if ((a2 & 1) != 0)
    v5 = 0x6E41746867696568;
  else
    v5 = 0x6942664F65746164;
  if ((a2 & 1) != 0)
    v6 = 0xEF74686769655764;
  else
    v6 = 0xEB00000000687472;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_1D77F4E00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

HealthMobilityUI::WalkingSteadinessOnboardingAboutHealthDetailsItem_optional __swiftcall WalkingSteadinessOnboardingAboutHealthDetailsItem.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  HealthMobilityUI::WalkingSteadinessOnboardingAboutHealthDetailsItem_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1D77F4DDC();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

uint64_t WalkingSteadinessOnboardingAboutHealthDetailsItem.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6E41746867696568;
  else
    return 0x6942664F65746164;
}

uint64_t sub_1D77DC664(char *a1, char *a2)
{
  return sub_1D77DC4FC(*a1, *a2);
}

uint64_t sub_1D77DC670()
{
  sub_1D77F4E3C();
  sub_1D77F4B18();
  swift_bridgeObjectRelease();
  return sub_1D77F4E54();
}

uint64_t sub_1D77DC704()
{
  sub_1D77F4B18();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D77DC774()
{
  sub_1D77F4E3C();
  sub_1D77F4B18();
  swift_bridgeObjectRelease();
  return sub_1D77F4E54();
}

HealthMobilityUI::WalkingSteadinessOnboardingAboutHealthDetailsItem_optional sub_1D77DC804(Swift::String *a1)
{
  return WalkingSteadinessOnboardingAboutHealthDetailsItem.init(rawValue:)(*a1);
}

void sub_1D77DC810(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x6942664F65746164;
  if (*v1)
    v2 = 0x6E41746867696568;
  v3 = 0xEB00000000687472;
  if (*v1)
    v3 = 0xEF74686769655764;
  *a1 = v2;
  a1[1] = v3;
}

unint64_t WalkingSteadinessOnboardingAboutHealthDetailsItem.reuseIdentifier.getter()
{
  return 0xD000000000000031;
}

uint64_t WalkingSteadinessOnboardingAboutHealthDetailsItem.uniqueIdentifier.getter()
{
  uint64_t v1;

  sub_1D77DC938();
  v1 = sub_1D77F4B00();
  sub_1D77F4B24();
  sub_1D77F4B24();
  swift_bridgeObjectRelease();
  return v1;
}

unint64_t sub_1D77DC938()
{
  unint64_t result;

  result = qword_1F012FAD8;
  if (!qword_1F012FAD8)
  {
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012FAD8);
  }
  return result;
}

uint64_t WalkingSteadinessOnboardingAboutHealthDetailsItem.selectionStyle.getter()
{
  return 0;
}

unint64_t sub_1D77DC97C()
{
  unint64_t result;

  result = qword_1F012FAE0;
  if (!qword_1F012FAE0)
  {
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for WalkingSteadinessOnboardingAboutHealthDetailsItem, &type metadata for WalkingSteadinessOnboardingAboutHealthDetailsItem);
    atomic_store(result, (unint64_t *)&qword_1F012FAE0);
  }
  return result;
}

unint64_t sub_1D77DC9C0()
{
  return 0xD000000000000031;
}

uint64_t sub_1D77DC9E0()
{
  return 0;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WalkingSteadinessOnboardingAboutHealthDetailsItem(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for WalkingSteadinessOnboardingAboutHealthDetailsItem(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D77DCAD4 + 4 * byte_1D77F6A45[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1D77DCB08 + 4 * byte_1D77F6A40[v4]))();
}

uint64_t sub_1D77DCB08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77DCB10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D77DCB18);
  return result;
}

uint64_t sub_1D77DCB24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D77DCB2CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1D77DCB30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77DCB38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77DCB44(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1D77DCB4C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsItem()
{
  return &type metadata for WalkingSteadinessOnboardingAboutHealthDetailsItem;
}

uint64_t sub_1D77DCB68()
{
  _BYTE *v0;
  id v1;
  uint64_t v2;

  if ((*v0 & 1) != 0)
  {
    if (qword_1F012EBC8 != -1)
      swift_once();
  }
  else if (qword_1F012EBC8 != -1)
  {
    swift_once();
  }
  v1 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  v2 = sub_1D77F43F8();
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t sub_1D77DCC9C()
{
  _BYTE *v0;
  id v1;
  uint64_t v2;

  if ((*v0 & 1) != 0)
  {
    if (qword_1F012EBC8 != -1)
      swift_once();
  }
  else if (qword_1F012EBC8 != -1)
  {
    swift_once();
  }
  v1 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  v2 = sub_1D77F43F8();
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t sub_1D77DCDD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1D77F486C();
  __swift_allocate_value_buffer(v0, qword_1F012FAE8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012FAE8);
  if (qword_1F012EBF0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F6F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_1D77DCE60(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _BYTE v5[40];

  sub_1D77CB068(a1, (uint64_t)v5);
  v3 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
  swift_beginAccess();
  sub_1D77CB148((uint64_t)v5, v3);
  swift_endAccess();
  sub_1D77DCEE8();
  return sub_1D77DDC5C((uint64_t)v5, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
}

void sub_1D77DCEE8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  _BYTE v29[24];
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34[3];
  uint64_t v35;
  uint64_t v36;

  swift_getObjectType();
  v1 = sub_1D77F4938();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v3);
  v5 = v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 22;
  v6 = (uint64_t)v0 + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
  swift_beginAccess();
  sub_1D77CB068(v6, (uint64_t)v29);
  if (v30)
  {
    sub_1D77DDC98(0, (unint64_t *)&qword_1F012F0E8);
    sub_1D77DDC98(0, &qword_1F012FB50);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v32 + 1))
      {
        v7 = sub_1D77C35F4(&v31, (uint64_t)v34);
        MEMORY[0x1D829C1C0](v7);
        v8 = v35;
        v9 = v36;
        __swift_project_boxed_opaque_existential_1(v34, v35);
        (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9);
        sub_1D77F492C();
        v10 = v35;
        v11 = v36;
        __swift_project_boxed_opaque_existential_1(v34, v35);
        (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v10, v11);
        sub_1D77F48A8();
        *((_QWORD *)&v32 + 1) = v1;
        v33 = MEMORY[0x1E0DC2398];
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v31);
        (*(void (**)(uint64_t *, _BYTE *, uint64_t))(v2 + 16))(boxed_opaque_existential_1, v5, v1);
        MEMORY[0x1D829C1B4](&v31);
        sub_1D77DD70C();
        sub_1D77CB068(v6, (uint64_t)v29);
        if (v30)
        {
          sub_1D77DDC98(0, (unint64_t *)&unk_1F012F200);
          if ((swift_dynamicCast() & 1) != 0)
          {
            if (*((_QWORD *)&v32 + 1))
            {
              __swift_project_boxed_opaque_existential_1(&v31, *((uint64_t *)&v32 + 1));
              v13 = sub_1D77F474C();
              v15 = v14;
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v31);
              if (v15)
                v16 = v13;
              else
                v16 = 0;
              goto LABEL_20;
            }
          }
          else
          {
            v33 = 0;
            v31 = 0u;
            v32 = 0u;
          }
        }
        else
        {
          sub_1D77DDC5C((uint64_t)v29, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
          v31 = 0u;
          v32 = 0u;
          v33 = 0;
        }
        sub_1D77DDC5C((uint64_t)&v31, &qword_1F012F1F8, (unint64_t *)&unk_1F012F200);
        v16 = 0;
        v15 = 0;
LABEL_20:
        sub_1D77DD90C(v16, v15);
        swift_bridgeObjectRelease();
        (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v5, v1);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
        return;
      }
    }
    else
    {
      v33 = 0;
      v31 = 0u;
      v32 = 0u;
    }
  }
  else
  {
    sub_1D77DDC5C((uint64_t)v29, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
    v31 = 0u;
    v32 = 0u;
    v33 = 0;
  }
  sub_1D77DDC5C((uint64_t)&v31, &qword_1F012FB48, &qword_1F012FB50);
  if (qword_1F012EC30 != -1)
    swift_once();
  v17 = sub_1D77F486C();
  __swift_project_value_buffer(v17, (uint64_t)qword_1F012FAE8);
  v18 = v0;
  v19 = sub_1D77F4854();
  v20 = sub_1D77F4BB4();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    v34[0] = v22;
    *(_DWORD *)v21 = 136446722;
    v23 = sub_1D77F4E78();
    *(_QWORD *)&v31 = sub_1D77C3A1C(v23, v24, v34);
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2082;
    *(_QWORD *)&v31 = sub_1D77C3A1C(1835365481, 0xE400000000000000, v34);
    sub_1D77F4D04();
    *(_WORD *)(v21 + 22) = 2082;
    sub_1D77DDBCC(0, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
    *(_QWORD *)&v31 = v25;
    sub_1D77CB744();
    v26 = sub_1D77F4B00();
    *(_QWORD *)&v31 = sub_1D77C3A1C(v26, v27, v34);
    sub_1D77F4D04();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D77C0000, v19, v20, "[%{public}s.%{public}s]: Attempted to set item (%{public}s) that did not conform to TitleValueProviding", (uint8_t *)v21, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v22, -1, -1);
    MEMORY[0x1D829C8C8](v21, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_1D77DD41C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
  swift_beginAccess();
  return sub_1D77CB068(v3, a1);
}

uint64_t sub_1D77DD46C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
  swift_beginAccess();
  sub_1D77CB148(a1, v3);
  swift_endAccess();
  sub_1D77DCEE8();
  return sub_1D77DDC5C(a1, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
}

void (*sub_1D77DD4F0(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D77DD538;
}

void sub_1D77DD538(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_1D77DCEE8();
}

uint64_t type metadata accessor for TitleValueTableViewCell()
{
  return objc_opt_self();
}

id sub_1D77DD70C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  id result;
  void (*v13)(uint64_t *, _QWORD);
  uint64_t *boxed_opaque_existential_1;
  uint64_t v16[3];
  uint64_t v17;
  uint64_t v18;

  sub_1D77DDB78();
  MEMORY[0x1E0C80A78](v1, v2);
  v4 = (char *)&v16[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1D77F4938();
  v6 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x1E0C80A78](v5, v7);
  v10 = (char *)&v16[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1D829C1A8](v16, v8);
  if (!v17)
  {
    sub_1D77DDC5C((uint64_t)v16, &qword_1F012FB38, &qword_1F012FB40);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    return (id)sub_1D77DDC20((uint64_t)v4);
  }
  sub_1D77DDC98(0, &qword_1F012FB40);
  v11 = swift_dynamicCast();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, v11 ^ 1u, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    return (id)sub_1D77DDC20((uint64_t)v4);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v10, v4, v5);
  result = objc_msgSend(v0, sel_tintColor);
  if (result)
  {
    v13 = (void (*)(uint64_t *, _QWORD))sub_1D77F4908();
    sub_1D77F48D8();
    v13(v16, 0);
    v17 = v5;
    v18 = MEMORY[0x1E0DC2398];
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
    (*(void (**)(uint64_t *, char *, uint64_t))(v6 + 16))(boxed_opaque_existential_1, v10, v5);
    MEMORY[0x1D829C1B4](v16);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1D77DD90C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  void *v6;
  id v7;

  if (a2)
  {
    sub_1D77CB3E0();
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1D77F67A0;
    *(_QWORD *)(v5 + 32) = a1;
    *(_QWORD *)(v5 + 40) = a2;
    *(_QWORD *)(v5 + 48) = 0x6C6156656C746954;
    *(_QWORD *)(v5 + 56) = 0xEA00000000006575;
    *(_QWORD *)(v5 + 64) = 1819043139;
    *(_QWORD *)(v5 + 72) = 0xE400000000000000;
    swift_bridgeObjectRetain();
    v6 = (void *)sub_1D77F4B48();
    swift_bridgeObjectRelease();
    v7 = (id)HKUIJoinStringsForAutomationIdentifier();

    objc_msgSend(v2, sel_setAccessibilityIdentifier_, v7);
  }
  else
  {
    objc_msgSend(v2, sel_setAccessibilityIdentifier_, 0);
  }
}

id TitleValueTableViewCell.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TitleValueTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1D77DDA74(uint64_t a1, uint64_t a2)
{
  sub_1D77DD90C(a1, a2);
}

uint64_t sub_1D77DDA94@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI23TitleValueTableViewCell_item;
  swift_beginAccess();
  return sub_1D77CB068(v3, a2);
}

uint64_t dispatch thunk of TitleValueProviding.title.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of TitleValueProviding.value.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t method lookup function for TitleValueTableViewCell()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TitleValueTableViewCell.item.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of TitleValueTableViewCell.item.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of TitleValueTableViewCell.item.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of TitleValueTableViewCell.updateAutomationIdentifiers(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

void sub_1D77DDB78()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012FB30)
  {
    sub_1D77F4938();
    v0 = sub_1D77F4CF8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012FB30);
  }
}

void sub_1D77DDBCC(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_1D77DDC98(255, a3);
    v4 = sub_1D77F4CF8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_1D77DDC20(uint64_t a1)
{
  uint64_t v2;

  sub_1D77DDB78();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D77DDC5C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t v4;

  sub_1D77DDBCC(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1D77DDC98(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t ConfirmDetailsModel.__allocating_init(valueFormatter:)(__int128 *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 24) = 0;
  swift_unknownObjectWeakInit();
  v3 = v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  v4 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(_BYTE *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker) = 3;
  sub_1D77C35F4(a1, v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter);
  return v2;
}

uint64_t sub_1D77DDD84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1D77F486C();
  __swift_allocate_value_buffer(v0, qword_1F012FB58);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012FB58);
  if (qword_1F012EBF0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F6F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_1D77DDE14()
{
  _BYTE *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;

  if (*v0)
  {
    if (*v0 != 1)
      goto LABEL_7;
    v1 = (void *)sub_1D77F4B48();
    v2 = (id)HKUIJoinStringsForAutomationIdentifier();

    if (v2)
    {
LABEL_8:
      sub_1D77F4AE8();

      return;
    }
    __break(1u);
  }
  v3 = (void *)sub_1D77F4B48();
  v2 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v2)
    goto LABEL_8;
  __break(1u);
LABEL_7:
  v4 = (void *)sub_1D77F4B48();
  v2 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v2)
    goto LABEL_8;
  __break(1u);
}

HealthMobilityUI::ConfirmDetailsModel::Row::HealthDetail_optional __swiftcall ConfirmDetailsModel.Row.HealthDetail.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (HealthMobilityUI::ConfirmDetailsModel::Row::HealthDetail_optional)rawValue;
}

uint64_t ConfirmDetailsModel.Row.HealthDetail.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_1D77DDF18(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

HealthMobilityUI::ConfirmDetailsModel::Row::HealthDetail_optional sub_1D77DDF2C(Swift::Int *a1)
{
  return ConfirmDetailsModel.Row.HealthDetail.init(rawValue:)(*a1);
}

void sub_1D77DDF34(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_1D77DDF40()
{
  sub_1D77F4E3C();
  sub_1D77F4E48();
  return sub_1D77F4E54();
}

uint64_t sub_1D77DDF84()
{
  return sub_1D77F4E48();
}

uint64_t sub_1D77DDFAC()
{
  sub_1D77F4E3C();
  sub_1D77F4E48();
  return sub_1D77F4E54();
}

uint64_t sub_1D77DDFEC@<X0>(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, char *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v5 = *a2;
  if (sub_1D77F459C())
  {
    v6 = sub_1D77F45A8();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    v8 = -4;
LABEL_10:
    *a3 = v8;
    return result;
  }
  v9 = sub_1D77F4590();
  v10 = sub_1D77F45A8();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
  if ((_DWORD)v5 == 3)
    goto LABEL_7;
  if (v5 + 1 == v9)
  {
    v8 = v5 | 0x80;
    goto LABEL_10;
  }
  v11 = v9 > v5;
  v12 = __OFSUB__(v9, v11);
  v9 -= v11;
  if (!v12)
  {
LABEL_7:
    if ((unint64_t)v9 >= 3)
      v8 = -4;
    else
      v8 = v9;
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t ConfirmDetailsModel.Row.hash(into:)()
{
  sub_1D77F4E48();
  return sub_1D77F4E48();
}

BOOL static ConfirmDetailsModel.Row.== infix(_:_:)(unsigned __int8 *a1, char *a2)
{
  int v2;
  int v3;
  _BOOL4 v4;

  v2 = *a1;
  v3 = *a2;
  if ((v2 & 0x80u) == 0)
    v4 = v3 >= 0;
  else
    v4 = v3 < 0;
  return v2 == v3 && v4;
}

uint64_t ConfirmDetailsModel.Row.hashValue.getter()
{
  sub_1D77F4E3C();
  sub_1D77F4E48();
  sub_1D77F4E48();
  return sub_1D77F4E54();
}

uint64_t sub_1D77DE168()
{
  sub_1D77F4E3C();
  sub_1D77F4E48();
  sub_1D77F4E48();
  return sub_1D77F4E54();
}

uint64_t sub_1D77DE1BC()
{
  sub_1D77F4E48();
  return sub_1D77F4E48();
}

uint64_t sub_1D77DE1FC()
{
  sub_1D77F4E3C();
  sub_1D77F4E48();
  sub_1D77F4E48();
  return sub_1D77F4E54();
}

BOOL sub_1D77DE24C(unsigned __int8 *a1, char *a2)
{
  int v2;
  int v3;
  _BOOL4 v4;

  v2 = *a1;
  v3 = *a2;
  if ((v2 & 0x80u) == 0)
    v4 = v3 >= 0;
  else
    v4 = v3 < 0;
  return v2 == v3 && v4;
}

uint64_t sub_1D77DE278()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  uint64_t (*v24)();
  uint64_t v25;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;

  v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1D77CA580(0, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v4 = MEMORY[0x1E0C80A78](v2, v3);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v4, v7);
  v10 = (char *)&v31 - v9;
  MEMORY[0x1E0C80A78](v8, v11);
  v13 = (char *)&v31 - v12;
  sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], v1);
  MEMORY[0x1E0C80A78](v14, v15);
  v17 = (char *)&v31 - v16;
  v18 = v0 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1D77DE99C(v18, (uint64_t)v13, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  v19 = type metadata accessor for ConfirmDetailsProvider.Details();
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 48);
  if (v20(v13, 1, v19))
  {
    sub_1D77CFF04((uint64_t)v13, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
    v21 = sub_1D77F43EC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v17, 1, 1, v21);
LABEL_4:
    v23 = &qword_1F012F248;
    v24 = MEMORY[0x1E0CAEAB0];
    v25 = (uint64_t)v17;
LABEL_5:
    sub_1D77CFF04(v25, v23, (uint64_t (*)(uint64_t))v24);
    return 0;
  }
  sub_1D77DE99C((uint64_t)v13, (uint64_t)v17, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
  sub_1D77CFF04((uint64_t)v13, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  v22 = sub_1D77F43EC();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 48))(v17, 1, v22) == 1)
    goto LABEL_4;
  sub_1D77CFF04((uint64_t)v17, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
  sub_1D77DE99C(v18, (uint64_t)v10, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  if (v20(v10, 1, v19))
  {
    v23 = (unint64_t *)&qword_1F012EF08;
    v24 = type metadata accessor for ConfirmDetailsProvider.Details;
    v25 = (uint64_t)v10;
    goto LABEL_5;
  }
  v27 = *(void **)&v10[*(int *)(v19 + 24)];
  v28 = v27;
  sub_1D77CFF04((uint64_t)v10, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  if (!v27)
    return 0;

  sub_1D77DE99C(v18, (uint64_t)v6, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  if (v20(v6, 1, v19))
  {
    v23 = (unint64_t *)&qword_1F012EF08;
    v24 = type metadata accessor for ConfirmDetailsProvider.Details;
    v25 = (uint64_t)v6;
    goto LABEL_5;
  }
  v29 = *(void **)&v6[*(int *)(v19 + 20)];
  v30 = v29;
  sub_1D77CFF04((uint64_t)v6, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  if (!v29)
    return 0;

  return 1;
}

uint64_t sub_1D77DE5A8()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x1D829C934](v0 + 16);
}

uint64_t sub_1D77DE5EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1D77DE64C(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x1D829C934](v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v3[3] = v4;
  v3[4] = v5;
  return sub_1D77DE6B8;
}

void sub_1D77DE6B8(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 24) = *(_QWORD *)(*(_QWORD *)a1 + 32);
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

uint64_t sub_1D77DE728(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  sub_1D77CA580(0, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v10 - v6;
  sub_1D77DE99C(a1, (uint64_t)&v10 - v6, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  v8 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1D77E0690((uint64_t)v7, v8, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  return swift_endAccess();
}

uint64_t sub_1D77DE804@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  return sub_1D77DE99C(v3, a1, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
}

uint64_t sub_1D77DE864(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1D77E0690(a1, v3, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  return swift_endAccess();
}

uint64_t (*sub_1D77DE8CC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ConfirmDetailsModel.init(valueFormatter:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v1 + 24) = 0;
  swift_unknownObjectWeakInit();
  v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  v4 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker) = 3;
  sub_1D77C35F4(a1, v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter);
  return v1;
}

uint64_t sub_1D77DE99C(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6;

  sub_1D77CA580(0, a3, a4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_1D77DE9F4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v14;

  sub_1D77CA580(0, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v14 - v5;
  sub_1D77CF2F4(a1, (uint64_t)&v14 - v5);
  v7 = type metadata accessor for ConfirmDetailsProvider.Details();
  v8 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v8(v6, 0, 1, v7);
  v9 = (uint64_t)v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1D77E0690((uint64_t)v6, v9, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  swift_endAccess();
  sub_1D77CF2F4(a1, (uint64_t)v6);
  v8(v6, 0, 1, v7);
  v10 = (*(uint64_t (**)(char *))(*v1 + 208))(v6);
  sub_1D77CFF04((uint64_t)v6, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  *((_BYTE *)v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker) = 3;
  swift_beginAccess();
  if (!MEMORY[0x1D829C934](v1 + 2))
    return swift_bridgeObjectRelease();
  v11 = v1[3];
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v10, ObjectType, v11);
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_1D77DEBA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t inited;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_1D77CA580(0, &qword_1F012FB80, (uint64_t (*)(uint64_t))sub_1D77DEC70, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D77F64E0;
  *(_QWORD *)(inited + 32) = &unk_1E9C30E18;
  v7 = v1;
  v8 = a1;
  v4 = sub_1D77DED0C((void (*)(uint64_t *__return_ptr, uint64_t *))sub_1D77DECC4, (uint64_t)&v6, inited);
  swift_setDeallocating();
  sub_1D77DEC70();
  swift_arrayDestroy();
  return v4;
}

void sub_1D77DEC70()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012FB88)
  {
    v0 = sub_1D77F4B60();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012FB88);
  }
}

uint64_t sub_1D77DECC4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t result;
  _OWORD v6[2];

  v4 = *a1;
  v6[1] = *(_OWORD *)(v2 + 16);
  result = sub_1D77DEE30((void (*)(_QWORD *__return_ptr, char *))sub_1D77E16BC, (uint64_t)v6, v4);
  *a2 = result;
  return result;
}

uint64_t sub_1D77DED0C(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t *i;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x1E0DEE9D8];
  if (v5)
  {
    v16 = MEMORY[0x1E0DEE9D8];
    sub_1D77E6FC0(0, v5, 0);
    v6 = v16;
    for (i = (uint64_t *)(a3 + 32); ; ++i)
    {
      v14 = *i;
      swift_bridgeObjectRetain();
      a1(&v15, &v14);
      if (v4)
        break;
      v4 = 0;
      swift_bridgeObjectRelease();
      v10 = v15;
      v16 = v6;
      v12 = *(_QWORD *)(v6 + 16);
      v11 = *(_QWORD *)(v6 + 24);
      if (v12 >= v11 >> 1)
      {
        sub_1D77E6FC0(v11 > 1, v12 + 1, 1);
        v6 = v16;
      }
      *(_QWORD *)(v6 + 16) = v12 + 1;
      *(_QWORD *)(v6 + 8 * v12 + 32) = v10;
      if (!--v5)
        return v6;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_1D77DEE30(void (*a1)(_QWORD *__return_ptr, char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  char *v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD v20[2];
  char v21;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = v3;
  v20[1] = a2;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x1E0DEE9D8];
  if (v5)
  {
    v25 = MEMORY[0x1E0DEE9D8];
    sub_1D77E70E4(0, v5, 0);
    v6 = v25;
    v9 = (char *)(a3 + 32);
    while (1)
    {
      v10 = *v9++;
      v21 = v10;
      a1(v22, &v21);
      if (v4)
        break;
      v4 = 0;
      v25 = v6;
      v12 = *(_QWORD *)(v6 + 16);
      v11 = *(_QWORD *)(v6 + 24);
      if (v12 >= v11 >> 1)
        sub_1D77E70E4(v11 > 1, v12 + 1, 1);
      v13 = v23;
      v14 = v24;
      v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v23);
      MEMORY[0x1E0C80A78](v15, v15);
      v17 = (char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v18 + 16))(v17);
      sub_1D77E06E8(v12, (uint64_t)v17, &v25, v13, v14);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
      v6 = v25;
      if (!--v5)
        return v6;
    }
    swift_release();
  }
  return v6;
}

void sub_1D77DEF9C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void (*v42)(char *, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t ObjectType;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  unsigned __int8 v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(char *, uint64_t);
  uint64_t v89;
  char *v90;
  char *v91;
  char *v92;
  char *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unsigned __int8 v99[24];
  uint64_t v100[5];

  v2 = v1;
  v98 = a1;
  v96 = *v1;
  v97 = sub_1D77F45A8();
  v3 = *(_QWORD *)(v97 - 8);
  v5 = MEMORY[0x1E0C80A78](v97, v4);
  v95 = (char *)&v89 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v5, v7);
  v92 = (char *)&v89 - v9;
  v11 = MEMORY[0x1E0C80A78](v8, v10);
  v91 = (char *)&v89 - v12;
  v14 = MEMORY[0x1E0C80A78](v11, v13);
  v93 = (char *)&v89 - v15;
  v17 = MEMORY[0x1E0C80A78](v14, v16);
  v90 = (char *)&v89 - v18;
  MEMORY[0x1E0C80A78](v17, v19);
  v21 = (char *)&v89 - v20;
  sub_1D77CA580(0, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v24 = MEMORY[0x1E0C80A78](v22, v23);
  v94 = (uint64_t)&v89 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v24, v26);
  v28 = (char *)&v89 - v27;
  v29 = type metadata accessor for ConfirmDetailsProvider.Details();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29, v31);
  v33 = (char *)&v89 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = (uint64_t)v1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1D77DE99C(v34, (uint64_t)v28, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29) != 1)
  {
    sub_1D77E0824((uint64_t)v28, (uint64_t)v33, (uint64_t (*)(_QWORD))type metadata accessor for ConfirmDetailsProvider.Details);
    v89 = v3;
    v42 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v43 = v97;
    v44 = v98;
    v42(v21, v98, v97);
    v45 = OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker;
    v99[0] = *((_BYTE *)v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker);
    sub_1D77DDFEC((uint64_t)v21, v99, (char *)v100);
    v46 = LOBYTE(v100[0]);
    if (LOBYTE(v100[0]) <= 0xFBu)
    {
      if ((v100[0] & 0x80) != 0)
      {
        if (qword_1F012EC38 != -1)
          swift_once();
        v65 = sub_1D77F486C();
        __swift_project_value_buffer(v65, (uint64_t)qword_1F012FB58);
        v66 = sub_1D77F4854();
        v67 = sub_1D77F4BC0();
        if (os_log_type_enabled(v66, v67))
        {
          v68 = swift_slowAlloc();
          v69 = swift_slowAlloc();
          v100[0] = v69;
          *(_DWORD *)v68 = 136446722;
          v70 = sub_1D77F4E78();
          *(_QWORD *)v99 = sub_1D77C3A1C(v70, v71, v100);
          sub_1D77F4D04();
          swift_bridgeObjectRelease();
          *(_WORD *)(v68 + 12) = 2082;
          *(_QWORD *)v99 = sub_1D77C3A1C(0xD000000000000014, 0x80000001D77F9D30, v100);
          sub_1D77F4D04();
          *(_WORD *)(v68 + 22) = 2082;
          v99[0] = v46 & 0x7F;
          v72 = sub_1D77F4B00();
          *(_QWORD *)v99 = sub_1D77C3A1C(v72, v73, v100);
          sub_1D77F4D04();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1D77C0000, v66, v67, "[%{public}s.%{public}s]: Should not be able to tap on picker %{public}s", (uint8_t *)v68, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x1D829C8C8](v69, -1, -1);
          MEMORY[0x1D829C8C8](v68, -1, -1);

          v74 = (uint64_t)v33;
LABEL_27:
          sub_1D77E0654(v74);
          return;
        }

      }
      else
      {
        v58 = *((unsigned __int8 *)v2 + v45);
        if ((_DWORD)v58 == 3)
        {
          *((_BYTE *)v2 + v45) = v100[0];
          v59 = v93;
          MEMORY[0x1D829BB3C](v46 + 1, 0);
          v99[0] = v46 | 0x80;
          v60 = v94;
          sub_1D77CF2F4((uint64_t)v33, v94);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v30 + 56))(v60, 0, 1, v29);
          sub_1D77DFB5C(v99, v60, v100);
          sub_1D77CFF04(v60, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
          swift_beginAccess();
          v61 = MEMORY[0x1D829C934](v2 + 2);
          v62 = v89;
          if (v61)
          {
            v63 = v2[3];
            ObjectType = swift_getObjectType();
            (*(void (**)(uint64_t *, char *, uint64_t, uint64_t))(v63 + 16))(v100, v59, ObjectType, v63);
            swift_unknownObjectRelease();
          }
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v100);
          (*(void (**)(char *, uint64_t))(v62 + 8))(v59, v43);
        }
        else
        {
          v75 = v89;
          if (LOBYTE(v100[0]) == (_DWORD)v58)
          {
            *((_BYTE *)v2 + v45) = 3;
            v76 = v90;
            MEMORY[0x1D829BB3C](v46 + 1, 0);
            swift_beginAccess();
            if (MEMORY[0x1D829C934](v2 + 2))
            {
              v77 = v2[3];
              v78 = swift_getObjectType();
              (*(void (**)(char *, uint64_t, uint64_t))(v77 + 24))(v76, v78, v77);
              swift_unknownObjectRelease();
            }
            (*(void (**)(char *, uint64_t))(v75 + 8))(v76, v43);
          }
          else
          {
            v79 = v91;
            MEMORY[0x1D829BB3C](v58 + 1, 0);
            *((_BYTE *)v2 + v45) = v46;
            v80 = v92;
            MEMORY[0x1D829BB3C](v46 + 1, 0);
            v81 = v46 | 0x80;
            v82 = v79;
            v99[0] = v81;
            v83 = v94;
            sub_1D77CF2F4((uint64_t)v33, v94);
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v30 + 56))(v83, 0, 1, v29);
            sub_1D77DFB5C(v99, v83, v100);
            sub_1D77CFF04(v83, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
            swift_beginAccess();
            if (MEMORY[0x1D829C934](v2 + 2))
            {
              v84 = v2[3];
              v85 = swift_getObjectType();
              (*(void (**)(char *, uint64_t, uint64_t))(v84 + 24))(v82, v85, v84);
              swift_unknownObjectRelease();
            }
            if (MEMORY[0x1D829C934](v2 + 2))
            {
              v86 = v2[3];
              v87 = swift_getObjectType();
              (*(void (**)(uint64_t *, char *, uint64_t, uint64_t))(v86 + 16))(v100, v80, v87, v86);
              swift_unknownObjectRelease();
            }
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v100);
            v88 = *(void (**)(char *, uint64_t))(v75 + 8);
            v88(v80, v43);
            v88(v82, v43);
          }
        }
      }
    }
    else
    {
      if (qword_1F012EC38 != -1)
        swift_once();
      v47 = sub_1D77F486C();
      __swift_project_value_buffer(v47, (uint64_t)qword_1F012FB58);
      v48 = v95;
      v42(v95, v44, v43);
      v49 = v43;
      v50 = sub_1D77F4854();
      v51 = sub_1D77F4BC0();
      if (os_log_type_enabled(v50, v51))
      {
        v52 = swift_slowAlloc();
        v53 = swift_slowAlloc();
        v100[0] = v53;
        *(_DWORD *)v52 = 136446722;
        v54 = sub_1D77F4E78();
        *(_QWORD *)v99 = sub_1D77C3A1C(v54, v55, v100);
        sub_1D77F4D04();
        swift_bridgeObjectRelease();
        *(_WORD *)(v52 + 12) = 2082;
        *(_QWORD *)v99 = sub_1D77C3A1C(0xD000000000000014, 0x80000001D77F9D30, v100);
        sub_1D77F4D04();
        *(_WORD *)(v52 + 22) = 2082;
        sub_1D77C31B8(&qword_1F012FB90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1658], MEMORY[0x1E0CB1698]);
        v56 = sub_1D77F4DE8();
        *(_QWORD *)v99 = sub_1D77C3A1C(v56, v57, v100);
        sub_1D77F4D04();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v89 + 8))(v48, v49);
        _os_log_impl(&dword_1D77C0000, v50, v51, "[%{public}s.%{public}s]: Unable to determine row for index path %{public}s", (uint8_t *)v52, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x1D829C8C8](v53, -1, -1);
        MEMORY[0x1D829C8C8](v52, -1, -1);

      }
      else
      {

        (*(void (**)(char *, uint64_t))(v89 + 8))(v48, v49);
      }
    }
    v74 = (uint64_t)v33;
    goto LABEL_27;
  }
  sub_1D77CFF04((uint64_t)v28, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  if (qword_1F012EC38 != -1)
    swift_once();
  v35 = sub_1D77F486C();
  __swift_project_value_buffer(v35, (uint64_t)qword_1F012FB58);
  v36 = sub_1D77F4854();
  v37 = sub_1D77F4BB4();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    v100[0] = v39;
    *(_DWORD *)v38 = 136446466;
    v40 = sub_1D77F4E78();
    *(_QWORD *)v99 = sub_1D77C3A1C(v40, v41, v100);
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2082;
    *(_QWORD *)v99 = sub_1D77C3A1C(0xD000000000000014, 0x80000001D77F9D30, v100);
    sub_1D77F4D04();
    _os_log_impl(&dword_1D77C0000, v36, v37, "[%{public}s.%{public}s]: Attempted to change details before we received them.", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v39, -1, -1);
    MEMORY[0x1D829C8C8](v38, -1, -1);
  }

}

void (*sub_1D77DFA5C@<X0>(char *a1@<X0>, uint64_t a2@<X8>))(_BYTE *, _QWORD)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  int v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  void (*result)(_BYTE *, _QWORD);
  _QWORD *v15;
  _BYTE v16[32];

  v5 = sub_1D77F45A8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *a1;
  if (v10 < 0)
    v11 = (v10 & 0x7F) + 1;
  else
    v11 = v10;
  MEMORY[0x1D829BB3C](v11, 0);
  v12 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker);
  if (v12 == 3 || v10 < 0)
    return (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v6 + 32))(a2, v9, v5);
  v13 = sub_1D77F4590() > v12;
  result = (void (*)(_BYTE *, _QWORD))sub_1D77F4584();
  if (!__OFADD__(*v15, v13))
  {
    *v15 += v13;
    result(v16, 0);
    return (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v6 + 32))(a2, v9, v5);
  }
  __break(1u);
  return result;
}

_OWORD *sub_1D77DFB5C@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  int v40;
  uint64_t v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t (**v59)();
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t *boxed_opaque_existential_1;
  _OWORD *result;
  id v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  id v70;
  objc_class *v71;
  id v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t);
  uint64_t (**v89)();
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  id v95;
  objc_class *v96;
  _BYTE *v97;
  uint64_t v98;
  _QWORD *v99;
  void *v100;
  _BYTE *v101;
  id v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  _QWORD *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  _BYTE *v115;
  _OWORD v116[3];
  __int128 v117;
  objc_super v118;
  char v119;

  v113 = a2;
  v114 = a3;
  v115 = a1;
  v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1D77CA580(0, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v6 = MEMORY[0x1E0C80A78](v4, v5);
  v8 = (char *)&v111 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v6, v9);
  v12 = (char *)&v111 - v11;
  v14 = MEMORY[0x1E0C80A78](v10, v13);
  v16 = (char *)&v111 - v15;
  v18 = MEMORY[0x1E0C80A78](v14, v17);
  v20 = (char *)&v111 - v19;
  v22 = MEMORY[0x1E0C80A78](v18, v21);
  v24 = (char *)&v111 - v23;
  MEMORY[0x1E0C80A78](v22, v25);
  v27 = (char *)&v111 - v26;
  sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], v3);
  v30 = MEMORY[0x1E0C80A78](v28, v29);
  v32 = (char *)&v111 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v30, v33);
  v35 = (char *)&v111 - v34;
  v36 = type metadata accessor for DateOfBirthItem();
  MEMORY[0x1E0C80A78](v36, v37);
  v39 = (uint64_t *)((char *)&v111 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  v40 = *v115;
  if ((char)*v115 < 0)
  {
    v43 = v40 & 0x7F;
    if (v43)
    {
      if (v43 == 1)
      {
        sub_1D77DE99C(v113, (uint64_t)v16, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
        v44 = type metadata accessor for ConfirmDetailsProvider.Details();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 48))(v16, 1, v44) == 1)
        {
          sub_1D77CFF04((uint64_t)v16, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
          v45 = 0;
        }
        else
        {
          v45 = *(void **)&v16[*(int *)(v44 + 20)];
          v70 = v45;
          sub_1D77E0654((uint64_t)v16);
        }
        sub_1D77C4434(v112 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter, (uint64_t)v116);
        v71 = (objc_class *)type metadata accessor for WeightPickerItem();
        v72 = objc_allocWithZone(v71);
        v73 = (char *)sub_1D77E2264(v45, (uint64_t)v116);

        v74 = &v73[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate];
        swift_beginAccess();
        *((_QWORD *)v74 + 1) = &protocol witness table for ConfirmDetailsModel;
        swift_unknownObjectWeakAssign();
        v119 = 1;
        sub_1D77DDE14();
        v76 = v75;
        v78 = v77;
        v79 = &v73[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier];
        swift_beginAccess();
        *(_QWORD *)v79 = v76;
        *((_QWORD *)v79 + 1) = v78;
        swift_bridgeObjectRelease();
        v80 = v114;
        v114[3] = v71;
        result = (_OWORD *)sub_1D77C31B8(&qword_1F012FBA8, (uint64_t (*)(uint64_t))type metadata accessor for WeightPickerItem, (uint64_t)&protocol conformance descriptor for WeightPickerItem);
        v80[4] = result;
        *v80 = v73;
      }
      else
      {
        v52 = (uint64_t)v12;
        sub_1D77DE99C(v113, (uint64_t)v12, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
        v53 = type metadata accessor for ConfirmDetailsProvider.Details();
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 48))(v52, 1, v53) == 1)
        {
          sub_1D77CFF04(v52, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
          v54 = 0;
        }
        else
        {
          v54 = *(void **)(v52 + *(int *)(v53 + 24));
          v95 = v54;
          sub_1D77E0654(v52);
        }
        sub_1D77C4434(v112 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter, (uint64_t)v116);
        v96 = (objc_class *)type metadata accessor for HeightPickerItem();
        v97 = objc_allocWithZone(v96);
        *(_QWORD *)&v97[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate + 8] = 0;
        swift_unknownObjectWeakInit();
        v98 = OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight;
        *(_QWORD *)&v97[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_currentHeight] = 0;
        v97[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem____lazy_storage___usesImperialUnits] = 2;
        v99 = &v97[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier];
        *v99 = 0;
        v99[1] = 0;
        v100 = *(void **)&v97[v98];
        *(_QWORD *)&v97[v98] = v54;
        v101 = v97;
        v102 = v54;

        sub_1D77C4434((uint64_t)v116, (uint64_t)&v101[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter]);
        v118.receiver = v101;
        v118.super_class = v96;
        v103 = (char *)objc_msgSendSuper2(&v118, sel_init);

        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v116);
        v104 = &v103[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate];
        swift_beginAccess();
        *((_QWORD *)v104 + 1) = &protocol witness table for ConfirmDetailsModel;
        swift_unknownObjectWeakAssign();
        v119 = 2;
        sub_1D77DDE14();
        v106 = v105;
        v108 = v107;
        v109 = &v103[OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_baseIdentifier];
        swift_beginAccess();
        *(_QWORD *)v109 = v106;
        *((_QWORD *)v109 + 1) = v108;
        swift_bridgeObjectRelease();
        v110 = v114;
        v114[3] = v96;
        result = (_OWORD *)sub_1D77C31B8(&qword_1F012FBA0, (uint64_t (*)(uint64_t))type metadata accessor for HeightPickerItem, (uint64_t)&protocol conformance descriptor for HeightPickerItem);
        v110[4] = result;
        *v110 = v103;
      }
    }
    else
    {
      sub_1D77DE99C(v113, (uint64_t)v8, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
      v50 = type metadata accessor for ConfirmDetailsProvider.Details();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 48))(v8, 1, v50) == 1)
      {
        sub_1D77CFF04((uint64_t)v8, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
        v51 = sub_1D77F43EC();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v32, 1, 1, v51);
      }
      else
      {
        sub_1D77DE99C((uint64_t)v8, (uint64_t)v32, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
        sub_1D77E0654((uint64_t)v8);
      }
      v81 = *MEMORY[0x1E0CB77F8];
      v82 = type metadata accessor for BirthdayPickerItem();
      v83 = (_QWORD *)swift_allocObject();
      v83[5] = 0;
      v83[3] = 0;
      v83[2] = 0;
      swift_unknownObjectWeakInit();
      v84 = (char *)v83 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem____lazy_storage___calendar;
      v85 = sub_1D77F456C();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v85 - 8) + 56))(v84, 1, 1, v85);
      v86 = (uint64_t)v83 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_currentValue;
      v87 = sub_1D77F43EC();
      v88 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0];
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v87 - 8) + 56))(v86, 1, 1, v87);
      swift_beginAccess();
      sub_1D77E0690((uint64_t)v32, v86, &qword_1F012F248, v88);
      swift_endAccess();
      *(_QWORD *)((char *)v83 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_defaultAge) = v81;
      v89 = (uint64_t (**)())((char *)v83 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_dateGenerator);
      *v89 = sub_1D77D9894;
      v89[1] = 0;
      swift_beginAccess();
      v83[5] = &protocol witness table for ConfirmDetailsModel;
      swift_unknownObjectWeakAssign();
      v119 = 0;
      sub_1D77DDE14();
      v91 = v90;
      v93 = v92;
      swift_beginAccess();
      v83[2] = v91;
      v83[3] = v93;
      swift_bridgeObjectRelease();
      v94 = v114;
      v114[3] = v82;
      result = (_OWORD *)sub_1D77C31B8(&qword_1F012FB98, (uint64_t (*)(uint64_t))type metadata accessor for BirthdayPickerItem, (uint64_t)&protocol conformance descriptor for BirthdayPickerItem);
      v94[4] = result;
      *v94 = v83;
    }
  }
  else if (*v115)
  {
    if (v40 == 1)
    {
      sub_1D77DE99C(v113, (uint64_t)v24, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
      v41 = type metadata accessor for ConfirmDetailsProvider.Details();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 48))(v24, 1, v41) == 1)
      {
        sub_1D77CFF04((uint64_t)v24, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
        v42 = 0;
      }
      else
      {
        v42 = *(void **)&v24[*(int *)(v41 + 20)];
        v55 = v42;
        sub_1D77E0654((uint64_t)v24);
      }
      sub_1D77C4434(v112 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter, (uint64_t)v116 + 8);
      *(_QWORD *)&v116[0] = v42;
      v119 = 1;
      sub_1D77DDE14();
      *(_QWORD *)&v117 = v56;
      *((_QWORD *)&v117 + 1) = v57;
      v58 = v114;
      v114[3] = &type metadata for WeightItem;
      v58[4] = sub_1D77E07A8();
    }
    else
    {
      sub_1D77DE99C(v113, (uint64_t)v20, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
      v48 = type metadata accessor for ConfirmDetailsProvider.Details();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 48))(v20, 1, v48) == 1)
      {
        sub_1D77CFF04((uint64_t)v20, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
        v49 = 0;
      }
      else
      {
        v49 = *(void **)&v20[*(int *)(v48 + 24)];
        v65 = v49;
        sub_1D77E0654((uint64_t)v20);
      }
      sub_1D77C4434(v112 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter, (uint64_t)v116 + 8);
      *(_QWORD *)&v116[0] = v49;
      v119 = 2;
      sub_1D77DDE14();
      *(_QWORD *)&v117 = v66;
      *((_QWORD *)&v117 + 1) = v67;
      v58 = v114;
      v114[3] = &type metadata for HeightItem;
      v58[4] = sub_1D77E0760();
    }
    result = (_OWORD *)swift_allocObject();
    *v58 = result;
    v68 = v116[1];
    result[1] = v116[0];
    result[2] = v68;
    v69 = v117;
    result[3] = v116[2];
    result[4] = v69;
  }
  else
  {
    sub_1D77DE99C(v113, (uint64_t)v27, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
    v46 = type metadata accessor for ConfirmDetailsProvider.Details();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 48))(v27, 1, v46) == 1)
    {
      sub_1D77CFF04((uint64_t)v27, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
      v47 = sub_1D77F43EC();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v35, 1, 1, v47);
    }
    else
    {
      sub_1D77DE99C((uint64_t)v27, (uint64_t)v35, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
      sub_1D77E0654((uint64_t)v27);
    }
    sub_1D77D98FC((uint64_t)v35, (uint64_t)v39 + *(int *)(v36 + 20));
    v59 = (uint64_t (**)())((char *)v39 + *(int *)(v36 + 24));
    *v59 = sub_1D77D9894;
    v59[1] = 0;
    LOBYTE(v116[0]) = 0;
    sub_1D77DDE14();
    *v39 = v60;
    v39[1] = v61;
    v62 = v114;
    v114[3] = v36;
    v62[4] = sub_1D77C31B8(&qword_1F012FBC0, (uint64_t (*)(uint64_t))type metadata accessor for DateOfBirthItem, (uint64_t)&protocol conformance descriptor for DateOfBirthItem);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v62);
    return (_OWORD *)sub_1D77E0824((uint64_t)v39, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for DateOfBirthItem);
  }
  return result;
}

void (*sub_1D77E0598(uint64_t a1, void *a2))(_BYTE *, _QWORD)
{
  return sub_1D77E0AF0(a2);
}

void (*sub_1D77E05A0(uint64_t a1, void *a2))(_BYTE *, _QWORD)
{
  return sub_1D77E0868(a2);
}

void (*sub_1D77E05A8(uint64_t a1, uint64_t a2))(_BYTE *, _QWORD)
{
  return sub_1D77E0D78(a2);
}

uint64_t ConfirmDetailsModel.deinit()
{
  uint64_t v0;

  sub_1D77C564C(v0 + 16);
  sub_1D77CFF04(v0 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter);
  return v0;
}

uint64_t ConfirmDetailsModel.__deallocating_deinit()
{
  uint64_t v0;

  sub_1D77C564C(v0 + 16);
  sub_1D77CFF04(v0 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_valueFormatter);
  return swift_deallocClassInstance();
}

uint64_t sub_1D77E0654(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ConfirmDetailsProvider.Details();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D77E0690(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6;

  sub_1D77CA580(0, a3, a4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a2, a1, v6);
  return a2;
}

uint64_t sub_1D77E06E8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a4;
  v14 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  v10 = *a3;
  *(_QWORD *)(v10 + 16) = a1 + 1;
  return sub_1D77C35F4(&v12, v10 + 40 * a1 + 32);
}

unint64_t sub_1D77E0760()
{
  unint64_t result;

  result = qword_1F012FBB0;
  if (!qword_1F012FBB0)
  {
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for HeightItem, &type metadata for HeightItem);
    atomic_store(result, (unint64_t *)&qword_1F012FBB0);
  }
  return result;
}

unint64_t sub_1D77E07A8()
{
  unint64_t result;

  result = qword_1F012FBB8;
  if (!qword_1F012FBB8)
  {
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for WeightItem, &type metadata for WeightItem);
    atomic_store(result, (unint64_t *)&qword_1F012FBB8);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 24);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1D77E0824(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void (*sub_1D77E0868(void *a1))(_BYTE *, _QWORD)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
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
  uint64_t v15;
  _BYTE *v16;
  uint64_t (*v17)();
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*result)(_BYTE *, _QWORD);
  _QWORD *v28;
  uint64_t v29;
  uint64_t ObjectType;
  _BYTE v31[32];
  _QWORD v32[5];

  v2 = v1;
  v4 = sub_1D77F45A8();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x1E0C80A78](v4, v6);
  v9 = &v31[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v7, v10);
  v12 = &v31[-v11];
  sub_1D77CA580(0, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = &v31[-v15];
  v17 = sub_1D77DE8CC();
  v19 = v18;
  v20 = type metadata accessor for ConfirmDetailsProvider.Details();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 48))(v19, 1, v20))
  {
    v21 = *(int *)(v20 + 24);
    v22 = *(void **)(v19 + v21);
    *(_QWORD *)(v19 + v21) = a1;
    v23 = a1;

  }
  ((void (*)(_QWORD *, _QWORD))v17)(v32, 0);
  v31[0] = 2;
  v24 = v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1D77DE99C(v24, (uint64_t)v16, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  sub_1D77DFB5C(v31, (uint64_t)v16, v32);
  sub_1D77CFF04((uint64_t)v16, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  MEMORY[0x1D829BB3C](2, 0);
  v25 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker);
  if (v25 != 3)
  {
    v26 = sub_1D77F4590() > v25;
    result = (void (*)(_BYTE *, _QWORD))sub_1D77F4584();
    if (__OFADD__(*v28, v26))
    {
      __break(1u);
      return result;
    }
    *v28 += v26;
    result(v31, 0);
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(v12, v9, v4);
  swift_beginAccess();
  if (MEMORY[0x1D829C934](v2 + 16))
  {
    v29 = *(_QWORD *)(v2 + 24);
    ObjectType = swift_getObjectType();
    (*(void (**)(_BYTE *, _QWORD *, uint64_t, uint64_t))(v29 + 8))(v12, v32, ObjectType, v29);
    swift_unknownObjectRelease();
  }
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v12, v4);
  return (void (*)(_BYTE *, _QWORD))__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
}

void (*sub_1D77E0AF0(void *a1))(_BYTE *, _QWORD)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
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
  uint64_t v15;
  _BYTE *v16;
  uint64_t (*v17)();
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*result)(_BYTE *, _QWORD);
  _QWORD *v28;
  uint64_t v29;
  uint64_t ObjectType;
  _BYTE v31[32];
  _QWORD v32[5];

  v2 = v1;
  v4 = sub_1D77F45A8();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x1E0C80A78](v4, v6);
  v9 = &v31[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v7, v10);
  v12 = &v31[-v11];
  sub_1D77CA580(0, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = &v31[-v15];
  v17 = sub_1D77DE8CC();
  v19 = v18;
  v20 = type metadata accessor for ConfirmDetailsProvider.Details();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 48))(v19, 1, v20))
  {
    v21 = *(int *)(v20 + 20);
    v22 = *(void **)(v19 + v21);
    *(_QWORD *)(v19 + v21) = a1;
    v23 = a1;

  }
  ((void (*)(_QWORD *, _QWORD))v17)(v32, 0);
  v31[0] = 1;
  v24 = v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1D77DE99C(v24, (uint64_t)v16, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  sub_1D77DFB5C(v31, (uint64_t)v16, v32);
  sub_1D77CFF04((uint64_t)v16, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  MEMORY[0x1D829BB3C](1, 0);
  v25 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker);
  if (v25 != 3)
  {
    v26 = sub_1D77F4590() > v25;
    result = (void (*)(_BYTE *, _QWORD))sub_1D77F4584();
    if (__OFADD__(*v28, v26))
    {
      __break(1u);
      return result;
    }
    *v28 += v26;
    result(v31, 0);
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(v12, v9, v4);
  swift_beginAccess();
  if (MEMORY[0x1D829C934](v2 + 16))
  {
    v29 = *(_QWORD *)(v2 + 24);
    ObjectType = swift_getObjectType();
    (*(void (**)(_BYTE *, _QWORD *, uint64_t, uint64_t))(v29 + 8))(v12, v32, ObjectType, v29);
    swift_unknownObjectRelease();
  }
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v12, v4);
  return (void (*)(_BYTE *, _QWORD))__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
}

void (*sub_1D77E0D78(uint64_t a1))(_BYTE *, _QWORD)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
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
  uint64_t v15;
  _BYTE *v16;
  uint64_t (*v17)();
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*result)(_BYTE *, _QWORD);
  _QWORD *v28;
  uint64_t v29;
  uint64_t ObjectType;
  _BYTE v31[32];
  _QWORD v32[5];

  v2 = v1;
  v4 = sub_1D77F45A8();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x1E0C80A78](v4, v6);
  v9 = &v31[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v7, v10);
  v12 = &v31[-v11];
  sub_1D77CA580(0, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = &v31[-v15];
  v17 = sub_1D77DE8CC();
  v19 = v18;
  v20 = type metadata accessor for ConfirmDetailsProvider.Details();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 48))(v19, 1, v20))
  {
    sub_1D77CFF04(v19, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
    v21 = sub_1D77F43EC();
    v22 = a1;
    v23 = *(_QWORD *)(v21 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v19, v22, v21);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v23 + 56))(v19, 0, 1, v21);
  }
  ((void (*)(_QWORD *, _QWORD))v17)(v32, 0);
  v31[0] = 0;
  v24 = v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  sub_1D77DE99C(v24, (uint64_t)v16, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  sub_1D77DFB5C(v31, (uint64_t)v16, v32);
  sub_1D77CFF04((uint64_t)v16, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
  MEMORY[0x1D829BB3C](0, 0);
  v25 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_visiblePicker);
  if (v25 != 3)
  {
    v26 = sub_1D77F4590() > v25;
    result = (void (*)(_BYTE *, _QWORD))sub_1D77F4584();
    if (__OFADD__(*v28, v26))
    {
      __break(1u);
      return result;
    }
    *v28 += v26;
    result(v31, 0);
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(v12, v9, v4);
  swift_beginAccess();
  if (MEMORY[0x1D829C934](v2 + 16))
  {
    v29 = *(_QWORD *)(v2 + 24);
    ObjectType = swift_getObjectType();
    (*(void (**)(_BYTE *, _QWORD *, uint64_t, uint64_t))(v29 + 8))(v12, v32, ObjectType, v29);
    swift_unknownObjectRelease();
  }
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v12, v4);
  return (void (*)(_BYTE *, _QWORD))__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
}

unint64_t sub_1D77E103C()
{
  unint64_t result;

  result = qword_1F012FBC8;
  if (!qword_1F012FBC8)
  {
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for ConfirmDetailsModel.Row.HealthDetail, &type metadata for ConfirmDetailsModel.Row.HealthDetail);
    atomic_store(result, (unint64_t *)&qword_1F012FBC8);
  }
  return result;
}

unint64_t sub_1D77E1084()
{
  unint64_t result;

  result = qword_1F012FBD0;
  if (!qword_1F012FBD0)
  {
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for ConfirmDetailsModel.Row, &type metadata for ConfirmDetailsModel.Row);
    atomic_store(result, (unint64_t *)&qword_1F012FBD0);
  }
  return result;
}

uint64_t sub_1D77E10C8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  v4 = *a1 + 16;
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v4);
  v6 = *(_QWORD *)(v3 + 24);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_1D77E1120(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 24) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1D77E1178@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  return sub_1D77DE99C(v3, a2, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details);
}

uint64_t dispatch thunk of ConfirmDetailsModelDelegate.update(indexPath:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of ConfirmDetailsModelDelegate.insert(item:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of ConfirmDetailsModelDelegate.remove(itemAt:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ConfirmDetailsModelDelegate.updateAllItems(newItems:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_1D77E1200()
{
  return type metadata accessor for ConfirmDetailsModel();
}

uint64_t type metadata accessor for ConfirmDetailsModel()
{
  uint64_t result;

  result = qword_1F012FC00;
  if (!qword_1F012FC00)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1D77E1244()
{
  unint64_t v0;

  sub_1D77CA580(319, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for ConfirmDetailsModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ConfirmDetailsModel.canProceed.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.delegate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.delegate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.delegate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.mostRecentDetails.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.mostRecentDetails.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.mostRecentDetails.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.__allocating_init(valueFormatter:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.updateDetails(newDetails:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.generateFullSetOfItems(details:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.selected(indexPath:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.determineIndexPath(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.makeItem(for:latestDetails:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.weightPickerItem(_:didSelectWeight:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.heightPickerItem(_:didSelectHeight:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of ConfirmDetailsModel.birthdayPickerItem(_:didSelectBirthdayComponents:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t getEnumTagSinglePayload for ConfirmDetailsModel.Row(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;

  if (!a2)
    return 0;
  if (a2 < 0x3F)
    goto LABEL_17;
  if (a2 + 193 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 193) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 193;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 193;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 193;
  }
LABEL_17:
  v6 = ((*a1 >> 1) & 0x3E | (*a1 >> 7)) ^ 0x3F;
  if (v6 >= 0x3E)
    v6 = -1;
  return v6 + 1;
}

uint64_t storeEnumTagSinglePayload for ConfirmDetailsModel.Row(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 193 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 193) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x3F)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x3E)
    return ((uint64_t (*)(void))((char *)&loc_1D77E149C + 4 * byte_1D77F6C75[v4]))();
  *a1 = a2 - 63;
  return ((uint64_t (*)(void))((char *)sub_1D77E14D0 + 4 * byte_1D77F6C70[v4]))();
}

uint64_t sub_1D77E14D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77E14D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D77E14E0);
  return result;
}

uint64_t sub_1D77E14F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D77E1500);
  *(_BYTE *)result = 4 * (((-a2 >> 1) & 0x1F) - 32 * a2);
  return result;
}

uint64_t sub_1D77E1504(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77E150C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77E1518(unsigned __int8 *a1)
{
  return *a1 >> 7;
}

_BYTE *sub_1D77E1524(_BYTE *result)
{
  *result &= ~0x80u;
  return result;
}

_BYTE *sub_1D77E1534(_BYTE *result, char a2)
{
  *result = *result & 3 | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for ConfirmDetailsModel.Row()
{
  return &type metadata for ConfirmDetailsModel.Row;
}

uint64_t getEnumTagSinglePayload for ConfirmDetailsModel.Row.HealthDetail(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ConfirmDetailsModel.Row.HealthDetail(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D77E1634 + 4 * byte_1D77F6C7F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1D77E1668 + 4 * byte_1D77F6C7A[v4]))();
}

uint64_t sub_1D77E1668(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77E1670(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D77E1678);
  return result;
}

uint64_t sub_1D77E1684(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D77E168CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1D77E1690(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77E1698(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1D77E16A4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ConfirmDetailsModel.Row.HealthDetail()
{
  return &type metadata for ConfirmDetailsModel.Row.HealthDetail;
}

_OWORD *sub_1D77E16BC@<X0>(char *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char v5;

  v3 = *(_QWORD *)(v2 + 24);
  v5 = *a1;
  return sub_1D77DFB5C(&v5, v3, a2);
}

id WeightPickerItem.__allocating_init(initialValue:valueFormatter:)(void *a1, uint64_t a2)
{
  objc_class *v2;
  id v5;
  id v6;

  v5 = objc_allocWithZone(v2);
  v6 = sub_1D77E2264(a1, a2);

  return v6;
}

void sub_1D77E1748(uint64_t a1)
{
  sub_1D77E1788(1000.0, a1, &qword_1F01330E0);
}

void sub_1D77E1760(uint64_t a1)
{
  sub_1D77E1788(1.0, a1, &qword_1F01330E8);
}

void sub_1D77E1770(uint64_t a1)
{
  sub_1D77E1788(159.0, a1, &qword_1F01330F0);
}

void sub_1D77E1788(double a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  id v6;

  v5 = objc_msgSend((id)objc_opt_self(), sel_poundUnit);
  v6 = objc_msgSend((id)objc_opt_self(), sel_quantityWithUnit_doubleValue_, v5, a1);

  *a3 = v6;
}

id sub_1D77E1810()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  char v11;

  v1 = OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeUnit;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeUnit);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeUnit);
  }
  else
  {
    v4 = v0;
    v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_valueFormatter + 24);
    v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_valueFormatter + 32);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_valueFormatter), v5);
    v11 = 0;
    v7 = (void *)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 8))(&v11, v5, v6);
    v8 = *(void **)(v0 + v1);
    *(_QWORD *)(v4 + v1) = v7;
    v3 = v7;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

void sub_1D77E18B0()
{
  sub_1D77E18F8(&OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeMaxWeight, &qword_1F012EC40, (void **)&qword_1F01330E0);
}

void sub_1D77E18D4()
{
  sub_1D77E18F8(&OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeMinWeight, &qword_1F012EC48, (void **)&qword_1F01330E8);
}

void sub_1D77E18F8(_QWORD *a1, _QWORD *a2, void **a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;

  v4 = v3 + *a1;
  if (*(_BYTE *)(v4 + 8) == 1)
  {
    if (*a2 != -1)
      swift_once();
    v6 = *a3;
    v7 = sub_1D77E1810();
    objc_msgSend(v6, sel_doubleValueForUnit_, v7);
    v9 = v8;

    v10 = round(v9);
    if ((~*(_QWORD *)&v10 & 0x7FF0000000000000) != 0)
    {
      if (v10 > -9.22337204e18)
      {
        if (v10 < 9.22337204e18)
        {
          *(_QWORD *)v4 = (uint64_t)v10;
          *(_BYTE *)(v4 + 8) = 0;
          return;
        }
        goto LABEL_11;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_11:
    __break(1u);
  }
}

void sub_1D77E19D4()
{
  sub_1D77E18F8(&OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeAverageWeight, &qword_1F012EC50, (void **)&qword_1F01330F0);
}

uint64_t sub_1D77E19F8()
{
  swift_getObjectType();
  sub_1D77E236C();
  return sub_1D77F4B00();
}

uint64_t sub_1D77E1A30()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate;
  swift_beginAccess();
  return MEMORY[0x1D829C934](v1);
}

uint64_t sub_1D77E1A7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1D77E1AE4(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x1D829C934](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1D77C4D1C;
}

uint64_t sub_1D77E1B58(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1D77E1BC0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1D77E1C14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1D77E1C70())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id WeightPickerItem.init(initialValue:valueFormatter:)(void *a1, uint64_t a2)
{
  id v3;

  v3 = sub_1D77E2264(a1, a2);

  return v3;
}

void sub_1D77E1CE0(void *a1, char a2)
{
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = sub_1D77E1810();
  objc_msgSend(a1, sel_doubleValueForUnit_, v4);
  v6 = v5;

  v7 = round(v6);
  if ((~*(_QWORD *)&v7 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v7 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v7 >= 9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((a2 & 1) == 0)
    return;
  sub_1D77E18D4();
  v9 = v8;
  sub_1D77E18B0();
  if (v10 < v9)
  {
LABEL_11:
    __break(1u);
    return;
  }
  sub_1D77F4AC4();
}

id WeightPickerItem.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void WeightPickerItem.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WeightPickerItem.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WeightPickerItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D77E1EE0()
{
  swift_getObjectType();
  sub_1D77E236C();
  return sub_1D77F4B00();
}

uint64_t sub_1D77E1F18()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(*v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1D77E1F70(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v5;

  v5 = (_QWORD *)(*v2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1D77E1FD0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void WeightPickerItem.initialSelections.getter()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1D77D5BF4();
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1D77F64E0;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_currentWeight);
  if (v2)
  {
    v3 = v2;
    sub_1D77E1CE0(v3, 1);
    v5 = v4;

  }
  else
  {
    sub_1D77E19D4();
    v5 = v6;
  }
  sub_1D77E18D4();
  if (__OFSUB__(v5, v7))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 32) = v5 - v7;
    *(_QWORD *)(v1 + 40) = 0;
  }
}

Swift::Int __swiftcall WeightPickerItem.numberOfComponents(in:)(UIPickerView *in)
{
  return 1;
}

Swift::Int __swiftcall WeightPickerItem.pickerView(_:numberOfRowsInComponent:)(UIPickerView *_, Swift::Int numberOfRowsInComponent)
{
  Swift::Int result;
  uint64_t v3;
  uint64_t v4;
  Swift::Int v5;

  if (numberOfRowsInComponent)
    return 0;
  sub_1D77E18B0();
  v4 = v3;
  sub_1D77E18D4();
  v5 = v4 - result;
  if (__OFSUB__(v4, result))
  {
    __break(1u);
    goto LABEL_7;
  }
  result = v5 + 1;
  if (__OFADD__(v5, 1))
LABEL_7:
    __break(1u);
  return result;
}

Swift::String_optional __swiftcall WeightPickerItem.pickerView(_:titleForRow:forComponent:)(UIPickerView *_, Swift::Int titleForRow, Swift::Int forComponent)
{
  uint64_t v3;
  void *v4;
  Swift::String_optional result;

  sub_1D77E23C0(titleForRow, forComponent);
  result.value._object = v4;
  result.value._countAndFlagsBits = v3;
  return result;
}

Swift::Void __swiftcall WeightPickerItem.pickerView(_:didSelectRow:inComponent:)(UIPickerView *_, Swift::Int didSelectRow, Swift::Int inComponent)
{
  sub_1D77E24A8(didSelectRow);
}

id sub_1D77E2264(void *a1, uint64_t a2)
{
  char *v2;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  char *v11;
  id v12;
  id v13;
  objc_super v15;

  *(_QWORD *)&v2[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeUnit] = 0;
  v5 = &v2[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeMaxWeight];
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  v6 = &v2[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeMinWeight];
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  v7 = &v2[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem____lazy_storage___localeAverageWeight];
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v8 = OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_currentWeight;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_currentWeight] = 0;
  v9 = &v2[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v10 = *(void **)&v2[v8];
  *(_QWORD *)&v2[v8] = a1;
  v11 = v2;
  v12 = a1;

  sub_1D77C4434(a2, (uint64_t)&v11[OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_valueFormatter]);
  v15.receiver = v11;
  v15.super_class = (Class)type metadata accessor for WeightPickerItem();
  v13 = objc_msgSendSuper2(&v15, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v13;
}

unint64_t sub_1D77E236C()
{
  unint64_t result;

  result = qword_1F012FD38;
  if (!qword_1F012FD38)
  {
    type metadata accessor for WeightPickerItem();
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012FD38);
  }
  return result;
}

uint64_t type metadata accessor for WeightPickerItem()
{
  return objc_opt_self();
}

void sub_1D77E23C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  if (!a2)
  {
    sub_1D77E18B0();
    if (v4 >= a1)
    {
      v5 = sub_1D77E1810();
      sub_1D77E18D4();
      if (__OFADD__(a1, v6))
      {
        __break(1u);
      }
      else
      {
        v7 = objc_msgSend((id)objc_opt_self(), sel_quantityWithUnit_doubleValue_, v5, (double)(a1 + v6));

        v8 = *(_QWORD *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_valueFormatter + 24);
        v9 = *(_QWORD *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_valueFormatter + 32);
        __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_valueFormatter), v8);
        v10 = 0;
        (*(void (**)(char *, id, uint64_t, uint64_t))(v9 + 16))(&v10, v7, v8, v9);

      }
    }
  }
}

void sub_1D77E24A8(uint64_t a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;

  v3 = sub_1D77E1810();
  sub_1D77E18D4();
  if (__OFADD__(a1, v4))
  {
    __break(1u);
  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_self(), sel_quantityWithUnit_doubleValue_, v3, (double)(a1 + v4));

    v6 = *(void **)(v1 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_currentWeight);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_currentWeight) = v5;
    v7 = v5;

    v8 = v1 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate;
    swift_beginAccess();
    if (MEMORY[0x1D829C934](v8))
    {
      v9 = *(_QWORD *)(v8 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v9 + 8))(v1, v7, ObjectType, v9);
      swift_unknownObjectRelease();
    }

  }
}

uint64_t sub_1D77E25A4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate;
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1D77E25FC(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_delegate;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1D77E265C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC16HealthMobilityUI16WeightPickerItem_baseIdentifier);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of WeightPickerItemDelegate.weightPickerItem(_:didSelectWeight:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t method lookup function for WeightPickerItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WeightPickerItem.reuseIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of WeightPickerItem.uniqueIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of WeightPickerItem.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of WeightPickerItem.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of WeightPickerItem.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of WeightPickerItem.baseIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of WeightPickerItem.baseIdentifier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of WeightPickerItem.baseIdentifier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of WeightPickerItem.__allocating_init(initialValue:valueFormatter:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t type metadata accessor for FavoritableObjectTypeDataSource()
{
  uint64_t result;

  result = qword_1F012FDB8;
  if (!qword_1F012FDB8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D77E27EC()
{
  return swift_initClassMetadata2();
}

void sub_1D77E2828()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1D77E2854()
{
  sub_1D77F471C();
  return swift_deallocClassInstance();
}

uint64_t sub_1D77E2870()
{
  return type metadata accessor for FavoritableObjectTypeDataSource();
}

id sub_1D77E2968()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NoCellNecessary();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for NoCellNecessary()
{
  return objc_opt_self();
}

uint64_t sub_1D77E29CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUIP33_E7FCF198A4429241325AB5C121E51D8015NoCellNecessary_item;
  swift_beginAccess();
  return sub_1D77CB068(v3, a1);
}

uint64_t sub_1D77E2A1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUIP33_E7FCF198A4429241325AB5C121E51D8015NoCellNecessary_item;
  swift_beginAccess();
  sub_1D77E2B40(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1D77E2A74())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1D77E2AB8()
{
  return sub_1D77E2B00(&qword_1F012FE38, (uint64_t)&unk_1D77F6FC8);
}

uint64_t sub_1D77E2ADC()
{
  return sub_1D77E2B00(&qword_1F012FE40, (uint64_t)&unk_1D77F6FF0);
}

uint64_t sub_1D77E2B00(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for NoCellNecessary();
    result = MEMORY[0x1D829C838](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D77E2B40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77E2B84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1D77E2B84()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012F0E0)
  {
    sub_1D77E2BD8();
    v0 = sub_1D77F4CF8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012F0E0);
  }
}

unint64_t sub_1D77E2BD8()
{
  unint64_t result;

  result = qword_1F012F0E8;
  if (!qword_1F012F0E8)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012F0E8);
  }
  return result;
}

uint64_t sub_1D77E2C2C(uint64_t a1)
{
  uint64_t v2;

  sub_1D77E2B84();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *BirthdayPickerItem.__allocating_init(initialValue:defaultAge:dateGenerator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  _QWORD *v14;

  v8 = (_QWORD *)swift_allocObject();
  v8[5] = 0;
  v8[2] = 0;
  v8[3] = 0;
  swift_unknownObjectWeakInit();
  v9 = (char *)v8 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem____lazy_storage___calendar;
  v10 = sub_1D77F456C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (uint64_t)v8 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_currentValue;
  v12 = sub_1D77F43EC();
  v13 = (void (*)(uint64_t))MEMORY[0x1E0CAEAB0];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  swift_beginAccess();
  sub_1D77E4034(a1, v11, &qword_1F012F248, v13);
  swift_endAccess();
  *(_QWORD *)((char *)v8 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_defaultAge) = a2;
  v14 = (_QWORD *)((char *)v8 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_dateGenerator);
  *v14 = a3;
  v14[1] = a4;
  return v8;
}

uint64_t sub_1D77E2D98()
{
  type metadata accessor for CalendarPickerTableViewCell();
  sub_1D77E33D0();
  return sub_1D77F4698();
}

uint64_t sub_1D77E2DCC()
{
  sub_1D77E3418();
  return sub_1D77F4B00();
}

uint64_t sub_1D77E2E00(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_1D77E2E5C()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1D77E2EA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1D77E2EF4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1D77E2F30()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x1D829C934](v0 + 32);
}

uint64_t sub_1D77E2F74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 40) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1D77E2FD4(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x1D829C934](v1 + 32);
  v5 = *(_QWORD *)(v1 + 40);
  v3[3] = v4;
  v3[4] = v5;
  return sub_1D77E3040;
}

void sub_1D77E3040(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 40) = *(_QWORD *)(*(_QWORD *)a1 + 32);
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

uint64_t sub_1D77E30B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v21[24];

  v3 = sub_1D77F4518();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = (void (*)(uint64_t))MEMORY[0x1E0CB11F0];
  sub_1D77E3ACC(0, &qword_1F012FE78, (void (*)(uint64_t))MEMORY[0x1E0CB11F0]);
  v11 = MEMORY[0x1E0C80A78](v9, v10);
  v13 = &v21[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v11, v14);
  v16 = &v21[-v15];
  v17 = v1 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem____lazy_storage___calendar;
  swift_beginAccess();
  sub_1D77E3FE8(v17, (uint64_t)v16, &qword_1F012FE78, v8);
  v18 = sub_1D77F456C();
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1)
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v19 + 32))(a1, v16, v18);
  sub_1D77E3504((uint64_t)v16, &qword_1F012FE78, v8);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x1E0CB0EF8], v3);
  sub_1D77F4524();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v7, v3);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v19 + 16))(v13, a1, v18);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v13, 0, 1, v18);
  swift_beginAccess();
  sub_1D77E4034((uint64_t)v13, v17, &qword_1F012FE78, v8);
  return swift_endAccess();
}

_QWORD *BirthdayPickerItem.init(initialValue:defaultAge:dateGenerator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  _QWORD *v14;

  v4[5] = 0;
  v4[2] = 0;
  v4[3] = 0;
  swift_unknownObjectWeakInit();
  v9 = (char *)v4 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem____lazy_storage___calendar;
  v10 = sub_1D77F456C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (uint64_t)v4 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_currentValue;
  v12 = sub_1D77F43EC();
  v13 = (void (*)(uint64_t))MEMORY[0x1E0CAEAB0];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  swift_beginAccess();
  sub_1D77E4034(a1, v11, &qword_1F012F248, v13);
  swift_endAccess();
  *(_QWORD *)((char *)v4 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_defaultAge) = a2;
  v14 = (_QWORD *)((char *)v4 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_dateGenerator);
  *v14 = a3;
  v14[1] = a4;
  return v4;
}

unint64_t sub_1D77E33D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F012FE68;
  if (!qword_1F012FE68)
  {
    v1 = type metadata accessor for CalendarPickerTableViewCell();
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for CalendarPickerTableViewCell, v1);
    atomic_store(result, (unint64_t *)&qword_1F012FE68);
  }
  return result;
}

unint64_t sub_1D77E3418()
{
  unint64_t result;

  result = qword_1F012FE70;
  if (!qword_1F012FE70)
  {
    type metadata accessor for BirthdayPickerItem();
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012FE70);
  }
  return result;
}

uint64_t type metadata accessor for BirthdayPickerItem()
{
  uint64_t result;

  result = qword_1F012FEA8;
  if (!qword_1F012FEA8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t BirthdayPickerItem.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_1D77C564C(v0 + 32);
  sub_1D77E3504(v0 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem____lazy_storage___calendar, &qword_1F012FE78, (void (*)(uint64_t))MEMORY[0x1E0CB11F0]);
  sub_1D77E3504(v0 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_currentValue, &qword_1F012F248, (void (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
  swift_release();
  return v0;
}

uint64_t sub_1D77E3504(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  sub_1D77E3ACC(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t BirthdayPickerItem.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_1D77C564C(v0 + 32);
  sub_1D77E3504(v0 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem____lazy_storage___calendar, &qword_1F012FE78, (void (*)(uint64_t))MEMORY[0x1E0CB11F0]);
  sub_1D77E3504(v0 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_currentValue, &qword_1F012F248, (void (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1D77E35C4()
{
  sub_1D77E3418();
  return sub_1D77F4B00();
}

uint64_t sub_1D77E35FC()
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

uint64_t sub_1D77E3648(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;

  v5 = *v2;
  swift_beginAccess();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1D77E369C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t BirthdayPickerItem.initialDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void (*v20)(uint64_t);
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
  uint64_t v31;
  void (*v32)(void);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  void (*v37)(void);
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(void);
  uint64_t v50;
  uint64_t v51;

  v47 = a1;
  v2 = sub_1D77F44DC();
  v3 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
  v48 = *(_QWORD *)(v2 - 8);
  v49 = (void (*)(void))v2;
  MEMORY[0x1E0C80A78](v2, v4);
  v43 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1D77F4560();
  v45 = *(_QWORD *)(v6 - 8);
  v46 = v6;
  MEMORY[0x1E0C80A78](v6, v7);
  v44 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D77F456C();
  v50 = *(_QWORD *)(v9 - 8);
  v51 = v9;
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77E3ACC(0, (unint64_t *)&qword_1F012F938, v3);
  v15 = MEMORY[0x1E0C80A78](v13, v14);
  v42 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15, v17);
  v19 = (char *)&v41 - v18;
  v20 = (void (*)(uint64_t))MEMORY[0x1E0CAEAB0];
  sub_1D77E3ACC(0, &qword_1F012F248, (void (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
  MEMORY[0x1E0C80A78](v21, v22);
  v24 = (char *)&v41 - v23;
  v25 = sub_1D77F43EC();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x1E0C80A78](v25, v27);
  v29 = (char *)&v41 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = v1 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_currentValue;
  swift_beginAccess();
  sub_1D77E3FE8(v30, (uint64_t)v24, &qword_1F012F248, v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25) == 1)
  {
    sub_1D77E3504((uint64_t)v24, &qword_1F012F248, (void (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
    v31 = v48;
    v32 = v49;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v29, v24, v25);
    sub_1D77E30B0((uint64_t)v12);
    sub_1D77F453C();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v12, v51);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v25);
    v31 = v48;
    v32 = v49;
    if ((*(unsigned int (**)(char *, uint64_t, void (*)(void)))(v48 + 48))(v19, 1, v49) != 1)
      return (*(uint64_t (**)(uint64_t, char *, void (*)(void)))(v31 + 32))(v47, v19, v32);
    sub_1D77E3504((uint64_t)v19, (unint64_t *)&qword_1F012F938, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  }
  sub_1D77E30B0((uint64_t)v12);
  v33 = v44;
  v34 = v45;
  v35 = v46;
  result = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v45 + 104))(v44, *MEMORY[0x1E0CB1158], v46);
  if (__OFSUB__(0, *(_QWORD *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_defaultAge)))
  {
    __break(1u);
    return result;
  }
  v37 = *(void (**)(void))(v1 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_dateGenerator);
  v38 = v12;
  v39 = v33;
  v40 = v43;
  v48 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_dateGenerator + 8);
  v49 = v37;
  ((void (*)(uint64_t))v37)(result);
  v19 = v42;
  sub_1D77F4548();
  (*(void (**)(char *, void (*)(void)))(v31 + 8))(v40, v32);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v39, v35);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v38, v51);
  if ((*(unsigned int (**)(char *, uint64_t, void (*)(void)))(v31 + 48))(v19, 1, v32) == 1)
  {
    v49();
    return sub_1D77E3504((uint64_t)v19, (unint64_t *)&qword_1F012F938, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  }
  return (*(uint64_t (**)(uint64_t, char *, void (*)(void)))(v31 + 32))(v47, v19, v32);
}

void sub_1D77E3ACC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1D77F4CF8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t BirthdayPickerItem.calendarPicker(_:didSelectNewDate:)(uint64_t a1, uint64_t a2)
{
  return sub_1D77E3B64(a2);
}

uint64_t sub_1D77E3B20@<X0>(uint64_t a1@<X8>)
{
  return BirthdayPickerItem.initialDate.getter(a1);
}

uint64_t sub_1D77E3B40(uint64_t a1, uint64_t a2)
{
  return sub_1D77E3B64(a2);
}

uint64_t sub_1D77E3B64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t ObjectType;
  uint64_t v24;

  v2 = v1;
  v24 = a1;
  sub_1D77E3ACC(0, &qword_1F012F248, (void (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v24 - v5;
  v7 = sub_1D77F456C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1D77F43EC();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12, v14);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77E30B0((uint64_t)v11);
  v17 = (void *)sub_1D77F4530();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  v18 = (void *)sub_1D77F44B8();
  v19 = objc_msgSend(v17, sel_hk_dateOfBirthDateComponentsWithDate_, v18, v24);

  sub_1D77F43E0();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v6, v16, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v6, 0, 1, v12);
  v20 = v2 + OBJC_IVAR____TtC16HealthMobilityUI18BirthdayPickerItem_currentValue;
  swift_beginAccess();
  sub_1D77E4034((uint64_t)v6, v20, &qword_1F012F248, (void (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
  swift_endAccess();
  swift_beginAccess();
  if (MEMORY[0x1D829C934](v2 + 32))
  {
    v21 = *(_QWORD *)(v2 + 40);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, char *, uint64_t, uint64_t))(v21 + 8))(v2, v16, ObjectType, v21);
    swift_unknownObjectRelease();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v12);
}

uint64_t sub_1D77E3D94@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_1D77E3DE0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  v4 = *a1 + 32;
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v4);
  v6 = *(_QWORD *)(v3 + 40);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_1D77E3E38(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 40) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of BirthdayPickerItemDelegate.birthdayPickerItem(_:didSelectBirthdayComponents:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_1D77E3E98()
{
  return type metadata accessor for BirthdayPickerItem();
}

void sub_1D77E3EA0()
{
  unint64_t v0;
  unint64_t v1;

  sub_1D77E3ACC(319, &qword_1F012FE78, (void (*)(uint64_t))MEMORY[0x1E0CB11F0]);
  if (v0 <= 0x3F)
  {
    sub_1D77E3ACC(319, &qword_1F012F248, (void (*)(uint64_t))MEMORY[0x1E0CAEAB0]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for BirthdayPickerItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BirthdayPickerItem.reuseIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of BirthdayPickerItem.uniqueIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of BirthdayPickerItem.baseIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of BirthdayPickerItem.baseIdentifier.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of BirthdayPickerItem.baseIdentifier.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of BirthdayPickerItem.delegate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of BirthdayPickerItem.delegate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of BirthdayPickerItem.delegate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of BirthdayPickerItem.__allocating_init(initialValue:defaultAge:dateGenerator:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t sub_1D77E3FE8(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  uint64_t v6;

  sub_1D77E3ACC(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_1D77E4034(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  uint64_t v6;

  sub_1D77E3ACC(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a2, a1, v6);
  return a2;
}

uint64_t HeightItem.init(height:valueFormatter:)@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, _QWORD *a3@<X8>)
{
  a3[6] = 0;
  a3[7] = 0;
  *a3 = a1;
  return sub_1D77C35F4(a2, (uint64_t)(a3 + 1));
}

uint64_t HeightItem.reuseIdentifier.getter()
{
  type metadata accessor for TitleValueTableViewCell();
  sub_1D77CB9AC();
  return sub_1D77F4698();
}

uint64_t HeightItem.uniqueIdentifier.getter()
{
  void **v0;
  uint64_t v1;
  void *v2;
  id v3;

  sub_1D77E4180();
  v1 = sub_1D77F4B00();
  v2 = *v0;
  sub_1D77CBAE0();
  v3 = v2;
  sub_1D77F4B00();
  swift_bridgeObjectRetain();
  sub_1D77F4B24();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

unint64_t sub_1D77E4180()
{
  unint64_t result;

  result = qword_1F012FFC8;
  if (!qword_1F012FFC8)
  {
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1F012FFC8);
  }
  return result;
}

uint64_t HeightItem.baseIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HeightItem.baseIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*HeightItem.baseIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t HeightItem.title.getter()
{
  id v0;
  uint64_t v1;

  if (qword_1F012EBC0 != -1)
    swift_once();
  v0 = (id)qword_1F012F660;
  swift_bridgeObjectRetain();
  v1 = sub_1D77F43F8();
  swift_bridgeObjectRelease();

  return v1;
}

uint64_t HeightItem.value.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(char *, id, uint64_t, uint64_t);
  id v5;
  uint64_t v6;
  id v8;
  uint64_t v9;
  char v10;

  v1 = *(void **)v0;
  if (*(_QWORD *)v0)
  {
    v2 = *(_QWORD *)(v0 + 32);
    v3 = *(_QWORD *)(v0 + 40);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 8), v2);
    v10 = 1;
    v4 = *(uint64_t (**)(char *, id, uint64_t, uint64_t))(v3 + 16);
    v5 = v1;
    v6 = v4(&v10, v5, v2, v3);

    return v6;
  }
  else
  {
    if (qword_1F012EBC0 != -1)
      swift_once();
    v8 = (id)qword_1F012F660;
    swift_bridgeObjectRetain();
    v9 = sub_1D77F43F8();
    swift_bridgeObjectRelease();

    return v9;
  }
}

uint64_t sub_1D77E4420()
{
  id v0;
  uint64_t v1;

  if (qword_1F012EBC0 != -1)
    swift_once();
  v0 = (id)qword_1F012F660;
  swift_bridgeObjectRetain();
  v1 = sub_1D77F43F8();
  swift_bridgeObjectRelease();

  return v1;
}

ValueMetadata *type metadata accessor for HeightItem()
{
  return &type metadata for HeightItem;
}

uint64_t sub_1D77E44FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1D77F486C();
  __swift_allocate_value_buffer(v0, qword_1F012FFD0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012FFD0);
  if (qword_1F012EBF0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F6F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_1D77E458C(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _BYTE v5[40];

  sub_1D77CB068(a1, (uint64_t)v5);
  v3 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  sub_1D77CB148((uint64_t)v5, v3);
  swift_endAccess();
  sub_1D77E4614();
  return sub_1D77DDC5C((uint64_t)v5, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
}

void sub_1D77E4614()
{
  void *v0;
  void *v1;
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
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v30[24];
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35[3];
  uint64_t v36;
  uint64_t v37;

  v1 = v0;
  swift_getObjectType();
  v2 = sub_1D77F44DC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 22;
  v7 = (uint64_t)v0 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  sub_1D77CB068(v7, (uint64_t)v30);
  if (v31)
  {
    sub_1D77DDC98(0, (unint64_t *)&qword_1F012F0E8);
    sub_1D77DDC98(0, &qword_1F0130028);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*((_QWORD *)&v33 + 1))
      {
        sub_1D77C35F4(&v32, (uint64_t)v35);
        sub_1D77CB068(v7, (uint64_t)v30);
        if (v31)
        {
          sub_1D77DDC98(0, (unint64_t *)&unk_1F012F200);
          if ((swift_dynamicCast() & 1) != 0)
          {
            if (*((_QWORD *)&v33 + 1))
            {
              __swift_project_boxed_opaque_existential_1(&v32, *((uint64_t *)&v33 + 1));
              v8 = sub_1D77F474C();
              v10 = v9;
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v32);
              if (v10)
                v11 = v8;
              else
                v11 = 0;
              goto LABEL_20;
            }
          }
          else
          {
            v34 = 0;
            v32 = 0u;
            v33 = 0u;
          }
        }
        else
        {
          sub_1D77DDC5C((uint64_t)v30, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
          v32 = 0u;
          v33 = 0u;
          v34 = 0;
        }
        sub_1D77DDC5C((uint64_t)&v32, &qword_1F012F1F8, (unint64_t *)&unk_1F012F200);
        v11 = 0;
        v10 = 0;
LABEL_20:
        sub_1D77E52FC(v11, v10);
        swift_bridgeObjectRelease();
        v23 = v36;
        v24 = v37;
        __swift_project_boxed_opaque_existential_1(v35, v36);
        (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v24);
        v25 = sub_1D77E4C80();
        v26 = (void *)sub_1D77F44B8();
        objc_msgSend(v25, sel_setDate_animated_, v26, 0);

        v27 = v36;
        v28 = v37;
        __swift_project_boxed_opaque_existential_1(v35, v36);
        (*(void (**)(void *, _BYTE *, uint64_t, uint64_t))(v28 + 16))(v1, v6, v27, v28);
        (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v6, v2);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
        return;
      }
    }
    else
    {
      v34 = 0;
      v32 = 0u;
      v33 = 0u;
    }
  }
  else
  {
    sub_1D77DDC5C((uint64_t)v30, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
    v32 = 0u;
    v33 = 0u;
    v34 = 0;
  }
  sub_1D77DDC5C((uint64_t)&v32, &qword_1F0130020, &qword_1F0130028);
  if (qword_1F012EC58 != -1)
    swift_once();
  v12 = sub_1D77F486C();
  __swift_project_value_buffer(v12, (uint64_t)qword_1F012FFD0);
  v13 = v1;
  v14 = sub_1D77F4854();
  v15 = sub_1D77F4BB4();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v17 = swift_slowAlloc();
    v35[0] = v17;
    *(_DWORD *)v16 = 136446722;
    v18 = sub_1D77F4E78();
    *(_QWORD *)&v32 = sub_1D77C3A1C(v18, v19, v35);
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2082;
    *(_QWORD *)&v32 = sub_1D77C3A1C(1835365481, 0xE400000000000000, v35);
    sub_1D77F4D04();
    *(_WORD *)(v16 + 22) = 2082;
    sub_1D77DDBCC(0, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
    *(_QWORD *)&v32 = v20;
    sub_1D77CB744();
    v21 = sub_1D77F4B00();
    *(_QWORD *)&v32 = sub_1D77C3A1C(v21, v22, v35);
    sub_1D77F4D04();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D77C0000, v14, v15, "[%{public}s.%{public}s]: Attempted to set item (%{public}s) that did not conform to CalendarPickerTableViewCellDataSource", (uint8_t *)v16, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v17, -1, -1);
    MEMORY[0x1D829C8C8](v16, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_1D77E4B34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  return sub_1D77CB068(v3, a1);
}

uint64_t sub_1D77E4B84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  sub_1D77CB148(a1, v3);
  swift_endAccess();
  sub_1D77E4614();
  return sub_1D77DDC5C(a1, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
}

void (*sub_1D77E4C08(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D77E4C50;
}

void sub_1D77E4C50(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_1D77E4614();
}

id sub_1D77E4C80()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell____lazy_storage___picker;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell____lazy_storage___picker);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell____lazy_storage___picker);
  }
  else
  {
    v4 = sub_1D77E4CE0(v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1D77E4CE0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  void (*v14)(char *, uint64_t);
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;

  v2 = sub_1D77F456C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D77F44DC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC36F0]), sel_init);
  objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v12, sel_setPreferredDatePickerStyle_, 3);
  objc_msgSend(v12, sel_setDatePickerMode_, 1);
  sub_1D77F44D0();
  v13 = (void *)sub_1D77F44B8();
  v14 = *(void (**)(char *, uint64_t))(v8 + 8);
  v14(v11, v7);
  objc_msgSend(v12, sel_setMaximumDate_, v13);

  v15 = (void *)objc_opt_self();
  sub_1D77F4554();
  v16 = (void *)sub_1D77F4530();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  v17 = objc_msgSend(v15, sel_hk_minimumDateForBirthDateWithCalendar_, v16);

  sub_1D77F44C4();
  v18 = (void *)sub_1D77F44B8();
  v14(v11, v7);
  objc_msgSend(v12, sel_setMinimumDate_, v18);

  objc_msgSend(v12, sel_addTarget_action_forControlEvents_, a1, sel_pickerDateChanged_, 4096);
  return v12;
}

id sub_1D77E4EDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  objc_super v14;

  v5 = &v3[OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item];
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell____lazy_storage___picker] = 0;
  if (a3)
  {
    v6 = (void *)sub_1D77F4ADC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for CalendarPickerTableViewCell();
  v7 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_, a1, v6);

  v8 = v7;
  v9 = objc_msgSend(v8, sel_contentView);
  v10 = sub_1D77E4C80();
  objc_msgSend(v9, sel_addSubview_, v10);

  v11 = sub_1D77E4C80();
  v12 = objc_msgSend(v8, sel_contentView);
  objc_msgSend(v11, sel_hk_alignConstraintsWithView_, v12);

  return v8;
}

uint64_t sub_1D77E50D8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _BYTE v14[24];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v3 = sub_1D77F44DC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 22;
  v8 = v1 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  sub_1D77CB068(v8, (uint64_t)v14);
  if (v15)
  {
    sub_1D77DDC98(0, (unint64_t *)&qword_1F012F0E8);
    sub_1D77DDC98(0, &qword_1F0130028);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v9 = *((_QWORD *)&v17 + 1);
      if (*((_QWORD *)&v17 + 1))
      {
        v10 = v18;
        __swift_project_boxed_opaque_existential_1(&v16, *((uint64_t *)&v17 + 1));
        v11 = objc_msgSend(a1, sel_date);
        sub_1D77F44C4();

        (*(void (**)(uint64_t, _BYTE *, uint64_t, uint64_t))(v10 + 16))(v1, v7, v9, v10);
        (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v7, v3);
        return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v16);
      }
    }
    else
    {
      v18 = 0;
      v16 = 0u;
      v17 = 0u;
    }
  }
  else
  {
    sub_1D77DDC5C((uint64_t)v14, (unint64_t *)&qword_1F012F0E0, (unint64_t *)&qword_1F012F0E8);
    v16 = 0u;
    v17 = 0u;
    v18 = 0;
  }
  return sub_1D77DDC5C((uint64_t)&v16, &qword_1F0130020, &qword_1F0130028);
}

void sub_1D77E52FC(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  void *v6;
  id v7;

  if (a2)
  {
    sub_1D77CB3E0();
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1D77F67A0;
    *(_QWORD *)(v5 + 32) = a1;
    *(_QWORD *)(v5 + 40) = a2;
    *(_QWORD *)(v5 + 48) = 0x7261646E656C6143;
    *(_QWORD *)(v5 + 56) = 0xE800000000000000;
    *(_QWORD *)(v5 + 64) = 0x72656B636950;
    *(_QWORD *)(v5 + 72) = 0xE600000000000000;
    swift_bridgeObjectRetain();
    v6 = (void *)sub_1D77F4B48();
    swift_bridgeObjectRelease();
    v7 = (id)HKUIJoinStringsForAutomationIdentifier();

    objc_msgSend(v2, sel_setAccessibilityIdentifier_, v7);
  }
  else
  {
    objc_msgSend(v2, sel_setAccessibilityIdentifier_, 0);
  }
}

id CalendarPickerTableViewCell.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CalendarPickerTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CalendarPickerTableViewCell()
{
  return objc_opt_self();
}

void sub_1D77E549C(uint64_t a1, uint64_t a2)
{
  sub_1D77E52FC(a1, a2);
}

uint64_t sub_1D77E54BC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI27CalendarPickerTableViewCell_item;
  swift_beginAccess();
  return sub_1D77CB068(v3, a2);
}

uint64_t dispatch thunk of CalendarPickerTableViewCellDataSource.initialDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CalendarPickerTableViewCellDataSource.calendarPicker(_:didSelectNewDate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t method lookup function for CalendarPickerTableViewCell()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CalendarPickerTableViewCell.item.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CalendarPickerTableViewCell.item.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of CalendarPickerTableViewCell.item.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of CalendarPickerTableViewCell.updateAutomationIdentifiers(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t ConfirmDetailsDataSource.__allocating_init(detailsProvider:model:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return ConfirmDetailsDataSource.init(detailsProvider:model:)(a1, a2);
}

uint64_t sub_1D77E55E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1D77F486C();
  __swift_allocate_value_buffer(v0, qword_1F0130030);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F0130030);
  if (qword_1F012EBF0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F6F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_1D77E5678()
{
  return 1;
}

uint64_t sub_1D77E5680()
{
  sub_1D77F4E3C();
  sub_1D77F4E48();
  return sub_1D77F4E54();
}

uint64_t sub_1D77E56C0()
{
  return sub_1D77F4E48();
}

uint64_t sub_1D77E56E4()
{
  sub_1D77F4E3C();
  sub_1D77F4E48();
  return sub_1D77F4E54();
}

_QWORD *sub_1D77E5720@<X0>(_QWORD *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 0;
  return result;
}

uint64_t sub_1D77E5734()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + qword_1F0130048;
  swift_beginAccess();
  return MEMORY[0x1D829C934](v1);
}

uint64_t sub_1D77E5780(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + qword_1F0130048;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1D77E57E8(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = qword_1F0130048;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x1D829C934](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1D77C4D1C;
}

uint64_t sub_1D77E585C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)(v0 + qword_1F0130050) + 112))() & 1;
}

uint64_t sub_1D77E5890@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + qword_1F0130050) + OBJC_IVAR____TtC16HealthMobilityUI19ConfirmDetailsModel_mostRecentDetails;
  swift_beginAccess();
  return sub_1D77C5280(v3, a1);
}

uint64_t ConfirmDetailsDataSource.init(detailsProvider:model:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t (*v22)(char *);
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v45[2];
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  _QWORD v62[2];

  v58 = sub_1D77F46C8();
  v5 = *(_QWORD *)(v58 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77E5FD4(0);
  MEMORY[0x1E0C80A78]();
  v53 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D77F4A40();
  v48 = *(_QWORD *)(v9 - 8);
  v49 = v9;
  MEMORY[0x1E0C80A78]();
  v47 = (char *)v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77E5FF0();
  v51 = *(_QWORD *)(v11 - 8);
  v52 = v11;
  MEMORY[0x1E0C80A78]();
  v50 = (char *)v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77E60E8();
  v55 = *(_QWORD *)(v13 - 8);
  v56 = v13;
  MEMORY[0x1E0C80A78]();
  v54 = (char *)v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1D77F4500();
  v59 = *(_QWORD *)(v15 - 8);
  v60 = v15;
  MEMORY[0x1E0C80A78]();
  v17 = (char *)v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77C52C4();
  MEMORY[0x1E0C80A78]();
  v19 = (char *)v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v2 + qword_1F0130048 + 8) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v2 + qword_1F0130090) = 0;
  *(_QWORD *)(v2 + qword_1F0130098) = a1;
  v46 = v2;
  *(_QWORD *)(v2 + qword_1F0130050) = a2;
  v20 = type metadata accessor for ConfirmDetailsProvider.Details();
  v21 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
  v45[1] = v20;
  v21(v19, 1, 1);
  v22 = *(uint64_t (**)(char *))(*(_QWORD *)a2 + 208);
  v57 = a1;
  swift_retain();
  swift_retain();
  v23 = v22(v19);
  sub_1D77CFFCC((uint64_t)v19, (uint64_t (*)(_QWORD))sub_1D77C52C4);
  v24 = *(_QWORD *)(v23 + 16);
  if (v24)
  {
    v45[0] = a2;
    v62[0] = MEMORY[0x1E0DEE9D8];
    sub_1D77E6FDC(0, v24, 0);
    v25 = 0;
    do
    {
      swift_bridgeObjectRetain_n();
      sub_1D77F44F4();
      sub_1D77F44E8();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v17, v60);
      sub_1D77F46BC();
      swift_bridgeObjectRelease();
      v26 = v62[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1D77E6FDC(0, *(_QWORD *)(v26 + 16) + 1, 1);
        v26 = v62[0];
      }
      v28 = *(_QWORD *)(v26 + 16);
      v27 = *(_QWORD *)(v26 + 24);
      if (v28 >= v27 >> 1)
      {
        sub_1D77E6FDC(v27 > 1, v28 + 1, 1);
        v26 = v62[0];
      }
      ++v25;
      *(_QWORD *)(v26 + 16) = v28 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v26+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v28, v7, v58);
      v62[0] = v26;
    }
    while (v24 != v25);
  }
  swift_bridgeObjectRelease();
  v62[0] = 0;
  v62[1] = 0xE000000000000000;
  sub_1D77F4D4C();
  swift_bridgeObjectRelease();
  strcpy((char *)v62, "MutableArray<");
  HIWORD(v62[1]) = -4864;
  sub_1D77F44F4();
  sub_1D77F44E8();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v17, v60);
  sub_1D77F4B24();
  swift_bridgeObjectRelease();
  sub_1D77F4B24();
  v29 = sub_1D77F46E0();
  v30 = *(_QWORD *)(v29 + qword_1F0130050);
  swift_beginAccess();
  *(_QWORD *)(v30 + 24) = &protocol witness table for ConfirmDetailsDataSource;
  swift_unknownObjectWeakAssign();
  v31 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v57 + 160);
  v32 = swift_retain();
  v61 = (id)v31(v32);
  sub_1D77E6084();
  sub_1D77C31B8(&qword_1F0130070, (uint64_t (*)(uint64_t))sub_1D77E6084, MEMORY[0x1E0C95D90]);
  v33 = v50;
  sub_1D77F4A04();
  swift_release();
  sub_1D77CA478();
  v35 = v47;
  v34 = v48;
  v36 = v49;
  (*(void (**)(char *, _QWORD, uint64_t))(v48 + 104))(v47, *MEMORY[0x1E0DEF538], v49);
  v37 = (void *)sub_1D77F4C98();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v36);
  v61 = v37;
  v38 = sub_1D77F4C5C();
  v39 = (uint64_t)v53;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v53, 1, 1, v38);
  sub_1D77C31B8(&qword_1F0130080, (uint64_t (*)(uint64_t))sub_1D77E5FF0, MEMORY[0x1E0C95708]);
  sub_1D77C31B8(&qword_1F0130088, (uint64_t (*)(uint64_t))sub_1D77CA478, MEMORY[0x1E0DEF7F8]);
  v40 = v54;
  v41 = v52;
  sub_1D77F4A10();
  sub_1D77CFFCC(v39, (uint64_t (*)(_QWORD))sub_1D77E5FD4);

  (*(void (**)(char *, uint64_t))(v51 + 8))(v33, v41);
  swift_allocObject();
  swift_weakInit();
  sub_1D77C31B8(&qword_1F01300A0, (uint64_t (*)(uint64_t))sub_1D77E60E8, MEMORY[0x1E0C95CB8]);
  v42 = v56;
  v43 = sub_1D77F4A1C();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v40, v42);
  *(_QWORD *)(v29 + qword_1F0130090) = v43;
  swift_release();
  return v29;
}

void sub_1D77E5FD4(uint64_t a1)
{
  sub_1D77CA580(a1, &qword_1F0130058, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF868], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
}

void sub_1D77E5FF0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F0130060)
  {
    sub_1D77E6084();
    type metadata accessor for ConfirmDetailsProvider.Details();
    sub_1D77C31B8(&qword_1F0130070, (uint64_t (*)(uint64_t))sub_1D77E6084, MEMORY[0x1E0C95D90]);
    v0 = sub_1D77F495C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F0130060);
  }
}

void sub_1D77E6084()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F0130068)
  {
    sub_1D77C52C4();
    v0 = sub_1D77F4998();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F0130068);
  }
}

void sub_1D77E60E8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F0130078)
  {
    sub_1D77E5FF0();
    sub_1D77CA478();
    sub_1D77C31B8(&qword_1F0130080, (uint64_t (*)(uint64_t))sub_1D77E5FF0, MEMORY[0x1E0C95708]);
    sub_1D77C31B8(&qword_1F0130088, (uint64_t (*)(uint64_t))sub_1D77CA478, MEMORY[0x1E0DEF7F8]);
    v0 = sub_1D77F4980();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F0130078);
  }
}

uint64_t sub_1D77E61B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1D77C5280(a1, a2);
}

uint64_t sub_1D77E61B8(uint64_t a1)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    (*(void (**)(uint64_t))(**(_QWORD **)(result + qword_1F0130050) + 200))(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_1D77E6230()
{
  _QWORD *v0;
  char *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t ObjectType;

  (*(void (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 192))();
  v1 = (char *)v0 + qword_1F0130048;
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v1);
  if (result)
  {
    v3 = *((_QWORD *)v1 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(v3 + 8))(v0, ObjectType, v3);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1D77E62C8()
{
  _QWORD *v0;
  char *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t ObjectType;

  (*(void (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 200))();
  v1 = (char *)v0 + qword_1F0130048;
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v1);
  if (result)
  {
    v3 = *((_QWORD *)v1 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(v3 + 8))(v0, ObjectType, v3);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_1D77E6360(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(_QWORD, uint64_t);
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15[3];
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == 1)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void (**)(_QWORD, uint64_t))(class metadata base offset for ConfirmDetailsDataSource + *v1 + 208);
    swift_bridgeObjectRetain();
    v4(0, v3);
    swift_bridgeObjectRelease();
    v5 = (char *)v1 + qword_1F0130048;
    swift_beginAccess();
    if (MEMORY[0x1D829C934](v5))
    {
      v6 = *((_QWORD *)v5 + 1);
      ObjectType = swift_getObjectType();
      (*(void (**)(_QWORD *, uint64_t, uint64_t))(v6 + 8))(v1, ObjectType, v6);
      swift_unknownObjectRelease();
    }
  }
  else
  {
    if (qword_1F012EC60 != -1)
      swift_once();
    v8 = sub_1D77F486C();
    __swift_project_value_buffer(v8, (uint64_t)qword_1F0130030);
    swift_bridgeObjectRetain_n();
    v9 = sub_1D77F4854();
    v10 = sub_1D77F4BC0();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc();
      v12 = swift_slowAlloc();
      v15[0] = v12;
      *(_DWORD *)v11 = 136446722;
      v13 = sub_1D77F4E78();
      v16 = sub_1D77C3A1C(v13, v14, v15);
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2082;
      v16 = sub_1D77C3A1C(0xD000000000000019, 0x80000001D77FA150, v15);
      sub_1D77F4D04();
      *(_WORD *)(v11 + 22) = 2048;
      swift_bridgeObjectRelease();
      v16 = v2;
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D77C0000, v9, v10, "[%{public}s.%{public}s]: Received unexpected number of sections: %ld", (uint8_t *)v11, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v12, -1, -1);
      MEMORY[0x1D829C8C8](v11, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_1D77E6608()
{
  type metadata accessor for TitleValueTableViewCell();
  sub_1D77C31B8((unint64_t *)&qword_1F012F210, (uint64_t (*)(uint64_t))type metadata accessor for TitleValueTableViewCell, (uint64_t)&protocol conformance descriptor for TitleValueTableViewCell);
  sub_1D77F4B90();
  type metadata accessor for MultiselectTableViewCell();
  sub_1D77C31B8((unint64_t *)&qword_1F012EF60, (uint64_t (*)(uint64_t))type metadata accessor for MultiselectTableViewCell, (uint64_t)&protocol conformance descriptor for MultiselectTableViewCell);
  sub_1D77F4B90();
  type metadata accessor for PickerTableViewCell();
  sub_1D77C31B8((unint64_t *)&qword_1F012F5E0, (uint64_t (*)(uint64_t))type metadata accessor for PickerTableViewCell, (uint64_t)&protocol conformance descriptor for PickerTableViewCell);
  sub_1D77F4B90();
  type metadata accessor for CalendarPickerTableViewCell();
  sub_1D77C31B8((unint64_t *)&qword_1F012FE68, (uint64_t (*)(uint64_t))type metadata accessor for CalendarPickerTableViewCell, (uint64_t)&protocol conformance descriptor for CalendarPickerTableViewCell);
  return sub_1D77F4B90();
}

uint64_t sub_1D77E6704()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)(v0 + qword_1F0130050) + 216))();
}

double sub_1D77E6734@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

id sub_1D77E6744(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL *v14;
  uint64_t v15;
  BOOL *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  int v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void (*v26)(_BYTE *, _QWORD);
  id v27;
  void (*v28)(_BYTE *, _QWORD);
  id v29;
  _BYTE v31[32];

  v3 = v2;
  v6 = sub_1D77F4938();
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = &v31[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1D77E7024();
  v11 = v10;
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = &v31[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = sub_1D77F459C();
  v16 = &v14[*(int *)(v11 + 48)];
  *v14 = v15 != 0;
  v17 = sub_1D77F468C();
  v18 = *(_QWORD *)(v17 - 8);
  (*(void (**)(BOOL *, uint64_t, uint64_t))(v18 + 16))(v16, a1, v17);
  if (v15)
    goto LABEL_2;
  v20 = (*(uint64_t (**)(BOOL *, uint64_t))(v18 + 88))(v16, v17);
  if (v20 == *MEMORY[0x1E0D2A860])
  {
    if (qword_1F012EBC8 != -1)
      swift_once();
    v21 = (id)qword_1F012F678;
    swift_bridgeObjectRetain();
    sub_1D77F43F8();
    swift_bridgeObjectRelease();

    v22 = (id)qword_1F012F678;
    swift_bridgeObjectRetain();
    sub_1D77F43F8();
    swift_bridgeObjectRelease();

    sub_1D77E6B94();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v23 = objc_allocWithZone((Class)type metadata accessor for ConfirmDetailsLearnMoreView());
    swift_retain();
    v19 = sub_1D77ED550((uint64_t)v9, a2, v3, (uint64_t)&off_1E9C32930);
    swift_release();
  }
  else
  {
    if (v20 != *MEMORY[0x1E0D2A858])
    {
LABEL_2:
      sub_1D77CFFCC((uint64_t)v14, (uint64_t (*)(_QWORD))sub_1D77E7024);
      return 0;
    }
    if (qword_1F012EBC8 != -1)
      swift_once();
    v24 = (id)qword_1F012F678;
    swift_bridgeObjectRetain();
    sub_1D77F43F8();
    swift_bridgeObjectRelease();

    sub_1D77F4890();
    swift_bridgeObjectRetain();
    sub_1D77F492C();
    v25 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x1E0DC4B10]);
    v26 = (void (*)(_BYTE *, _QWORD))sub_1D77F48F0();
    sub_1D77F48C0();
    v26(v31, 0);
    v27 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
    v28 = (void (*)(_BYTE *, _QWORD))sub_1D77F48F0();
    sub_1D77F48D8();
    v28(v31, 0);
    swift_bridgeObjectRelease();
    v29 = objc_allocWithZone((Class)type metadata accessor for ConfirmDetailsFooterView());
    return sub_1D77D7CC0((uint64_t)v9, a2);
  }
  return v19;
}

id sub_1D77E6B94()
{
  void *v0;
  id result;
  void (*v2)(_BYTE *, _QWORD);
  void *v3;
  id v4;
  void (*v5)(_BYTE *, _QWORD);
  id v6;
  void (*v7)(_BYTE *, _QWORD);
  id v8;
  uint64_t (*v9)(_BYTE *, _QWORD);
  _BYTE v10[32];

  sub_1D77F489C();
  swift_bridgeObjectRetain();
  sub_1D77F492C();
  v0 = (void *)objc_opt_self();
  result = objc_msgSend(v0, sel__preferredFontForTextStyle_variant_, *MEMORY[0x1E0DC4B60], 1024);
  if (result)
  {
    v2 = (void (*)(_BYTE *, _QWORD))sub_1D77F48F0();
    sub_1D77F48C0();
    v2(v10, 0);
    v3 = (void *)objc_opt_self();
    v4 = objc_msgSend(v3, sel_labelColor);
    v5 = (void (*)(_BYTE *, _QWORD))sub_1D77F48F0();
    sub_1D77F48D8();
    v5(v10, 0);
    swift_bridgeObjectRetain();
    sub_1D77F48A8();
    v6 = objc_msgSend(v0, sel_preferredFontForTextStyle_, *MEMORY[0x1E0DC4B10]);
    v7 = (void (*)(_BYTE *, _QWORD))sub_1D77F4908();
    sub_1D77F48C0();
    v7(v10, 0);
    v8 = objc_msgSend(v3, sel_labelColor);
    v9 = (uint64_t (*)(_BYTE *, _QWORD))sub_1D77F4908();
    sub_1D77F48D8();
    return (id)v9(v10, 0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1D77E6D68()
{
  return sub_1D77F46EC();
}

void ConfirmDetailsDataSource.__allocating_init(arrangedSections:identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ConfirmDetailsDataSource.init(arrangedSections:identifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1D77E6DC8()
{
  uint64_t v0;

  sub_1D77C564C(v0 + qword_1F0130048);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t ConfirmDetailsDataSource.deinit()
{
  uint64_t v0;

  v0 = sub_1D77F4710();
  sub_1D77C564C(v0 + qword_1F0130048);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t ConfirmDetailsDataSource.__deallocating_deinit()
{
  uint64_t v0;

  v0 = sub_1D77F4710();
  sub_1D77C564C(v0 + qword_1F0130048);
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1D77E6EEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t ObjectType;

  v1 = v0 + qword_1F0130048;
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v1);
  if (result)
  {
    v3 = *(_QWORD *)(v1 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, ObjectType, v3);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1D77E6F6C()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)(*v0 + qword_1F0130050) + 216))();
}

id sub_1D77E6FA0(uint64_t a1, double a2)
{
  return sub_1D77E6744(a1, a2);
}

uint64_t sub_1D77E6FC0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1D77E7100(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1D77E6FDC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1D77E7298(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1D77E6FF8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1D77E701C(uint64_t a1)
{
  return sub_1D77E61B8(a1);
}

void sub_1D77E7024()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1F01300A8)
  {
    sub_1D77E7090();
    sub_1D77F468C();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1F01300A8);
  }
}

void sub_1D77E7090()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F01300B0)
  {
    v0 = sub_1D77F4CF8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F01300B0);
  }
}

uint64_t sub_1D77E70E4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1D77E748C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1D77E7100(char a1, int64_t a2, char a3, _QWORD *a4)
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
    sub_1D77CA580(0, &qword_1F0130118, (uint64_t (*)(uint64_t))sub_1D77E7A70, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
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
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8)
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_1D77E7A70(0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1D77F4DD0();
  __break(1u);
  return result;
}

uint64_t sub_1D77E7298(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  sub_1D77CA580(0, (unint64_t *)&qword_1F012FAD0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2B090], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v10 = *(_QWORD *)(sub_1D77F46C8() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_1D77F46C8() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_1D77F4DD0();
  __break(1u);
  return result;
}

uint64_t sub_1D77E748C(char a1, int64_t a2, char a3, _QWORD *a4)
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
    sub_1D77CA580(0, &qword_1F0130110, (uint64_t (*)(uint64_t))sub_1D77E2BD8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
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
    sub_1D77E2BD8();
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1D77F4DD0();
  __break(1u);
  return result;
}

uint64_t sub_1D77E763C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + qword_1F0130048;
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1D77E7694(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + qword_1F0130048;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of ConfirmDetailsDataSourceDelegate.detailsDataSourceDidUpdate(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSourceDelegate.detailsDataSourceDidTapLearnMore(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t type metadata accessor for ConfirmDetailsDataSource()
{
  uint64_t result;

  result = qword_1F01300B8;
  if (!qword_1F01300B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D77E7740()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ConfirmDetailsDataSource()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 32))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 40))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 48))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.canProceed.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 56))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.details.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 64))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.__allocating_init(detailsProvider:model:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + v0 + 96))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.update(indexPath:with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 104))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.remove(itemAt:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 112))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.updateAllItems(newItems:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 120))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.registerCells(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 136))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.indexPathSelected(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 144))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.supplementaryContentConfiguration(ofKind:at:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 152))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.supplementaryView(ofKind:at:functionalWidth:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 160))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.overridableReplace(at:with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 192))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.overridableRemoveItemAt(indexPath:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 200))();
}

uint64_t dispatch thunk of ConfirmDetailsDataSource.overridableReplaceItemsForSection(at:newItems:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ConfirmDetailsDataSource + *v0 + 208))();
}

uint64_t sub_1D77E7928()
{
  return type metadata accessor for ConfirmDetailsDataSource();
}

uint64_t getEnumTagSinglePayload for ConfirmDetailsDataSource.Section(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ConfirmDetailsDataSource.Section(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1D77E79C4 + 4 * byte_1D77F72F0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1D77E79E4 + 4 * byte_1D77F72F5[v4]))();
}

_BYTE *sub_1D77E79C4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1D77E79E4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1D77E79EC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1D77E79F4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1D77E79FC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1D77E7A04(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1D77E7A10()
{
  return 0;
}

ValueMetadata *type metadata accessor for ConfirmDetailsDataSource.Section()
{
  return &type metadata for ConfirmDetailsDataSource.Section;
}

unint64_t sub_1D77E7A2C()
{
  unint64_t result;

  result = qword_1F0130108;
  if (!qword_1F0130108)
  {
    result = MEMORY[0x1D829C838](&unk_1D77F74C0, &type metadata for ConfirmDetailsDataSource.Section);
    atomic_store(result, (unint64_t *)&qword_1F0130108);
  }
  return result;
}

void sub_1D77E7A70(uint64_t a1)
{
  sub_1D77CA580(a1, &qword_1F0130120, (uint64_t (*)(uint64_t))sub_1D77E2BD8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
}

BOOL static WalkingSteadinessOnboardingModel.CannotProgressReason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1D77E7AA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1D77F486C();
  __swift_allocate_value_buffer(v0, qword_1F0130128);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F0130128);
  if (qword_1F012EBF0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F6F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_1D77E7B30()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  sub_1D77EBDA8();
  MEMORY[0x1E0C80A78](v1, v2);
  sub_1D77EBE88();
  v4 = v3;
  v10 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(swift_allocObject() + 16) = v0;
  sub_1D77EC080(0, &qword_1F01302E0, MEMORY[0x1E0C960D8]);
  swift_allocObject();
  v0;
  v11 = sub_1D77F49EC();
  sub_1D77F4788();
  sub_1D77EBE30();
  sub_1D77F4A04();
  sub_1D77D005C(0, &qword_1F0130140);
  v11 = sub_1D77F47E8();
  sub_1D77EBCCC();
  sub_1D77C31B8(&qword_1F0130300, (uint64_t (*)(uint64_t))sub_1D77EBDA8, MEMORY[0x1E0C95708]);
  sub_1D77C31B8(&qword_1F01302B8, (uint64_t (*)(uint64_t))sub_1D77EBCCC, MEMORY[0x1E0C95D90]);
  sub_1D77F4968();
  sub_1D77C31B8(&qword_1F0130308, (uint64_t (*)(uint64_t))sub_1D77EBE88, MEMORY[0x1E0C95788]);
  v8 = sub_1D77F49F8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v4);
  return v8;
}

uint64_t sub_1D77E7D70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
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
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;

  v3 = v2;
  sub_1D77EBDA8();
  v21[1] = v6;
  MEMORY[0x1E0C80A78](v6, v7);
  sub_1D77EBE88();
  v9 = v8;
  v22 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x1E0C80A78](v8, v10);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(a1 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x1E0C80A78](v11, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
  v17 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a1;
  *(_QWORD *)(v18 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v18 + v17, (char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  sub_1D77EC080(0, &qword_1F01302E0, MEMORY[0x1E0C960D8]);
  swift_allocObject();
  v23 = sub_1D77F49EC();
  sub_1D77F4788();
  sub_1D77EBE30();
  sub_1D77F4A04();
  v23 = sub_1D77F47D0();
  sub_1D77EBCCC();
  sub_1D77C31B8(&qword_1F0130300, (uint64_t (*)(uint64_t))sub_1D77EBDA8, MEMORY[0x1E0C95708]);
  sub_1D77C31B8(&qword_1F01302B8, (uint64_t (*)(uint64_t))sub_1D77EBCCC, MEMORY[0x1E0C95D90]);
  sub_1D77F4968();
  sub_1D77C31B8(&qword_1F0130308, (uint64_t (*)(uint64_t))sub_1D77EBE88, MEMORY[0x1E0C95788]);
  v19 = sub_1D77F49F8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v9);
  return v19;
}

uint64_t sub_1D77E7FF8(uint64_t a1, uint64_t a2, void *a3)
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t (*v23)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v26 = a1;
  v5 = sub_1D77F4A34();
  v29 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D77F4A58();
  v27 = *(_QWORD *)(v9 - 8);
  v28 = v9;
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1D77F4A40();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13, v15);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77D005C(0, qword_1EDA11E30);
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v17, *MEMORY[0x1E0DEF530], v13);
  v18 = (void *)sub_1D77F4C98();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  v19 = (_QWORD *)swift_allocObject();
  v20 = v26;
  v19[2] = a3;
  v19[3] = v20;
  v19[4] = a2;
  aBlock[4] = sub_1D77EC1A4;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D77CDEB0;
  aBlock[3] = &block_descriptor_26;
  v21 = _Block_copy(aBlock);
  v22 = a3;
  swift_retain();
  sub_1D77F4A4C();
  v30 = MEMORY[0x1E0DEE9D8];
  v23 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  sub_1D77C31B8((unint64_t *)&unk_1EDA11FF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1D77CA580(0, (unint64_t *)&unk_1EDA12000, v23, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1D77CA520();
  sub_1D77F4D28();
  MEMORY[0x1D829C244](0, v12, v8, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v28);
  return swift_release();
}

uint64_t sub_1D77E8280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  uint64_t (*v28)(uint64_t);
  uint64_t v29;
  void *v30;
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
  _QWORD aBlock[6];

  v34 = a5;
  v35 = a1;
  v32 = a3;
  v36 = a2;
  v37 = sub_1D77F4A34();
  v40 = *(_QWORD *)(v37 - 8);
  MEMORY[0x1E0C80A78](v37, v6);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1D77F4A58();
  v38 = *(_QWORD *)(v9 - 8);
  v39 = v9;
  v11 = MEMORY[0x1E0C80A78](v9, v10);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(a4 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x1E0C80A78](v11, v16);
  v17 = sub_1D77F4A40();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17, v19);
  v21 = (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77D005C(0, qword_1EDA11E30);
  (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v21, *MEMORY[0x1E0DEF530], v17);
  v33 = sub_1D77F4C98();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v32, a4);
  v22 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v23 = swift_allocObject();
  v24 = v34;
  *(_QWORD *)(v23 + 16) = a4;
  *(_QWORD *)(v23 + 24) = v24;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v23 + v22, (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
  v25 = (_QWORD *)(v23 + ((v15 + v22 + 7) & 0xFFFFFFFFFFFFFFF8));
  v26 = v36;
  *v25 = v35;
  v25[1] = v26;
  aBlock[4] = sub_1D77EC034;
  aBlock[5] = v23;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D77CDEB0;
  aBlock[3] = &block_descriptor_3;
  v27 = _Block_copy(aBlock);
  swift_retain();
  sub_1D77F4A4C();
  v41 = MEMORY[0x1E0DEE9D8];
  v28 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  sub_1D77C31B8((unint64_t *)&unk_1EDA11FF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1D77CA580(0, (unint64_t *)&unk_1EDA12000, v28, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1D77CA520();
  v29 = v37;
  sub_1D77F4D28();
  v30 = (void *)v33;
  MEMORY[0x1D829C244](0, v13, v8, v27);
  _Block_release(v27);

  (*(void (**)(char *, uint64_t))(v40 + 8))(v8, v29);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v39);
  return swift_release();
}

uint64_t sub_1D77E8584(uint64_t a1, void (*a2)(char *))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  sub_1D77EC080(0, &qword_1F0130310, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0DEE030]);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v13 - v5;
  v7 = sub_1D77F4788();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77D005C(0, &qword_1F0130140);
  sub_1D77F47DC();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v11, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  swift_storeEnumTagMultiPayload();
  a2(v6);
  sub_1D77EC100((uint64_t)v6);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_1D77E8928(uint64_t a1, void (*a2)(char *))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  void (*v13)(char *);

  v13 = a2;
  sub_1D77EC080(0, &qword_1F0130310, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0DEE030]);
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v12 - v4;
  v6 = sub_1D77F4788();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77F47C4();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v5, v10, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  swift_storeEnumTagMultiPayload();
  v13(v5);
  sub_1D77EC100((uint64_t)v5);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

uint64_t sub_1D77E8CBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1D77DE99C(a1, a2, &qword_1F01302E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2BD30]);
}

uint64_t WalkingSteadinessOnboardingModel.CannotProgressReason.hash(into:)()
{
  return sub_1D77F4E48();
}

uint64_t WalkingSteadinessOnboardingModel.CannotProgressReason.hashValue.getter()
{
  sub_1D77F4E3C();
  sub_1D77F4E48();
  return sub_1D77F4E54();
}

uint64_t WalkingSteadinessOnboardingModel.WarningReason.hash(into:)()
{
  return sub_1D77F4E48();
}

uint64_t static WalkingSteadinessOnboardingModel.WarningReason.== infix(_:_:)()
{
  return 1;
}

uint64_t WalkingSteadinessOnboardingModel.WarningReason.hashValue.getter()
{
  sub_1D77F4E3C();
  sub_1D77F4E48();
  return sub_1D77F4E54();
}

BOOL static WalkingSteadinessOnboardingModel.ProgressionState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned int v2;
  unsigned int v3;

  v2 = *a1;
  v3 = *a2;
  if (v2 >> 6)
  {
    if (v2 >> 6 == 1)
    {
      if ((v3 & 0xC0) == 0x40)
        return 1;
    }
    else if (v3 == 128)
    {
      return 1;
    }
  }
  else if (v3 <= 0x3F)
  {
    return v2 == v3;
  }
  return 0;
}

BOOL sub_1D77E8E14(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned int v2;
  unsigned int v3;

  v2 = *a1;
  v3 = *a2;
  if (!(v2 >> 6))
  {
    if (v3 < 0x40)
      return v2 == v3;
    return 0;
  }
  if (v2 >> 6 == 1)
    return (v3 & 0xC0) == 0x40;
  return v3 == 128;
}

uint64_t sub_1D77E8E68@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *(_BYTE *)(result + 17);
  return result;
}

uint64_t sub_1D77E8E74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)(v1 + 96);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 36));
  v4 = *(_BYTE *)(v3 + 32);
  *(_QWORD *)a1 = *(_QWORD *)(v3 + 24);
  *(_BYTE *)(a1 + 8) = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 36));
  return swift_release();
}

uint64_t WalkingSteadinessOnboardingModel.__allocating_init(featureStatusManager:detailsProvider:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[40];
  _QWORD v12[5];

  v3 = v2;
  v5 = a1;
  v6 = objc_msgSend(v5, sel_featureAvailabilityProviding);
  v12[3] = sub_1D77D005C(0, &qword_1F0130140);
  v12[4] = MEMORY[0x1E0D2C1E8];
  v12[0] = v5;
  sub_1D77C4434((uint64_t)v12, (uint64_t)v11);
  v7 = v5;
  v8 = sub_1D77E7B30();
  v9 = (*(uint64_t (**)(_BYTE *, uint64_t, id, uint64_t, uint64_t (*)(), _QWORD))(v3 + 192))(v11, v8, v6, a2, sub_1D77D9894, 0);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);

  return v9;
}

uint64_t WalkingSteadinessOnboardingModel.__allocating_init(featureStatusProvider:featureAvailabilityProvider:detailsProvider:dateProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v11 = *(_QWORD *)(a1 + 24);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = __swift_mutable_project_boxed_opaque_existential_1(a1, v11);
  MEMORY[0x1E0C80A78](v13, v13);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v16 + 16))(v15);
  v17 = sub_1D77EB094((uint64_t)v15, a2, a3, a4, a5, v5, v11, v12);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v17;
}

_QWORD *WalkingSteadinessOnboardingModel.__allocating_init(featureStatusProvider:featureStatusPublisher:featureAvailabilityProvider:detailsProvider:dateProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v12;

  swift_allocObject();
  v12 = sub_1D77EB3F8(a1, a2, a3, a4, a5, a6);
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return v12;
}

_QWORD *WalkingSteadinessOnboardingModel.init(featureStatusProvider:featureStatusPublisher:featureAvailabilityProvider:detailsProvider:dateProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6 = sub_1D77EB3F8(a1, a2, a3, a4, a5, a6);
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return v6;
}

uint64_t sub_1D77E917C()
{
  uint64_t result;
  uint64_t v1;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = *(_QWORD *)(result + 96);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 36));
    sub_1D77E974C((_BYTE *)(v1 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 36));
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1D77E9224()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31[2];

  v27 = *v0;
  v1 = sub_1D77F4788();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v3);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1D77F44DC();
  v28 = *(_QWORD *)(v6 - 8);
  v29 = v6;
  v8 = MEMORY[0x1E0C80A78](v6, v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8, v11);
  v13 = (char *)&v27 - v12;
  sub_1D77F44D0();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  sub_1D77F47C4();
  v14 = v0[12];
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v14 + 36));
  sub_1D77E974C((_BYTE *)(v14 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v14 + 36));
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  v15 = v29;
  sub_1D77F44D0();
  sub_1D77F44AC();
  v17 = v16;
  v18 = *(void (**)(char *, uint64_t))(v28 + 8);
  v18(v10, v15);
  if (qword_1F012EC68 != -1)
    swift_once();
  v19 = sub_1D77F486C();
  __swift_project_value_buffer(v19, (uint64_t)qword_1F0130128);
  v20 = sub_1D77F4854();
  v21 = sub_1D77F4BCC();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    v31[0] = v23;
    *(_DWORD *)v22 = 136315650;
    v24 = sub_1D77F4E78();
    v30 = COERCE_DOUBLE(sub_1D77C3A1C(v24, v25, v31));
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    v30 = COERCE_DOUBLE(sub_1D77C3A1C(0xD000000000000019, 0x80000001D77FA3F0, v31));
    sub_1D77F4D04();
    *(_WORD *)(v22 + 22) = 2048;
    v30 = round(v17 * 1000.0) / 1000.0;
    sub_1D77F4D04();
    _os_log_impl(&dword_1D77C0000, v20, v21, "[%s] %s: Feature status fetch execution time: %f seconds.", (uint8_t *)v22, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v23, -1, -1);
    MEMORY[0x1D829C8C8](v22, -1, -1);
  }

  return ((uint64_t (*)(char *, uint64_t))v18)(v13, v15);
}

void sub_1D77E974C(_BYTE *a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;

  v2 = (void *)sub_1D77F4794();
  v3 = sub_1D77F4CBC();

  a1[1] = v3 & 1;
  v4 = (void *)sub_1D77F4794();
  v5 = sub_1D77F4CBC();

  *a1 = v5 & 1;
}

_BYTE *sub_1D77E97F0@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = 0x504030201uLL >> (8 * *result);
  return result;
}

void sub_1D77E9810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
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
  _QWORD v21[18];

  v21[8] = a6;
  v21[9] = a5;
  v21[6] = *v6;
  v8 = sub_1D77F44DC();
  v21[2] = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v9);
  v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1D77CA580(0, &qword_1F012F248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v11, v12);
  v13 = sub_1D77F43EC();
  v14 = *(_QWORD *)(v13 - 8);
  v21[4] = v13;
  v21[5] = v14;
  MEMORY[0x1E0C80A78](v13, v15);
  v21[3] = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77CA580(0, (unint64_t *)&qword_1F012EF08, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmDetailsProvider.Details, v10);
  MEMORY[0x1E0C80A78](v17, v18);
  v19 = type metadata accessor for ConfirmDetailsProvider.Details();
  MEMORY[0x1E0C80A78](v19, v20);
  __asm { BR              X10 }
}

uint64_t sub_1D77E99A8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 - 168) + 96);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 36));
  v2 = *(unsigned __int8 *)(v1 + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 36));
  swift_release();
  if (v2 == 2)
  {
    if (qword_1F012EC68 != -1)
      swift_once();
    v3 = sub_1D77F486C();
    __swift_project_value_buffer(v3, (uint64_t)qword_1F0130128);
    v4 = sub_1D77F4854();
    v5 = sub_1D77F4BC0();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      *(_QWORD *)(v0 - 128) = v7;
      *(_DWORD *)v6 = 136446210;
      v8 = sub_1D77F4E78();
      *(_QWORD *)(v0 - 144) = sub_1D77C3A1C(v8, v9, (uint64_t *)(v0 - 128));
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D77C0000, v4, v5, "[%{public}s] Fitness tracking enabled determination not present at time of progressing from start", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v7, -1, -1);
      MEMORY[0x1D829C8C8](v6, -1, -1);
    }

    goto LABEL_9;
  }
  if ((v2 & 1) != 0)
  {
LABEL_9:
    *(_BYTE *)(v0 - 128) = 0x80;
    return (*(uint64_t (**)(uint64_t))(v0 - 152))(v0 - 128);
  }
  *(_BYTE *)(v0 - 128) = 0;
  return (*(uint64_t (**)(uint64_t))(v0 - 152))(v0 - 128);
}

uint64_t sub_1D77EA83C(uint64_t *a1, uint64_t (*a2)(char *), uint64_t a3, uint64_t a4)
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  char v10;

  if (*((_BYTE *)a1 + 8) == 1)
  {
    v10 = 2;
    v5 = &v10;
  }
  else
  {
    v6 = *a1;
    v7 = *(_QWORD *)(a4 + 96);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v7 + 36));
    *(_QWORD *)(v7 + 24) = v6;
    *(_BYTE *)(v7 + 32) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 36));
    swift_release();
    v9 = 0x80;
    v5 = &v9;
  }
  return a2(v5);
}

uint64_t sub_1D77EA8DC(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
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
  uint64_t v18;

  v7 = *v3;
  sub_1D77DBF88();
  v9 = v8;
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = v3[12];
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v14 + 36));
  *(_BYTE *)(v14 + 33) = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v14 + 36));
  swift_release();
  v15 = v3[7];
  swift_getObjectType();
  sub_1D77F4C20();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  *(_QWORD *)(v16 + 32) = v15;
  *(_BYTE *)(v16 + 40) = a1;
  *(_QWORD *)(v16 + 48) = v7;
  swift_retain();
  swift_unknownObjectRetain();
  sub_1D77F4CB0();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

uint64_t sub_1D77EAA10(char a1, void *a2, uint64_t (*a3)(_QWORD, _QWORD), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  uint64_t v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t (*v32)(_QWORD, _QWORD);
  uint64_t v33;
  uint64_t v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  sub_1D77DBF88();
  v13 = v12;
  v14 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12, v15);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    swift_getObjectType();
    sub_1D77F4C2C();
    v18 = (_QWORD *)swift_allocObject();
    v18[2] = a3;
    v18[3] = a4;
    v18[4] = a7;
    swift_retain();
    sub_1D77F4CB0();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  else
  {
    if (qword_1F012EC68 != -1)
      swift_once();
    v20 = sub_1D77F486C();
    __swift_project_value_buffer(v20, (uint64_t)qword_1F0130128);
    v21 = a2;
    v22 = a2;
    v23 = sub_1D77F4854();
    v24 = sub_1D77F4BB4();
    if (os_log_type_enabled(v23, v24))
    {
      v32 = a3;
      v25 = swift_slowAlloc();
      v26 = (_QWORD *)swift_slowAlloc();
      v27 = swift_slowAlloc();
      v34[0] = v27;
      *(_DWORD *)v25 = 136446466;
      v28 = sub_1D77F4E78();
      v33 = sub_1D77C3A1C(v28, v29, v34);
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2112;
      if (a2)
      {
        v30 = a2;
        v31 = _swift_stdlib_bridgeErrorToNSError();
        v33 = v31;
        sub_1D77F4D04();
      }
      else
      {
        v33 = 0;
        sub_1D77F4D04();
        v31 = 0;
      }
      *v26 = v31;

      _os_log_impl(&dword_1D77C0000, v23, v24, "[%{public}s] Error when saving onboarding acknowledgement: %@", (uint8_t *)v25, 0x16u);
      sub_1D77D925C();
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v26, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v27, -1, -1);
      MEMORY[0x1D829C8C8](v25, -1, -1);

      a3 = v32;
    }
    else
    {

    }
    return a3(0, a2);
  }
}

uint64_t sub_1D77EAD64(char a1, void *a2, uint64_t (*a3)(uint64_t, void *))
{
  uint64_t v4;
  void *v5;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if ((a1 & 1) != 0)
  {
    v4 = 1;
    v5 = 0;
  }
  else
  {
    if (qword_1F012EC68 != -1)
      swift_once();
    v7 = sub_1D77F486C();
    __swift_project_value_buffer(v7, (uint64_t)qword_1F0130128);
    v8 = a2;
    v9 = a2;
    v10 = sub_1D77F4854();
    v11 = sub_1D77F4BB4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc();
      v13 = (_QWORD *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v20[0] = v19;
      *(_DWORD *)v12 = 136446466;
      v14 = sub_1D77F4E78();
      sub_1D77C3A1C(v14, v15, v20);
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2112;
      if (a2)
      {
        v16 = a2;
        v17 = _swift_stdlib_bridgeErrorToNSError();
        sub_1D77F4D04();
      }
      else
      {
        sub_1D77F4D04();
        v17 = 0;
      }
      *v13 = v17;

      _os_log_impl(&dword_1D77C0000, v10, v11, "[%{public}s] Error when saving onboarding acknowledgement: %@", (uint8_t *)v12, 0x16u);
      sub_1D77D925C();
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v13, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v19, -1, -1);
      MEMORY[0x1D829C8C8](v12, -1, -1);
    }
    else
    {

    }
    v4 = 0;
    v5 = a2;
  }
  return a3(v4, v5);
}

uint64_t WalkingSteadinessOnboardingModel.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t WalkingSteadinessOnboardingModel.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1D77EB094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v17;
  uint64_t v18;
  _BYTE v20[40];
  uint64_t v21[5];

  v21[3] = a7;
  v21[4] = a8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v21);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a7 - 8) + 32))(boxed_opaque_existential_1, a1, a7);
  sub_1D77C4434((uint64_t)v21, (uint64_t)v20);
  v17 = sub_1D77E7D70(a7, a8);
  v18 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 192))(v20, v17, a2, a3, a4, a5);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
  return v18;
}

unint64_t sub_1D77EB168(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t (*v8)(uint64_t);
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v1 = result;
  v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1D77F4DAC();
    result = swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      sub_1D77EBD30();
      result = sub_1D77F4D34();
      v3 = result;
      v19 = v1;
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_1D77F4DAC();
      result = swift_bridgeObjectRelease();
      if (!v4)
        return v3;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x1E0DEE9E8];
  v19 = v1;
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return v3;
LABEL_9:
  v6 = 0;
  v7 = v3 + 56;
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x1E0C95E00];
  v18 = v4;
  while ((v19 & 0xC000000000000001) != 0)
  {
    result = MEMORY[0x1D829C328](v6, v19);
    v9 = __OFADD__(v6++, 1);
    if (v9)
      goto LABEL_26;
LABEL_18:
    v20 = result;
    sub_1D77F49B0();
    sub_1D77C31B8(&qword_1F01302C8, v8, MEMORY[0x1E0C95E18]);
    result = sub_1D77F4AAC();
    v10 = -1 << *(_BYTE *)(v3 + 32);
    v11 = result & ~v10;
    v12 = v11 >> 6;
    v13 = *(_QWORD *)(v7 + 8 * (v11 >> 6));
    v14 = 1 << v11;
    if (((1 << v11) & v13) != 0)
    {
      v15 = ~v10;
      sub_1D77C31B8(&qword_1F01302D0, v8, MEMORY[0x1E0C95E20]);
      do
      {
        result = sub_1D77F4AD0();
        if ((result & 1) != 0)
        {
          result = swift_release();
          v4 = v18;
          goto LABEL_11;
        }
        v11 = (v11 + 1) & v15;
        v12 = v11 >> 6;
        v13 = *(_QWORD *)(v7 + 8 * (v11 >> 6));
        v14 = 1 << v11;
      }
      while ((v13 & (1 << v11)) != 0);
      v4 = v18;
    }
    *(_QWORD *)(v7 + 8 * v12) = v14 | v13;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v20;
    v16 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v16, 1);
    v17 = v16 + 1;
    if (v9)
      goto LABEL_27;
    *(_QWORD *)(v3 + 16) = v17;
LABEL_11:
    v8 = (uint64_t (*)(uint64_t))MEMORY[0x1E0C95E00];
    if (v6 == v4)
      return v3;
  }
  if (v6 >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_28;
  result = swift_retain();
  v9 = __OFADD__(v6++, 1);
  if (!v9)
    goto LABEL_18;
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

_QWORD *sub_1D77EB3F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v13;
  uint64_t v14;

  v7 = v6;
  if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0 && sub_1D77F4DAC())
    v13 = sub_1D77EB168(MEMORY[0x1E0DEE9D8]);
  else
    v13 = MEMORY[0x1E0DEE9E8];
  v7[11] = v13;
  sub_1D77C4434(a1, (uint64_t)(v7 + 2));
  v7[7] = a3;
  v7[8] = a4;
  v7[9] = a5;
  v7[10] = a6;
  sub_1D77EBC44();
  v14 = swift_allocObject();
  *(_DWORD *)(v14 + 36) = 0;
  *(_WORD *)(v14 + 16) = 514;
  *(_QWORD *)(v14 + 24) = 0;
  *(_WORD *)(v14 + 32) = 513;
  v7[12] = v14;
  swift_allocObject();
  swift_weakInit();
  sub_1D77EBCCC();
  sub_1D77C31B8(&qword_1F01302B8, (uint64_t (*)(uint64_t))sub_1D77EBCCC, MEMORY[0x1E0C95D90]);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  sub_1D77F4A1C();
  swift_release();
  swift_beginAccess();
  sub_1D77F49A4();
  swift_endAccess();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v7;
}

void sub_1D77EB5A4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F0130158)
  {
    sub_1D77CB828(255, &qword_1F0130150);
    v0 = sub_1D77F4CF8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F0130158);
  }
}

uint64_t sub_1D77EB60C()
{
  return objectdestroyTm_0((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t sub_1D77EB61C(uint64_t *a1)
{
  uint64_t v1;

  return sub_1D77EA83C(a1, *(uint64_t (**)(char *))(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_1D77EB628()
{
  return objectdestroyTm_0((void (*)(_QWORD))MEMORY[0x1E0DEEEC0]);
}

uint64_t objectdestroyTm_0(void (*a1)(_QWORD))
{
  uint64_t v1;

  swift_release();
  a1(*(_QWORD *)(v1 + 32));
  return swift_deallocObject();
}

uint64_t sub_1D77EB67C(char a1, void *a2)
{
  uint64_t v2;

  return sub_1D77EAA10(a1, a2, *(uint64_t (**)(_QWORD, _QWORD))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(unsigned __int8 *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

unint64_t sub_1D77EB694()
{
  unint64_t result;

  result = qword_1F0130160;
  if (!qword_1F0130160)
  {
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for WalkingSteadinessOnboardingModel.CannotProgressReason, &type metadata for WalkingSteadinessOnboardingModel.CannotProgressReason);
    atomic_store(result, (unint64_t *)&qword_1F0130160);
  }
  return result;
}

unint64_t sub_1D77EB6DC()
{
  unint64_t result;

  result = qword_1F0130168;
  if (!qword_1F0130168)
  {
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for WalkingSteadinessOnboardingModel.WarningReason, &type metadata for WalkingSteadinessOnboardingModel.WarningReason);
    atomic_store(result, (unint64_t *)&qword_1F0130168);
  }
  return result;
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingModel()
{
  return objc_opt_self();
}

uint64_t method lookup function for WalkingSteadinessOnboardingModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingModel.changedDetailItems.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingModel.__allocating_init(featureStatusProvider:featureStatusPublisher:featureAvailabilityProvider:detailsProvider:dateProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingModel.nextStage(after:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingModel.determineProgressionState(from:viewController:wasPrimaryButtonPressed:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingModel.completeOnboarding(turnOnNotifications:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t getEnumTagSinglePayload for WalkingSteadinessOnboardingModel.CannotProgressReason(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for WalkingSteadinessOnboardingModel.CannotProgressReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D77EB860 + 4 * byte_1D77F74FF[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1D77EB894 + 4 * byte_1D77F74FA[v4]))();
}

uint64_t sub_1D77EB894(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77EB89C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D77EB8A4);
  return result;
}

uint64_t sub_1D77EB8B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D77EB8B8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1D77EB8BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77EB8C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessOnboardingModel.CannotProgressReason()
{
  return &type metadata for WalkingSteadinessOnboardingModel.CannotProgressReason;
}

uint64_t storeEnumTagSinglePayload for WalkingSteadinessOnboardingModel.WarningReason(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1D77EB920 + 4 * byte_1D77F7504[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1D77EB940 + 4 * byte_1D77F7509[v4]))();
}

_BYTE *sub_1D77EB920(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1D77EB940(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1D77EB948(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1D77EB950(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1D77EB958(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1D77EB960(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessOnboardingModel.WarningReason()
{
  return &type metadata for WalkingSteadinessOnboardingModel.WarningReason;
}

uint64_t getEnumTagSinglePayload for WalkingSteadinessOnboardingModel.ProgressionState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;

  if (!a2)
    return 0;
  if (a2 < 0x3E)
    goto LABEL_17;
  if (a2 + 194 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 194) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 194;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 194;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 194;
  }
LABEL_17:
  v6 = (*a1 & 0x3C | (*a1 >> 6)) ^ 0x3F;
  if (v6 >= 0x3D)
    v6 = -1;
  return v6 + 1;
}

uint64_t storeEnumTagSinglePayload for WalkingSteadinessOnboardingModel.ProgressionState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 194 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 194) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x3E)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x3D)
    return ((uint64_t (*)(void))((char *)&loc_1D77EBA64 + 4 * byte_1D77F7513[v4]))();
  *a1 = a2 - 62;
  return ((uint64_t (*)(void))((char *)sub_1D77EBA98 + 4 * byte_1D77F750E[v4]))();
}

uint64_t sub_1D77EBA98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77EBAA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D77EBAA8);
  return result;
}

uint64_t sub_1D77EBAC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D77EBAC8);
  *(_BYTE *)result = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
  return result;
}

uint64_t sub_1D77EBACC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77EBAD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77EBAE0(_BYTE *a1)
{
  int v1;

  v1 = (char)*a1;
  if (v1 >= 0)
    return *a1 >> 6;
  else
    return (v1 & 3u) + 2;
}

_BYTE *sub_1D77EBAFC(_BYTE *result)
{
  *result &= 0x3Fu;
  return result;
}

_BYTE *sub_1D77EBB0C(_BYTE *result, unsigned int a2)
{
  if (a2 < 2)
    *result = *result & 3 | ((_BYTE)a2 << 6);
  else
    *result = (a2 + 2) & 3 | 0x80;
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessOnboardingModel.ProgressionState()
{
  return &type metadata for WalkingSteadinessOnboardingModel.ProgressionState;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for WalkingSteadinessOnboardingModel.State(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && a1[18])
    return (*(_DWORD *)a1 + 254);
  v3 = *a1;
  if (v3 >= 2)
    v4 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v4 = -2;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WalkingSteadinessOnboardingModel.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 18) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 18) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessOnboardingModel.State()
{
  return &type metadata for WalkingSteadinessOnboardingModel.State;
}

uint64_t sub_1D77EBC14()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D77EBC38(char a1, void *a2)
{
  uint64_t v2;

  return sub_1D77EAD64(a1, a2, *(uint64_t (**)(uint64_t, void *))(v2 + 16));
}

void sub_1D77EBC44()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F01302A8)
  {
    type metadata accessor for os_unfair_lock_s(255);
    v0 = sub_1D77F4D70();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F01302A8);
  }
}

uint64_t sub_1D77EBCA0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1D77EBCC4()
{
  return sub_1D77E917C();
}

void sub_1D77EBCCC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F01302B0)
  {
    sub_1D77F4788();
    v0 = sub_1D77F4998();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F01302B0);
  }
}

void sub_1D77EBD30()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F01302C0)
  {
    sub_1D77F49B0();
    sub_1D77C31B8(&qword_1F01302C8, (uint64_t (*)(uint64_t))MEMORY[0x1E0C95E00], MEMORY[0x1E0C95E18]);
    v0 = sub_1D77F4D40();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F01302C0);
  }
}

void sub_1D77EBDA8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F01302D8)
  {
    sub_1D77EC080(255, &qword_1F01302E0, MEMORY[0x1E0C960D8]);
    sub_1D77F4788();
    sub_1D77EBE30();
    v0 = sub_1D77F495C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F01302D8);
  }
}

unint64_t sub_1D77EBE30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F01302F0;
  if (!qword_1F01302F0)
  {
    sub_1D77EC080(255, &qword_1F01302E0, MEMORY[0x1E0C960D8]);
    result = MEMORY[0x1D829C838](MEMORY[0x1E0C96108], v1);
    atomic_store(result, (unint64_t *)&qword_1F01302F0);
  }
  return result;
}

void sub_1D77EBE88()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F01302F8)
  {
    sub_1D77EBDA8();
    sub_1D77EBCCC();
    sub_1D77C31B8(&qword_1F0130300, (uint64_t (*)(uint64_t))sub_1D77EBDA8, MEMORY[0x1E0C95708]);
    sub_1D77C31B8(&qword_1F01302B8, (uint64_t (*)(uint64_t))sub_1D77EBCCC, MEMORY[0x1E0C95D90]);
    v0 = sub_1D77F4974();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F01302F8);
  }
}

uint64_t sub_1D77EBF50()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_1D77EBFA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
  return sub_1D77E8280(a1, a2, v2 + ((v4 + 32) & ~v4), v3, *(_QWORD *)(v2 + 24));
}

uint64_t sub_1D77EBFC4()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D77EC034()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_1D77E8928(v0 + v2, *(void (**)(char *))(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8)));
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

void sub_1D77EC080(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, _QWORD))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_1D77CA580(255, &qword_1F01302E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2BD30], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    v7 = a3(a1, v6, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEDD18]);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1D77EC100(uint64_t a1)
{
  uint64_t v2;

  sub_1D77EC080(0, &qword_1F0130310, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0DEE030]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D77EC14C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1D77EC170(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1D77E7FF8(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_1D77EC178()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D77EC1A4()
{
  uint64_t v0;

  return sub_1D77E8584(*(_QWORD *)(v0 + 16), *(void (**)(char *))(v0 + 24));
}

uint64_t WalkingSteadinessOnboardingLevelsViewController.__allocating_init()()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return WalkingSteadinessOnboardingLevelsViewController.init()();
}

void WalkingSteadinessOnboardingLevelsViewController.stage.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + qword_1F0130318);
}

uint64_t sub_1D77EC1F4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + qword_1F0130320;
  swift_beginAccess();
  return MEMORY[0x1D829C934](v1);
}

uint64_t sub_1D77EC240(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + qword_1F0130320;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_1D77EC2A8(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = qword_1F0130320;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x1D829C934](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1D77C4738;
}

uint64_t WalkingSteadinessOnboardingLevelsViewController.init()()
{
  uint64_t v0;
  _QWORD *v1;
  id v2;
  id v3;

  *(_BYTE *)(v0 + qword_1F0130318) = 2;
  *(_QWORD *)(v0 + qword_1F0130320 + 8) = 0;
  swift_unknownObjectWeakInit();
  v1 = (_QWORD *)(v0 + qword_1F0130328);
  *v1 = 0xD000000000000025;
  v1[1] = 0x80000001D77FA410;
  type metadata accessor for WalkingSteadinessLevelsDataSource();
  swift_allocObject();
  sub_1D77F1B84();
  if (qword_1F012EBC8 != -1)
    swift_once();
  v2 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v3 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  return sub_1D77F4728();
}

void sub_1D77EC4FC()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingLevelsViewController();
  objc_msgSendSuper2(&v9, sel_viewDidLoad);
  v1 = objc_msgSend(v0, sel_tableView);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_setSeparatorStyle_, 0);

    v3 = objc_msgSend(v0, sel_tableView);
    if (v3)
    {
      v4 = v3;
      objc_msgSend(v3, sel_setContentInset_, -7.0, 0.0, 0.0, 0.0);

      v5 = objc_msgSend(v0, sel_headerView);
      LODWORD(v6) = 1036831949;
      objc_msgSend(v5, sel_setTitleHyphenationFactor_, v6);

      v7 = (void *)sub_1D77F4ADC();
      v8 = (void *)sub_1D77F4ADC();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_1D77EC668(void *a1)
{
  id v1;

  v1 = a1;
  sub_1D77EC4FC();

}

uint64_t sub_1D77EC69C(char *a1)
{
  char *v2;
  uint64_t result;
  uint64_t v4;
  void (*v5)(void);
  char *v6;

  v2 = &a1[qword_1F0130320];
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v2);
  if (result)
  {
    v4 = *((_QWORD *)v2 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 8);
    v6 = a1;
    v5();

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1D77EC738(char *a1)
{
  char *v2;
  uint64_t result;
  uint64_t v4;
  void (*v5)(void);
  char *v6;

  v2 = &a1[qword_1F0130320];
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v2);
  if (result)
  {
    v4 = *((_QWORD *)v2 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 16);
    v6 = a1;
    v5();

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1D77EC7D4(char *a1)
{
  char *v2;
  uint64_t result;
  uint64_t v4;
  void (*v5)(void);
  char *v6;

  v2 = &a1[qword_1F0130320];
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v2);
  if (result)
  {
    v4 = *((_QWORD *)v2 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 24);
    v6 = a1;
    v5();

    return swift_unknownObjectRelease();
  }
  return result;
}

void WalkingSteadinessOnboardingLevelsViewController.__allocating_init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void WalkingSteadinessOnboardingLevelsViewController.init(title:detailText:dataSource:icon:tableViewStyle:allowAnimations:useSystemMargins:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1D77EC8C8()
{
  uint64_t v0;

  sub_1D77C564C(v0 + qword_1F0130320);
  return swift_bridgeObjectRelease();
}

id WalkingSteadinessOnboardingLevelsViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingLevelsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D77EC92C(uint64_t a1)
{
  sub_1D77C564C(a1 + qword_1F0130320);
  return swift_bridgeObjectRelease();
}

void sub_1D77EC968(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + qword_1F0130318);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingLevelsViewController()
{
  uint64_t result;

  result = qword_1F0130330;
  if (!qword_1F0130330)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D77EC9B8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1 + qword_1F0130320;
  swift_beginAccess();
  result = MEMORY[0x1D829C934](v3);
  v5 = *(_QWORD *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_1D77ECA10(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2 + qword_1F0130320;
  swift_beginAccess();
  *(_QWORD *)(v3 + 8) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1D77ECA70()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for WalkingSteadinessOnboardingLevelsViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingLevelsViewController.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingLevelsViewController
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 24))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingLevelsViewController.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingLevelsViewController
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 32))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingLevelsViewController.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingLevelsViewController
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 40))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingLevelsViewController.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for WalkingSteadinessOnboardingLevelsViewController + v0 + 48))();
}

uint64_t sub_1D77ECB64()
{
  return type metadata accessor for WalkingSteadinessOnboardingLevelsViewController();
}

void sub_1D77ECB6C()
{
  qword_1F0130380 = 0;
}

uint64_t ConfirmDetailsLearnMoreView.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_configuration;
  v4 = sub_1D77F4938();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

id sub_1D77ECBBC()
{
  return sub_1D77ECBF4(&OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___titleLabel, (void (*)(uint64_t))MEMORY[0x1E0DC2258], (void (*)(uint64_t))MEMORY[0x1E0DC2358]);
}

id sub_1D77ECBD8()
{
  return sub_1D77ECBF4(&OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___detailLabel, (void (*)(uint64_t))MEMORY[0x1E0DC22E8], MEMORY[0x1E0DC21A8]);
}

id sub_1D77ECBF4(uint64_t *a1, void (*a2)(uint64_t), void (*a3)(uint64_t))
{
  uint64_t v3;
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
  void *v19;
  id v20;
  void *v21;
  uint64_t (*v22)(char *, uint64_t);
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v33;
  void (*v34)(uint64_t);

  v7 = v3;
  v8 = sub_1D77F48E4();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x1E0C80A78](v8, v10);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v11, v14);
  v17 = (char *)&v33 - v16;
  v18 = *a1;
  v19 = *(void **)(v3 + *a1);
  if (v19)
  {
    v20 = *(id *)(v3 + *a1);
  }
  else
  {
    v34 = a3;
    a2(v15);
    v21 = (void *)sub_1D77F48B4();
    v22 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
    v23 = v22(v17, v8);
    a2(v23);
    v24 = (void *)sub_1D77F48CC();
    v25 = v22(v13, v8);
    v34(v25);
    v27 = v26;
    v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
    objc_msgSend(v28, sel_setNumberOfLines_, 0);
    objc_msgSend(v28, sel_setFont_, v21);
    objc_msgSend(v28, sel_setTextColor_, v24);
    v29 = v28;
    if (v27)
    {
      v29 = (void *)sub_1D77F4ADC();
      swift_bridgeObjectRelease();
      objc_msgSend(v28, sel_setText_, v29);

    }
    v30 = *(void **)(v7 + v18);
    *(_QWORD *)(v7 + v18) = v28;
    v20 = v28;

    v19 = 0;
  }
  v31 = v19;
  return v20;
}

id sub_1D77ECDD8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;

  v1 = v0;
  v2 = sub_1D77F48E4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel;
  v8 = *(void **)&v0[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel];
  if (v8)
  {
    v9 = *(id *)&v0[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel];
  }
  else
  {
    sub_1D77F4914();
    v10 = (void *)sub_1D77F48B4();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v11 = objc_msgSend(v1, sel_tintColor);
    if (qword_1F012EBC0 != -1)
      swift_once();
    v12 = (id)qword_1F012F660;
    swift_bridgeObjectRetain();
    sub_1D77F43F8();
    swift_bridgeObjectRelease();

    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
    objc_msgSend(v13, sel_setNumberOfLines_, 0);
    objc_msgSend(v13, sel_setFont_, v10);
    if (v11)
      objc_msgSend(v13, sel_setTextColor_, v11);
    v14 = (void *)sub_1D77F4ADC();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_setText_, v14);

    v15 = *(void **)&v1[v7];
    *(_QWORD *)&v1[v7] = v13;
    v9 = v13;

    v8 = 0;
  }
  v16 = v8;
  return v9;
}

id sub_1D77ED000()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___tapGestureRecognizer;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___tapGestureRecognizer);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___tapGestureRecognizer);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3D80]), sel_initWithTarget_action_, v0, sel_learnMoreTapped);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id ConfirmDetailsLearnMoreView.__deallocating_deinit()
{
  void *v0;
  id v1;
  id v2;
  objc_super v4;

  v1 = sub_1D77ECDD8();
  v2 = sub_1D77ED000();
  objc_msgSend(v1, sel_removeGestureRecognizer_, v2);

  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for ConfirmDetailsLearnMoreView();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for ConfirmDetailsLearnMoreView()
{
  uint64_t result;

  result = qword_1F01303D8;
  if (!qword_1F01303D8)
    return swift_getSingletonMetadata();
  return result;
}

id ConfirmDetailsLearnMoreView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void ConfirmDetailsLearnMoreView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1D77ED488()
{
  return type metadata accessor for ConfirmDetailsLearnMoreView();
}

uint64_t sub_1D77ED4BC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1D77F4938();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ConfirmDetailsLearnMoreView()
{
  return swift_lookUpClassMethod();
}

id sub_1D77ED550(uint64_t a1, double a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  char *v8;
  char *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  double v14;
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
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
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
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  objc_super v78;

  v8 = &v4[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_delegate];
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___titleLabel] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___detailLabel] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___learnMoreLabel] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView____lazy_storage___tapGestureRecognizer] = 0;
  v9 = &v4[OBJC_IVAR____TtC16HealthMobilityUI27ConfirmDetailsLearnMoreView_configuration];
  v10 = sub_1D77F4938();
  v75 = *(_QWORD *)(v10 - 8);
  v76 = v10;
  v77 = a1;
  (*(void (**)(char *, uint64_t))(v75 + 16))(v9, a1);
  *((_QWORD *)v8 + 1) = a4;
  swift_unknownObjectWeakAssign();
  v78.receiver = v4;
  v78.super_class = (Class)type metadata accessor for ConfirmDetailsLearnMoreView();
  v11 = objc_msgSendSuper2(&v78, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v12 = qword_1F012EC70;
  v13 = v11;
  if (v12 != -1)
    swift_once();
  v14 = a2 - (*(double *)&qword_1F0130380 + *(double *)&qword_1F0130380);
  v15 = sub_1D77ECBBC();
  objc_msgSend(v15, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v16 = sub_1D77ECBBC();
  objc_msgSend(v16, sel_setPreferredMaxLayoutWidth_, v14);

  v17 = v13;
  v18 = sub_1D77ECBBC();
  objc_msgSend(v17, sel_addSubview_, v18);

  v19 = sub_1D77ECBD8();
  objc_msgSend(v19, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v20 = sub_1D77ECBD8();
  objc_msgSend(v20, sel_setPreferredMaxLayoutWidth_, v14);

  v21 = v17;
  v22 = sub_1D77ECBD8();
  objc_msgSend(v21, sel_addSubview_, v22);

  v23 = sub_1D77ECDD8();
  objc_msgSend(v23, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v24 = sub_1D77ECDD8();
  objc_msgSend(v24, sel_setUserInteractionEnabled_, 1);

  v25 = sub_1D77ECDD8();
  v26 = sub_1D77ED000();
  objc_msgSend(v25, sel_addGestureRecognizer_, v26);

  v27 = v21;
  v28 = sub_1D77ECDD8();
  objc_msgSend(v27, sel_addSubview_, v28);

  v74 = (id)objc_opt_self();
  sub_1D77D82D4();
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_1D77F7790;
  v30 = sub_1D77ECBBC();
  v31 = objc_msgSend(v30, sel_topAnchor);

  v32 = objc_msgSend(v27, sel_topAnchor);
  v33 = objc_msgSend(v31, sel_constraintEqualToAnchor_, v32);

  *(_QWORD *)(v29 + 32) = v33;
  v34 = sub_1D77ECBBC();
  v35 = objc_msgSend(v34, sel_leadingAnchor);

  v36 = objc_msgSend(v27, sel_leadingAnchor);
  v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_constant_, v36, *(double *)&qword_1F0130380);

  *(_QWORD *)(v29 + 40) = v37;
  v38 = sub_1D77ECBBC();
  v39 = objc_msgSend(v38, sel_trailingAnchor);

  v40 = objc_msgSend(v27, sel_trailingAnchor);
  v41 = objc_msgSend(v39, sel_constraintLessThanOrEqualToAnchor_constant_, v40, -*(double *)&qword_1F0130380);

  *(_QWORD *)(v29 + 48) = v41;
  v42 = sub_1D77ECBD8();
  v43 = objc_msgSend(v42, sel_topAnchor);

  v44 = sub_1D77ECBBC();
  v45 = objc_msgSend(v44, sel_bottomAnchor);

  v46 = objc_msgSend(v43, sel_constraintEqualToAnchor_constant_, v45, 4.0);
  *(_QWORD *)(v29 + 56) = v46;
  v47 = sub_1D77ECBD8();
  v48 = objc_msgSend(v47, sel_leadingAnchor);

  v49 = objc_msgSend(v27, sel_leadingAnchor);
  v50 = objc_msgSend(v48, sel_constraintEqualToAnchor_constant_, v49, *(double *)&qword_1F0130380);

  *(_QWORD *)(v29 + 64) = v50;
  v51 = sub_1D77ECBD8();
  v52 = objc_msgSend(v51, sel_trailingAnchor);

  v53 = objc_msgSend(v27, sel_trailingAnchor);
  v54 = objc_msgSend(v52, sel_constraintLessThanOrEqualToAnchor_constant_, v53, -*(double *)&qword_1F0130380);

  *(_QWORD *)(v29 + 72) = v54;
  v55 = sub_1D77ECDD8();
  v56 = objc_msgSend(v55, sel_topAnchor);

  v57 = sub_1D77ECBD8();
  v58 = objc_msgSend(v57, sel_bottomAnchor);

  v59 = objc_msgSend(v56, sel_constraintEqualToAnchor_constant_, v58, 2.0);
  *(_QWORD *)(v29 + 80) = v59;
  v60 = sub_1D77ECDD8();
  v61 = objc_msgSend(v60, sel_leadingAnchor);

  v62 = objc_msgSend(v27, sel_leadingAnchor);
  v63 = objc_msgSend(v61, sel_constraintEqualToAnchor_constant_, v62, *(double *)&qword_1F0130380);

  *(_QWORD *)(v29 + 88) = v63;
  v64 = sub_1D77ECDD8();
  v65 = objc_msgSend(v64, sel_trailingAnchor);

  v66 = objc_msgSend(v27, sel_trailingAnchor);
  v67 = objc_msgSend(v65, sel_constraintLessThanOrEqualToAnchor_constant_, v66, -*(double *)&qword_1F0130380);

  *(_QWORD *)(v29 + 96) = v67;
  v68 = sub_1D77ECDD8();
  v69 = objc_msgSend(v68, (SEL)&stru_1E9C35370.size + 1);

  v70 = objc_msgSend(v27, (SEL)&stru_1E9C35370.size + 1);
  v71 = objc_msgSend(v69, sel_constraintEqualToAnchor_constant_, v70, -18.0);

  *(_QWORD *)(v29 + 104) = v71;
  sub_1D77F4B54();
  sub_1D77D832C();
  v72 = (void *)sub_1D77F4B48();
  swift_bridgeObjectRelease();
  objc_msgSend(v74, sel_activateConstraints_, v72);

  (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v77, v76);
  return v27;
}

uint64_t WalkingSteadinessOnboardingStage.analyticsName.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1D77EDD18 + 4 * byte_1D77F7830[*v0]))(0xD000000000000016, 0x80000001D77F7FF0);
}

uint64_t sub_1D77EDD18()
{
  return 0x446D7269666E6F63;
}

uint64_t sub_1D77EDD3C(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_1D77EDD54()
{
  return 0x6163696669746F6ELL;
}

uint64_t sub_1D77EDD78()
{
  return 0x6974656C706D6F63;
}

BOOL static WalkingSteadinessOnboardingStage.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t WalkingSteadinessOnboardingStage.hash(into:)()
{
  return sub_1D77F4E48();
}

void *static WalkingSteadinessOnboardingStage.allCases.getter()
{
  return &unk_1E9C30FB0;
}

uint64_t WalkingSteadinessOnboardingStage.hashValue.getter()
{
  sub_1D77F4E3C();
  sub_1D77F4E48();
  return sub_1D77F4E54();
}

unint64_t sub_1D77EDE24()
{
  unint64_t result;

  result = qword_1F01303E8;
  if (!qword_1F01303E8)
  {
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for WalkingSteadinessOnboardingStage, &type metadata for WalkingSteadinessOnboardingStage);
    atomic_store(result, (unint64_t *)&qword_1F01303E8);
  }
  return result;
}

unint64_t sub_1D77EDE6C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F01303F0;
  if (!qword_1F01303F0)
  {
    sub_1D77EDEB4();
    result = MEMORY[0x1D829C838](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1F01303F0);
  }
  return result;
}

void sub_1D77EDEB4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F01303F8)
  {
    v0 = sub_1D77F4B60();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F01303F8);
  }
}

void sub_1D77EDF08(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E9C30FD8;
}

uint64_t getEnumTagSinglePayload for WalkingSteadinessOnboardingStage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WalkingSteadinessOnboardingStage(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D77EDFF4 + 4 * byte_1D77F783A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1D77EE028 + 4 * byte_1D77F7835[v4]))();
}

uint64_t sub_1D77EE028(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77EE030(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D77EE038);
  return result;
}

uint64_t sub_1D77EE044(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D77EE04CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1D77EE050(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77EE058(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessOnboardingStage()
{
  return &type metadata for WalkingSteadinessOnboardingStage;
}

uint64_t sub_1D77EE074()
{
  return swift_deallocClassInstance();
}

id sub_1D77EE084()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for Dummy();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1EDA11EC0 = (uint64_t)result;
  return result;
}

id static NSBundle.healthMobilityUI.getter()
{
  if (qword_1EDA12030 != -1)
    swift_once();
  return (id)qword_1EDA11EC0;
}

uint64_t type metadata accessor for Dummy()
{
  return objc_opt_self();
}

id sub_1D77EE138(uint64_t a1)
{
  return sub_1D77EE154(a1, &qword_1F0130408, 0x1E0D2F8B8, &qword_1F0133130);
}

id sub_1D77EE154(uint64_t a1, unint64_t *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t ObjCClassFromMetadata;
  id result;

  sub_1D77D005C(0, a2);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  *a4 = result;
  return result;
}

id sub_1D77EE1A8(uint64_t a1)
{
  return sub_1D77EE154(a1, &qword_1F0130400, 0x1E0D2F298, &qword_1F0133138);
}

void sub_1D77EE1C4()
{
  qword_1F0130410 = 0x4010000000000000;
}

void sub_1D77EE1D4()
{
  qword_1F0130418 = 0x4014000000000000;
}

char *sub_1D77EE1E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v7;
  id v8;
  char *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  char *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
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
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v74;
  id v75;
  objc_super v76;

  v4 = v3;
  swift_getObjectType();
  v7 = OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_title;
  v8 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v9 = v4;
  v10 = objc_msgSend(v8, sel_init);
  objc_msgSend(v10, sel_setNumberOfLines_, 0);
  *(_QWORD *)&v4[v7] = v10;
  v11 = OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_detail;
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  objc_msgSend(v12, sel_setNumberOfLines_, 0);
  *(_QWORD *)&v9[v11] = v12;

  if (a3)
  {
    v13 = (void *)sub_1D77F4ADC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  v76.receiver = v9;
  v76.super_class = (Class)type metadata accessor for BaseInfoCell();
  v14 = objc_msgSendSuper2(&v76, sel_initWithStyle_reuseIdentifier_, a1, v13);

  v15 = (char *)v14;
  v16 = objc_msgSend(v15, sel_contentView);
  v17 = OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_title;
  objc_msgSend(v16, sel_addSubview_, *(_QWORD *)&v15[OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_title]);

  v18 = objc_msgSend(v15, sel_contentView);
  v19 = OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_detail;
  objc_msgSend(v18, sel_addSubview_, *(_QWORD *)&v15[OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_detail]);

  v20 = *(void **)&v15[v17];
  v21 = (void *)objc_opt_self();
  v22 = objc_msgSend(v21, sel__preferredFontForTextStyle_variant_, *MEMORY[0x1E0DC4B58], 1024);
  objc_msgSend(v20, sel_setFont_, v22);

  v23 = *(void **)&v15[v19];
  v74 = v19;
  v24 = objc_msgSend(v21, sel_preferredFontForTextStyle_, *MEMORY[0x1E0DC4A88]);
  objc_msgSend(v23, sel_setFont_, v24);

  v25 = *(void **)&v15[v17];
  objc_msgSend(v25, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  LODWORD(v26) = 1148846080;
  objc_msgSend(v25, sel_setContentCompressionResistancePriority_forAxis_, 1, v26);
  LODWORD(v27) = 1144750080;
  objc_msgSend(v25, sel_setContentHuggingPriority_forAxis_, 1, v27);
  LODWORD(v28) = 1144750080;
  objc_msgSend(v25, sel_setContentHuggingPriority_forAxis_, 0, v28);
  v29 = *(void **)&v15[v19];
  objc_msgSend(v29, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  LODWORD(v30) = 1148846080;
  objc_msgSend(v29, sel_setContentCompressionResistancePriority_forAxis_, 1, v30);
  LODWORD(v31) = 1144750080;
  objc_msgSend(v29, sel_setContentHuggingPriority_forAxis_, 1, v31);
  LODWORD(v32) = 1144750080;
  objc_msgSend(v29, sel_setContentHuggingPriority_forAxis_, 0, v32);
  v75 = (id)objc_opt_self();
  sub_1D77D82D4();
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_1D77F7940;
  v34 = objc_msgSend(v25, sel_topAnchor);
  v35 = objc_msgSend(v15, sel_contentView);
  v36 = objc_msgSend(v35, sel_layoutMarginsGuide);

  v37 = objc_msgSend(v36, (SEL)&ConfirmDetailsValueFormatterImpl.weak_ivar_lyt + 4);
  v38 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v37);

  *(_QWORD *)(v33 + 32) = v38;
  v39 = objc_msgSend(*(id *)&v15[v17], sel_leadingAnchor);
  v40 = objc_msgSend(v15, sel_contentView);
  v41 = objc_msgSend(v40, sel_layoutMarginsGuide);

  v42 = objc_msgSend(v41, sel_leadingAnchor);
  v43 = objc_msgSend(v39, sel_constraintEqualToAnchor_, v42);

  *(_QWORD *)(v33 + 40) = v43;
  v44 = objc_msgSend(*(id *)&v15[v17], sel_trailingAnchor);
  v45 = objc_msgSend(v15, sel_contentView);
  v46 = objc_msgSend(v45, sel_layoutMarginsGuide);

  v47 = objc_msgSend(v46, sel_trailingAnchor);
  v48 = objc_msgSend(v44, sel_constraintEqualToAnchor_, v47);

  *(_QWORD *)(v33 + 48) = v48;
  v49 = objc_msgSend(*(id *)&v15[v74], sel_topAnchor);
  v50 = objc_msgSend(*(id *)&v15[v17], sel_bottomAnchor);
  if (qword_1F012EC88 != -1)
    swift_once();
  v51 = objc_msgSend(v49, sel_constraintEqualToAnchor_constant_, v50, *(double *)&qword_1F0130410);

  *(_QWORD *)(v33 + 56) = v51;
  v52 = objc_msgSend(*(id *)&v15[v74], sel_leadingAnchor);
  v53 = objc_msgSend(v15, sel_contentView);
  v54 = objc_msgSend(v53, sel_layoutMarginsGuide);

  v55 = objc_msgSend(v54, sel_leadingAnchor);
  v56 = objc_msgSend(v52, sel_constraintEqualToAnchor_, v55);

  *(_QWORD *)(v33 + 64) = v56;
  v57 = objc_msgSend(*(id *)&v15[v74], sel_trailingAnchor);
  v58 = objc_msgSend(v15, sel_contentView);
  v59 = objc_msgSend(v58, sel_layoutMarginsGuide);

  v60 = objc_msgSend(v59, sel_trailingAnchor);
  v61 = objc_msgSend(v57, sel_constraintEqualToAnchor_, v60);

  *(_QWORD *)(v33 + 72) = v61;
  v62 = objc_msgSend(*(id *)&v15[v74], sel_bottomAnchor);
  v63 = objc_msgSend(v15, sel_contentView);
  v64 = objc_msgSend(v63, sel_bottomAnchor);

  if (qword_1F012EC90 != -1)
    swift_once();
  v65 = objc_msgSend(v62, sel_constraintEqualToAnchor_constant_, v64, -*(double *)&qword_1F0130418);

  *(_QWORD *)(v33 + 80) = v65;
  sub_1D77F4B54();
  sub_1D77D832C();
  v66 = (void *)sub_1D77F4B48();
  swift_bridgeObjectRelease();
  objc_msgSend(v75, sel_activateConstraints_, v66);

  sub_1D77EF120();
  v67 = swift_allocObject();
  *(_OWORD *)(v67 + 16) = xmmword_1D77F5EA0;
  v68 = sub_1D77F4944();
  v69 = MEMORY[0x1E0DC29B0];
  *(_QWORD *)(v67 + 32) = v68;
  *(_QWORD *)(v67 + 40) = v69;
  v70 = sub_1D77F4878();
  v71 = MEMORY[0x1E0DC1F90];
  *(_QWORD *)(v67 + 48) = v70;
  *(_QWORD *)(v67 + 56) = v71;
  v72 = v15;
  sub_1D77F4CC8();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v72;
}

id sub_1D77EEA2C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseInfoCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BaseInfoCell()
{
  return objc_opt_self();
}

uint64_t sub_1D77EEAB4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1D77EEAF4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  int v9;
  _BYTE v11[40];

  v1 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v2 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68);
  v3 = sub_1D77F4CF8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = &v11[-v6];
  v8 = (uint64_t)v0 + qword_1F0130458;
  swift_beginAccess();
  sub_1D77CB068(v8, (uint64_t)v11);
  sub_1D77E2B84();
  v9 = swift_dynamicCast();
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v7, v9 ^ 1u, 1, v2);
  (*(void (**)(_BYTE *))((*v1 & *v0) + 0x98))(v7);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_1D77EEC0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + qword_1F0130458;
  swift_beginAccess();
  return sub_1D77CB068(v3, a1);
}

uint64_t sub_1D77EEC5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + qword_1F0130458;
  swift_beginAccess();
  sub_1D77CB148(a1, v3);
  swift_endAccess();
  sub_1D77EEAF4();
  return sub_1D77E2C2C(a1);
}

uint64_t (*sub_1D77EECC8(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D77EED10;
}

uint64_t sub_1D77EED10(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return sub_1D77EEAF4();
  return result;
}

void sub_1D77EED40()
{
  sub_1D77F4DA0();
  __break(1u);
}

id sub_1D77EED98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  objc_class *v10;
  id v11;
  objc_super v13;

  v6 = *v4;
  v7 = *MEMORY[0x1E0DEEDD8];
  v8 = (char *)v4 + qword_1F0130458;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  if (a3)
  {
    v9 = (void *)sub_1D77F4ADC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v10 = (objc_class *)type metadata accessor for BaseInfoItemCell(0, *(_QWORD *)((v7 & v6) + 0x68), *(_QWORD *)((v7 & v6) + 0x70), a4);
  v13.receiver = v4;
  v13.super_class = v10;
  v11 = objc_msgSendSuper2(&v13, sel_initWithStyle_reuseIdentifier_, a1, v9);

  return v11;
}

uint64_t sub_1D77EEE54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1D77EEE60(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1D77EED98);
}

uint64_t sub_1D77EEE60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;

  if (a4)
  {
    a4 = sub_1D77F4AE8();
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  return a5(a3, a4, v8);
}

uint64_t sub_1D77EEEB4()
{
  uint64_t v0;

  return sub_1D77E2C2C(v0 + qword_1F0130458);
}

id sub_1D77EEEC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for BaseInfoItemCell(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + 0x68), *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + 0x70), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_1D77EEF10(uint64_t a1)
{
  return sub_1D77E2C2C(a1 + qword_1F0130458);
}

uint64_t type metadata accessor for BaseInfoItemCell(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BaseInfoItemCell);
}

void (*sub_1D77EEF34(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1D77EECC8((uint64_t)v2);
  return sub_1D77D25B0;
}

void sub_1D77EEF7C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_title);
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel__preferredFontForTextStyle_variant_, *MEMORY[0x1E0DC4B58], 1024);
  objc_msgSend(v2, sel_setFont_, v4);

  v5 = *(void **)(a1 + OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_detail);
  v6 = objc_msgSend(v3, sel_preferredFontForTextStyle_, *MEMORY[0x1E0DC4A88]);
  objc_msgSend(v5, sel_setFont_, v6);

}

void sub_1D77EF054()
{
  char *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;

  v1 = OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_title;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  objc_msgSend(v2, sel_setNumberOfLines_, 0);
  *(_QWORD *)&v0[v1] = v2;
  v3 = OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_detail;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  objc_msgSend(v4, sel_setNumberOfLines_, 0);
  *(_QWORD *)&v0[v3] = v4;

  sub_1D77F4DA0();
  __break(1u);
}

void sub_1D77EF120()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012F4D0)
  {
    sub_1D77D3F4C();
    v0 = sub_1D77F4DF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012F4D0);
  }
}

uint64_t sub_1D77EF174()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1D77F486C();
  __swift_allocate_value_buffer(v0, qword_1F01304E0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F01304E0);
  if (qword_1F012EBF0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F6F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

id sub_1D77EF204()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController____lazy_storage___iconWithShadow;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController____lazy_storage___iconWithShadow);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController____lazy_storage___iconWithShadow);
  }
  else
  {
    v4 = sub_1D77F033C();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1D77EF260()
{
  _BYTE *v0;
  _QWORD *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
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
  objc_super v36;

  *(_QWORD *)&v0[OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController____lazy_storage___iconWithShadow] = 0;
  v0[OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_stage] = 3;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v1 = &v0[OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_baseIdentifier];
  *v1 = 0xD000000000000028;
  v1[1] = 0x80000001D77F9640;
  if (qword_1F012EBC8 != -1)
    swift_once();
  v2 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v3 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v4 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v5 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v36.receiver = v0;
  v36.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingNotificationsViewController();
  v6 = objc_msgSendSuper2(&v36, sel_initWithTitle_detailText_icon_contentLayout_, v3, v5, 0, 3, 0xE000000000000000);

  v7 = v6;
  v8 = objc_msgSend(v7, sel_headerView);
  LODWORD(v9) = 1036831949;
  objc_msgSend(v8, sel_setTitleHyphenationFactor_, v9);

  v10 = objc_msgSend(v7, sel_headerView);
  objc_msgSend(v10, sel_setAllowFullWidthIcon_, 1);

  v11 = objc_msgSend(v7, sel_headerView);
  v12 = objc_msgSend(v11, sel_customIconContainerView);

  if (v12)
  {
    objc_msgSend(v12, sel_setClipsToBounds_, 0);
    v13 = sub_1D77EF204();
    objc_msgSend(v12, sel_addSubview_, v13);

    v14 = (void *)objc_opt_self();
    if ((objc_msgSend(v14, sel_hk_currentDeviceHas4InchScreen) & 1) != 0
      || objc_msgSend(v14, sel_hk_currentDeviceHas4Point7InchScreen))
    {
      v15 = (void *)objc_opt_self();
      sub_1D77F0564(0, (unint64_t *)&qword_1F012F050);
      v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_1D77F6740;
      v17 = sub_1D77EF204();
      v18 = objc_msgSend(v17, sel_topAnchor);

      v19 = objc_msgSend(v12, sel_topAnchor);
      v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_constant_, v19, 10.0);

      *(_QWORD *)(v16 + 32) = v20;
      v21 = sub_1D77EF204();
      v22 = objc_msgSend(v21, sel_leadingAnchor);

      v23 = objc_msgSend(v12, sel_leadingAnchor);
      v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v23);

      *(_QWORD *)(v16 + 40) = v24;
      v25 = sub_1D77EF204();
      v26 = objc_msgSend(v25, sel_trailingAnchor);

      v27 = objc_msgSend(v12, sel_trailingAnchor);
      v28 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v27);

      *(_QWORD *)(v16 + 48) = v28;
      v29 = sub_1D77EF204();
      v30 = objc_msgSend(v29, sel_bottomAnchor);

      v31 = objc_msgSend(v12, sel_bottomAnchor);
      v32 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v31);

      *(_QWORD *)(v16 + 56) = v32;
      sub_1D77F4B54();
      sub_1D77D005C(0, (unint64_t *)&qword_1F012F7C0);
      v33 = (id)sub_1D77F4B48();
      swift_bridgeObjectRelease();
      objc_msgSend(v15, sel_activateConstraints_, v33);
    }
    else
    {
      v34 = sub_1D77EF204();
      v33 = v12;
      objc_msgSend(v34, sel_hk_alignConstraintsWithView_, v33);

    }
  }

  return v7;
}

void sub_1D77EF7F0()
{
  char *v0;
  uint64_t ObjectType;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v18;

  ObjectType = swift_getObjectType();
  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingNotificationsViewController();
  objc_msgSendSuper2(&v18, sel_viewDidLoad);
  sub_1D77EF120();
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1D77F64E0;
  v3 = sub_1D77F4884();
  v4 = MEMORY[0x1E0DC2160];
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = v4;
  *(_QWORD *)(swift_allocObject() + 16) = ObjectType;
  sub_1D77F4C08();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_1F012EBC8 != -1)
    swift_once();
  v5 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v6 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  sub_1D77F0564(0, (unint64_t *)&qword_1F012F0F8);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1D77F67A0;
  v8 = *(_QWORD *)&v0[OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_baseIdentifier];
  v9 = *(_QWORD *)&v0[OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_baseIdentifier
                    + 8];
  *(_QWORD *)(v7 + 32) = v8;
  *(_QWORD *)(v7 + 40) = v9;
  *(_QWORD *)(v7 + 48) = 0x656C62616E45;
  *(_QWORD *)(v7 + 56) = 0xE600000000000000;
  *(_QWORD *)(v7 + 64) = 0x6E6F74747542;
  *(_QWORD *)(v7 + 72) = 0xE600000000000000;
  swift_bridgeObjectRetain();
  v10 = (void *)sub_1D77F4B48();
  swift_bridgeObjectRelease();
  v11 = (id)HKUIJoinStringsForAutomationIdentifier();

  v12 = (id)qword_1F012F678;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v13 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1D77F67A0;
  *(_QWORD *)(v14 + 32) = v8;
  *(_QWORD *)(v14 + 40) = v9;
  *(_QWORD *)(v14 + 48) = 0x62616E45746E6F44;
  *(_QWORD *)(v14 + 56) = 0xEA0000000000656CLL;
  *(_QWORD *)(v14 + 64) = 0x6E6F74747542;
  *(_QWORD *)(v14 + 72) = 0xE600000000000000;
  swift_bridgeObjectRetain();
  v15 = (void *)sub_1D77F4B48();
  swift_bridgeObjectRelease();
  v16 = (id)HKUIJoinStringsForAutomationIdentifier();

  v17 = (void *)sub_1D77F4ADC();
}

void sub_1D77EFBFC(void *a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  uint64_t v17;

  v2 = objc_msgSend(a1, sel_traitCollection);
  if (qword_1EDA12030 != -1)
    swift_once();
  v3 = (id)qword_1EDA11EC0;
  v4 = v2;
  v5 = (void *)sub_1D77F4ADC();
  v6 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v5, v3, v4);

  if (v6)
  {
    v15 = objc_msgSend(a1, sel_headerView);
    objc_msgSend(v15, sel_setIcon_accessibilityLabel_, v6, 0);

  }
  else
  {
    if (qword_1F012EC98 != -1)
      swift_once();
    v7 = sub_1D77F486C();
    __swift_project_value_buffer(v7, (uint64_t)qword_1F01304E0);
    v15 = a1;
    v8 = sub_1D77F4854();
    v9 = sub_1D77F4BC0();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = swift_slowAlloc();
      v11 = (_QWORD *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v17 = v12;
      *(_DWORD *)v10 = 136446466;
      v13 = sub_1D77F4E78();
      sub_1D77C3A1C(v13, v14, &v17);
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2112;
      v16 = objc_msgSend(v15, sel_traitCollection);
      sub_1D77F4D04();
      *v11 = v16;

      _os_log_impl(&dword_1D77C0000, v8, v9, "[%{public}s] Unable to load icon for %@", (uint8_t *)v10, 0x16u);
      sub_1D77D925C();
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v11, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v12, -1, -1);
      MEMORY[0x1D829C8C8](v10, -1, -1);

      return;
    }

  }
}

id sub_1D77F0164()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingNotificationsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingNotificationsViewController()
{
  return objc_opt_self();
}

void sub_1D77F0200(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_stage);
}

uint64_t sub_1D77F0214()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_delegate;
  swift_beginAccess();
  return MEMORY[0x1D829C934](v1);
}

uint64_t sub_1D77F0260(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_delegate;
  swift_beginAccess();
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1D77F02C8(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16HealthMobilityUI54WalkingSteadinessOnboardingNotificationsViewController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x1D829C934](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_1D77C4D1C;
}

id sub_1D77F033C()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  double v8;
  id v9;
  id v10;

  if (qword_1EDA12030 != -1)
    swift_once();
  v0 = (id)qword_1EDA11EC0;
  v1 = (void *)sub_1D77F4ADC();
  v2 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v1, v0, 0);

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithImage_, v2);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v3, sel_setContentMode_, 1);
  v4 = objc_msgSend(v3, sel_layer);
  v5 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
  v6 = objc_msgSend(v5, sel_CGColor);

  objc_msgSend(v4, sel_setShadowColor_, v6);
  v7 = objc_msgSend(v3, sel_layer);
  LODWORD(v8) = 1041865114;
  objc_msgSend(v7, sel_setShadowOpacity_, v8);

  v9 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v9, sel_setShadowRadius_, 7.0);

  v10 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v10, sel_setShadowOffset_, 0.0, 1.0);

  return v3;
}

uint64_t sub_1D77F054C()
{
  return swift_deallocObject();
}

void sub_1D77F055C(void *a1)
{
  sub_1D77EFBFC(a1);
}

void sub_1D77F0564(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1D77F4DF4();
    if (!v4)
      atomic_store(v3, a2);
  }
}

_QWORD *ConfirmDetailsValueFormatterImpl.__allocating_init(healthStore:)(void *a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  v2 = (_QWORD *)swift_allocObject();
  v2[4] = 0;
  v2[5] = 0;
  v2[2] = a1;
  v3 = (void *)objc_opt_self();
  v4 = a1;
  v5 = objc_msgSend(v3, sel_sharedInstanceForHealthStore_, v4);
  v6 = objc_msgSend(v5, sel_createHKUnitPreferenceController);

  v2[3] = v6;
  return v2;
}

uint64_t sub_1D77F0648()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1D77F486C();
  __swift_allocate_value_buffer(v0, qword_1F0130540);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F0130540);
  if (qword_1F012EBF0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F6F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_1D77F06D8()
{
  id v0;
  id v1;
  void *v2;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3750]), sel_init);
  objc_msgSend(v0, sel_setForPersonMassUse_, 1);
  v1 = objc_msgSend(v0, sel_numberFormatter);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_setRoundingMode_, 6);

    qword_1F0133140 = (uint64_t)v0;
  }
  else
  {
    __break(1u);
  }
}

id sub_1D77F075C(uint64_t a1)
{
  return sub_1D77F0784(a1, 0x1E0D2F808, &qword_1F0133148);
}

id sub_1D77F0770(uint64_t a1)
{
  return sub_1D77F0784(a1, 0x1E0D2F810, &qword_1F0133150);
}

id sub_1D77F0784(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedFormatter);
  if (result)
    *a3 = result;
  else
    __break(1u);
  return result;
}

id sub_1D77F07C8()
{
  _BYTE *v0;
  unsigned int v1;
  void *v2;
  id v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if ((*v0 & 1) != 0)
  {
    if (qword_1F012ECB0 != -1)
      swift_once();
    v1 = objc_msgSend((id)qword_1F0133148, sel_usesImperialUnits);
    v2 = (void *)objc_opt_self();
    if (v1)
      v3 = objc_msgSend(v2, sel_inchUnit);
    else
      v3 = objc_msgSend(v2, sel_meterUnitWithMetricPrefix_, 5);
  }
  else
  {
    v5[0] = 14;
    if (qword_1F012ECA8 != -1)
      swift_once();

    v3 = objc_msgSend((id)objc_opt_self(), sel_unitFromMassFormatterUnit_, v5[0]);
  }
  return v3;
}

void sub_1D77F0914(id a1)
{
  _BYTE *v1;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  if (*v1 == 1)
  {
    if (qword_1F012ECB0 != -1)
      swift_once();
    v3 = (void *)qword_1F0133148;
    v4 = objc_msgSend((id)objc_opt_self(), sel_meterUnitWithMetricPrefix_, 5);
    objc_msgSend(a1, sel_doubleValueForUnit_, v4);

    v5 = (void *)sub_1D77F4B78();
    a1 = objc_msgSend(v3, sel_localizedStringFromHeightInCentimeters_, v5);

    if (a1)
      goto LABEL_9;
    __break(1u);
  }
  if (qword_1F012ECB8 != -1)
    swift_once();
  v6 = (void *)qword_1F0133150;
  v7 = objc_msgSend((id)objc_opt_self(), sel_gramUnitWithMetricPrefix_, 9);
  objc_msgSend(a1, sel_doubleValueForUnit_, v7);

  v8 = (void *)sub_1D77F4B78();
  a1 = objc_msgSend(v6, sel_stringFromWeightInKilograms_, v8);

  if (a1)
  {
LABEL_9:
    sub_1D77F4AE8();

    return;
  }
  __break(1u);
}

BOOL static ConfirmDetailsValueFormatterImpl.ValueType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ConfirmDetailsValueFormatterImpl.ValueType.hash(into:)()
{
  return sub_1D77F4E48();
}

uint64_t ConfirmDetailsValueFormatterImpl.ValueType.hashValue.getter()
{
  sub_1D77F4E3C();
  sub_1D77F4E48();
  return sub_1D77F4E54();
}

BOOL sub_1D77F0B44(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

id sub_1D77F0B5C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id result;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 32);
  if (v1)
  {
    v2 = *(id *)(v0 + 32);
LABEL_5:
    v5 = v1;
    return v2;
  }
  result = objc_msgSend(*(id *)(v0 + 16), sel_displayTypeController);
  if (result)
  {
    v4 = *(void **)(v0 + 32);
    *(_QWORD *)(v0 + 32) = result;
    v2 = result;

    v1 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_1D77F0BCC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id result;
  void *v5;
  void *v6;
  id v7;

  v1 = *(void **)(v0 + 40);
  if (v1)
  {
    v2 = *(id *)(v0 + 40);
LABEL_5:
    v7 = v1;
    return v2;
  }
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3728]), sel_init);
  objc_msgSend(v3, sel_setForPersonHeightUse_, 1);
  objc_msgSend(v3, sel_setUnitStyle_, 2);
  result = objc_msgSend(v3, sel_numberFormatter);
  if (result)
  {
    v5 = result;
    objc_msgSend(result, sel_setMaximumFractionDigits_, 0);

    v6 = *(void **)(v0 + 40);
    *(_QWORD *)(v0 + 40) = v3;
    v2 = v3;

    v1 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

_QWORD *ConfirmDetailsValueFormatterImpl.init(healthStore:)(void *a1)
{
  _QWORD *v1;
  void *v3;
  id v4;
  id v5;
  id v6;

  v1[4] = 0;
  v1[5] = 0;
  v1[2] = a1;
  v3 = (void *)objc_opt_self();
  v4 = a1;
  v5 = objc_msgSend(v3, sel_sharedInstanceForHealthStore_, v4);
  v6 = objc_msgSend(v5, sel_createHKUnitPreferenceController);

  v1[3] = v6;
  return v1;
}

id sub_1D77F0D20(unsigned __int8 *a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  id *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = v1;
  v3 = *a1;
  sub_1D77D005C(0, (unint64_t *)&qword_1F012F6C0);
  v4 = (id *)MEMORY[0x1E0CB5CC0];
  if (!v3)
    v4 = (id *)MEMORY[0x1E0CB5AB8];
  v5 = (id)MEMORY[0x1D829C19C](*v4);
  v6 = sub_1D77F0B5C();
  v7 = objc_msgSend(v6, sel_displayTypeForObjectType_, v5);

  if (!v7)
    goto LABEL_10;
  v8 = objc_msgSend(*(id *)(v2 + 24), sel_unitForDisplayType_, v7);
  if (!v8)
  {

LABEL_10:
    if (qword_1F012ECA0 != -1)
      swift_once();
    v15 = sub_1D77F486C();
    __swift_project_value_buffer(v15, (uint64_t)qword_1F0130540);
    v5 = v5;
    v16 = sub_1D77F4854();
    v17 = sub_1D77F4BC0();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = swift_slowAlloc();
      v25 = swift_slowAlloc();
      v26 = v25;
      *(_DWORD *)v18 = 136446722;
      v19 = sub_1D77F4E78();
      sub_1D77C3A1C(v19, v20, &v26);
      sub_1D77F4D04();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2082;
      sub_1D77C3A1C(0xD000000000000013, 0x80000001D77FA8F0, &v26);
      sub_1D77F4D04();
      *(_WORD *)(v18 + 22) = 2082;
      v21 = objc_msgSend(v5, sel_identifier);
      v22 = sub_1D77F4AE8();
      v24 = v23;

      sub_1D77C3A1C(v22, v24, &v26);
      sub_1D77F4D04();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1D77C0000, v16, v17, "[%{public}s.%{public}s]: Unable to determine preferred unit for type %{public}s", (uint8_t *)v18, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1D829C8C8](v25, -1, -1);
      MEMORY[0x1D829C8C8](v18, -1, -1);

    }
    else
    {

    }
    LOBYTE(v26) = v3;
    v9 = sub_1D77F07C8();
    goto LABEL_16;
  }
  v9 = v8;
  if ((v3 & 1) != 0)
  {
    sub_1D77D005C(0, (unint64_t *)&qword_1F012F650);
    v10 = (void *)objc_opt_self();
    v11 = objc_msgSend(v10, sel_meterUnit);
    v12 = sub_1D77F4CE0();

    if ((v12 & 1) != 0)
    {
      v13 = objc_msgSend(v10, sel_meterUnitWithMetricPrefix_, 5);

      return v13;
    }
  }

LABEL_16:
  return v9;
}

uint64_t sub_1D77F10C4(_BYTE *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v5;
  id v6;
  id *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  id v37;
  char v38;
  id v39;
  uint64_t v40;
  os_log_type_t type;
  uint64_t v42;
  void *v43;
  uint64_t v44;

  v3 = v2;
  LOBYTE(v44) = *a1;
  v5 = v44;
  v6 = sub_1D77F0D20((unsigned __int8 *)&v44);
  sub_1D77D005C(0, (unint64_t *)&qword_1F012F6C0);
  v7 = (id *)MEMORY[0x1E0CB5CC0];
  if (!v5)
    v7 = (id *)MEMORY[0x1E0CB5AB8];
  v8 = (void *)MEMORY[0x1D829C19C](*v7);
  v9 = sub_1D77F0B5C();
  v10 = objc_msgSend(v9, sel_displayTypeForObjectType_, v8);

  if (v10)
  {
    if (v5)
    {
      v11 = (void *)objc_opt_self();
      v12 = v6;
      v13 = objc_msgSend(v11, sel_footUnit);
      sub_1D77D005C(0, (unint64_t *)&qword_1F012F650);
      v14 = sub_1D77F4CE0();

      if ((v14 & 1) == 0)
      {
        v12 = v12;
        v37 = objc_msgSend(v11, sel_meterUnitWithMetricPrefix_, 5);
        v38 = sub_1D77F4CE0();

        if ((v38 & 1) != 0)
        {
          v39 = sub_1D77F0BCC();
          objc_msgSend(a2, sel_doubleValueForUnit_, v12);
          v16 = objc_msgSend(v39, sel_stringFromValue_unit_, 9);

          goto LABEL_18;
        }
        goto LABEL_21;
      }
      objc_msgSend(a2, sel_doubleValueForUnit_, v12);
      v15 = (id)HKFormattedFeetAndInches();
      if (v15)
      {
        v16 = v15;
LABEL_18:
        v40 = sub_1D77F4AE8();

        return v40;
      }
    }
    else
    {
      v30 = objc_msgSend(v10, sel_hk_valueFormatterForUnit_, v6);
      objc_msgSend(a2, sel_doubleValueForUnit_, v6);
      v31 = (void *)sub_1D77F4B78();
      v32 = objc_msgSend(v30, sel_stringFromValue_displayType_unitController_, v31, v10, *(_QWORD *)(v3 + 24));

      if (v32)
      {
        v33 = sub_1D77F4AE8();

        return v33;
      }
      __break(1u);
    }
    __break(1u);
LABEL_21:
    result = sub_1D77F4DA0();
    __break(1u);
    return result;
  }
  if (qword_1F012ECA0 != -1)
    swift_once();
  v17 = sub_1D77F486C();
  __swift_project_value_buffer(v17, (uint64_t)qword_1F0130540);
  v18 = v8;
  v19 = sub_1D77F4854();
  v20 = sub_1D77F4BC0();
  if (os_log_type_enabled(v19, v20))
  {
    type = v20;
    v21 = swift_slowAlloc();
    v42 = swift_slowAlloc();
    v44 = v42;
    *(_DWORD *)v21 = 136446722;
    v22 = sub_1D77F4E78();
    sub_1D77C3A1C(v22, v23, &v44);
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    v43 = a2;
    *(_WORD *)(v21 + 12) = 2082;
    sub_1D77C3A1C(0xD00000000000001DLL, 0x80000001D77FA910, &v44);
    sub_1D77F4D04();
    *(_WORD *)(v21 + 22) = 2082;
    v24 = objc_msgSend(v18, sel_identifier);
    v25 = sub_1D77F4AE8();
    v26 = v6;
    v28 = v27;

    v29 = v25;
    a2 = v43;
    sub_1D77C3A1C(v29, v28, &v44);
    sub_1D77F4D04();

    v6 = v26;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D77C0000, v19, type, "[%{public}s.%{public}s]: Unable to determine display type for type %{public}s", (uint8_t *)v21, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v42, -1, -1);
    MEMORY[0x1D829C8C8](v21, -1, -1);

  }
  else
  {

  }
  LOBYTE(v44) = v5;
  sub_1D77F0914(a2);
  v36 = v35;

  return v36;
}

id *ConfirmDetailsValueFormatterImpl.deinit()
{
  id *v0;

  return v0;
}

uint64_t ConfirmDetailsValueFormatterImpl.__deallocating_deinit()
{
  id *v0;

  return swift_deallocClassInstance();
}

id sub_1D77F168C(unsigned __int8 *a1)
{
  return sub_1D77F0D20(a1);
}

uint64_t sub_1D77F16AC(_BYTE *a1, void *a2)
{
  return sub_1D77F10C4(a1, a2);
}

unint64_t sub_1D77F16D0()
{
  unint64_t result;

  result = qword_1F0130558;
  if (!qword_1F0130558)
  {
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for ConfirmDetailsValueFormatterImpl.ValueType, &type metadata for ConfirmDetailsValueFormatterImpl.ValueType);
    atomic_store(result, (unint64_t *)&qword_1F0130558);
  }
  return result;
}

uint64_t dispatch thunk of ConfirmDetailsValueFormatter.preferredUnit(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ConfirmDetailsValueFormatter.formattedValue(for:quantity:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t type metadata accessor for ConfirmDetailsValueFormatterImpl()
{
  return objc_opt_self();
}

uint64_t method lookup function for ConfirmDetailsValueFormatterImpl()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ConfirmDetailsValueFormatterImpl.__allocating_init(healthStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of ConfirmDetailsValueFormatterImpl.preferredUnit(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of ConfirmDetailsValueFormatterImpl.formattedValue(for:quantity:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t storeEnumTagSinglePayload for ConfirmDetailsValueFormatterImpl.ValueType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1D77F17BC + 4 * byte_1D77F7A45[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1D77F17F0 + 4 * byte_1D77F7A40[v4]))();
}

uint64_t sub_1D77F17F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77F17F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1D77F1800);
  return result;
}

uint64_t sub_1D77F180C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1D77F1814);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1D77F1818(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1D77F1820(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ConfirmDetailsValueFormatterImpl.ValueType()
{
  return &type metadata for ConfirmDetailsValueFormatterImpl.ValueType;
}

uint64_t sub_1D77F183C(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v14 = MEMORY[0x1E0DEE9D8];
    sub_1D77E70E4(0, v1, 0);
    v2 = v14;
    v4 = (uint64_t *)(a1 + 32);
    do
    {
      v6 = *v4++;
      v5 = v6;
      v14 = v2;
      v8 = *(_QWORD *)(v2 + 16);
      v7 = *(_QWORD *)(v2 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_1D77E70E4(v7 > 1, v8 + 1, 1);
        v2 = v14;
      }
      type metadata accessor for HKAppleWalkingSteadinessClassification(0);
      v12 = v9;
      v13 = sub_1D77C31B8(&qword_1F01306B0, (uint64_t (*)(uint64_t))type metadata accessor for HKAppleWalkingSteadinessClassification, (uint64_t)&protocol conformance descriptor for HKAppleWalkingSteadinessClassification);
      *(_QWORD *)&v11 = v5;
      *(_QWORD *)(v2 + 16) = v8 + 1;
      sub_1D77C35F4(&v11, v2 + 40 * v8 + 32);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1D77F194C(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  char *v4;
  char v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v9;
  ValueMetadata *v10;
  unint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v12 = MEMORY[0x1E0DEE9D8];
    sub_1D77E70E4(0, v1, 0);
    v2 = v12;
    v4 = (char *)(a1 + 32);
    do
    {
      v5 = *v4;
      v12 = v2;
      v7 = *(_QWORD *)(v2 + 16);
      v6 = *(_QWORD *)(v2 + 24);
      if (v7 >= v6 >> 1)
      {
        sub_1D77E70E4(v6 > 1, v7 + 1, 1);
        v2 = v12;
      }
      v10 = &type metadata for WalkingSteadinessOnboardingAboutHealthDetailsItem;
      v11 = sub_1D77F1DBC();
      LOBYTE(v9) = v5;
      *(_QWORD *)(v2 + 16) = v7 + 1;
      sub_1D77C35F4(&v9, v2 + 40 * v7 + 32);
      ++v4;
      --v1;
    }
    while (v1);
  }
  return v2;
}

unint64_t HKAppleWalkingSteadinessClassification.reuseIdentifier.getter()
{
  return 0xD00000000000001ALL;
}

unint64_t HKAppleWalkingSteadinessClassification.uniqueIdentifier.getter()
{
  sub_1D77F4D4C();
  swift_bridgeObjectRelease();
  sub_1D77F4DE8();
  sub_1D77F4B24();
  swift_bridgeObjectRelease();
  return 0xD000000000000027;
}

uint64_t HKAppleWalkingSteadinessClassification.selectionStyle.getter()
{
  return 0;
}

unint64_t sub_1D77F1AE8()
{
  return 0xD00000000000001ALL;
}

unint64_t sub_1D77F1B04()
{
  return HKAppleWalkingSteadinessClassification.uniqueIdentifier.getter();
}

uint64_t type metadata accessor for WalkingSteadinessLevelsDataSource()
{
  uint64_t result;

  result = qword_1F0130658;
  if (!qword_1F0130658)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D77F1B48()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1D77F1B84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void (*v4)(char *, uint64_t);
  _QWORD v6[2];

  v0 = sub_1D77F4500();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77DC4A8();
  sub_1D77F46C8();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1D77F64E0;
  sub_1D77F183C((uint64_t)&unk_1E9C30E40);
  sub_1D77F44F4();
  sub_1D77F44E8();
  v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_1D77F46BC();
  v6[0] = 0x3C53447961727241;
  v6[1] = 0xE800000000000000;
  sub_1D77F44F4();
  sub_1D77F44E8();
  v4(v3, v0);
  sub_1D77F4B24();
  swift_bridgeObjectRelease();
  sub_1D77F4B24();
  return sub_1D77F46A4();
}

void sub_1D77F1D08()
{
  sub_1D77F1D38();
}

void sub_1D77F1D20()
{
  sub_1D77F1D38();
}

void sub_1D77F1D38()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1D77F1D60()
{
  return type metadata accessor for WalkingSteadinessLevelsDataSource();
}

uint64_t sub_1D77F1D68()
{
  type metadata accessor for WalkingSteadinessLevelCell();
  sub_1D77C31B8(&qword_1F01306A8, (uint64_t (*)(uint64_t))type metadata accessor for WalkingSteadinessLevelCell, (uint64_t)&unk_1D77F7C5C);
  return sub_1D77F4B90();
}

unint64_t sub_1D77F1DBC()
{
  unint64_t result;

  result = qword_1F01306B8;
  if (!qword_1F01306B8)
  {
    result = MEMORY[0x1D829C838](&protocol conformance descriptor for WalkingSteadinessOnboardingAboutHealthDetailsItem, &type metadata for WalkingSteadinessOnboardingAboutHealthDetailsItem);
    atomic_store(result, (unint64_t *)&qword_1F01306B8);
  }
  return result;
}

id sub_1D77F1E00(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  objc_super v8;

  v5 = (void *)sub_1D77F4ADC();
  v8.receiver = a1;
  v8.super_class = (Class)type metadata accessor for WalkingSteadinessLevelCell();
  v6 = objc_msgSendSuper2(&v8, sel_initWithStyle_reuseIdentifier_, a3, v5);

  return v6;
}

id sub_1D77F1E80(id result, char a2)
{
  char *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  if ((a2 & 1) == 0)
  {
    v3 = result;
    v4 = *(void **)&v2[OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_title];
    v5 = (void *)objc_opt_self();
    v6 = objc_msgSend(v5, sel_localizedTitleForClassification_, v3);
    objc_msgSend(v4, sel_setText_, v6);

    v7 = *(void **)&v2[OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_detail];
    v8 = objc_msgSend(v5, sel_localizedDescriptionForClassification_, v3);
    objc_msgSend(v7, sel_setText_, v8);

    return objc_msgSend(v2, sel_setSelectionStyle_, 0);
  }
  return result;
}

id sub_1D77F1F6C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessLevelCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WalkingSteadinessLevelCell()
{
  uint64_t result;

  result = qword_1F01306E8;
  if (!qword_1F01306E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D77F1FE0()
{
  return swift_initClassMetadata2();
}

id sub_1D77F2014(uint64_t a1)
{
  return sub_1D77F1E80(*(id *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_1D77F2024()
{
  return type metadata accessor for WalkingSteadinessLevelCell();
}

unint64_t sub_1D77F202C()
{
  return 0xD00000000000001ALL;
}

id sub_1D77F2048(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  objc_super v8;

  v5 = (void *)sub_1D77F4ADC();
  v8.receiver = a1;
  v8.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsCell();
  v6 = objc_msgSendSuper2(&v8, sel_initWithStyle_reuseIdentifier_, a3, v5);

  return v6;
}

_BYTE *sub_1D77F20C8(_BYTE *result)
{
  char *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (*result != 2)
  {
    v2 = *(void **)&v1[OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_title];
    sub_1D77DCB68();
    v3 = (void *)sub_1D77F4ADC();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setText_, v3);

    v4 = *(void **)&v1[OBJC_IVAR____TtC16HealthMobilityUI12BaseInfoCell_detail];
    sub_1D77DCC9C();
    v5 = (void *)sub_1D77F4ADC();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setText_, v5);

    return objc_msgSend(v1, sel_setSelectionStyle_, 0);
  }
  return result;
}

id sub_1D77F21C0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsCell()
{
  uint64_t result;

  result = qword_1F01307F0;
  if (!qword_1F01307F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1D77F2234()
{
  return type metadata accessor for WalkingSteadinessOnboardingAboutHealthDetailsCell();
}

unint64_t sub_1D77F223C()
{
  return 0xD000000000000031;
}

uint64_t sub_1D77F2258()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_1D77F486C();
  __swift_allocate_value_buffer(v0, qword_1F01308D0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1F01308D0);
  if (qword_1F012EBF0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1F012F6F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

id sub_1D77F22E8(uint64_t a1)
{
  return sub_1D77F2310(a1, (SEL *)&selRef_tertiaryLabelColor, &qword_1F0133168);
}

id sub_1D77F22FC(uint64_t a1)
{
  return sub_1D77F2310(a1, (SEL *)&selRef_systemBlueColor, &qword_1F0133170);
}

id sub_1D77F2310(uint64_t a1, SEL *a2, _QWORD *a3)
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), *a2);
  *a3 = result;
  return result;
}

id sub_1D77F2350()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage);
  swift_beginAccess();
  return *v1;
}

void sub_1D77F2394(void *a1)
{
  sub_1D77F2490(a1, &OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage);
}

uint64_t (*sub_1D77F23A0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_1D77F23E4(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v5;
  void **v6;
  void *v7;
  id v8;

  v5 = *a1;
  v6 = (void **)(*a2 + *a5);
  swift_beginAccess();
  v7 = *v6;
  *v6 = v5;
  v8 = v5;

}

id sub_1D77F2440()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor);
  swift_beginAccess();
  return *v1;
}

void sub_1D77F2484(void *a1)
{
  sub_1D77F2490(a1, &OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor);
}

void sub_1D77F2490(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;

  v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;

}

uint64_t (*sub_1D77F24DC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1D77F2520(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _BYTE v5[40];

  sub_1D77CB068(a1, (uint64_t)v5);
  v3 = *a2 + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item;
  swift_beginAccess();
  sub_1D77CB148((uint64_t)v5, v3);
  swift_endAccess();
  sub_1D77F2590();
  return sub_1D77E2C2C((uint64_t)v5);
}

void sub_1D77F2590()
{
  char *v0;
  char *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void **v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  void **v27;
  void *v28;
  void **v29;
  void *v30;
  id v31;
  uint64_t v32;
  char v33;
  _QWORD v34[5];

  v1 = v0;
  swift_getObjectType();
  v2 = (uint64_t)&v0[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item];
  swift_beginAccess();
  sub_1D77CB068(v2, (uint64_t)v34);
  if (v34[3])
  {
    sub_1D77DDC98(0, (unint64_t *)&qword_1F012F0E8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v3 = objc_msgSend(v1, sel_textLabel);
      if (v3)
      {
        v4 = v3;
        v5 = (void *)sub_1D77F4ADC();
        objc_msgSend(v4, sel_setText_, v5);

      }
      v6 = objc_msgSend(v1, sel_detailTextLabel);
      if (v6)
      {
        v7 = v6;
        v8 = (void *)sub_1D77F4ADC();
        objc_msgSend(v7, sel_setText_, v8);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        if ((v33 & 1) != 0)
        {
LABEL_7:
          sub_1D77F34D8();
          v9 = (id)*MEMORY[0x1E0DC4A88];
          v10 = sub_1D77F4CD4();

          if (v10)
          {
            v11 = (void **)&v1[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage];
            swift_beginAccess();
            v12 = *v11;
            *v11 = (void *)v10;

            if (qword_1F012ECD0 != -1)
              swift_once();
            v13 = (void *)qword_1F0133170;
LABEL_22:
            v29 = (void **)&v1[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor];
            swift_beginAccess();
            v30 = *v29;
            *v29 = v13;
            v31 = v13;

            sub_1D77F2C40();
            return;
          }
          __break(1u);
LABEL_24:
          __break(1u);
          return;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v33)
          goto LABEL_7;
      }
      sub_1D77F34D8();
      v25 = (id)*MEMORY[0x1E0DC4A88];
      v26 = sub_1D77F4CD4();

      if (v26)
      {
        v27 = (void **)&v1[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage];
        swift_beginAccess();
        v28 = *v27;
        *v27 = (void *)v26;

        if (qword_1F012ECC8 != -1)
          swift_once();
        v13 = (void *)qword_1F0133168;
        goto LABEL_22;
      }
      goto LABEL_24;
    }
  }
  else
  {
    sub_1D77E2C2C((uint64_t)v34);
  }
  if (qword_1F012ECC0 != -1)
    swift_once();
  v14 = sub_1D77F486C();
  __swift_project_value_buffer(v14, (uint64_t)qword_1F01308D0);
  v15 = v1;
  v16 = sub_1D77F4854();
  v17 = sub_1D77F4BB4();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v19 = swift_slowAlloc();
    v32 = v19;
    *(_DWORD *)v18 = 136446722;
    v20 = sub_1D77F4E78();
    v34[0] = sub_1D77C3A1C(v20, v21, &v32);
    sub_1D77F4D04();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2082;
    v34[0] = sub_1D77C3A1C(1835365481, 0xE400000000000000, &v32);
    sub_1D77F4D04();
    *(_WORD *)(v18 + 22) = 2082;
    sub_1D77E2B84();
    v34[0] = v22;
    sub_1D77CB744();
    v23 = sub_1D77F4B00();
    v34[0] = sub_1D77C3A1C(v23, v24, &v32);
    sub_1D77F4D04();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D77C0000, v16, v17, "[%{public}s.%{public}s]: Attempted to set item (%{public}s) that was not MultiselectItem", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1D829C8C8](v19, -1, -1);
    MEMORY[0x1D829C8C8](v18, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_1D77F2AB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item;
  swift_beginAccess();
  return sub_1D77CB068(v3, a1);
}

uint64_t sub_1D77F2B00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item;
  swift_beginAccess();
  sub_1D77CB148(a1, v3);
  swift_endAccess();
  sub_1D77F2590();
  return sub_1D77E2C2C(a1);
}

void (*sub_1D77F2B6C(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1D77F2BB4;
}

void sub_1D77F2BB4(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_1D77F2590();
}

void sub_1D77F2C40()
{
  char *v0;
  char *v1;
  void *v2;
  id v3;
  id v4;
  double v5;
  id v6;
  id *v7;
  id v8;
  id v9;
  char *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v1 = v0;
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_preferredFontForTextStyle_, *MEMORY[0x1E0DC4A88]);
  v4 = objc_msgSend(v2, sel_preferredFontForTextStyle_, *MEMORY[0x1E0DC4B10]);
  objc_msgSend(v3, sel_pointSize);
  v6 = objc_msgSend((id)objc_opt_self(), sel_configurationWithPointSize_weight_scale_, 4, 3, v5);
  v7 = (id *)&v1[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage];
  swift_beginAccess();
  v8 = objc_msgSend(*v7, sel_imageWithConfiguration_, v6);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithImage_, v8);
  v10 = &v1[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor];
  swift_beginAccess();
  objc_msgSend(v9, sel_setTintColor_, *(_QWORD *)v10);
  objc_msgSend(v1, sel_setAccessoryView_, v9);
  v11 = objc_msgSend(v1, sel_textLabel);
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, sel_setFont_, v3);

  }
  v13 = objc_msgSend(v1, sel_detailTextLabel);
  if (v13)
  {
    v14 = v13;
    v15 = v4;
    objc_msgSend(v14, sel_setFont_, v15);

    v6 = v15;
  }

}

id MultiselectTableViewCell.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MultiselectTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MultiselectTableViewCell()
{
  return objc_opt_self();
}

id sub_1D77F2EEC@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage, a2);
}

void sub_1D77F2EF8(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1D77F23E4(a1, a2, a3, a4, &OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage);
}

id sub_1D77F2F14@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor, a2);
}

id keypath_getTm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, void **a3@<X8>)
{
  void **v4;
  void *v5;

  v4 = (void **)(*a1 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *a3 = *v4;
  return v5;
}

void sub_1D77F2F6C(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_1D77F23E4(a1, a2, a3, a4, &OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor);
}

uint64_t sub_1D77F2F88@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item;
  swift_beginAccess();
  return sub_1D77CB068(v3, a2);
}

uint64_t method lookup function for MultiselectTableViewCell()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MultiselectTableViewCell.accessoryImage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.accessoryImage.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.accessoryImage.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.tintAccessoryColor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.tintAccessoryColor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.tintAccessoryColor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.item.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.item.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.item.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of MultiselectTableViewCell.updateSymbols()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

void sub_1D77F3104()
{
  sub_1D77F2C40();
}

void sub_1D77F3124(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  objc_super v28;

  swift_getObjectType();
  sub_1D77F34D8();
  v4 = (void *)*MEMORY[0x1E0DC4A88];
  v5 = v2;
  v6 = v4;
  v7 = sub_1D77F4CD4();

  if (v7)
  {
    *(_QWORD *)&v5[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage] = v7;
    v8 = OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor;
    if (qword_1F012ECC8 != -1)
      swift_once();
    v9 = (void *)qword_1F0133168;
    *(_QWORD *)&v5[v8] = qword_1F0133168;
    v10 = &v5[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item];
    *(_OWORD *)v10 = 0u;
    *((_OWORD *)v10 + 1) = 0u;
    *((_QWORD *)v10 + 4) = 0;
    v11 = v9;

    if (a2)
    {
      v12 = (void *)sub_1D77F4ADC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v12 = 0;
    }
    v28.receiver = v5;
    v28.super_class = (Class)type metadata accessor for MultiselectTableViewCell();
    v13 = objc_msgSendSuper2(&v28, sel_initWithStyle_reuseIdentifier_, 3, v12);

    v14 = v13;
    v15 = objc_msgSend(v14, sel_textLabel);
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v15, sel_setNumberOfLines_, 0);

    }
    v17 = objc_msgSend(v14, sel_detailTextLabel);
    if (v17)
    {
      v18 = v17;
      v19 = objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
      objc_msgSend(v18, sel_setTextColor_, v19);

    }
    v20 = objc_msgSend(v14, sel_detailTextLabel);
    if (v20)
    {
      v21 = v20;
      objc_msgSend(v20, sel_setNumberOfLines_, 0);

    }
    sub_1D77EF120();
    v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_1D77F5EA0;
    v23 = sub_1D77F4944();
    v24 = MEMORY[0x1E0DC29B0];
    *(_QWORD *)(v22 + 32) = v23;
    *(_QWORD *)(v22 + 40) = v24;
    v25 = sub_1D77F4878();
    v26 = MEMORY[0x1E0DC1F90];
    *(_QWORD *)(v22 + 48) = v25;
    *(_QWORD *)(v22 + 56) = v26;
    v27 = v14;
    sub_1D77F4CC8();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();

  }
  else
  {
    __break(1u);
  }
}

void sub_1D77F33C4()
{
  char *v0;
  char *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char *v6;
  id v7;

  v1 = v0;
  sub_1D77F34D8();
  v2 = (id)*MEMORY[0x1E0DC4A88];
  v3 = sub_1D77F4CD4();

  if (!v3)
    __break(1u);
  *(_QWORD *)&v1[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_accessoryImage] = v3;
  v4 = OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_tintAccessoryColor;
  if (qword_1F012ECC8 != -1)
    swift_once();
  v5 = (void *)qword_1F0133168;
  *(_QWORD *)&v1[v4] = qword_1F0133168;
  v6 = &v1[OBJC_IVAR____TtC16HealthMobilityUI24MultiselectTableViewCell_item];
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  v7 = v5;

  sub_1D77F4DA0();
  __break(1u);
}

unint64_t sub_1D77F34D8()
{
  unint64_t result;

  result = qword_1F0130928;
  if (!qword_1F0130928)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F0130928);
  }
  return result;
}

id sub_1D77F3514(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  sub_1D77F3974(a1, a2, 1954047310, 0xE400000000000000);
  v4 = v3;
  if (qword_1F012EBC0 != -1)
    swift_once();
  v5 = (id)qword_1F012F660;
  swift_bridgeObjectRetain();
  sub_1D77F43F8();
  swift_bridgeObjectRelease();

  v6 = (void *)sub_1D77F4ADC();
  swift_bridgeObjectRelease();
  if (v4)
  {
    v7 = (void *)sub_1D77F4ADC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(v2, sel_addPrimaryFooterButtonWithTitle_automationIdentifier_, v6, v7, 0xE000000000000000);

  return v8;
}

id sub_1D77F3670(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1D77F3A64(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))sub_1D77F3514);
}

id sub_1D77F367C(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_1D77F37D4(a1, a2, a3, a4, 0x1E0D65140, (SEL *)&selRef_boldButton, &selRef_primaryFooterButtonTapped);
}

id sub_1D77F369C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, SEL *a6, _QWORD *a7)
{
  void *v7;
  id v10;
  id v11;
  void *v12;
  id v13;

  v10 = objc_msgSend((id)objc_opt_self(), *a6);
  v11 = v10;
  if (a4)
    a4 = (void *)sub_1D77F4ADC();
  objc_msgSend(v10, sel_setAccessibilityIdentifier_, a4);

  objc_msgSend(v10, sel_addTarget_action_forControlEvents_, v7, *a7, 64);
  v12 = (void *)sub_1D77F4ADC();
  objc_msgSend(v10, sel_setTitle_forState_, v12, 0);

  v13 = objc_msgSend(v7, sel_buttonTray);
  objc_msgSend(v13, sel_addButton_, v10);

  return v10;
}

id sub_1D77F37B8(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_1D77F37D4(a1, a2, a3, a4, 0x1E0D65170, (SEL *)&selRef_linkButton, &selRef_secondaryFooterButtonTapped);
}

id sub_1D77F37D4(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, SEL *a6, _QWORD *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;

  v12 = sub_1D77F4AE8();
  v14 = v13;
  if (a4)
  {
    v15 = sub_1D77F4AE8();
    a4 = v16;
  }
  else
  {
    v15 = 0;
  }
  v17 = a1;
  v18 = sub_1D77F369C(v12, v14, v15, a4, a5, a6, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v18;
}

id sub_1D77F388C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  sub_1D77F3974(a1, a2, 0x6C65636E6143, 0xE600000000000000);
  v4 = v3;
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_cancelButtonTapped);
  v6 = v5;
  if (v4)
  {
    v7 = (void *)sub_1D77F4ADC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, sel_setAccessibilityIdentifier_, v7);

  v8 = objc_msgSend(v2, sel_navigationItem);
  objc_msgSend(v8, sel_setRightBarButtonItem_, v5);

  return v5;
}

uint64_t sub_1D77F3974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  void *v9;
  id v10;

  if (a2)
  {
    sub_1D77CB3E0();
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1D77F67A0;
    *(_QWORD *)(v8 + 32) = a1;
    *(_QWORD *)(v8 + 40) = a2;
    *(_QWORD *)(v8 + 48) = a3;
    *(_QWORD *)(v8 + 56) = a4;
    *(_QWORD *)(v8 + 64) = 0x6E6F74747542;
    *(_QWORD *)(v8 + 72) = 0xE600000000000000;
    swift_bridgeObjectRetain();
    v9 = (void *)sub_1D77F4B48();
    swift_bridgeObjectRelease();
    v10 = (id)HKUIJoinStringsForAutomationIdentifier();

    if (v10)
    {
      a1 = sub_1D77F4AE8();

    }
    else
    {
      return 0;
    }
  }
  return a1;
}

id sub_1D77F3A58(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1D77F3A64(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))sub_1D77F388C);
}

id sub_1D77F3A64(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  if (a3)
  {
    v6 = sub_1D77F4AE8();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a1;
  v10 = (void *)a4(v6, v8);

  swift_bridgeObjectRelease();
  return v10;
}

id sub_1D77F3AD8()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;

  v1 = objc_msgSend((id)objc_opt_self(), sel_buttonWithType_, 1);
  v2 = (void *)sub_1D77F4ADC();
  objc_msgSend(v1, sel_setTitle_forState_, v2, 0);

  objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v0, sel_contentViewButtonTapped, 64);
  v3 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v3, sel_addSubview_, v1);

  v4 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v1, sel_hk_alignConstraintsWithView_, v4);

  return v1;
}

id sub_1D77F3BD8(void *a1)
{
  id v2;
  id v3;

  sub_1D77F4AE8();
  v2 = a1;
  v3 = sub_1D77F3AD8();

  swift_bridgeObjectRelease();
  return v3;
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerDelegate.onboardingViewControllerDidTapPrimaryButton(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerDelegate.onboardingViewControllerDidTapSecondaryButton(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerDelegate.onboardingViewControllerDidTapCancelButton(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerProtocol.stage.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerProtocol.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of WalkingSteadinessOnboardingViewControllerProtocol.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

unint64_t static WalkingSteadinessSettingsManager.Constants.suiteName.getter()
{
  return 0xD00000000000002BLL;
}

unint64_t static WalkingSteadinessSettingsManager.Constants.onboardingTileDismissedDateKey.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_1D77F3CA8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  sub_1D77F3FAC();
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77F4000(a1, (uint64_t)v5);
  return sub_1D77F3E18((uint64_t)v5);
}

uint64_t sub_1D77F3D20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  v3 = *(void **)(v1 + 16);
  v4 = (void *)sub_1D77F4ADC();
  v5 = objc_msgSend(v3, sel_hk_keyExists_, v4);

  if (v5)
  {
    v6 = (void *)sub_1D77F4ADC();
    objc_msgSend(v3, sel_doubleForKey_, v6);

    sub_1D77F4494();
    v7 = sub_1D77F44DC();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a1;
    v10 = 0;
  }
  else
  {
    v7 = sub_1D77F44DC();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a1;
    v10 = 1;
  }
  return v8(v9, v10, 1, v7);
}

uint64_t sub_1D77F3E18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v2 = v1;
  sub_1D77F3FAC();
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1D77F44DC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77F4000(a1, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1D77F4044((uint64_t)v7);
    v13 = *(void **)(v2 + 16);
    v14 = (void *)sub_1D77F4ADC();
    objc_msgSend(v13, sel_removeObjectForKey_, v14);

    return sub_1D77F4044(a1);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v7, v8);
    sub_1D77F44A0();
    v17 = v16;
    v18 = *(void **)(v2 + 16);
    v19 = (void *)sub_1D77F4ADC();
    objc_msgSend(v18, sel_setDouble_forKey_, v19, v17);

    sub_1D77F4044(a1);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
}

void sub_1D77F3FAC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F012F938)
  {
    sub_1D77F44DC();
    v0 = sub_1D77F4CF8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F012F938);
  }
}

uint64_t sub_1D77F4000(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1D77F3FAC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D77F4044(uint64_t a1)
{
  uint64_t v2;

  sub_1D77F3FAC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void (*sub_1D77F4080(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  size_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = v1;
  sub_1D77F3FAC();
  v4 = *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64);
  a1[1] = malloc(v4);
  v5 = malloc(v4);
  a1[2] = v5;
  v6 = *(void **)(v1 + 16);
  v7 = (void *)sub_1D77F4ADC();
  v8 = objc_msgSend(v6, sel_hk_keyExists_, v7);

  if (v8)
  {
    v9 = (void *)sub_1D77F4ADC();
    objc_msgSend(v6, sel_doubleForKey_, v9);

    sub_1D77F4494();
    v10 = sub_1D77F44DC();
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 0, 1, v10);
  }
  else
  {
    v11 = sub_1D77F44DC();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v5, 1, 1, v11);
  }
  return sub_1D77F41B8;
}

void sub_1D77F41B8(uint64_t a1, char a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 8);
  v3 = *(void **)(a1 + 16);
  if ((a2 & 1) != 0)
  {
    sub_1D77F4000((uint64_t)v3, (uint64_t)v2);
    sub_1D77F3E18((uint64_t)v2);
    sub_1D77F4044((uint64_t)v3);
  }
  else
  {
    sub_1D77F3E18((uint64_t)v3);
  }
  free(v3);
  free(v2);
}

void WalkingSteadinessSettingsManager.__allocating_init()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x1E0C99EA0]);
  v1 = (void *)sub_1D77F4ADC();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    type metadata accessor for WalkingSteadinessSettingsManager();
    *(_QWORD *)(swift_allocObject() + 16) = v2;
  }
  else
  {
    __break(1u);
  }
}

uint64_t WalkingSteadinessSettingsManager.__allocating_init(userDefaults:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t type metadata accessor for WalkingSteadinessSettingsManager()
{
  return objc_opt_self();
}

uint64_t WalkingSteadinessSettingsManager.init(userDefaults:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t WalkingSteadinessSettingsManager.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t WalkingSteadinessSettingsManager.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_1D77F4330@<X0>(uint64_t a1@<X8>)
{
  return sub_1D77F3D20(a1);
}

uint64_t method lookup function for WalkingSteadinessSettingsManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WalkingSteadinessSettingsManager.onboardingTileDismissedDate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of WalkingSteadinessSettingsManager.onboardingTileDismissedDate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of WalkingSteadinessSettingsManager.onboardingTileDismissedDate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of WalkingSteadinessSettingsManager.__allocating_init(userDefaults:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

ValueMetadata *type metadata accessor for WalkingSteadinessSettingsManager.Constants()
{
  return &type metadata for WalkingSteadinessSettingsManager.Constants;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_1D77F43BC()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1D77F43C8()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1D77F43D4()
{
  return MEMORY[0x1E0CAE9A0]();
}

uint64_t sub_1D77F43E0()
{
  return MEMORY[0x1E0CAE9B8]();
}

uint64_t sub_1D77F43EC()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1D77F43F8()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1D77F4404()
{
  return MEMORY[0x1E0CAF8D8]();
}

uint64_t sub_1D77F4410()
{
  return MEMORY[0x1E0CAF8E8]();
}

uint64_t sub_1D77F441C()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t sub_1D77F4428()
{
  return MEMORY[0x1E0CAF900]();
}

uint64_t sub_1D77F4434()
{
  return MEMORY[0x1E0CAF920]();
}

uint64_t sub_1D77F4440()
{
  return MEMORY[0x1E0CAF930]();
}

uint64_t sub_1D77F444C()
{
  return MEMORY[0x1E0CAF940]();
}

uint64_t sub_1D77F4458()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1D77F4464()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1D77F4470()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1D77F447C()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1D77F4488()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1D77F4494()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_1D77F44A0()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1D77F44AC()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1D77F44B8()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1D77F44C4()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1D77F44D0()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1D77F44DC()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1D77F44E8()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1D77F44F4()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1D77F4500()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1D77F450C()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1D77F4518()
{
  return MEMORY[0x1E0CB0F00]();
}

uint64_t sub_1D77F4524()
{
  return MEMORY[0x1E0CB0F20]();
}

uint64_t sub_1D77F4530()
{
  return MEMORY[0x1E0CB1028]();
}

uint64_t sub_1D77F453C()
{
  return MEMORY[0x1E0CB1060]();
}

uint64_t sub_1D77F4548()
{
  return MEMORY[0x1E0CB1070]();
}

uint64_t sub_1D77F4554()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1D77F4560()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1D77F456C()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1D77F4578()
{
  return MEMORY[0x1E0DC1A20]();
}

uint64_t sub_1D77F4584()
{
  return MEMORY[0x1E0DC1A28]();
}

uint64_t sub_1D77F4590()
{
  return MEMORY[0x1E0DC1A30]();
}

uint64_t sub_1D77F459C()
{
  return MEMORY[0x1E0DC1A58]();
}

uint64_t sub_1D77F45A8()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1D77F45B4()
{
  return MEMORY[0x1E0D2D4A0]();
}

uint64_t sub_1D77F45C0()
{
  return MEMORY[0x1E0D2D4A8]();
}

uint64_t sub_1D77F45CC()
{
  return MEMORY[0x1E0D2E150]();
}

uint64_t sub_1D77F45D8()
{
  return MEMORY[0x1E0D2E1F8]();
}

uint64_t sub_1D77F45E4()
{
  return MEMORY[0x1E0D2E258]();
}

uint64_t sub_1D77F45F0()
{
  return MEMORY[0x1E0D299E8]();
}

uint64_t sub_1D77F45FC()
{
  return MEMORY[0x1E0D299F0]();
}

uint64_t sub_1D77F4608()
{
  return MEMORY[0x1E0D299F8]();
}

uint64_t sub_1D77F4614()
{
  return MEMORY[0x1E0D29C08]();
}

uint64_t sub_1D77F4620()
{
  return MEMORY[0x1E0D29C10]();
}

uint64_t sub_1D77F462C()
{
  return MEMORY[0x1E0D29D68]();
}

uint64_t sub_1D77F4638()
{
  return MEMORY[0x1E0D29DA0]();
}

uint64_t sub_1D77F4644()
{
  return MEMORY[0x1E0D2A080]();
}

uint64_t sub_1D77F4650()
{
  return MEMORY[0x1E0D2A090]();
}

uint64_t sub_1D77F465C()
{
  return MEMORY[0x1E0D2A4E8]();
}

uint64_t sub_1D77F4668()
{
  return MEMORY[0x1E0D2A550]();
}

uint64_t sub_1D77F4674()
{
  return MEMORY[0x1E0D2A560]();
}

uint64_t sub_1D77F4680()
{
  return MEMORY[0x1E0D2A570]();
}

uint64_t sub_1D77F468C()
{
  return MEMORY[0x1E0D2A868]();
}

uint64_t sub_1D77F4698()
{
  return MEMORY[0x1E0D2AA08]();
}

uint64_t sub_1D77F46A4()
{
  return MEMORY[0x1E0D2AAF0]();
}

uint64_t sub_1D77F46B0()
{
  return MEMORY[0x1E0D2AB10]();
}

uint64_t sub_1D77F46BC()
{
  return MEMORY[0x1E0D2B080]();
}

uint64_t sub_1D77F46C8()
{
  return MEMORY[0x1E0D2B090]();
}

uint64_t sub_1D77F46D4()
{
  return MEMORY[0x1E0D2B0C8]();
}

uint64_t sub_1D77F46E0()
{
  return MEMORY[0x1E0D2B0F0]();
}

uint64_t sub_1D77F46EC()
{
  return MEMORY[0x1E0D2B118]();
}

uint64_t sub_1D77F46F8()
{
  return MEMORY[0x1E0D2B128]();
}

uint64_t sub_1D77F4704()
{
  return MEMORY[0x1E0D2B130]();
}

uint64_t sub_1D77F4710()
{
  return MEMORY[0x1E0D2B160]();
}

uint64_t sub_1D77F471C()
{
  return MEMORY[0x1E0D2B5E0]();
}

uint64_t sub_1D77F4728()
{
  return MEMORY[0x1E0D2B5F8]();
}

uint64_t sub_1D77F4734()
{
  return MEMORY[0x1E0D2B818]();
}

uint64_t sub_1D77F4740()
{
  return MEMORY[0x1E0D2B820]();
}

uint64_t sub_1D77F474C()
{
  return MEMORY[0x1E0D2B840]();
}

uint64_t sub_1D77F4758()
{
  return MEMORY[0x1E0D2B948]();
}

uint64_t sub_1D77F4764()
{
  return MEMORY[0x1E0D2B958]();
}

uint64_t sub_1D77F4770()
{
  return MEMORY[0x1E0D2B960]();
}

uint64_t sub_1D77F477C()
{
  return MEMORY[0x1E0D2B968]();
}

uint64_t sub_1D77F4788()
{
  return MEMORY[0x1E0D2BD30]();
}

uint64_t sub_1D77F4794()
{
  return MEMORY[0x1E0D2BD50]();
}

uint64_t sub_1D77F47A0()
{
  return MEMORY[0x1E0D2BD60]();
}

uint64_t sub_1D77F47AC()
{
  return MEMORY[0x1E0D2BD68]();
}

uint64_t sub_1D77F47B8()
{
  return MEMORY[0x1E0D2BDA8]();
}

uint64_t sub_1D77F47C4()
{
  return MEMORY[0x1E0D2BDB0]();
}

uint64_t sub_1D77F47D0()
{
  return MEMORY[0x1E0D2BDB8]();
}

uint64_t sub_1D77F47DC()
{
  return MEMORY[0x1E0D2BDC0]();
}

uint64_t sub_1D77F47E8()
{
  return MEMORY[0x1E0D2BDC8]();
}

uint64_t sub_1D77F47F4()
{
  return MEMORY[0x1E0D2BE68]();
}

uint64_t sub_1D77F4800()
{
  return MEMORY[0x1E0D2BE70]();
}

uint64_t sub_1D77F480C()
{
  return MEMORY[0x1E0D2BE78]();
}

uint64_t sub_1D77F4818()
{
  return MEMORY[0x1E0D2BE80]();
}

uint64_t sub_1D77F4824()
{
  return MEMORY[0x1E0D2BF20]();
}

uint64_t sub_1D77F4830()
{
  return MEMORY[0x1E0D2BF30]();
}

uint64_t sub_1D77F483C()
{
  return MEMORY[0x1E0D2BF40]();
}

uint64_t sub_1D77F4848()
{
  return MEMORY[0x1E0D2E778]();
}

uint64_t sub_1D77F4854()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1D77F4860()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1D77F486C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1D77F4878()
{
  return MEMORY[0x1E0DC1F98]();
}

uint64_t sub_1D77F4884()
{
  return MEMORY[0x1E0DC2168]();
}

uint64_t sub_1D77F4890()
{
  return MEMORY[0x1E0DC2180]();
}

uint64_t sub_1D77F489C()
{
  return MEMORY[0x1E0DC2188]();
}

uint64_t sub_1D77F48A8()
{
  return MEMORY[0x1E0DC21B0]();
}

uint64_t sub_1D77F48B4()
{
  return MEMORY[0x1E0DC2208]();
}

uint64_t sub_1D77F48C0()
{
  return MEMORY[0x1E0DC2210]();
}

uint64_t sub_1D77F48CC()
{
  return MEMORY[0x1E0DC2218]();
}

uint64_t sub_1D77F48D8()
{
  return MEMORY[0x1E0DC2220]();
}

uint64_t sub_1D77F48E4()
{
  return MEMORY[0x1E0DC2238]();
}

uint64_t sub_1D77F48F0()
{
  return MEMORY[0x1E0DC2250]();
}

uint64_t sub_1D77F48FC()
{
  return MEMORY[0x1E0DC2258]();
}

uint64_t sub_1D77F4908()
{
  return MEMORY[0x1E0DC22E0]();
}

uint64_t sub_1D77F4914()
{
  return MEMORY[0x1E0DC22E8]();
}

uint64_t sub_1D77F4920()
{
  return MEMORY[0x1E0DC2358]();
}

uint64_t sub_1D77F492C()
{
  return MEMORY[0x1E0DC2360]();
}

uint64_t sub_1D77F4938()
{
  return MEMORY[0x1E0DC23A0]();
}

uint64_t sub_1D77F4944()
{
  return MEMORY[0x1E0DC29B8]();
}

uint64_t sub_1D77F4950()
{
  return MEMORY[0x1E0C95640]();
}

uint64_t sub_1D77F495C()
{
  return MEMORY[0x1E0C956F8]();
}

uint64_t sub_1D77F4968()
{
  return MEMORY[0x1E0C95770]();
}

uint64_t sub_1D77F4974()
{
  return MEMORY[0x1E0C95778]();
}

uint64_t sub_1D77F4980()
{
  return MEMORY[0x1E0C95CA8]();
}

uint64_t sub_1D77F498C()
{
  return MEMORY[0x1E0C95CE0]();
}

uint64_t sub_1D77F4998()
{
  return MEMORY[0x1E0C95D78]();
}

uint64_t sub_1D77F49A4()
{
  return MEMORY[0x1E0C95DD8]();
}

uint64_t sub_1D77F49B0()
{
  return MEMORY[0x1E0C95E00]();
}

uint64_t sub_1D77F49BC()
{
  return MEMORY[0x1E0C95F60]();
}

uint64_t sub_1D77F49C8()
{
  return MEMORY[0x1E0C95F70]();
}

uint64_t sub_1D77F49D4()
{
  return MEMORY[0x1E0C95F88]();
}

uint64_t sub_1D77F49E0()
{
  return MEMORY[0x1E0C95FA8]();
}

uint64_t sub_1D77F49EC()
{
  return MEMORY[0x1E0C96100]();
}

uint64_t sub_1D77F49F8()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t sub_1D77F4A04()
{
  return MEMORY[0x1E0C961D8]();
}

uint64_t sub_1D77F4A10()
{
  return MEMORY[0x1E0C96378]();
}

uint64_t sub_1D77F4A1C()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1D77F4A28()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1D77F4A34()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1D77F4A40()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1D77F4A4C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1D77F4A58()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1D77F4A64()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1D77F4A70()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1D77F4A7C()
{
  return MEMORY[0x1E0DEF708]();
}

uint64_t sub_1D77F4A88()
{
  return MEMORY[0x1E0DEF710]();
}

uint64_t sub_1D77F4A94()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t sub_1D77F4AA0()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1D77F4AAC()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1D77F4AB8()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1D77F4AC4()
{
  return MEMORY[0x1E0D2BFB8]();
}

uint64_t sub_1D77F4AD0()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1D77F4ADC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1D77F4AE8()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D77F4AF4()
{
  return MEMORY[0x1E0CB19A0]();
}

uint64_t sub_1D77F4B00()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1D77F4B0C()
{
  return MEMORY[0x1E0D2A608]();
}

uint64_t sub_1D77F4B18()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1D77F4B24()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1D77F4B30()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1D77F4B3C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1D77F4B48()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1D77F4B54()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1D77F4B60()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1D77F4B6C()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_1D77F4B78()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1D77F4B84()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1D77F4B90()
{
  return MEMORY[0x1E0D2BB68]();
}

uint64_t sub_1D77F4B9C()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1D77F4BA8()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1D77F4BB4()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1D77F4BC0()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1D77F4BCC()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1D77F4BD8()
{
  return MEMORY[0x1E0CB4540]();
}

uint64_t sub_1D77F4BE4()
{
  return MEMORY[0x1E0DC2B18]();
}

uint64_t sub_1D77F4BF0()
{
  return MEMORY[0x1E0DC2B20]();
}

uint64_t sub_1D77F4BFC()
{
  return MEMORY[0x1E0DC2B40]();
}

uint64_t sub_1D77F4C08()
{
  return MEMORY[0x1E0DC2BF8]();
}

uint64_t sub_1D77F4C14()
{
  return MEMORY[0x1E0D2C120]();
}

uint64_t sub_1D77F4C20()
{
  return MEMORY[0x1E0D2C128]();
}

uint64_t sub_1D77F4C2C()
{
  return MEMORY[0x1E0D2C130]();
}

uint64_t sub_1D77F4C38()
{
  return MEMORY[0x1E0D2C138]();
}

uint64_t sub_1D77F4C44()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1D77F4C50()
{
  return MEMORY[0x1E0DEF848]();
}

uint64_t sub_1D77F4C5C()
{
  return MEMORY[0x1E0DEF868]();
}

uint64_t sub_1D77F4C68()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1D77F4C74()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1D77F4C80()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1D77F4C8C()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1D77F4C98()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1D77F4CA4()
{
  return MEMORY[0x1E0D2A718]();
}

uint64_t sub_1D77F4CB0()
{
  return MEMORY[0x1E0D2C200]();
}

uint64_t sub_1D77F4CBC()
{
  return MEMORY[0x1E0D2C218]();
}

uint64_t sub_1D77F4CC8()
{
  return MEMORY[0x1E0DC2FC0]();
}

uint64_t sub_1D77F4CD4()
{
  return MEMORY[0x1E0D2BC88]();
}

uint64_t sub_1D77F4CE0()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1D77F4CEC()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_1D77F4CF8()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1D77F4D04()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1D77F4D10()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1D77F4D1C()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1D77F4D28()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1D77F4D34()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1D77F4D40()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1D77F4D4C()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1D77F4D58()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1D77F4D64()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1D77F4D70()
{
  return MEMORY[0x1E0DEC518]();
}

uint64_t sub_1D77F4D7C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1D77F4D88()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1D77F4D94()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1D77F4DA0()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1D77F4DAC()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1D77F4DB8()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1D77F4DC4()
{
  return MEMORY[0x1E0DECD58]();
}

uint64_t sub_1D77F4DD0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1D77F4DDC()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1D77F4DE8()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1D77F4DF4()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1D77F4E00()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1D77F4E0C()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_1D77F4E18()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1D77F4E24()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1D77F4E30()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1D77F4E3C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1D77F4E48()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1D77F4E54()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1D77F4E60()
{
  return MEMORY[0x1E0D2C220]();
}

uint64_t sub_1D77F4E6C()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_1D77F4E78()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t HKFormattedFeetAndInches()
{
  return MEMORY[0x1E0D2F448]();
}

uint64_t HKMobilityWalkingSteadinessDetailRoomURL()
{
  return MEMORY[0x1E0D2CE58]();
}

uint64_t HKMobilityWalkingSteadinessType()
{
  return MEMORY[0x1E0D2CE60]();
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return MEMORY[0x1E0D2F550]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1E0DEEC58]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}


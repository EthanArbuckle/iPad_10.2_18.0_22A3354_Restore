id OUTLINED_FUNCTION_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_4(id a1)
{
  return a1;
}

void sub_23DB739D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23DB745D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23DB75A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_23DB76360(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_23DB77B60(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_23DB77F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23DB78F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23DB7A5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id OUTLINED_FUNCTION_3_0(id a1)
{
  return a1;
}

id HDHealthAppNotificationManager.__allocating_init(profile:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v3 = objc_allocWithZone(v1);
  sub_23DB8C310();
  v4 = objc_allocWithZone(MEMORY[0x24BDF88B8]);
  v5 = (void *)sub_23DB8C2F8();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithBundleIdentifier_, v5);

  v7 = objc_msgSend(v3, sel_initWithProfile_userNotificationCenter_, a1, v6);
  return v7;
}

id HDHealthAppNotificationManager.init(profile:)(void *a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  id v6;

  sub_23DB8C310();
  v3 = objc_allocWithZone(MEMORY[0x24BDF88B8]);
  v4 = (void *)sub_23DB8C2F8();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_initWithBundleIdentifier_, v4);

  v6 = objc_msgSend(v1, sel_initWithProfile_userNotificationCenter_, a1, v5);
  return v6;
}

id HDHealthAppNotificationManager.__allocating_init(profile:userNotificationCenter:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;
  id v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  v5 = objc_allocWithZone(v2);
  v6 = objc_allocWithZone(MEMORY[0x24BE40C60]);
  v7 = (char *)v5;
  v8 = objc_msgSend(v6, sel_initWithProfile_, a1);
  *(_QWORD *)&v7[OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_summarySharingEntryManager] = v8;
  *(_QWORD *)&v7[OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter] = a2;
  v9 = a2;

  v12.receiver = v7;
  v12.super_class = v2;
  v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

id HDHealthAppNotificationManager.init(profile:userNotificationCenter:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  char *v6;
  id v7;
  id v8;
  id v9;
  objc_super v11;

  v5 = objc_allocWithZone(MEMORY[0x24BE40C60]);
  v6 = v2;
  v7 = objc_msgSend(v5, sel_initWithProfile_, a1);
  *(_QWORD *)&v6[OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_summarySharingEntryManager] = v7;
  *(_QWORD *)&v6[OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter] = a2;
  v8 = a2;

  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for HDHealthAppNotificationManager();
  v9 = objc_msgSendSuper2(&v11, sel_init);

  return v9;
}

uint64_t type metadata accessor for HDHealthAppNotificationManager()
{
  return objc_opt_self();
}

uint64_t sub_23DB7DB60()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t result;
  void *v11;
  id v12;
  id v13;
  id v14[2];

  v14[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = *(void **)(v0 + OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_summarySharingEntryManager);
  v14[0] = 0;
  v3 = objc_msgSend(v2, sel_fetchSharingEntriesWithError_, v14);
  v4 = v14[0];
  if (v3)
  {
    v5 = v3;
    sub_23DB7DCDC();
    v6 = sub_23DB8C370();
    v7 = v4;

    v8 = sub_23DB7E0DC(v6);
    swift_bridgeObjectRelease();
    v9 = (void *)sub_23DB7E248(v8);
    result = swift_bridgeObjectRelease();
    if (!v1)
    {
      v11 = (void *)sub_23DB8C2F8();
      v12 = objc_msgSend((id)objc_opt_self(), sel_requestWithIdentifier_content_trigger_, v11, v9, 0);

      return (uint64_t)v12;
    }
  }
  else
  {
    v13 = v14[0];
    sub_23DB8C160();

    return swift_willThrow();
  }
  return result;
}

unint64_t sub_23DB7DCDC()
{
  unint64_t result;

  result = qword_256CE8270;
  if (!qword_256CE8270)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CE8270);
  }
  return result;
}

void sub_23DB7DDA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  sub_23DB7F050(0, (unint64_t *)&qword_25431DC48, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_23DB8DC20;
  *(_QWORD *)(v5 + 32) = a1;
  *(_QWORD *)(v5 + 40) = a2;
  v6 = OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter;
  v7 = *(void **)(v2 + OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter);
  swift_bridgeObjectRetain();
  v8 = v7;
  v9 = (void *)sub_23DB8C364();
  objc_msgSend(v8, sel_removePendingNotificationRequestsWithIdentifiers_, v9);

  v10 = *(id *)(v2 + v6);
  v11 = (id)sub_23DB8C364();
  objc_msgSend(v10, sel_removeDeliveredNotificationsWithIdentifiers_, v11);
  swift_bridgeObjectRelease();

}

void sub_23DB7DEF8()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  id v5;

  v1 = OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter;
  v2 = objc_retain(*(id *)(v0
                         + OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter));
  v3 = (void *)sub_23DB8C364();
  objc_msgSend(v2, sel_removePendingNotificationRequestsWithIdentifiers_, v3);

  v4 = *(id *)(v0 + v1);
  v5 = (id)sub_23DB8C364();
  objc_msgSend(v4, sel_removeDeliveredNotificationsWithIdentifiers_, v5);

}

id HDHealthAppNotificationManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void HDHealthAppNotificationManager.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HDHealthAppNotificationManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HDHealthAppNotificationManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23DB7E0DC(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  id v5;
  void *v6;
  uint64_t v7;

  v7 = MEMORY[0x24BEE4AF8];
  if (!(a1 >> 62))
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  result = sub_23DB8C574();
  v2 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x24263C1B4](i, a1);
      else
        v5 = *(id *)(a1 + 8 * i + 32);
      v6 = v5;
      if (objc_msgSend(v5, sel_direction) || objc_msgSend(v6, sel_status) && objc_msgSend(v6, sel_status) != (id)1)
      {

      }
      else
      {
        sub_23DB8C538();
        sub_23DB8C550();
        sub_23DB8C55C();
        sub_23DB8C544();
      }
    }
    swift_bridgeObjectRelease();
    return v7;
  }
  return result;
}

uint64_t sub_23DB7E248(unint64_t a1)
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t result;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  char *v74;
  uint64_t v75;
  char *v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  _BOOL4 v83;

  v3 = sub_23DB8C268();
  v82 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v81 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DB8C1C0();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v77 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23DB8C298();
  v79 = *(_QWORD *)(v6 - 8);
  v80 = v6;
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v76 = (char *)&v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v78 = (char *)&v69 - v9;
  sub_23DB7EE78(0, &qword_256CE8278, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v69 - v14;
  v16 = sub_23DB8C1D8();
  MEMORY[0x24BDAC7A8](v16);
  v17 = sub_23DB8C2EC();
  MEMORY[0x24BDAC7A8](v17);
  if (!(a1 >> 62))
  {
    v18 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v18 >= 1)
      goto LABEL_3;
LABEL_34:
    sub_23DB7EE34();
    swift_allocError();
    *v68 = 0xD00000000000001ALL;
    v68[1] = 0x800000023DB8EA70;
    swift_willThrow();
    return (uint64_t)v15;
  }
  swift_bridgeObjectRetain();
  v18 = sub_23DB8C574();
  swift_bridgeObjectRelease();
  if (v18 < 1)
    goto LABEL_34;
LABEL_3:
  v72 = v3;
  v73 = v13;
  v74 = v15;
  v75 = v1;
  v15 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDF8800]), sel_init);
  sub_23DB8C2E0();
  if (qword_256CE8250 != -1)
    swift_once();
  v19 = (id)qword_256CE8790;
  sub_23DB8C1CC();
  sub_23DB8C31C();
  v20 = (void *)sub_23DB8C2F8();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setTitle_, v20);

  sub_23DB8C2E0();
  v21 = (id)qword_256CE8790;
  sub_23DB8C1CC();
  sub_23DB8C31C();
  v22 = (void *)sub_23DB8C2F8();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setSubtitle_, v22);

  if (v18 != 1)
  {
    sub_23DB8C2E0();
    if (qword_256CE8258 != -1)
      swift_once();
    v25 = (void *)qword_256CE8790;
    swift_bridgeObjectRetain();
    v26 = v25;
    sub_23DB8C1CC();
    sub_23DB8C31C();
    sub_23DB7EE78(0, &qword_256CE8288, (uint64_t (*)(uint64_t))sub_23DB7EED0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v27 = swift_allocObject();
    v28 = MEMORY[0x24BEE1768];
    *(_OWORD *)(v27 + 16) = xmmword_23DB8DC20;
    v29 = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v27 + 56) = v28;
    *(_QWORD *)(v27 + 64) = v29;
    *(_QWORD *)(v27 + 32) = v18;
    sub_23DB8C304();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE3F820]), sel_init);
    v31 = objc_msgSend(v30, sel_URLForSharingOverview);
    v32 = v73;
    if (v31)
    {
      v33 = v31;
      sub_23DB8C16C();

      v34 = sub_23DB8C178();
      (*(void (**)(id, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v32, 0, 1, v34);
    }
    else
    {

      v47 = sub_23DB8C178();
      (*(void (**)(id, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v32, 1, 1, v47);
    }
    v48 = (uint64_t)v74;
    sub_23DB7EF24((uint64_t)v32, (uint64_t)v74);
    goto LABEL_32;
  }
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_23DB8C574();
    v23 = result;
  }
  else
  {
    v23 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  if (!v23)
  {
    swift_bridgeObjectRelease();
    sub_23DB7EE34();
    swift_allocError();
    *v49 = 0xD00000000000001ELL;
    v49[1] = 0x800000023DB8EB90;
    swift_willThrow();

    return (uint64_t)v15;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    v35 = (id)MEMORY[0x24263C1B4](0, a1);
LABEL_17:
    v36 = v35;
    swift_bridgeObjectRelease();
    v37 = objc_msgSend(v36, sel_CNContactIdentifier);
    if (v37
      && (v37,
          (v38 = objc_msgSend(v36, sel_CNContactIdentifier)) != 0))
    {
      v39 = v38;
      v40 = sub_23DB8C310();
      v42 = v41;

      swift_bridgeObjectRelease();
      v43 = HIBYTE(v42) & 0xF;
      if ((v42 & 0x2000000000000000) == 0)
        v43 = v40 & 0xFFFFFFFFFFFFLL;
      v83 = v43 != 0;
    }
    else
    {
      v83 = 0;
    }
    v44 = objc_msgSend(v36, sel_firstName);
    if (v44)
    {
      v45 = v44;
      v70 = sub_23DB8C310();
      v71 = v46;

    }
    else
    {
      v70 = 0;
      v71 = 0;
    }
    v50 = objc_msgSend(v36, sel_lastName);
    if (v50)
    {
      v51 = v50;
      sub_23DB8C310();

    }
    sub_23DB8C280();
    v52 = objc_msgSend(v36, sel_primaryContactIdentifier);
    v73 = v36;
    v53 = v52;
    sub_23DB8C310();

    v54 = sub_23DB8C274();
    v56 = v55;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23DB8C2E0();
    v57 = (id)qword_256CE8790;
    sub_23DB8C1CC();
    sub_23DB8C31C();
    sub_23DB7EE78(0, &qword_256CE8288, (uint64_t (*)(uint64_t))sub_23DB7EED0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v58 = swift_allocObject();
    *(_OWORD *)(v58 + 16) = xmmword_23DB8DC20;
    *(_QWORD *)(v58 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v58 + 64) = sub_23DB7EFD4();
    *(_QWORD *)(v58 + 32) = v54;
    *(_QWORD *)(v58 + 40) = v56;
    sub_23DB8C304();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v59 = v73;
    v60 = objc_msgSend(v73, sel_UUID);
    sub_23DB8C1B4();

    v61 = v78;
    sub_23DB8C28C();
    v63 = v79;
    v62 = v80;
    (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v76, v61, v80);
    v64 = v81;
    sub_23DB8C250();
    v48 = (uint64_t)v74;
    sub_23DB8C25C();

    (*(void (**)(char *, uint64_t))(v82 + 8))(v64, v72);
    (*(void (**)(char *, uint64_t))(v63 + 8))(v61, v62);
LABEL_32:
    v65 = (void *)sub_23DB8C2F8();
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_setBody_, v65);

    sub_23DB8C244();
    v66 = (void *)sub_23DB8C238();
    objc_msgSend(v15, sel_setSound_, v66);

    MEMORY[0x24263BEC0](11, v48);
    v67 = (void *)sub_23DB8C2C8();
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_setUserInfo_, v67);

    sub_23DB7EF80(v48);
    return (uint64_t)v15;
  }
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v35 = *(id *)(a1 + 32);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t method lookup function for HDHealthAppNotificationManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HDHealthAppNotificationManager.__allocating_init(profile:userNotificationCenter:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of HDHealthAppNotificationManager.createSharingReminderNotification()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of HDHealthAppNotificationManager.removeNotification(identifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of HDHealthAppNotificationManager.removeNotifications(identifiers:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

_QWORD *initializeBufferWithCopyOfBuffer for HDHealthAppNotificationManager.NotificationError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HDHealthAppNotificationManager.NotificationError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for HDHealthAppNotificationManager.NotificationError(_QWORD *a1, _QWORD *a2)
{
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

_QWORD *assignWithTake for HDHealthAppNotificationManager.NotificationError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HDHealthAppNotificationManager.NotificationError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HDHealthAppNotificationManager.NotificationError(uint64_t result, int a2, int a3)
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

uint64_t sub_23DB7EE18()
{
  return 0;
}

ValueMetadata *type metadata accessor for HDHealthAppNotificationManager.NotificationError()
{
  return &type metadata for HDHealthAppNotificationManager.NotificationError;
}

unint64_t sub_23DB7EE34()
{
  unint64_t result;

  result = qword_256CE8280;
  if (!qword_256CE8280)
  {
    result = MEMORY[0x24263C838](&protocol conformance descriptor for HDHealthAppNotificationManager.NotificationError, &type metadata for HDHealthAppNotificationManager.NotificationError);
    atomic_store(result, (unint64_t *)&qword_256CE8280);
  }
  return result;
}

void sub_23DB7EE78(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_23DB7EED0()
{
  unint64_t result;

  result = qword_256CE8290;
  if (!qword_256CE8290)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_256CE8290);
  }
  return result;
}

uint64_t sub_23DB7EF24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DB7EE78(0, &qword_256CE8278, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DB7EF80(uint64_t a1)
{
  uint64_t v2;

  sub_23DB7EE78(0, &qword_256CE8278, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23DB7EFD4()
{
  unint64_t result;

  result = qword_256CE8298;
  if (!qword_256CE8298)
  {
    result = MEMORY[0x24263C838](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256CE8298);
  }
  return result;
}

void type metadata accessor for HKWheelchairUse(uint64_t a1)
{
  sub_23DB7F050(a1, &qword_256CE82A0, (uint64_t)&unk_250E7E918, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for HDCloudSyncStateResult(uint64_t a1)
{
  sub_23DB7F050(a1, &qword_256CE82A8, (uint64_t)&unk_250E7E938, MEMORY[0x24BEE4D40]);
}

void sub_23DB7F050(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
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

id sub_23DB7F098()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v9[3];
  uint64_t v10;
  _OWORD v11[2];

  sub_23DB8C0D0();
  v2 = HDEntityCategoryForKeyValueCategory();
  sub_23DB8C0B8();
  v3 = *(void **)(v0 + 16);
  v4 = objc_allocWithZone(MEMORY[0x24BE40AD0]);
  v5 = v3;
  v6 = (void *)sub_23DB8C2F8();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_initWithCategory_domainName_profile_, v2, v6, v5);

  sub_23DB8C0AC();
  sub_23DB8C3E8();
  if (v1)
  {
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
    if (v10)
    {
      sub_23DB7F2FC(v9, v11);
      v9[0] = sub_23DB8C0C4();
      swift_bridgeObjectRetain();
      sub_23DB7F620(v9);
      swift_bridgeObjectRelease();

      v7 = (id)v9[0];
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
    }
    else
    {

      sub_23DB7F2A4((uint64_t)v9);
      return 0;
    }
  }
  return v7;
}

id PinnedContentDaemonStore.makeLegacyFavoritesKVD()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  sub_23DB8C0D0();
  v1 = HDEntityCategoryForKeyValueCategory();
  sub_23DB8C0B8();
  v2 = *(void **)(v0 + 16);
  v3 = objc_allocWithZone(MEMORY[0x24BE40AD0]);
  v4 = v2;
  v5 = (void *)sub_23DB8C2F8();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v3, sel_initWithCategory_domainName_profile_, v1, v5, v4);

  return v6;
}

uint64_t sub_23DB7F2A4(uint64_t a1)
{
  uint64_t v2;

  sub_23DB7F050(0, (unint64_t *)&qword_25431DC70, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_23DB7F2FC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

uint64_t sub_23DB7F32C(char a1, int64_t a2, char a3, char *a4)
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
    sub_23DB7F050(0, (unint64_t *)&qword_25431DC48, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
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
  result = sub_23DB8C58C();
  __break(1u);
  return result;
}

uint64_t sub_23DB7F4A8(char a1, int64_t a2, char a3, char *a4)
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
    sub_23DB7F050(0, (unint64_t *)&unk_256CE82C0, MEMORY[0x24BE3F668], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
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
  result = sub_23DB8C58C();
  __break(1u);
  return result;
}

uint64_t sub_23DB7F620(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23DB80284(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_23DB7F688(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_23DB7F688(uint64_t *a1)
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
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  BOOL v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  char v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  unint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *__dst;

  v3 = a1[1];
  result = sub_23DB8C598();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_23DB7FD70(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_160;
  v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v11 = (char *)MEMORY[0x24BEE4AF8];
LABEL_118:
      v94 = v11;
      v104 = v8;
      if (v12 >= 2)
      {
        v95 = *v102;
        do
        {
          v96 = v12 - 2;
          if (v12 < 2)
            goto LABEL_147;
          if (!v95)
            goto LABEL_159;
          v97 = v94;
          v98 = *(_QWORD *)&v94[16 * v96 + 32];
          v99 = *(_QWORD *)&v94[16 * v12 + 24];
          sub_23DB7FE3C((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(_QWORD *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1)
            break;
          if (v99 < v98)
            goto LABEL_148;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v97 = sub_23DB80270((uint64_t)v97);
          if (v96 >= *((_QWORD *)v97 + 2))
            goto LABEL_149;
          v100 = &v97[16 * v96 + 32];
          *(_QWORD *)v100 = v98;
          *((_QWORD *)v100 + 1) = v99;
          v101 = *((_QWORD *)v97 + 2);
          if (v12 > v101)
            goto LABEL_150;
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          v94 = v97;
          *((_QWORD *)v97 + 2) = v101 - 1;
          v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v104 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_23DB8C37C();
    *(_QWORD *)(v7 + 16) = v6;
    v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  v9 = 0;
  v10 = *a1;
  v103 = v10 + 8;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v106 = v3;
  while (1)
  {
    v13 = v9++;
    if (v9 >= v3)
      goto LABEL_46;
    v14 = (uint64_t *)(v10 + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    v17 = (_QWORD *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_45;
      v19 = 0;
    }
    else
    {
      v19 = sub_23DB8C5B0();
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_36;
    }
    v21 = (_QWORD *)(v103 + 16 * v20);
    do
    {
      v23 = (_QWORD *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if ((v19 & 1) != 0)
          goto LABEL_37;
      }
      else if (((v19 ^ sub_23DB8C5B0()) & 1) != 0)
      {
        goto LABEL_36;
      }
      v21 += 2;
      v22 = v20 + 1;
      v9 = v20;
      v20 = v22;
    }
    while (v22 < v3);
    v20 = v22;
LABEL_36:
    v9 = v20;
    if ((v19 & 1) != 0)
    {
LABEL_37:
      if (v20 < v13)
        goto LABEL_155;
      if (v13 < v20)
      {
        v25 = 16 * v20;
        v26 = 16 * v13;
        v27 = v20;
        v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10)
              goto LABEL_158;
            v29 = v10 + v25;
            v30 = *(_QWORD *)(v10 + v26);
            v31 = *(_QWORD *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(_QWORD *)(v29 - 16) = v30;
            *(_QWORD *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13))
        goto LABEL_151;
      if (v9 - v13 < v105)
        break;
    }
LABEL_67:
    if (v9 < v13)
      goto LABEL_146;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_23DB800D4(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v41 = *((_QWORD *)v11 + 2);
    v40 = *((_QWORD *)v11 + 3);
    v12 = v41 + 1;
    if (v41 >= v40 >> 1)
      v11 = sub_23DB800D4((char *)(v40 > 1), v41 + 1, 1, v11);
    *((_QWORD *)v11 + 2) = v12;
    v42 = v11 + 32;
    v43 = &v11[16 * v41 + 32];
    *(_QWORD *)v43 = v13;
    *((_QWORD *)v43 + 1) = v9;
    if (v41)
    {
      v107 = v9;
      while (1)
      {
        v44 = v12 - 1;
        if (v12 >= 4)
        {
          v49 = &v42[16 * v12];
          v50 = *((_QWORD *)v49 - 8);
          v51 = *((_QWORD *)v49 - 7);
          v55 = __OFSUB__(v51, v50);
          v52 = v51 - v50;
          if (v55)
            goto LABEL_135;
          v54 = *((_QWORD *)v49 - 6);
          v53 = *((_QWORD *)v49 - 5);
          v55 = __OFSUB__(v53, v54);
          v47 = v53 - v54;
          v48 = v55;
          if (v55)
            goto LABEL_136;
          v56 = v12 - 2;
          v57 = &v42[16 * v12 - 32];
          v59 = *(_QWORD *)v57;
          v58 = *((_QWORD *)v57 + 1);
          v55 = __OFSUB__(v58, v59);
          v60 = v58 - v59;
          if (v55)
            goto LABEL_138;
          v55 = __OFADD__(v47, v60);
          v61 = v47 + v60;
          if (v55)
            goto LABEL_141;
          if (v61 >= v52)
          {
            v79 = &v42[16 * v44];
            v81 = *(_QWORD *)v79;
            v80 = *((_QWORD *)v79 + 1);
            v55 = __OFSUB__(v80, v81);
            v82 = v80 - v81;
            if (v55)
              goto LABEL_145;
            v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v73 = *((_QWORD *)v11 + 4);
            v74 = *((_QWORD *)v11 + 5);
            v55 = __OFSUB__(v74, v73);
            v66 = v74 - v73;
            v67 = v55;
            goto LABEL_99;
          }
          v46 = *((_QWORD *)v11 + 4);
          v45 = *((_QWORD *)v11 + 5);
          v55 = __OFSUB__(v45, v46);
          v47 = v45 - v46;
          v48 = v55;
        }
        if ((v48 & 1) != 0)
          goto LABEL_137;
        v56 = v12 - 2;
        v62 = &v42[16 * v12 - 32];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v65 = __OFSUB__(v63, v64);
        v66 = v63 - v64;
        v67 = v65;
        if (v65)
          goto LABEL_140;
        v68 = &v42[16 * v44];
        v70 = *(_QWORD *)v68;
        v69 = *((_QWORD *)v68 + 1);
        v55 = __OFSUB__(v69, v70);
        v71 = v69 - v70;
        if (v55)
          goto LABEL_143;
        if (__OFADD__(v66, v71))
          goto LABEL_144;
        if (v66 + v71 >= v47)
        {
          v72 = v47 < v71;
LABEL_105:
          if (v72)
            v44 = v56;
          goto LABEL_107;
        }
LABEL_99:
        if ((v67 & 1) != 0)
          goto LABEL_139;
        v75 = &v42[16 * v44];
        v77 = *(_QWORD *)v75;
        v76 = *((_QWORD *)v75 + 1);
        v55 = __OFSUB__(v76, v77);
        v78 = v76 - v77;
        if (v55)
          goto LABEL_142;
        if (v78 < v66)
          goto LABEL_15;
LABEL_107:
        v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
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
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        v84 = v10;
        if (!v10)
          goto LABEL_157;
        v85 = v11;
        v86 = &v42[16 * v83];
        v87 = *(_QWORD *)v86;
        v88 = v42;
        v89 = v44;
        v90 = &v42[16 * v44];
        v91 = *((_QWORD *)v90 + 1);
        v92 = v84;
        sub_23DB7FE3C((char *)(v84 + 16 * *(_QWORD *)v86), (char *)(v84 + 16 * *(_QWORD *)v90), v84 + 16 * v91, __dst);
        if (v1)
          goto LABEL_115;
        if (v91 < v87)
          goto LABEL_132;
        if (v89 > *((_QWORD *)v85 + 2))
          goto LABEL_133;
        *(_QWORD *)v86 = v87;
        *(_QWORD *)&v88[16 * v83 + 8] = v91;
        v93 = *((_QWORD *)v85 + 2);
        if (v89 >= v93)
          goto LABEL_134;
        v11 = v85;
        v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        v42 = v88;
        *((_QWORD *)v85 + 2) = v93 - 1;
        v10 = v92;
        v9 = v107;
        if (v93 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v3 = v106;
    if (v9 >= v106)
    {
      v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105))
    goto LABEL_153;
  if (v13 + v105 >= v3)
    v32 = v3;
  else
    v32 = v13 + v105;
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      v33 = (_QWORD *)(v10 + 16 * v9);
      do
      {
        v34 = (uint64_t *)(v10 + 16 * v9);
        v35 = *v34;
        v36 = v34[1];
        v37 = v13;
        v38 = v33;
        do
        {
          v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_23DB8C5B0() & 1) == 0)
            break;
          if (!v10)
            goto LABEL_156;
          v35 = *v38;
          v36 = v38[1];
          *(_OWORD *)v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  result = sub_23DB8C568();
  __break(1u);
  return result;
}

uint64_t sub_23DB7FD70(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
LABEL_5:
    v9 = (uint64_t *)(v7 + 16 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = (uint64_t *)v8;
    while (1)
    {
      v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (result = sub_23DB8C5B0(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      result = *v12;
      v10 = v12[1];
      *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23DB7FE3C(char *__src, char *a2, unint64_t a3, char *__dst)
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
  BOOL v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t result;
  char *v25;
  char *v26;
  char *v27;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 15;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v27 = __src;
  v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v17 = &v4[16 * v13];
      v25 = v17;
      v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v18 = (char *)(a3 - 16);
        v19 = v6;
        while (1)
        {
          v20 = v18 + 16;
          v21 = *((_QWORD *)v19 - 2);
          v22 = *((_QWORD *)v19 - 1);
          v19 -= 16;
          v23 = *((_QWORD *)v17 - 2) == v21 && *((_QWORD *)v17 - 1) == v22;
          if (v23 || (sub_23DB8C5B0() & 1) == 0)
          {
            v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17)
              *(_OWORD *)v18 = *((_OWORD *)v17 - 1);
            v19 = v6;
            v17 -= 16;
            if (v6 <= v7)
              goto LABEL_50;
          }
          else
          {
            if (v20 != v6 || v18 >= v6)
              *(_OWORD *)v18 = *(_OWORD *)v19;
            v27 = v19;
            if (v19 <= v7)
              goto LABEL_50;
          }
          v18 -= 16;
          v6 = v19;
          if (v17 <= v4)
            goto LABEL_50;
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[16 * v10];
    v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        v15 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
        if (v15 || (sub_23DB8C5B0() & 1) == 0)
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 16;
          v26 = v4;
          v16 = v6;
        }
        else
        {
          v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        v7 += 16;
        if (v4 >= v14)
          break;
        v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      v27 = v7;
    }
LABEL_50:
    sub_23DB801C8((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  result = sub_23DB8C58C();
  __break(1u);
  return result;
}

char *sub_23DB800D4(char *result, int64_t a2, char a3, char *a4)
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
    sub_23DB80298();
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23DB801C8(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_23DB8C58C();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_23DB80270(uint64_t a1)
{
  return sub_23DB800D4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23DB80284(uint64_t a1)
{
  return sub_23DB7F32C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void sub_23DB80298()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CE82B0)
  {
    sub_23DB802EC();
    v0 = sub_23DB8C5A4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CE82B0);
  }
}

void sub_23DB802EC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CE82B8)
  {
    v0 = sub_23DB8C3AC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CE82B8);
  }
}

id PinnedContentTaskServer.__allocating_init(uuid:configuration:client:delegate:)(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  objc_class *v4;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  v9 = objc_allocWithZone(v4);
  v10 = (void *)sub_23DB8C1A8();
  v11 = objc_msgSend(v9, sel_initWithUUID_configuration_client_delegate_, v10, a2, a3, a4);

  swift_unknownObjectRelease();
  v12 = sub_23DB8C1C0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
  return v11;
}

id PinnedContentTaskServer.init(uuid:configuration:client:delegate:)(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void *v4;
  void *v5;
  void *v10;
  id v11;
  uint64_t v12;
  objc_super v14;

  v5 = v4;
  v10 = (void *)sub_23DB8C1A8();
  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for PinnedContentTaskServer();
  v11 = objc_msgSendSuper2(&v14, sel_initWithUUID_configuration_client_delegate_, v10, a2, a3, a4);

  swift_unknownObjectRelease();
  v12 = sub_23DB8C1C0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
  return v11;
}

uint64_t type metadata accessor for PinnedContentTaskServer()
{
  return objc_opt_self();
}

void sub_23DB80654(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, void *), uint64_t a4)
{
  void *v4;
  void *v5;
  NSObject *ObjectType;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  _BYTE *v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(_BYTE *, uint64_t);
  id v26;
  id v27;
  uint64_t v28;
  uint64_t inited;
  id v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  _BYTE *v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  int v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  os_log_t v51;
  uint64_t v52;
  _BYTE *v53;
  uint64_t v54;
  id v55;
  _BYTE v56[12];
  int v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE *v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(_QWORD, void *);
  os_log_t v64;
  uint64_t v65;
  uint64_t v66[2];

  v5 = v4;
  ObjectType = swift_getObjectType();
  v11 = sub_23DB8C2BC();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = &v56[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v13);
  v17 = &v56[-v16];
  swift_bridgeObjectRetain();
  if ((sub_23DB8C130() & 1) != 0)
  {
    sub_23DB80B68();
    v31 = (void *)swift_allocError();
    *v32 = a1;
    v32[1] = a2;
    swift_bridgeObjectRetain();
    a3(0, v31);

  }
  else
  {
    v64 = ObjectType;
    sub_23DB8C2A4();
    v18 = sub_23DB8C2B0();
    v19 = sub_23DB8C3D0();
    v20 = os_log_type_enabled(v18, v19);
    v60 = v15;
    if (v20)
    {
      v63 = a3;
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v66[0] = v22;
      v61 = v11;
      v62 = a4;
      *(_DWORD *)v21 = 136315138;
      v23 = sub_23DB8C61C();
      v65 = sub_23DB81BD8(v23, v24, v66);
      v11 = v61;
      a4 = v62;
      sub_23DB8C4C0();
      a3 = v63;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DB70000, v18, v19, "[%s] pinned content being fetched remotely", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263C8D4](v22, -1, -1);
      MEMORY[0x24263C8D4](v21, -1, -1);
    }

    v25 = *(void (**)(_BYTE *, uint64_t))(v12 + 8);
    v25(v17, v11);
    v26 = objc_msgSend(v5, sel_client);
    v27 = objc_msgSend(v26, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    v28 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    inited = swift_initStackObject();
    sub_23DB8222C(v27, v28, inited);
    v30 = sub_23DB83BD4();
    swift_release();
    v33 = (void *)sub_23DB8C418();
    v34 = v60;
    sub_23DB8C2A4();
    v35 = v33;
    v36 = sub_23DB8C2B0();
    v37 = sub_23DB8C3D0();
    v38 = v37;
    if (os_log_type_enabled(v36, v37))
    {
      v40 = swift_slowAlloc();
      v61 = v11;
      v41 = v40;
      v59 = swift_slowAlloc();
      v66[0] = v59;
      *(_DWORD *)v41 = 136315394;
      v62 = a4;
      v42 = sub_23DB8C61C();
      v63 = a3;
      v44 = sub_23DB81BD8(v42, v43, v66);
      v64 = v36;
      v65 = v44;
      sub_23DB8C4C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v41 + 12) = 2080;
      v58 = v41 + 14;
      v45 = v35;
      v46 = objc_msgSend(v45, sel_description);
      v47 = sub_23DB8C310();
      v57 = v38;
      v48 = v47;
      v50 = v49;

      v65 = sub_23DB81BD8(v48, v50, v66);
      sub_23DB8C4C0();

      a3 = v63;
      swift_bridgeObjectRelease();
      v51 = v64;
      _os_log_impl(&dword_23DB70000, v64, (os_log_type_t)v57, "[%s] pinned content state fetched remotely: %s", (uint8_t *)v41, 0x16u);
      v52 = v59;
      swift_arrayDestroy();
      MEMORY[0x24263C8D4](v52, -1, -1);
      MEMORY[0x24263C8D4](v41, -1, -1);

      v53 = v34;
      v54 = v61;
    }
    else
    {

      v53 = v34;
      v54 = v11;
    }
    v25(v53, v54);
    v55 = v35;
    a3(v35, 0);

  }
}

unint64_t sub_23DB80B68()
{
  unint64_t result;

  result = qword_256CE82D0;
  if (!qword_256CE82D0)
  {
    result = MEMORY[0x24263C838](&protocol conformance descriptor for PinnedContentDaemonStore.Failure, &type metadata for PinnedContentDaemonStore.Failure);
    atomic_store(result, (unint64_t *)&qword_256CE82D0);
  }
  return result;
}

void sub_23DB80C44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_23DB8C154();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

void sub_23DB80C9C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, void (*a6)(void *, void *))
{
  void *v6;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t inited;
  id v17;
  void *v18;
  _QWORD *v19;
  id v20;
  void *v21;
  id v22;

  swift_bridgeObjectRetain();
  if ((sub_23DB8C130() & 1) != 0)
  {
    sub_23DB80B68();
    v18 = (void *)swift_allocError();
    *v19 = a3;
    v19[1] = a4;
    swift_bridgeObjectRetain();
    a6(0, v18);

  }
  else
  {
    v13 = objc_msgSend(v6, sel_client);
    v14 = objc_msgSend(v13, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    v15 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    inited = swift_initStackObject();
    sub_23DB8222C(v14, v15, inited);
    if (a5)
      v17 = objc_msgSend(a5, sel_integerValue);
    else
      v17 = 0;
    v20 = sub_23DB84118(a1, a2, (uint64_t)v17, a5 == 0);
    swift_release();
    v21 = (void *)sub_23DB8C418();
    v22 = v21;
    a6(v21, 0);

  }
}

void sub_23DB80F50(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void *, id))
{
  void *v5;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t inited;
  id v15;
  _QWORD *v16;
  void *v17;
  id v18;

  swift_bridgeObjectRetain();
  if ((sub_23DB8C130() & 1) != 0)
  {
    sub_23DB80B68();
    v18 = (id)swift_allocError();
    *v16 = a3;
    v16[1] = a4;
    swift_bridgeObjectRetain();
    a5(0, v18);
  }
  else
  {
    v11 = objc_msgSend(v5, sel_client);
    v12 = objc_msgSend(v11, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    v13 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    inited = swift_initStackObject();
    sub_23DB8222C(v12, v13, inited);
    v15 = sub_23DB84470(a1, a2);
    swift_release();
    v17 = (void *)sub_23DB8C418();
    v18 = v17;
    a5(v17, 0);

  }
}

void sub_23DB811B8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, void (*a6)(void *, id))
{
  void *v6;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t inited;
  id v17;
  _QWORD *v18;
  void *v19;
  id v20;

  swift_bridgeObjectRetain();
  if ((sub_23DB8C130() & 1) != 0)
  {
    sub_23DB80B68();
    v20 = (id)swift_allocError();
    *v18 = a3;
    v18[1] = a4;
    swift_bridgeObjectRetain();
    a6(0, v20);
  }
  else
  {
    v13 = objc_msgSend(v6, sel_client);
    v14 = objc_msgSend(v13, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    v15 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    inited = swift_initStackObject();
    sub_23DB8222C(v14, v15, inited);
    v17 = sub_23DB84768(a1, a2, (uint64_t)objc_msgSend(a5, sel_integerValue));
    swift_release();
    v19 = (void *)sub_23DB8C418();
    v20 = v19;
    a6(v19, 0);

  }
}

void sub_23DB81454(uint64_t a1, uint64_t a2, void (*a3)(void *, void *))
{
  void *v3;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t inited;
  id v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  id v15;

  swift_bridgeObjectRetain();
  if ((sub_23DB8C130() & 1) != 0)
  {
    sub_23DB80B68();
    v12 = (void *)swift_allocError();
    *v13 = a1;
    v13[1] = a2;
    swift_bridgeObjectRetain();
    a3(0, v12);

  }
  else
  {
    v7 = objc_msgSend(v3, sel_client);
    v8 = objc_msgSend(v7, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    v9 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    inited = swift_initStackObject();
    sub_23DB8222C(v8, v9, inited);
    v11 = sub_23DB84A90();
    swift_release();
    v14 = (void *)sub_23DB8C418();
    v15 = v14;
    a3(v14, 0);

  }
}

uint64_t sub_23DB81674(unint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void *, void *))
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void (*v35)(void *, void *);
  uint64_t v37;

  v7 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = a1;
    v8 = sub_23DB8C574();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v9 = MEMORY[0x24BEE4AF8];
  if (!v8)
  {
LABEL_16:
    sub_23DB81948(v9, a2, a3, a4);
    return swift_bridgeObjectRelease();
  }
  v37 = MEMORY[0x24BEE4AF8];
  result = sub_23DB82210(0, v8 & ~(v8 >> 63), 0);
  if ((v8 & 0x8000000000000000) == 0)
  {
    v34 = a2;
    v35 = a4;
    v9 = v37;
    if ((v7 & 0xC000000000000001) != 0)
    {
      v11 = 0;
      do
      {
        MEMORY[0x24263C1B4](v11, v7);
        v12 = sub_23DB8C13C();
        v14 = v13;
        v16 = v15;
        v18 = v17;
        swift_unknownObjectRelease();
        v20 = *(_QWORD *)(v37 + 16);
        v19 = *(_QWORD *)(v37 + 24);
        if (v20 >= v19 >> 1)
          sub_23DB82210(v19 > 1, v20 + 1, 1);
        ++v11;
        *(_QWORD *)(v37 + 16) = v20 + 1;
        v21 = v37 + 32 * v20;
        *(_QWORD *)(v21 + 32) = v12;
        *(_QWORD *)(v21 + 40) = v14;
        *(_QWORD *)(v21 + 48) = v16;
        *(_BYTE *)(v21 + 56) = v18 & 1;
        v7 = a1;
      }
      while (v8 != v11);
    }
    else
    {
      v22 = (id *)(v7 + 32);
      do
      {
        v23 = *v22;
        v24 = sub_23DB8C13C();
        v26 = v25;
        v28 = v27;
        v30 = v29;

        v32 = *(_QWORD *)(v37 + 16);
        v31 = *(_QWORD *)(v37 + 24);
        if (v32 >= v31 >> 1)
          sub_23DB82210(v31 > 1, v32 + 1, 1);
        *(_QWORD *)(v37 + 16) = v32 + 1;
        v33 = v37 + 32 * v32;
        *(_QWORD *)(v33 + 32) = v24;
        *(_QWORD *)(v33 + 40) = v26;
        *(_QWORD *)(v33 + 48) = v28;
        *(_BYTE *)(v33 + 56) = v30 & 1;
        ++v22;
        --v8;
      }
      while (v8);
    }
    a4 = v35;
    a2 = v34;
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

void sub_23DB81948(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void *, void *))
{
  void *v4;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t inited;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v23[11];

  swift_bridgeObjectRetain();
  if ((sub_23DB8C130() & 1) != 0)
  {
    sub_23DB80B68();
    v16 = (void *)swift_allocError();
    *v17 = a2;
    v17[1] = a3;
    swift_bridgeObjectRetain();
    a4(0, v16);

  }
  else
  {
    v9 = objc_msgSend(v4, sel_client);
    v10 = objc_msgSend(v9, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    v11 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    inited = swift_initStackObject();
    v13 = (_QWORD *)sub_23DB8222C(v10, v11, inited);
    v14 = MEMORY[0x24BDAC7A8](v13);
    v23[8] = a1;
    v23[2] = MEMORY[0x24BDAC7A8](v14);
    v23[3] = sub_23DB83114;
    v23[4] = v15;
    v18 = sub_23DB85270((uint64_t)sub_23DB83128, (uint64_t)v23);
    v19 = v13[7];
    v20 = v13[8];
    __swift_project_boxed_opaque_existential_1(v13 + 4, v19);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v20);
    v21 = (void *)sub_23DB8C418();
    v22 = v21;
    a4(v21, 0);
    swift_release();

  }
}

id PinnedContentTaskServer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PinnedContentTaskServer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23DB81BD8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23DB81CA8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23DB8306C((uint64_t)v12, *a3);
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
      sub_23DB8306C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23DB81CA8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23DB8C4CC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23DB81E60(a5, a6);
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
  v8 = sub_23DB8C52C();
  if (!v8)
  {
    sub_23DB8C568();
    __break(1u);
LABEL_17:
    result = sub_23DB8C58C();
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

uint64_t sub_23DB81E60(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23DB81EF4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23DB820C8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23DB820C8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23DB81EF4(uint64_t a1, unint64_t a2)
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
      v3 = sub_23DB82068(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23DB8C514();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23DB8C568();
      __break(1u);
LABEL_10:
      v2 = sub_23DB8C358();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23DB8C58C();
    __break(1u);
LABEL_14:
    result = sub_23DB8C568();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23DB82068(uint64_t a1, uint64_t a2)
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
  sub_23DB830A8();
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23DB820C8(char a1, int64_t a2, char a3, char *a4)
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
    sub_23DB830A8();
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
  result = sub_23DB8C58C();
  __break(1u);
  return result;
}

uint64_t sub_23DB82210(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23DB7F4A8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23DB8222C(void *a1, uint64_t a2, uint64_t a3)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  __int128 v11;
  uint64_t v12;
  _UNKNOWN **v13;

  v12 = type metadata accessor for PinnedContentDarwinNotificationPoster();
  v13 = &protocol witness table for PinnedContentDarwinNotificationPoster;
  *(_QWORD *)&v11 = a2;
  *(_QWORD *)(a3 + 16) = a1;
  v6 = a1;
  sub_23DB8C10C();
  v7 = objc_allocWithZone(MEMORY[0x24BE40AD0]);
  v8 = (void *)sub_23DB8C2F8();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v7, sel_initWithCategory_domainName_profile_, 100, v8, v6);

  *(_QWORD *)(a3 + 24) = v9;
  sub_23DB830FC(&v11, a3 + 32);
  return a3;
}

uint64_t method lookup function for PinnedContentTaskServer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PinnedContentTaskServer.remote_fetchPinnedContent(inDomain:withCompletion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x50))();
}

uint64_t dispatch thunk of PinnedContentTaskServer.remote_pinContent(withIdentifier:inDomain:atIndex:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of PinnedContentTaskServer.remote_unpinContent(withIdentifier:inDomain:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of PinnedContentTaskServer.remote_movePinnedContent(withIdentifier:inDomain:toIndex:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of PinnedContentTaskServer.remote_unpinAllContent(inDomain:withCompletion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of PinnedContentTaskServer.remote_applyDifferences(with:inDomain:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

void sub_23DB823B0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  id v14;
  id v15;
  uint64_t v16;
  uint64_t inited;
  id v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  id v22;
  void *v23;

  swift_bridgeObjectRetain();
  if ((sub_23DB8C130() & 1) != 0)
  {
    sub_23DB80B68();
    v19 = (void *)swift_allocError();
    *v20 = a3;
    v20[1] = a4;
    swift_bridgeObjectRetain();
    v21 = (void *)sub_23DB8C154();
    (*(void (**)(uint64_t, _QWORD, void *))(a7 + 16))(a7, 0, v21);

  }
  else
  {
    v14 = objc_msgSend(a6, sel_client);
    v15 = objc_msgSend(v14, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    v16 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    inited = swift_initStackObject();
    sub_23DB8222C(v15, v16, inited);
    if (a5)
      v18 = objc_msgSend(a5, sel_integerValue);
    else
      v18 = 0;
    v22 = sub_23DB84118(a1, a2, (uint64_t)v18, a5 == 0);
    swift_release();
    v23 = (void *)sub_23DB8C418();
    (*(void (**)(uint64_t, void *, _QWORD))(a7 + 16))(a7, v23, 0);

  }
}

void sub_23DB825B8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v12;
  id v13;
  uint64_t v14;
  uint64_t inited;
  id v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;

  swift_bridgeObjectRetain();
  if ((sub_23DB8C130() & 1) != 0)
  {
    sub_23DB80B68();
    v17 = (void *)swift_allocError();
    *v18 = a3;
    v18[1] = a4;
    swift_bridgeObjectRetain();
    v19 = (void *)sub_23DB8C154();
    (*(void (**)(uint64_t, _QWORD, void *))(a6 + 16))(a6, 0, v19);

  }
  else
  {
    v12 = objc_msgSend(a5, sel_client);
    v13 = objc_msgSend(v12, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    v14 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    inited = swift_initStackObject();
    sub_23DB8222C(v13, v14, inited);
    v16 = sub_23DB84470(a1, a2);
    swift_release();
    v20 = (void *)sub_23DB8C418();
    (*(void (**)(uint64_t, void *, _QWORD))(a6 + 16))(a6, v20, 0);

  }
}

void sub_23DB82788(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  id v14;
  id v15;
  uint64_t v16;
  uint64_t inited;
  id v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;

  swift_bridgeObjectRetain();
  if ((sub_23DB8C130() & 1) != 0)
  {
    sub_23DB80B68();
    v19 = (void *)swift_allocError();
    *v20 = a3;
    v20[1] = a4;
    swift_bridgeObjectRetain();
    v21 = (void *)sub_23DB8C154();
    (*(void (**)(uint64_t, _QWORD, void *))(a7 + 16))(a7, 0, v21);

  }
  else
  {
    v14 = objc_msgSend(a6, sel_client);
    v15 = objc_msgSend(v14, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    v16 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    inited = swift_initStackObject();
    sub_23DB8222C(v15, v16, inited);
    v18 = sub_23DB84768(a1, a2, (uint64_t)objc_msgSend(a5, sel_integerValue));
    swift_release();
    v22 = (void *)sub_23DB8C418();
    (*(void (**)(uint64_t, void *, _QWORD))(a7 + 16))(a7, v22, 0);

  }
}

void sub_23DB8297C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t inited;
  void *v12;
  _QWORD *v13;
  void *v14;

  swift_bridgeObjectRetain();
  if ((sub_23DB8C130() & 1) != 0)
  {
    sub_23DB80B68();
    v14 = (void *)swift_allocError();
    *v13 = a1;
    v13[1] = a2;
    swift_bridgeObjectRetain();
    v12 = (void *)sub_23DB8C154();
    (*(void (**)(uint64_t, _QWORD, void *))(a4 + 16))(a4, 0, v12);
  }
  else
  {
    v8 = objc_msgSend(a3, sel_client);
    v9 = objc_msgSend(v8, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    v10 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    inited = swift_initStackObject();
    sub_23DB8222C(v9, v10, inited);
    v12 = sub_23DB84A90();
    swift_release();
    v14 = (void *)sub_23DB8C418();
    (*(void (**)(uint64_t, void *, _QWORD))(a4 + 16))(a4, v14, 0);
  }

}

void sub_23DB82B30(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t inited;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[11];

  swift_bridgeObjectRetain();
  if ((sub_23DB8C130() & 1) != 0)
  {
    sub_23DB80B68();
    v17 = (void *)swift_allocError();
    *v18 = a2;
    v18[1] = a3;
    swift_bridgeObjectRetain();
    v19 = (void *)sub_23DB8C154();
    (*(void (**)(uint64_t, _QWORD, void *))(a5 + 16))(a5, 0, v19);

  }
  else
  {
    v10 = objc_msgSend(a4, sel_client);
    v11 = objc_msgSend(v10, sel_profile);

    type metadata accessor for PinnedContentDarwinNotificationPoster();
    v12 = swift_allocObject();
    type metadata accessor for PinnedContentDaemonStore();
    inited = swift_initStackObject();
    v14 = (_QWORD *)sub_23DB8222C(v11, v12, inited);
    v15 = MEMORY[0x24BDAC7A8](v14);
    v24[8] = a1;
    v24[2] = MEMORY[0x24BDAC7A8](v15);
    v24[3] = sub_23DB82FE8;
    v24[4] = v16;
    v20 = sub_23DB85270((uint64_t)sub_23DB83000, (uint64_t)v24);
    v21 = v14[7];
    v22 = v14[8];
    __swift_project_boxed_opaque_existential_1(v14 + 4, v21);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v22);
    v23 = (void *)sub_23DB8C418();
    (*(void (**)(uint64_t, void *, _QWORD))(a5 + 16))(a5, v23, 0);
    swift_release();

  }
}

void sub_23DB82DA4(unint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *aBlock)
{
  const void *v5;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const void *v40;
  uint64_t v41;

  v5 = aBlock;
  v9 = a1;
  if (a1 >> 62)
  {
    _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    v10 = sub_23DB8C574();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    _Block_copy(aBlock);
  }
  v11 = MEMORY[0x24BEE4AF8];
  if (!v10)
  {
LABEL_16:
    _Block_copy(v5);
    sub_23DB82B30(v11, a2, a3, a4, (uint64_t)v5);
    _Block_release(v5);
    swift_bridgeObjectRelease();
    _Block_release(v5);
    return;
  }
  v41 = MEMORY[0x24BEE4AF8];
  sub_23DB82210(0, v10 & ~(v10 >> 63), 0);
  if ((v10 & 0x8000000000000000) == 0)
  {
    v37 = a2;
    v38 = a3;
    v39 = a4;
    v40 = v5;
    v11 = v41;
    if ((v9 & 0xC000000000000001) != 0)
    {
      v12 = 0;
      do
      {
        v13 = v9;
        MEMORY[0x24263C1B4](v12, v9);
        v14 = sub_23DB8C13C();
        v16 = v15;
        v18 = v17;
        v20 = v19;
        swift_unknownObjectRelease();
        v22 = *(_QWORD *)(v41 + 16);
        v21 = *(_QWORD *)(v41 + 24);
        if (v22 >= v21 >> 1)
          sub_23DB82210(v21 > 1, v22 + 1, 1);
        ++v12;
        *(_QWORD *)(v41 + 16) = v22 + 1;
        v23 = v41 + 32 * v22;
        *(_QWORD *)(v23 + 32) = v14;
        *(_QWORD *)(v23 + 40) = v16;
        *(_QWORD *)(v23 + 48) = v18;
        *(_BYTE *)(v23 + 56) = v20 & 1;
        v9 = v13;
      }
      while (v10 != v12);
    }
    else
    {
      v24 = (id *)(v9 + 32);
      do
      {
        v25 = v10;
        v26 = *v24;
        v27 = sub_23DB8C13C();
        v29 = v28;
        v31 = v30;
        v33 = v32;

        v35 = *(_QWORD *)(v41 + 16);
        v34 = *(_QWORD *)(v41 + 24);
        if (v35 >= v34 >> 1)
          sub_23DB82210(v34 > 1, v35 + 1, 1);
        *(_QWORD *)(v41 + 16) = v35 + 1;
        v36 = v41 + 32 * v35;
        *(_QWORD *)(v36 + 32) = v27;
        *(_QWORD *)(v36 + 40) = v29;
        *(_QWORD *)(v36 + 48) = v31;
        *(_BYTE *)(v36 + 56) = v33 & 1;
        ++v24;
        --v10;
      }
      while (v25 != 1);
    }
    a4 = v39;
    v5 = v40;
    a2 = v37;
    a3 = v38;
    goto LABEL_16;
  }
  __break(1u);
}

uint64_t sub_23DB82FE8(uint64_t a1)
{
  uint64_t v1;

  return sub_23DB85128(a1, *(_QWORD *)(v1 + 16));
}

id sub_23DB83000@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_23DB857CC(*(_QWORD *)(v1 + 16), *(void (**)(void))(v1 + 24), a1);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_23DB83040()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_23DB83064(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23DB80C44(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_23DB8306C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_23DB830A8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25431DC50)
  {
    v0 = sub_23DB8C5A4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25431DC50);
  }
}

uint64_t sub_23DB830FC(__int128 *a1, uint64_t a2)
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

uint64_t sub_23DB83114(uint64_t a1)
{
  return sub_23DB82FE8(a1);
}

id sub_23DB83128@<X0>(_QWORD *a1@<X8>)
{
  return sub_23DB83000(a1);
}

uint64_t PinnedContentDaemonStore.__allocating_init(profile:domain:notificationPoster:)(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v4 = swift_allocObject();
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = __swift_mutable_project_boxed_opaque_existential_1(a2, v5);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  v11 = sub_23DB85C74(a1, (uint64_t)v9, v4, v5, v6);
  __swift_destroy_boxed_opaque_existential_0(a2);
  return v11;
}

uint64_t PinnedContentDarwinNotificationPoster.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t PinnedContentDarwinNotificationPoster.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23DB83214()
{
  uint64_t v0;

  sub_23DB8C124();
  v0 = sub_23DB8C334();
  swift_bridgeObjectRelease();
  notify_post((const char *)(v0 + 32));
  return swift_release();
}

uint64_t PinnedContentDarwinNotificationPoster.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PinnedContentDarwinNotificationPoster.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

id PinnedContentDaemonStore.profile.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t PinnedContentDaemonStore.init(profile:domain:notificationPoster:)(void *a1, uint64_t a2)
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

  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = __swift_mutable_project_boxed_opaque_existential_1(a2, v5);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  v11 = sub_23DB85C74(a1, (uint64_t)v9, v2, v5, v6);
  __swift_destroy_boxed_opaque_existential_0(a2);
  return v11;
}

_WORD *sub_23DB83320()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _WORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  _WORD *v22;
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  os_log_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  _QWORD v61[3];
  int v62;
  os_log_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v2 = sub_23DB8C2BC();
  v65 = *(_QWORD *)(v2 - 8);
  v66 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (_WORD *)((char *)v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)v61 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v61 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v61 - v12;
  v14 = sub_23DB8C3F4();
  if (!v1)
  {
    v17 = v15;
    if (v15 >> 60 == 15)
    {
      if (sub_23DB7F098())
      {
        sub_23DB85D78();
        v18 = (void *)sub_23DB8C46C();
        sub_23DB84D58(v18);
        v48 = v0[7];
        v49 = v0[8];
        __swift_project_boxed_opaque_existential_1(v0 + 4, v48);
        (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v49);
        sub_23DB8C2A4();
        swift_retain_n();
        v5 = v18;
        v50 = sub_23DB8C2B0();
        v51 = sub_23DB8C3D0();
        if (os_log_type_enabled(v50, v51))
        {
          v53 = swift_slowAlloc();
          v64 = swift_slowAlloc();
          v69 = v64;
          *(_DWORD *)v53 = 136315394;
          v54 = sub_23DB85A5C();
          v67 = sub_23DB81BD8(v54, v55, &v69);
          sub_23DB8C4C0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v53 + 12) = 2080;
          v67 = sub_23DB8C460();
          v68 = v56;
          sub_23DB8C5BC();
          v57 = (id)HKSensitiveLogItem();
          swift_unknownObjectRelease();
          sub_23DB8C4D8();
          swift_unknownObjectRelease();
          v58 = sub_23DB8C328();
          v67 = sub_23DB81BD8(v58, v59, &v69);
          sub_23DB8C4C0();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23DB70000, v50, v51, "%s: Legacy store contains content but cloud store does not; migrated and persisted legacy content: %s",
            (uint8_t *)v53,
            0x16u);
          v60 = v64;
          swift_arrayDestroy();
          MEMORY[0x24263C8D4](v60, -1, -1);
          MEMORY[0x24263C8D4](v53, -1, -1);

        }
        else
        {

          swift_release_n();
        }
        (*(void (**)(char *, uint64_t))(v65 + 8))(v8, v66);
      }
      else
      {
        sub_23DB8C2A4();
        swift_retain_n();
        v42 = sub_23DB8C2B0();
        v43 = sub_23DB8C3D0();
        if (os_log_type_enabled(v42, v43))
        {
          v44 = (uint8_t *)swift_slowAlloc();
          v45 = swift_slowAlloc();
          v67 = v45;
          *(_DWORD *)v44 = 136315138;
          v64 = (uint64_t)(v44 + 4);
          v46 = sub_23DB85A5C();
          v69 = sub_23DB81BD8(v46, v47, &v67);
          sub_23DB8C4C0();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23DB70000, v42, v43, "%s: No local state; returning nil", v44, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24263C8D4](v45, -1, -1);
          MEMORY[0x24263C8D4](v44, -1, -1);

        }
        else
        {

          swift_release_n();
        }
        (*(void (**)(_WORD *, uint64_t))(v65 + 8))(v5, v66);
        return 0;
      }
    }
    else
    {
      v19 = v14;
      v20 = objc_allocWithZone(MEMORY[0x24BE40A70]);
      sub_23DB85DB4(v19, v17);
      v21 = (void *)sub_23DB8C184();
      sub_23DB85DF8(v19, v17);
      v5 = objc_msgSend(v20, sel_initWithData_, v21);

      if (v5)
      {
        sub_23DB8C2A4();
        swift_retain_n();
        v22 = v5;
        v23 = sub_23DB8C2B0();
        v24 = sub_23DB8C3D0();
        v25 = v24;
        if (os_log_type_enabled(v23, v24))
        {
          v26 = swift_slowAlloc();
          v63 = v23;
          v27 = v26;
          v64 = swift_slowAlloc();
          v67 = v64;
          *(_DWORD *)v27 = 136315394;
          v61[1] = v27 + 4;
          v62 = v25;
          v28 = sub_23DB85A5C();
          v69 = sub_23DB81BD8(v28, v29, &v67);
          v61[2] = &v70;
          sub_23DB8C4C0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v27 + 12) = 2080;
          v30 = sub_23DB8C460();
          v69 = sub_23DB81BD8(v30, v31, &v67);
          sub_23DB8C4C0();

          swift_bridgeObjectRelease();
          v32 = v63;
          _os_log_impl(&dword_23DB70000, v63, (os_log_type_t)v62, "%s: Fetched content from local store: %s", (uint8_t *)v27, 0x16u);
          v33 = v64;
          swift_arrayDestroy();
          MEMORY[0x24263C8D4](v33, -1, -1);
          MEMORY[0x24263C8D4](v27, -1, -1);

          sub_23DB85DF8(v19, v17);
        }
        else
        {
          sub_23DB85DF8(v19, v17);

          swift_release_n();
        }
        (*(void (**)(char *, uint64_t))(v65 + 8))(v13, v66);
      }
      else
      {
        sub_23DB8C2A4();
        swift_retain_n();
        v34 = sub_23DB8C2B0();
        v35 = sub_23DB8C3C4();
        if (os_log_type_enabled(v34, v35))
        {
          v5 = (_WORD *)swift_slowAlloc();
          v64 = swift_slowAlloc();
          v69 = v64;
          *(_DWORD *)v5 = 136315394;
          v36 = sub_23DB85A5C();
          v67 = sub_23DB81BD8(v36, v37, &v69);
          sub_23DB8C4C0();
          swift_release_n();
          swift_bridgeObjectRelease();
          v5[6] = 2080;
          v67 = 0;
          v68 = 0;
          v38 = sub_23DB8C328();
          v67 = sub_23DB81BD8(v38, v39, &v69);
          sub_23DB8C4C0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23DB70000, v34, v35, "%s: Error decoding persisted state: %s", (uint8_t *)v5, 0x16u);
          v40 = v64;
          swift_arrayDestroy();
          MEMORY[0x24263C8D4](v40, -1, -1);
          MEMORY[0x24263C8D4](v5, -1, -1);

        }
        else
        {

          swift_release_n();
        }
        (*(void (**)(char *, uint64_t))(v65 + 8))(v11, v66);
        sub_23DB80B68();
        swift_allocError();
        *v41 = 0;
        v41[1] = 0;
        swift_willThrow();
        sub_23DB85DF8(v19, v17);
      }
    }
  }
  return v5;
}

id sub_23DB83BD4()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _WORD *v6;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  os_log_t v17;
  uint64_t v18;
  _QWORD v19[2];
  int v20;
  os_log_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v2 = sub_23DB8C2BC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23DB83320();
  if (!v0)
  {
    v1 = v6;
    if (!v6)
    {
      v8 = (void *)sub_23DB8641C();
      sub_23DB8C2A4();
      swift_retain_n();
      v1 = v8;
      v9 = sub_23DB8C2B0();
      v10 = sub_23DB8C3D0();
      v11 = v10;
      if (os_log_type_enabled(v9, v10))
      {
        v12 = swift_slowAlloc();
        v22 = swift_slowAlloc();
        v24 = v22;
        *(_DWORD *)v12 = 136315394;
        v19[1] = v12 + 4;
        v21 = v9;
        v13 = sub_23DB85A5C();
        v23 = sub_23DB81BD8(v13, v14, &v24);
        v20 = v11;
        sub_23DB8C4C0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v12 + 12) = 2080;
        v15 = sub_23DB8C460();
        v23 = sub_23DB81BD8(v15, v16, &v24);
        sub_23DB8C4C0();

        swift_bridgeObjectRelease();
        v17 = v21;
        _os_log_impl(&dword_23DB70000, v21, (os_log_type_t)v20, "%s: No persisted pinned content, returning default state: %s", (uint8_t *)v12, 0x16u);
        v18 = v22;
        swift_arrayDestroy();
        MEMORY[0x24263C8D4](v18, -1, -1);
        MEMORY[0x24263C8D4](v12, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
  return v1;
}

id sub_23DB83E3C(void *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v3 = v2;
  v4 = v1;
  v6 = sub_23DB8C2BC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DB8C2A4();
  swift_retain_n();
  v10 = a1;
  v11 = sub_23DB8C2B0();
  v12 = sub_23DB8C3D0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v33 = v7;
    v14 = v13;
    v31 = swift_slowAlloc();
    v36 = v31;
    *(_DWORD *)v14 = 136315394;
    v32 = v6;
    v15 = sub_23DB85A5C();
    v17 = sub_23DB81BD8(v15, v16, &v36);
    v34 = v2;
    v35 = v17;
    sub_23DB8C4C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    v18 = sub_23DB8C460();
    v35 = sub_23DB81BD8(v18, v19, &v36);
    v3 = v34;
    sub_23DB8C4C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DB70000, v11, v12, "%s: Merging local state with other=%s", (uint8_t *)v14, 0x16u);
    v20 = v31;
    swift_arrayDestroy();
    MEMORY[0x24263C8D4](v20, -1, -1);
    MEMORY[0x24263C8D4](v14, -1, -1);

    v21 = (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v9, v32);
  }
  else
  {

    swift_release_n();
    v21 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v22 = MEMORY[0x24BDAC7A8](v21);
  *(&v30 - 2) = (uint64_t)v10;
  MEMORY[0x24BDAC7A8](v22);
  *(&v30 - 4) = (uint64_t)v4;
  *(&v30 - 3) = (uint64_t)sub_23DB85E50;
  *(&v30 - 2) = v23;
  v24 = v3;
  v25 = sub_23DB85270((uint64_t)sub_23DB83000, (uint64_t)(&v30 - 6));
  if (!v24)
  {
    v26 = v4 + 4;
    v28 = v4[7];
    v27 = v4[8];
    __swift_project_boxed_opaque_existential_1(v26, v28);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v27);
  }
  return v25;
}

id sub_23DB84118(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v35[12];
  int v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;

  v6 = v5;
  v7 = v4;
  v42 = a1;
  v11 = sub_23DB8C2BC();
  v40 = *(_QWORD *)(v11 - 8);
  v41 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = &v35[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23DB8C2A4();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v14 = sub_23DB8C2B0();
  v15 = sub_23DB8C3D0();
  v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    v17 = swift_slowAlloc();
    v38 = v5;
    v18 = v17;
    v37 = swift_slowAlloc();
    v45 = v37;
    *(_DWORD *)v18 = 136315650;
    v39 = a4;
    v36 = v16;
    v19 = sub_23DB85A5C();
    v43 = sub_23DB81BD8(v19, v20, &v45);
    sub_23DB8C4C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain();
    v43 = sub_23DB81BD8(v42, a2, &v45);
    sub_23DB8C4C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 22) = 2080;
    v43 = a3;
    v44 = v39 & 1;
    sub_23DB85EA8();
    v21 = sub_23DB8C328();
    v43 = sub_23DB81BD8(v21, v22, &v45);
    LOBYTE(a4) = v39;
    sub_23DB8C4C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DB70000, v14, (os_log_type_t)v36, "%s: Pinning content with identifier=%s at index=%s", (uint8_t *)v18, 0x20u);
    v23 = v37;
    swift_arrayDestroy();
    MEMORY[0x24263C8D4](v23, -1, -1);
    v24 = v18;
    v6 = v38;
    MEMORY[0x24263C8D4](v24, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  v25 = (*(uint64_t (**)(_BYTE *, uint64_t))(v40 + 8))(v13, v41);
  v26 = MEMORY[0x24BDAC7A8](v25);
  *(_QWORD *)&v35[-32] = v27;
  *(_QWORD *)&v35[-24] = a2;
  *(_QWORD *)&v35[-16] = v28;
  v35[-8] = a4 & 1;
  MEMORY[0x24BDAC7A8](v26);
  *(_QWORD *)&v35[-32] = v7;
  *(_QWORD *)&v35[-24] = sub_23DB85E78;
  *(_QWORD *)&v35[-16] = v29;
  v30 = sub_23DB85270((uint64_t)sub_23DB83128, (uint64_t)&v35[-48]);
  if (!v6)
  {
    v31 = v7 + 4;
    v33 = v7[7];
    v32 = v7[8];
    __swift_project_boxed_opaque_existential_1(v31, v33);
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v33, v32);
  }
  return v30;
}

id sub_23DB84470(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
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
  id v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v29[4];
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v4 = v3;
  v5 = v2;
  v8 = sub_23DB8C2BC();
  v34 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v29[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23DB8C2A4();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v11 = sub_23DB8C2B0();
  v12 = sub_23DB8C3D0();
  v13 = v12;
  if (os_log_type_enabled(v11, v12))
  {
    v14 = swift_slowAlloc();
    v33 = v3;
    v15 = v14;
    v31 = swift_slowAlloc();
    v36 = v31;
    *(_DWORD *)v15 = 136315394;
    v32 = v8;
    v30 = v13;
    v16 = sub_23DB85A5C();
    v35 = sub_23DB81BD8(v16, v17, &v36);
    sub_23DB8C4C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    swift_bridgeObjectRetain();
    v35 = sub_23DB81BD8(a1, a2, &v36);
    sub_23DB8C4C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23DB70000, v11, (os_log_type_t)v30, "%s: Unpinning content with identifier=%s", (uint8_t *)v15, 0x16u);
    v18 = v31;
    swift_arrayDestroy();
    MEMORY[0x24263C8D4](v18, -1, -1);
    v19 = v15;
    v4 = v33;
    MEMORY[0x24263C8D4](v19, -1, -1);

    v20 = (*(uint64_t (**)(_BYTE *, uint64_t))(v34 + 8))(v10, v32);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    v20 = (*(uint64_t (**)(_BYTE *, uint64_t))(v34 + 8))(v10, v8);
  }
  v21 = MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)&v29[-16] = v22;
  *(_QWORD *)&v29[-8] = a2;
  MEMORY[0x24BDAC7A8](v21);
  *(_QWORD *)&v29[-32] = v5;
  *(_QWORD *)&v29[-24] = sub_23DB85EFC;
  *(_QWORD *)&v29[-16] = v23;
  v24 = sub_23DB85270((uint64_t)sub_23DB83128, (uint64_t)&v29[-48]);
  if (!v4)
  {
    v25 = v5 + 4;
    v27 = v5[7];
    v26 = v5[8];
    __swift_project_boxed_opaque_existential_1(v25, v27);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v26);
  }
  return v24;
}

id sub_23DB84768(uint64_t a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v5 = v4;
  v6 = v3;
  v10 = sub_23DB8C2BC();
  v37 = *(_QWORD *)(v10 - 8);
  v38 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DB8C2A4();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v13 = sub_23DB8C2B0();
  v14 = sub_23DB8C3D0();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v35 = v4;
    v16 = v15;
    v34 = swift_slowAlloc();
    v40 = v34;
    *(_DWORD *)v16 = 136315650;
    v36 = a1;
    v17 = sub_23DB85A5C();
    v39 = sub_23DB81BD8(v17, v18, &v40);
    v33 = a3;
    sub_23DB8C4C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    swift_bridgeObjectRetain();
    v39 = sub_23DB81BD8(v36, a2, &v40);
    sub_23DB8C4C0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 22) = 2048;
    v39 = v33;
    sub_23DB8C4C0();
    _os_log_impl(&dword_23DB70000, v13, v14, "%s: Moving content with identifier=%s to index=%ld", (uint8_t *)v16, 0x20u);
    v19 = v34;
    swift_arrayDestroy();
    MEMORY[0x24263C8D4](v19, -1, -1);
    v20 = v16;
    v5 = v35;
    MEMORY[0x24263C8D4](v20, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  v21 = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v12, v38);
  v22 = MEMORY[0x24BDAC7A8](v21);
  *(&v32 - 4) = v23;
  *(&v32 - 3) = a2;
  *(&v32 - 2) = v24;
  MEMORY[0x24BDAC7A8](v22);
  *(&v32 - 4) = (uint64_t)v6;
  *(&v32 - 3) = (uint64_t)sub_23DB85F24;
  *(&v32 - 2) = v25;
  v26 = v5;
  v27 = sub_23DB85270((uint64_t)sub_23DB83128, (uint64_t)(&v32 - 6));
  if (!v26)
  {
    v28 = v6 + 4;
    v30 = v6[7];
    v29 = v6[8];
    __swift_project_boxed_opaque_existential_1(v28, v30);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v29);
  }
  return v27;
}

id sub_23DB84A90()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = v1;
  v3 = sub_23DB8C2BC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DB8C2A4();
  swift_retain_n();
  v7 = sub_23DB8C2B0();
  v8 = sub_23DB8C3D0();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v23 = v1;
    v10 = (uint8_t *)v9;
    v11 = swift_slowAlloc();
    v25 = v11;
    v21 = v4;
    v22 = v3;
    *(_DWORD *)v10 = 136315138;
    v12 = sub_23DB85A5C();
    v24 = sub_23DB81BD8(v12, v13, &v25);
    sub_23DB8C4C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DB70000, v7, v8, "%s: Unpinning all content", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263C8D4](v11, -1, -1);
    v14 = v10;
    v2 = v23;
    MEMORY[0x24263C8D4](v14, -1, -1);

    v15 = (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v6, v22);
  }
  else
  {

    swift_release_n();
    v15 = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  MEMORY[0x24BDAC7A8](v15);
  *(&v21 - 4) = (uint64_t)v0;
  *(&v21 - 3) = (uint64_t)sub_23DB84CE4;
  *(&v21 - 2) = 0;
  v16 = v2;
  v17 = sub_23DB85270((uint64_t)sub_23DB83128, (uint64_t)(&v21 - 6));
  if (!v16)
  {
    v19 = v0[7];
    v18 = v0[8];
    __swift_project_boxed_opaque_existential_1(v0 + 4, v19);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v18);
  }
  return v17;
}

uint64_t sub_23DB84CE4()
{
  return sub_23DB8C454();
}

id sub_23DB84D04(void *a1)
{
  _QWORD *v1;
  uint64_t v2;
  id result;
  uint64_t v4;
  uint64_t v5;

  result = sub_23DB84D58(a1);
  if (!v2)
  {
    v4 = v1[7];
    v5 = v1[8];
    __swift_project_boxed_opaque_existential_1(v1 + 4, v4);
    return (id)(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  }
  return result;
}

id sub_23DB84D58(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  unsigned __int8 v23;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32[2];

  v32[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = sub_23DB8C2BC();
  v30 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DB8C2A4();
  swift_retain_n();
  v7 = a1;
  v8 = sub_23DB8C2B0();
  v9 = sub_23DB8C3D0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v29 = v2;
    v11 = v10;
    v27 = (void *)swift_slowAlloc();
    v32[0] = v27;
    *(_DWORD *)v11 = 136315394;
    v28 = v4;
    v12 = sub_23DB85A5C();
    v31 = sub_23DB81BD8(v12, v13, (uint64_t *)v32);
    sub_23DB8C4C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    v14 = sub_23DB8C460();
    v31 = sub_23DB81BD8(v14, v15, (uint64_t *)v32);
    sub_23DB8C4C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DB70000, v8, v9, "%s: Setting state to %s", (uint8_t *)v11, 0x16u);
    v16 = v27;
    swift_arrayDestroy();
    MEMORY[0x24263C8D4](v16, -1, -1);
    MEMORY[0x24263C8D4](v11, -1, -1);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v28);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v4);
  }
  v17 = *(void **)(v1 + 24);
  v18 = objc_msgSend(v7, sel_data);
  if (v18)
  {
    v19 = sub_23DB8C19C();
    v21 = v20;

    v18 = (id)sub_23DB8C184();
    sub_23DB85E0C(v19, v21);
  }
  v22 = (void *)sub_23DB8C2F8();
  v32[0] = 0;
  v23 = objc_msgSend(v17, sel_setData_forKey_error_, v18, v22, v32);

  if ((v23 & 1) != 0)
    return v32[0];
  v25 = v32[0];
  sub_23DB8C160();

  return (id)swift_willThrow();
}

id sub_23DB85098(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[6];
  char v8;
  uint64_t v9;

  v9 = a1;
  v7[3] = sub_23DB82FE8;
  v7[4] = &v8;
  v3 = sub_23DB85270((uint64_t)sub_23DB83128, (uint64_t)v7);
  if (!v2)
  {
    v4 = v1[7];
    v5 = v1[8];
    __swift_project_boxed_opaque_existential_1(v1 + 4, v4);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  }
  return v3;
}

uint64_t sub_23DB85128(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 + 16);
  if (!v3)
    return sub_23DB8C478();
  swift_bridgeObjectRetain();
  for (i = (_BYTE *)(a2 + 56); ; i += 32)
  {
    v6 = *((_QWORD *)i - 3);
    if (*i == 1)
      break;
    sub_23DB8C43C();
    if (v2)
      return swift_bridgeObjectRelease();
LABEL_4:
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      return sub_23DB8C478();
    }
  }
  v7 = *((_QWORD *)i - 2);
  v8 = *((_QWORD *)i - 1);
  sub_23DB86344(*((_QWORD *)i - 3), v7, v8, 1);
  swift_bridgeObjectRetain();
  sub_23DB8C424();
  if (!v2)
  {
    sub_23DB86354(v6, v7, v8, 1);
    sub_23DB86354(v6, v7, v8, 1);
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  sub_23DB86354(v6, v7, v8, 1);
  return sub_23DB86354(v6, v7, v8, 1);
}

id sub_23DB85270(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  char *__ptr32 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _OWORD *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 aBlock;
  uint64_t (*v32)(uint64_t, void *);
  void *v33;
  uint64_t (*v34)();
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v5 = sub_23DB8C2BC();
  v28 = *(_QWORD *)(v5 - 8);
  v29 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36[0] = 0;
  v8 = objc_msgSend(*(id *)(v2 + 16), sel_database);
  v9 = objc_msgSend((id)objc_opt_self(), sel_contextForWritingProtectedData);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v36;
  v10[3] = a1;
  v10[4] = a2;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_23DB86374;
  *(_QWORD *)(v11 + 24) = v10;
  v34 = sub_23DB86390;
  v35 = v11;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v32 = sub_23DB85708;
  v33 = &block_descriptor;
  v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  *(_QWORD *)&aBlock = 0;
  v13 = objc_msgSend(v8, sel_performTransactionWithContext_error_block_inaccessibilityHandler_, v9, &aBlock, v12, 0);
  _Block_release(v12);

  v14 = (id)aBlock;
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v12 & 1) != 0)
    __break(1u);
  if (!v13)
  {
    sub_23DB8C160();

LABEL_10:
    swift_willThrow();
    v25 = (void *)v36[0];
    swift_release();

    return v14;
  }
  v14 = (id)v36[0];
  if (!v36[0])
  {
    sub_23DB8C2A4();
    swift_retain_n();
    v14 = v7;
    v15 = sub_23DB8C2B0();
    v16 = sub_23DB8C3C4();
    v17 = &off_23DB8D000;
    if (os_log_type_enabled(v15, v16))
    {
      v18 = swift_slowAlloc();
      v19 = swift_slowAlloc();
      v30 = v19;
      *(_DWORD *)v18 = 136315394;
      v20 = sub_23DB85A5C();
      *(_QWORD *)&aBlock = sub_23DB81BD8(v20, v21, &v30);
      sub_23DB8C4C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      aBlock = xmmword_23DB8DD50;
      v22 = sub_23DB8C328();
      v14 = (id)v23;
      *(_QWORD *)&aBlock = sub_23DB81BD8(v22, v23, &v30);
      v17 = &off_23DB8D000;
      sub_23DB8C4C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DB70000, v15, v16, "%s: No output returned during write operation: %s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24263C8D4](v19, -1, -1);
      MEMORY[0x24263C8D4](v18, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v29);
    sub_23DB80B68();
    swift_allocError();
    *v24 = *((_OWORD *)v17 + 213);
    goto LABEL_10;
  }
  swift_release();
  return v14;
}

uint64_t sub_23DB85688(uint64_t a1, uint64_t a2, void **a3, void (*a4)(void **__return_ptr))
{
  void *v5;
  void *v7;

  a4(&v7);
  v5 = *a3;
  *a3 = v7;

  return 1;
}

uint64_t sub_23DB85708(uint64_t a1, void *a2)
{
  uint64_t (*v2)(void);
  id v3;
  char v4;

  v2 = *(uint64_t (**)(void))(a1 + 32);
  v3 = a2;
  v4 = v2();

  return v4 & 1;
}

id sub_23DB8574C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[6];

  v8[3] = a1;
  v8[4] = a2;
  v4 = sub_23DB85270((uint64_t)sub_23DB83128, (uint64_t)v8);
  if (!v3)
  {
    v5 = v2[7];
    v6 = v2[8];
    __swift_project_boxed_opaque_existential_1(v2 + 4, v5);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
  }
  return v4;
}

id sub_23DB857CC@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id result;
  void *v12;
  char *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  os_log_t v23;
  uint64_t v24;
  uint64_t v25;
  os_log_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v7 = sub_23DB8C2BC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_23DB83BD4();
  if (!v3)
  {
    v12 = result;
    v30 = v10;
    v31 = a1;
    v28 = v8;
    v29 = v7;
    a2();
    sub_23DB84D58(v12);
    v13 = v30;
    sub_23DB8C2A4();
    swift_retain_n();
    v14 = v12;
    v15 = sub_23DB8C2B0();
    v16 = sub_23DB8C3D0();
    if (os_log_type_enabled(v15, v16))
    {
      v18 = swift_slowAlloc();
      v27 = swift_slowAlloc();
      v33 = v27;
      *(_DWORD *)v18 = 136315394;
      v25 = v18 + 4;
      v26 = v15;
      v19 = sub_23DB85A5C();
      v32 = sub_23DB81BD8(v19, v20, &v33);
      sub_23DB8C4C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      v21 = sub_23DB8C460();
      v32 = sub_23DB81BD8(v21, v22, &v33);
      sub_23DB8C4C0();

      swift_bridgeObjectRelease();
      v23 = v26;
      _os_log_impl(&dword_23DB70000, v26, v16, "%s: Mutation complete, new state=%s", (uint8_t *)v18, 0x16u);
      v24 = v27;
      swift_arrayDestroy();
      MEMORY[0x24263C8D4](v24, -1, -1);
      MEMORY[0x24263C8D4](v18, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    result = (id)(*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v13, v29);
    *a3 = v14;
  }
  return result;
}

uint64_t sub_23DB85A5C()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;

  sub_23DB8C61C();
  sub_23DB8C34C();
  swift_bridgeObjectRelease();
  sub_23DB8C34C();
  v1 = objc_msgSend(*(id *)(v0 + 16), sel_profileIdentifier);
  v2 = objc_msgSend(v1, sel_description);
  sub_23DB8C310();

  sub_23DB8C34C();
  swift_bridgeObjectRelease();
  v3 = sub_23DB8C34C();
  MEMORY[0x24263BDAC](v3);
  sub_23DB8C34C();
  swift_bridgeObjectRelease();
  return 91;
}

unint64_t PinnedContentDaemonStore.Failure.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  if (!v1)
    return 0xD000000000000021;
  if (v1 == 1)
    return 0xD00000000000002FLL;
  sub_23DB8C508();
  swift_bridgeObjectRelease();
  sub_23DB8C34C();
  sub_23DB8C34C();
  return 0xD000000000000017;
}

uint64_t PinnedContentDaemonStore.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 32);
  return v0;
}

uint64_t PinnedContentDaemonStore.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 32);
  return swift_deallocClassInstance();
}

uint64_t sub_23DB85C74(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  id v10;
  id v11;
  void *v12;
  id v13;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v16 = a4;
  v17 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v15);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  *(_QWORD *)(a3 + 16) = a1;
  v10 = a1;
  sub_23DB8C10C();
  v11 = objc_allocWithZone(MEMORY[0x24BE40AD0]);
  v12 = (void *)sub_23DB8C2F8();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_initWithCategory_domainName_profile_, 100, v12, v10);

  *(_QWORD *)(a3 + 24) = v13;
  sub_23DB830FC(&v15, a3 + 32);
  return a3;
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

unint64_t sub_23DB85D78()
{
  unint64_t result;

  result = qword_25431DC30;
  if (!qword_25431DC30)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25431DC30);
  }
  return result;
}

uint64_t sub_23DB85DB4(uint64_t a1, unint64_t a2)
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

uint64_t sub_23DB85DF8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23DB85E0C(a1, a2);
  return a1;
}

uint64_t sub_23DB85E0C(uint64_t a1, unint64_t a2)
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

uint64_t sub_23DB85E50()
{
  return sub_23DB8C490();
}

uint64_t sub_23DB85E78()
{
  return sub_23DB8C424();
}

void sub_23DB85EA8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CE83A0)
  {
    v0 = sub_23DB8C4B4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CE83A0);
  }
}

uint64_t sub_23DB85EFC()
{
  return sub_23DB8C448();
}

uint64_t sub_23DB85F24()
{
  return sub_23DB8C430();
}

uint64_t dispatch thunk of PinnedContentDarwinNotificationPosting.postPinnedContentUpdatedDarwinNotification(domain:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t type metadata accessor for PinnedContentDarwinNotificationPoster()
{
  return objc_opt_self();
}

uint64_t method lookup function for PinnedContentDarwinNotificationPoster()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PinnedContentDarwinNotificationPoster.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of PinnedContentDarwinNotificationPoster.postPinnedContentUpdatedDarwinNotification(domain:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t type metadata accessor for PinnedContentDaemonStore()
{
  return objc_opt_self();
}

uint64_t method lookup function for PinnedContentDaemonStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.__allocating_init(profile:domain:notificationPoster:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.fetchPersistedPinnedContentState()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.fetchPersistedOrDefaultPinnedContentState()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.mergeState(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.pinContentWithIdentifier(_:at:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v4 + 144))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of PinnedContentDaemonStore.unpinContentWithIdentifier(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.movePinnedContentWithIdentifier(_:to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.unpinAllContentInDomain()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.setPinnedContentState(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.applyDifferences(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of PinnedContentDaemonStore.mutateState(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

unint64_t destroy for PinnedContentDaemonStore.Failure(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s21HealthAppHealthDaemon24PinnedContentDaemonStoreC7FailureOwCP_0(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for PinnedContentDaemonStore.Failure(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for PinnedContentDaemonStore.Failure(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for PinnedContentDaemonStore.Failure(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PinnedContentDaemonStore.Failure(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23DB862FC(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23DB86314(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for PinnedContentDaemonStore.Failure()
{
  return &type metadata for PinnedContentDaemonStore.Failure;
}

uint64_t sub_23DB86344(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if ((a4 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23DB86354(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if ((a4 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23DB86364()
{
  return swift_deallocObject();
}

uint64_t sub_23DB86374(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23DB85688(a1, a2, *(void ***)(v2 + 16), *(void (**)(void **__return_ptr))(v2 + 24));
}

uint64_t sub_23DB86380()
{
  return swift_deallocObject();
}

uint64_t sub_23DB86390()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
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

uint64_t PinnedContentDaemonStore.makeDefaultState()()
{
  return sub_23DB8641C();
}

uint64_t sub_23DB8641C()
{
  os_log_t *v0;
  void *v1;
  os_log_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  id *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  NSObject *v44;
  os_log_type_t v45;
  int v46;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  id v51;
  _QWORD *v52;
  uint64_t v53;
  unint64_t v54;
  os_log_t v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  _QWORD *v63;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  NSObject *v68;
  os_log_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;

  v2 = v0;
  v69 = *v0;
  v3 = sub_23DB8C2BC();
  v70 = *(_QWORD *)(v3 - 8);
  v71 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v65 - v7;
  if (objc_msgSend((id)objc_opt_self(), sel_hasPairedWatch))
  {
    v9 = objc_msgSend((id)objc_opt_self(), sel_activitySummaryType);
    v10 = sub_23DB8C3B8();
    v12 = v11;

    v13 = sub_23DB86D78(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v15 = v13[2];
    v14 = v13[3];
    if (v15 >= v14 >> 1)
      v13 = sub_23DB86D78((_QWORD *)(v14 > 1), v15 + 1, 1, v13);
    v13[2] = v15 + 1;
    v16 = &v13[2 * v15];
    v16[4] = v10;
    v16[5] = v12;
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v17 = v2[2];
  v18 = sub_23DB86BF4();
  if (v1)
  {
    sub_23DB8C2A4();
    swift_retain();
    v19 = v1;
    swift_retain();
    v20 = v1;
    v21 = sub_23DB8C2B0();
    v22 = sub_23DB8C3C4();
    v23 = v22;
    v68 = v21;
    if (os_log_type_enabled(v21, v22))
    {
      v24 = swift_slowAlloc();
      v25 = swift_slowAlloc();
      v66 = v17;
      v26 = (_QWORD *)v25;
      v67 = swift_slowAlloc();
      v73 = v67;
      *(_DWORD *)v24 = 136315650;
      v27 = sub_23DB8C61C();
      LODWORD(v69) = v23;
      v72 = sub_23DB81BD8(v27, v28, (uint64_t *)&v73);
      sub_23DB8C4C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2112;
      v29 = objc_msgSend(v66, sel_profileIdentifier);
      v72 = (uint64_t)v29;
      sub_23DB8C4C0();
      *v26 = v29;
      swift_release_n();
      *(_WORD *)(v24 + 22) = 2080;
      v72 = (uint64_t)v1;
      v30 = v1;
      sub_23DB86E80();
      v31 = sub_23DB8C328();
      v72 = sub_23DB81BD8(v31, v32, (uint64_t *)&v73);
      sub_23DB8C4C0();
      swift_bridgeObjectRelease();

      v33 = v68;
      _os_log_impl(&dword_23DB70000, v68, (os_log_type_t)v69, "[%s]_%@: Unable to fetch wheelchair use: %s", (uint8_t *)v24, 0x20u);
      sub_23DB86ED4();
      swift_arrayDestroy();
      MEMORY[0x24263C8D4](v26, -1, -1);
      v34 = v67;
      swift_arrayDestroy();
      MEMORY[0x24263C8D4](v34, -1, -1);
      MEMORY[0x24263C8D4](v24, -1, -1);

    }
    else
    {
      swift_release_n();

    }
    (*(void (**)(char *, uint64_t))(v70 + 8))(v6, v71);
    sub_23DB8707C(0, &qword_25431DC20);
    v37 = (void *)MEMORY[0x24263C070]((id)*MEMORY[0x24BDD3678]);
    v38 = sub_23DB8C3B8();
    v40 = v39;

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_23DB86D78(0, v13[2] + 1, 1, v13);
    v42 = v13[2];
    v41 = v13[3];
    if (v42 >= v41 >> 1)
      v13 = sub_23DB86D78((_QWORD *)(v41 > 1), v42 + 1, 1, v13);
    v13[2] = v42 + 1;
    v43 = &v13[2 * v42];
    v43[4] = v38;
    v43[5] = v40;

    goto LABEL_29;
  }
  v35 = (uint64_t)v18;
  if ((unint64_t)v18 < 2)
    goto LABEL_23;
  if (v18 != (id)2)
  {
    sub_23DB8C2A4();
    swift_retain_n();
    v44 = sub_23DB8C2B0();
    v45 = sub_23DB8C3C4();
    v46 = v45;
    if (os_log_type_enabled(v44, v45))
    {
      v48 = swift_slowAlloc();
      v66 = (_QWORD *)swift_slowAlloc();
      v68 = swift_slowAlloc();
      v73 = v68;
      *(_DWORD *)v48 = 136315650;
      v65 = v48 + 4;
      v49 = sub_23DB8C61C();
      v69 = v44;
      v72 = sub_23DB81BD8(v49, v50, (uint64_t *)&v73);
      LODWORD(v67) = v46;
      sub_23DB8C4C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v48 + 12) = 2112;
      v51 = objc_msgSend(v17, sel_profileIdentifier);
      v72 = (uint64_t)v51;
      sub_23DB8C4C0();
      v52 = v66;
      *v66 = v51;
      swift_release_n();
      *(_WORD *)(v48 + 22) = 2080;
      v72 = v35;
      type metadata accessor for HKWheelchairUse(0);
      v53 = sub_23DB8C328();
      v72 = sub_23DB81BD8(v53, v54, (uint64_t *)&v73);
      sub_23DB8C4C0();
      swift_bridgeObjectRelease();
      v55 = v69;
      _os_log_impl(&dword_23DB70000, v69, (os_log_type_t)v67, "[%s]_%@: Unknown wheelchair status: %s", (uint8_t *)v48, 0x20u);
      sub_23DB86ED4();
      swift_arrayDestroy();
      MEMORY[0x24263C8D4](v52, -1, -1);
      v56 = v68;
      swift_arrayDestroy();
      MEMORY[0x24263C8D4](v56, -1, -1);
      MEMORY[0x24263C8D4](v48, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v70 + 8))(v8, v71);
LABEL_23:
    sub_23DB8707C(0, &qword_25431DC20);
    v36 = (id *)MEMORY[0x24BDD3678];
    goto LABEL_24;
  }
  sub_23DB8707C(0, &qword_25431DC20);
  v36 = (id *)MEMORY[0x24BDD3620];
LABEL_24:
  v57 = (void *)MEMORY[0x24263C070](*v36);
  v58 = sub_23DB8C3B8();
  v60 = v59;

  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = sub_23DB86D78(0, v13[2] + 1, 1, v13);
  v62 = v13[2];
  v61 = v13[3];
  if (v62 >= v61 >> 1)
    v13 = sub_23DB86D78((_QWORD *)(v61 > 1), v62 + 1, 1, v13);
  v13[2] = v62 + 1;
  v63 = &v13[2 * v62];
  v63[4] = v58;
  v63[5] = v60;
LABEL_29:
  sub_23DB8707C(0, (unint64_t *)&qword_25431DC30);
  return sub_23DB8C46C();
}

id sub_23DB86BF4()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8[5];

  v8[4] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(v0, sel_userCharacteristicsManager);
  sub_23DB8707C(0, &qword_25431DC28);
  v2 = (void *)MEMORY[0x24263C0A0]((id)*MEMORY[0x24BDD2A98]);
  v8[0] = 0;
  v3 = objc_msgSend(v1, sel_userCharacteristicForType_error_, v2, v8);

  if (v3)
  {
    v4 = v8[0];
    sub_23DB8C4D8();
    swift_unknownObjectRelease();
    sub_23DB8707C(0, &qword_256CE83A8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v5 = objc_msgSend(v7, sel_integerValue);

    }
    else
    {
      return 0;
    }
  }
  else
  {
    v5 = v8[0];
    sub_23DB8C160();

    swift_willThrow();
  }
  return v5;
}

_QWORD *sub_23DB86D78(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_23DB86F38();
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
    sub_23DB86F8C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_23DB86E80()
{
  unint64_t result;

  result = qword_25431DC60;
  if (!qword_25431DC60)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_25431DC60);
  }
  return result;
}

void sub_23DB86ED4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25431DC40)
  {
    sub_23DB8707C(255, &qword_25431DC38);
    v0 = sub_23DB8C4B4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25431DC40);
  }
}

void sub_23DB86F38()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25431DC48)
  {
    v0 = sub_23DB8C5A4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25431DC48);
  }
}

uint64_t sub_23DB86F8C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23DB8C58C();
  __break(1u);
  return result;
}

uint64_t sub_23DB8707C(uint64_t a1, unint64_t *a2)
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

id PinnedContentDaemonStore.setModel(_:)(void *a1)
{
  _QWORD *v1;
  uint64_t v2;
  id result;
  uint64_t v4;
  uint64_t v5;

  result = sub_23DB84D58(a1);
  if (!v2)
  {
    v4 = v1[7];
    v5 = v1[8];
    __swift_project_boxed_opaque_existential_1(v1 + 4, v4);
    return (id)(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  }
  return result;
}

_WORD *PinnedContentDaemonStore.fetchLocallyPersistedData()()
{
  return sub_23DB83320();
}

id sub_23DB8711C(void *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  id result;
  uint64_t v5;
  uint64_t v6;

  v3 = (_QWORD *)*v1;
  result = sub_23DB84D58(a1);
  if (!v2)
  {
    v5 = v3[7];
    v6 = v3[8];
    __swift_project_boxed_opaque_existential_1(v3 + 4, v5);
    return (id)(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
  }
  return result;
}

_WORD *sub_23DB87174()
{
  return sub_23DB83320();
}

id sub_23DB87194()
{
  void *v0;

  return objc_msgSend(v0, sel_epoch);
}

id sub_23DB871A4(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setEpoch_, a1);
}

id (*sub_23DB871B8(_QWORD *a1))(uint64_t a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_epoch);
  return sub_23DB871F8;
}

id sub_23DB871F8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setEpoch_, *(_QWORD *)a1);
}

uint64_t sub_23DB87210()
{
  return sub_23DB8C490();
}

uint64_t sub_23DB87224()
{
  return sub_23DB8C484();
}

uint64_t PinnedContentSyncStateUpdaterDelegate.__allocating_init(profile:pinnedContentDomain:notificationPoster:maxDataSizeInBytes:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = __swift_mutable_project_boxed_opaque_existential_1(a2, v7);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v11);
  v13 = sub_23DB87604(a1, (uint64_t)v11, a3, v3, v7, v8);

  __swift_destroy_boxed_opaque_existential_0(a2);
  return v13;
}

uint64_t PinnedContentSyncStateUpdaterDelegate.__allocating_init(logger:key:supportedSyncVersionRange:domain:store:maxDataSizeInBytes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  objc_class *v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  _QWORD v18[4];

  v18[1] = a6;
  v18[2] = a8;
  v11 = sub_23DB8C2BC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_allocWithZone(v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v18[3] = a7;
  v16 = sub_23DB8C1E4();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  return v16;
}

uint64_t PinnedContentSyncStateUpdaterDelegate.init(logger:key:supportedSyncVersionRange:domain:store:maxDataSizeInBytes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];

  v15[1] = a8;
  v10 = sub_23DB8C2BC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  v15[3] = a7;
  v13 = sub_23DB8C1E4();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  return v13;
}

id PinnedContentSyncStateUpdaterDelegate.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PinnedContentSyncStateUpdaterDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23DB8750C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v18[4];

  v18[1] = a6;
  v18[2] = a8;
  v10 = sub_23DB8C2BC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *a7;
  v15 = objc_allocWithZone((Class)type metadata accessor for PinnedContentSyncStateUpdaterDelegate());
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  v18[3] = v14;
  v16 = sub_23DB8C1E4();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  return v16;
}

uint64_t sub_23DB87604(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v31 = a3;
  v30 = sub_23DB8C2BC();
  v10 = *(_QWORD *)(v30 - 8);
  v11 = MEMORY[0x24BDAC7A8](v30);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v29 - v15;
  v17 = *(_QWORD *)(a5 - 8);
  v18 = MEMORY[0x24BDAC7A8](v14);
  v20 = (char *)&v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v29 - v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))((char *)&v29 - v21, a2, a5);
  sub_23DB8C2A4();
  type metadata accessor for PinnedContentDaemonStore();
  v23 = swift_allocObject();
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v22, a5);
  v24 = sub_23DB85C74(a1, (uint64_t)v20, v23, a5, a6);
  objc_allocWithZone((Class)type metadata accessor for PinnedContentSyncStateUpdaterDelegate());
  v25 = v10;
  v26 = v30;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v16, v30);
  v32 = v24;
  v27 = sub_23DB8C1E4();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v26);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v22, a5);
  return v27;
}

uint64_t type metadata accessor for PinnedContentSyncStateUpdaterDelegate()
{
  uint64_t result;

  result = qword_256CE83B8;
  if (!qword_256CE83B8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23DB8783C()
{
  unint64_t result;
  unint64_t v1;

  result = qword_256CE83B0;
  if (!qword_256CE83B0)
  {
    v1 = sub_23DB85D78();
    result = MEMORY[0x24263C838](&protocol conformance descriptor for HDCodablePinnedContentState, v1);
    atomic_store(result, (unint64_t *)&qword_256CE83B0);
  }
  return result;
}

uint64_t sub_23DB87884()
{
  return swift_initClassMetadata2();
}

uint64_t sub_23DB878C0()
{
  return type metadata accessor for PinnedContentSyncStateUpdaterDelegate();
}

unint64_t static HDHealthAppDefines.sharingReminderNotificationIdentifier.getter()
{
  return 0xD00000000000002ELL;
}

id HDHealthAppDefines.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id HDHealthAppDefines.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HDHealthAppDefines();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for HDHealthAppDefines()
{
  return objc_opt_self();
}

id HDHealthAppDefines.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HDHealthAppDefines();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t static AppAnalyticsAcceptanceStateSyncEntity.syncEntityDomain.getter()
{
  return 0xD000000000000025;
}

unint64_t static AppAnalyticsAcceptanceStateSyncEntity.acceptanceStateDataKey.getter()
{
  return 0xD000000000000017;
}

void sub_23DB87A28()
{
  void *v0;
  void *v1;
  id v2;

  sub_23DB8A51C((uint64_t)&unk_250E7E758);
  swift_arrayDestroy();
  v0 = (void *)sub_23DB8C2F8();
  v1 = (void *)sub_23DB8C394();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend((id)objc_opt_self(), sel_schemaWithDomain_dataKeys_, v0, v1);

  qword_25431D9E0 = (uint64_t)v2;
}

id static AppAnalyticsAcceptanceStateSyncEntity.stateEntitySchema.getter()
{
  if (qword_25431D9E8 != -1)
    swift_once();
  return (id)qword_25431D9E0;
}

unint64_t sub_23DB87B70(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_23DB8961C(0, &qword_256CE84C8, MEMORY[0x24BEE30A0]);
  v2 = (_QWORD *)sub_23DB8C580();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_23DB8831C(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
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

void static AppAnalyticsAcceptanceStateSyncEntity.save(_:profile:transaction:)(void *a1, void *a2, uint64_t a3)
{
  sub_23DB8873C(a1, a2, a3);
}

void static AppAnalyticsAcceptanceStateSyncEntity.updateData(withStateStorage:profile:transaction:)(void *a1, void *a2, uint64_t a3)
{
  sub_23DB890A8(a1, a2, a3);
}

id AppAnalyticsAcceptanceStateSyncEntity.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AppAnalyticsAcceptanceStateSyncEntity.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppAnalyticsAcceptanceStateSyncEntity();
  return objc_msgSendSuper2(&v2, sel_init);
}

id AppAnalyticsAcceptanceStateSyncEntity.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppAnalyticsAcceptanceStateSyncEntity();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_23DB87E38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  void *v28;
  unint64_t v29;
  id v30;
  void *v31;
  char v32;
  id v33;
  id v34;
  void *v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  char v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;
  unint64_t v49;
  int64_t v50;

  if (a1 == a2)
    return;
  v2 = a2;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return;
  v3 = 0;
  v45 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v46 = (unint64_t)(v4 + 63) >> 6;
  v47 = a1;
  while (1)
  {
    if (v6)
    {
      v7 = __clz(__rbit64(v6));
      v8 = (v6 - 1) & v6;
      v9 = v7 | (v3 << 6);
    }
    else
    {
      v10 = v3 + 1;
      if (__OFADD__(v3, 1))
      {
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
      if (v10 >= v46)
        return;
      v11 = *(_QWORD *)(v45 + 8 * v10);
      ++v3;
      if (!v11)
      {
        v3 = v10 + 1;
        if (v10 + 1 >= v46)
          return;
        v11 = *(_QWORD *)(v45 + 8 * v3);
        if (!v11)
        {
          v3 = v10 + 2;
          if (v10 + 2 >= v46)
            return;
          v11 = *(_QWORD *)(v45 + 8 * v3);
          if (!v11)
          {
            v3 = v10 + 3;
            if (v10 + 3 >= v46)
              return;
            v11 = *(_QWORD *)(v45 + 8 * v3);
            if (!v11)
            {
              v12 = v10 + 4;
              if (v12 >= v46)
                return;
              v11 = *(_QWORD *)(v45 + 8 * v12);
              if (!v11)
              {
                while (1)
                {
                  v3 = v12 + 1;
                  if (__OFADD__(v12, 1))
                    goto LABEL_86;
                  if (v3 >= v46)
                    return;
                  v11 = *(_QWORD *)(v45 + 8 * v3);
                  ++v12;
                  if (v11)
                    goto LABEL_24;
                }
              }
              v3 = v12;
            }
          }
        }
      }
LABEL_24:
      v8 = (v11 - 1) & v11;
      v9 = __clz(__rbit64(v11)) + (v3 << 6);
    }
    v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v9);
    v14 = *v13;
    v15 = v13[1];
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v17 = sub_23DB8831C(v14, v15);
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
      goto LABEL_75;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v17);
    v50 = v3;
    if ((unint64_t)v20 >> 62)
    {
      swift_bridgeObjectRetain_n();
      v21 = sub_23DB8C574();
      swift_bridgeObjectRelease();
    }
    else
    {
      v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v49 = v8;
    if ((unint64_t)v16 >> 62)
    {
      swift_bridgeObjectRetain();
      v44 = sub_23DB8C574();
      swift_bridgeObjectRelease();
      if (v21 != v44)
        goto LABEL_74;
    }
    else if (v21 != *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_74;
    }
    if (v21)
    {
      v22 = v20 & 0xFFFFFFFFFFFFFF8;
      v23 = (v20 & 0xFFFFFFFFFFFFFF8) + 32;
      if (v20 < 0)
        v22 = v20;
      if ((unint64_t)v20 >> 62)
        v23 = v22;
      v24 = v16 & 0xFFFFFFFFFFFFFF8;
      v25 = (v16 & 0xFFFFFFFFFFFFFF8) + 32;
      if (v16 < 0)
        v24 = v16;
      if ((unint64_t)v16 >> 62)
        v25 = v24;
      if (v23 != v25)
      {
        if (v21 < 0)
          goto LABEL_81;
        v26 = v20 & 0xC000000000000001;
        if ((v20 & 0xC000000000000001) != 0)
        {
          v27 = (id)MEMORY[0x24263C1B4](0, v20);
        }
        else
        {
          if (!*(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_82;
          v27 = *(id *)(v20 + 32);
        }
        v28 = v27;
        v29 = v16 & 0xC000000000000001;
        if ((v16 & 0xC000000000000001) != 0)
        {
          v30 = (id)MEMORY[0x24263C1B4](0, v16);
        }
        else
        {
          if (!*(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_83;
          v30 = *(id *)(v16 + 32);
        }
        v31 = v30;
        sub_23DB8707C(0, (unint64_t *)&unk_256CE8478);
        v32 = sub_23DB8C4A8();

        if ((v32 & 1) == 0)
          goto LABEL_74;
        if (v21 != 1)
          break;
      }
    }
LABEL_6:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = v47;
    v2 = a2;
    v6 = v49;
    v3 = v50;
  }
  if (!v26)
  {
    if (*(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
    {
      v33 = *(id *)(v20 + 40);
      if (!v29)
        goto LABEL_54;
LABEL_51:
      v34 = (id)MEMORY[0x24263C1B4](1, v16);
LABEL_56:
      v35 = v34;
      v36 = sub_23DB8C4A8();

      if ((v36 & 1) == 0)
      {
LABEL_74:
        swift_bridgeObjectRelease();
LABEL_75:
        swift_bridgeObjectRelease();
        return;
      }
      v37 = 2 - v21;
      v38 = 6;
      while (1)
      {
        if (v37 + v38 == 6)
          goto LABEL_6;
        v42 = v38 - 4;
        if (v26)
        {
          v43 = (id)MEMORY[0x24263C1B4](v38 - 4, v20);
          if (v29)
            goto LABEL_58;
        }
        else
        {
          if (v42 >= *(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_79:
            __break(1u);
            goto LABEL_80;
          }
          v43 = *(id *)(v20 + 8 * v38);
          if (v29)
          {
LABEL_58:
            v39 = (id)MEMORY[0x24263C1B4](v38 - 4, v16);
            goto LABEL_59;
          }
        }
        if (v42 >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_79;
        v39 = *(id *)(v16 + 8 * v38);
LABEL_59:
        v40 = v39;
        v41 = sub_23DB8C4A8();

        ++v38;
        if ((v41 & 1) == 0)
          goto LABEL_74;
      }
    }
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  v33 = (id)MEMORY[0x24263C1B4](1, v20);
  if (v29)
    goto LABEL_51;
LABEL_54:
  if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    v34 = *(id *)(v16 + 40);
    goto LABEL_56;
  }
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
}

unint64_t sub_23DB8831C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DB8C604();
  sub_23DB8C340();
  v4 = sub_23DB8C610();
  return sub_23DB88380(a1, a2, v4);
}

unint64_t sub_23DB88380(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23DB8C5B0() & 1) == 0)
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
      while (!v14 && (sub_23DB8C5B0() & 1) == 0);
    }
  }
  return v6;
}

id sub_23DB88460(void *a1)
{
  uint64_t v1;
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v17;
  id v18[4];
  _OWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)sub_23DB8C2F8();
  *(_QWORD *)&v19[0] = 0;
  v18[0] = 0;
  v4 = objc_msgSend(a1, sel_data_forKey_error_, v19, v3, v18);

  v5 = v18[0];
  v6 = *(void **)&v19[0];
  if (!v4)
  {
    v13 = v18[0];
    v14 = v6;
    sub_23DB8C160();

    swift_willThrow();
    return v5;
  }
  if (!*(_QWORD *)&v19[0])
  {
    v15 = v18[0];
    goto LABEL_8;
  }
  v19[0] = xmmword_23DB8E000;
  v7 = v6;
  v8 = v5;
  v9 = v7;
  sub_23DB8C190();

  v10 = *((_QWORD *)&v19[0] + 1);
  if (*((_QWORD *)&v19[0] + 1) >> 60 == 15)
  {
LABEL_8:
    v5 = (id)sub_23DB87B70(MEMORY[0x24BEE4AF8]);

    return v5;
  }
  v11 = *(_QWORD *)&v19[0];
  v5 = (id)sub_23DB8707C(0, &qword_256CE8490);
  sub_23DB89548();
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_23DB8E010;
  *(_QWORD *)(v12 + 32) = sub_23DB8707C(0, &qword_256CE84A8);
  *(_QWORD *)(v12 + 40) = sub_23DB8707C(0, &qword_256CE84B0);
  *(_QWORD *)(v12 + 48) = sub_23DB8707C(0, &qword_256CE84B8);
  *(_QWORD *)(v12 + 56) = sub_23DB8707C(0, (unint64_t *)&unk_256CE8478);
  sub_23DB8C400();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    sub_23DB895D8((uint64_t)v19, (uint64_t)v18);
    if (v18[3])
    {
      sub_23DB8961C(0, &qword_256CE84C0, MEMORY[0x24BEE0460]);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_23DB85DF8(v11, v10);
        v5 = v17;
LABEL_15:
        sub_23DB7F2A4((uint64_t)v19);

        return v5;
      }
    }
    else
    {
      sub_23DB7F2A4((uint64_t)v18);
    }
    v5 = (id)sub_23DB87B70(MEMORY[0x24BEE4AF8]);
    sub_23DB85DF8(v11, v10);
    goto LABEL_15;
  }
  sub_23DB85DF8(v11, v10);

  swift_bridgeObjectRelease();
  return v5;
}

void sub_23DB8873C(void *a1, void *a2, uint64_t a3)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  id v15;
  id v16;
  id v17;
  _OWORD v18[2];
  id v19[5];

  v19[4] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend((id)objc_opt_self(), sel_pluginIdentifier);
  if (!v6)
  {
    sub_23DB8C310();
    v6 = (id)sub_23DB8C2F8();
    swift_bridgeObjectRelease();
  }
  v7 = objc_msgSend(a2, sel_profileExtensionWithIdentifier_, v6);

  if (v7)
  {
    sub_23DB8C4D8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_23DB894AC((uint64_t)v18, (uint64_t)v19);
  if (v19[3])
  {
    sub_23DB8707C(0, &qword_256CE8488);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v8 = objc_msgSend(v17, sel_appAnalyticsUpdateManager);

      if (v8)
      {
        v9 = v8;
        v10 = objc_msgSend(a1, sel_accepted);
        v11 = objc_msgSend(a1, sel_agreement);
        if (!v11)
        {
          sub_23DB8C310();
          v11 = (id)sub_23DB8C2F8();
          swift_bridgeObjectRelease();
        }
        v12 = objc_msgSend(a1, sel_version);
        v13 = objc_msgSend(a1, sel_modificationDate);
        v19[0] = 0;
        v14 = objc_msgSend(v9, sel_setAccepted_agreement_version_modificationDate_transaction_error_, v10, v11, v12, v13, a3, v19);

        if (v14)
        {
          v15 = v19[0];
        }
        else
        {
          v16 = v19[0];
          sub_23DB8C160();

          swift_willThrow();
        }

      }
    }
  }
  else
  {
    sub_23DB7F2A4((uint64_t)v19);
  }
}

void sub_23DB889B4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
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
  unsigned int v39;
  id v40;
  id v41;
  double v42;
  double v43;
  id v44;
  double v45;
  double v46;
  id v47;
  uint64_t v48;
  int64_t v49;
  uint64_t v51;
  unint64_t v52;
  int64_t v53;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  id v64;
  id v65;
  _OWORD v66[2];
  id v67[6];

  v67[4] = *(id *)MEMORY[0x24BDAC8D0];
  v48 = a2 + 64;
  v6 = 1 << *(_BYTE *)(a2 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a2 + 64);
  v49 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  v9 = 0;
  v55 = a1;
  v58 = a3;
  while (1)
  {
    if (v8)
    {
      v10 = __clz(__rbit64(v8));
      v11 = (v8 - 1) & v8;
      v12 = v10 | (v9 << 6);
    }
    else
    {
      v13 = __OFADD__(v9++, 1);
      if (v13)
        goto LABEL_73;
      if (v9 >= v49)
      {
LABEL_70:
        swift_release();
        return;
      }
      v14 = *(_QWORD *)(v48 + 8 * v9);
      if (!v14)
      {
        v15 = v9 + 1;
        if (v9 + 1 >= v49)
          goto LABEL_70;
        v14 = *(_QWORD *)(v48 + 8 * v15);
        if (!v14)
        {
          v15 = v9 + 2;
          if (v9 + 2 >= v49)
            goto LABEL_70;
          v14 = *(_QWORD *)(v48 + 8 * v15);
          if (!v14)
          {
            v15 = v9 + 3;
            if (v9 + 3 >= v49)
              goto LABEL_70;
            v14 = *(_QWORD *)(v48 + 8 * v15);
            if (!v14)
            {
              while (1)
              {
                v9 = v15 + 1;
                if (__OFADD__(v15, 1))
                  goto LABEL_74;
                if (v9 >= v49)
                  goto LABEL_70;
                v14 = *(_QWORD *)(v48 + 8 * v9);
                ++v15;
                if (v14)
                  goto LABEL_17;
              }
            }
          }
        }
        v9 = v15;
      }
LABEL_17:
      v11 = (v14 - 1) & v14;
      v12 = __clz(__rbit64(v14)) + (v9 << 6);
    }
    v53 = v9;
    v16 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v12);
    v17 = v16[1];
    v62 = *v16;
    v18 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v12);
    if (v18 >> 62)
      break;
    v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v52 = v11;
    if (v19)
      goto LABEL_20;
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v8 = v52;
    v9 = v53;
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v19 = sub_23DB8C574();
  swift_bridgeObjectRelease();
  v52 = v11;
  if (!v19)
    goto LABEL_4;
LABEL_20:
  v20 = 0;
  v63 = v18 & 0xC000000000000001;
  v56 = v18 + 32;
  v57 = v18 & 0xFFFFFFFFFFFFFF8;
  v60 = v18;
  v61 = v17;
  v59 = v19;
  while (1)
  {
    if (v63)
    {
      v21 = (id)MEMORY[0x24263C1B4](v20, v18);
    }
    else
    {
      if (v20 >= *(_QWORD *)(v57 + 16))
        goto LABEL_72;
      v21 = *(id *)(v56 + 8 * v20);
    }
    v64 = v21;
    v13 = __OFADD__(v20++, 1);
    if (v13)
    {
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
    }
    if (*(_QWORD *)(a1 + 16))
      break;
LABEL_42:
    v31 = objc_msgSend((id)objc_opt_self(), sel_pluginIdentifier);
    if (!v31)
    {
      sub_23DB8C310();
      v31 = (id)sub_23DB8C2F8();
      swift_bridgeObjectRelease();
    }
    v32 = objc_msgSend(a3, sel_profileExtensionWithIdentifier_, v31);

    if (v32)
    {
      sub_23DB8C4D8();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v66, 0, sizeof(v66));
    }
    sub_23DB894AC((uint64_t)v66, (uint64_t)v67);
    if (!v67[3])
    {
      sub_23DB7F2A4((uint64_t)v67);
      goto LABEL_22;
    }
    sub_23DB8707C(0, &qword_256CE8488);
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_22;
    v33 = objc_msgSend(v65, sel_appAnalyticsUpdateManager);

    if (!v33)
      goto LABEL_22;
    v34 = v33;
    v35 = objc_msgSend(v64, sel_accepted);
    v36 = objc_msgSend(v64, sel_agreement);
    if (!v36)
    {
      sub_23DB8C310();
      v36 = (id)sub_23DB8C2F8();
      swift_bridgeObjectRelease();
    }
    v37 = objc_msgSend(v64, sel_version);
    v38 = objc_msgSend(v64, sel_modificationDate);
    v67[0] = 0;
    v39 = objc_msgSend(v34, sel_setAccepted_agreement_version_modificationDate_transaction_error_, v35, v36, v37, v38, a4, v67);

    if (!v39)
    {
      v47 = v67[0];
      sub_23DB8C160();

      swift_willThrow();
      v28 = v64;
      goto LABEL_69;
    }
    v40 = v67[0];

    v18 = v60;
    v17 = v61;
    a3 = v58;
    v19 = v59;

LABEL_23:
    if (v20 == v19)
      goto LABEL_4;
  }
  swift_bridgeObjectRetain();
  v22 = sub_23DB8831C(v62, v17);
  if ((v23 & 1) == 0)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!(v24 >> 62))
  {
    v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v25)
      goto LABEL_33;
    goto LABEL_40;
  }
  swift_bridgeObjectRetain();
  v25 = sub_23DB8C574();
  if (!v25)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    a3 = v58;
    v19 = v59;
    a1 = v55;
    v18 = v60;
    v17 = v61;
    goto LABEL_41;
  }
LABEL_33:
  v26 = 4;
  while (1)
  {
    if ((v24 & 0xC000000000000001) != 0)
      v27 = (id)MEMORY[0x24263C1B4](v26 - 4, v24);
    else
      v27 = *(id *)(v24 + 8 * v26);
    v28 = v27;
    v29 = v26 - 3;
    if (__OFADD__(v26 - 4, 1))
    {
      __break(1u);
      goto LABEL_68;
    }
    v30 = objc_msgSend(v27, sel_version);
    if (v30 == objc_msgSend(v64, sel_version))
      break;

    ++v26;
    if (v29 == v25)
      goto LABEL_40;
  }
  swift_bridgeObjectRelease_n();
  v41 = objc_msgSend(v64, sel_modificationDate);
  objc_msgSend(v41, sel_timeIntervalSinceReferenceDate);
  v43 = v42;

  v44 = objc_msgSend(v28, sel_modificationDate);
  objc_msgSend(v44, sel_timeIntervalSinceReferenceDate);
  v46 = v45;

  if (v46 >= v43)
  {

    a3 = v58;
    v19 = v59;
    a1 = v55;
    v18 = v60;
    v17 = v61;
LABEL_22:

    goto LABEL_23;
  }
  a3 = v58;
  sub_23DB8873C(v64, v58, a4);
  a1 = v55;
  v17 = v61;
  v19 = v59;
  if (!v51)
  {

    v18 = v60;
    goto LABEL_22;
  }
LABEL_68:
  v34 = v64;
LABEL_69:
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

void sub_23DB890A8(void *a1, id a2, uint64_t a3)
{
  uint64_t v3;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  char v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  char v24;
  char v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  unsigned int v35;
  id v36;
  void *v37;
  id v38;
  id v39[2];

  v39[1] = *(id *)MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(a2, sel_profileIdentifier);
  v8 = objc_msgSend(v7, sel_type);

  if (v8 != (id)1)
    return;
  v9 = sub_23DB88460(a1);
  if (v3)
    return;
  v10 = (uint64_t)v9;
  v11 = (void *)objc_opt_self();
  v39[0] = 0;
  v12 = objc_msgSend(v11, sel_allAcceptancesInTransaction_error_, a3, v39);
  v13 = v39[0];
  if (!v12)
    goto LABEL_8;
  v14 = v12;
  sub_23DB89448();
  v15 = sub_23DB8C2D4();
  v16 = v13;

  sub_23DB87E38(v10, v15);
  if ((v17 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    swift_bridgeObjectRelease();
    return;
  }
  sub_23DB889B4(v15, v10, a2, a3);
  swift_bridgeObjectRelease();
  v39[0] = 0;
  v19 = objc_msgSend(v11, sel_allAcceptancesInTransaction_error_, a3, v39);
  v20 = v39[0];
  if (!v19)
  {
LABEL_8:
    v18 = v39[0];
    swift_bridgeObjectRelease();
    sub_23DB8C160();

LABEL_9:
    swift_willThrow();
    return;
  }
  v21 = v19;
  v22 = sub_23DB8C2D4();
  v23 = v20;

  sub_23DB87E38(v22, v10);
  v25 = v24;
  swift_bridgeObjectRelease();
  if ((v25 & 1) != 0)
    goto LABEL_7;
  v26 = (void *)objc_opt_self();
  v27 = (void *)sub_23DB8C2C8();
  swift_bridgeObjectRelease();
  v39[0] = 0;
  v28 = objc_msgSend(v26, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v27, 1, v39);

  v29 = v39[0];
  if (!v28)
  {
    v37 = v29;
    sub_23DB8C160();

    goto LABEL_9;
  }
  v30 = sub_23DB8C19C();
  v32 = v31;

  v33 = (void *)sub_23DB8C184();
  v34 = (void *)sub_23DB8C2F8();
  v39[0] = 0;
  v35 = objc_msgSend(a1, sel_setData_forKey_error_, v33, v34, v39);

  if (v35)
  {
    v36 = v39[0];
  }
  else
  {
    v38 = v39[0];
    sub_23DB8C160();

    swift_willThrow();
  }
  sub_23DB85E0C(v30, v32);
}

uint64_t type metadata accessor for AppAnalyticsAcceptanceStateSyncEntity()
{
  return objc_opt_self();
}

void sub_23DB89448()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CE8470)
  {
    sub_23DB8707C(255, (unint64_t *)&unk_256CE8478);
    v0 = sub_23DB8C388();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CE8470);
  }
}

uint64_t sub_23DB894AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DB894F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23DB894F0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25431DC70)
  {
    v0 = sub_23DB8C4B4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25431DC70);
  }
}

void sub_23DB89548()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CE8498)
  {
    sub_23DB8959C();
    v0 = sub_23DB8C5A4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CE8498);
  }
}

unint64_t sub_23DB8959C()
{
  unint64_t result;

  result = qword_256CE84A0;
  if (!qword_256CE84A0)
  {
    result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_256CE84A0);
  }
  return result;
}

uint64_t sub_23DB895D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DB894F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_23DB8961C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, _QWORD, uint64_t, _QWORD))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_23DB89448();
    v7 = a3(a1, MEMORY[0x24BEE0D00], v6, MEMORY[0x24BEE0D10]);
    if (!v8)
      atomic_store(v7, a2);
  }
}

id sub_23DB89684()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  sub_23DB89708();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_256CE8790 = (uint64_t)result;
  return result;
}

void sub_23DB896D8()
{
  qword_256CE8798 = 0x617A696C61636F4CLL;
  unk_256CE87A0 = 0xEF74636944656C62;
}

unint64_t sub_23DB89708()
{
  unint64_t result;

  result = qword_256CE84D0;
  if (!qword_256CE84D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CE84D0);
  }
  return result;
}

unint64_t static SummaryPinnedContentStateSyncEntity.syncEntityDomain.getter()
{
  return 0xD000000000000024;
}

void sub_23DB89764()
{
  void *v0;
  void *v1;
  id v2;

  sub_23DB8A51C((uint64_t)&unk_250E7E788);
  swift_arrayDestroy();
  v0 = (void *)sub_23DB8C2F8();
  v1 = (void *)sub_23DB8C394();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend((id)objc_opt_self(), sel_schemaWithDomain_dataKeys_, v0, v1);

  qword_25431DAF0 = (uint64_t)v2;
}

id static SummaryPinnedContentStateSyncEntity.stateEntitySchema.getter()
{
  if (qword_25431DAF8 != -1)
    swift_once();
  return (id)qword_25431DAF0;
}

uint64_t static SummaryPinnedContentStateSyncEntity.SyncSchemaVersion.v1.getter()
{
  return 1;
}

id static SummaryPinnedContentStateSyncEntity.updateData(withStateStorage:profile:transaction:)(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_23DB8A710(a1, a2, a3);
}

uint64_t static SummaryPinnedContentStateSyncEntity.syncDidFinish(with:stateStore:profile:)(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_23DB8A838(a1, a3);
}

id SummaryPinnedContentStateSyncEntity.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SummaryPinnedContentStateSyncEntity.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SummaryPinnedContentStateSyncEntity();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SummaryPinnedContentStateSyncEntity.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SummaryPinnedContentStateSyncEntity();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23DB89AAC(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_23DB8C604();
  swift_bridgeObjectRetain();
  sub_23DB8C340();
  v8 = sub_23DB8C610();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23DB8C5B0() & 1) != 0)
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
      if (v19 || (sub_23DB8C5B0() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23DB89F30(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23DB89C58()
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
  sub_23DB8AEC8();
  v3 = sub_23DB8C4F0();
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
      sub_23DB8C604();
      sub_23DB8C340();
      result = sub_23DB8C610();
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

uint64_t sub_23DB89F30(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_23DB89C58();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23DB8A0C8();
      goto LABEL_22;
    }
    sub_23DB8A274();
  }
  v11 = *v4;
  sub_23DB8C604();
  sub_23DB8C340();
  result = sub_23DB8C610();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23DB8C5B0(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23DB8C5C8();
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
          result = sub_23DB8C5B0();
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

void *sub_23DB8A0C8()
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
  sub_23DB8AEC8();
  v2 = *v0;
  v3 = sub_23DB8C4E4();
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

uint64_t sub_23DB8A274()
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
  sub_23DB8AEC8();
  v3 = sub_23DB8C4F0();
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
    sub_23DB8C604();
    swift_bridgeObjectRetain();
    sub_23DB8C340();
    result = sub_23DB8C610();
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

uint64_t sub_23DB8A51C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_23DB8C3A0();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_23DB89AAC(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_23DB8A5B0(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];

  v4 = sub_23DB8C2BC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v15 - v9;
  sub_23DB8C2A4();
  type metadata accessor for PinnedContentDaemonStore();
  v11 = swift_allocObject();
  swift_retain();
  v12 = sub_23DB8222C(a1, a2, v11);
  objc_allocWithZone((Class)type metadata accessor for PinnedContentSyncStateUpdaterDelegate());
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  v15[1] = v12;
  v13 = sub_23DB8C1E4();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return v13;
}

id sub_23DB8A710(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v11;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_opt_self();
  type metadata accessor for PinnedContentDarwinNotificationPoster();
  v7 = swift_allocObject();
  v8 = a2;
  v9 = (void *)sub_23DB8A5B0(v8, v7);

  swift_release();
  v12[0] = 0;
  LODWORD(a1) = objc_msgSend(v6, sel_updateDataWithStateStore_delegate_profile_transaction_error_, a1, v9, v8, a3, v12);

  if ((_DWORD)a1)
    return v12[0];
  v11 = v12[0];
  sub_23DB8C160();

  return (id)swift_willThrow();
}

uint64_t sub_23DB8A838(uint64_t a1, void *a2)
{
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
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(char *, uint64_t);
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v4 = sub_23DB8C2BC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v49 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v49 - v12;
  if (a1 == 1)
  {
    sub_23DB8C2A4();
    v25 = a2;
    v26 = sub_23DB8C2B0();
    v27 = sub_23DB8C3C4();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = swift_slowAlloc();
      v29 = swift_slowAlloc();
      v52 = v5;
      v30 = (_QWORD *)v29;
      v31 = swift_slowAlloc();
      v54 = v31;
      *(_DWORD *)v28 = 136315394;
      v51 = v4;
      v32 = sub_23DB8C61C();
      v53 = sub_23DB81BD8(v32, v33, &v54);
      sub_23DB8C4C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2112;
      v34 = objc_msgSend(v25, sel_profileIdentifier);
      v53 = (uint64_t)v34;
      sub_23DB8C4C0();
      *v30 = v34;

      _os_log_impl(&dword_23DB70000, v26, v27, "[%s]_%@: Unable to sync", (uint8_t *)v28, 0x16u);
      sub_23DB86ED4();
      swift_arrayDestroy();
      MEMORY[0x24263C8D4](v30, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24263C8D4](v31, -1, -1);
      MEMORY[0x24263C8D4](v28, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v11, v51);
    }

    v47 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    v48 = v11;
  }
  else if (a1)
  {
    sub_23DB8C2A4();
    v35 = a2;
    v36 = sub_23DB8C2B0();
    v37 = sub_23DB8C3C4();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = swift_slowAlloc();
      v39 = swift_slowAlloc();
      v52 = v5;
      v40 = (_QWORD *)v39;
      v50 = swift_slowAlloc();
      v54 = v50;
      *(_DWORD *)v38 = 136315650;
      v51 = v4;
      v41 = sub_23DB8C61C();
      v53 = sub_23DB81BD8(v41, v42, &v54);
      sub_23DB8C4C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 12) = 2112;
      v43 = objc_msgSend(v35, sel_profileIdentifier);
      v53 = (uint64_t)v43;
      sub_23DB8C4C0();
      *v40 = v43;

      *(_WORD *)(v38 + 22) = 2080;
      v53 = a1;
      type metadata accessor for HDCloudSyncStateResult(0);
      v44 = sub_23DB8C328();
      v53 = sub_23DB81BD8(v44, v45, &v54);
      sub_23DB8C4C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DB70000, v36, v37, "[%s]_%@: Unknown sync result: %s", (uint8_t *)v38, 0x20u);
      sub_23DB86ED4();
      swift_arrayDestroy();
      MEMORY[0x24263C8D4](v40, -1, -1);
      v46 = v50;
      swift_arrayDestroy();
      MEMORY[0x24263C8D4](v46, -1, -1);
      MEMORY[0x24263C8D4](v38, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v8, v51);
    }

    v47 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    v48 = v8;
  }
  else
  {
    sub_23DB8C2A4();
    v14 = a2;
    v15 = sub_23DB8C2B0();
    v16 = sub_23DB8C3D0();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v18 = swift_slowAlloc();
      v52 = v5;
      v19 = (_QWORD *)v18;
      v20 = swift_slowAlloc();
      v54 = v20;
      *(_DWORD *)v17 = 136315394;
      v21 = sub_23DB8C61C();
      v53 = sub_23DB81BD8(v21, v22, &v54);
      v51 = v4;
      sub_23DB8C4C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2112;
      v23 = objc_msgSend(v14, sel_profileIdentifier);
      v53 = (uint64_t)v23;
      sub_23DB8C4C0();
      *v19 = v23;

      _os_log_impl(&dword_23DB70000, v15, v16, "[%s]_%@: Sync complete!", (uint8_t *)v17, 0x16u);
      sub_23DB86ED4();
      swift_arrayDestroy();
      MEMORY[0x24263C8D4](v19, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24263C8D4](v20, -1, -1);
      MEMORY[0x24263C8D4](v17, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v13, v51);
    }

    v47 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    v48 = v13;
  }
  return v47(v48, v4);
}

uint64_t type metadata accessor for SummaryPinnedContentStateSyncEntity()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for SummaryPinnedContentStateSyncEntity.SyncSchemaVersion()
{
  return &type metadata for SummaryPinnedContentStateSyncEntity.SyncSchemaVersion;
}

void sub_23DB8AEC8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CE84E0)
  {
    v0 = sub_23DB8C4FC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CE84E0);
  }
}

uint64_t sub_23DB8AF24()
{
  return sub_23DB8C214();
}

void sub_23DB8AFC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_23DB8C154();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t sub_23DB8B010()
{
  return sub_23DB8C208();
}

uint64_t sub_23DB8B0B0()
{
  return sub_23DB8C1FC();
}

uint64_t sub_23DB8B150()
{
  return sub_23DB8C1F0();
}

id HealthAppHealthDaemonOrchestrationClient.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id HealthAppHealthDaemonOrchestrationClient.init()()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  objc_super v5;

  v1 = OBJC_IVAR____TtC21HealthAppHealthDaemon40HealthAppHealthDaemonOrchestrationClient_connection;
  v2 = objc_allocWithZone((Class)sub_23DB8C220());
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, sel_init);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for HealthAppHealthDaemonOrchestrationClient();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for HealthAppHealthDaemonOrchestrationClient()
{
  return objc_opt_self();
}

id HealthAppHealthDaemonOrchestrationClient.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthAppHealthDaemonOrchestrationClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for HealthAppHealthDaemonOrchestrationClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthAppHealthDaemonOrchestrationClient.requestBackgroundGenerationForFeedItemsAfterUnlock(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of HealthAppHealthDaemonOrchestrationClient.requestBackgroundGenerationForAllModelsAfterUnlock(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of HealthAppHealthDaemonOrchestrationClient.runOrRequestBackgroundGeneration(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of HealthAppHealthDaemonOrchestrationClient.runBackgroundGeneration(plugins:commitAsUrgent:generationType:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t sub_23DB8B430()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_23DB8B454(uint64_t a1)
{
  uint64_t v1;

  sub_23DB8AFC4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_23DB8C0AC()
{
  return MEMORY[0x24BE3F5F8]();
}

uint64_t sub_23DB8C0B8()
{
  return MEMORY[0x24BE3F600]();
}

uint64_t sub_23DB8C0C4()
{
  return MEMORY[0x24BE3F608]();
}

uint64_t sub_23DB8C0D0()
{
  return MEMORY[0x24BE3F610]();
}

uint64_t sub_23DB8C0DC()
{
  return MEMORY[0x24BE3F620]();
}

uint64_t sub_23DB8C0E8()
{
  return MEMORY[0x24BE3F628]();
}

uint64_t sub_23DB8C0F4()
{
  return MEMORY[0x24BE3F630]();
}

uint64_t sub_23DB8C100()
{
  return MEMORY[0x24BE3F638]();
}

uint64_t sub_23DB8C10C()
{
  return MEMORY[0x24BE3F640]();
}

uint64_t sub_23DB8C118()
{
  return MEMORY[0x24BE3F648]();
}

uint64_t sub_23DB8C124()
{
  return MEMORY[0x24BE3F650]();
}

uint64_t sub_23DB8C130()
{
  return MEMORY[0x24BE3F658]();
}

uint64_t sub_23DB8C13C()
{
  return MEMORY[0x24BE3F670]();
}

uint64_t sub_23DB8C148()
{
  return MEMORY[0x24BE3F678]();
}

uint64_t sub_23DB8C154()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23DB8C160()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23DB8C16C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23DB8C178()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23DB8C184()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23DB8C190()
{
  return MEMORY[0x24BDCDCD8]();
}

uint64_t sub_23DB8C19C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23DB8C1A8()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_23DB8C1B4()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23DB8C1C0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23DB8C1CC()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_23DB8C1D8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23DB8C1E4()
{
  return MEMORY[0x24BE407D8]();
}

uint64_t sub_23DB8C1F0()
{
  return MEMORY[0x24BE3F6E8]();
}

uint64_t sub_23DB8C1FC()
{
  return MEMORY[0x24BE3F6F0]();
}

uint64_t sub_23DB8C208()
{
  return MEMORY[0x24BE3F6F8]();
}

uint64_t sub_23DB8C214()
{
  return MEMORY[0x24BE3F700]();
}

uint64_t sub_23DB8C220()
{
  return MEMORY[0x24BE3F708]();
}

uint64_t sub_23DB8C22C()
{
  return MEMORY[0x24BE3F768]();
}

uint64_t sub_23DB8C238()
{
  return MEMORY[0x24BE3F770]();
}

uint64_t sub_23DB8C244()
{
  return MEMORY[0x24BE3F778]();
}

uint64_t sub_23DB8C250()
{
  return MEMORY[0x24BE3F780]();
}

uint64_t sub_23DB8C25C()
{
  return MEMORY[0x24BE3F788]();
}

uint64_t sub_23DB8C268()
{
  return MEMORY[0x24BE3F790]();
}

uint64_t sub_23DB8C274()
{
  return MEMORY[0x24BE3F798]();
}

uint64_t sub_23DB8C280()
{
  return MEMORY[0x24BE3F7A0]();
}

uint64_t sub_23DB8C28C()
{
  return MEMORY[0x24BE3F7B0]();
}

uint64_t sub_23DB8C298()
{
  return MEMORY[0x24BE3F7B8]();
}

uint64_t sub_23DB8C2A4()
{
  return MEMORY[0x24BE3F680]();
}

uint64_t sub_23DB8C2B0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23DB8C2BC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23DB8C2C8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23DB8C2D4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23DB8C2E0()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_23DB8C2EC()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_23DB8C2F8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23DB8C304()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_23DB8C310()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23DB8C31C()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_23DB8C328()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23DB8C334()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_23DB8C340()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23DB8C34C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23DB8C358()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23DB8C364()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23DB8C370()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23DB8C37C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23DB8C388()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23DB8C394()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23DB8C3A0()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23DB8C3AC()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_23DB8C3B8()
{
  return MEMORY[0x24BDD24F8]();
}

uint64_t sub_23DB8C3C4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23DB8C3D0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23DB8C3DC()
{
  return MEMORY[0x24BDD2530]();
}

uint64_t sub_23DB8C3E8()
{
  return MEMORY[0x24BE407E8]();
}

uint64_t sub_23DB8C3F4()
{
  return MEMORY[0x24BE407F0]();
}

uint64_t sub_23DB8C400()
{
  return MEMORY[0x24BDCFFB8]();
}

uint64_t sub_23DB8C40C()
{
  return MEMORY[0x24BDD2630]();
}

uint64_t sub_23DB8C418()
{
  return MEMORY[0x24BE3F688]();
}

uint64_t sub_23DB8C424()
{
  return MEMORY[0x24BE3F690]();
}

uint64_t sub_23DB8C430()
{
  return MEMORY[0x24BE3F698]();
}

uint64_t sub_23DB8C43C()
{
  return MEMORY[0x24BE3F6A0]();
}

uint64_t sub_23DB8C448()
{
  return MEMORY[0x24BE3F6A8]();
}

uint64_t sub_23DB8C454()
{
  return MEMORY[0x24BE3F6B0]();
}

uint64_t sub_23DB8C460()
{
  return MEMORY[0x24BE3F6B8]();
}

uint64_t sub_23DB8C46C()
{
  return MEMORY[0x24BE3F6C0]();
}

uint64_t sub_23DB8C478()
{
  return MEMORY[0x24BE3F6C8]();
}

uint64_t sub_23DB8C484()
{
  return MEMORY[0x24BE3F6D0]();
}

uint64_t sub_23DB8C490()
{
  return MEMORY[0x24BE3F6D8]();
}

uint64_t sub_23DB8C49C()
{
  return MEMORY[0x24BE3F6E0]();
}

uint64_t sub_23DB8C4A8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23DB8C4B4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23DB8C4C0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23DB8C4CC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23DB8C4D8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23DB8C4E4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23DB8C4F0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23DB8C4FC()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_23DB8C508()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23DB8C514()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23DB8C520()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23DB8C52C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23DB8C538()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23DB8C544()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23DB8C550()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23DB8C55C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23DB8C568()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23DB8C574()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23DB8C580()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23DB8C58C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23DB8C598()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23DB8C5A4()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_23DB8C5B0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23DB8C5BC()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_23DB8C5C8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23DB8C5D4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23DB8C5E0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23DB8C5EC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23DB8C5F8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23DB8C604()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23DB8C610()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23DB8C61C()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AllHealthAppAnalyticsAgreements()
{
  return MEMORY[0x24BE3F7E8]();
}

uint64_t HDEntityCategoryForKeyValueCategory()
{
  return MEMORY[0x24BE40888]();
}

uint64_t HDSQLiteBindFoundationValueToStatement()
{
  return MEMORY[0x24BE40D68]();
}

uint64_t HDSQLiteColumnAsBoolean()
{
  return MEMORY[0x24BE40D90]();
}

uint64_t HDSQLiteColumnAsDouble()
{
  return MEMORY[0x24BE40DA0]();
}

uint64_t HDSQLiteColumnAsInt64()
{
  return MEMORY[0x24BE40DA8]();
}

uint64_t HDSQLiteColumnAsString()
{
  return MEMORY[0x24BE40DB8]();
}

uint64_t HKAnalyticsPropertyValueForBiologicalSex()
{
  return MEMORY[0x24BDD27F0]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x24BDD2B20]();
}

uint64_t HKCreateSerialUtilityDispatchQueue()
{
  return MEMORY[0x24BDD2B30]();
}

uint64_t HKCurrentOptInVersionOnDiskForOnBoardingBundle()
{
  return MEMORY[0x24BDD2B38]();
}

uint64_t HKHealthKitFrameworkBundle()
{
  return MEMORY[0x24BDD2F18]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x24BDD3730]();
}

uint64_t MobileInstallationWaitForSystemAppMigrationWithCompletion()
{
  return MEMORY[0x24BE67110]();
}

uint64_t NSStringFromHKNotificationInstructionAction()
{
  return MEMORY[0x24BDD38B8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
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

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x24BDD4338]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x24BDD4340]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
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

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x24BEDDF60](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x24BEE4D20]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}


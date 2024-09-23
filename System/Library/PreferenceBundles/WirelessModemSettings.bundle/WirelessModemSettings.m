void sub_22FE398E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WMSLogComponent()
{
  if (WMSLogComponent_onceToken != -1)
    dispatch_once(&WMSLogComponent_onceToken, &__block_literal_global);
  return (id)WMSLogComponent_component;
}

id WMSGetCurrentDeviceName()
{
  void *v0;
  void *v1;

  MGGetStringAnswer();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "model");
    v0 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v0;
}

id WMSUIEventDictionary(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v8 = CFSTR("type");
    v9[0] = a1;
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = a1;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    a1 = (void *)objc_msgSend(v6, "mutableCopy");
    if (v3)
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v3, CFSTR("value"));
  }

  return a1;
}

void WMSubmitUIEventMetric(void *a1)
{
  void *v1;
  NSObject *v2;
  NSObject *v3;
  void *v4;

  if (a1)
  {
    v1 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v1, "setObject:forKeyedSubscript:", CFSTR("phsettings"), CFSTR("process"));
    WMSLogComponent();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      WMSubmitUIEventMetric_cold_2((uint64_t)v1, v2);

    v4 = v1;
    v3 = v1;
    AnalyticsSendEventLazy();

  }
  else
  {
    WMSLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      WMSubmitUIEventMetric_cold_1(v3);
  }

}

uint64_t _CompareUsages(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(a1, "propertyForKey:", CFSTR("ClientUsageBytes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("ClientUsageBytes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "compare:", v5);
  return v6;
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_22FE3C89C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FE3D1C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _wiFiDevicePowerCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__wiFiPowerChangedHandler, 0, 0);
}

void sub_22FE3E02C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22FE406B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location)
{
  id *v15;
  uint64_t v16;

  objc_destroyWeak(v15);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v16 - 120));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void __SCDynamicStoreCallback(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;

  v4 = (void *)MEMORY[0x2348AE738]();
  objc_msgSend(a3, "sendStateUpdate");
  objc_autoreleasePoolPop(v4);
}

uint64_t cellDataChangedNotification(uint64_t a1, void *a2)
{
  NSObject *v3;

  WMSLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    cellDataChangedNotification_cold_1();

  return objc_msgSend(a2, "authenticate");
}

uint64_t sub_22FE44E0C()
{
  return sub_22FE481DC();
}

void sub_22FE44E2C(void *a1, uint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t inited;
  void **v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  _QWORD v46[2];
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t aBlock[17];

  v6 = sub_22FE481A0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22FE481B8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend(a1, sel_specifier);
  if (v14)
  {
    v15 = v14;
    v16 = objc_msgSend(v14, sel_target);

    if (v16)
    {
      objc_opt_self();
      v17 = (void *)swift_dynamicCastObjCClass();
      if (v17)
      {
        v47 = objc_msgSend(v17, sel_navigationItem);
        v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
        v50 = v11;
        v19 = v18;
        v20 = objc_opt_self();
        v46[1] = a2;
        v21 = (void *)v20;
        v22 = (void *)sub_22FE481DC();
        v23 = objc_msgSend(v21, sel_preferredFontForTextStyle_, v22);

        objc_msgSend(v19, sel_setFont_, v23);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255E4D940);
        inited = swift_initStackObject();
        v25 = (void **)MEMORY[0x24BEBB368];
        *(_OWORD *)(inited + 16) = xmmword_22FE492F0;
        v48 = v7;
        v26 = *v25;
        *(_QWORD *)(inited + 32) = *v25;
        v27 = objc_opt_self();
        v49 = v10;
        v28 = (void *)v27;
        v51 = v19;
        swift_bridgeObjectRetain();
        v29 = v26;
        v30 = objc_msgSend(v28, sel_labelColor);
        v31 = objc_msgSend(v30, sel_colorWithAlphaComponent_, a3);

        *(_QWORD *)(inited + 64) = sub_22FE46F38(0, &qword_255E4D948);
        *(_QWORD *)(inited + 40) = v31;
        sub_22FE454D8(inited, &qword_255E4D978, &qword_255E4D980, (uint64_t (*)(uint64_t))sub_22FE46734);
        v32 = objc_allocWithZone(MEMORY[0x24BDD1458]);
        v33 = (void *)sub_22FE481DC();
        swift_bridgeObjectRelease();
        type metadata accessor for Key(0);
        sub_22FE46EF8(&qword_255E4D950, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22FE495F4);
        v34 = (void *)sub_22FE481D0();
        swift_bridgeObjectRelease();
        v35 = objc_msgSend(v32, sel_initWithString_attributes_, v33, v34);

        v36 = v51;
        -[NSObject setAttributedText:](v51, sel_setAttributedText_, v35);

        sub_22FE46F38(0, &qword_255E4D958);
        v37 = (void *)sub_22FE4823C();
        v38 = swift_allocObject();
        v39 = v47;
        *(_QWORD *)(v38 + 16) = v47;
        *(_QWORD *)(v38 + 24) = v36;
        aBlock[4] = (uint64_t)sub_22FE46F9C;
        aBlock[5] = v38;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_22FE45600;
        aBlock[3] = (uint64_t)&block_descriptor;
        v40 = _Block_copy(aBlock);
        v41 = v39;
        swift_release();
        sub_22FE481AC();
        aBlock[0] = MEMORY[0x24BEE4AF8];
        sub_22FE46EF8(&qword_255E4D960, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255E4D968);
        sub_22FE46FC4(&qword_255E4D970, &qword_255E4D968, MEMORY[0x24BEE12C8]);
        sub_22FE4826C();
        MEMORY[0x2348AE30C](0, v13, v9, v40);

        _Block_release(v40);
        swift_unknownObjectRelease();

        (*(void (**)(char *, uint64_t))(v48 + 8))(v9, v6);
        (*(void (**)(char *, uint64_t))(v50 + 8))(v13, v49);
        return;
      }
      swift_unknownObjectRelease();
    }
  }
  if (qword_255E4D9E0 != -1)
    swift_once();
  v42 = sub_22FE48170();
  __swift_project_value_buffer(v42, (uint64_t)qword_255E4DFF0);
  v51 = sub_22FE48158();
  v43 = sub_22FE48224();
  if (os_log_type_enabled(v51, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc();
    v45 = swift_slowAlloc();
    aBlock[0] = v45;
    *(_DWORD *)v44 = 136315138;
    aBlock[15] = sub_22FE460F4(0xD00000000000001ALL, 0x800000022FE4A6E0, aBlock);
    sub_22FE48254();
    _os_log_impl(&dword_22FE37000, v51, v43, "%s: failed to get list controller for placard cell", v44, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348AEA8C](v45, -1, -1);
    MEMORY[0x2348AEA8C](v44, -1, -1);
  }

}

uint64_t sub_22FE45490()
{
  uint64_t v0;

  if (qword_255E4D9E0 != -1)
    swift_once();
  v0 = sub_22FE48170();
  return __swift_project_value_buffer(v0, (uint64_t)qword_255E4DFF0);
}

unint64_t sub_22FE454D8(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  char v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;

  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = sub_22FE4829C();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = v7 + 64;
  v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_22FE47004(v11, (uint64_t)&v18, a3);
    v12 = v18;
    result = a4(v18);
    if ((v14 & 1) != 0)
      break;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v8[6] + 8 * result) = v12;
    result = (unint64_t)sub_22FE46E90(&v19, (_OWORD *)(v8[7] + 32 * result));
    v15 = v8[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
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

uint64_t sub_22FE45600(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_22FE4562C()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v1 = (void *)sub_22FE4814C();
  sub_22FE454D8(MEMORY[0x24BEE4AF8], &qword_255E4D930, &qword_255E4D938, (uint64_t (*)(uint64_t))sub_22FE46734);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_22FE46EF8(&qword_255E4D928, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22FE49638);
  v2 = (id)sub_22FE481D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_openURL_options_completionHandler_, v1, v2, 0);

}

id sub_22FE45770(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_class *v4;
  objc_class *v5;
  void *v8;
  id v9;

  v5 = v4;
  if (a3)
  {
    v8 = (void *)sub_22FE481DC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(objc_allocWithZone(v5), sel_initWithStyle_reuseIdentifier_specifier_, a1, v8, a4);

  return v9;
}

id sub_22FE457FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  objc_class *ObjectType;
  void *v10;
  id v11;
  id v12;
  objc_super v14;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v10 = (void *)sub_22FE481DC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  v12 = v11;
  if (v12)

  return v12;
}

id sub_22FE4591C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a3)
  {
    v6 = (void *)sub_22FE481DC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id sub_22FE45994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  objc_class *ObjectType;
  void *v7;
  id v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v7 = (void *)sub_22FE481DC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = ObjectType;
  v8 = objc_msgSendSuper2(&v10, sel_initWithStyle_reuseIdentifier_, a1, v7);

  return v8;
}

id sub_22FE45AB4(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id sub_22FE45AF4(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_22FE45B88()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22FE45BBC()
{
  uint64_t v0;

  v0 = sub_22FE48170();
  __swift_allocate_value_buffer(v0, qword_255E4DFF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_255E4DFF0);
  return sub_22FE48164();
}

uint64_t sub_22FE45C38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_255E4D9E0 != -1)
    swift_once();
  v2 = sub_22FE48170();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_255E4DFF0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_22FE45CA8(uint64_t a1, uint64_t a2)
{
  return sub_22FE45E04(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_22FE45CC0(uint64_t a1, uint64_t a2)
{
  return sub_22FE45E04(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_22FE45CD4(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_22FE481E8();
  *a2 = 0;
  return result;
}

uint64_t sub_22FE45D48(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_22FE481F4();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_22FE45DC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_22FE48200();
  v2 = sub_22FE481DC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22FE45E04(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_22FE48200();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22FE45E40()
{
  sub_22FE48200();
  sub_22FE4820C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22FE45E80()
{
  uint64_t v0;

  sub_22FE48200();
  sub_22FE482CC();
  sub_22FE4820C();
  v0 = sub_22FE482D8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22FE45EF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_22FE48200();
  v2 = v1;
  if (v0 == sub_22FE48200() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_22FE482C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_22FE45F80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_22FE48200();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22FE45FA8()
{
  sub_22FE46EF8(&qword_255E4D950, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22FE495F4);
  sub_22FE46EF8(&qword_255E4D9D0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22FE49548);
  return sub_22FE482B4();
}

uint64_t sub_22FE4602C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_22FE481DC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22FE46070()
{
  sub_22FE46EF8(&qword_255E4D928, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22FE49638);
  sub_22FE46EF8(&qword_255E4D9D8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22FE49428);
  return sub_22FE482B4();
}

uint64_t sub_22FE460F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_22FE461C4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22FE47068((uint64_t)v12, *a3);
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
      sub_22FE47068((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_22FE461C4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_22FE48260();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_22FE4637C(a5, a6);
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
  v8 = sub_22FE48284();
  if (!v8)
  {
    sub_22FE48290();
    __break(1u);
LABEL_17:
    result = sub_22FE482A8();
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

uint64_t sub_22FE4637C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_22FE46410(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_22FE465E8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_22FE465E8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22FE46410(uint64_t a1, unint64_t a2)
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
      v3 = sub_22FE46584(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_22FE48278();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_22FE48290();
      __break(1u);
LABEL_10:
      v2 = sub_22FE48218();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_22FE482A8();
    __break(1u);
LABEL_14:
    result = sub_22FE48290();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_22FE46584(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E4D988);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22FE465E8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E4D988);
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
  result = sub_22FE482A8();
  __break(1u);
  return result;
}

unint64_t sub_22FE46734(uint64_t a1)
{
  uint64_t v2;

  sub_22FE48200();
  sub_22FE482CC();
  sub_22FE4820C();
  v2 = sub_22FE482D8();
  swift_bridgeObjectRelease();
  return sub_22FE467B4(a1, v2);
}

unint64_t sub_22FE467B4(uint64_t a1, uint64_t a2)
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
    v6 = sub_22FE48200();
    v8 = v7;
    if (v6 == sub_22FE48200() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_22FE482C0();
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
          v13 = sub_22FE48200();
          v15 = v14;
          if (v13 == sub_22FE48200() && v15 == v16)
            break;
          v18 = sub_22FE482C0();
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

uint64_t sub_22FE46928()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t ObjCClassFromMetadata;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void (*v31)(double);
  _QWORD *v32;
  uint64_t v33[5];

  v1 = v0;
  swift_getObjectType();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E4D908);
  v24 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v1, sel_setSelectionStyle_, 0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_bundleForClass_, ObjCClassFromMetadata);
  v8 = (void *)sub_22FE481DC();
  v9 = (void *)sub_22FE481DC();
  v10 = objc_msgSend(v7, sel_localizedStringForKey_value_table_, v8, 0, v9);

  v11 = sub_22FE48200();
  v13 = v12;

  v14 = objc_msgSend(v6, sel_bundleForClass_, ObjCClassFromMetadata);
  v15 = (void *)sub_22FE481DC();
  v16 = (void *)sub_22FE481DC();
  v17 = objc_msgSend(v14, sel_localizedStringForKey_value_table_, v15, 0, v16);

  v18 = sub_22FE48200();
  v20 = v19;

  v21 = (_QWORD *)swift_allocObject();
  v21[2] = v1;
  v21[3] = v11;
  v21[4] = v13;
  v25 = v11;
  v26 = v13;
  v27 = v18;
  v28 = v20;
  v29 = 0xD000000000000027;
  v30 = 0x800000022FE4A690;
  v31 = sub_22FE46D48;
  v32 = v21;
  v1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E4D910);
  sub_22FE46FC4(&qword_255E4D918, &qword_255E4D910, MEMORY[0x24BE855C8]);
  sub_22FE48188();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22FE48194();
  v33[3] = v2;
  v33[4] = sub_22FE46FC4(&qword_255E4D920, &qword_255E4D908, MEMORY[0x24BDEFEA0]);
  __swift_allocate_boxed_opaque_existential_1(v33);
  sub_22FE4817C();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v2);
  MEMORY[0x2348AE2F4](v33);
  return swift_release();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t type metadata accessor for PersonalHotspotPlacardCell()
{
  return objc_opt_self();
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348AEA20]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22FE46D1C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_22FE46D48(double a1)
{
  uint64_t v1;

  sub_22FE44E2C(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_22FE46D54()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_22FE481C4();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348AEA2C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
  sub_22FE46EB4(a1, &qword_255E4D998);
}

_OWORD *sub_22FE46E90(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_22FE46EB4(a1, &qword_255E4D990);
}

void sub_22FE46EB4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22FE46EF8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2348AEA38](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22FE46F38(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22FE46F70()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_22FE46F9C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setTitleView_, *(_QWORD *)(v0 + 24));
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

uint64_t sub_22FE46FC4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2348AEA38](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22FE47004(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
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

uint64_t sub_22FE47068(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22FE470A8()
{
  return sub_22FE46EF8(&qword_255E4D9A0, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22FE493EC);
}

uint64_t sub_22FE470D4()
{
  return sub_22FE46EF8(&qword_255E4D9A8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22FE493C0);
}

uint64_t sub_22FE47100()
{
  return sub_22FE46EF8(&qword_255E4D9B0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22FE4950C);
}

uint64_t sub_22FE4712C()
{
  return sub_22FE46EF8(&qword_255E4D9B8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22FE494E0);
}

uint64_t sub_22FE47158()
{
  return sub_22FE46EF8(&qword_255E4D9C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22FE4957C);
}

uint64_t sub_22FE47184()
{
  return sub_22FE46EF8(&qword_255E4D9C8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22FE4945C);
}

void WMSubmitUIEventMetric_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "WMSubmitUIEventMetric";
  _os_log_error_impl(&dword_22FE37000, log, OS_LOG_TYPE_ERROR, "%s: event is nil for event", (uint8_t *)&v1, 0xCu);
}

void WMSubmitUIEventMetric_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = "WMSubmitUIEventMetric";
  v4 = 2112;
  v5 = CFSTR("com.apple.wifi.ui.event");
  v6 = 2112;
  v7 = a1;
  _os_log_error_impl(&dword_22FE37000, a2, OS_LOG_TYPE_ERROR, "%s: submitting %@ with dictionary %@", (uint8_t *)&v2, 0x20u);
}

void cellDataChangedNotification_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_22FE37000, v0, v1, "Received callDataChangedNotification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

uint64_t sub_22FE4814C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_22FE48158()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22FE48164()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_22FE48170()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22FE4817C()
{
  return MEMORY[0x24BDEFE58]();
}

uint64_t sub_22FE48188()
{
  return MEMORY[0x24BDEFE68]();
}

uint64_t sub_22FE48194()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_22FE481A0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_22FE481AC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_22FE481B8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22FE481C4()
{
  return MEMORY[0x24BE855A8]();
}

uint64_t sub_22FE481D0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22FE481DC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22FE481E8()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_22FE481F4()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_22FE48200()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22FE4820C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22FE48218()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22FE48224()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22FE48230()
{
  return MEMORY[0x24BEBCBF0]();
}

uint64_t sub_22FE4823C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_22FE48248()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_22FE48254()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22FE48260()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22FE4826C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22FE48278()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22FE48284()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22FE48290()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22FE4829C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22FE482A8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22FE482B4()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_22FE482C0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22FE482CC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22FE482D8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
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

uint64_t CTCellularDataPlanGetIsEnabled()
{
  return MEMORY[0x24BDC25B8]();
}

uint64_t CTTelephonyCenterAddObserver()
{
  return MEMORY[0x24BDC26D8]();
}

uint64_t CTTelephonyCenterGetDefault()
{
  return MEMORY[0x24BDC26E0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PreferencesTableViewCellLeftPad()
{
  return MEMORY[0x24BE75DB0]();
}

uint64_t PreferencesTableViewCellRightPad()
{
  return MEMORY[0x24BE75DB8]();
}

uint64_t PreferencesTableViewFooterColor()
{
  return MEMORY[0x24BE75DC0]();
}

uint64_t PreferencesTableViewFooterFont()
{
  return MEMORY[0x24BE75DC8]();
}

uint64_t PreferencesTableViewHeaderColor()
{
  return MEMORY[0x24BE75DD0]();
}

uint64_t PreferencesTableViewHeaderFont()
{
  return MEMORY[0x24BE75DD8]();
}

uint64_t SCDynamicStoreAddWatchedKey()
{
  return MEMORY[0x24BDF5640]();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x24BDF5670](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x24BDF5678](allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDF5680](allocator, store, order);
}

uint64_t SecPasswordGenerate()
{
  return MEMORY[0x24BDE8BD0]();
}

uint64_t WiFiDeviceClientGetPower()
{
  return MEMORY[0x24BE67928]();
}

uint64_t WiFiDeviceClientRegisterPowerCallback()
{
  return MEMORY[0x24BE67958]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x24BE67990]();
}

uint64_t WiFiManagerClientCopyFamilyHotspotPreferences()
{
  return MEMORY[0x24BE67998]();
}

uint64_t WiFiManagerClientCopyMisPassword()
{
  return MEMORY[0x24BE679B0]();
}

uint64_t WiFiManagerClientCopyProperty()
{
  return MEMORY[0x24BE679C8]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D0]();
}

uint64_t WiFiManagerClientGetShareMyPersonalHotspotMode()
{
  return MEMORY[0x24BE67A38]();
}

uint64_t WiFiManagerClientIsPersonalHotspotModificationDisabled()
{
  return MEMORY[0x24BE67A68]();
}

uint64_t WiFiManagerClientIsTetheringSupported()
{
  return MEMORY[0x24BE67A80]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x24BE67AE8]();
}

uint64_t WiFiManagerClientSetFamilyHotspotPreferences()
{
  return MEMORY[0x24BE67AF0]();
}

uint64_t WiFiManagerClientSetMISDiscoveryStateExt()
{
  return MEMORY[0x24BE67B08]();
}

uint64_t WiFiManagerClientSetMisPassword()
{
  return MEMORY[0x24BE67B18]();
}

uint64_t WiFiManagerClientSetPower()
{
  return MEMORY[0x24BE67B28]();
}

uint64_t WiFiManagerClientSetProperty()
{
  return MEMORY[0x24BE67B40]();
}

uint64_t WiFiManagerClientSetShareMyPersonalHotspotMode()
{
  return MEMORY[0x24BE67B48]();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return MEMORY[0x24BE67B68]();
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

uint64_t _NETRBClientCreate()
{
  return MEMORY[0x24BE6B640]();
}

uint64_t _NETRBClientDestroy()
{
  return MEMORY[0x24BE6B648]();
}

uint64_t _NETRBClientGetGlobalServiceState()
{
  return MEMORY[0x24BE6B650]();
}

uint64_t _NETRBClientSetGlobalServiceState()
{
  return MEMORY[0x24BE6B660]();
}

uint64_t _NETRBClientStartService()
{
  return MEMORY[0x24BE6B668]();
}

uint64_t _NETRBClientStopService()
{
  return MEMORY[0x24BE6B670]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}


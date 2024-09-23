uint64_t HKMHPromptedAssessmentsManagerClientInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25714C5B8);
}

id HKMHPromptedAssessmentsManagerServerInterface()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25714E100);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_getPromptedAssessmentsWithCompletion_, 0, 1);
  return v0;
}

id _NotificationSettingKeys()
{
  _QWORD v1[6];

  v1[5] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("StateOfMindLoggingReminderNotificationMiddayEnabledKey");
  v1[1] = CFSTR("StateOfMindLoggingReminderNotificationEndOfDayEnabledKey");
  v1[2] = CFSTR("StateOfMindLoggingReminderNotificationCustomScheduleKey");
  v1[3] = CFSTR("PeriodicPromptedAssessmentNotificationEnabledKey");
  v1[4] = CFSTR("PeriodicPromptedAssessmentNotificationTimeOfDayOverride");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id OUTLINED_FUNCTION_2(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_4(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_5(void *a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_9()
{
  void *v0;

  return objc_msgSend(v0, "BOOLForKey:");
}

id HKMHFrameworkBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)HKMHFrameworkBundle___ClassBundle;
  if (!HKMHFrameworkBundle___ClassBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)HKMHFrameworkBundle___ClassBundle;
    HKMHFrameworkBundle___ClassBundle = v1;

    v0 = (void *)HKMHFrameworkBundle___ClassBundle;
  }
  return v0;
}

id HKMHLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  HKMHFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_25119E728, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t HKMHMindfulnessSettingsURL()
{
  return objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("bridge:root=com.apple.MindSettings"));
}

void sub_2416E3BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
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

void sub_2416E3DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2416E3F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2416E43C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 48), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void type metadata accessor for __HKStateOfMindReflectiveInterval(uint64_t a1)
{
  sub_2416E6198(a1, qword_257147E98);
}

uint64_t *sub_2416E5A48(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v7 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
    v8 = v7[6];
    v9 = (char *)v4 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_2416EDD80();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    *(uint64_t *)((char *)v4 + v7[7]) = *(uint64_t *)((char *)a2 + v7[7]);
    *(uint64_t *)((char *)v4 + v7[8]) = *(uint64_t *)((char *)a2 + v7[8]);
    *(_OWORD *)((char *)v4 + v7[9]) = *(_OWORD *)((char *)a2 + v7[9]);
    *(uint64_t *)((char *)v4 + v7[10]) = *(uint64_t *)((char *)a2 + v7[10]);
    v12 = *(int *)(a3 + 20);
    v13 = (char *)v4 + v12;
    v14 = (char *)a2 + v12;
    v15 = sub_2416EDDB0();
    v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    v16(v13, v14, v15);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t sub_2416E5B68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a1 + *(int *)(type metadata accessor for MentalHealthInjector.Configuration() + 24);
  v5 = sub_2416EDD80();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  v6 = a1 + *(int *)(a2 + 20);
  v7 = sub_2416EDDB0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_OWORD *sub_2416E5BEC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);

  *a1 = *a2;
  v6 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  v7 = v6[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2416EDD80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  *(_QWORD *)((char *)a1 + v6[7]) = *(_QWORD *)((char *)a2 + v6[7]);
  *(_QWORD *)((char *)a1 + v6[8]) = *(_QWORD *)((char *)a2 + v6[8]);
  *(_OWORD *)((char *)a1 + v6[9]) = *(_OWORD *)((char *)a2 + v6[9]);
  *(_QWORD *)((char *)a1 + v6[10]) = *(_QWORD *)((char *)a2 + v6[10]);
  v11 = *(int *)(a3 + 20);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_2416EDDB0();
  v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_2416E5CE0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  *a1 = *a2;
  a1[1] = a2[1];
  v6 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  v7 = v6[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2416EDD80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_QWORD *)((char *)a1 + v6[7]) = *(_QWORD *)((char *)a2 + v6[7]);
  *(_QWORD *)((char *)a1 + v6[8]) = *(_QWORD *)((char *)a2 + v6[8]);
  v11 = v6[9];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  *(_QWORD *)((char *)a1 + v6[10]) = *(_QWORD *)((char *)a2 + v6[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = *(int *)(a3 + 20);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_2416EDDB0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *sub_2416E5DE8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  *a1 = *a2;
  v6 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  v7 = v6[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2416EDD80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_QWORD *)((char *)a1 + v6[7]) = *(_QWORD *)((char *)a2 + v6[7]);
  *(_QWORD *)((char *)a1 + v6[8]) = *(_QWORD *)((char *)a2 + v6[8]);
  *(_OWORD *)((char *)a1 + v6[9]) = *(_OWORD *)((char *)a2 + v6[9]);
  *(_QWORD *)((char *)a1 + v6[10]) = *(_QWORD *)((char *)a2 + v6[10]);
  v11 = *(int *)(a3 + 20);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_2416EDDB0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *sub_2416E5EC8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  *a1 = *a2;
  v6 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  v7 = v6[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2416EDD80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_QWORD *)((char *)a1 + v6[7]) = *(_QWORD *)((char *)a2 + v6[7]);
  *(_QWORD *)((char *)a1 + v6[8]) = *(_QWORD *)((char *)a2 + v6[8]);
  *(_OWORD *)((char *)a1 + v6[9]) = *(_OWORD *)((char *)a2 + v6[9]);
  *(_QWORD *)((char *)a1 + v6[10]) = *(_QWORD *)((char *)a2 + v6[10]);
  swift_bridgeObjectRelease();
  v11 = *(int *)(a3 + 20);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_2416EDDB0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_2416E5FB0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2416E5FBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = type metadata accessor for MentalHealthInjector.Configuration();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_2416EDDB0();
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_2416E6030()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2416E603C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = type metadata accessor for MentalHealthInjector.Configuration();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_2416EDDB0();
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t _s13DateGeneratorVMa()
{
  uint64_t result;

  result = qword_257147EF8;
  if (!qword_257147EF8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2416E60F4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for MentalHealthInjector.Configuration();
  if (v1 <= 0x3F)
  {
    result = sub_2416EDDB0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void type metadata accessor for __HKStateOfMindDomain(uint64_t a1)
{
  sub_2416E6198(a1, &qword_257147F38);
}

void sub_2416E6198(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2416E61DC()
{
  return sub_2416E685C(&qword_257147F40, (uint64_t (*)(uint64_t))type metadata accessor for __HKStateOfMindDomain, (uint64_t)&unk_2416EF29C);
}

void sub_2416E6208(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v2 = v1;
  v39 = a1;
  v40 = sub_2416EDDB0();
  v3 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2416EDD80();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2416EDDD4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for MentalHealthInjector.Configuration();
  v15 = v2 + *(int *)(v14 + 24);
  v37 = v7;
  v38 = v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v15, v6);
  v16 = _s13DateGeneratorVMa();
  (*(void (**)(char *))(v3 + 16))(v5);
  sub_2416EDDBC();
  v17 = sub_2416EDDC8();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v18 = v17 - 1;
  if (__OFSUB__(v17, 1))
  {
    __break(1u);
    goto LABEL_12;
  }
  v19 = *(_QWORD *)(v2 + 8);
  if (!v19)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v20 = *(int *)(v16 + 24);
  v21 = *(_QWORD *)(v2 + v20);
  if (v21 == 0x8000000000000000 && v19 == -1)
    goto LABEL_18;
  v22 = v21 / v19;
  v23 = *(_QWORD *)(v2 + *(int *)(v14 + 28));
  v24 = __OFADD__(v22, v23);
  v25 = v22 + v23;
  if (v24)
    goto LABEL_13;
  v26 = v18 - v25;
  if (__OFSUB__(v18, v25))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v27 = (void *)objc_opt_self();
  v28 = (void *)sub_2416EDDA4();
  v29 = objc_msgSend(v27, sel_hk_dateOnDayIndex_atHour_calendar_, v26, 1, v28);

  objc_msgSend(v29, sel_timeIntervalSinceReferenceDate);
  v31 = v30;

  v32 = (void *)sub_2416EDDA4();
  v33 = objc_msgSend(v27, sel_hk_dateOnDayIndex_atHour_calendar_, v26, 23, v32);

  objc_msgSend(v33, sel_timeIntervalSinceReferenceDate);
  v35 = v34;

  if (v31 > v35)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ((~COERCE__INT64(v35 - v31) & 0x7FF0000000000000) != 0)
  {
    sub_2416EAA0C(0x20000000000001);
    if (!__OFADD__(v21, 1))
    {
      *(_QWORD *)(v2 + v20) = v21 + 1;
      v36 = v39;
      sub_2416EDD74();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v37 + 56))(v36, 0, 1, v38);
      return;
    }
    goto LABEL_17;
  }
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
}

uint64_t sub_2416E6508@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2416E68F0(v1, a1);
}

uint64_t sub_2416E6514()
{
  return 0;
}

uint64_t sub_2416E651C()
{
  return 2;
}

uint64_t sub_2416E6524()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2416E7058(v0);
  sub_2416E6934(v0, (uint64_t (*)(_QWORD))_s13DateGeneratorVMa);
  return v1;
}

uint64_t sub_2416E6560(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t result;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  uint64_t v20;

  v4 = v3;
  sub_2416E689C();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2416EDD80();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s13DateGeneratorVMa();
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_2416E68F0(v4, (uint64_t)v15);
  if (!a2)
  {
    a3 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_12:
    sub_2416E68F0((uint64_t)v15, a1);
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v20 = a1;
    sub_2416E6208((uint64_t)v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {
      v17 = 0;
LABEL_10:
      sub_2416E6934((uint64_t)v9, (uint64_t (*)(_QWORD))sub_2416E689C);
      a3 = v17;
    }
    else
    {
      v17 = 0;
      v18 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
      while (1)
      {
        v18(v13, v9, v10);
        v18(a2, v13, v10);
        if (a3 - 1 == v17)
          break;
        a2 += *(_QWORD *)(v11 + 72);
        sub_2416E6208((uint64_t)v9);
        ++v17;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
          goto LABEL_10;
      }
    }
    a1 = v20;
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_2416E6730()
{
  return sub_2416EDDF8();
}

uint64_t sub_2416E6754()
{
  sub_2416EDF3C();
  sub_2416EDF48();
  return sub_2416EDF54();
}

uint64_t sub_2416E6798()
{
  return sub_2416EDF48();
}

uint64_t sub_2416E67C0()
{
  sub_2416EDF3C();
  sub_2416EDF48();
  return sub_2416EDF54();
}

_QWORD *sub_2416E6800@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2416E6810(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_2416E681C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2416E6830()
{
  return sub_2416E685C(&qword_257147F48, (uint64_t (*)(uint64_t))_s13DateGeneratorVMa, (uint64_t)&unk_2416EF2FC);
}

uint64_t sub_2416E685C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x242699C0C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_2416E689C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257147F50)
  {
    sub_2416EDD80();
    v0 = sub_2416EDE58();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257147F50);
  }
}

uint64_t sub_2416E68F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = _s13DateGeneratorVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2416E6934(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_2416E6970(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = type metadata accessor for MentalHealthInjector.Configuration();
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = (int *)v4;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v7 = *(int *)(v4 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_2416EDD80();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    *(uint64_t *)((char *)a1 + v6[7]) = *(uint64_t *)((char *)a2 + v6[7]);
    *(uint64_t *)((char *)a1 + v6[8]) = *(uint64_t *)((char *)a2 + v6[8]);
    *(_OWORD *)((char *)a1 + v6[9]) = *(_OWORD *)((char *)a2 + v6[9]);
    *(uint64_t *)((char *)a1 + v6[10]) = *(uint64_t *)((char *)a2 + v6[10]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2416E6A44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1 + *(int *)(type metadata accessor for MentalHealthInjector.Configuration() + 24);
  v2 = sub_2416EDD80();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_bridgeObjectRelease();
}

_OWORD *sub_2416E6AA0(_OWORD *a1, _OWORD *a2)
{
  int *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  v5 = v4[6];
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_2416EDD80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  *(_QWORD *)((char *)a1 + v4[7]) = *(_QWORD *)((char *)a2 + v4[7]);
  *(_QWORD *)((char *)a1 + v4[8]) = *(_QWORD *)((char *)a2 + v4[8]);
  *(_OWORD *)((char *)a1 + v4[9]) = *(_OWORD *)((char *)a2 + v4[9]);
  *(_QWORD *)((char *)a1 + v4[10]) = *(_QWORD *)((char *)a2 + v4[10]);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_2416E6B48(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  v5 = v4[6];
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_2416EDD80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 24))(v6, v7, v8);
  *(_QWORD *)((char *)a1 + v4[7]) = *(_QWORD *)((char *)a2 + v4[7]);
  *(_QWORD *)((char *)a1 + v4[8]) = *(_QWORD *)((char *)a2 + v4[8]);
  v9 = v4[9];
  v10 = (_QWORD *)((char *)a1 + v9);
  v11 = (_QWORD *)((char *)a2 + v9);
  *v10 = *v11;
  v10[1] = v11[1];
  *(_QWORD *)((char *)a1 + v4[10]) = *(_QWORD *)((char *)a2 + v4[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_2416E6C14(_OWORD *a1, _OWORD *a2)
{
  int *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  v5 = v4[6];
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_2416EDD80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  *(_QWORD *)((char *)a1 + v4[7]) = *(_QWORD *)((char *)a2 + v4[7]);
  *(_QWORD *)((char *)a1 + v4[8]) = *(_QWORD *)((char *)a2 + v4[8]);
  *(_OWORD *)((char *)a1 + v4[9]) = *(_OWORD *)((char *)a2 + v4[9]);
  *(_QWORD *)((char *)a1 + v4[10]) = *(_QWORD *)((char *)a2 + v4[10]);
  return a1;
}

_OWORD *sub_2416E6CB8(_OWORD *a1, _OWORD *a2)
{
  int *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  v5 = v4[6];
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_2416EDD80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 40))(v6, v7, v8);
  *(_QWORD *)((char *)a1 + v4[7]) = *(_QWORD *)((char *)a2 + v4[7]);
  *(_QWORD *)((char *)a1 + v4[8]) = *(_QWORD *)((char *)a2 + v4[8]);
  *(_OWORD *)((char *)a1 + v4[9]) = *(_OWORD *)((char *)a2 + v4[9]);
  *(_QWORD *)((char *)a1 + v4[10]) = *(_QWORD *)((char *)a2 + v4[10]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2416E6D64()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2416E6D70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MentalHealthInjector.Configuration();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_2416E6DAC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2416E6DB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MentalHealthInjector.Configuration();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t _s16ValenceGeneratorVMa()
{
  uint64_t result;

  result = qword_257147FB0;
  if (!qword_257147FB0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2416E6E34()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for MentalHealthInjector.Configuration();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2416E6E9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(_QWORD);
  double *v5;
  double v6;
  double v7;
  uint64_t result;
  unint64_t v9;
  double v10;
  uint64_t v11;

  v1 = _s16ValenceGeneratorVMa();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416E83C8(v0, (uint64_t)v3, v4);
  v5 = (double *)&v3[*(int *)(type metadata accessor for MentalHealthInjector.Configuration() + 36)];
  v7 = *v5;
  v6 = v5[1];
  result = sub_2416E6934((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthInjector.Configuration);
  if ((~COERCE__INT64(v6 - v7) & 0x7FF0000000000000) != 0)
  {
    v9 = sub_2416EAA0C(0x20000000000001);
    v10 = v7 + (v6 - v7) * ((double)v9 * 1.11022302e-16);
    if (v9 == 0x20000000000000)
      v10 = v6;
    return *(_QWORD *)&v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2416E6F84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2416E8384(v1, a1, (uint64_t (*)(_QWORD))_s16ValenceGeneratorVMa);
}

void sub_2416E6FA8()
{
  uint64_t v0;

  sub_2416E738C(v0);
}

uint64_t sub_2416E6FBC(uint64_t a1)
{
  uint64_t v1;

  sub_2416E6934(v1, (uint64_t (*)(_QWORD))_s16ValenceGeneratorVMa);
  return a1;
}

uint64_t sub_2416E6FE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;

  result = sub_2416E6E9C();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = 0;
  return result;
}

unint64_t sub_2416E7010()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257147FE8;
  if (!qword_257147FE8)
  {
    v1 = _s16ValenceGeneratorVMa();
    result = MEMORY[0x242699C0C](&unk_2416EF3C4, v1);
    atomic_store(result, (unint64_t *)&qword_257147FE8);
  }
  return result;
}

uint64_t sub_2416E7058(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(_QWORD);
  int v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  unint64_t v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, char *, uint64_t);
  _QWORD *v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  int v26;
  char *v27;
  void (*v28)(uint64_t, char *, uint64_t);
  unint64_t v29;
  char *v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  _QWORD v43[2];
  uint64_t (*v44)(char *, uint64_t, uint64_t);
  char *v45;
  uint64_t v46;
  char *v47;

  sub_2416E7E14(0, (unint64_t *)&qword_257147F50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v43 - v2;
  v4 = sub_2416EDD80();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s13DateGeneratorVMa();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(unsigned __int8 *)(v5 + 80);
  sub_2416E83C8(a1, (uint64_t)v9, v11);
  v45 = v9;
  sub_2416E6208((uint64_t)v3);
  v44 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  v12 = v44(v3, 1, v4);
  v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v12 != 1)
  {
    v14 = 0;
    v46 = (v10 + 32) & ~v10;
    v47 = v3;
    v21 = MEMORY[0x24BEE4AF8] + v46;
    v22 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
    v43[0] = v5;
    v43[1] = v10 | 7;
    v23 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v44;
    v15 = (uint64_t)v45;
    while (1)
    {
      v27 = v3;
      v28 = v22;
      result = ((uint64_t (*)(char *, char *, uint64_t))v22)(v7, v27, v4);
      if (v14)
      {
        v13 = v23;
        v19 = __OFSUB__(v14--, 1);
        if (v19)
          goto LABEL_32;
      }
      else
      {
        v29 = v23[3];
        if ((uint64_t)((v29 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_33;
        v30 = v7;
        v31 = v29 & 0xFFFFFFFFFFFFFFFELL;
        if (v31 <= 1)
          v32 = 1;
        else
          v32 = v31;
        sub_2416E7E14(0, &qword_257147FF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
        v33 = *(_QWORD *)(v5 + 72);
        v34 = v46;
        v13 = (_QWORD *)swift_allocObject();
        result = _swift_stdlib_malloc_size(v13);
        if (!v33)
          goto LABEL_34;
        v35 = result - v34;
        if (result - v34 == 0x8000000000000000 && v33 == -1)
          goto LABEL_35;
        v37 = v35 / v33;
        v13[2] = v32;
        v13[3] = 2 * (v35 / v33);
        v38 = (char *)v13 + v34;
        v39 = v23[3] >> 1;
        v40 = v39 * v33;
        v7 = v30;
        if (v23[2])
        {
          if (v13 < v23 || v38 >= (char *)v23 + v46 + v40)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v13 != v23)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v23[2] = 0;
        }
        v21 = (uint64_t)&v38[v40];
        v42 = (v37 & 0x7FFFFFFFFFFFFFFFLL) - v39;
        result = swift_release();
        v5 = v43[0];
        v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v44;
        v15 = (uint64_t)v45;
        v19 = __OFSUB__(v42, 1);
        v14 = v42 - 1;
        if (v19)
        {
LABEL_32:
          __break(1u);
LABEL_33:
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
          return result;
        }
      }
      v28(v21, v7, v4);
      v21 += *(_QWORD *)(v5 + 72);
      v25 = (uint64_t)v47;
      sub_2416E6208((uint64_t)v47);
      v26 = v24(v25, 1, v4);
      v22 = v28;
      v3 = (char *)v25;
      v23 = v13;
      if (v26 == 1)
        goto LABEL_3;
    }
  }
  v14 = 0;
  v15 = (uint64_t)v45;
LABEL_3:
  sub_2416E6934(v15, (uint64_t (*)(_QWORD))_s13DateGeneratorVMa);
  result = sub_2416E7DC0((uint64_t)v3);
  v17 = v13[3];
  if (v17 >= 2)
  {
    v18 = v17 >> 1;
    v19 = __OFSUB__(v18, v14);
    v20 = v18 - v14;
    if (v19)
      goto LABEL_36;
    v13[2] = v20;
  }
  return (uint64_t)v13;
}

void sub_2416E738C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  _QWORD *v13;
  double *v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  const void *v25;
  double *v27;
  uint64_t v28;
  unint64_t v29;

  _s16ValenceGeneratorVMa();
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v28 - v5;
  sub_2416E83C8(a1, (uint64_t)&v28 - v5, (uint64_t (*)(_QWORD))_s16ValenceGeneratorVMa);
  sub_2416E83C8((uint64_t)v6, (uint64_t)v4, (uint64_t (*)(_QWORD))_s16ValenceGeneratorVMa);
  v7 = type metadata accessor for MentalHealthInjector.Configuration();
  v8 = (double *)&v4[*(int *)(v7 + 36)];
  v10 = *v8;
  v9 = v8[1];
  sub_2416E6934((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthInjector.Configuration);
  v11 = v9 - v10;
  if ((~COERCE__INT64(v9 - v10) & 0x7FF0000000000000) != 0)
  {
    v12 = 0;
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v14 = (double *)(MEMORY[0x24BEE4AF8] + 32);
    while (1)
    {
      do
      {
        v29 = 0;
        MEMORY[0x242699C48](&v29, 8);
      }
      while (0x20000000000001 * v29 < 0x1FFFFFFFFFF801);
      v15 = (v29 * (unsigned __int128)0x20000000000001uLL) >> 64;
      if (v15 != 0x20000000000000)
        v9 = v10 + v11 * ((double)v15 * 1.11022302e-16);
      if (!v12)
      {
        v16 = v13[3];
        if ((uint64_t)((v16 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_23;
        v17 = v16 & 0xFFFFFFFFFFFFFFFELL;
        if (v17 <= 1)
          v18 = 1;
        else
          v18 = v17;
        sub_2416E7D68();
        v19 = (_QWORD *)swift_allocObject();
        v20 = _swift_stdlib_malloc_size(v19);
        v21 = v20 - 32;
        if (v20 < 32)
          v21 = v20 - 25;
        v22 = v21 >> 3;
        v19[2] = v18;
        v19[3] = 2 * (v21 >> 3);
        v23 = (unint64_t)(v19 + 4);
        v24 = v13[3] >> 1;
        if (v13[2])
        {
          v25 = v13 + 4;
          if (v19 != v13 || v23 >= (unint64_t)v25 + 8 * v24)
            memmove(v19 + 4, v25, 8 * v24);
          v13[2] = 0;
        }
        v14 = (double *)(v23 + 8 * v24);
        v12 = (v22 & 0x7FFFFFFFFFFFFFFFLL) - v24;
        swift_release();
        v13 = v19;
      }
      if (__OFSUB__(v12--, 1))
        break;
      *v14++ = v9;
      sub_2416E83C8((uint64_t)v6, (uint64_t)v4, (uint64_t (*)(_QWORD))_s16ValenceGeneratorVMa);
      v27 = (double *)&v4[*(int *)(v7 + 36)];
      v10 = *v27;
      v9 = v27[1];
      sub_2416E6934((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthInjector.Configuration);
      v11 = v9 - v10;
      if ((~COERCE__INT64(v9 - v10) & 0x7FF0000000000000) == 0)
        goto LABEL_21;
    }
  }
  else
  {
LABEL_21:
    __break(1u);
  }
  __break(1u);
LABEL_23:
  __break(1u);
}

uint64_t sub_2416E75E4(uint64_t a1)
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
  uint64_t *v12;
  uint64_t (*v13)(_QWORD);
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  double *v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  unint64_t v33;
  int64_t v34;
  uint64_t v35;
  int64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  const void *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  __int128 v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  unint64_t v62;

  v2 = _s16ValenceGeneratorVMa();
  MEMORY[0x24BDAC7A8](v2);
  v54 = (uint64_t)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416E7E14(0, (unint64_t *)&qword_257147F50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v55 = (uint64_t)&v47 - v5;
  v6 = sub_2416EDD80();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v52 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v53 = (char *)&v47 - v10;
  v56 = type metadata accessor for MentalHealthInjector();
  MEMORY[0x24BDAC7A8](v56);
  v12 = (uint64_t *)((char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = sub_2416E83C8(a1, (uint64_t)v12, v13);
  v15 = 0;
  v57 = v12 + 2;
  v16 = MEMORY[0x24BEE4AF8];
  v17 = MEMORY[0x24BEE4AF8] + 32;
  v51 = xmmword_2416EF3A0;
  v18 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v19 = v56;
  while (1)
  {
    v49 = (_QWORD *)v17;
    v50 = v18;
    v62 = v16;
    v48 = v15;
    if ((v16 & 0xC000000000000000) != 0)
    {
      result = sub_2416EDE94();
      v20 = v16;
      if (result >= *v12)
        goto LABEL_22;
    }
    else if (*v12 < 1)
    {
      v20 = v16;
      goto LABEL_22;
    }
    v20 = v16;
    do
    {
      result = sub_2416EC290((uint64_t)&v59);
      if ((v61 & 1) != 0)
        break;
      v58 = v59;
      v21 = v60;
      v22 = v55;
      sub_2416E6208(v55);
      v23 = v22;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v22, 1, v6) == 1)
      {
        result = sub_2416E7DC0(v22);
        v31 = v48;
        if (v48)
          goto LABEL_23;
        goto LABEL_27;
      }
      v24 = v53;
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v53, v23, v6);
      v25 = v54;
      sub_2416E83C8((uint64_t)v12 + *(int *)(v19 + 32), v54, (uint64_t (*)(_QWORD))_s16ValenceGeneratorVMa);
      v26 = (double *)(v25 + *(int *)(type metadata accessor for MentalHealthInjector.Configuration() + 36));
      v28 = *v26;
      v27 = v26[1];
      result = sub_2416E6934(v25, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthInjector.Configuration);
      if ((~COERCE__INT64(v27 - v28) & 0x7FF0000000000000) == 0)
      {
        __break(1u);
        goto LABEL_41;
      }
      v59 = 0;
      MEMORY[0x242699C48](&v59, 8);
      while ((unint64_t)(0x20000000000001 * v59) < 0x1FFFFFFFFFF801)
      {
        v59 = 0;
        MEMORY[0x242699C48](&v59, 8);
      }
      if ((v21 & 1) == 0)
      {
        sub_2416E7E14(0, &qword_257148008, (uint64_t (*)(uint64_t))type metadata accessor for __HKStateOfMindDomain, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
        v29 = swift_allocObject();
        *(_OWORD *)(v29 + 16) = v51;
        *(_QWORD *)(v29 + 32) = v58;
      }
      sub_2416E8470(0, (unint64_t *)&qword_257148000);
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v52, v24, v6);
      sub_2416EA644(v16);
      sub_2416EDE40();
      MEMORY[0x2426996C0]();
      if (*(_QWORD *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2416EDE1C();
      sub_2416EDE28();
      sub_2416EDE10();
      result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v24, v6);
      v20 = v62;
      if (v62 >> 62)
      {
        swift_bridgeObjectRetain();
        v30 = sub_2416EDE94();
        result = swift_bridgeObjectRelease();
      }
      else
      {
        v30 = *(_QWORD *)((v62 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
    }
    while (v30 < *v12);
LABEL_22:
    v31 = v48;
    if (!v48)
      break;
LABEL_23:
    v18 = v50;
    v32 = __OFSUB__(v31, 1);
    v15 = v31 - 1;
    if (v32)
      goto LABEL_41;
LABEL_39:
    v46 = v49;
    *v49 = v20;
    v17 = (uint64_t)(v46 + 1);
  }
LABEL_27:
  v33 = v50[3];
  if ((uint64_t)((v33 >> 1) + 0x4000000000000000) < 0)
    goto LABEL_42;
  v34 = v33 & 0xFFFFFFFFFFFFFFFELL;
  if (v34 <= 1)
    v35 = 1;
  else
    v35 = v34;
  sub_2416E7E14(0, &qword_257148010, (uint64_t (*)(uint64_t))sub_2416E840C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v18 = (_QWORD *)swift_allocObject();
  v36 = _swift_stdlib_malloc_size(v18);
  v38 = v36 - 32;
  v37 = v36 < 32;
  v39 = v36 - 25;
  v40 = v50;
  if (v37)
    v38 = v39;
  v41 = v38 >> 3;
  v18[2] = v35;
  v18[3] = 2 * (v38 >> 3);
  v42 = (unint64_t)(v18 + 4);
  v43 = v40[3] >> 1;
  if (v40[2])
  {
    v44 = v40 + 4;
    if (v18 != v40 || v42 >= (unint64_t)v44 + 8 * v43)
    {
      memmove(v18 + 4, v44, 8 * v43);
      v40 = v50;
    }
    v40[2] = 0;
  }
  v49 = (_QWORD *)(v42 + 8 * v43);
  v45 = (v41 & 0x7FFFFFFFFFFFFFFFLL) - v43;
  result = swift_release();
  v15 = v45 - 1;
  if (!__OFSUB__(v45, 1))
    goto LABEL_39;
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_2416E7B60(uint64_t a1, double *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t (*v14)(_QWORD);
  uint64_t result;
  uint64_t v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  unint64_t v22;
  double v23;
  double *v24;
  uint64_t v25;
  unint64_t v26;

  v4 = v3;
  v8 = _s16ValenceGeneratorVMa();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v25 - v12;
  result = sub_2416E8384(v4, (uint64_t)&v25 - v12, v14);
  if (!a2)
  {
    a3 = 0;
    goto LABEL_14;
  }
  if (!a3)
  {
LABEL_14:
    sub_2416E8384((uint64_t)v13, a1, (uint64_t (*)(_QWORD))_s16ValenceGeneratorVMa);
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v25 = a1;
    sub_2416E83C8((uint64_t)v13, (uint64_t)v11, (uint64_t (*)(_QWORD))_s16ValenceGeneratorVMa);
    v16 = type metadata accessor for MentalHealthInjector.Configuration();
    v17 = (double *)&v11[*(int *)(v16 + 36)];
    v19 = *v17;
    v18 = v17[1];
    sub_2416E6934((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthInjector.Configuration);
    v20 = v18 - v19;
    if ((~COERCE__INT64(v18 - v19) & 0x7FF0000000000000) != 0)
    {
      v21 = 1;
      while (1)
      {
        do
        {
          v26 = 0;
          MEMORY[0x242699C48](&v26, 8);
        }
        while (0x20000000000001 * v26 < 0x1FFFFFFFFFF801);
        v22 = (v26 * (unsigned __int128)0x20000000000001uLL) >> 64;
        v23 = v19 + v20 * ((double)v22 * 1.11022302e-16);
        if (v22 == 0x20000000000000)
          v23 = v18;
        *a2 = v23;
        if (v21 == a3)
          break;
        ++a2;
        ++v21;
        sub_2416E83C8((uint64_t)v13, (uint64_t)v11, (uint64_t (*)(_QWORD))_s16ValenceGeneratorVMa);
        v24 = (double *)&v11[*(int *)(v16 + 36)];
        v19 = *v24;
        v18 = v24[1];
        sub_2416E6934((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthInjector.Configuration);
        v20 = v18 - v19;
        if ((~COERCE__INT64(v18 - v19) & 0x7FF0000000000000) == 0)
          goto LABEL_11;
      }
    }
    else
    {
LABEL_11:
      __break(1u);
    }
    a1 = v25;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void sub_2416E7D68()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257147FF0)
  {
    v0 = sub_2416EDF18();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257147FF0);
  }
}

uint64_t sub_2416E7DC0(uint64_t a1)
{
  uint64_t v2;

  sub_2416E7E14(0, (unint64_t *)&qword_257147F50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2416E7E14(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2416E7E6C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
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
  uint64_t (*v18)(_QWORD);
  uint64_t result;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  double *v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  __int128 v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  char v50;
  char v51;
  unint64_t v52;

  v7 = _s16ValenceGeneratorVMa();
  MEMORY[0x24BDAC7A8](v7);
  v44 = (uint64_t)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416E7E14(0, (unint64_t *)&qword_257147F50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v9);
  v46 = (uint64_t)&v37 - v10;
  v11 = sub_2416EDD80();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v43 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v37 - v15;
  v47 = type metadata accessor for MentalHealthInjector();
  MEMORY[0x24BDAC7A8](v47);
  v45 = (uint64_t *)((char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = sub_2416E8384(v3, (uint64_t)v45, v18);
  v40 = a2;
  if (!a2)
  {
    a3 = 0;
    goto LABEL_29;
  }
  if (!a3)
    goto LABEL_29;
  if (a3 < 0)
  {
LABEL_31:
    __break(1u);
    return result;
  }
  v42 = v16;
  v37 = a1;
  v20 = 0;
  v21 = v45;
  v48 = v45 + 2;
  v22 = MEMORY[0x24BEE4AF8];
  v41 = xmmword_2416EF3A0;
  v38 = a3;
  v23 = v47;
  do
  {
    v39 = v20;
    v52 = v22;
    if ((v22 & 0xC000000000000000) != 0)
    {
      v24 = v22;
      if (sub_2416EDE94() >= *v21)
        goto LABEL_6;
    }
    else if (*v21 < 1)
    {
      v24 = v22;
      goto LABEL_6;
    }
    v24 = v22;
    do
    {
      sub_2416EC290((uint64_t)&v49);
      if ((v51 & 1) != 0)
        break;
      v26 = v49;
      v27 = v50;
      v28 = v46;
      sub_2416E6208(v46);
      v29 = v28;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v28, 1, v11) == 1)
      {
        sub_2416E7DC0(v28);
        break;
      }
      v30 = v42;
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v42, v29, v11);
      v31 = v44;
      sub_2416E83C8((uint64_t)v21 + *(int *)(v23 + 32), v44, (uint64_t (*)(_QWORD))_s16ValenceGeneratorVMa);
      v32 = (double *)(v31 + *(int *)(type metadata accessor for MentalHealthInjector.Configuration() + 36));
      v34 = *v32;
      v33 = v32[1];
      result = sub_2416E6934(v31, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthInjector.Configuration);
      if ((~COERCE__INT64(v33 - v34) & 0x7FF0000000000000) == 0)
      {
        __break(1u);
        goto LABEL_31;
      }
      v49 = 0;
      MEMORY[0x242699C48](&v49, 8);
      while ((unint64_t)(0x20000000000001 * v49) < 0x1FFFFFFFFFF801)
      {
        v49 = 0;
        MEMORY[0x242699C48](&v49, 8);
      }
      v21 = v45;
      if ((v27 & 1) == 0)
      {
        sub_2416E7E14(0, &qword_257148008, (uint64_t (*)(uint64_t))type metadata accessor for __HKStateOfMindDomain, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
        v35 = swift_allocObject();
        *(_OWORD *)(v35 + 16) = v41;
        *(_QWORD *)(v35 + 32) = v26;
      }
      sub_2416E8470(0, (unint64_t *)&qword_257148000);
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v43, v30, v11);
      sub_2416EA644(v22);
      sub_2416EDE40();
      MEMORY[0x2426996C0]();
      if (*(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2416EDE1C();
      sub_2416EDE28();
      sub_2416EDE10();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v30, v11);
      v24 = v52;
      if (v52 >> 62)
      {
        swift_bridgeObjectRetain();
        v36 = sub_2416EDE94();
        swift_bridgeObjectRelease();
      }
      else
      {
        v36 = *(_QWORD *)((v52 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
    }
    while (v36 < *v21);
LABEL_6:
    v25 = v40;
    v20 = v39 + 1;
    *v40 = v24;
    v40 = v25 + 1;
    a3 = v38;
  }
  while (v20 != v38);
  a1 = v37;
LABEL_29:
  sub_2416E8384((uint64_t)v45, a1, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthInjector);
  return a3;
}

uint64_t sub_2416E8384(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2416E83C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_2416E840C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257148018)
  {
    sub_2416E8470(255, &qword_257148020);
    v0 = sub_2416EDE34();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257148018);
  }
}

uint64_t sub_2416E8470(uint64_t a1, unint64_t *a2)
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

uint64_t static MentalHealthInjector.Configuration.Constants.noneDomainKey.getter()
{
  return 0x6E5F6E69616D6F64;
}

uint64_t MentalHealthInjector.Configuration.init(reflectiveInterval:daysToBackfill:samplesPerDay:injectionDate:injectionDayOffset:valenceRange:domainCounts:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>, double a8@<D0>, double a9@<D1>)
{
  int *v18;
  double *v19;
  char *v20;
  uint64_t v21;
  uint64_t result;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  int64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  BOOL v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void (*v42)(uint64_t, uint64_t);
  uint64_t v43;

  if ((sub_2416E89D0(a6) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    v37 = (void *)objc_opt_self();
    v38 = (void *)sub_2416EDDE0();
    objc_msgSend(v37, sel_hk_error_description_, 3, v38);

    swift_willThrow();
    v39 = sub_2416EDD80();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 8))(a4, v39);
  }
  v18 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  *(_QWORD *)((char *)a7 + v18[8]) = a1;
  *a7 = a2;
  a7[1] = a3;
  *(_QWORD *)((char *)a7 + v18[10]) = a6;
  v19 = (double *)((char *)a7 + v18[9]);
  *v19 = a8;
  v19[1] = a9;
  v20 = (char *)a7 + v18[6];
  v21 = sub_2416EDD80();
  v43 = *(_QWORD *)(v21 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v43 + 16))(v20, a4, v21);
  v23 = 0;
  v24 = 0;
  *(_QWORD *)((char *)a7 + v18[7]) = a5;
  v25 = a6 + 64;
  v26 = 1 << *(_BYTE *)(a6 + 32);
  v27 = -1;
  if (v26 < 64)
    v27 = ~(-1 << v26);
  v28 = v27 & *(_QWORD *)(a6 + 64);
  v29 = (unint64_t)(v26 + 63) >> 6;
  while (v28)
  {
    v30 = __clz(__rbit64(v28));
    v28 &= v28 - 1;
    v31 = v30 | (v23 << 6);
LABEL_6:
    v32 = *(_QWORD *)(*(_QWORD *)(a6 + 56) + 8 * v31);
    v33 = __OFADD__(v24, v32);
    v24 += v32;
    if (v33)
    {
      __break(1u);
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
  }
  v34 = v23 + 1;
  if (__OFADD__(v23, 1))
    goto LABEL_32;
  if (v34 < v29)
  {
    v35 = *(_QWORD *)(v25 + 8 * v34);
    ++v23;
    if (!v35)
    {
      v23 = v34 + 1;
      if (v34 + 1 >= v29)
        goto LABEL_27;
      v35 = *(_QWORD *)(v25 + 8 * v23);
      if (!v35)
      {
        v23 = v34 + 2;
        if (v34 + 2 >= v29)
          goto LABEL_27;
        v35 = *(_QWORD *)(v25 + 8 * v23);
        if (!v35)
        {
          v23 = v34 + 3;
          if (v34 + 3 >= v29)
            goto LABEL_27;
          v35 = *(_QWORD *)(v25 + 8 * v23);
          if (!v35)
          {
            v23 = v34 + 4;
            if (v34 + 4 >= v29)
              goto LABEL_27;
            v35 = *(_QWORD *)(v25 + 8 * v23);
            if (!v35)
            {
              v36 = v34 + 5;
              if (v36 >= v29)
                goto LABEL_27;
              v35 = *(_QWORD *)(v25 + 8 * v36);
              if (!v35)
              {
                while (1)
                {
                  v23 = v36 + 1;
                  if (__OFADD__(v36, 1))
                    goto LABEL_34;
                  if (v23 >= v29)
                    goto LABEL_27;
                  v35 = *(_QWORD *)(v25 + 8 * v23);
                  ++v36;
                  if (v35)
                    goto LABEL_25;
                }
              }
              v23 = v36;
            }
          }
        }
      }
    }
LABEL_25:
    v28 = (v35 - 1) & v35;
    v31 = __clz(__rbit64(v35)) + (v23 << 6);
    goto LABEL_6;
  }
LABEL_27:
  if ((unsigned __int128)(a3 * (__int128)a2) >> 64 != (a3 * a2) >> 63)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    return result;
  }
  if (a3 * a2 >= v24)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v43 + 8))(a4, v21);
  v40 = (void *)objc_opt_self();
  v41 = (void *)sub_2416EDDE0();
  objc_msgSend(v40, sel_hk_error_description_, 3, v41);

  swift_willThrow();
  v42 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
  v42(a4, v21);
  v42((uint64_t)v20, v21);
  return swift_bridgeObjectRelease();
}

uint64_t MentalHealthInjector.Configuration.init(reflectiveInterval:daysToBackfill:samplesPerDay:injectionDate:injectionDayOffset:valenceRange:domainPercentages:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>, double a8@<D0>, double a9@<D1>)
{
  uint64_t v9;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29[2];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = a4;
  v18 = sub_2416EDD80();
  result = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((unsigned __int128)(a3 * (__int128)a2) >> 64 == (a3 * a2) >> 63)
  {
    v30 = v20;
    v31 = result;
    v29[0] = a5;
    v29[1] = v9;
    v23 = sub_2416E8B40(a6, a3 * a2);
    swift_bridgeObjectRelease();
    if (v23)
    {
      v25 = v30;
      v24 = v31;
      v26 = v32;
      (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v22, v32, v31);
      MentalHealthInjector.Configuration.init(reflectiveInterval:daysToBackfill:samplesPerDay:injectionDate:injectionDayOffset:valenceRange:domainCounts:)(a1, a2, a3, (uint64_t)v22, v29[0], v23, a7, a8, a9);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(v26, v24);
    }
    else
    {
      v27 = (void *)objc_opt_self();
      v28 = (void *)sub_2416EDDE0();
      objc_msgSend(v27, sel_hk_error_description_, 3, v28);

      swift_willThrow();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 8))(v32, v31);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2416E89D0(uint64_t result)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;

  v1 = 0;
  v2 = result + 64;
  v3 = 1 << *(_BYTE *)(result + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(result + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  while (v5)
  {
    v7 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    v8 = v7 | (v1 << 6);
LABEL_5:
    if (*(uint64_t *)(*(_QWORD *)(result + 56) + 8 * v8) <= 0)
      return 0;
  }
  v9 = v1 + 1;
  if (__OFADD__(v1, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v9 >= v6)
    return 1;
  v10 = *(_QWORD *)(v2 + 8 * v9);
  ++v1;
  if (v10)
    goto LABEL_24;
  v1 = v9 + 1;
  if (v9 + 1 >= v6)
    return 1;
  v10 = *(_QWORD *)(v2 + 8 * v1);
  if (v10)
    goto LABEL_24;
  v1 = v9 + 2;
  if (v9 + 2 >= v6)
    return 1;
  v10 = *(_QWORD *)(v2 + 8 * v1);
  if (v10)
    goto LABEL_24;
  v1 = v9 + 3;
  if (v9 + 3 >= v6)
    return 1;
  v10 = *(_QWORD *)(v2 + 8 * v1);
  if (v10)
    goto LABEL_24;
  v1 = v9 + 4;
  if (v9 + 4 >= v6)
    return 1;
  v10 = *(_QWORD *)(v2 + 8 * v1);
  if (v10)
  {
LABEL_24:
    v5 = (v10 - 1) & v10;
    v8 = __clz(__rbit64(v10)) + (v1 << 6);
    goto LABEL_5;
  }
  v11 = v9 + 5;
  if (v11 >= v6)
    return 1;
  v10 = *(_QWORD *)(v2 + 8 * v11);
  if (v10)
  {
    v1 = v11;
    goto LABEL_24;
  }
  while (1)
  {
    v1 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v1 >= v6)
      return 1;
    v10 = *(_QWORD *)(v2 + 8 * v1);
    ++v11;
    if (v10)
      goto LABEL_24;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for MentalHealthInjector.Configuration()
{
  uint64_t result;

  result = qword_257148080;
  if (!qword_257148080)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2416E8B40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  double v9;
  _QWORD *v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char isUniquelyReferenced_nonNull_native;
  char v25;
  unint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t result;
  int64_t v39;
  double v40;

  v40 = 0.0;
  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  v8 = 0;
  v39 = (unint64_t)(v5 + 63) >> 6;
  v9 = (double)a2;
  v10 = (_QWORD *)MEMORY[0x24BEE4B00];
  v11 = 0.0;
  while (1)
  {
    if (v7)
    {
      v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v13 = v12 | (v8 << 6);
    }
    else
    {
      v14 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_46;
      if (v14 >= v39)
      {
LABEL_39:
        swift_release();
        return (uint64_t)v10;
      }
      v15 = *(_QWORD *)(v4 + 8 * v14);
      ++v8;
      if (!v15)
      {
        v8 = v14 + 1;
        if (v14 + 1 >= v39)
          goto LABEL_39;
        v15 = *(_QWORD *)(v4 + 8 * v8);
        if (!v15)
        {
          v8 = v14 + 2;
          if (v14 + 2 >= v39)
            goto LABEL_39;
          v15 = *(_QWORD *)(v4 + 8 * v8);
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v39)
              goto LABEL_39;
            v15 = *(_QWORD *)(v4 + 8 * v16);
            if (!v15)
            {
              while (1)
              {
                v8 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_47;
                if (v8 >= v39)
                  goto LABEL_39;
                v15 = *(_QWORD *)(v4 + 8 * v8);
                ++v16;
                if (v15)
                  goto LABEL_21;
              }
            }
            v8 = v16;
          }
        }
      }
LABEL_21:
      v7 = (v15 - 1) & v15;
      v13 = __clz(__rbit64(v15)) + (v8 << 6);
    }
    v17 = 1.0 - v11;
    if (v17 <= 2.22507386e-308)
    {
      swift_bridgeObjectRelease();
      swift_release();
      return 0;
    }
    v18 = *(_QWORD *)(a1 + 56);
    v19 = *(double *)(v18 + 8 * v13) >= v17 ? v17 : *(double *)(v18 + 8 * v13);
    v20 = floor(v19 * v9);
    if ((~*(_QWORD *)&v20 & 0x7FF0000000000000) == 0)
      break;
    if (v20 <= -9.22337204e18)
      goto LABEL_42;
    if (v20 >= 9.22337204e18)
      goto LABEL_43;
    v21 = *(_QWORD *)(a1 + 48) + 16 * v13;
    v22 = *(_QWORD *)v21;
    v23 = *(_BYTE *)(v21 + 8);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v26 = sub_2416EAA98(v22, v23);
    v27 = v10[2];
    v28 = (v25 & 1) == 0;
    v29 = v27 + v28;
    if (__OFADD__(v27, v28))
      goto LABEL_44;
    v30 = v25;
    if (v10[3] >= v29)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_2416ECBF8();
    }
    else
    {
      sub_2416EC5BC(v29, isUniquelyReferenced_nonNull_native);
      v31 = sub_2416EAA98(v22, v23);
      if ((v30 & 1) != (v32 & 1))
        goto LABEL_48;
      v26 = v31;
    }
    v33 = (uint64_t)v20;
    if ((v30 & 1) != 0)
    {
      *(_QWORD *)(v10[7] + 8 * v26) = v33;
    }
    else
    {
      v10[(v26 >> 6) + 8] |= 1 << v26;
      v34 = v10[6] + 16 * v26;
      *(_QWORD *)v34 = v22;
      *(_BYTE *)(v34 + 8) = v23;
      *(_QWORD *)(v10[7] + 8 * v26) = v33;
      v35 = v10[2];
      v36 = __OFADD__(v35, 1);
      v37 = v35 + 1;
      if (v36)
        goto LABEL_45;
      v10[2] = v37;
    }
    swift_bridgeObjectRelease();
    v11 = v19 + v40;
    v40 = v19 + v40;
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  result = sub_2416EDF30();
  __break(1u);
  return result;
}

uint64_t *_s13ConfigurationVwCP(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v7 = a3[6];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_2416EDD80();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[8];
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)v4 + v11) = *(uint64_t *)((char *)a2 + v11);
    v12 = a3[10];
    *(_OWORD *)((char *)v4 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)v4 + v12) = *(uint64_t *)((char *)a2 + v12);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t _s13ConfigurationVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 24);
  v3 = sub_2416EDD80();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return swift_bridgeObjectRelease();
}

_OWORD *_s13ConfigurationVwcp(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2416EDD80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  v11 = a3[10];
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s13ConfigurationVwca(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  *a1 = *a2;
  a1[1] = a2[1];
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2416EDD80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  v10 = a3[9];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *_s13ConfigurationVwtk(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2416EDD80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  v11 = a3[10];
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  return a1;
}

_OWORD *_s13ConfigurationVwta(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2416EDD80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  v11 = a3[10];
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13ConfigurationVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2416E922C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_2416EDD80();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 24), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 40));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t _s13ConfigurationVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2416E92B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_2416EDD80();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 24), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 40)) = (a2 - 1);
  return result;
}

uint64_t sub_2416E9334()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2416EDD80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MentalHealthInjector.Configuration.Constants()
{
  return &type metadata for MentalHealthInjector.Configuration.Constants;
}

uint64_t MentalHealthInjector.StateOfMindDomainOrNone.hash(into:)()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 8) & 1) == 0)
    sub_2416EDF48();
  return sub_2416EDF48();
}

BOOL static MentalHealthInjector.StateOfMindDomainOrNone.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
    return (*(_BYTE *)(a2 + 8) & 1) != 0;
  if ((*(_BYTE *)(a2 + 8) & 1) != 0)
    return 0;
  return *(_QWORD *)a1 == *(_QWORD *)a2;
}

BOOL sub_2416E9454(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2416E946C()
{
  sub_2416EDF3C();
  sub_2416EDF48();
  return sub_2416EDF54();
}

uint64_t sub_2416E94B0()
{
  return sub_2416EDF48();
}

uint64_t sub_2416E94D8()
{
  sub_2416EDF3C();
  sub_2416EDF48();
  return sub_2416EDF54();
}

uint64_t sub_2416E9518()
{
  _BYTE *v0;

  if (*v0)
    return 1701736302;
  else
    return 0x6E69616D6F64;
}

uint64_t sub_2416E9548@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2416EACDC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2416E956C()
{
  return 0;
}

void sub_2416E9578(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2416E9584()
{
  sub_2416EA880();
  return sub_2416EDF78();
}

uint64_t sub_2416E95AC()
{
  sub_2416EA880();
  return sub_2416EDF84();
}

uint64_t sub_2416E95D4()
{
  return 1;
}

uint64_t sub_2416E95DC()
{
  sub_2416EDF3C();
  sub_2416EDF48();
  return sub_2416EDF54();
}

uint64_t sub_2416E961C()
{
  return sub_2416EDF48();
}

uint64_t sub_2416E9640()
{
  sub_2416EDF3C();
  sub_2416EDF48();
  return sub_2416EDF54();
}

uint64_t sub_2416E967C()
{
  return 12383;
}

uint64_t sub_2416E9688@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_2416EDF24();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_2416E9704(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2416E9710()
{
  sub_2416EA83C();
  return sub_2416EDF78();
}

uint64_t sub_2416E9738()
{
  sub_2416EA83C();
  return sub_2416EDF84();
}

uint64_t sub_2416E9760()
{
  return 0;
}

uint64_t sub_2416E976C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_2416E9798()
{
  sub_2416EA7F8();
  return sub_2416EDF78();
}

uint64_t sub_2416E97C0()
{
  sub_2416EA7F8();
  return sub_2416EDF84();
}

uint64_t MentalHealthInjector.StateOfMindDomainOrNone.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;

  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE3520];
  sub_2416EA8E8(0, &qword_2571480D0, (uint64_t (*)(void))sub_2416EA7F8, (uint64_t)&type metadata for MentalHealthInjector.StateOfMindDomainOrNone.NoneCodingKeys, MEMORY[0x24BEE3520]);
  v21 = *(_QWORD *)(v4 - 8);
  v22 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v20 = (char *)&v18 - v5;
  sub_2416EA8E8(0, &qword_2571480E0, (uint64_t (*)(void))sub_2416EA83C, (uint64_t)&type metadata for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys, v3);
  v23 = *(_QWORD *)(v6 - 8);
  v24 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - v7;
  sub_2416EA8E8(0, &qword_2571480F0, (uint64_t (*)(void))sub_2416EA880, (uint64_t)&type metadata for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys, v3);
  v25 = v9;
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - v11;
  v19 = *v1;
  LOBYTE(v3) = *((_BYTE *)v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2416EA880();
  sub_2416EDF6C();
  if ((v3 & 1) != 0)
  {
    v28 = 1;
    sub_2416EA7F8();
    v13 = v20;
    v14 = v25;
    sub_2416EDF00();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v13, v22);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v14);
  }
  else
  {
    v27 = 0;
    sub_2416EA83C();
    v16 = v25;
    sub_2416EDF00();
    v26 = v19;
    type metadata accessor for __HKStateOfMindDomain(0);
    sub_2416E685C(&qword_257148100, (uint64_t (*)(uint64_t))type metadata accessor for __HKStateOfMindDomain, MEMORY[0x24BDD2620]);
    v17 = v24;
    sub_2416EDF0C();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v17);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v16);
  }
}

uint64_t MentalHealthInjector.StateOfMindDomainOrNone.hashValue.getter()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 8);
  sub_2416EDF3C();
  if ((v1 & 1) == 0)
    sub_2416EDF48();
  sub_2416EDF48();
  return sub_2416EDF54();
}

uint64_t MentalHealthInjector.StateOfMindDomainOrNone.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
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
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  char *v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char v41;
  char v42;

  v36 = a2;
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE33E0];
  sub_2416EA8E8(0, &qword_257148108, (uint64_t (*)(void))sub_2416EA7F8, (uint64_t)&type metadata for MentalHealthInjector.StateOfMindDomainOrNone.NoneCodingKeys, MEMORY[0x24BEE33E0]);
  v33 = v4;
  v38 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v37 = (char *)&v31 - v5;
  sub_2416EA8E8(0, &qword_257148110, (uint64_t (*)(void))sub_2416EA83C, (uint64_t)&type metadata for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys, v3);
  v7 = *(_QWORD *)(v6 - 8);
  v34 = v6;
  v35 = v7;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v31 - v8;
  sub_2416EA8E8(0, &qword_257148118, (uint64_t (*)(void))sub_2416EA880, (uint64_t)&type metadata for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys, v3);
  v11 = v10;
  v12 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v31 - v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2416EA880();
  v15 = v39;
  sub_2416EDF60();
  if (v15)
    goto LABEL_7;
  v17 = v37;
  v16 = v38;
  v31 = a1;
  v32 = v12;
  v39 = v14;
  v18 = sub_2416EDEF4();
  if (*(_QWORD *)(v18 + 16) != 1)
  {
    v22 = sub_2416EDE88();
    swift_allocError();
    v24 = v23;
    sub_2416EA964();
    *v24 = &type metadata for MentalHealthInjector.StateOfMindDomainOrNone;
    v25 = v39;
    sub_2416EDEDC();
    sub_2416EDE70();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x24BEE26D0], v22);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v25, v11);
    a1 = v31;
LABEL_7:
    v26 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v26);
  }
  v19 = *(_BYTE *)(v18 + 32);
  if ((v19 & 1) != 0)
  {
    v42 = 1;
    sub_2416EA7F8();
    v20 = v39;
    sub_2416EDED0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v17, v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v20, v11);
    v21 = 0;
  }
  else
  {
    v41 = 0;
    sub_2416EA83C();
    sub_2416EDED0();
    type metadata accessor for __HKStateOfMindDomain(0);
    sub_2416E685C(&qword_257148130, (uint64_t (*)(uint64_t))type metadata accessor for __HKStateOfMindDomain, MEMORY[0x24BDD2628]);
    v28 = v34;
    sub_2416EDEE8();
    v29 = v32;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v28);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v39, v11);
    v21 = v40;
  }
  v30 = v36;
  *v36 = v21;
  *((_BYTE *)v30 + 8) = v19;
  v26 = (uint64_t)v31;
  return __swift_destroy_boxed_opaque_existential_1(v26);
}

uint64_t sub_2416E9EE8()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 8);
  sub_2416EDF3C();
  if ((v1 & 1) == 0)
    sub_2416EDF48();
  sub_2416EDF48();
  return sub_2416EDF54();
}

uint64_t sub_2416E9F48()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 8) & 1) == 0)
    sub_2416EDF48();
  return sub_2416EDF48();
}

uint64_t sub_2416E9F8C()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 8);
  sub_2416EDF3C();
  if ((v1 & 1) == 0)
    sub_2416EDF48();
  sub_2416EDF48();
  return sub_2416EDF54();
}

uint64_t sub_2416E9FE8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return MentalHealthInjector.StateOfMindDomainOrNone.init(from:)(a1, a2);
}

uint64_t sub_2416E9FFC(_QWORD *a1)
{
  return MentalHealthInjector.StateOfMindDomainOrNone.encode(to:)(a1);
}

uint64_t sub_2416EA010(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t result;

  v3 = *(_BYTE *)(a1 + 8);
  result = *(unsigned __int8 *)(a2 + 8);
  if ((v3 & 1) == 0)
    return (*(_QWORD *)a1 == *(_QWORD *)a2) & ~(_DWORD)result;
  return result;
}

uint64_t MentalHealthInjector.init(configuration:batchSize:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = sub_2416EDD8C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _s13DateGeneratorVMa();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for MentalHealthInjector.Configuration();
  result = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a3 = a2;
  a3[1] = *(uint64_t *)((char *)a1 + *(int *)(result + 32));
  v17 = a1[1];
  v18 = v17 * *a1;
  if ((unsigned __int128)(v17 * (__int128)*a1) >> 64 == v18 >> 63)
  {
    v19 = swift_bridgeObjectRetain();
    a3[2] = sub_2416ED30C(v19, v18);
    a3[3] = v20;
    a3[4] = v21;
    a3[5] = v22;
    sub_2416E83C8((uint64_t)a1, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthInjector.Configuration);
    v23 = type metadata accessor for MentalHealthInjector();
    v25 = (uint64_t)a3 + *(int *)(v23 + 28);
    (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDCEF70], v6);
    sub_2416EDD98();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *(_QWORD *)&v12[*(int *)(v10 + 24)] = 0;
    sub_2416E8384((uint64_t)v16, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthInjector.Configuration);
    sub_2416E8384((uint64_t)v12, v25, (uint64_t (*)(_QWORD))_s13DateGeneratorVMa);
    return sub_2416E8384((uint64_t)a1, (uint64_t)a3 + *(int *)(v23 + 32), (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthInjector.Configuration);
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::OpaquePointer_optional __swiftcall MentalHealthInjector.next()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Bool v10;
  uint64_t v11;
  char *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  char *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  unint64_t v33;
  Swift::OpaquePointer_optional result;

  v1 = v0;
  v2 = _s16ValenceGeneratorVMa();
  MEMORY[0x24BDAC7A8](v2);
  v26 = (uint64_t)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416E7E14(0, (unint64_t *)&qword_257147F50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v4);
  v28 = (uint64_t)&v24 - v5;
  v6 = sub_2416EDD80();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v25 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v24 - v11;
  v33 = MEMORY[0x24BEE4AF8];
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0)
  {
LABEL_21:
    v13 = (void *)MEMORY[0x24BEE4AF8];
    if (sub_2416EDE94() >= *v1)
      goto LABEL_19;
  }
  else if (*v0 < 1)
  {
    v13 = (void *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  v13 = (void *)MEMORY[0x24BEE4AF8];
  v27 = v1 + 2;
  v24 = xmmword_2416EF3A0;
  do
  {
    sub_2416EC290((uint64_t)&v30);
    if ((v32 & 1) != 0)
      break;
    v29 = v30;
    v14 = v31;
    v15 = type metadata accessor for MentalHealthInjector();
    v16 = v28;
    sub_2416E6208(v28);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v16, 1, v6) == 1)
    {
      sub_2416E7DC0(v16);
      break;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v12, v16, v6);
    v17 = v26;
    sub_2416E83C8((uint64_t)v1 + *(int *)(v15 + 32), v26, (uint64_t (*)(_QWORD))_s16ValenceGeneratorVMa);
    v18 = (double *)(v17 + *(int *)(type metadata accessor for MentalHealthInjector.Configuration() + 36));
    v20 = *v18;
    v19 = v18[1];
    sub_2416E6934(v17, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthInjector.Configuration);
    if ((~COERCE__INT64(v19 - v20) & 0x7FF0000000000000) == 0)
    {
      __break(1u);
      goto LABEL_21;
    }
    do
    {
      v30 = 0;
      MEMORY[0x242699C48](&v30, 8);
    }
    while ((unint64_t)(0x20000000000001 * v30) < 0x1FFFFFFFFFF801);
    if ((v14 & 1) == 0)
    {
      sub_2416E7E14(0, &qword_257148008, (uint64_t (*)(uint64_t))type metadata accessor for __HKStateOfMindDomain, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
      v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = v24;
      *(_QWORD *)(v21 + 32) = v29;
    }
    sub_2416EADF0();
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v25, v12, v6);
    sub_2416EA644(MEMORY[0x24BEE4AF8]);
    sub_2416EDE40();
    MEMORY[0x2426996C0]();
    if (*(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2416EDE1C();
    sub_2416EDE28();
    sub_2416EDE10();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    v13 = (void *)v33;
    if (v33 >> 62)
    {
      swift_bridgeObjectRetain();
      v22 = sub_2416EDE94();
      swift_bridgeObjectRelease();
    }
    else
    {
      v22 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
  }
  while (v22 < *v1);
LABEL_19:
  v23 = v13;
  result.value._rawValue = v23;
  result.is_nil = v10;
  return result;
}

unint64_t sub_2416EA644(uint64_t a1)
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
  sub_2416EBFC8();
  v2 = sub_2416EDEB8();
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
    sub_2416E83C8(v6, (uint64_t)&v15, (uint64_t (*)(_QWORD))sub_2416EC030);
    v7 = v15;
    v8 = v16;
    result = sub_2416EAB14(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_2416EC098(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_2416EA774@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2416E8384(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthInjector);
}

uint64_t sub_2416EA798()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2416E75E4(v0);
  sub_2416E6934(v0, (uint64_t (*)(_QWORD))type metadata accessor for MentalHealthInjector);
  return v1;
}

unint64_t sub_2416EA7D4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;

  result = (unint64_t)MentalHealthInjector.next()();
  *a1 = result;
  return result;
}

unint64_t sub_2416EA7F8()
{
  unint64_t result;

  result = qword_2571480D8;
  if (!qword_2571480D8)
  {
    result = MEMORY[0x242699C0C](&unk_2416EF900, &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2571480D8);
  }
  return result;
}

unint64_t sub_2416EA83C()
{
  unint64_t result;

  result = qword_2571480E8;
  if (!qword_2571480E8)
  {
    result = MEMORY[0x242699C0C](&unk_2416EF8B0, &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2571480E8);
  }
  return result;
}

unint64_t sub_2416EA880()
{
  unint64_t result;

  result = qword_2571480F8;
  if (!qword_2571480F8)
  {
    result = MEMORY[0x242699C0C](&unk_2416EF860, &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2571480F8);
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

void sub_2416EA8E8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (!*a2)
  {
    v9 = a3();
    v10 = a5(a1, a4, v9);
    if (!v11)
      atomic_store(v10, a2);
  }
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

void sub_2416EA964()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_257148120)
  {
    sub_2416EA9D0();
    sub_2416EDE7C();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_257148120);
  }
}

unint64_t sub_2416EA9D0()
{
  unint64_t result;

  result = qword_257148128;
  if (!qword_257148128)
  {
    result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_257148128);
  }
  return result;
}

unint64_t sub_2416EAA10(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    MEMORY[0x242699C48](&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          MEMORY[0x242699C48](&v3, 8);
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

unint64_t sub_2416EAA98(uint64_t a1, char a2)
{
  char v4;
  uint64_t v5;

  v4 = a2 & 1;
  sub_2416EDF3C();
  if ((a2 & 1) == 0)
    sub_2416EDF48();
  sub_2416EDF48();
  v5 = sub_2416EDF54();
  return sub_2416EAB78(a1, v4, v5);
}

unint64_t sub_2416EAB14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2416EDF3C();
  sub_2416EDDEC();
  v4 = sub_2416EDF54();
  return sub_2416EABFC(a1, a2, v4);
}

unint64_t sub_2416EAB78(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v5 = -1 << *(_BYTE *)(v3 + 32);
  result = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = ~v5;
    do
    {
      v8 = *(_QWORD *)(v3 + 48) + 16 * result;
      if ((*(_BYTE *)(v8 + 8) & 1) != 0)
      {
        if ((a2 & 1) != 0)
          return result;
      }
      else if ((a2 & 1) == 0 && *(_QWORD *)v8 == a1)
      {
        return result;
      }
      result = (result + 1) & v7;
    }
    while (((*(_QWORD *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_2416EABFC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2416EDF24() & 1) == 0)
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
      while (!v14 && (sub_2416EDF24() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2416EACDC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000;
  if (v2 || (sub_2416EDF24() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701736302 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2416EDF24();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t type metadata accessor for MentalHealthInjector()
{
  uint64_t result;

  result = qword_2571481A0;
  if (!qword_2571481A0)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_2416EADF0()
{
  unint64_t result;

  result = qword_257148000;
  if (!qword_257148000)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257148000);
  }
  return result;
}

unint64_t sub_2416EAE30()
{
  unint64_t result;

  result = qword_257148138;
  if (!qword_257148138)
  {
    result = MEMORY[0x242699C0C](&protocol conformance descriptor for MentalHealthInjector.StateOfMindDomainOrNone, &type metadata for MentalHealthInjector.StateOfMindDomainOrNone);
    atomic_store(result, (unint64_t *)&qword_257148138);
  }
  return result;
}

uint64_t sub_2416EAE74()
{
  return sub_2416E685C(&qword_257148140, (uint64_t (*)(uint64_t))type metadata accessor for MentalHealthInjector, (uint64_t)&protocol conformance descriptor for MentalHealthInjector);
}

char *initializeBufferWithCopyOfBuffer for MentalHealthInjector(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  char *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);

  v4 = (char *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v23 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = (char *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v6 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v6;
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    v7 = *(int *)(a3 + 28);
    v8 = a1 + v7;
    v9 = (uint64_t)a2 + v7;
    *(_OWORD *)(a1 + v7) = *(_OWORD *)((char *)a2 + v7);
    v10 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
    v11 = v10[6];
    v25 = (char *)(v8 + v11);
    v12 = (char *)(v9 + v11);
    v13 = sub_2416EDD80();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    v27 = v13;
    v28 = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v25, v12, v13);
    *(_QWORD *)(v8 + v10[7]) = *(_QWORD *)(v9 + v10[7]);
    *(_QWORD *)(v8 + v10[8]) = *(_QWORD *)(v9 + v10[8]);
    *(_OWORD *)(v8 + v10[9]) = *(_OWORD *)(v9 + v10[9]);
    *(_QWORD *)(v8 + v10[10]) = *(_QWORD *)(v9 + v10[10]);
    v15 = _s13DateGeneratorVMa();
    v16 = *(int *)(v15 + 20);
    v26 = v8 + v16;
    v17 = v9 + v16;
    v18 = sub_2416EDDB0();
    v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
    swift_bridgeObjectRetain();
    v19(v26, v17, v18);
    *(_QWORD *)(v8 + *(int *)(v15 + 24)) = *(_QWORD *)(v9 + *(int *)(v15 + 24));
    v20 = *(int *)(a3 + 32);
    v21 = &v4[v20];
    v22 = (char *)a2 + v20;
    *(_OWORD *)&v4[v20] = *(_OWORD *)v22;
    v28(&v4[v20 + v10[6]], &v22[v10[6]], v27);
    *(_QWORD *)&v21[v10[7]] = *(_QWORD *)&v22[v10[7]];
    *(_QWORD *)&v21[v10[8]] = *(_QWORD *)&v22[v10[8]];
    *(_OWORD *)&v21[v10[9]] = *(_OWORD *)&v22[v10[9]];
    *(_QWORD *)&v21[v10[10]] = *(_QWORD *)&v22[v10[10]];
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for MentalHealthInjector(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = type metadata accessor for MentalHealthInjector.Configuration();
  v6 = v4 + *(int *)(v5 + 24);
  v7 = sub_2416EDD80();
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  swift_bridgeObjectRelease();
  v9 = v4 + *(int *)(_s13DateGeneratorVMa() + 20);
  v10 = sub_2416EDDB0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v8(a1 + *(int *)(a2 + 32) + *(int *)(v5 + 24), v7);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MentalHealthInjector(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(uint64_t, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, char *, uint64_t);

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v6 = *(int *)(a3 + 28);
  v7 = a1 + v6;
  v8 = a2 + v6;
  *(_OWORD *)(a1 + v6) = *(_OWORD *)(a2 + v6);
  v9 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  v10 = v9[6];
  v23 = v7 + v10;
  v11 = (char *)(v8 + v10);
  v12 = sub_2416EDD80();
  v13 = *(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  v25 = v12;
  v26 = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v23, v11, v12);
  *(_QWORD *)(v7 + v9[7]) = *(_QWORD *)(v8 + v9[7]);
  *(_QWORD *)(v7 + v9[8]) = *(_QWORD *)(v8 + v9[8]);
  *(_OWORD *)(v7 + v9[9]) = *(_OWORD *)(v8 + v9[9]);
  *(_QWORD *)(v7 + v9[10]) = *(_QWORD *)(v8 + v9[10]);
  v14 = _s13DateGeneratorVMa();
  v15 = *(int *)(v14 + 20);
  v24 = v7 + v15;
  v16 = v8 + v15;
  v17 = sub_2416EDDB0();
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
  swift_bridgeObjectRetain();
  v18(v24, v16, v17);
  *(_QWORD *)(v7 + *(int *)(v14 + 24)) = *(_QWORD *)(v8 + *(int *)(v14 + 24));
  v19 = *(int *)(a3 + 32);
  v20 = a1 + v19;
  v21 = (char *)(a2 + v19);
  *(_OWORD *)(a1 + v19) = *(_OWORD *)v21;
  v26(a1 + v19 + v9[6], &v21[v9[6]], v25);
  *(_QWORD *)(v20 + v9[7]) = *(_QWORD *)&v21[v9[7]];
  *(_QWORD *)(v20 + v9[8]) = *(_QWORD *)&v21[v9[8]];
  *(_OWORD *)(v20 + v9[9]) = *(_OWORD *)&v21[v9[9]];
  *(_QWORD *)(v20 + v9[10]) = *(_QWORD *)&v21[v9[10]];
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for MentalHealthInjector(char *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;

  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = a2[1];
  *((_QWORD *)a1 + 2) = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 3) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 4) = a2[4];
  *((_QWORD *)a1 + 5) = a2[5];
  v6 = *(int *)(a3 + 28);
  v7 = &a1[v6];
  v8 = (char *)a2 + v6;
  *(_QWORD *)v7 = *(_QWORD *)((char *)a2 + v6);
  *((_QWORD *)v7 + 1) = *(_QWORD *)((char *)a2 + v6 + 8);
  v9 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  v10 = v9[6];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_2416EDD80();
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24);
  v14(v11, v12, v13);
  *(_QWORD *)&v7[v9[7]] = *(_QWORD *)&v8[v9[7]];
  *(_QWORD *)&v7[v9[8]] = *(_QWORD *)&v8[v9[8]];
  v15 = v9[9];
  v16 = &v7[v15];
  v17 = &v8[v15];
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
  *(_QWORD *)&v7[v9[10]] = *(_QWORD *)&v8[v9[10]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = _s13DateGeneratorVMa();
  v19 = *(int *)(v18 + 20);
  v20 = &v7[v19];
  v21 = &v8[v19];
  v22 = sub_2416EDDB0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 24))(v20, v21, v22);
  *(_QWORD *)&v7[*(int *)(v18 + 24)] = *(_QWORD *)&v8[*(int *)(v18 + 24)];
  v23 = *(int *)(a3 + 32);
  v24 = &a1[v23];
  v25 = (char *)a2 + v23;
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
  v14(&a1[v23 + v9[6]], &v25[v9[6]], v13);
  *(_QWORD *)&v24[v9[7]] = *(_QWORD *)&v25[v9[7]];
  *(_QWORD *)&v24[v9[8]] = *(_QWORD *)&v25[v9[8]];
  v26 = v9[9];
  v27 = &v24[v26];
  v28 = &v25[v26];
  *(_QWORD *)v27 = *(_QWORD *)v28;
  *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
  *(_QWORD *)&v24[v9[10]] = *(_QWORD *)&v25[v9[10]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for MentalHealthInjector(char *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v5;
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;

  v5 = a2[1];
  *(_OWORD *)a1 = *a2;
  *((_OWORD *)a1 + 1) = v5;
  *((_OWORD *)a1 + 2) = a2[2];
  v6 = *(int *)(a3 + 28);
  v7 = &a1[v6];
  v8 = (char *)a2 + v6;
  *(_OWORD *)&a1[v6] = *(_OWORD *)((char *)a2 + v6);
  v9 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  v10 = v9[6];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_2416EDD80();
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32);
  v14(v11, v12, v13);
  *(_QWORD *)&v7[v9[7]] = *(_QWORD *)&v8[v9[7]];
  *(_QWORD *)&v7[v9[8]] = *(_QWORD *)&v8[v9[8]];
  *(_OWORD *)&v7[v9[9]] = *(_OWORD *)&v8[v9[9]];
  *(_QWORD *)&v7[v9[10]] = *(_QWORD *)&v8[v9[10]];
  v15 = _s13DateGeneratorVMa();
  v16 = *(int *)(v15 + 20);
  v17 = &v7[v16];
  v18 = &v8[v16];
  v19 = sub_2416EDDB0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  *(_QWORD *)&v7[*(int *)(v15 + 24)] = *(_QWORD *)&v8[*(int *)(v15 + 24)];
  v20 = *(int *)(a3 + 32);
  v21 = &a1[v20];
  v22 = (char *)a2 + v20;
  *(_OWORD *)&a1[v20] = *(_OWORD *)v22;
  v14(&a1[v20 + v9[6]], &v22[v9[6]], v13);
  *(_QWORD *)&v21[v9[7]] = *(_QWORD *)&v22[v9[7]];
  *(_QWORD *)&v21[v9[8]] = *(_QWORD *)&v22[v9[8]];
  *(_OWORD *)&v21[v9[9]] = *(_OWORD *)&v22[v9[9]];
  *(_QWORD *)&v21[v9[10]] = *(_QWORD *)&v22[v9[10]];
  return a1;
}

uint64_t assignWithTake for MentalHealthInjector(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(uint64_t, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v6 = *(int *)(a3 + 28);
  v7 = a1 + v6;
  v8 = a2 + v6;
  *(_OWORD *)(a1 + v6) = *(_OWORD *)(a2 + v6);
  v9 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  v10 = v9[6];
  v11 = v7 + v10;
  v12 = (char *)(v8 + v10);
  v13 = sub_2416EDD80();
  v14 = *(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40);
  v14(v11, v12, v13);
  *(_QWORD *)(v7 + v9[7]) = *(_QWORD *)(v8 + v9[7]);
  *(_QWORD *)(v7 + v9[8]) = *(_QWORD *)(v8 + v9[8]);
  *(_OWORD *)(v7 + v9[9]) = *(_OWORD *)(v8 + v9[9]);
  *(_QWORD *)(v7 + v9[10]) = *(_QWORD *)(v8 + v9[10]);
  swift_bridgeObjectRelease();
  v15 = _s13DateGeneratorVMa();
  v16 = *(int *)(v15 + 20);
  v17 = v7 + v16;
  v18 = v8 + v16;
  v19 = sub_2416EDDB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  *(_QWORD *)(v7 + *(int *)(v15 + 24)) = *(_QWORD *)(v8 + *(int *)(v15 + 24));
  v20 = *(int *)(a3 + 32);
  v21 = a1 + v20;
  v22 = (char *)(a2 + v20);
  *(_OWORD *)(a1 + v20) = *(_OWORD *)v22;
  v14(a1 + v20 + v9[6], &v22[v9[6]], v13);
  *(_QWORD *)(v21 + v9[7]) = *(_QWORD *)&v22[v9[7]];
  *(_QWORD *)(v21 + v9[8]) = *(_QWORD *)&v22[v9[8]];
  *(_OWORD *)(v21 + v9[9]) = *(_OWORD *)&v22[v9[9]];
  *(_QWORD *)(v21 + v9[10]) = *(_QWORD *)&v22[v9[10]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MentalHealthInjector()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2416EB864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = _s13DateGeneratorVMa();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 28);
    }
    else
    {
      v10 = _s16ValenceGeneratorVMa();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for MentalHealthInjector()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2416EB910(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v8 = _s13DateGeneratorVMa();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 28);
    }
    else
    {
      v10 = _s16ValenceGeneratorVMa();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t sub_2416EB9AC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = _s13DateGeneratorVMa();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for MentalHealthInjector.Configuration();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for MentalHealthInjector.StateOfMindDomainOrNone(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MentalHealthInjector.StateOfMindDomainOrNone(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_2416EBAB4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2416EBAD4(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MentalHealthInjector.StateOfMindDomainOrNone()
{
  return &type metadata for MentalHealthInjector.StateOfMindDomainOrNone;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2416EBBEC + 4 * byte_2416EF4A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2416EBC20 + 4 * asc_2416EF4A0[v4]))();
}

uint64_t sub_2416EBC20(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2416EBC28(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2416EBC30);
  return result;
}

uint64_t sub_2416EBC3C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2416EBC44);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2416EBC48(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2416EBC50(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2416EBC5C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2416EBC64(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys()
{
  return &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys;
}

uint64_t getEnumTagSinglePayload for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2416EBD14 + 4 * byte_2416EF4AA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2416EBD34 + 4 * byte_2416EF4AF[v4]))();
}

_BYTE *sub_2416EBD14(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2416EBD34(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2416EBD3C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2416EBD44(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2416EBD4C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2416EBD54(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2416EBD60()
{
  return 0;
}

ValueMetadata *type metadata accessor for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys()
{
  return &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys;
}

ValueMetadata *type metadata accessor for MentalHealthInjector.StateOfMindDomainOrNone.NoneCodingKeys()
{
  return &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.NoneCodingKeys;
}

unint64_t sub_2416EBD8C()
{
  unint64_t result;

  result = qword_2571481E8;
  if (!qword_2571481E8)
  {
    result = MEMORY[0x242699C0C](&unk_2416EF780, &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2571481E8);
  }
  return result;
}

unint64_t sub_2416EBDD4()
{
  unint64_t result;

  result = qword_2571481F0;
  if (!qword_2571481F0)
  {
    result = MEMORY[0x242699C0C](&unk_2416EF838, &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2571481F0);
  }
  return result;
}

unint64_t sub_2416EBE1C()
{
  unint64_t result;

  result = qword_2571481F8;
  if (!qword_2571481F8)
  {
    result = MEMORY[0x242699C0C](&unk_2416EF7A8, &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2571481F8);
  }
  return result;
}

unint64_t sub_2416EBE64()
{
  unint64_t result;

  result = qword_257148200;
  if (!qword_257148200)
  {
    result = MEMORY[0x242699C0C](&unk_2416EF7D0, &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257148200);
  }
  return result;
}

unint64_t sub_2416EBEAC()
{
  unint64_t result;

  result = qword_257148208;
  if (!qword_257148208)
  {
    result = MEMORY[0x242699C0C](&unk_2416EF6F0, &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257148208);
  }
  return result;
}

unint64_t sub_2416EBEF4()
{
  unint64_t result;

  result = qword_257148210;
  if (!qword_257148210)
  {
    result = MEMORY[0x242699C0C](&unk_2416EF718, &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257148210);
  }
  return result;
}

unint64_t sub_2416EBF3C()
{
  unint64_t result;

  result = qword_257148218;
  if (!qword_257148218)
  {
    result = MEMORY[0x242699C0C](&unk_2416EF6A0, &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257148218);
  }
  return result;
}

unint64_t sub_2416EBF84()
{
  unint64_t result;

  result = qword_257148220;
  if (!qword_257148220)
  {
    result = MEMORY[0x242699C0C](&unk_2416EF6C8, &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257148220);
  }
  return result;
}

void sub_2416EBFC8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257148228)
  {
    v0 = sub_2416EDEC4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257148228);
  }
}

void sub_2416EC030()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_257148230)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_257148230);
  }
}

_OWORD *sub_2416EC098(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t _s7CounterVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s7CounterVwxx()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s7CounterVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s7CounterVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
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

_OWORD *_s7CounterVwta(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t _s7CounterVwet(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s7CounterVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s7CounterVMa()
{
  return &_s7CounterVN;
}

uint64_t sub_2416EC290@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;

  result = v1[3];
  v4 = result - 1;
  if (result < 1)
    goto LABEL_34;
  v5 = v1;
  result = sub_2416EAA0C(result);
  v6 = v1[2];
  if (v6)
    v7 = result < v6;
  else
    v7 = 0;
  if (v7)
  {
    v28 = v1[1];
    v29 = *(_QWORD *)(v28 + 16);
    if (v29)
    {
      swift_bridgeObjectRetain();
      result = sub_2416EAA10(v29);
      if (result < 0)
      {
LABEL_43:
        __break(1u);
      }
      else if ((unint64_t)result < *(_QWORD *)(v28 + 16))
      {
        v30 = v28 + 16 * result;
        v25 = *(_QWORD *)(v30 + 32);
        v26 = *(_BYTE *)(v30 + 40);
        result = swift_bridgeObjectRelease();
        v5[2] = v6 - 1;
        goto LABEL_37;
      }
      __break(1u);
      goto LABEL_45;
    }
LABEL_34:
    v25 = 0;
    v26 = 0;
    v31 = 1;
    goto LABEL_38;
  }
  v8 = 0;
  v9 = *v1;
  v10 = *v1 + 64;
  v11 = 1 << *(_BYTE *)(*v1 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(*v1 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  do
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v8 << 6);
    }
    else
    {
      v17 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_40;
      if (v17 >= v14)
        goto LABEL_34;
      v18 = *(_QWORD *)(v10 + 8 * v17);
      ++v8;
      if (!v18)
      {
        v8 = v17 + 1;
        if (v17 + 1 >= v14)
          goto LABEL_34;
        v18 = *(_QWORD *)(v10 + 8 * v8);
        if (!v18)
        {
          v8 = v17 + 2;
          if (v17 + 2 >= v14)
            goto LABEL_34;
          v18 = *(_QWORD *)(v10 + 8 * v8);
          if (!v18)
          {
            v19 = v17 + 3;
            if (v19 >= v14)
              goto LABEL_34;
            v18 = *(_QWORD *)(v10 + 8 * v19);
            if (!v18)
            {
              while (1)
              {
                v8 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_41;
                if (v8 >= v14)
                  goto LABEL_34;
                v18 = *(_QWORD *)(v10 + 8 * v8);
                ++v19;
                if (v18)
                  goto LABEL_24;
              }
            }
            v8 = v19;
          }
        }
      }
LABEL_24:
      v20 = __clz(__rbit64(v18));
      v13 = (v18 - 1) & v18;
      v16 = v20 + (v8 << 6);
    }
    v21 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v16);
    v22 = __OFADD__(v6, v21);
    v6 += v21;
    if (v22)
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
  }
  while (result >= v6);
  v23 = v21 - 1;
  if (__OFSUB__(v21, 1))
    goto LABEL_42;
  v24 = *(_QWORD *)(v9 + 48) + 16 * v16;
  v25 = *(_QWORD *)v24;
  v26 = *(_BYTE *)(v24 + 8);
  if (v21 == 1)
  {
    swift_bridgeObjectRetain();
    sub_2416EC510(v25, v26);
    result = swift_release();
  }
  else
  {
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v33 = *v1;
    *v1 = 0x8000000000000000;
    sub_2416ECA90(v23, v25, v26, isUniquelyReferenced_nonNull_native);
    *v1 = v33;
    swift_release();
    result = swift_bridgeObjectRelease();
  }
  v32 = v1[3];
  v4 = v32 - 1;
  if (__OFSUB__(v32, 1))
  {
LABEL_45:
    __break(1u);
    return result;
  }
LABEL_37:
  v31 = 0;
  v5[3] = v4;
LABEL_38:
  *(_QWORD *)a1 = v25;
  *(_BYTE *)(a1 + 8) = v26;
  *(_BYTE *)(a1 + 9) = v31;
  return result;
}

uint64_t sub_2416EC510(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v4;
  char v5;
  unint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = v2;
  v4 = sub_2416EAA98(a1, a2 & 1);
  if ((v5 & 1) == 0)
    return 0;
  v6 = v4;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = *v2;
  v11 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2416ECBF8();
    v8 = v11;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v6);
  sub_2416EC8A8(v6, v8);
  *v3 = v8;
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_2416EC5BC(uint64_t a1, char a2)
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
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  int64_t v33;
  _QWORD *v34;

  v3 = v2;
  v5 = *v2;
  sub_2416ECE84();
  result = sub_2416EDEAC();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v32 = a2;
    v8 = 0;
    v34 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v16 = v15 | (v8 << 6);
      }
      else
      {
        v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v17 >= v33)
          goto LABEL_33;
        v18 = v34[v17];
        ++v8;
        if (!v18)
        {
          v8 = v17 + 1;
          if (v17 + 1 >= v33)
            goto LABEL_33;
          v18 = v34[v8];
          if (!v18)
          {
            v19 = v17 + 2;
            if (v19 >= v33)
            {
LABEL_33:
              if ((v32 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v31 = 1 << *(_BYTE *)(v5 + 32);
              if (v31 >= 64)
                bzero(v34, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v34 = -1 << v31;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v18 = v34[v19];
            if (!v18)
            {
              while (1)
              {
                v8 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_42;
                if (v8 >= v33)
                  goto LABEL_33;
                v18 = v34[v8];
                ++v19;
                if (v18)
                  goto LABEL_21;
              }
            }
            v8 = v19;
          }
        }
LABEL_21:
        v11 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      v20 = *(_QWORD *)(v5 + 48) + 16 * v16;
      v21 = *(_BYTE *)(v20 + 8);
      v22 = *(_QWORD *)v20;
      v23 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
      sub_2416EDF3C();
      if ((v21 & 1) == 0)
        sub_2416EDF48();
      sub_2416EDF48();
      result = sub_2416EDF54();
      v24 = -1 << *(_BYTE *)(v7 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_41;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v12 + 8 * v26);
        }
        while (v30 == -1);
        v13 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      v14 = *(_QWORD *)(v7 + 48) + 16 * v13;
      *(_QWORD *)v14 = v22;
      *(_BYTE *)(v14 + 8) = v21;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v13) = v23;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

unint64_t sub_2416EC8A8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_2416EDE64();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = 16 * v6;
        v10 = *(_BYTE *)(*(_QWORD *)(a2 + 48) + 16 * v6 + 8);
        sub_2416EDF3C();
        if ((v10 & 1) == 0)
          sub_2416EDF48();
        sub_2416EDF48();
        result = sub_2416EDF54();
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_13;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_13:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + v9);
          if (16 * v3 != v9 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_QWORD *)(v15 + 8 * v3);
          v17 = (_QWORD *)(v15 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 1))
          {
            *v16 = *v17;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2416ECA90(uint64_t a1, uint64_t a2, char a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  char v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;

  v5 = (_QWORD **)v4;
  v9 = a3 & 1;
  v10 = (_QWORD *)*v4;
  v12 = sub_2416EAA98(a2, a3 & 1);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= result && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        *(_QWORD *)(v18[7] + 8 * v12) = a1;
        return result;
      }
      return sub_2416ECBA8(v12, a2, v9, a1, v18);
    }
    if (v17 >= result && (a4 & 1) == 0)
    {
      result = (uint64_t)sub_2416ECBF8();
      goto LABEL_7;
    }
    sub_2416EC5BC(result, a4 & 1);
    result = sub_2416EAA98(a2, v9);
    if ((v16 & 1) == (v19 & 1))
    {
      v12 = result;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
      return sub_2416ECBA8(v12, a2, v9, a1, v18);
    }
  }
  result = sub_2416EDF30();
  __break(1u);
  return result;
}

unint64_t sub_2416ECBA8(unint64_t result, uint64_t a2, char a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = a5[6] + 16 * result;
  *(_QWORD *)v5 = a2;
  *(_BYTE *)(v5 + 8) = a3 & 1;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

void *sub_2416ECBF8()
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;

  v1 = v0;
  sub_2416ECE84();
  v2 = *v0;
  v3 = sub_2416EDEA0();
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
    v25 = __clz(__rbit64(v23));
    v12 = (v23 - 1) & v23;
    v15 = v25 + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 16 * v15;
    v18 = *(_QWORD *)v17;
    LOBYTE(v17) = *(_BYTE *)(v17 + 8);
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = *(_QWORD *)(v4 + 48) + v16;
    *(_QWORD *)v21 = v18;
    *(_BYTE *)(v21 + 8) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
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

char *sub_2416ECD94(char *result, int64_t a2, char a3, char *a4)
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
  size_t v15;

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
    sub_2416ED474();
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
  v15 = 16 * v8;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v15);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_2416ECE84()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257148238)
  {
    sub_2416ECEE4();
    v0 = sub_2416EDEC4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257148238);
  }
}

unint64_t sub_2416ECEE4()
{
  unint64_t result;

  result = qword_257148240;
  if (!qword_257148240)
  {
    result = MEMORY[0x242699C0C](&protocol conformance descriptor for MentalHealthInjector.StateOfMindDomainOrNone, &type metadata for MentalHealthInjector.StateOfMindDomainOrNone);
    atomic_store(result, (unint64_t *)&qword_257148240);
  }
  return result;
}

uint64_t sub_2416ECF28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t result;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  int64_t v30;
  unint64_t v31;
  unint64_t v32;
  int64_t v33;
  unint64_t v34;
  int64_t v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;

  v2 = sub_2416EDE4C();
  v3 = v2;
  v4 = *(_QWORD *)(v2 + 16);
  if (v4)
  {
    v5 = 0;
    v6 = a1 + 64;
    v7 = v2 + 32;
    v8 = (char *)MEMORY[0x24BEE4AF8];
    v39 = v2 + 32;
    while (1)
    {
      if (v5 >= *(_QWORD *)(v3 + 16))
        goto LABEL_69;
      v10 = 0;
      v11 = *(_QWORD *)(v7 + 8 * v5++);
      v12 = 1 << *(_BYTE *)(a1 + 32);
      v13 = v12 < 64 ? ~(-1 << v12) : -1;
      v14 = v13 & *(_QWORD *)(a1 + 64);
      v15 = (unint64_t)(v12 + 63) >> 6;
      while (1)
      {
        if (v14)
        {
          v16 = __clz(__rbit64(v14));
          v14 &= v14 - 1;
          v17 = v16 | (v10 << 6);
          goto LABEL_30;
        }
        v18 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
          __break(1u);
LABEL_69:
          __break(1u);
LABEL_70:
          __break(1u);
          goto LABEL_71;
        }
        if (v18 >= v15)
          goto LABEL_33;
        v19 = *(_QWORD *)(v6 + 8 * v18);
        ++v10;
        if (!v19)
        {
          v10 = v18 + 1;
          if (v18 + 1 >= v15)
            goto LABEL_33;
          v19 = *(_QWORD *)(v6 + 8 * v10);
          if (!v19)
          {
            v10 = v18 + 2;
            if (v18 + 2 >= v15)
              goto LABEL_33;
            v19 = *(_QWORD *)(v6 + 8 * v10);
            if (!v19)
            {
              v10 = v18 + 3;
              if (v18 + 3 >= v15)
                goto LABEL_33;
              v19 = *(_QWORD *)(v6 + 8 * v10);
              if (!v19)
              {
                v10 = v18 + 4;
                if (v18 + 4 >= v15)
                  goto LABEL_33;
                v19 = *(_QWORD *)(v6 + 8 * v10);
                if (!v19)
                  break;
              }
            }
          }
        }
LABEL_29:
        v14 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_30:
        v21 = *(_QWORD *)(a1 + 48) + 16 * v17;
        if ((*(_BYTE *)(v21 + 8) & 1) == 0 && v11 == *(_QWORD *)v21)
          goto LABEL_4;
      }
      v20 = v18 + 5;
      if (v20 < v15)
        break;
LABEL_33:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v8 = sub_2416ECD94(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
      v23 = *((_QWORD *)v8 + 2);
      v22 = *((_QWORD *)v8 + 3);
      if (v23 >= v22 >> 1)
        v8 = sub_2416ECD94((char *)(v22 > 1), v23 + 1, 1, v8);
      *((_QWORD *)v8 + 2) = v23 + 1;
      v9 = &v8[16 * v23];
      *((_QWORD *)v9 + 4) = v11;
      v9[40] = 0;
      v7 = v39;
LABEL_4:
      if (v5 == v4)
      {
        result = swift_bridgeObjectRelease();
        goto LABEL_39;
      }
    }
    v19 = *(_QWORD *)(v6 + 8 * v20);
    if (!v19)
    {
      while (1)
      {
        v10 = v20 + 1;
        if (__OFADD__(v20, 1))
          break;
        if (v10 >= v15)
          goto LABEL_33;
        v19 = *(_QWORD *)(v6 + 8 * v10);
        ++v20;
        if (v19)
          goto LABEL_29;
      }
LABEL_71:
      __break(1u);
LABEL_72:
      v8 = sub_2416ECD94(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
      goto LABEL_64;
    }
    v10 = v20;
    goto LABEL_29;
  }
  result = swift_bridgeObjectRelease();
  v8 = (char *)MEMORY[0x24BEE4AF8];
LABEL_39:
  v25 = 0;
  v26 = a1 + 64;
  v27 = 1 << *(_BYTE *)(a1 + 32);
  v28 = -1;
  if (v27 < 64)
    v28 = ~(-1 << v27);
  v29 = v28 & *(_QWORD *)(a1 + 64);
  v30 = (unint64_t)(v27 + 63) >> 6;
  while (1)
  {
    if (v29)
    {
      v31 = __clz(__rbit64(v29));
      v29 &= v29 - 1;
      v32 = v31 | (v25 << 6);
      goto LABEL_43;
    }
    v33 = v25 + 1;
    if (__OFADD__(v25, 1))
      goto LABEL_70;
    if (v33 >= v30)
      break;
    v34 = *(_QWORD *)(v26 + 8 * v33);
    ++v25;
    if (!v34)
    {
      v25 = v33 + 1;
      if (v33 + 1 >= v30)
        break;
      v34 = *(_QWORD *)(v26 + 8 * v25);
      if (!v34)
      {
        v25 = v33 + 2;
        if (v33 + 2 >= v30)
          break;
        v34 = *(_QWORD *)(v26 + 8 * v25);
        if (!v34)
        {
          v25 = v33 + 3;
          if (v33 + 3 >= v30)
            break;
          v34 = *(_QWORD *)(v26 + 8 * v25);
          if (!v34)
          {
            v25 = v33 + 4;
            if (v33 + 4 >= v30)
              break;
            v34 = *(_QWORD *)(v26 + 8 * v25);
            if (!v34)
            {
              v35 = v33 + 5;
              if (v35 >= v30)
                break;
              v34 = *(_QWORD *)(v26 + 8 * v35);
              if (!v34)
              {
                while (1)
                {
                  v25 = v35 + 1;
                  if (__OFADD__(v35, 1))
                    break;
                  if (v25 >= v30)
                    goto LABEL_63;
                  v34 = *(_QWORD *)(v26 + 8 * v25);
                  ++v35;
                  if (v34)
                    goto LABEL_62;
                }
                __break(1u);
                return result;
              }
              v25 = v35;
            }
          }
        }
      }
    }
LABEL_62:
    v29 = (v34 - 1) & v34;
    v32 = __clz(__rbit64(v34)) + (v25 << 6);
LABEL_43:
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 48) + 16 * v32 + 8) & 1) != 0)
      return (uint64_t)v8;
  }
LABEL_63:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_72;
LABEL_64:
  v37 = *((_QWORD *)v8 + 2);
  v36 = *((_QWORD *)v8 + 3);
  if (v37 >= v36 >> 1)
    v8 = sub_2416ECD94((char *)(v36 > 1), v37 + 1, 1, v8);
  *((_QWORD *)v8 + 2) = v37 + 1;
  v38 = &v8[16 * v37];
  *((_QWORD *)v38 + 4) = 0;
  v38[40] = 1;
  return (uint64_t)v8;
}

uint64_t sub_2416ED30C(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  result = sub_2416ECF28(a1);
  v5 = 0;
  v6 = 0;
  v7 = a1 + 64;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a1 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  while (v10)
  {
    v12 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    v13 = v12 | (v5 << 6);
LABEL_5:
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v13);
    v15 = __OFADD__(v6, v14);
    v6 += v14;
    if (v15)
    {
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  v16 = v5 + 1;
  if (__OFADD__(v5, 1))
    goto LABEL_28;
  if (v16 >= v11)
  {
LABEL_25:
    if (!__OFSUB__(a2, v6))
      return a1;
    goto LABEL_29;
  }
  v17 = *(_QWORD *)(v7 + 8 * v16);
  ++v5;
  if (v17)
    goto LABEL_24;
  v5 = v16 + 1;
  if (v16 + 1 >= v11)
    goto LABEL_25;
  v17 = *(_QWORD *)(v7 + 8 * v5);
  if (v17)
    goto LABEL_24;
  v5 = v16 + 2;
  if (v16 + 2 >= v11)
    goto LABEL_25;
  v17 = *(_QWORD *)(v7 + 8 * v5);
  if (v17)
    goto LABEL_24;
  v5 = v16 + 3;
  if (v16 + 3 >= v11)
    goto LABEL_25;
  v17 = *(_QWORD *)(v7 + 8 * v5);
  if (v17)
    goto LABEL_24;
  v5 = v16 + 4;
  if (v16 + 4 >= v11)
    goto LABEL_25;
  v17 = *(_QWORD *)(v7 + 8 * v5);
  if (v17)
  {
LABEL_24:
    v10 = (v17 - 1) & v17;
    v13 = __clz(__rbit64(v17)) + (v5 << 6);
    goto LABEL_5;
  }
  v18 = v16 + 5;
  if (v18 >= v11)
    goto LABEL_25;
  v17 = *(_QWORD *)(v7 + 8 * v18);
  if (v17)
  {
    v5 = v18;
    goto LABEL_24;
  }
  while (1)
  {
    v5 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v5 >= v11)
      goto LABEL_25;
    v17 = *(_QWORD *)(v7 + 8 * v5);
    ++v18;
    if (v17)
      goto LABEL_24;
  }
LABEL_30:
  __break(1u);
  return result;
}

void sub_2416ED474()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257148248)
  {
    v0 = sub_2416EDF18();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257148248);
  }
}

uint64_t sub_2416EDD74()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_2416EDD80()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2416EDD8C()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_2416EDD98()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_2416EDDA4()
{
  return MEMORY[0x24BDCF0C0]();
}

uint64_t sub_2416EDDB0()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_2416EDDBC()
{
  return MEMORY[0x24BDD2458]();
}

uint64_t sub_2416EDDC8()
{
  return MEMORY[0x24BDD2468]();
}

uint64_t sub_2416EDDD4()
{
  return MEMORY[0x24BDD2488]();
}

uint64_t sub_2416EDDE0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2416EDDEC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2416EDDF8()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_2416EDE04()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2416EDE10()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2416EDE1C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2416EDE28()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2416EDE34()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_2416EDE40()
{
  return MEMORY[0x24BDD2500]();
}

uint64_t sub_2416EDE4C()
{
  return MEMORY[0x24BDD2618]();
}

uint64_t sub_2416EDE58()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2416EDE64()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2416EDE70()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_2416EDE7C()
{
  return MEMORY[0x24BEE2700]();
}

uint64_t sub_2416EDE88()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2416EDE94()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2416EDEA0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2416EDEAC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2416EDEB8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2416EDEC4()
{
  return MEMORY[0x24BEE30A0]();
}

uint64_t sub_2416EDED0()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2416EDEDC()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_2416EDEE8()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2416EDEF4()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_2416EDF00()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_2416EDF0C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2416EDF18()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_2416EDF24()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2416EDF30()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2416EDF3C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2416EDF48()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2416EDF54()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2416EDF60()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2416EDF6C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2416EDF78()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2416EDF84()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x24BDD3730]();
}

uint64_t HKSynchronizeNanoPreferencesUserDefaults()
{
  return MEMORY[0x24BDD3800]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NSStringFromHKDayIndexRange()
{
  return MEMORY[0x24BDD38A0]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x24BEE4D20]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}


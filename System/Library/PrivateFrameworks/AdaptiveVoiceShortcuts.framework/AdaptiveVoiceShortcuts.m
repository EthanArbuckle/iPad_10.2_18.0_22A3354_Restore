void sub_235F1A314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

id convertToShortLPCMBufFromFloatLPCMBuf(void *a1)
{
  id v1;
  unint64_t v2;
  vDSP_Length v3;
  void *v4;
  void *v5;
  id v6;
  const float *v7;
  id v8;
  id v9;
  const float *v10;
  id v11;
  id v12;
  const float *v13;
  id v14;
  float __C;
  float __B;
  float v18;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  v3 = v2 >> 2;
  v18 = 32767.0;
  __C = 1.0;
  __B = -1.0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v2 & 0xFFFFFFFFFFFFFFFCLL);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 2 * (v2 >> 2));
  v6 = objc_retainAutorelease(v1);
  v7 = (const float *)objc_msgSend(v6, "bytes");

  v8 = objc_retainAutorelease(v4);
  vDSP_vclip(v7, 1, &__B, &__C, (float *)objc_msgSend(v8, "bytes"), 1, v3);
  v9 = objc_retainAutorelease(v8);
  v10 = (const float *)objc_msgSend(v9, "bytes");
  v11 = objc_retainAutorelease(v9);
  vDSP_vsmul(v10, 1, &v18, (float *)objc_msgSend(v11, "bytes"), 1, v3);
  v12 = objc_retainAutorelease(v11);
  v13 = (const float *)objc_msgSend(v12, "bytes");
  v14 = objc_retainAutorelease(v5);
  vDSP_vfix16(v13, 1, (__int16 *)objc_msgSend(v14, "bytes"), 1, v3);

  return v14;
}

void AXPIBridgePerformWarm()
{
  id v0;

  objc_msgSend(getAXPISystemActionHelperClass(), "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "warm");

}

id getAXPISystemActionHelperClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAXPISystemActionHelperClass_softClass;
  v7 = getAXPISystemActionHelperClass_softClass;
  if (!getAXPISystemActionHelperClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAXPISystemActionHelperClass_block_invoke;
    v3[3] = &unk_25074F3B8;
    v3[4] = &v4;
    __getAXPISystemActionHelperClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_235F1A818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AXPIBridgePerformActionForSystemAction(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  objc_msgSend(getAXPISystemActionHelperClass(), "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performActionForSystemAction:", v1);

}

Class __getAXPISystemActionHelperClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary)
  {
    AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getAXPISystemActionHelperClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("AXPISystemActionHelper");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getAXPISystemActionHelperClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for AVSConfirmationView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for AVSConfirmationView()
{
  return swift_release();
}

_QWORD *assignWithCopy for AVSConfirmationView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for AVSConfirmationView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AVSConfirmationView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AVSConfirmationView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AVSConfirmationView()
{
  return &type metadata for AVSConfirmationView;
}

uint64_t sub_235F1ADB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235F1ADC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
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
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;

  v54 = a3;
  v5 = sub_235F4C2F4();
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v50 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC0);
  MEMORY[0x24BDAC7A8](v7);
  v53 = (char *)v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = type metadata accessor for AdaptiveVoiceShortcut();
  MEMORY[0x24BDAC7A8](v44);
  v10 = (char *)v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AD0);
  v48 = *(_QWORD *)(v14 - 8);
  v49 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v47 = (char *)v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256394AA8 != -1)
    swift_once();
  v43[2] = a1;
  v16 = (void *)qword_256398358;
  if (qword_256398358)
  {
    v17 = (id)qword_256398358;
  }
  else
  {
    v17 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v16 = 0;
  }
  v18 = v16;
  v19 = sub_235F4C108();
  v45 = v20;
  v46 = v19;

  sub_235F3DA44(0xD000000000000016);
  v21 = (void *)qword_256398358;
  if (qword_256398358)
  {
    v22 = (id)qword_256398358;
  }
  else
  {
    v22 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v21 = 0;
  }
  v23 = v21;
  v43[1] = sub_235F4C108();

  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394AD8);
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_235F4D800;
  v25 = a2 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  v26 = v44;
  v27 = (uint64_t *)(v25 + *(int *)(v44 + 20));
  v28 = *v27;
  v29 = v27[1];
  *(_QWORD *)(v24 + 56) = MEMORY[0x24BEE0D00];
  v30 = sub_235F1BC3C();
  *(_QWORD *)(v24 + 64) = v30;
  if (v29)
    v31 = v28;
  else
    v31 = 0;
  v32 = 0xE000000000000000;
  if (v29)
    v32 = v29;
  *(_QWORD *)(v24 + 32) = v31;
  *(_QWORD *)(v24 + 40) = v32;
  sub_235F1BC80(v25, (uint64_t)v10);
  sub_235F1BEC4((uint64_t)&v10[*(int *)(v26 + 28)], (uint64_t)v13, &qword_256394AC8);
  swift_bridgeObjectRetain();
  sub_235F1BD10((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
  v33 = type metadata accessor for AvailableShortcutAction();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 48))(v13, 1, v33) == 1)
  {
    sub_235F1BF08((uint64_t)v13, &qword_256394AC8);
    v34 = (_QWORD *)(v24 + 72);
    *(_QWORD *)(v24 + 96) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v24 + 104) = v30;
LABEL_18:
    *v34 = 0;
    v37 = 0xE000000000000000;
    goto LABEL_19;
  }
  v35 = &v13[*(int *)(v33 + 20)];
  v36 = *(_QWORD *)v35;
  v37 = *((_QWORD *)v35 + 1);
  swift_bridgeObjectRetain();
  sub_235F1BD10((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
  v34 = (_QWORD *)(v24 + 72);
  *(_QWORD *)(v24 + 96) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v24 + 104) = v30;
  if (!v37)
    goto LABEL_18;
  *v34 = v36;
LABEL_19:
  *(_QWORD *)(v24 + 80) = v37;
  sub_235F4CA8C();
  v38 = swift_bridgeObjectRelease();
  MEMORY[0x24BDAC7A8](v38);
  v55 = MEMORY[0x24BEE4AF8];
  sub_235F1BE00(&qword_256394AE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFF7C8], MEMORY[0x24BDFF7E0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394AF0);
  sub_235F1BF90(&qword_256394AF8, &qword_256394AF0, MEMORY[0x24BEE12C8]);
  v39 = v50;
  v40 = v52;
  sub_235F4CC48();
  sub_235F4C960();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v39, v40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394B00);
  sub_235F1BF90(&qword_256394B08, &qword_256394B00, MEMORY[0x24BDF4700]);
  v41 = v47;
  sub_235F4C2E8();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v48 + 32))(v54, v41, v49);
}

uint64_t sub_235F1B3B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a3 = sub_235F4C630();
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394B10);
  sub_235F1B438(a1, a2, (char *)(a3 + *(int *)(v6 + 44)));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394B00);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a3, 0, 1, v7);
}

uint64_t sub_235F1B438@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  _QWORD v33[3];
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;

  v35 = a1;
  v42 = a3;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394B18);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v40 = (uint64_t)v33 - v8;
  v9 = sub_235F4C684();
  v39 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394B20);
  v38 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394B28);
  v37 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v36 = (char *)v33 - v19;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a1;
  *(_QWORD *)(v20 + 24) = a2;
  v34 = a2;
  swift_retain();
  v33[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_256394B30);
  v33[1] = sub_235F1BD7C();
  sub_235F4C93C();
  sub_235F4C678();
  sub_235F1BF90(&qword_256394B50, &qword_256394B20, MEMORY[0x24BDF43B0]);
  sub_235F1BE00(&qword_256394B58, (uint64_t (*)(uint64_t))MEMORY[0x24BDF0DA8], MEMORY[0x24BDF0D88]);
  sub_235F4C804();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v9);
  v21 = v38;
  v22 = *(void (**)(char *, uint64_t))(v38 + 8);
  v22(v14, v12);
  v24 = v36;
  v23 = v37;
  (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v36, v18, v15);
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = v35;
  *(_QWORD *)(v25 + 24) = v34;
  swift_retain();
  sub_235F4C93C();
  LOBYTE(v11) = sub_235F4C738();
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v7, v14, v12);
  v26 = &v7[*(int *)(v41 + 36)];
  *v26 = (char)v11;
  *(_OWORD *)(v26 + 8) = 0u;
  *(_OWORD *)(v26 + 24) = 0u;
  v26[40] = 1;
  v22(v14, v12);
  v27 = v40;
  sub_235F1BE7C((uint64_t)v7, v40);
  v28 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
  v28(v18, v24, v15);
  sub_235F1BEC4(v27, (uint64_t)v7, &qword_256394B18);
  v29 = v42;
  v28(v42, v18, v15);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394B60);
  sub_235F1BEC4((uint64_t)v7, (uint64_t)&v29[*(int *)(v30 + 48)], &qword_256394B18);
  sub_235F1BF08(v27, &qword_256394B18);
  v31 = *(void (**)(char *, uint64_t))(v23 + 8);
  v31(v24, v15);
  sub_235F1BF08((uint64_t)v7, &qword_256394B18);
  return ((uint64_t (*)(char *, uint64_t))v31)(v18, v15);
}

uint64_t sub_235F1B80C@<X0>(uint64_t a1@<X8>)
{
  return sub_235F1B9B0((void (*)(uint64_t *__return_ptr))sub_235F1B818, a1);
}

uint64_t sub_235F1B818@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;

  sub_235F4C5F4();
  if (qword_256394AA8 != -1)
    swift_once();
  v2 = (void *)qword_256398358;
  if (!qword_256398358)
    v3 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v4 = v2;
  v5 = sub_235F4C7BC();
  v7 = v6;
  v9 = v8 & 1;
  v10 = sub_235F4C7B0();
  v12 = v11;
  v14 = v13;
  v16 = v15 & 1;
  sub_235F1BF54(v5, v7, v9);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 24) = v12;
  *(_BYTE *)(a1 + 32) = v16;
  *(_QWORD *)(a1 + 40) = v14;
  *(_QWORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 56) = 1;
  sub_235F1BF44(v10, v12, v16);
  swift_bridgeObjectRetain();
  sub_235F1BF54(v10, v12, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_235F1B9A4@<X0>(uint64_t a1@<X8>)
{
  return sub_235F1B9B0((void (*)(uint64_t *__return_ptr))sub_235F1BA80, a1);
}

uint64_t sub_235F1B9B0@<X0>(void (*a1)(uint64_t *__return_ptr)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v17 = sub_235F4C5B8();
  a1(&v18);
  v4 = v18;
  v5 = v19;
  v6 = v20;
  v7 = v21;
  v8 = v22;
  v9 = v23;
  v10 = v24;
  v11 = v25;
  LOBYTE(a1) = sub_235F4C75C();
  result = sub_235F4C3FC();
  *(_QWORD *)a2 = v17;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 24) = v4;
  *(_BYTE *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 40) = v6;
  *(_QWORD *)(a2 + 48) = v7;
  *(_BYTE *)(a2 + 56) = v8;
  *(_QWORD *)(a2 + 64) = v9;
  *(_QWORD *)(a2 + 72) = v10;
  *(_BYTE *)(a2 + 80) = v11;
  *(_BYTE *)(a2 + 88) = (_BYTE)a1;
  *(_QWORD *)(a2 + 96) = v13;
  *(_QWORD *)(a2 + 104) = v14;
  *(_QWORD *)(a2 + 112) = v15;
  *(_QWORD *)(a2 + 120) = v16;
  *(_BYTE *)(a2 + 128) = 0;
  return result;
}

uint64_t sub_235F1BA80@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;

  sub_235F4C5F4();
  if (qword_256394AA8 != -1)
    swift_once();
  v2 = (void *)qword_256398358;
  if (!qword_256398358)
    v3 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v4 = v2;
  v5 = sub_235F4C7BC();
  v7 = v6;
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  v9 = v8 & 1;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v8 & 1;
  *(_QWORD *)(a1 + 40) = v10;
  *(_QWORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 56) = 1;
  sub_235F1BF44(v5, v6, v8 & 1);
  swift_bridgeObjectRetain();
  sub_235F1BF54(v5, v7, v9);
  return swift_bridgeObjectRelease();
}

uint64_t sub_235F1BBDC()
{
  return sub_235F4C81C();
}

uint64_t sub_235F1BBF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_235F1ADC8(*v1, v1[1], a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7E7080]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_235F1BC3C()
{
  unint64_t result;

  result = qword_256394AE0;
  if (!qword_256394AE0)
  {
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256394AE0);
  }
  return result;
}

uint64_t sub_235F1BC80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AdaptiveVoiceShortcut();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F1BCC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235F1B3B8(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7E708C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_235F1BD10(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_235F1BD4C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F1BD70()
{
  return sub_235F1BE4C((void (*)(uint64_t))sub_235F322FC);
}

unint64_t sub_235F1BD7C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256394B38;
  if (!qword_256394B38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394B30);
    v2[0] = sub_235F1BF90(&qword_256394B40, &qword_256394B48, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256394B38);
  }
  return result;
}

uint64_t sub_235F1BE00(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7E7098](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235F1BE40()
{
  return sub_235F1BE4C((void (*)(uint64_t))sub_235F3276C);
}

uint64_t sub_235F1BE4C(void (*a1)(uint64_t))
{
  uint64_t v2;

  v2 = swift_retain();
  a1(v2);
  return swift_release();
}

uint64_t sub_235F1BE7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F1BEC4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_235F1BF08(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_235F1BF44(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_235F1BF54(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_235F1BF64()
{
  return sub_235F1BF90(&qword_256394B68, &qword_256394AD0, MEMORY[0x24BDFF798]);
}

uint64_t sub_235F1BF90(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7E7098](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235F1BFD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  int64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = sub_235F4C0D8();
  v20 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_shortcutsNamesDictionary);
  v5 = sub_235F4CA5C();

  v6 = sub_235F1EE0C(v5);
  swift_bridgeObjectRelease();
  v7 = v6[2];
  if (v7)
  {
    v19 = v0;
    v23 = MEMORY[0x24BEE4AF8];
    sub_235F25908(0, v7, 0);
    v18 = v6;
    v8 = v6 + 5;
    do
    {
      v21 = sub_235F4CAA4();
      v22 = v9;
      swift_bridgeObjectRetain();
      sub_235F4C0CC();
      sub_235F1EA80();
      v10 = sub_235F4CC18();
      v12 = v11;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v3, v1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v13 = v23;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_235F25908(0, *(_QWORD *)(v13 + 16) + 1, 1);
        v13 = v23;
      }
      v15 = *(_QWORD *)(v13 + 16);
      v14 = *(_QWORD *)(v13 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_235F25908(v14 > 1, v15 + 1, 1);
        v13 = v23;
      }
      v8 += 2;
      *(_QWORD *)(v13 + 16) = v15 + 1;
      v16 = v13 + 16 * v15;
      *(_QWORD *)(v16 + 32) = v10;
      *(_QWORD *)(v16 + 40) = v12;
      --v7;
    }
    while (v7);
    swift_release();
    v0 = v19;
  }
  else
  {
    swift_release();
    v13 = MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)(v0 + 16) = v13;
  return swift_bridgeObjectRelease();
}

uint64_t sub_235F1C1F0()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AVSCommandNameViewModel()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for AVSCommandNameView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_235F1C264()
{
  return swift_retain();
}

uint64_t destroy for AVSCommandNameView()
{
  sub_235F1C2BC();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_235F1C2BC()
{
  return swift_release();
}

uint64_t initializeWithCopy for AVSCommandNameView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_235F1C264();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  v7 = a2[4];
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = v7;
  v8 = a2[6];
  *(_QWORD *)(a1 + 40) = a2[5];
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = a2[7];
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
  *(_QWORD *)(a1 + 72) = a2[9];
  *(_BYTE *)(a1 + 80) = *((_BYTE *)a2 + 80);
  *(_BYTE *)(a1 + 88) = *((_BYTE *)a2 + 88);
  *(_QWORD *)(a1 + 96) = a2[12];
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AVSCommandNameView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_235F1C264();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_235F1C2BC();
  *(_QWORD *)(a1 + 24) = a2[3];
  *(_QWORD *)(a1 + 32) = a2[4];
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 40) = a2[5];
  *(_QWORD *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = a2[7];
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
  *(_QWORD *)(a1 + 72) = a2[9];
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 80) = *((_BYTE *)a2 + 80);
  *(_BYTE *)(a1 + 88) = *((_BYTE *)a2 + 88);
  *(_QWORD *)(a1 + 96) = a2[12];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
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
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for AVSCommandNameView(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;

  v4 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_235F1C2BC();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AVSCommandNameView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AVSCommandNameView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
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
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AVSCommandNameView()
{
  return &type metadata for AVSCommandNameView;
}

uint64_t sub_235F1C604()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_235F1C610@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AVSCommandNameViewModel();
  result = sub_235F4C390();
  *a1 = result;
  return result;
}

uint64_t sub_235F1C648()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235F1C658()
{
  uint64_t v0;

  type metadata accessor for AVSCommandNameViewModel();
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
  sub_235F1BFD8();
  return v0;
}

uint64_t sub_235F1C698@<X0>(uint64_t a1@<X8>)
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
  char *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t (**v16)();
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = v1;
  v19 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394C30);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394C38);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = v2;
  sub_235F4C708();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394C40);
  sub_235F1E778();
  sub_235F4C42C();
  v20 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394C60);
  sub_235F1BF90(&qword_256394C68, &qword_256394C30, MEMORY[0x24BDEB238]);
  sub_235F1BF90(&qword_256394C70, &qword_256394C60, MEMORY[0x24BDF43B0]);
  sub_235F4C888();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v11 = swift_allocObject();
  v12 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v11 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v11 + 96) = v12;
  *(_QWORD *)(v11 + 112) = *(_QWORD *)(v2 + 96);
  v13 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v11 + 32) = v13;
  v14 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v11 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v11 + 64) = v14;
  v15 = v19;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v19, v10, v7);
  v16 = (uint64_t (**)())(v15 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256394C78) + 36));
  *v16 = sub_235F1E808;
  v16[1] = (uint64_t (*)())v11;
  v16[2] = 0;
  v16[3] = 0;
  sub_235F1E85C(v2);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_235F1C8AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394C58);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v6 = sub_235F4C630();
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394C88);
  sub_235F1C994(a1, (uint64_t)&v6[*(int *)(v7 + 44)]);
  LOBYTE(a1) = sub_235F4C720();
  sub_235F1BEC4((uint64_t)v6, a2, &qword_256394C58);
  v8 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256394C40) + 36);
  *(_BYTE *)v8 = a1;
  *(_OWORD *)(v8 + 8) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  *(_BYTE *)(v8 + 40) = 1;
  return sub_235F1BF08((uint64_t)v6, &qword_256394C58);
}

uint64_t sub_235F1C994@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v15;
  uint64_t v16;
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
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t KeyPath;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
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
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  char *v84;
  uint64_t OpaqueTypeConformance2;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  _OWORD *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t (*v122)();
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  id v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  char v131;
  int v132;
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
  char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  char *v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  char *v177;
  uint64_t v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t (*v185)();
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  _OWORD *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  __int128 v201;
  uint64_t v202;
  __int128 v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  char v207;
  __int128 v208;
  uint64_t v209;

  v189 = a2;
  v191 = sub_235F4C4F8();
  MEMORY[0x24BDAC7A8](v191);
  v197 = (_OWORD *)((char *)&v154 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v171 = sub_235F4C4E0();
  v170 = *(_QWORD *)(v171 - 8);
  MEMORY[0x24BDAC7A8](v171);
  v169 = (char *)&v154 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v165 = sub_235F4C474();
  v164 = *(_QWORD *)(v165 - 8);
  MEMORY[0x24BDAC7A8](v165);
  v163 = (char *)&v154 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394C90);
  v162 = *(_QWORD *)(v166 - 8);
  MEMORY[0x24BDAC7A8](v166);
  v161 = (char *)&v154 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v172 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394C98);
  v168 = *(_QWORD *)(v172 - 8);
  MEMORY[0x24BDAC7A8](v172);
  v167 = (char *)&v154 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v176 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394CA0);
  v174 = *(_QWORD *)(v176 - 8);
  MEMORY[0x24BDAC7A8](v176);
  v173 = (char *)&v154 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v180 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394CA8);
  v178 = *(_QWORD *)(v180 - 8);
  MEMORY[0x24BDAC7A8](v180);
  v177 = (char *)&v154 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394CB0);
  v181 = *(_QWORD *)(v182 - 8);
  MEMORY[0x24BDAC7A8](v182);
  v179 = (char *)&v154 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v175 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394CB8);
  MEMORY[0x24BDAC7A8](v175);
  v185 = (uint64_t (*)())((char *)&v154 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394CC0);
  MEMORY[0x24BDAC7A8](v183);
  v188 = (uint64_t)&v154 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v184 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394CC8);
  MEMORY[0x24BDAC7A8](v184);
  v190 = (char *)&v154 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v187 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394CD0);
  v14 = MEMORY[0x24BDAC7A8](v187);
  v196 = (uint64_t)&v154 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v186 = (uint64_t)&v154 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v200 = (uint64_t)&v154 - v18;
  v156 = sub_235F4C624();
  v155 = *(_QWORD *)(v156 - 8);
  MEMORY[0x24BDAC7A8](v156);
  v20 = (char *)&v154 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394CD8);
  MEMORY[0x24BDAC7A8](v21);
  v158 = (char *)&v154 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394CE0);
  MEMORY[0x24BDAC7A8](v159);
  v24 = (char *)&v154 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v198 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394CE8);
  v194 = *(_QWORD *)(v198 - 8);
  MEMORY[0x24BDAC7A8](v198);
  v193 = (uint64_t)&v154 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394CF0);
  MEMORY[0x24BDAC7A8](v157);
  v27 = (char *)&v154 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v192 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394CF8);
  v28 = MEMORY[0x24BDAC7A8](v192);
  v195 = (uint64_t)&v154 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x24BDAC7A8](v28);
  v160 = (uint64_t)&v154 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v199 = (uint64_t)&v154 - v32;
  sub_235F4C5F4();
  if (qword_256394AA8 != -1)
    swift_once();
  v33 = (void *)qword_256398358;
  if (!qword_256398358)
    v34 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v35 = v33;
  v36 = sub_235F4C7BC();
  v38 = v37;
  v40 = v39;
  v42 = v41;
  KeyPath = swift_getKeyPath();
  *(_QWORD *)&v203 = v36;
  *((_QWORD *)&v203 + 1) = v38;
  LOBYTE(v204) = v40 & 1;
  v205 = v42;
  v206 = KeyPath;
  v207 = 1;
  sub_235F4C618();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D00);
  sub_235F1E8E8();
  v44 = (uint64_t)v158;
  sub_235F4C84C();
  (*(void (**)(char *, uint64_t))(v155 + 8))(v20, v156);
  sub_235F1BF54(v203, *((uint64_t *)&v203 + 1), v204);
  swift_bridgeObjectRelease();
  swift_release();
  v45 = sub_235F4C768();
  v46 = swift_getKeyPath();
  sub_235F1BEC4(v44, (uint64_t)v24, &qword_256394CD8);
  v47 = (uint64_t *)&v24[*(int *)(v159 + 36)];
  *v47 = v46;
  v47[1] = v45;
  sub_235F1BF08(v44, &qword_256394CD8);
  sub_235F1E974();
  v48 = v193;
  sub_235F4C864();
  sub_235F1BF08((uint64_t)v24, &qword_256394CE0);
  LOBYTE(v45) = sub_235F4C714();
  v49 = v194;
  v50 = v198;
  (*(void (**)(char *, uint64_t, uint64_t))(v194 + 16))(v27, v48, v198);
  v51 = &v27[*(int *)(v157 + 36)];
  *v51 = v45;
  *(_OWORD *)(v51 + 8) = 0u;
  *(_OWORD *)(v51 + 24) = 0u;
  v51[40] = 1;
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v50);
  LOBYTE(v45) = sub_235F4C72C();
  sub_235F4C3FC();
  v53 = v52;
  v55 = v54;
  v57 = v56;
  v59 = v58;
  v60 = v160;
  sub_235F1BEC4((uint64_t)v27, v160, &qword_256394CF0);
  v61 = v60 + *(int *)(v192 + 36);
  *(_BYTE *)v61 = v45;
  *(_QWORD *)(v61 + 8) = v53;
  *(_QWORD *)(v61 + 16) = v55;
  *(_QWORD *)(v61 + 24) = v57;
  *(_QWORD *)(v61 + 32) = v59;
  *(_BYTE *)(v61 + 40) = 0;
  sub_235F1BF08((uint64_t)v27, &qword_256394CF0);
  sub_235F1EBAC(v60, v199, &qword_256394CF8);
  sub_235F4C5F4();
  v62 = (void *)qword_256398358;
  if (!qword_256398358)
    v63 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v64 = v62;
  v198 = sub_235F4C7BC();
  v193 = v65;
  LODWORD(v159) = v66;
  v194 = v67;
  LODWORD(v160) = sub_235F4C720();
  v192 = swift_getKeyPath();
  v68 = (void *)qword_256398358;
  if (qword_256398358)
  {
    v69 = (id)qword_256398358;
  }
  else
  {
    v69 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v68 = 0;
  }
  v70 = v68;
  v71 = sub_235F4C108();
  v73 = v72;

  v208 = *(_OWORD *)(a1 + 40);
  v209 = *(_QWORD *)(a1 + 56);
  v201 = *(_OWORD *)(a1 + 40);
  v202 = *(_QWORD *)(a1 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D48);
  sub_235F4C930();
  *(_QWORD *)&v203 = v71;
  *((_QWORD *)&v203 + 1) = v73;
  sub_235F1EA80();
  v74 = MEMORY[0x24BEE0D00];
  v75 = v161;
  sub_235F4C9C0();
  v76 = v163;
  sub_235F4C468();
  v77 = sub_235F1BF90(&qword_256394D58, &qword_256394C90, MEMORY[0x24BDF53E0]);
  v78 = v167;
  v79 = v166;
  sub_235F4C810();
  (*(void (**)(char *, uint64_t))(v164 + 8))(v76, v165);
  (*(void (**)(char *, uint64_t))(v162 + 8))(v75, v79);
  v80 = swift_allocObject();
  v81 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v80 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v80 + 96) = v81;
  *(_QWORD *)(v80 + 112) = *(_QWORD *)(a1 + 96);
  v82 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v80 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v80 + 32) = v82;
  v83 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v80 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v80 + 64) = v83;
  sub_235F1E85C(a1);
  v84 = v169;
  sub_235F4C4D4();
  *(_QWORD *)&v203 = v79;
  *((_QWORD *)&v203 + 1) = v77;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v86 = v173;
  v87 = v172;
  sub_235F4C8A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v170 + 8))(v84, v171);
  (*(void (**)(char *, uint64_t))(v168 + 8))(v78, v87);
  v203 = v208;
  v204 = v209;
  sub_235F4C918();
  v203 = v201;
  v88 = swift_allocObject();
  v89 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v88 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v88 + 96) = v89;
  *(_QWORD *)(v88 + 112) = *(_QWORD *)(a1 + 96);
  v90 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v88 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v88 + 32) = v90;
  v91 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v88 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v88 + 64) = v91;
  sub_235F1E85C(a1);
  *(_QWORD *)&v201 = v87;
  *((_QWORD *)&v201 + 1) = OpaqueTypeConformance2;
  v92 = swift_getOpaqueTypeConformance2();
  v93 = MEMORY[0x24BEE0D28];
  v94 = v177;
  v95 = v176;
  sub_235F4C894();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v174 + 8))(v86, v95);
  v201 = *(_OWORD *)(a1 + 64);
  LOBYTE(v202) = *(_BYTE *)(a1 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394C80);
  sub_235F4C414();
  *(_QWORD *)&v203 = v95;
  *((_QWORD *)&v203 + 1) = v74;
  v204 = v92;
  v205 = v93;
  swift_getOpaqueTypeConformance2();
  v96 = v179;
  v97 = v180;
  sub_235F4C87C();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v178 + 8))(v94, v97);
  LOBYTE(v97) = sub_235F4C720();
  v98 = v181;
  v99 = (uint64_t)v185;
  v100 = v182;
  (*(void (**)(uint64_t (*)(), char *, uint64_t))(v181 + 16))(v185, v96, v182);
  v101 = v99 + *(int *)(v175 + 36);
  *(_BYTE *)v101 = v97;
  *(_OWORD *)(v101 + 8) = 0u;
  *(_OWORD *)(v101 + 24) = 0u;
  *(_BYTE *)(v101 + 40) = 1;
  (*(void (**)(char *, uint64_t))(v98 + 8))(v96, v100);
  v102 = (void *)objc_opt_self();
  v103 = MEMORY[0x23B7E65E8](objc_msgSend(v102, sel_tertiarySystemFillColor));
  LOBYTE(v98) = sub_235F4C720();
  v104 = v188;
  sub_235F1BEC4(v99, v188, &qword_256394CB8);
  v105 = v104 + *(int *)(v183 + 36);
  *(_QWORD *)v105 = v103;
  *(_BYTE *)(v105 + 8) = v98;
  sub_235F1BF08(v99, &qword_256394CB8);
  v106 = v197;
  v107 = (char *)v197 + *(int *)(v191 + 20);
  v108 = *MEMORY[0x24BDEEB68];
  v109 = sub_235F4C60C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v109 - 8) + 104))(v107, v108, v109);
  __asm { FMOV            V0.2D, #12.0 }
  *v106 = _Q0;
  v115 = (uint64_t)v190;
  v116 = (uint64_t)&v190[*(int *)(v184 + 36)];
  sub_235F1EB2C((uint64_t)v106, v116);
  *(_WORD *)(v116 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256394D60) + 36)) = 256;
  sub_235F1BEC4(v104, v115, &qword_256394CC0);
  sub_235F1EB70((uint64_t)v106);
  sub_235F1BF08(v104, &qword_256394CC0);
  v117 = swift_getKeyPath();
  v118 = v186;
  sub_235F1BEC4(v115, v186, &qword_256394CC8);
  v119 = v118 + *(int *)(v187 + 36);
  *(_QWORD *)v119 = v117;
  *(_BYTE *)(v119 + 8) = 1;
  sub_235F1BF08(v115, &qword_256394CC8);
  sub_235F1EBAC(v118, v200, &qword_256394CD0);
  v203 = *(_OWORD *)(a1 + 88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D68);
  sub_235F4C918();
  v191 = 0;
  v120 = 0;
  v121 = 0;
  v197 = 0;
  v122 = 0;
  v123 = 0;
  v124 = 0;
  v190 = 0;
  v125 = 0;
  if (v201 == 1)
  {
    sub_235F4C5F4();
    v126 = (void *)qword_256398358;
    if (!qword_256398358)
      v127 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v128 = v126;
    v191 = sub_235F4C7BC();
    v120 = v129;
    v197 = (_OWORD *)v130;
    v121 = v131 & 1;
    v123 = MEMORY[0x23B7E65E8](objc_msgSend(v102, sel_secondaryLabelColor));
    v190 = (char *)sub_235F4C798();
    v124 = swift_getKeyPath();
    v125 = swift_getKeyPath();
    v122 = sub_235F1E1D8;
  }
  v182 = v124;
  v186 = v123;
  v187 = v125;
  v132 = v159 & 1;
  v133 = v195;
  v185 = v122;
  sub_235F1BEC4(v199, v195, &qword_256394CF8);
  v134 = v196;
  sub_235F1BEC4(v200, v196, &qword_256394CD0);
  v135 = v133;
  v136 = v121;
  v184 = v121;
  v137 = v189;
  sub_235F1BEC4(v135, v189, &qword_256394CF8);
  v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394D70);
  v139 = v120;
  v183 = v120;
  v140 = v138;
  v141 = v137 + *(int *)(v138 + 48);
  v142 = v193;
  *(_QWORD *)v141 = v198;
  *(_QWORD *)(v141 + 8) = v142;
  *(_BYTE *)(v141 + 16) = v132;
  LODWORD(v188) = v132;
  *(_QWORD *)(v141 + 24) = v194;
  *(_BYTE *)(v141 + 32) = v160;
  *(_OWORD *)(v141 + 40) = 0u;
  *(_OWORD *)(v141 + 56) = 0u;
  *(_BYTE *)(v141 + 72) = 1;
  *(_QWORD *)(v141 + 80) = v192;
  *(_BYTE *)(v141 + 88) = 1;
  sub_235F1BEC4(v134, v137 + *(int *)(v138 + 64), &qword_256394CD0);
  v143 = v137 + *(int *)(v140 + 80);
  v144 = v190;
  v145 = v191;
  *(_QWORD *)v143 = v191;
  *(_QWORD *)(v143 + 8) = v139;
  v146 = (uint64_t)v197;
  *(_QWORD *)(v143 + 16) = v136;
  *(_QWORD *)(v143 + 24) = v146;
  *(_QWORD *)(v143 + 32) = v122;
  *(_QWORD *)(v143 + 40) = 0;
  *(_QWORD *)(v143 + 48) = 0;
  *(_QWORD *)(v143 + 56) = 0;
  v147 = v182;
  *(_QWORD *)(v143 + 64) = v186;
  *(_QWORD *)(v143 + 72) = v147;
  v148 = v187;
  *(_QWORD *)(v143 + 80) = v144;
  *(_QWORD *)(v143 + 88) = v148;
  *(_BYTE *)(v143 + 96) = 0;
  v149 = v137 + *(int *)(v140 + 96);
  *(_QWORD *)v149 = 0;
  *(_BYTE *)(v149 + 8) = 1;
  sub_235F1BF44(v198, v142, v132);
  swift_bridgeObjectRetain();
  swift_retain();
  v150 = v183;
  LOBYTE(v132) = v184;
  v151 = (uint64_t)v197;
  v152 = (uint64_t)v185;
  sub_235F1EBF0(v145, v183, v184, (uint64_t)v197, (uint64_t)v185, 0, 0);
  sub_235F1BF08(v200, &qword_256394CD0);
  sub_235F1BF08(v199, &qword_256394CF8);
  sub_235F1ECA0(v145, v150, v132, v151, v152, 0, 0);
  sub_235F1BF08(v196, &qword_256394CD0);
  sub_235F1BF54(v198, v193, v188);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_235F1BF08(v195, &qword_256394CF8);
}

uint64_t sub_235F1DDA0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  __int128 v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;

  v2 = sub_235F4C0D8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(_OWORD *)(a1 + 88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D68);
  result = sub_235F4C918();
  if ((v19 & 1) == 0)
  {
    v17 = *(_OWORD *)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 56);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256394D48);
    sub_235F4C918();
    v7 = v19;
    result = swift_bridgeObjectRelease();
    v8 = HIBYTE(*((_QWORD *)&v7 + 1)) & 0xFLL;
    if ((*((_QWORD *)&v7 + 1) & 0x2000000000000000) == 0)
      v8 = v7 & 0xFFFFFFFFFFFFLL;
    if (v8)
    {
      v9 = (__int128 *)(a1 + 40);
      v19 = *(_OWORD *)(a1 + 24);
      v10 = *((_QWORD *)&v19 + 1);
      v17 = *v9;
      v18 = *((_QWORD *)v9 + 2);
      swift_retain();
      sub_235F4C918();
      v17 = v16;
      sub_235F4C0CC();
      sub_235F1EA80();
      v11 = sub_235F4CC18();
      v13 = v12;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v14 = v10 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
      swift_beginAccess();
      v15 = (uint64_t *)(v14 + *(int *)(type metadata accessor for AdaptiveVoiceShortcut() + 20));
      *v15 = v11;
      v15[1] = v13;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_235F1EDE4((uint64_t)&v19);
      swift_retain();
      sub_235F322FC();
      return sub_235F1EDE4((uint64_t)&v19);
    }
  }
  return result;
}

uint64_t sub_235F1DF68(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  __int128 v14;

  v2 = sub_235F4C0D8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_OWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D48);
  sub_235F4C918();
  v12 = v14;
  sub_235F4C0CC();
  sub_235F1EA80();
  sub_235F4CC18();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_bridgeObjectRelease();
  type metadata accessor for AVSCommandNameViewModel();
  sub_235F1EDA4(&qword_256394D98, v6, (uint64_t (*)(uint64_t))type metadata accessor for AVSCommandNameViewModel, (uint64_t)&unk_235F4D8E4);
  v7 = *(_QWORD **)(sub_235F4C444() + 16);
  swift_bridgeObjectRetain();
  swift_release();
  v8 = sub_235F4CAA4();
  v10 = v9;
  swift_bridgeObjectRelease();
  LOBYTE(v8) = sub_235F1E114(v8, v10, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = *(_OWORD *)(a1 + 88);
  LOBYTE(v14) = v8 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D68);
  return sub_235F4C924();
}

uint64_t sub_235F1E114(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_235F4CE1C();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_235F4CE1C() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_235F1E1D8()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD aBlock[6];

  v0 = sub_235F4C9FC();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v16 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_235F4CA20();
  v14 = *(_QWORD *)(v4 - 8);
  v15 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_235F4CA38();
  v7 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F1ED50();
  v10 = (void *)sub_235F4CBB8();
  sub_235F4CA2C();
  aBlock[4] = sub_235F1E404;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235F34E88;
  aBlock[3] = &block_descriptor;
  v11 = _Block_copy(aBlock);
  sub_235F4CA14();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_235F1EDA4((unint64_t *)&qword_256394D80, 255, v1, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D88);
  sub_235F1BF90((unint64_t *)&qword_256394D90, &qword_256394D88, MEMORY[0x24BEE12C8]);
  sub_235F4CC48();
  MEMORY[0x23B7E68E8](v9, v6, v3, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v16 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v6, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v13);
}

void sub_235F1E404()
{
  UIAccessibilityNotifications v0;
  void *v1;
  id v2;
  id v3;
  id argument;

  v0 = *MEMORY[0x24BEBDDB0];
  if (qword_256394AA8 != -1)
    swift_once();
  v1 = (void *)qword_256398358;
  if (qword_256398358)
  {
    v2 = (id)qword_256398358;
  }
  else
  {
    v2 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v1 = 0;
  }
  v3 = v1;
  sub_235F4C108();

  argument = (id)sub_235F4CA74();
  swift_bridgeObjectRelease();
  UIAccessibilityPostNotification(v0, argument);

}

uint64_t sub_235F1E524(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v2 = swift_allocObject();
  v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v2 + 96) = v3;
  *(_QWORD *)(v2 + 112) = *(_QWORD *)(a1 + 96);
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 32) = v4;
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v2 + 64) = v5;
  sub_235F1E85C(a1);
  return sub_235F4C93C();
}

uint64_t sub_235F1E5B8(uint64_t a1)
{
  void (**v1)(uint64_t);
  void (*v2)(uint64_t);
  uint64_t v3;

  v1 = (void (**)(uint64_t))(*(_QWORD *)(a1 + 32)
                                     + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  v2 = *v1;
  v3 = swift_retain();
  v2(v3);
  return swift_release();
}

uint64_t sub_235F1E620@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  id v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;

  sub_235F4C5F4();
  if (qword_256394AA8 != -1)
    swift_once();
  v2 = (void *)qword_256398358;
  if (!qword_256398358)
    v3 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v4 = v2;
  result = sub_235F4C7BC();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v7 & 1;
  *(_QWORD *)(a1 + 24) = v8;
  return result;
}

uint64_t sub_235F1E728@<X0>(uint64_t a1@<X8>)
{
  return sub_235F1C698(a1);
}

uint64_t sub_235F1E770@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235F1C8AC(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_235F1E778()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256394C48;
  if (!qword_256394C48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394C40);
    v2[0] = sub_235F1BF90(&qword_256394C50, &qword_256394C58, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256394C48);
  }
  return result;
}

uint64_t sub_235F1E7FC()
{
  uint64_t v0;

  return sub_235F1E524(*(_QWORD *)(v0 + 16));
}

uint64_t sub_235F1E808()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394C80);
  return sub_235F4C408();
}

uint64_t sub_235F1E85C(uint64_t a1)
{
  sub_235F1C264();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_235F1E8D8()
{
  uint64_t v0;

  return sub_235F1E5B8(v0 + 16);
}

unint64_t sub_235F1E8E8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256394D08;
  if (!qword_256394D08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394D00);
    v2 = sub_235F1BF90(&qword_256394D10, &qword_256394D18, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256394D08);
  }
  return result;
}

unint64_t sub_235F1E974()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256394D20;
  if (!qword_256394D20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394CE0);
    v2[0] = sub_235F1E9F8();
    v2[1] = sub_235F1BF90(&qword_256394D38, &qword_256394D40, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256394D20);
  }
  return result;
}

unint64_t sub_235F1E9F8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256394D28;
  if (!qword_256394D28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394CD8);
    v2[0] = sub_235F1E8E8();
    v2[1] = sub_235F1EDA4(&qword_256394D30, 255, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256394D28);
  }
  return result;
}

unint64_t sub_235F1EA80()
{
  unint64_t result;

  result = qword_256394D50;
  if (!qword_256394D50)
  {
    result = MEMORY[0x23B7E7098](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256394D50);
  }
  return result;
}

uint64_t sub_235F1EAC8()
{
  uint64_t v0;

  return sub_235F1DDA0(v0 + 16);
}

uint64_t objectdestroyTm()
{
  sub_235F1C2BC();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F1EB24()
{
  uint64_t v0;

  return sub_235F1DF68(v0 + 16);
}

uint64_t sub_235F1EB2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_235F4C4F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F1EB70(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_235F4C4F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_235F1EBAC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_235F1EBF0(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a4)
  {
    sub_235F1BF44(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    sub_235F1EC90(a5);
    sub_235F1EC90(a7);
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_235F1EC90(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_235F1ECA0(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a4)
  {
    sub_235F1BF54(result, a2, a3 & 1);
    swift_bridgeObjectRelease();
    sub_235F1ED40(a5);
    sub_235F1ED40(a7);
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_235F1ED40(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

unint64_t sub_235F1ED50()
{
  unint64_t result;

  result = qword_256394D78;
  if (!qword_256394D78)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256394D78);
  }
  return result;
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

uint64_t sub_235F1EDA4(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x23B7E7098](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235F1EDE4(uint64_t a1)
{
  swift_release();
  return a1;
}

_QWORD *sub_235F1EE0C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394DA0);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_235F1EEF0((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_235F1F0EC();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_235F1EEF0(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 56) + 16 * v16);
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

uint64_t sub_235F1F0EC()
{
  return swift_release();
}

unint64_t sub_235F1F0FC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_256394DA8;
  if (!qword_256394DA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394C78);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394C30);
    v2[3] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394C60);
    v2[4] = sub_235F1BF90(&qword_256394C68, &qword_256394C30, MEMORY[0x24BDEB238]);
    v2[5] = sub_235F1BF90(&qword_256394C70, &qword_256394C60, MEMORY[0x24BDF43B0]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256394DA8);
  }
  return result;
}

uint64_t sub_235F1F1EC()
{
  return sub_235F1F228();
}

uint64_t sub_235F1F200()
{
  return sub_235F1F228();
}

uint64_t sub_235F1F214()
{
  return sub_235F1F228();
}

uint64_t sub_235F1F228()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235F1F290()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, char *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void (*v15)(_QWORD *, _QWORD);
  uint64_t v16;
  void (*v17)(_QWORD *, _QWORD);
  _QWORD aBlock[6];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395148);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts33AVSCommandShortcutActionViewModel__siriShortcuts;
  v7 = MEMORY[0x24BEE4AF8];
  aBlock[0] = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(qword_256394E08);
  sub_235F4C39C();
  v8 = *(void (**)(uint64_t, char *, uint64_t))(v3 + 32);
  v8(v6, v5, v2);
  v9 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts33AVSCommandShortcutActionViewModel__axShortcuts;
  aBlock[0] = v7;
  sub_235F4C39C();
  v8(v9, v5, v2);
  v10 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts33AVSCommandShortcutActionViewModel__systemShortcuts;
  aBlock[0] = v7;
  sub_235F4C39C();
  v8(v10, v5, v2);
  v11 = objc_msgSend((id)objc_opt_self(), sel_standardClient);
  v12 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_235F26108;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235F1FE18;
  aBlock[3] = &block_descriptor_56;
  v13 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v11, sel_getVoiceShortcutsWithCompletion_, v13);
  _Block_release(v13);

  if (qword_256394AB0 != -1)
    swift_once();
  v14 = *(_QWORD *)(qword_256398360 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v15 = (void (*)(_QWORD *, _QWORD))sub_235F4C3C0();
  sub_235F1FCA4(v14);
  v15(aBlock, 0);
  swift_release();
  swift_release();
  v16 = *(_QWORD *)(qword_256398360 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v17 = (void (*)(_QWORD *, _QWORD))sub_235F4C3C0();
  sub_235F1FCA4(v16);
  v17(aBlock, 0);
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235F1F578(unint64_t a1, void *a2, uint64_t a3)
{
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, char *, uint64_t);
  uint64_t v52;
  uint64_t *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v67 = a3;
  v5 = sub_235F4C33C();
  v75 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v74 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_235F4C1C8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for AvailableShortcutAction();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v65 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395158);
  result = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    if (qword_256394AA0 != -1)
      swift_once();
    v22 = v5;
    v23 = __swift_project_value_buffer(v5, (uint64_t)qword_256395488);
    swift_beginAccess();
    v24 = (uint64_t)v74;
    v25 = v75;
    (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v74, v23, v22);
    v26 = a2;
    v27 = a2;
    v28 = sub_235F4C324();
    v29 = sub_235F4CB88();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v76 = (uint64_t)a2;
      v77 = v31;
      *(_DWORD *)v30 = 136315138;
      v32 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256395170);
      v33 = sub_235F4CA98();
      v76 = sub_235F43930(v33, v34, &v77);
      sub_235F4CBF4();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_235F17000, v28, v29, "Error retrieving known shortcuts names: %s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7E711C](v31, -1, -1);
      MEMORY[0x23B7E711C](v30, -1, -1);

      return (*(uint64_t (**)(uint64_t, uint64_t))(v75 + 8))(v24, v22);
    }
    else
    {

      return (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(v24, v22);
    }
  }
  else
  {
    v74 = v17;
    v75 = v12;
    if (a1)
    {
      v66 = v21;
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        v35 = sub_235F4CD20();
        swift_bridgeObjectRelease();
      }
      else
      {
        v35 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      v36 = MEMORY[0x24BEE4AF8];
      if (v35)
      {
        v78 = MEMORY[0x24BEE4AF8];
        result = sub_235F25924(0, v35 & ~(v35 >> 63), 0);
        if (v35 < 0)
        {
          __break(1u);
          return result;
        }
        v37 = 0;
        v68 = a1 & 0xC000000000000001;
        v69 = v35;
        v72 = v7;
        v73 = a1;
        v70 = v11;
        v71 = v8;
        do
        {
          if (v68)
            v38 = (id)MEMORY[0x23B7E69E4](v37, a1);
          else
            v38 = *(id *)(a1 + 8 * v37 + 32);
          v39 = v38;
          v40 = objc_msgSend(v38, sel_shortcutName);
          v41 = sub_235F4CA80();
          v43 = v42;

          v44 = objc_msgSend(v39, sel_identifier);
          v45 = sub_235F4CA80();
          v47 = v46;

          sub_235F4C1BC();
          sub_235F4C1BC();
          v48 = v10;
          v50 = v71;
          v49 = v72;
          (*(void (**)(char *, uint64_t))(v71 + 8))(v15, v72);
          v51 = *(void (**)(char *, char *, uint64_t))(v50 + 32);
          v10 = v48;
          v51(v15, v48, v49);
          v52 = v70;
          v53 = (uint64_t *)&v15[*(int *)(v70 + 20)];
          *v53 = v41;
          v53[1] = v43;
          v54 = &v15[*(int *)(v52 + 24)];
          *(_QWORD *)v54 = v45;
          *((_QWORD *)v54 + 1) = v47;
          v54[16] = 0;
          v55 = (uint64_t)v74;
          sub_235F253C8((uint64_t)v15, (uint64_t)v74, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);

          v36 = v78;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_235F25924(0, *(_QWORD *)(v36 + 16) + 1, 1);
            v36 = v78;
          }
          v56 = v75;
          v58 = *(_QWORD *)(v36 + 16);
          v57 = *(_QWORD *)(v36 + 24);
          if (v58 >= v57 >> 1)
          {
            sub_235F25924(v57 > 1, v58 + 1, 1);
            v56 = v75;
            v36 = v78;
          }
          ++v37;
          *(_QWORD *)(v36 + 16) = v58 + 1;
          sub_235F253C8(v55, v36+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(_QWORD *)(v56 + 72) * v58, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
          a1 = v73;
        }
        while (v69 != v37);
      }
      v59 = sub_235F4CB64();
      v60 = (uint64_t)v66;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(v66, 1, 1, v59);
      sub_235F4CB40();
      v61 = v67;
      swift_retain();
      v62 = sub_235F4CB34();
      v63 = (_QWORD *)swift_allocObject();
      v64 = MEMORY[0x24BEE6930];
      v63[2] = v62;
      v63[3] = v64;
      v63[4] = v61;
      v63[5] = v36;
      sub_235F40880(v60, (uint64_t)&unk_256395168, (uint64_t)v63);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_235F1FB3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[10] = a4;
  v5[11] = a5;
  v5[9] = a1;
  sub_235F4CB40();
  v5[12] = sub_235F4CB34();
  sub_235F4CB28();
  return swift_task_switch();
}

uint64_t sub_235F1FBAC()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  void (*v3)(uint64_t, _QWORD);

  swift_release();
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v2 = *(_QWORD *)(v0 + 88);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    v3 = (void (*)(uint64_t, _QWORD))sub_235F4C3C0();
    sub_235F1FCA4(v2);
    v3(v0 + 16, 0);
    swift_release();
    swift_release();
    swift_release();
  }
  **(_BYTE **)(v0 + 72) = Strong == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235F1FCA4(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v24 = v4 + v2;
  else
    v24 = v4;
  v3 = sub_235F27C9C(isUniquelyReferenced_nonNull_native, v24, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *(_QWORD *)(v3 + 16);
  v10 = (*(_QWORD *)(v3 + 24) >> 1) - v9;
  v11 = type metadata accessor for AvailableShortcutAction();
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v3 + v13 + v14 * v9;
  v16 = a1 + v13;
  v17 = v14 * v8;
  v18 = v15 + v17;
  v19 = v16 + v17;
  if (v16 < v18 && v15 < v19)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = *(_QWORD *)(v3 + 16);
  v22 = __OFADD__(v21, v8);
  v23 = v21 + v8;
  if (!v22)
  {
    *(_QWORD *)(v3 + 16) = v23;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_235F4CD50();
  __break(1u);
  return result;
}

uint64_t sub_235F1FE18(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_235F26110(0, &qword_256395150);
    v4 = sub_235F4CAEC();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_235F1FEA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  v1 = v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts33AVSCommandShortcutActionViewModel__siriShortcuts;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395148);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts33AVSCommandShortcutActionViewModel__axShortcuts, v2);
  v3(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts33AVSCommandShortcutActionViewModel__systemShortcuts, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_235F1FF2C()
{
  return type metadata accessor for AVSCommandShortcutActionViewModel(0);
}

uint64_t type metadata accessor for AVSCommandShortcutActionViewModel(uint64_t a1)
{
  return sub_235F20914(a1, (uint64_t *)&unk_256394DF0);
}

void sub_235F1FF48()
{
  unint64_t v0;

  sub_235F209F0(319, &qword_256394E00, qword_256394E08, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

_QWORD *sub_235F1FFD0(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *a1 = *a2;
    v4 = (_QWORD *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = a2[1];
    *v4 = *a2;
    v4[1] = v7;
    v8 = a2[2];
    v9 = a2[3];
    v10 = *((_BYTE *)a2 + 32);
    swift_retain();
    sub_235F1C264();
    v4[2] = v8;
    v4[3] = v9;
    *((_BYTE *)v4 + 32) = v10;
    v11 = a2[6];
    v4[5] = a2[5];
    v4[6] = v11;
    v4[7] = a2[7];
    v12 = *(int *)(a3 + 28);
    v13 = (char *)v4 + v12;
    v14 = (char *)a2 + v12;
    v15 = sub_235F4C1C8();
    v16 = *(_QWORD *)(v15 - 8);
    v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
    swift_bridgeObjectRetain();
    swift_retain();
    if (v17(v14, 1, v15))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394F38);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
    v20 = __swift_instantiateConcreteTypeFromMangledName(qword_256394F40);
    *(_QWORD *)&v13[*(int *)(v20 + 28)] = *(_QWORD *)&v14[*(int *)(v20 + 28)];
    v21 = *(int *)(a3 + 32);
    v22 = (char *)v4 + v21;
    v23 = (char *)a2 + v21;
    *v22 = *v23;
    *((_QWORD *)v22 + 1) = *((_QWORD *)v23 + 1);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_235F20150(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release();
  sub_235F1C2BC();
  swift_bridgeObjectRelease();
  swift_release();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_235F4C1C8();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(qword_256394F40);
  swift_release();
  return swift_release();
}

uint64_t sub_235F20208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_BYTE *)(a2 + 32);
  swift_retain();
  sub_235F1C264();
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  *(_BYTE *)(a1 + 32) = v9;
  v10 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v10;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v11 = *(int *)(a3 + 28);
  v12 = (char *)(a1 + v11);
  v13 = (char *)(a2 + v11);
  v14 = sub_235F4C1C8();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  swift_bridgeObjectRetain();
  swift_retain();
  if (v16(v13, 1, v14))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394F38);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  v18 = __swift_instantiateConcreteTypeFromMangledName(qword_256394F40);
  *(_QWORD *)&v12[*(int *)(v18 + 28)] = *(_QWORD *)&v13[*(int *)(v18 + 28)];
  v19 = *(int *)(a3 + 32);
  v20 = a1 + v19;
  v21 = a2 + v19;
  *(_BYTE *)v20 = *(_BYTE *)v21;
  *(_QWORD *)(v20 + 8) = *(_QWORD *)(v21 + 8);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_235F20360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_BYTE *)(a2 + 32);
  sub_235F1C264();
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = v8;
  sub_235F1C2BC();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  v9 = *(int *)(a3 + 28);
  v10 = (char *)(a1 + v9);
  v11 = (char *)(a2 + v9);
  v12 = sub_235F4C1C8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394F38);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  v18 = __swift_instantiateConcreteTypeFromMangledName(qword_256394F40);
  *(_QWORD *)&v10[*(int *)(v18 + 28)] = *(_QWORD *)&v11[*(int *)(v18 + 28)];
  swift_retain();
  swift_release();
  v19 = *(int *)(a3 + 32);
  v20 = a1 + v19;
  v21 = a2 + v19;
  *(_BYTE *)v20 = *(_BYTE *)v21;
  *(_QWORD *)(v20 + 8) = *(_QWORD *)(v21 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_235F20548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v7 = *(int *)(a3 + 28);
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = sub_235F4C1C8();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394F38);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = __swift_instantiateConcreteTypeFromMangledName(qword_256394F40);
  *(_QWORD *)&v8[*(int *)(v13 + 28)] = *(_QWORD *)&v9[*(int *)(v13 + 28)];
  *(_OWORD *)(a1 + *(int *)(a3 + 32)) = *(_OWORD *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_235F20650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_release();
  v7 = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = v7;
  sub_235F1C2BC();
  v8 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  v9 = *(int *)(a3 + 28);
  v10 = (char *)(a1 + v9);
  v11 = (char *)(a2 + v9);
  v12 = sub_235F4C1C8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394F38);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  v18 = __swift_instantiateConcreteTypeFromMangledName(qword_256394F40);
  *(_QWORD *)&v10[*(int *)(v18 + 28)] = *(_QWORD *)&v11[*(int *)(v18 + 28)];
  swift_release();
  v19 = *(int *)(a3 + 32);
  v20 = a1 + v19;
  v21 = a2 + v19;
  *(_BYTE *)v20 = *(_BYTE *)v21;
  *(_QWORD *)(v20 + 8) = *(_QWORD *)(v21 + 8);
  swift_release();
  return a1;
}

uint64_t sub_235F207F0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235F207FC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_256394F40);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_235F2087C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_235F20888(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_256394F40);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for AVSCommandShortcutActionView(uint64_t a1)
{
  return sub_235F20914(a1, (uint64_t *)&unk_256394FA0);
}

uint64_t sub_235F20914(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_235F20948()
{
  unint64_t v0;

  sub_235F209F0(319, qword_256394FB0, &qword_256394F38, MEMORY[0x24BDF42C0]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_235F209F0(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_235F20A48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AVSCommandShortcutActionViewModel(0);
  result = sub_235F4C390();
  *a1 = result;
  return result;
}

uint64_t sub_235F20A84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235F20A94()
{
  uint64_t v0;

  type metadata accessor for AVSCommandShortcutActionViewModel(0);
  v0 = swift_allocObject();
  sub_235F1F290();
  return v0;
}

uint64_t sub_235F20ACC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t OpaqueTypeConformance2;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v61 = a1;
  v2 = sub_235F4C5AC();
  v59 = *(_QWORD *)(v2 - 8);
  v60 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v58 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_235F4C660();
  v44 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_235F4C66C();
  v47 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394FF0);
  v46 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394FF8);
  v49 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395000);
  v50 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v43 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395008);
  v56 = *(_QWORD *)(v15 - 8);
  v57 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v55 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395010);
  v52 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v51 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395018);
  sub_235F1BF90(&qword_256395020, &qword_256395018, MEMORY[0x24BDF5428]);
  sub_235F4C7A4();
  v42 = v1;
  v18 = *(_QWORD *)(v1 + 56);
  v64 = *(_OWORD *)(v1 + 40);
  v65 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D48);
  sub_235F4C930();
  sub_235F4C654();
  sub_235F4C648();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v5, v45);
  v41 = sub_235F1BF90(&qword_256395028, &qword_256394FF0, MEMORY[0x24BDF1A30]);
  sub_235F4C7F8();
  swift_bridgeObjectRelease();
  swift_release();
  v19 = v43;
  swift_release();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v48);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v10, v8);
  v62 = v42;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394C60);
  v66 = v8;
  v67 = v41;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v22 = sub_235F1BF90(&qword_256394C70, &qword_256394C60, MEMORY[0x24BDF43B0]);
  sub_235F4C888();
  v23 = *(void (**)(char *, uint64_t))(v49 + 8);
  v49 = v11;
  v23(v13, v11);
  sub_235F4C5F4();
  if (qword_256394AA8 != -1)
    swift_once();
  v24 = (void *)qword_256398358;
  if (!qword_256398358)
    v25 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v26 = v24;
  v27 = sub_235F4C7BC();
  v29 = v28;
  v66 = v49;
  v67 = v20;
  v31 = v30 & 1;
  v68 = OpaqueTypeConformance2;
  v69 = v22;
  v32 = swift_getOpaqueTypeConformance2();
  v33 = v55;
  v34 = v53;
  sub_235F4C828();
  sub_235F1BF54(v27, v29, v31);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v19, v34);
  v36 = v58;
  v35 = v59;
  v37 = v60;
  (*(void (**)(char *, _QWORD, uint64_t))(v59 + 104))(v58, *MEMORY[0x24BDEE5F0], v60);
  v66 = v34;
  v67 = v32;
  swift_getOpaqueTypeConformance2();
  v38 = v51;
  v39 = v57;
  sub_235F4C858();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v37);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v33, v39);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v52 + 32))(v61, v38, v54);
}

uint64_t sub_235F21158@<X0>(char *a1@<X8>)
{
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
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  void (*v47)(char *, char *, uint64_t);
  char *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  char *v58;
  void (*v59)(char *, char *, uint64_t);
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  char *v71;
  void (*v72)(char *, char *, uint64_t);
  char *v73;
  uint64_t v74;
  void (*v75)(char *, char *, uint64_t);
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  int *v82;
  void (*v83)(char *, uint64_t);
  uint64_t v85;
  char *v86;
  char *v87;
  char *v88;
  char *v89;
  char *v90;
  char *v91;
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  uint64_t v110;

  v97 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395030);
  v99 = *(_QWORD *)(v1 - 8);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v91 = (char *)&v85 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v90 = (char *)&v85 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v89 = (char *)&v85 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v88 = (char *)&v85 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v87 = (char *)&v85 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v86 = (char *)&v85 - v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395038);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v96 = (uint64_t)&v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v95 = (uint64_t)&v85 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v94 = (uint64_t)&v85 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v92 = (char *)&v85 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v98 = (char *)&v85 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v102 = (char *)&v85 - v24;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395040);
  v101 = *(_QWORD *)(v25 - 8);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v93 = (char *)&v85 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v85 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v100 = (char *)&v85 - v31;
  sub_235F4C5F4();
  if (qword_256394AA8 != -1)
    swift_once();
  v32 = (void *)qword_256398358;
  if (!qword_256398358)
    v33 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v34 = v32;
  v107 = sub_235F4C7BC();
  v108 = v35;
  v109 = v36 & 1;
  v110 = v37;
  MEMORY[0x24BDAC7A8](v107);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395048);
  sub_235F25010();
  sub_235F4C978();
  (*(void (**)(char *, char *, uint64_t))(v101 + 32))(v100, v30, v25);
  v38 = *(_QWORD *)(sub_235F221B4((uint64_t)&unk_235F4DBC8, (uint64_t)&unk_235F4DBF0, (uint64_t (*)(char *))sub_235F25D50)+ 16);
  swift_bridgeObjectRelease();
  if (v38)
  {
    sub_235F4C5F4();
    v39 = (void *)qword_256398358;
    if (!qword_256398358)
      v40 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v41 = v39;
    v103 = sub_235F4C7BC();
    v104 = v42;
    v105 = v43 & 1;
    v106 = v44;
    MEMORY[0x24BDAC7A8](v103);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256395088);
    sub_235F2513C();
    v45 = v87;
    sub_235F4C978();
    v46 = v99;
    v47 = *(void (**)(char *, char *, uint64_t))(v99 + 32);
    v48 = v86;
    v47(v86, v45, v1);
    v49 = (uint64_t)v102;
    v47(v102, v48, v1);
    v50 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 56);
    v50(v49, 0, 1, v1);
  }
  else
  {
    v50 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v99 + 56);
    v50((uint64_t)v102, 1, 1, v1);
  }
  v51 = *(_QWORD *)(sub_235F221B4((uint64_t)&unk_235F4DB80, (uint64_t)&unk_235F4DBA8, (uint64_t (*)(char *))sub_235F26970)+ 16);
  swift_bridgeObjectRelease();
  if (v51)
  {
    sub_235F4C5F4();
    v52 = (void *)qword_256398358;
    if (!qword_256398358)
      v53 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v54 = v52;
    v103 = sub_235F4C7BC();
    v104 = v55;
    v105 = v56 & 1;
    v106 = v57;
    MEMORY[0x24BDAC7A8](v103);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256395088);
    sub_235F2513C();
    v58 = v89;
    sub_235F4C978();
    v59 = *(void (**)(char *, char *, uint64_t))(v99 + 32);
    v60 = v88;
    v59(v88, v58, v1);
    v61 = (uint64_t)v98;
    v59(v98, v60, v1);
    v62 = 0;
  }
  else
  {
    v62 = 1;
    v61 = (uint64_t)v98;
  }
  v63 = 1;
  v50(v61, v62, 1, v1);
  v64 = *(_QWORD *)(sub_235F221B4((uint64_t)&unk_235F4DB38, (uint64_t)&unk_235F4DB60, (uint64_t (*)(char *))sub_235F26970)+ 16);
  swift_bridgeObjectRelease();
  if (v64)
  {
    sub_235F4C5F4();
    v65 = (void *)qword_256398358;
    if (!qword_256398358)
      v66 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v67 = v65;
    v103 = sub_235F4C7BC();
    v104 = v68;
    v105 = v69 & 1;
    v106 = v70;
    MEMORY[0x24BDAC7A8](v103);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256395088);
    sub_235F2513C();
    v71 = v91;
    sub_235F4C978();
    v72 = *(void (**)(char *, char *, uint64_t))(v99 + 32);
    v73 = v90;
    v72(v90, v71, v1);
    v74 = (uint64_t)v92;
    v72(v92, v73, v1);
    v63 = 0;
  }
  else
  {
    v74 = (uint64_t)v92;
  }
  v50(v74, v63, 1, v1);
  v75 = *(void (**)(char *, char *, uint64_t))(v101 + 16);
  v76 = v93;
  v75(v93, v100, v25);
  v77 = v94;
  sub_235F1BEC4((uint64_t)v102, v94, &qword_256395038);
  v78 = (uint64_t)v98;
  v79 = v95;
  sub_235F1BEC4((uint64_t)v98, v95, &qword_256395038);
  v80 = v96;
  sub_235F1BEC4(v74, v96, &qword_256395038);
  v81 = v97;
  v75(v97, v76, v25);
  v82 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256395080);
  sub_235F1BEC4(v77, (uint64_t)&v81[v82[12]], &qword_256395038);
  sub_235F1BEC4(v79, (uint64_t)&v81[v82[16]], &qword_256395038);
  sub_235F1BEC4(v80, (uint64_t)&v81[v82[20]], &qword_256395038);
  sub_235F1BF08(v74, &qword_256395038);
  sub_235F1BF08(v78, &qword_256395038);
  sub_235F1BF08((uint64_t)v102, &qword_256395038);
  v83 = *(void (**)(char *, uint64_t))(v101 + 8);
  v83(v100, v25);
  sub_235F1BF08(v80, &qword_256395038);
  sub_235F1BF08(v79, &qword_256395038);
  sub_235F1BF08(v77, &qword_256395038);
  return ((uint64_t (*)(char *, uint64_t))v83)(v76, v25);
}

uint64_t sub_235F21B98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;

  v2 = v1;
  v30 = a1;
  v3 = type metadata accessor for AVSCommandShortcutActionView(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395058);
  v29 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395128);
  v27 = *(_QWORD *)(v9 - 8);
  v28 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v25 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F25368(v2, (uint64_t)v6, type metadata accessor for AVSCommandShortcutActionView);
  v11 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v12 = swift_allocObject();
  sub_235F253C8((uint64_t)v6, v12 + v11, type metadata accessor for AVSCommandShortcutActionView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395130);
  sub_235F1BF90(&qword_256395138, &qword_256395130, MEMORY[0x24BDF4498]);
  sub_235F4C93C();
  v13 = v2 + *(int *)(v3 + 32);
  v14 = *(_BYTE *)v13;
  v15 = *(_QWORD *)(v13 + 8);
  v31 = v14;
  v32 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D68);
  sub_235F4C930();
  sub_235F25368(v2, (uint64_t)v6, type metadata accessor for AVSCommandShortcutActionView);
  v16 = swift_allocObject();
  sub_235F253C8((uint64_t)v6, v16 + v11, type metadata accessor for AVSCommandShortcutActionView);
  sub_235F1BF90(&qword_256395060, &qword_256395058, MEMORY[0x24BDF43B0]);
  sub_235F250F0();
  v18 = v25;
  v17 = v26;
  sub_235F4C870();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v17);
  v19 = sub_235F4C8F4();
  v21 = v27;
  v20 = v28;
  v22 = v30;
  (*(void (**)(uint64_t, char *, uint64_t))(v27 + 16))(v30, v18, v28);
  *(_QWORD *)(v22 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256395048) + 36)) = v19;
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v18, v20);
}

uint64_t sub_235F21E9C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  v2 = type metadata accessor for AVSCommandShortcutActionView(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v8[1] = sub_235F221B4((uint64_t)&unk_235F4DBC8, (uint64_t)&unk_235F4DBF0, (uint64_t (*)(char *))sub_235F25D50);
  swift_getKeyPath();
  sub_235F25368(a1, (uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVSCommandShortcutActionView);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  sub_235F253C8((uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, type metadata accessor for AVSCommandShortcutActionView);
  __swift_instantiateConcreteTypeFromMangledName(qword_256394E08);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563950A0);
  sub_235F1BF90(&qword_2563950B8, qword_256394E08, MEMORY[0x24BEE12D8]);
  sub_235F1BE00(&qword_2563950C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_235F251A0();
  return sub_235F4C96C();
}

uint64_t sub_235F22028(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  v2 = type metadata accessor for AVSCommandShortcutActionView(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v8[1] = sub_235F221B4((uint64_t)&unk_235F4DB80, (uint64_t)&unk_235F4DBA8, (uint64_t (*)(char *))sub_235F26970);
  swift_getKeyPath();
  sub_235F25368(a1, (uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVSCommandShortcutActionView);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  sub_235F253C8((uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, type metadata accessor for AVSCommandShortcutActionView);
  __swift_instantiateConcreteTypeFromMangledName(qword_256394E08);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563950A0);
  sub_235F1BF90(&qword_2563950B8, qword_256394E08, MEMORY[0x24BEE12D8]);
  sub_235F1BE00(&qword_2563950C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_235F251A0();
  return sub_235F4C96C();
}

uint64_t sub_235F221B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *))
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v5 = *(_QWORD *)(v3 + 56);
  v11 = *(_OWORD *)(v3 + 40);
  v12 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D48);
  sub_235F4C918();
  swift_bridgeObjectRelease();
  if ((v14 & 0x2000000000000000) != 0)
    v6 = HIBYTE(v14) & 0xF;
  else
    v6 = v13 & 0xFFFFFFFFFFFFLL;
  type metadata accessor for AVSCommandShortcutActionViewModel(0);
  sub_235F1BE00(&qword_256395118, type metadata accessor for AVSCommandShortcutActionViewModel, (uint64_t)&unk_235F4DA90);
  sub_235F4C444();
  swift_getKeyPath();
  swift_getKeyPath();
  if (v6)
  {
    sub_235F4C3CC();
    swift_release();
    swift_release();
    v7 = swift_release();
    MEMORY[0x24BDAC7A8](v7);
    v10[2] = v3;
    return sub_235F23660(a3, (uint64_t)v10, v8);
  }
  else
  {
    sub_235F4C3CC();
    swift_release();
    swift_release();
    swift_release();
    return v11;
  }
}

uint64_t sub_235F22338(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  v2 = type metadata accessor for AVSCommandShortcutActionView(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v8[1] = sub_235F221B4((uint64_t)&unk_235F4DB38, (uint64_t)&unk_235F4DB60, (uint64_t (*)(char *))sub_235F26970);
  swift_getKeyPath();
  sub_235F25368(a1, (uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVSCommandShortcutActionView);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  sub_235F253C8((uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, type metadata accessor for AVSCommandShortcutActionView);
  __swift_instantiateConcreteTypeFromMangledName(qword_256394E08);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563950A0);
  sub_235F1BF90(&qword_2563950B8, qword_256394E08, MEMORY[0x24BEE12D8]);
  sub_235F1BE00(&qword_2563950C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_235F251A0();
  return sub_235F4C96C();
}

uint64_t sub_235F224C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
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
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v28 = a4;
  v29 = a5;
  v26[0] = a1;
  v26[1] = a3;
  v30 = a6;
  v7 = type metadata accessor for AvailableShortcutAction();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for AVSCommandShortcutActionView(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563950B0);
  v15 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v17 = (char *)v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F25368(a2, (uint64_t)v14, type metadata accessor for AVSCommandShortcutActionView);
  v18 = v26[0];
  sub_235F25368(v26[0], (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
  v19 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v20 = (v13 + *(unsigned __int8 *)(v8 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v21 = swift_allocObject();
  sub_235F253C8((uint64_t)v14, v21 + v19, type metadata accessor for AVSCommandShortcutActionView);
  sub_235F253C8((uint64_t)v10, v21 + v20, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
  v31 = v18;
  v32 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563950C8);
  sub_235F1BF90(&qword_2563950D0, &qword_2563950C8, MEMORY[0x24BDF4498]);
  sub_235F4C93C();
  v22 = sub_235F4C8F4();
  v23 = v30;
  v24 = v27;
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(v30, v17, v27);
  *(_QWORD *)(v23 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2563950A0) + 36)) = v22;
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v24);
}

uint64_t sub_235F226D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = type metadata accessor for AVSCommandShortcutActionView(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  sub_235F25368(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVSCommandShortcutActionView);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  sub_235F253C8((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, type metadata accessor for AVSCommandShortcutActionView);
  return sub_235F4C93C();
}

uint64_t sub_235F227BC(uint64_t a1)
{
  void (**v1)(uint64_t);
  void (*v2)(uint64_t);
  uint64_t v3;

  v1 = (void (**)(uint64_t))(*(_QWORD *)(a1 + 8)
                                     + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  v2 = *v1;
  v3 = swift_retain();
  v2(v3);
  return swift_release();
}

uint64_t sub_235F22824(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394F38);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v12 - v7;
  v9 = sub_235F4C1C8();
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a2, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  type metadata accessor for AVSCommandShortcutActionView(0);
  sub_235F1BEC4((uint64_t)v8, (uint64_t)v6, &qword_256394F38);
  __swift_instantiateConcreteTypeFromMangledName(qword_256394F40);
  sub_235F4C924();
  sub_235F1BF08((uint64_t)v8, &qword_256394F38);
  return sub_235F22944(a2);
}

uint64_t sub_235F22944(uint64_t a1)
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void (*v23)(char *, uint64_t);
  unint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char *v28;
  uint64_t v30[2];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD aBlock[6];

  v31 = a1;
  v35 = sub_235F4C9FC();
  v38 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v34 = (char *)v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_235F4CA20();
  v36 = *(_QWORD *)(v3 - 8);
  v37 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AVSCommandShortcutActionView(0);
  v33 = *(_QWORD *)(v6 - 8);
  v7 = *(_QWORD *)(v33 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v8 = sub_235F4CA38();
  v9 = *(_QWORD *)(v8 - 8);
  v32 = v8;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v30 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(_QWORD *)(v1 + 8);
  sub_235F25368(v31, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
  v19 = type metadata accessor for AvailableShortcutAction();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v17, 0, 1, v19);
  v20 = v18 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  v21 = v20 + *(int *)(type metadata accessor for AdaptiveVoiceShortcut() + 28);
  swift_retain();
  sub_235F2549C((uint64_t)v17, v21);
  swift_endAccess();
  swift_release();
  sub_235F26110(0, (unint64_t *)&qword_256394D78);
  v22 = (void *)sub_235F4CBB8();
  sub_235F4CA2C();
  MEMORY[0x23B7E6780](v12, 0.5);
  v23 = *(void (**)(char *, uint64_t))(v9 + 8);
  v23(v12, v8);
  sub_235F25368(v30[1], (uint64_t)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVSCommandShortcutActionView);
  v24 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  v25 = swift_allocObject();
  sub_235F253C8((uint64_t)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v24, type metadata accessor for AVSCommandShortcutActionView);
  aBlock[4] = sub_235F254E8;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235F34E88;
  aBlock[3] = &block_descriptor_0;
  v26 = _Block_copy(aBlock);
  swift_release();
  sub_235F4CA14();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_235F1BE00((unint64_t *)&qword_256394D80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D88);
  sub_235F1BF90((unint64_t *)&qword_256394D90, &qword_256394D88, MEMORY[0x24BEE12C8]);
  v28 = v34;
  v27 = v35;
  sub_235F4CC48();
  MEMORY[0x23B7E68E8](v14, v5, v28, v26);
  _Block_release(v26);

  (*(void (**)(char *, uint64_t))(v38 + 8))(v28, v27);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v5, v37);
  return ((uint64_t (*)(char *, uint64_t))v23)(v14, v32);
}

uint64_t sub_235F22D1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;

  *(_QWORD *)a3 = sub_235F4C5B8();
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563950D8);
  return sub_235F22D78(a1, a2, a3 + *(int *)(v6 + 44));
}

uint64_t sub_235F22D78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v47[2];
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v47[1] = a2;
  v5 = sub_235F4C1C8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v47[0] = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563950E0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394F38);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v48 = (uint64_t)v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v47 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v47 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563950E8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v53 = (uint64_t)v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v52 = (char *)v47 - v22;
  v23 = (uint64_t *)(a1 + *(int *)(type metadata accessor for AvailableShortcutAction() + 20));
  v24 = v23[1];
  v54 = *v23;
  v55 = v24;
  sub_235F1EA80();
  swift_bridgeObjectRetain();
  v25 = sub_235F4C7C8();
  v50 = v26;
  v51 = v25;
  v49 = v27;
  v29 = v28;
  type metadata accessor for AVSCommandShortcutActionView(0);
  __swift_instantiateConcreteTypeFromMangledName(qword_256394F40);
  sub_235F4C918();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v16, a1, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v16, 0, 1, v5);
  v30 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_235F1BEC4((uint64_t)v18, (uint64_t)v10, &qword_256394F38);
  sub_235F1BEC4((uint64_t)v16, v30, &qword_256394F38);
  v31 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v31((uint64_t)v10, 1, v5) != 1)
  {
    sub_235F1BEC4((uint64_t)v10, v48, &qword_256394F38);
    if (v31(v30, 1, v5) != 1)
    {
      v33 = v47[0];
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v6 + 32))(v47[0], v30, v5);
      sub_235F1BE00(&qword_256395110, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v34 = v48;
      v35 = sub_235F4CA68();
      v36 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
      v36(v33, v5);
      sub_235F1BF08((uint64_t)v16, &qword_256394F38);
      sub_235F1BF08((uint64_t)v18, &qword_256394F38);
      v36(v34, v5);
      sub_235F1BF08((uint64_t)v10, &qword_256394F38);
      v32 = (uint64_t)v52;
      if ((v35 & 1) != 0)
        goto LABEL_8;
LABEL_9:
      v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563950F0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v32, 1, 1, v40);
      goto LABEL_10;
    }
    sub_235F1BF08((uint64_t)v16, &qword_256394F38);
    sub_235F1BF08((uint64_t)v18, &qword_256394F38);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v48, v5);
LABEL_6:
    sub_235F1BF08((uint64_t)v10, &qword_2563950E0);
    v32 = (uint64_t)v52;
    goto LABEL_9;
  }
  sub_235F1BF08((uint64_t)v16, &qword_256394F38);
  sub_235F1BF08((uint64_t)v18, &qword_256394F38);
  if (v31(v30, 1, v5) != 1)
    goto LABEL_6;
  sub_235F1BF08((uint64_t)v10, &qword_256394F38);
  v32 = (uint64_t)v52;
LABEL_8:
  v37 = sub_235F4C900();
  v38 = sub_235F4C8B8();
  v54 = v37;
  v55 = v38;
  sub_235F4C780();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395100);
  sub_235F25418();
  sub_235F4C7EC();
  swift_release();
  swift_release();
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563950F0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v32, 0, 1, v39);
LABEL_10:
  v41 = v49 & 1;
  v42 = v53;
  sub_235F1BEC4(v32, v53, &qword_2563950E8);
  v44 = v50;
  v43 = v51;
  *(_QWORD *)a3 = v51;
  *(_QWORD *)(a3 + 8) = v44;
  *(_BYTE *)(a3 + 16) = v41;
  *(_QWORD *)(a3 + 24) = v29;
  *(_QWORD *)(a3 + 32) = 0;
  *(_BYTE *)(a3 + 40) = 1;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563950F8);
  sub_235F1BEC4(v42, a3 + *(int *)(v45 + 64), &qword_2563950E8);
  sub_235F1BF44(v43, v44, v41);
  swift_bridgeObjectRetain();
  sub_235F1BF08(v32, &qword_2563950E8);
  sub_235F1BF08(v42, &qword_2563950E8);
  sub_235F1BF54(v43, v44, v41);
  return swift_bridgeObjectRelease();
}

uint64_t sub_235F232B8()
{
  type metadata accessor for AVSCommandShortcutActionView(0);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D68);
  sub_235F4C918();
  sub_235F4C924();
  return swift_release();
}

__n128 sub_235F23358@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  __n128 result;
  __n128 v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v2 = sub_235F4C5B8();
  sub_235F233B8((uint64_t)&v8);
  v3 = v9;
  v4 = v10;
  v5 = v11;
  v6 = v12;
  result = v8;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(_BYTE *)(a1 + 40) = v3;
  *(_QWORD *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 56) = v5;
  *(_BYTE *)(a1 + 64) = v6;
  return result;
}

uint64_t sub_235F233B8@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;

  sub_235F4C5F4();
  if (qword_256394AA8 != -1)
    swift_once();
  v2 = (void *)qword_256398358;
  if (!qword_256398358)
    v3 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v4 = v2;
  v5 = sub_235F4C7BC();
  v7 = v6;
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  v9 = v8 & 1;
  *(_BYTE *)(a1 + 16) = v8 & 1;
  *(_QWORD *)(a1 + 24) = v10;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  sub_235F1BF44(v5, v6, v8 & 1);
  swift_bridgeObjectRetain();
  sub_235F1BF54(v5, v7, v9);
  return swift_bridgeObjectRelease();
}

double sub_235F23500@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  __int128 v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  double result;
  uint64_t v17;
  char v18;
  double v19[3];
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v4 = type metadata accessor for AVSCommandShortcutActionView(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = a1 + *(int *)(MEMORY[0x24BDAC7A8](v4) + 32);
  v8 = *(_BYTE *)v7;
  v9 = *(_QWORD *)(v7 + 8);
  LOBYTE(v22) = v8;
  v23 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D68);
  sub_235F4C930();
  v10 = v20;
  v11 = v21;
  sub_235F25368(a1, (uint64_t)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVSCommandShortcutActionView);
  v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v13 = swift_allocObject();
  sub_235F253C8((uint64_t)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12, type metadata accessor for AVSCommandShortcutActionView);
  v22 = 0;
  v23 = 0xE000000000000000;
  sub_235F4C90C();
  *(_OWORD *)v19 = v20;
  v14 = v21;
  v15 = sub_235F4C420();
  result = v19[0];
  *(_OWORD *)a2 = *(_OWORD *)v19;
  *(_QWORD *)(a2 + 16) = v14;
  *(_BYTE *)(a2 + 24) = v15 & 1;
  *(_QWORD *)(a2 + 32) = v17;
  *(_BYTE *)(a2 + 40) = v18 & 1;
  *(_OWORD *)(a2 + 48) = v10;
  *(_BYTE *)(a2 + 64) = v11;
  *(_QWORD *)(a2 + 72) = sub_235F25DC0;
  *(_QWORD *)(a2 + 80) = v13;
  return result;
}

uint64_t sub_235F23660(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v7 = type metadata accessor for AvailableShortcutAction();
  v24 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v23 = (uint64_t)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v20 - v11;
  v13 = MEMORY[0x24BEE4AF8];
  v25 = MEMORY[0x24BEE4AF8];
  v22 = *(_QWORD *)(a3 + 16);
  if (v22)
  {
    v14 = 0;
    v15 = MEMORY[0x24BEE4AF8];
    v20[1] = a2;
    v21 = a3;
    v20[0] = a1;
    while (v14 < *(_QWORD *)(a3 + 16))
    {
      v16 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      v13 = *(_QWORD *)(v24 + 72);
      sub_235F25368(a3 + v16 + v13 * v14, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
      v17 = a1(v12);
      if (v3)
      {
        sub_235F1BD10((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
        swift_release();
        swift_bridgeObjectRelease();
        return v13;
      }
      if ((v17 & 1) != 0)
      {
        sub_235F253C8((uint64_t)v12, v23, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_235F25924(0, *(_QWORD *)(v15 + 16) + 1, 1);
        v15 = v25;
        v19 = *(_QWORD *)(v25 + 16);
        v18 = *(_QWORD *)(v25 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_235F25924(v18 > 1, v19 + 1, 1);
          v15 = v25;
        }
        *(_QWORD *)(v15 + 16) = v19 + 1;
        result = sub_235F253C8(v23, v15 + v16 + v19 * v13, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
        a3 = v21;
        a1 = (uint64_t (*)(char *))v20[0];
      }
      else
      {
        result = sub_235F1BD10((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
      }
      if (v22 == ++v14)
      {
        v13 = v25;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t sub_235F23878()
{
  char v0;

  type metadata accessor for AvailableShortcutAction();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D48);
  sub_235F4C918();
  sub_235F1EA80();
  v0 = sub_235F4CC30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_235F2393C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394F38);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v8 - v4;
  swift_retain();
  sub_235F322FC();
  swift_release();
  v6 = sub_235F4C1C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for AVSCommandShortcutActionView(0);
  sub_235F1BEC4((uint64_t)v5, (uint64_t)v3, &qword_256394F38);
  __swift_instantiateConcreteTypeFromMangledName(qword_256394F40);
  sub_235F4C924();
  return sub_235F1BF08((uint64_t)v5, &qword_256394F38);
}

uint64_t sub_235F23A48@<X0>(char *a1@<X8>)
{
  return sub_235F21158(a1);
}

uint64_t sub_235F23A50()
{
  uint64_t v0;

  return sub_235F226D8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_235F23A58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *(_QWORD *)a2 = sub_235F4C630();
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563951A8);
  return sub_235F23AA4(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_235F23AA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v15;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t KeyPath;
  uint64_t *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
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
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  char v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t OpaqueTypeConformance2;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _OWORD *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v112;
  uint64_t v113;
  uint64_t (*v114)(void);
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  char *v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;
  uint64_t v175;
  uint64_t v176;
  __int128 v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;

  v175 = a2;
  v173 = sub_235F4C4F8();
  MEMORY[0x24BDAC7A8](v173);
  v174 = (char *)&v129 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_235F4CB64();
  v169 = *(_QWORD *)(v4 - 8);
  v170 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v168 = (char *)&v129 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v160 = sub_235F4C4E0();
  v158 = *(_QWORD *)(v160 - 8);
  MEMORY[0x24BDAC7A8](v160);
  v157 = (char *)&v129 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v146 = sub_235F4C474();
  v145 = *(_QWORD *)(v146 - 8);
  MEMORY[0x24BDAC7A8](v146);
  v144 = (char *)&v129 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394C90);
  v140 = *(_QWORD *)(v141 - 8);
  MEMORY[0x24BDAC7A8](v141);
  v139 = (char *)&v129 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563951B0);
  v143 = *(_QWORD *)(v147 - 8);
  MEMORY[0x24BDAC7A8](v147);
  v142 = (char *)&v129 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v151 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563951B8);
  v149 = *(_QWORD *)(v151 - 8);
  MEMORY[0x24BDAC7A8](v151);
  v148 = (char *)&v129 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v156 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563951C0);
  v155 = *(_QWORD *)(v156 - 8);
  MEMORY[0x24BDAC7A8](v156);
  v153 = (char *)&v129 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v150 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563951C8);
  MEMORY[0x24BDAC7A8](v150);
  v154 = (char *)&v129 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v152 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563951D0);
  MEMORY[0x24BDAC7A8](v152);
  v163 = (uint64_t)&v129 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563951D8);
  MEMORY[0x24BDAC7A8](v159);
  v166 = (uint64_t)&v129 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563951E0);
  MEMORY[0x24BDAC7A8](v161);
  v167 = (char *)&v129 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563951E8);
  v16 = MEMORY[0x24BDAC7A8](v165);
  v172 = (uint64_t)&v129 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v164 = (uint64_t)&v129 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v171 = (uint64_t)&v129 - v20;
  v130 = sub_235F4C624();
  v129 = *(_QWORD *)(v130 - 8);
  MEMORY[0x24BDAC7A8](v130);
  v22 = (char *)&v129 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563951F0);
  MEMORY[0x24BDAC7A8](v23);
  v132 = (char *)&v129 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563951F8);
  MEMORY[0x24BDAC7A8](v133);
  v26 = (char *)&v129 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395200);
  v137 = *(_QWORD *)(v138 - 8);
  MEMORY[0x24BDAC7A8](v138);
  v136 = (char *)&v129 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395208);
  MEMORY[0x24BDAC7A8](v131);
  v29 = (char *)&v129 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395210);
  v30 = MEMORY[0x24BDAC7A8](v135);
  v162 = (uint64_t)&v129 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = MEMORY[0x24BDAC7A8](v30);
  v134 = (uint64_t)&v129 - v33;
  MEMORY[0x24BDAC7A8](v32);
  v176 = (uint64_t)&v129 - v34;
  sub_235F4C5F4();
  if (qword_256394AA8 != -1)
    swift_once();
  v35 = (void *)qword_256398358;
  if (!qword_256398358)
    v36 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v37 = v35;
  v179 = sub_235F4C7BC();
  v180 = v38;
  LOBYTE(v181) = v39 & 1;
  v182 = v40;
  sub_235F4C618();
  v41 = (uint64_t)v132;
  sub_235F4C84C();
  (*(void (**)(char *, uint64_t))(v129 + 8))(v22, v130);
  sub_235F1BF54(v179, v180, v181);
  swift_bridgeObjectRelease();
  v42 = sub_235F4C768();
  KeyPath = swift_getKeyPath();
  sub_235F1BEC4(v41, (uint64_t)v26, &qword_2563951F0);
  v44 = (uint64_t *)&v26[*(int *)(v133 + 36)];
  *v44 = KeyPath;
  v44[1] = v42;
  sub_235F1BF08(v41, &qword_2563951F0);
  sub_235F26678();
  v45 = v136;
  sub_235F4C864();
  sub_235F1BF08((uint64_t)v26, &qword_2563951F8);
  LOBYTE(v42) = sub_235F4C714();
  v46 = v137;
  v47 = v138;
  (*(void (**)(char *, char *, uint64_t))(v137 + 16))(v29, v45, v138);
  v48 = &v29[*(int *)(v131 + 36)];
  *v48 = v42;
  *(_OWORD *)(v48 + 8) = 0u;
  *(_OWORD *)(v48 + 24) = 0u;
  v48[40] = 1;
  (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v47);
  LOBYTE(v42) = sub_235F4C72C();
  sub_235F4C3FC();
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v57 = v134;
  sub_235F1BEC4((uint64_t)v29, v134, &qword_256395208);
  v58 = v57 + *(int *)(v135 + 36);
  *(_BYTE *)v58 = v42;
  *(_QWORD *)(v58 + 8) = v50;
  *(_QWORD *)(v58 + 16) = v52;
  *(_QWORD *)(v58 + 24) = v54;
  *(_QWORD *)(v58 + 32) = v56;
  *(_BYTE *)(v58 + 40) = 0;
  sub_235F1BF08((uint64_t)v29, &qword_256395208);
  sub_235F1EBAC(v57, v176, &qword_256395210);
  sub_235F4C5F4();
  v59 = (void *)qword_256398358;
  if (!qword_256398358)
    v60 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v61 = v59;
  v62 = sub_235F4C7BC();
  v137 = v63;
  v65 = v64;
  v138 = v66;
  LODWORD(v136) = sub_235F4C720();
  v67 = v61;
  if (!v59)
    v67 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  LODWORD(v135) = v65 & 1;
  v68 = v61;
  v69 = sub_235F4C108();
  v71 = v70;

  v177 = *(_OWORD *)a1;
  v178 = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D48);
  sub_235F4C930();
  v179 = v69;
  v180 = v71;
  sub_235F1EA80();
  v72 = v139;
  sub_235F4C9C0();
  v177 = *(_OWORD *)(a1 + 24);
  LOBYTE(v178) = *(_BYTE *)(a1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394C80);
  sub_235F4C414();
  v73 = sub_235F1BF90(&qword_256394D58, &qword_256394C90, MEMORY[0x24BDF53E0]);
  v74 = v142;
  v75 = v141;
  sub_235F4C87C();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v140 + 8))(v72, v75);
  v76 = v144;
  sub_235F4C468();
  v179 = v75;
  v180 = v73;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v78 = v148;
  v79 = v147;
  sub_235F4C810();
  (*(void (**)(char *, uint64_t))(v145 + 8))(v76, v146);
  (*(void (**)(char *, uint64_t))(v143 + 8))(v74, v79);
  v80 = swift_allocObject();
  v81 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v80 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v80 + 64) = v81;
  *(_OWORD *)(v80 + 80) = *(_OWORD *)(a1 + 64);
  *(_QWORD *)(v80 + 96) = *(_QWORD *)(a1 + 80);
  v82 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v80 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v80 + 32) = v82;
  sub_235F2678C(a1);
  v83 = v157;
  sub_235F4C4D4();
  v179 = v79;
  v180 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v84 = v153;
  v85 = v151;
  sub_235F4C8A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v158 + 8))(v83, v160);
  (*(void (**)(char *, uint64_t))(v149 + 8))(v78, v85);
  v86 = swift_allocObject();
  v87 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v86 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v86 + 64) = v87;
  *(_OWORD *)(v86 + 80) = *(_OWORD *)(a1 + 64);
  *(_QWORD *)(v86 + 96) = *(_QWORD *)(a1 + 80);
  v88 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v86 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v86 + 32) = v88;
  sub_235F2678C(a1);
  v89 = v168;
  sub_235F4CB4C();
  v90 = (uint64_t)v154;
  v91 = &v154[*(int *)(v150 + 36)];
  v92 = sub_235F4C4A4();
  v94 = v169;
  v93 = v170;
  (*(void (**)(char *, char *, uint64_t))(v169 + 16))(&v91[*(int *)(v92 + 20)], v89, v170);
  *(_QWORD *)v91 = &unk_256395230;
  *((_QWORD *)v91 + 1) = v86;
  v95 = v155;
  v96 = v156;
  (*(void (**)(uint64_t, char *, uint64_t))(v155 + 16))(v90, v84, v156);
  (*(void (**)(char *, uint64_t))(v94 + 8))(v89, v93);
  (*(void (**)(char *, uint64_t))(v95 + 8))(v84, v96);
  LOBYTE(v96) = sub_235F4C720();
  v97 = v163;
  sub_235F1BEC4(v90, v163, &qword_2563951C8);
  v98 = v97 + *(int *)(v152 + 36);
  *(_BYTE *)v98 = v96;
  *(_OWORD *)(v98 + 8) = 0u;
  *(_OWORD *)(v98 + 24) = 0u;
  *(_BYTE *)(v98 + 40) = 1;
  sub_235F1BF08(v90, &qword_2563951C8);
  v99 = objc_msgSend((id)objc_opt_self(), sel_tertiarySystemFillColor);
  v100 = MEMORY[0x23B7E65E8](v99);
  LOBYTE(v95) = sub_235F4C720();
  v101 = v166;
  sub_235F1BEC4(v97, v166, &qword_2563951D0);
  v102 = v101 + *(int *)(v159 + 36);
  *(_QWORD *)v102 = v100;
  *(_BYTE *)(v102 + 8) = v95;
  sub_235F1BF08(v97, &qword_2563951D0);
  v103 = v174;
  v104 = &v174[*(int *)(v173 + 20)];
  v105 = *MEMORY[0x24BDEEB68];
  v106 = sub_235F4C60C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v106 - 8) + 104))(v104, v105, v106);
  __asm { FMOV            V0.2D, #12.0 }
  *v103 = _Q0;
  v112 = (uint64_t)v167;
  v113 = (uint64_t)&v167[*(int *)(v161 + 36)];
  v114 = MEMORY[0x24BDED998];
  sub_235F25368((uint64_t)v103, v113, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v113 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256394D60) + 36)) = 256;
  sub_235F1BEC4(v101, v112, &qword_2563951D8);
  sub_235F1BD10((uint64_t)v103, (uint64_t (*)(_QWORD))v114);
  sub_235F1BF08(v101, &qword_2563951D8);
  v115 = swift_getKeyPath();
  v116 = v164;
  sub_235F1BEC4(v112, v164, &qword_2563951E0);
  v117 = v116 + *(int *)(v165 + 36);
  *(_QWORD *)v117 = v115;
  *(_BYTE *)(v117 + 8) = 1;
  sub_235F1BF08(v112, &qword_2563951E0);
  v118 = v116;
  v119 = v171;
  sub_235F1EBAC(v118, v171, &qword_2563951E8);
  v120 = v176;
  v121 = v162;
  sub_235F1BEC4(v176, v162, &qword_256395210);
  v122 = v172;
  sub_235F1BEC4(v119, v172, &qword_2563951E8);
  v123 = v175;
  sub_235F1BEC4(v121, v175, &qword_256395210);
  v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395238);
  v125 = v123 + *(int *)(v124 + 48);
  *(_QWORD *)v125 = v62;
  v126 = v62;
  v127 = v137;
  *(_QWORD *)(v125 + 8) = v137;
  LOBYTE(v114) = v135;
  *(_BYTE *)(v125 + 16) = v135;
  *(_QWORD *)(v125 + 24) = v138;
  *(_BYTE *)(v125 + 32) = (_BYTE)v136;
  *(_OWORD *)(v125 + 40) = 0u;
  *(_OWORD *)(v125 + 56) = 0u;
  *(_BYTE *)(v125 + 72) = 1;
  sub_235F1BEC4(v122, v123 + *(int *)(v124 + 64), &qword_2563951E8);
  sub_235F1BF44(v126, v127, (char)v114);
  swift_bridgeObjectRetain();
  sub_235F1BF08(v119, &qword_2563951E8);
  sub_235F1BF08(v120, &qword_256395210);
  sub_235F1BF08(v122, &qword_2563951E8);
  sub_235F1BF54(v126, v127, (char)v114);
  swift_bridgeObjectRelease();
  return sub_235F1BF08(v121, &qword_256395210);
}

uint64_t sub_235F24B70(__int128 *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  __int128 v28;
  uint64_t v29;

  v2 = sub_235F4C1C8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AvailableShortcutAction();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v22 - v10;
  v28 = *a1;
  v29 = *((_QWORD *)a1 + 2);
  v24 = *a1;
  v25 = *((_QWORD *)a1 + 2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D48);
  sub_235F4C918();
  v13 = v26;
  v12 = v27;
  result = swift_bridgeObjectRelease();
  v15 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0)
    v15 = v13 & 0xFFFFFFFFFFFFLL;
  if (v15)
  {
    v24 = a1[3];
    LOBYTE(v25) = *((_BYTE *)a1 + 64);
    LOBYTE(v26) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256395240);
    sub_235F4C954();
    v24 = *a1;
    v25 = *((_QWORD *)a1 + 2);
    sub_235F4C918();
    v22 = v27;
    v23 = v26;
    v24 = *a1;
    v25 = *((_QWORD *)a1 + 2);
    sub_235F4C918();
    v16 = v5;
    v17 = v26;
    v18 = v27;
    sub_235F4C1BC();
    sub_235F4C1BC();
    (*(void (**)(char *, char *, uint64_t))(v3 + 40))(v9, v16, v2);
    v19 = &v9[*(int *)(v6 + 20)];
    v20 = v22;
    *(_QWORD *)v19 = v23;
    *((_QWORD *)v19 + 1) = v20;
    v21 = &v9[*(int *)(v6 + 24)];
    *(_QWORD *)v21 = v17;
    *((_QWORD *)v21 + 1) = v18;
    v21[16] = 2;
    sub_235F253C8((uint64_t)v9, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
    (*((void (**)(char *))a1 + 9))(v11);
    v24 = v28;
    v25 = v29;
    v26 = 0;
    v27 = 0xE000000000000000;
    sub_235F4C924();
    return sub_235F1BD10((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
  }
  return result;
}

uint64_t sub_235F24DBC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = a1;
  sub_235F4CB40();
  *(_QWORD *)(v1 + 48) = sub_235F4CB34();
  sub_235F4CB28();
  return swift_task_switch();
}

uint64_t sub_235F24E28()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;

  v1 = *(_QWORD *)(v0 + 40);
  swift_release();
  v2 = *(_OWORD *)(v1 + 24);
  *(_BYTE *)(v0 + 32) = *(_BYTE *)(v1 + 40);
  *(_OWORD *)(v0 + 16) = v2;
  *(_BYTE *)(v0 + 33) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394C80);
  sub_235F4C408();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235F24E90@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  __int128 v7;
  __int128 v8;
  char v9;
  uint64_t v10;
  _BYTE v12[16];
  _OWORD *v13;
  _OWORD v14[5];
  uint64_t v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395188);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = *(_OWORD *)(v1 + 48);
  v14[2] = *(_OWORD *)(v1 + 32);
  v14[3] = v7;
  v14[4] = *(_OWORD *)(v1 + 64);
  v15 = *(_QWORD *)(v1 + 80);
  v8 = *(_OWORD *)(v1 + 16);
  v14[0] = *(_OWORD *)v1;
  v14[1] = v8;
  v13 = v14;
  sub_235F4C708();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395190);
  sub_235F1BF90(&qword_256395198, &qword_256395190, MEMORY[0x24BDF4700]);
  sub_235F4C42C();
  v9 = sub_235F4C720();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v4 + 16))(a1, v6, v3);
  v10 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2563951A0) + 36);
  *(_BYTE *)v10 = v9;
  *(_OWORD *)(v10 + 8) = 0u;
  *(_OWORD *)(v10 + 24) = 0u;
  *(_BYTE *)(v10 + 40) = 1;
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_235F24FE4()
{
  return sub_235F254F4(sub_235F227BC);
}

uint64_t sub_235F24FF0@<X0>(uint64_t a1@<X8>)
{
  return sub_235F21B98(a1);
}

unint64_t sub_235F25010()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_256395050;
  if (!qword_256395050)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256395048);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256395058);
    v2[3] = &type metadata for SiriRequestView;
    v2[4] = sub_235F1BF90(&qword_256395060, &qword_256395058, MEMORY[0x24BDF43B0]);
    v2[5] = sub_235F250F0();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_235F1BF90(&qword_256395070, &qword_256395078, MEMORY[0x24BDF0710]);
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256395050);
  }
  return result;
}

unint64_t sub_235F250F0()
{
  unint64_t result;

  result = qword_256395068;
  if (!qword_256395068)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4DC20, &type metadata for SiriRequestView);
    atomic_store(result, (unint64_t *)&qword_256395068);
  }
  return result;
}

uint64_t sub_235F25134()
{
  uint64_t v0;

  return sub_235F22338(*(_QWORD *)(v0 + 16));
}

unint64_t sub_235F2513C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256395090;
  if (!qword_256395090)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256395088);
    v2 = sub_235F251A0();
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256395090);
  }
  return result;
}

unint64_t sub_235F251A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256395098;
  if (!qword_256395098)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563950A0);
    v2[0] = sub_235F1BF90(&qword_2563950A8, &qword_2563950B0, MEMORY[0x24BDF43B0]);
    v2[1] = sub_235F1BF90(&qword_256395070, &qword_256395078, MEMORY[0x24BDF0710]);
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256395098);
  }
  return result;
}

uint64_t sub_235F2523C()
{
  uint64_t v0;

  return sub_235F22028(*(_QWORD *)(v0 + 16));
}

uint64_t sub_235F25244()
{
  uint64_t v0;

  return sub_235F21E9C(*(_QWORD *)(v0 + 16));
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for AVSCommandShortcutActionView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  sub_235F1C2BC();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = v0 + ((v2 + 16) & ~v2) + *(int *)(v1 + 28);
  v4 = sub_235F4C1C8();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  __swift_instantiateConcreteTypeFromMangledName(qword_256394F40);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F2534C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_235F25568(a1, (uint64_t)&unk_25074F878, (uint64_t)sub_235F2540C, (uint64_t)sub_235F25410, a2);
}

uint64_t sub_235F25368(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_235F253B0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_235F253C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_235F25410@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235F22D1C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_235F25418()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256395108;
  if (!qword_256395108)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256395100);
    v2 = sub_235F1BF90(&qword_256395070, &qword_256395078, MEMORY[0x24BDF0710]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256395108);
  }
  return result;
}

uint64_t sub_235F2549C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F254E8()
{
  return sub_235F254F4((uint64_t (*)(uint64_t))sub_235F2393C);
}

uint64_t sub_235F254F4(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AVSCommandShortcutActionView(0) - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
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

uint64_t sub_235F2554C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_235F25568(a1, (uint64_t)&unk_25074F918, (uint64_t)sub_235F2540C, (uint64_t)sub_235F26998, a2);
}

uint64_t sub_235F25568@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;

  v11 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AVSCommandShortcutActionView(0) - 8) + 80);
  return sub_235F224C4(a1, v5 + ((v11 + 16) & ~v11), a2, a3, a4, a5);
}

uint64_t objectdestroy_5Tm()
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
  uint64_t v9;
  uint64_t v11;

  v1 = type metadata accessor for AVSCommandShortcutActionView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v11 = *(_QWORD *)(v2 + 64);
  v4 = type metadata accessor for AvailableShortcutAction();
  v5 = *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80);
  swift_release();
  sub_235F1C2BC();
  swift_bridgeObjectRelease();
  swift_release();
  v6 = v0 + v3 + *(int *)(v1 + 28);
  v7 = sub_235F4C1C8();
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
    (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v6, v7);
  __swift_instantiateConcreteTypeFromMangledName(qword_256394F40);
  swift_release();
  swift_release();
  v9 = v0 + ((v3 + v11 + v5) & ~v5);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v7);
  swift_bridgeObjectRelease();
  sub_235F253B0(*(_QWORD *)(v9 + *(int *)(v4 + 24)), *(_QWORD *)(v9 + *(int *)(v4 + 24) + 8), *(_BYTE *)(v9 + *(int *)(v4 + 24) + 16));
  return swift_deallocObject();
}

uint64_t sub_235F25750()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for AVSCommandShortcutActionView(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AvailableShortcutAction() - 8) + 80);
  return sub_235F22824(v0 + v2, v0 + ((v2 + v3 + v4) & ~v4));
}

uint64_t sub_235F257B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_235F25568(a1, (uint64_t)&unk_25074F968, (uint64_t)sub_235F2540C, (uint64_t)sub_235F26998, a2);
}

uint64_t sub_235F257D4@<X0>(_QWORD *a1@<X8>)
{
  return sub_235F2581C(a1);
}

uint64_t sub_235F257F8()
{
  return sub_235F25894();
}

uint64_t sub_235F2581C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235F4C3CC();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_235F25894()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_235F4C3D8();
}

uint64_t sub_235F25908(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_235F25978(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_235F25924(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_235F25AE0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_235F25940(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_235F25E00(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_235F2595C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_235F25F88(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_235F25978(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256394DA0);
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
  result = sub_235F4CD50();
  __break(1u);
  return result;
}

uint64_t sub_235F25AE0(char a1, int64_t a2, char a3, _QWORD *a4)
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
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395120);
  v10 = *(_QWORD *)(type metadata accessor for AvailableShortcutAction() - 8);
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
  v16 = *(_QWORD *)(type metadata accessor for AvailableShortcutAction() - 8);
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
  result = sub_235F4CD50();
  __break(1u);
  return result;
}

uint64_t sub_235F25CC0@<X0>(_QWORD *a1@<X8>)
{
  return sub_235F2581C(a1);
}

uint64_t sub_235F25CE4()
{
  return sub_235F25894();
}

uint64_t sub_235F25D08@<X0>(_QWORD *a1@<X8>)
{
  return sub_235F2581C(a1);
}

uint64_t sub_235F25D2C()
{
  return sub_235F25894();
}

uint64_t sub_235F25D50()
{
  return sub_235F23878() & 1;
}

uint64_t sub_235F25D70()
{
  return sub_235F254F4((uint64_t (*)(uint64_t))sub_235F232B8);
}

double sub_235F25D80@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AVSCommandShortcutActionView(0) - 8) + 80);
  return sub_235F23500(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_235F25DC0(uint64_t a1)
{
  type metadata accessor for AVSCommandShortcutActionView(0);
  return sub_235F22944(a1);
}

uint64_t sub_235F25E00(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256395178);
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256395180);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_235F4CD50();
  __break(1u);
  return result;
}

uint64_t sub_235F25F88(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256395140);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_235F4CD50();
  __break(1u);
  return result;
}

uint64_t sub_235F260E4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235F26108(unint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_235F1F578(a1, a2, v2);
}

uint64_t sub_235F26110(uint64_t a1, unint64_t *a2)
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

uint64_t sub_235F26148()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235F2617C(uint64_t a1)
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
  v8[1] = sub_235F26988;
  return sub_235F1FB3C(a1, v4, v5, v7, v6);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t destroy for SiriRequestView()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SiriRequestView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v4 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v4;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v5 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SiriRequestView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v4 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for SiriRequestView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriRequestView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriRequestView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
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
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriRequestView()
{
  return &type metadata for SiriRequestView;
}

uint64_t sub_235F26530()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256395008);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256395000);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394FF8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394C60);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394FF0);
  sub_235F1BF90(&qword_256395028, &qword_256394FF0, MEMORY[0x24BDF1A30]);
  swift_getOpaqueTypeConformance2();
  sub_235F1BF90(&qword_256394C70, &qword_256394C60, MEMORY[0x24BDF43B0]);
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235F26658()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235F26668@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235F23A58(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_235F26678()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256395218;
  if (!qword_256395218)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563951F8);
    v2[0] = sub_235F266FC();
    v2[1] = sub_235F1BF90(&qword_256394D38, &qword_256394D40, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256395218);
  }
  return result;
}

unint64_t sub_235F266FC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256395220;
  if (!qword_256395220)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563951F0);
    v2 = sub_235F1BE00(&qword_256394D30, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, &qword_256395220);
  }
  return result;
}

uint64_t sub_235F26784()
{
  uint64_t v0;

  return sub_235F24B70((__int128 *)(v0 + 16));
}

uint64_t sub_235F2678C(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t objectdestroy_67Tm()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F2684C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_235F26898;
  return sub_235F24DBC(v0 + 16);
}

uint64_t sub_235F26898()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_235F268EC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256395248;
  if (!qword_256395248)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563951A0);
    v2[0] = sub_235F1BF90(&qword_256395250, &qword_256395188, MEMORY[0x24BDEB238]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256395248);
  }
  return result;
}

uint64_t sub_235F26970()
{
  return sub_235F25D50() & 1;
}

uint64_t AdaptiveVoiceShortcutObjcClass.identifier.getter()
{
  return sub_235F26A78(&OBJC_IVAR___AdaptiveVoiceShortcutObjcClass_identifier);
}

uint64_t AdaptiveVoiceShortcutObjcClass.identifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_235F26B48(a1, a2, &OBJC_IVAR___AdaptiveVoiceShortcutObjcClass_identifier);
}

uint64_t AdaptiveVoiceShortcutObjcClass.name.getter()
{
  return sub_235F26A78(&OBJC_IVAR___AdaptiveVoiceShortcutObjcClass_name);
}

uint64_t AdaptiveVoiceShortcutObjcClass.name.setter(uint64_t a1, uint64_t a2)
{
  return sub_235F26B48(a1, a2, &OBJC_IVAR___AdaptiveVoiceShortcutObjcClass_name);
}

id sub_235F26A08()
{
  void *v0;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v0 = (void *)sub_235F4CA74();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AdaptiveVoiceShortcutObjcClass.associatedShortcutName.getter()
{
  return sub_235F26A78(&OBJC_IVAR___AdaptiveVoiceShortcutObjcClass_associatedShortcutName);
}

uint64_t sub_235F26A78(_QWORD *a1)
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

uint64_t sub_235F26AD4(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  v6 = sub_235F4CA80();
  v8 = v7;
  v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t AdaptiveVoiceShortcutObjcClass.associatedShortcutName.setter(uint64_t a1, uint64_t a2)
{
  return sub_235F26B48(a1, a2, &OBJC_IVAR___AdaptiveVoiceShortcutObjcClass_associatedShortcutName);
}

uint64_t sub_235F26B48(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)(v3 + *a3);
  swift_beginAccess();
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

void sub_235F26BA0(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend(*a1, *a2);
  v5 = sub_235F4CA80();
  v7 = v6;

  *a3 = v5;
  a3[1] = v7;
}

void sub_235F26C44()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = (void *)sub_235F4CA74();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_256398330 = (uint64_t)v2;
}

void sub_235F26CB0()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = (void *)AXCPSharedResourcesDirectory();
  if (v0)
  {
    v1 = v0;
    v2 = sub_235F4CA80();
    v4 = v3;

    qword_256395258 = v2;
    unk_256395260 = v4;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_235F26D08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  sub_235F4CC90();
  if (qword_256394A88 != -1)
    swift_once();
  v1 = qword_256395258;
  v0 = unk_256395260;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = sub_235F4CABC();
  qword_256395268 = v1;
  unk_256395270 = v0;
  return result;
}

uint64_t sub_235F26DC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  sub_235F4CC90();
  if (qword_256394A88 != -1)
    swift_once();
  v1 = qword_256395258;
  v0 = unk_256395260;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = sub_235F4CABC();
  qword_256395278 = v1;
  unk_256395280 = v0;
  return result;
}

unint64_t sub_235F26EC4(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395478);
  v2 = (_QWORD *)sub_235F4CD44();
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
    result = sub_235F3D5F8(v5, v6);
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

uint64_t AVSStore.save(avsShortcut:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v2 = type metadata accessor for AdaptiveVoiceShortcut();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_235F28AB0();
  sub_235F25368(a1, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v6 = sub_235F27CC4(0, *(_QWORD *)(v6 + 16) + 1, 1, v6, &qword_256395448, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
  v8 = *(_QWORD *)(v6 + 16);
  v7 = *(_QWORD *)(v6 + 24);
  if (v8 >= v7 >> 1)
    v6 = sub_235F27CC4(v7 > 1, v8 + 1, 1, v6, &qword_256395448, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
  *(_QWORD *)(v6 + 16) = v8 + 1;
  sub_235F29FFC((uint64_t)v5, v6+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(_QWORD *)(v3 + 72) * v8);
  sub_235F2A158(v6);
  return swift_bridgeObjectRelease();
}

uint64_t AVSStore.retrieveShortcut(withIdentifier:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v21 = a1;
  v3 = type metadata accessor for AdaptiveVoiceShortcut();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_235F28AB0();
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    v19 = v3;
    v20 = a2;
    v9 = v7 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v17[1] = v7;
    v18 = v4;
    v10 = *(_QWORD *)(v4 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_235F25368(v9, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
      v26 = sub_235F4C1B0();
      v27 = v11;
      v24 = 45;
      v25 = 0xE100000000000000;
      v22 = 0;
      v23 = 0xE000000000000000;
      sub_235F1EA80();
      sub_235F4CC24();
      swift_bridgeObjectRelease();
      sub_235F4CAA4();
      swift_bridgeObjectRelease();
      v12 = (void *)sub_235F4CA74();
      swift_bridgeObjectRelease();
      v13 = (void *)sub_235F4CA74();
      v14 = objc_msgSend(v12, sel_isEqual_, v13);

      if (v14)
        break;
      sub_235F1BD10((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
      v9 += v10;
      if (!--v8)
      {
        swift_bridgeObjectRelease();
        v15 = 1;
        a2 = v20;
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
    a2 = v20;
    sub_235F29FFC((uint64_t)v6, v20);
    v15 = 0;
LABEL_8:
    v4 = v18;
    v3 = v19;
  }
  else
  {
    v15 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(a2, v15, 1, v3);
  return swift_bridgeObjectRelease();
}

AVSStore __swiftcall AVSStore.init()()
{
  return (AVSStore)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id AVSStore.init()()
{
  objc_super v1;

  v1.super_class = (Class)AVSStore;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t sub_235F27488(char a1)
{
  return qword_235F4DEB0[a1];
}

BOOL sub_235F274A8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_235F274BC()
{
  sub_235F4CE34();
  sub_235F4CE40();
  return sub_235F4CE4C();
}

uint64_t sub_235F27500()
{
  return sub_235F4CE40();
}

uint64_t sub_235F27528()
{
  sub_235F4CE34();
  sub_235F4CE40();
  return sub_235F4CE4C();
}

uint64_t sub_235F27568()
{
  char *v0;

  return sub_235F27488(*v0);
}

uint64_t sub_235F27570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_235F2F2B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_235F27594()
{
  return 0;
}

void sub_235F275A0(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_235F275AC()
{
  sub_235F2E988();
  return sub_235F4CE70();
}

uint64_t sub_235F275D4()
{
  sub_235F2E988();
  return sub_235F4CE7C();
}

uint64_t AVSDebugEvent.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE v11[16];
  uint64_t v12;
  char v13;
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563952A0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235F2E988();
  sub_235F4CE64();
  v14 = 0;
  sub_235F4C1C8();
  sub_235F1BE00(&qword_2563952B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_235F4CDF8();
  if (!v2)
  {
    v9 = type metadata accessor for AVSDebugEvent();
    v13 = 1;
    sub_235F4CDE0();
    v12 = *(_QWORD *)(v3 + *(int *)(v9 + 24));
    v11[15] = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563952B8);
    sub_235F2EA28(&qword_2563952C0, MEMORY[0x24BEE3F38], MEMORY[0x24BEE12A0]);
    sub_235F4CDD4();
    v11[14] = 3;
    sub_235F4CDEC();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t AVSDebugEvent.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  char v36;
  char v37;

  v26 = a2;
  v4 = sub_235F4C1C8();
  v32 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v27 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563952C8);
  v6 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for AVSDebugEvent();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F4C1BC();
  v28 = v9;
  v12 = *(int *)(v9 + 24);
  v30 = a1;
  v31 = v12;
  *(_QWORD *)&v11[v12] = 0;
  v13 = *(_QWORD *)(a1 + 24);
  v14 = (_QWORD *)a1;
  v15 = v8;
  __swift_project_boxed_opaque_existential_1(v14, v13);
  sub_235F2E988();
  sub_235F4CE58();
  if (v2)
  {
    v17 = v32;
    __swift_destroy_boxed_opaque_existential_1(v30);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v11, v4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v37 = 0;
    sub_235F1BE00(&qword_2563952D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    v16 = v27;
    sub_235F4CDA4();
    (*(void (**)(char *, char *, uint64_t))(v32 + 40))(v11, v16, v4);
    v36 = 1;
    v18 = sub_235F4CD8C();
    v19 = (uint64_t *)&v11[*(int *)(v28 + 20)];
    *v19 = v18;
    v19[1] = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563952B8);
    v34 = 2;
    sub_235F2EA28(&qword_2563952D8, MEMORY[0x24BEE3F50], MEMORY[0x24BEE12D0]);
    sub_235F4CD80();
    v21 = v35;
    v22 = v31;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v11[v22] = v21;
    v33 = 3;
    sub_235F4CD98();
    v24 = v23;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v15, v29);
    *(_DWORD *)&v11[*(int *)(v28 + 28)] = v24;
    sub_235F25368((uint64_t)v11, v26, (uint64_t (*)(_QWORD))type metadata accessor for AVSDebugEvent);
    __swift_destroy_boxed_opaque_existential_1(v30);
    return sub_235F1BD10((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for AVSDebugEvent);
  }
}

uint64_t sub_235F27B7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return AVSDebugEvent.init(from:)(a1, a2);
}

uint64_t sub_235F27B90(_QWORD *a1)
{
  return AVSDebugEvent.encode(to:)(a1);
}

char *sub_235F27BA4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563953F8);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_235F289CC(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_235F27C9C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_235F27CC4(a1, a2, a3, a4, &qword_256395120, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
}

uint64_t sub_235F27CB0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_235F27CC4(a1, a2, a3, a4, &qword_2563953F0, (uint64_t (*)(_QWORD))MEMORY[0x24BEC0CD8]);
}

uint64_t sub_235F27CC4(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_235F4CD14();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_235F2A040(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_235F27ED0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_235F27CC4(a1, a2, a3, a4, &qword_256395448, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
}

uint64_t sub_235F27EE4(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395478);
  v42 = a2;
  v6 = sub_235F4CD38();
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
    sub_235F4CE34();
    sub_235F4CAB0();
    result = sub_235F4CE4C();
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

unint64_t sub_235F28208(unint64_t result, uint64_t a2)
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
  _OWORD *v15;
  _OWORD *v16;
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
    result = sub_235F4CC54();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_235F4CE34();
        swift_bridgeObjectRetain();
        sub_235F4CAB0();
        v9 = sub_235F4CE4C();
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
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
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

void *sub_235F283DC()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395478);
  v2 = *v0;
  v3 = sub_235F4CD2C();
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

uint64_t sub_235F28594(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(char *, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  unint64_t v53;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395468);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v48 = (uint64_t)&v42 - v6;
  v7 = sub_235F4C294();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v49 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(unsigned __int8 *)(v8 + 80);
  v11 = (v10 + 32) & ~v10;
  v52 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v50 = MEMORY[0x24BEE4AF8] + v11;
  v45 = v10 | 7;
  result = swift_bridgeObjectRetain();
  v53 = 0;
  v51 = 0;
  v13 = 0;
  v47 = v11;
LABEL_4:
  v16 = *(_QWORD *)(a1 + 16);
  if (v13 != v16)
  {
    if (v13 < v16)
    {
      while (1)
      {
        v17 = *(_QWORD *)(a1 + 32 + 8 * v13);
        swift_bridgeObjectRetain();
        result = swift_bridgeObjectRelease();
        if (v17)
          break;
LABEL_9:
        ++v13;
        v18 = *(_QWORD *)(a1 + 16);
        if (v13 == v18)
          goto LABEL_36;
        if (v13 >= v18)
          goto LABEL_41;
      }
      v14 = *(_QWORD *)(v17 + 16);
      if (!v14)
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v5, 1, 1, v7);
        result = sub_235F1BF08((uint64_t)v5, &qword_256395468);
        goto LABEL_9;
      }
      v15 = 0;
      ++v13;
      while (1)
      {
        if (v15 >= v14)
          goto LABEL_42;
        v19 = v17 + v11;
        v20 = *(_QWORD *)(v8 + 72);
        v53 = v15;
        (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v5, v19 + v20 * v15, v7);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
        v21 = v48;
        sub_235F1EBAC((uint64_t)v5, v48, &qword_256395468);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v21, 1, v7) == 1)
          goto LABEL_37;
        v46 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 32);
        result = v46(v49, v21, v7);
        v22 = v51;
        v23 = v52;
        if (!v51)
          break;
LABEL_34:
        v35 = __OFSUB__(v22, 1);
        v36 = v22 - 1;
        if (v35)
          goto LABEL_43;
        v51 = v36;
        ++v53;
        v37 = v50;
        result = v46((char *)v50, (uint64_t)v49, v7);
        v50 = v37 + v20;
        v52 = v23;
        v11 = v47;
        v14 = *(_QWORD *)(v17 + 16);
        v15 = v53;
        if (v53 == v14)
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v5, 1, 1, v7);
          result = sub_235F1BF08((uint64_t)v5, &qword_256395468);
          goto LABEL_4;
        }
      }
      v24 = v52[3];
      if ((uint64_t)((v24 >> 1) + 0x4000000000000000) < 0)
        goto LABEL_45;
      v25 = v24 & 0xFFFFFFFFFFFFFFFELL;
      if (v25 <= 1)
        v26 = 1;
      else
        v26 = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563953F0);
      v27 = v47;
      v51 = v26;
      v23 = (_QWORD *)swift_allocObject();
      result = _swift_stdlib_malloc_size(v23);
      if (!v20)
        goto LABEL_46;
      v28 = result - v27;
      if (result - v27 == 0x8000000000000000 && v20 == -1)
        goto LABEL_47;
      v30 = v28 / v20;
      v23[2] = v51;
      v23[3] = 2 * (v28 / v20);
      v31 = (char *)v23 + v27;
      v32 = v52;
      v33 = v52[3] >> 1;
      v34 = v33 * v20;
      if (!v52[2])
      {
LABEL_33:
        v50 = (uint64_t)&v31[v34];
        v51 = (v30 & 0x7FFFFFFFFFFFFFFFLL) - v33;
        result = swift_release();
        v22 = v51;
        goto LABEL_34;
      }
      if (v23 < v52 || v31 >= (char *)v52 + v47 + v34)
      {
        v50 = v52[3] >> 1;
        v51 = (uint64_t)v31;
        v43 = v33 * v20;
        v44 = v28 / v20;
        swift_arrayInitWithTakeFrontToBack();
      }
      else
      {
        if (v23 == v52)
        {
LABEL_32:
          v32[2] = 0;
          goto LABEL_33;
        }
        v50 = v52[3] >> 1;
        v51 = (uint64_t)v31;
        v43 = v33 * v20;
        v44 = v28 / v20;
        swift_arrayInitWithTakeBackToFront();
      }
      v34 = v43;
      v30 = v44;
      v33 = v50;
      v31 = (char *)v51;
      goto LABEL_32;
    }
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
LABEL_36:
  v21 = v48;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v48, 1, 1, v7);
LABEL_37:
  swift_bridgeObjectRelease();
  v38 = v52;
  swift_bridgeObjectRelease();
  result = sub_235F1BF08(v21, &qword_256395468);
  v39 = v38[3];
  if (v39 < 2)
    return (uint64_t)v38;
  v40 = v39 >> 1;
  v35 = __OFSUB__(v40, v51);
  v41 = v40 - v51;
  if (!v35)
  {
    v38[2] = v41;
    return (uint64_t)v38;
  }
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
  return result;
}

char *sub_235F289CC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)sub_235F4CD50();
  __break(1u);
  return result;
}

uint64_t sub_235F28AB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD v15[4];
  _OWORD v16[2];
  _QWORD v17[4];

  v0 = sub_235F4C33C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v15 - v3;
  if (qword_256394A80 != -1)
    swift_once();
  if (qword_256398330)
  {
    v5 = (id)qword_256398330;
    v6 = (void *)sub_235F4CA74();
    v7 = objc_msgSend(v5, sel_objectForKey_, v6);

    if (v7)
    {
      sub_235F4CC3C();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v16, 0, sizeof(v16));
    }
    sub_235F1EBAC((uint64_t)v16, (uint64_t)v17, &qword_256395450);
    if (v17[3])
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v12 = v15[2];
        v13 = v15[3];
        sub_235F4C09C();
        swift_allocObject();
        sub_235F4C090();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256395430);
        sub_235F2F4C4(&qword_256395458, &qword_256395460, (uint64_t)&protocol conformance descriptor for AdaptiveVoiceShortcut, MEMORY[0x24BEE12D0]);
        sub_235F4C084();
        swift_release();
        sub_235F2F43C(v12, v13);

        return v17[0];
      }

    }
    else
    {

      sub_235F1BF08((uint64_t)v17, &qword_256395450);
    }
  }
  else
  {
    if (qword_256394AA0 != -1)
      swift_once();
    v8 = __swift_project_value_buffer(v0, (uint64_t)qword_256395488);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v8, v0);
    v9 = sub_235F4C324();
    v10 = sub_235F4CB88();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_235F17000, v9, v10, "Failed to retrieve shortcuts. Unable to find user defaults for AVS", v11, 2u);
      MEMORY[0x23B7E711C](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t _sSo8AVSStoreC22AdaptiveVoiceShortcutsE24shortcutsNamesDictionarySDyS2SGvgZ_0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  char v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v29;
  _QWORD *v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t result;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;

  v38 = type metadata accessor for AdaptiveVoiceShortcut();
  v0 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v2 = (char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = (_QWORD *)sub_235F26EC4(MEMORY[0x24BEE4AF8]);
  v4 = sub_235F28AB0();
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    return (uint64_t)v3;
  }
  v6 = *(unsigned __int8 *)(v0 + 80);
  v35 = v4;
  v7 = v4 + ((v6 + 32) & ~v6);
  v37 = *(_QWORD *)(v0 + 72);
  v36 = v2;
  while (1)
  {
    sub_235F25368(v7, (uint64_t)v2, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
    v9 = sub_235F4C1B0();
    v11 = v10;
    v12 = &v2[*(int *)(v38 + 20)];
    v13 = *((_QWORD *)v12 + 1);
    if (!v13)
    {
      swift_bridgeObjectRetain();
      v25 = sub_235F3D5F8(v9, v11);
      v27 = v26;
      swift_bridgeObjectRelease();
      if ((v27 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v40 = v3;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_235F283DC();
          v3 = v40;
        }
        swift_bridgeObjectRelease();
        sub_235F28208(v25, (uint64_t)v3);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    v39 = v5;
    v14 = *(_QWORD *)v12;
    swift_bridgeObjectRetain();
    v15 = swift_isUniquelyReferenced_nonNull_native();
    v40 = v3;
    v16 = v11;
    v18 = sub_235F3D5F8(v9, v11);
    v19 = v3[2];
    v20 = (v17 & 1) == 0;
    v21 = v19 + v20;
    if (__OFADD__(v19, v20))
      break;
    v22 = v17;
    if (v3[3] >= v21)
    {
      if ((v15 & 1) != 0)
      {
        v3 = v40;
        if ((v17 & 1) == 0)
          goto LABEL_18;
      }
      else
      {
        sub_235F283DC();
        v3 = v40;
        if ((v22 & 1) == 0)
          goto LABEL_18;
      }
    }
    else
    {
      sub_235F27EE4(v21, v15);
      v23 = sub_235F3D5F8(v9, v16);
      if ((v22 & 1) != (v24 & 1))
        goto LABEL_26;
      v18 = v23;
      v3 = v40;
      if ((v22 & 1) == 0)
      {
LABEL_18:
        v3[(v18 >> 6) + 8] |= 1 << v18;
        v29 = (uint64_t *)(v3[6] + 16 * v18);
        *v29 = v9;
        v29[1] = v16;
        v30 = (_QWORD *)(v3[7] + 16 * v18);
        *v30 = v14;
        v30[1] = v13;
        v31 = v3[2];
        v32 = __OFADD__(v31, 1);
        v33 = v31 + 1;
        if (v32)
          goto LABEL_25;
        v3[2] = v33;
        swift_bridgeObjectRetain();
        goto LABEL_4;
      }
    }
    v8 = (_QWORD *)(v3[7] + 16 * v18);
    swift_bridgeObjectRelease();
    *v8 = v14;
    v8[1] = v13;
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v2 = v36;
    v5 = v39;
LABEL_5:
    sub_235F1BD10((uint64_t)v2, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
    v7 += v37;
    if (!--v5)
      goto LABEL_23;
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_235F4CE28();
  __break(1u);
  return result;
}

uint64_t _sSo8AVSStoreC22AdaptiveVoiceShortcutsE9shortcutsSaySo0bC17ShortcutObjcClassCGvgZ_0()
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
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for AdaptiveVoiceShortcut();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BEE4AF8];
  v7 = sub_235F28AB0();
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    v9 = *(unsigned __int8 *)(v4 + 80);
    v20 = v7;
    v10 = v7 + ((v9 + 32) & ~v9);
    v11 = *(_QWORD *)(v4 + 72);
    do
    {
      sub_235F25368(v10, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
      v12 = objc_allocWithZone((Class)AdaptiveVoiceShortcutObjcClass);
      v13 = objc_msgSend(v12, sel_init, v20);
      swift_bridgeObjectRetain();
      v14 = (void *)sub_235F4CA74();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_setName_, v14);

      sub_235F4C1B0();
      v15 = (void *)sub_235F4CA74();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_setIdentifier_, v15);

      sub_235F2F548((uint64_t)&v6[*(int *)(v3 + 28)], (uint64_t)v2);
      v16 = type metadata accessor for AvailableShortcutAction();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v2, 1, v16) == 1)
      {
        sub_235F1BF08((uint64_t)v2, &qword_256394AC8);
      }
      else
      {
        swift_bridgeObjectRetain();
        sub_235F1BD10((uint64_t)v2, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
      }
      v17 = (void *)sub_235F4CA74();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_setAssociatedShortcutName_, v17);

      v18 = v13;
      MEMORY[0x23B7E6810]();
      if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_235F4CB04();
      sub_235F4CB1C();
      sub_235F4CAF8();

      sub_235F1BD10((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
      v10 += v11;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
    return v21;
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
}

uint64_t _sSo8AVSStoreC22AdaptiveVoiceShortcutsE29shortcutsFormattedIdentifiersSaySSGvgZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  int64_t v5;
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
  uint64_t v16;
  _QWORD v18[7];
  uint64_t v19;

  v0 = type metadata accessor for AdaptiveVoiceShortcut();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_235F28AB0();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v19 = MEMORY[0x24BEE4AF8];
    sub_235F25908(0, v5, 0);
    v6 = *(unsigned __int8 *)(v1 + 80);
    v18[0] = v4;
    v7 = v4 + ((v6 + 32) & ~v6);
    v8 = *(_QWORD *)(v1 + 72);
    do
    {
      sub_235F25368(v7, (uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
      v18[5] = sub_235F4C1B0();
      v18[6] = v9;
      v18[3] = 45;
      v18[4] = 0xE100000000000000;
      v18[1] = 0;
      v18[2] = 0xE000000000000000;
      sub_235F1EA80();
      sub_235F4CC24();
      swift_bridgeObjectRelease();
      v10 = sub_235F4CAA4();
      v12 = v11;
      swift_bridgeObjectRelease();
      sub_235F1BD10((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
      v13 = v19;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_235F25908(0, *(_QWORD *)(v13 + 16) + 1, 1);
        v13 = v19;
      }
      v15 = *(_QWORD *)(v13 + 16);
      v14 = *(_QWORD *)(v13 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_235F25908(v14 > 1, v15 + 1, 1);
        v13 = v19;
      }
      *(_QWORD *)(v13 + 16) = v15 + 1;
      v16 = v13 + 16 * v15;
      *(_QWORD *)(v16 + 32) = v10;
      *(_QWORD *)(v16 + 40) = v12;
      v7 += v8;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return v13;
}

unint64_t sub_235F29790()
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
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  id v37;
  id v38;
  NSObject *v39;
  void *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  _QWORD *v44;
  id v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD v49[2];
  uint64_t v50;
  char *v51;
  id v52;
  id v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  void *v59;
  uint64_t v60;
  char *v61;
  unint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v0 = sub_235F4C33C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v51 = (char *)v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_235F4C294();
  v60 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v61 = (char *)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v49 - v6;
  v8 = sub_235F4C150();
  v55 = *(_QWORD *)(v8 - 8);
  v56 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v54 = (char *)v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_235F4C09C();
  swift_allocObject();
  v57 = sub_235F4C090();
  if (qword_256394A90 != -1)
    swift_once();
  v64 = (id)qword_256395268;
  v65 = unk_256395270;
  swift_bridgeObjectRetain();
  sub_235F4CABC();
  v11 = v65;
  v53 = v64;
  v12 = (void *)sub_235F4CA74();
  v64 = 0;
  v52 = v10;
  v13 = objc_msgSend(v10, sel_contentsOfDirectoryAtPath_error_, v12, &v64);

  v14 = v64;
  if (!v13)
  {
    v33 = v64;
    swift_bridgeObjectRelease();
    v34 = sub_235F4C114();

    swift_willThrow();
    v21 = (void *)v34;
    v62 = MEMORY[0x24BEE4AF8];
LABEL_17:
    v35 = v51;
    if (qword_256394AA0 != -1)
      swift_once();
    v36 = __swift_project_value_buffer(v0, (uint64_t)qword_256395488);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v35, v36, v0);
    v37 = v21;
    v38 = v21;
    v39 = sub_235F4C324();
    v40 = v21;
    v41 = sub_235F4CB88();
    if (os_log_type_enabled(v39, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      v43 = swift_slowAlloc();
      v50 = v1;
      v44 = (_QWORD *)v43;
      *(_DWORD *)v42 = 138412290;
      v45 = v40;
      v46 = _swift_stdlib_bridgeErrorToNSError();
      v63 = v46;
      v35 = v51;
      sub_235F4CBF4();
      *v44 = v46;

      _os_log_impl(&dword_235F17000, v39, v41, "Failed to read directory: %@", v42, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256395408);
      swift_arrayDestroy();
      v47 = v44;
      v1 = v50;
      MEMORY[0x23B7E711C](v47, -1, -1);
      MEMORY[0x23B7E711C](v42, -1, -1);

      swift_release();
    }
    else
    {

      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v1 + 8))(v35, v0);
    return v62;
  }
  v15 = sub_235F4CAEC();
  v16 = v14;

  v17 = *(_QWORD *)(v15 + 16);
  v49[1] = v15;
  if (v17)
  {
    v58 = v7;
    v59 = 0;
    v50 = v1;
    v49[0] = v0;
    v18 = v15 + 40;
    v62 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      v64 = v53;
      v65 = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_235F4CABC();
      sub_235F4CABC();
      swift_bridgeObjectRelease();
      v19 = v54;
      sub_235F4C12C();
      v20 = v19;
      swift_bridgeObjectRelease();
      v21 = v59;
      v22 = sub_235F4C15C();
      if (v21)
        break;
      v24 = v22;
      v25 = v23;
      (*(void (**)(char *, uint64_t))(v55 + 8))(v20, v56);
      sub_235F1BE00(&qword_256395470, (uint64_t (*)(uint64_t))MEMORY[0x24BEC0CD8], MEMORY[0x24BEC0CF0]);
      v26 = v58;
      sub_235F4C084();
      (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v61, v26, v3);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v59 = 0;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        v62 = sub_235F27CC4(0, *(_QWORD *)(v62 + 16) + 1, 1, v62, &qword_2563953F0, (uint64_t (*)(_QWORD))MEMORY[0x24BEC0CD8]);
      v29 = *(_QWORD *)(v62 + 16);
      v28 = *(_QWORD *)(v62 + 24);
      if (v29 >= v28 >> 1)
        v62 = sub_235F27CC4(v28 > 1, v29 + 1, 1, v62, &qword_2563953F0, (uint64_t (*)(_QWORD))MEMORY[0x24BEC0CD8]);
      v18 += 16;
      v30 = v61;
      v31 = v62;
      *(_QWORD *)(v62 + 16) = v29 + 1;
      v32 = v60;
      (*(void (**)(unint64_t, char *, uint64_t))(v60 + 32))(v31+ ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80))+ *(_QWORD *)(v60 + 72) * v29, v30, v3);
      sub_235F2F43C(v24, v25);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v58, v3);
      if (!--v17)
        goto LABEL_15;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v20, v56);
    swift_bridgeObjectRelease();
    v0 = v49[0];
    v1 = v50;
    goto LABEL_17;
  }
  v62 = MEMORY[0x24BEE4AF8];
LABEL_15:
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v62;
}

uint64_t _sSo8AVSStoreC22AdaptiveVoiceShortcutsE28retriveDataForAllEnrollmentsSay0C7Actions018VASingleEnrollmentF0VGvgZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v0 = type metadata accessor for AdaptiveVoiceShortcut();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_235F28AB0();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v15 = MEMORY[0x24BEE4AF8];
    sub_235F25940(0, v5, 0);
    v6 = v4 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
    v7 = *(_QWORD *)(v1 + 72);
    do
    {
      sub_235F25368(v6, (uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
      sub_235F4C1B0();
      v8 = sub_235F29790();
      swift_bridgeObjectRelease();
      sub_235F1BD10((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
      v9 = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_235F25940(0, *(_QWORD *)(v9 + 16) + 1, 1);
        v9 = v15;
      }
      v11 = *(_QWORD *)(v9 + 16);
      v10 = *(_QWORD *)(v9 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_235F25940(v10 > 1, v11 + 1, 1);
        v9 = v15;
      }
      *(_QWORD *)(v9 + 16) = v11 + 1;
      *(_QWORD *)(v9 + 8 * v11 + 32) = v8;
      v6 += v7;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v9 = MEMORY[0x24BEE4AF8];
  }
  v12 = sub_235F28594(v9);
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_235F29FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AdaptiveVoiceShortcut();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F2A040(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_235F4CD50();
  __break(1u);
  return result;
}

uint64_t sub_235F2A158(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD v18[6];

  v2 = sub_235F4C33C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v18 - v5;
  sub_235F4C0C0();
  swift_allocObject();
  sub_235F4C0B4();
  v18[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395430);
  sub_235F2F4C4(&qword_256395438, &qword_256395440, (uint64_t)&protocol conformance descriptor for AdaptiveVoiceShortcut, MEMORY[0x24BEE12A0]);
  v7 = sub_235F4C0A8();
  v9 = v8;
  if (qword_256394A80 != -1)
    swift_once();
  if (qword_256398330)
  {
    v10 = (id)qword_256398330;
    v11 = (void *)sub_235F4C168();
    v12 = (void *)sub_235F4CA74();
    objc_msgSend(v10, sel_setObject_forKey_, v11, v12);

    sub_235F2F43C(v7, v9);
    return swift_release();
  }
  else
  {
    if (qword_256394AA0 != -1)
      swift_once();
    v14 = __swift_project_value_buffer(v2, (uint64_t)qword_256395488);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v14, v2);
    v15 = sub_235F4C324();
    v16 = sub_235F4CB88();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_235F17000, v15, v16, "Failed to save shortcuts. Unable to find user defaults for AVS", v17, 2u);
      MEMORY[0x23B7E711C](v17, -1, -1);
    }
    sub_235F2F43C(v7, v9);
    swift_release();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

uint64_t _sSo8AVSStoreC22AdaptiveVoiceShortcutsE09deleteAllD0yyF_0()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  NSObject *v18;
  void *v19;
  unsigned int v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char *v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  NSObject *v47;
  uint64_t v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60[3];
  id v61[4];

  v61[3] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = sub_235F4C33C();
  v1 = *(_QWORD *)(v0 - 8);
  v57 = v0;
  v58 = v1;
  v2 = MEMORY[0x24BDAC7A8](v0);
  v55 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v54 = (char *)&v52 - v5;
  MEMORY[0x24BDAC7A8](v4);
  v56 = (char *)&v52 - v6;
  v7 = sub_235F4C120();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395410);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_235F4C150();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  if (qword_256394A90 != -1)
    swift_once();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDCD7A0], v7);
  swift_bridgeObjectRetain();
  sub_235F4C144();
  v19 = (void *)sub_235F4C138();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  v61[0] = 0;
  v20 = -[NSObject removeItemAtURL:error:](v18, sel_removeItemAtURL_error_, v19, v61);

  v21 = v61[0];
  v22 = 0x256394000uLL;
  v23 = v57;
  v24 = v58;
  if (!v20)
  {
    v25 = v21;
    v26 = (void *)sub_235F4C114();

    swift_willThrow();
    if (qword_256394AA0 != -1)
      swift_once();
    v27 = __swift_project_value_buffer(v23, (uint64_t)qword_256395488);
    swift_beginAccess();
    v28 = v55;
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v55, v27, v23);
    v29 = v26;
    v30 = v26;
    v31 = sub_235F4C324();
    v32 = sub_235F4CB88();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = swift_slowAlloc();
      v34 = (_QWORD *)swift_slowAlloc();
      v53 = swift_slowAlloc();
      v60[0] = v53;
      *(_DWORD *)v33 = 136315394;
      v35 = qword_256395268;
      v36 = unk_256395270;
      swift_bridgeObjectRetain();
      v59 = sub_235F43930(v35, v36, v60);
      sub_235F4CBF4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2112;
      v37 = v26;
      v38 = _swift_stdlib_bridgeErrorToNSError();
      v59 = v38;
      v22 = 0x256394000;
      sub_235F4CBF4();
      *v34 = v38;
      v24 = v58;

      _os_log_impl(&dword_235F17000, v31, v32, "Failed to delete all shortcuts. Unable to delete commands directory: %s error: %@", (uint8_t *)v33, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256395408);
      swift_arrayDestroy();
      MEMORY[0x23B7E711C](v34, -1, -1);
      v39 = v53;
      swift_arrayDestroy();
      MEMORY[0x23B7E711C](v39, -1, -1);
      MEMORY[0x23B7E711C](v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v24 + 8))(v55, v23);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v24 + 8))(v28, v23);
    }
  }
  if (qword_256394A80 != -1)
    swift_once();
  v40 = v56;
  if (qword_256398330)
  {
    v41 = (id)qword_256398330;
    v42 = (void *)sub_235F4CA74();
    -[NSObject removeObjectForKey:](v41, sel_removeObjectForKey_, v42);

    if (*(_QWORD *)(v22 + 2720) != -1)
      swift_once();
    v43 = __swift_project_value_buffer(v23, (uint64_t)qword_256395488);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v40, v43, v23);
    v44 = sub_235F4C324();
    v45 = sub_235F4CBA0();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v46 = 0;
      _os_log_impl(&dword_235F17000, v44, v45, "Deleted all AVS shortcuts", v46, 2u);
      MEMORY[0x23B7E711C](v46, -1, -1);
    }

    v47 = v18;
    v18 = v41;
  }
  else
  {
    if (*(_QWORD *)(v22 + 2720) != -1)
      swift_once();
    v48 = __swift_project_value_buffer(v23, (uint64_t)qword_256395488);
    swift_beginAccess();
    v40 = v54;
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v54, v48, v23);
    v47 = sub_235F4C324();
    v49 = sub_235F4CB88();
    if (os_log_type_enabled(v47, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_235F17000, v47, v49, "Failed to delete all shortcuts. Unable to find user defaults for AVS", v50, 2u);
      MEMORY[0x23B7E711C](v50, -1, -1);
    }
  }

  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v40, v23);
}

uint64_t sub_235F2ACE4(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t result;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t (*v23)();
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)();
  void *v27;
  void *v28;
  unsigned __int8 v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v41 = a3;
  v40 = a2;
  v4 = type metadata accessor for AdaptiveVoiceShortcut();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v36 = (uint64_t)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v37 = (uint64_t)&v34 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v38 = (uint64_t)&v34 - v10;
  v11 = *a1;
  v12 = *(_QWORD *)(*a1 + 16);
  if (!v12)
    return 0;
  v39 = a1;
  v13 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = *(_QWORD *)(v9 + 72);
  swift_bridgeObjectRetain();
  v15 = 0;
  v35 = v13;
  while (1)
  {
    sub_235F4C1B0();
    v16 = (void *)sub_235F4CA74();
    swift_bridgeObjectRelease();
    v17 = (void *)sub_235F4CA74();
    v18 = objc_msgSend(v16, sel_isEqual_, v17);

    if (v18)
      break;
    ++v15;
    v13 += v14;
    if (v12 == v15)
    {
      swift_bridgeObjectRelease();
      return *(_QWORD *)(v11 + 16);
    }
  }
  result = swift_bridgeObjectRelease();
  if (!__OFADD__(v15, 1))
  {
    v20 = *(_QWORD *)(v11 + 16);
    if (v15 + 1 == v20)
      return v15;
    v21 = v14 + v13;
    v22 = v15 + 1;
    v23 = type metadata accessor for AdaptiveVoiceShortcut;
    while (v22 < v20)
    {
      v24 = v14;
      v25 = v38;
      sub_235F25368(v11 + v21, v38, (uint64_t (*)(_QWORD))v23);
      v26 = v23;
      sub_235F4C1B0();
      v27 = (void *)sub_235F4CA74();
      swift_bridgeObjectRelease();
      v28 = (void *)sub_235F4CA74();
      v29 = objc_msgSend(v27, sel_isEqual_, v28);

      v23 = v26;
      result = sub_235F1BD10(v25, (uint64_t (*)(_QWORD))v26);
      if ((v29 & 1) != 0)
      {
        v14 = v24;
      }
      else
      {
        v14 = v24;
        if (v22 != v15)
        {
          if ((v15 & 0x8000000000000000) != 0)
            goto LABEL_30;
          v30 = *v39;
          v31 = *(_QWORD *)(*v39 + 16);
          if (v15 >= v31)
            goto LABEL_31;
          result = sub_235F25368(v30 + v35 + v15 * v24, v37, (uint64_t (*)(_QWORD))v26);
          if (v22 >= v31)
            goto LABEL_32;
          sub_235F25368(v30 + v21, v36, (uint64_t (*)(_QWORD))v26);
          result = swift_isUniquelyReferenced_nonNull_native();
          *v39 = v30;
          if ((result & 1) == 0)
          {
            result = sub_235F3947C(v30);
            v30 = result;
            *v39 = result;
          }
          if (v15 >= *(_QWORD *)(v30 + 16))
            goto LABEL_33;
          result = sub_235F2F480(v36, v30 + v35 + v15 * v24);
          if (v22 >= *(_QWORD *)(*v39 + 16))
            goto LABEL_34;
          result = sub_235F2F480(v37, *v39 + v21);
          v23 = v26;
        }
        if (__OFADD__(v15++, 1))
          goto LABEL_29;
      }
      v33 = v22 + 1;
      if (__OFADD__(v22, 1))
        goto LABEL_28;
      v11 = *v39;
      v20 = *(_QWORD *)(*v39 + 16);
      ++v22;
      v21 += v14;
      if (v33 == v20)
        return v15;
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t _sSo8AVSStoreC22AdaptiveVoiceShortcutsE14deleteShortcut14withIdentifierySS_tF_0(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  _QWORD *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  unint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v43 = sub_235F4C33C();
  v45 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v44 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_235F4C120();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395410);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_235F4C150();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_235F28AB0();
  swift_bridgeObjectRetain();
  v46 = a1;
  v16 = (id)sub_235F2ACE4((unint64_t *)&v48, a1, a2);
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(v48 + 16);
  if (v17 < (uint64_t)v16)
  {
    __break(1u);
  }
  else
  {
    sub_235F3952C((uint64_t)v16, v17);
    v16 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    if (qword_256394A90 == -1)
      goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v50 = (id)qword_256395268;
  v51 = unk_256395270;
  swift_bridgeObjectRetain();
  v42 = a2;
  sub_235F4CABC();
  v18 = (uint64_t)v50;
  v19 = v51;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDCD7A0], v5);
  swift_bridgeObjectRetain();
  v41 = v18;
  sub_235F4C144();
  v20 = (void *)sub_235F4C138();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v50 = 0;
  LODWORD(v18) = objc_msgSend(v16, sel_removeItemAtURL_error_, v20, &v50);

  v21 = v50;
  if ((_DWORD)v18)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = v21;
    v40 = v16;
    v23 = (void *)sub_235F4C114();

    swift_willThrow();
    if (qword_256394AA0 != -1)
      swift_once();
    v24 = v43;
    v25 = __swift_project_value_buffer(v43, (uint64_t)qword_256395488);
    swift_beginAccess();
    v27 = v44;
    v26 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v44, v25, v24);
    v28 = v42;
    swift_bridgeObjectRetain();
    v29 = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v30 = v23;
    v31 = sub_235F4C324();
    v32 = sub_235F4CB88();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = swift_slowAlloc();
      v34 = (_QWORD *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      v49 = v39;
      *(_DWORD *)v33 = 136315650;
      swift_bridgeObjectRetain();
      v47 = sub_235F43930(v46, v28, &v49);
      sub_235F4CBF4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 12) = 2080;
      swift_bridgeObjectRetain();
      v47 = sub_235F43930(v41, v19, &v49);
      sub_235F4CBF4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 22) = 2112;
      v35 = v23;
      v36 = _swift_stdlib_bridgeErrorToNSError();
      v47 = v36;
      sub_235F4CBF4();
      *v34 = v36;

      _os_log_impl(&dword_235F17000, v31, v32, "Failed to delete shortcut with identifier: %s. Unable to delete commands directory: %s error: %@", (uint8_t *)v33, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256395408);
      swift_arrayDestroy();
      MEMORY[0x23B7E711C](v34, -1, -1);
      v37 = v39;
      swift_arrayDestroy();
      MEMORY[0x23B7E711C](v37, -1, -1);
      MEMORY[0x23B7E711C](v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v24);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v24);
    }
    v16 = v40;
  }
  sub_235F2A158(v48);

  return swift_bridgeObjectRelease();
}

void *_sSo8AVSStoreC22AdaptiveVoiceShortcutsE33saveShortcutEnrollmentDataToFiles10shortcutId_SSSgSS_Say0C7Actions08VASinglegH0VGtF_0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  __int128 v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  void *v22;
  char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  unsigned int v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  _QWORD *v40;
  id v41;
  void *v42;
  _QWORD v44[3];
  id v45;
  __int128 v46;
  char *v47;
  void (*v48)(char *, uint64_t, uint64_t);
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v4 = sub_235F4C33C();
  v5 = *(_QWORD *)(v4 - 8);
  v60 = v4;
  v61 = v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v58 = (char *)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v47 = (char *)v44 - v8;
  v52 = sub_235F4C1C8();
  v51 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v50 = (char *)v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_235F4C294();
  v55 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v59 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = (id)objc_opt_self();
  v56 = objc_msgSend(v45, sel_defaultManager);
  if (qword_256394A90 != -1)
    swift_once();
  v66 = qword_256395268;
  v67 = unk_256395270;
  swift_bridgeObjectRetain();
  sub_235F4CABC();
  v12 = v66;
  v13 = *(_QWORD *)(a3 + 16);
  if (!v13)
  {

    return (void *)v12;
  }
  v53 = v67;
  v54 = (void *)v66;
  v14 = a3 + ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80));
  v49 = *(_QWORD *)(v55 + 72);
  v48 = *(void (**)(char *, uint64_t, uint64_t))(v55 + 16);
  v44[1] = &v65;
  v44[0] = a3;
  swift_bridgeObjectRetain();
  *(_QWORD *)&v15 = 138412290;
  v46 = v15;
  v57 = v10;
  v16 = v59;
  do
  {
    v62 = v13;
    v48(v16, v14, v10);
    v64 = v54;
    v65 = v53;
    swift_bridgeObjectRetain();
    sub_235F4CABC();
    v23 = v50;
    sub_235F4C27C();
    sub_235F1BE00(&qword_256395420, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v24 = v52;
    sub_235F4CE10();
    sub_235F4CABC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v23, v24);
    sub_235F4CABC();
    v63 = 1;
    v25 = (void *)sub_235F4CA74();
    v26 = v56;
    LOBYTE(v23) = objc_msgSend(v56, sel_fileExistsAtPath_isDirectory_, v25, &v63);

    if ((v23 & 1) != 0)
      goto LABEL_9;
    v27 = (void *)sub_235F4CA74();
    v64 = 0;
    v28 = objc_msgSend(v26, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v27, 1, 0, &v64);

    if (v28)
    {
      v29 = v64;
LABEL_9:
      v16 = v59;
      v30 = v62;
      goto LABEL_16;
    }
    v31 = v64;
    v32 = (void *)sub_235F4C114();

    swift_willThrow();
    if (qword_256394AA0 != -1)
      swift_once();
    v33 = v60;
    v34 = __swift_project_value_buffer(v60, (uint64_t)qword_256395488);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v47, v34, v33);
    v35 = v32;
    v36 = v32;
    v37 = sub_235F4C324();
    v38 = sub_235F4CB88();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v39 = v46;
      v44[2] = v39 + 4;
      v41 = v32;
      v42 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v64 = v42;
      sub_235F4CBF4();
      *v40 = v42;

      _os_log_impl(&dword_235F17000, v37, v38, "Failed to create directory for shortcut: %@", v39, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256395408);
      swift_arrayDestroy();
      MEMORY[0x23B7E711C](v40, -1, -1);
      MEMORY[0x23B7E711C](v39, -1, -1);

    }
    else
    {

    }
    v16 = v59;
    v30 = v62;
    (*(void (**)(char *, uint64_t))(v61 + 8))(v47, v60);
LABEL_16:
    sub_235F4C0C0();
    swift_allocObject();
    sub_235F4C0B4();
    sub_235F1BE00(&qword_256395428, (uint64_t (*)(uint64_t))MEMORY[0x24BEC0CD8], MEMORY[0x24BEC0CE8]);
    v17 = sub_235F4C0A8();
    v19 = v18;
    v20 = objc_msgSend(v45, sel_defaultManager);
    v21 = (void *)sub_235F4CA74();
    swift_bridgeObjectRelease();
    v22 = (void *)sub_235F4C168();
    objc_msgSend(v20, sel_createFileAtPath_contents_attributes_, v21, v22, 0);
    sub_235F2F43C(v17, v19);
    swift_release();

    v10 = v57;
    (*(void (**)(char *, uint64_t))(v55 + 8))(v16, v57);
    v14 += v49;
    v13 = v30 - 1;
  }
  while (v13);

  swift_bridgeObjectRelease();
  return v54;
}

uint64_t sub_235F2BE88(char *a1, char *a2, char *a3, char *a4, void *a5)
{
  uint64_t v5;
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
  void *v24;
  char *v25;
  void *v26;
  id v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  uint64_t v32;
  unsigned int (*v33)(char *, uint64_t, uint64_t);
  void *v34;
  id v35;
  char *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char v40;
  char *v41;
  char v42;
  void (*v43)(char *, uint64_t);
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  id v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, char *, uint64_t);
  char *v53;
  uint64_t v54;
  unsigned int (*v55)(char *, uint64_t, uint64_t);
  void *v56;
  id v57;
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  char v65;
  char *v66;
  char v67;
  void (*v68)(char *, uint64_t);
  char *v69;
  char *v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t result;
  _QWORD v74[2];
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  char *v87;
  char *v88;
  char *v89;

  v85 = a5;
  v86 = sub_235F4C1A4();
  v84 = *(_QWORD *)(v86 - 8);
  MEMORY[0x24BDAC7A8](v86);
  v83 = (char *)v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395418);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v76 = (char *)v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v78 = (char *)v74 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v77 = (char *)v74 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v79 = a3;
  v80 = (char *)v74 - v18;
  v19 = a2 - a1;
  v20 = a2 - a1 + 15;
  if (a2 - a1 >= 0)
    v20 = a2 - a1;
  v21 = v20 >> 4;
  v22 = a3 - a2;
  v23 = v22 / 16;
  v89 = a1;
  v88 = a4;
  v74[1] = v5;
  if (v20 >> 4 >= v22 / 16)
  {
    if (v22 >= -15)
    {
      if (a4 != a2 || &a2[16 * v23] <= a4)
        memmove(a4, a2, 16 * v23);
      v46 = &a4[16 * v23];
      v87 = v46;
      v89 = a2;
      if (v22 >= 16 && a1 < a2)
      {
        v79 -= 16;
        v47 = a2;
        v75 = a4;
        v81 = a1;
        do
        {
          v82 = a2;
          v77 = v46;
          v46 -= 16;
          v48 = (char *)*((_QWORD *)v47 - 1);
          v47 -= 16;
          swift_bridgeObjectRetain();
          v80 = v48;
          swift_bridgeObjectRetain();
          v24 = (void *)sub_235F4CA74();
          v49 = objc_msgSend(v85, sel_dateFromString_, v24);

          if (!v49)
            goto LABEL_53;
          v50 = v83;
          sub_235F4C18C();

          v51 = v84;
          v52 = *(void (**)(char *, char *, uint64_t))(v84 + 32);
          v53 = v78;
          v54 = v86;
          v52(v78, v50, v86);
          v24 = *(void **)(v51 + 56);
          ((void (*)(char *, _QWORD, uint64_t, uint64_t))v24)(v53, 0, 1, v54);
          v55 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48);
          if (v55(v53, 1, v54) == 1)
            goto LABEL_54;
          v56 = (void *)sub_235F4CA74();
          v57 = objc_msgSend(v85, sel_dateFromString_, v56);

          if (!v57)
            goto LABEL_55;
          v58 = v83;
          sub_235F4C18C();

          v59 = v76;
          v60 = v58;
          v61 = v86;
          v52(v76, v60, v86);
          ((void (*)(char *, _QWORD, uint64_t, uint64_t))v24)(v59, 0, 1, v61);
          if (v55(v59, 1, v61) == 1)
            goto LABEL_56;
          v62 = v78;
          v63 = v79;
          v64 = v79 + 16;
          v65 = sub_235F4C180();
          v66 = v59;
          v67 = v65;
          v68 = *(void (**)(char *, uint64_t))(v84 + 8);
          v68(v66, v61);
          v68(v62, v61);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v70 = v81;
          v69 = v82;
          if ((v67 & 1) != 0)
          {
            v71 = (unint64_t)v75;
            v46 = v77;
            if (v64 != v82 || v63 >= v82)
              *(_OWORD *)v63 = *(_OWORD *)v47;
            v89 = v47;
            if ((unint64_t)v46 <= v71)
              break;
          }
          else
          {
            v87 = v46;
            v72 = (unint64_t)v75;
            if (v64 < v77 || v63 >= v77 || v64 != v77)
              *(_OWORD *)v63 = *(_OWORD *)v46;
            v47 = v69;
            if ((unint64_t)v46 <= v72)
              break;
          }
          v79 -= 16;
          a2 = v47;
        }
        while (v47 > v70);
      }
LABEL_48:
      sub_235F44B1C((void **)&v89, (const void **)&v88, &v87);
      return 1;
    }
  }
  else if (v19 >= -15)
  {
    if (a4 != a1 || &a1[16 * v21] <= a4)
      memmove(a4, a1, 16 * v21);
    v78 = &a4[16 * v21];
    v87 = v78;
    if (v19 >= 16 && a2 < v79)
    {
      while (1)
      {
        v81 = a1;
        v82 = a2;
        v24 = (void *)*((_QWORD *)a2 + 1);
        v25 = a4;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v26 = (void *)sub_235F4CA74();
        v27 = objc_msgSend(v85, sel_dateFromString_, v26);

        if (!v27)
          break;
        v28 = v83;
        sub_235F4C18C();

        v29 = v84;
        v30 = *(void (**)(char *, char *, uint64_t))(v84 + 32);
        v31 = v80;
        v32 = v86;
        v30(v80, v28, v86);
        v23 = *(_QWORD *)(v29 + 56);
        ((void (*)(char *, _QWORD, uint64_t, uint64_t))v23)(v31, 0, 1, v32);
        v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
        if (v33(v31, 1, v32) == 1)
          goto LABEL_50;
        v34 = (void *)sub_235F4CA74();
        v35 = objc_msgSend(v85, sel_dateFromString_, v34);

        if (!v35)
          goto LABEL_51;
        a4 = v25;
        v36 = v83;
        sub_235F4C18C();

        v37 = v77;
        v38 = v86;
        v30(v77, v36, v86);
        ((void (*)(char *, _QWORD, uint64_t, uint64_t))v23)(v37, 0, 1, v38);
        if (v33(v37, 1, v38) == 1)
          goto LABEL_52;
        v39 = v80;
        v40 = sub_235F4C180();
        v41 = v37;
        v42 = v40;
        v43 = *(void (**)(char *, uint64_t))(v84 + 8);
        v43(v41, v38);
        v43(v39, v38);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v42 & 1) != 0)
        {
          v44 = v81;
          v45 = v82 + 16;
          if (v81 < v82 || v81 >= v45 || v81 != v82)
            *(_OWORD *)v81 = *(_OWORD *)v82;
        }
        else
        {
          v44 = v81;
          v45 = v82;
          if (v81 != a4)
            *(_OWORD *)v81 = *(_OWORD *)a4;
          a4 += 16;
          v88 = a4;
        }
        a1 = v44 + 16;
        v89 = a1;
        if (a4 < v78)
        {
          a2 = v45;
          if (v45 < v79)
            continue;
        }
        goto LABEL_48;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v84 + 56))(v80, 1, 1, v86);
LABEL_50:
      __break(1u);
LABEL_51:
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v23)(v77, 1, 1, v86);
LABEL_52:
      __break(1u);
LABEL_53:
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v84 + 56))(v78, 1, 1, v86);
LABEL_54:
      __break(1u);
LABEL_55:
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v24)(v76, 1, 1, v86);
LABEL_56:
      __break(1u);
      goto LABEL_57;
    }
    goto LABEL_48;
  }
LABEL_57:

  result = sub_235F4CD50();
  __break(1u);
  return result;
}

uint64_t sub_235F2C5C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void (*v19)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v20;
  void *v21;
  id v22;
  char *v23;
  void (*v24)(char *, char *, uint64_t);
  char *v25;
  char *v26;
  uint64_t v27;
  _QWORD *v28;
  unsigned int (*v29)(char *, uint64_t, uint64_t);
  void *v30;
  id v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v49;
  char *v50;
  char *v51;
  id v52;
  uint64_t v53;

  v52 = a5;
  v42 = a1;
  v8 = sub_235F4C1A4();
  v9 = *(_QWORD **)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v51 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395418);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v12);
  v50 = (char *)&v40 - v16;
  v41 = a2;
  if (a3 != a2)
  {
    v17 = *a4;
    v44 = v14;
    v45 = v17;
    v18 = (_QWORD *)(v17 + 16 * a3);
    v49 = v8;
LABEL_5:
    v19 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v45 + 16 * a3 + 8);
    v46 = a3;
    v47 = v42;
    v43 = v18;
    while (1)
    {
      v20 = *(v18 - 1);
      swift_bridgeObjectRetain();
      v53 = v20;
      swift_bridgeObjectRetain();
      v21 = (void *)sub_235F4CA74();
      v22 = objc_msgSend(v52, sel_dateFromString_, v21);

      if (!v22)
        break;
      v48 = v19;
      v23 = v51;
      sub_235F4C18C();

      v24 = (void (*)(char *, char *, uint64_t))v9[4];
      v25 = v50;
      v26 = v23;
      v27 = v49;
      v24(v50, v26, v49);
      v19 = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD))v9[7];
      v19(v25, 0, 1, v27);
      v28 = v9;
      v29 = (unsigned int (*)(char *, uint64_t, uint64_t))v9[6];
      if (v29(v25, 1, v27) == 1)
        goto LABEL_15;
      v30 = (void *)sub_235F4CA74();
      v31 = objc_msgSend(v52, sel_dateFromString_, v30);

      if (!v31)
        goto LABEL_16;
      v32 = v51;
      sub_235F4C18C();

      v33 = v44;
      v34 = v49;
      v24(v44, v32, v49);
      v19(v33, 0, 1, v34);
      result = ((uint64_t (*)(char *, uint64_t, uint64_t))v29)(v33, 1, v34);
      if ((_DWORD)result == 1)
        goto LABEL_17;
      v35 = v50;
      v36 = sub_235F4C180();
      v9 = v28;
      v37 = (void (*)(char *, uint64_t))v28[1];
      v37(v33, v34);
      v37(v35, v34);
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v38 = v46;
      if ((v36 & 1) != 0)
      {
        if (!v45)
          goto LABEL_18;
        v39 = *v18;
        v19 = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD))v18[1];
        *(_OWORD *)v18 = *((_OWORD *)v18 - 1);
        *(v18 - 1) = v19;
        *(v18 - 2) = v39;
        v18 -= 2;
        if (v38 != ++v47)
          continue;
      }
      a3 = v38 + 1;
      v18 = v43 + 2;
      if (a3 == v41)
        return result;
      goto LABEL_5;
    }
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v9[7])(v50, 1, 1, v49);
LABEL_15:
    __break(1u);
LABEL_16:
    result = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v19)(v44, 1, 1, v49);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
  }
  return result;
}

void sub_235F2C904(uint64_t a1, void *a2)
{
  char *v2;
  char *v3;
  unint64_t v6;
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void *v35;
  id v36;
  char *v37;
  uint64_t v38;
  uint64_t *v39;
  char *v40;
  unsigned int (*v41)(uint64_t *, uint64_t, char *);
  void *v42;
  id v43;
  char *v44;
  char *v45;
  uint64_t v46;
  unsigned int (*v47)(uint64_t *, uint64_t, char *);
  unint64_t v48;
  id v49;
  char *v50;
  char *v51;
  id v52;
  char *v53;
  int v54;
  char *v55;
  int v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  id v68;
  char *v69;
  char *v70;
  uint64_t v71;
  char *v72;
  unsigned int (*v73)(char *, uint64_t, char *);
  id v74;
  char *v75;
  char *v76;
  char v77;
  uint64_t v78;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v80;
  unint64_t v81;
  char *v82;
  char *v83;
  char *v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  BOOL v96;
  unint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  BOOL v106;
  uint64_t v107;
  char v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  BOOL v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  char *v127;
  char *v128;
  char *v129;
  char *v130;
  char *v131;
  char *v132;
  unint64_t v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  char *v139;
  char *v140;
  char *v141;
  unint64_t v142;
  char *v143;
  char *v144;
  uint64_t v145;
  char **v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  char *v150;
  uint64_t v151;
  uint64_t *v152;
  void (*v153)(char *, uint64_t);
  char *v154;
  char *v155;
  uint64_t v156;
  char *v157;
  char *v158;
  char *v159;
  char *v160;
  char *v161;
  uint64_t v162;
  char *v163;
  char *v164;
  char *v165;
  char *v166;
  uint64_t v167;
  char *v168;
  char *v169;
  char *v170;

  v3 = v2;
  v6 = sub_235F4C1A4();
  v167 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v169 = (char *)&v145 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395418);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v145 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v166 = (char *)&v145 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v154 = (char *)&v145 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v158 = (char *)&v145 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v145 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v152 = (uint64_t *)((char *)&v145 - v21);
  v22 = *(_QWORD *)(a1 + 8);
  v23 = a2;
  v24 = sub_235F4CE04();
  if (v24 >= v22)
  {
    if (v22 < 0)
      goto LABEL_148;
    if (v22)
    {
      v28 = v23;
      sub_235F2C5C0(0, v22, 1, (uint64_t *)a1, v28);

    }
    else
    {

    }
    goto LABEL_125;
  }
  if (v22 >= 0)
    v25 = v22;
  else
    v25 = v22 + 1;
  if (v22 < -1)
    goto LABEL_168;
  v170 = v23;
  v156 = v22;
  v151 = v24;
  v160 = v2;
  v146 = (char **)a1;
  if (v22 < 2)
  {
    v159 = (char *)(MEMORY[0x24BEE4AF8] + 32);
    v148 = MEMORY[0x24BEE4AF8];
    if (v22 == 1)
      goto LABEL_12;
    v31 = (char *)MEMORY[0x24BEE4AF8];
    v6 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_112:
    if (v6 >= 2)
    {
      v132 = *v146;
      v168 = *v146;
      do
      {
        v133 = v6 - 2;
        if (v6 < 2)
          goto LABEL_143;
        if (!v132)
          goto LABEL_163;
        v3 = v31;
        v134 = v31 + 32;
        v135 = *(_QWORD *)&v31[16 * v133 + 32];
        v136 = *(_QWORD *)&v31[16 * v6 + 24];
        v137 = *(_QWORD *)&v134[16 * v6 - 16];
        v169 = &v132[16 * v135];
        a1 = (uint64_t)&v132[16 * v137];
        v23 = &v132[16 * v136];
        v138 = v170;
        v139 = v160;
        sub_235F2BE88(v169, (char *)a1, v23, v159, v138);
        v160 = v139;
        if (v139)
          goto LABEL_109;

        if (v136 < v135)
          goto LABEL_144;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v3 = sub_235F44CD0((uint64_t)v3);
        v23 = v170;
        if (v133 >= *((_QWORD *)v3 + 2))
          goto LABEL_145;
        v140 = v3 + 32;
        v141 = &v3[16 * v133 + 32];
        *(_QWORD *)v141 = v135;
        *((_QWORD *)v141 + 1) = v136;
        v142 = *((_QWORD *)v3 + 2);
        if (v6 > v142)
          goto LABEL_146;
        v31 = v3;
        v3 = (char *)(v142 - 1);
        memmove(&v140[16 * v6 - 16], &v140[16 * v6], 16 * (v142 - v6));
        *((_QWORD *)v31 + 2) = v142 - 1;
        v6 = v142 - 1;
        v132 = v168;
      }
      while (v142 > 2);
    }
    swift_bridgeObjectRelease();
LABEL_124:
    *(_QWORD *)(v148 + 16) = 0;

    swift_bridgeObjectRelease();
LABEL_125:

    return;
  }
  v26 = v25 >> 1;
  v27 = sub_235F4CB10();
  *(_QWORD *)(v27 + 16) = v26;
  v148 = v27;
  v159 = (char *)(v27 + 32);
LABEL_12:
  v29 = 0;
  v30 = *(_QWORD *)a1;
  v147 = *(_QWORD *)a1 + 24;
  v31 = (char *)MEMORY[0x24BEE4AF8];
  v168 = (char *)v6;
  v161 = v11;
  v162 = v30;
  v32 = v156;
  v149 = v20;
  while (1)
  {
    v33 = v29;
    v34 = (uint64_t)(v29 + 1);
    v155 = v29;
    if ((uint64_t)(v29 + 1) >= v32)
    {
      v58 = v151;
    }
    else
    {
      v150 = v31;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v35 = (void *)sub_235F4CA74();
      v36 = objc_msgSend(v23, sel_dateFromString_, v35);

      if (!v36)
        goto LABEL_164;
      v37 = v169;
      sub_235F4C18C();

      v38 = v167;
      v39 = v152;
      v40 = v37;
      v3 = v168;
      v164 = *(char **)(v167 + 32);
      ((void (*)(uint64_t *, char *, char *))v164)(v152, v40, v168);
      v165 = *(char **)(v38 + 56);
      ((void (*)(uint64_t *, _QWORD, uint64_t, char *))v165)(v39, 0, 1, v3);
      v41 = *(unsigned int (**)(uint64_t *, uint64_t, char *))(v38 + 48);
      if (v41(v39, 1, v3) == 1)
        goto LABEL_165;
      v42 = (void *)sub_235F4CA74();
      v43 = objc_msgSend(v23, sel_dateFromString_, v42);

      if (!v43)
        goto LABEL_166;
      v44 = v169;
      sub_235F4C18C();

      v45 = v149;
      ((void (*)(char *, char *, char *))v164)(v149, v44, v3);
      ((void (*)(char *, _QWORD, uint64_t, char *))v165)(v45, 0, 1, v3);
      if (v41((uint64_t *)v45, 1, v3) == 1)
        goto LABEL_167;
      a1 = (uint64_t)v152;
      LODWORD(v157) = sub_235F4C180();
      v6 = *(_QWORD *)(v167 + 8);
      ((void (*)(char *, char *))v6)(v45, v3);
      v153 = (void (*)(char *, uint64_t))v6;
      ((void (*)(uint64_t, char *))v6)(a1, v3);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v34 = (uint64_t)(v33 + 2);
      if ((uint64_t)(v33 + 2) < v156)
      {
        v46 = v147 + 16 * (_QWORD)v33;
        while (1)
        {
          v163 = (char *)v34;
          v47 = v41;
          v48 = *(_QWORD *)(v46 + 16);
          v46 += 16;
          v6 = v48;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v3 = (char *)sub_235F4CA74();
          v49 = objc_msgSend(v23, sel_dateFromString_, v3);

          if (!v49)
            goto LABEL_158;
          v3 = v169;
          sub_235F4C18C();

          v50 = v158;
          a1 = (uint64_t)v168;
          ((void (*)(char *, char *, char *))v164)(v158, v3, v168);
          ((void (*)(char *, _QWORD, uint64_t, uint64_t))v165)(v50, 0, 1, a1);
          v51 = v50;
          v41 = v47;
          if (v47((uint64_t *)v51, 1, (char *)a1) == 1)
            goto LABEL_159;
          v3 = (char *)sub_235F4CA74();
          v52 = objc_msgSend(v23, sel_dateFromString_, v3);

          if (!v52)
            goto LABEL_160;
          v3 = v169;
          sub_235F4C18C();

          v53 = v154;
          ((void (*)(char *, char *, uint64_t))v164)(v154, v3, a1);
          ((void (*)(char *, _QWORD, uint64_t, uint64_t))v165)(v53, 0, 1, a1);
          if (v47((uint64_t *)v53, 1, (char *)a1) == 1)
            goto LABEL_161;
          v3 = v158;
          v54 = sub_235F4C180();
          v55 = v53;
          v56 = v54;
          v57 = v153;
          v153(v55, a1);
          v57(v3, a1);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (((v157 ^ v56) & 1) != 0)
            break;
          v34 = (uint64_t)(v163 + 1);
          if ((char *)v156 == v163 + 1)
          {
            v34 = v156;
            goto LABEL_31;
          }
        }
        v34 = (uint64_t)v163;
LABEL_31:
        v33 = v155;
      }
      v31 = v150;
      v58 = v151;
      v30 = v162;
      if ((v157 & 1) != 0)
      {
        if (v34 < (uint64_t)v33)
          goto LABEL_149;
        if ((uint64_t)v33 < v34)
        {
          v59 = 16 * v34;
          v60 = 16 * (_QWORD)v33;
          v61 = v34;
          v62 = v33;
          do
          {
            if (v62 != (char *)--v61)
            {
              if (!v30)
                goto LABEL_162;
              v63 = v30 + v59;
              v64 = *(_QWORD *)(v30 + v60);
              v65 = *(_QWORD *)(v30 + v60 + 8);
              *(_OWORD *)(v30 + v60) = *(_OWORD *)(v30 + v59 - 16);
              *(_QWORD *)(v63 - 16) = v64;
              *(_QWORD *)(v63 - 8) = v65;
            }
            ++v62;
            v59 -= 16;
            v60 += 16;
          }
          while ((uint64_t)v62 < v61);
        }
      }
    }
    if (v34 < v156)
    {
      if (__OFSUB__(v34, v33))
        goto LABEL_147;
      if (v34 - (uint64_t)v33 < v58)
        break;
    }
LABEL_61:
    if (v34 < (uint64_t)v33)
      goto LABEL_142;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v163 = (char *)v34;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v31 = sub_235F44A24(0, *((_QWORD *)v31 + 2) + 1, 1, v31);
    v81 = *((_QWORD *)v31 + 2);
    v80 = *((_QWORD *)v31 + 3);
    v6 = v81 + 1;
    v30 = v162;
    if (v81 >= v80 >> 1)
    {
      v131 = sub_235F44A24((char *)(v80 > 1), v81 + 1, 1, v31);
      v30 = v162;
      v31 = v131;
    }
    *((_QWORD *)v31 + 2) = v6;
    v82 = v31 + 32;
    v83 = &v31[16 * v81 + 32];
    v84 = v163;
    *(_QWORD *)v83 = v33;
    *((_QWORD *)v83 + 1) = v84;
    if (v81)
    {
      v157 = v31 + 32;
      while (1)
      {
        v85 = v6 - 1;
        if (v6 >= 4)
        {
          v90 = &v82[16 * v6];
          v91 = *((_QWORD *)v90 - 8);
          v92 = *((_QWORD *)v90 - 7);
          v96 = __OFSUB__(v92, v91);
          v93 = v92 - v91;
          if (v96)
            goto LABEL_131;
          v95 = *((_QWORD *)v90 - 6);
          v94 = *((_QWORD *)v90 - 5);
          v96 = __OFSUB__(v94, v95);
          v88 = v94 - v95;
          v89 = v96;
          if (v96)
            goto LABEL_132;
          v97 = v6 - 2;
          v98 = &v82[16 * v6 - 32];
          v100 = *(_QWORD *)v98;
          v99 = *((_QWORD *)v98 + 1);
          v96 = __OFSUB__(v99, v100);
          v101 = v99 - v100;
          if (v96)
            goto LABEL_134;
          v96 = __OFADD__(v88, v101);
          v102 = v88 + v101;
          if (v96)
            goto LABEL_137;
          if (v102 >= v93)
          {
            v120 = &v82[16 * v85];
            v122 = *(_QWORD *)v120;
            v121 = *((_QWORD *)v120 + 1);
            v96 = __OFSUB__(v121, v122);
            v123 = v121 - v122;
            if (v96)
              goto LABEL_141;
            v113 = v88 < v123;
            goto LABEL_99;
          }
        }
        else
        {
          if (v6 != 3)
          {
            v114 = *((_QWORD *)v31 + 4);
            v115 = *((_QWORD *)v31 + 5);
            v96 = __OFSUB__(v115, v114);
            v107 = v115 - v114;
            v108 = v96;
            goto LABEL_93;
          }
          v87 = *((_QWORD *)v31 + 4);
          v86 = *((_QWORD *)v31 + 5);
          v96 = __OFSUB__(v86, v87);
          v88 = v86 - v87;
          v89 = v96;
        }
        if ((v89 & 1) != 0)
          goto LABEL_133;
        v97 = v6 - 2;
        v103 = &v82[16 * v6 - 32];
        v105 = *(_QWORD *)v103;
        v104 = *((_QWORD *)v103 + 1);
        v106 = __OFSUB__(v104, v105);
        v107 = v104 - v105;
        v108 = v106;
        if (v106)
          goto LABEL_136;
        v109 = &v82[16 * v85];
        v111 = *(_QWORD *)v109;
        v110 = *((_QWORD *)v109 + 1);
        v96 = __OFSUB__(v110, v111);
        v112 = v110 - v111;
        if (v96)
          goto LABEL_139;
        if (__OFADD__(v107, v112))
          goto LABEL_140;
        if (v107 + v112 >= v88)
        {
          v113 = v88 < v112;
LABEL_99:
          if (v113)
            v85 = v97;
          goto LABEL_101;
        }
LABEL_93:
        if ((v108 & 1) != 0)
          goto LABEL_135;
        v116 = &v82[16 * v85];
        v118 = *(_QWORD *)v116;
        v117 = *((_QWORD *)v116 + 1);
        v96 = __OFSUB__(v117, v118);
        v119 = v117 - v118;
        if (v96)
          goto LABEL_138;
        if (v119 < v107)
          goto LABEL_14;
LABEL_101:
        a1 = v85 - 1;
        if (v85 - 1 >= v6)
        {
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
          goto LABEL_151;
        }
        if (!v30)
          goto LABEL_157;
        v23 = &v82[16 * a1];
        v124 = *(_QWORD *)v23;
        v3 = (char *)v85;
        v125 = &v82[16 * v85];
        v126 = *((_QWORD *)v125 + 1);
        v127 = (char *)(v30 + 16 * *(_QWORD *)v23);
        v164 = (char *)(v30 + 16 * *(_QWORD *)v125);
        v165 = v127;
        v128 = (char *)(v30 + 16 * v126);
        v6 = v170;
        v129 = v160;
        sub_235F2BE88(v165, v164, v128, v159, (void *)v6);
        v160 = v129;
        if (v129)
        {
LABEL_109:
          swift_bridgeObjectRelease();
          v23 = v170;

          goto LABEL_124;
        }

        if (v126 < v124)
          goto LABEL_128;
        if ((unint64_t)v3 > *((_QWORD *)v31 + 2))
          goto LABEL_129;
        v130 = v3;
        *(_QWORD *)v23 = v124;
        v82 = v157;
        *(_QWORD *)&v157[16 * a1 + 8] = v126;
        v3 = (char *)*((_QWORD *)v31 + 2);
        if (v130 >= v3)
          goto LABEL_130;
        v6 = (unint64_t)(v3 - 1);
        memmove(v125, v125 + 16, 16 * (v3 - 1 - v130));
        *((_QWORD *)v31 + 2) = v3 - 1;
        v23 = v170;
        v30 = v162;
        if ((unint64_t)v3 <= 2)
          goto LABEL_14;
      }
    }
    v6 = 1;
LABEL_14:
    v32 = v156;
    v29 = v163;
    if ((uint64_t)v163 >= v156)
      goto LABEL_112;
  }
  v66 = &v33[v58];
  if (__OFADD__(v33, v58))
    goto LABEL_150;
  if ((uint64_t)v66 >= v156)
    v66 = (char *)v156;
  if ((uint64_t)v66 >= (uint64_t)v33)
  {
    if ((char *)v34 != v66)
    {
      v150 = v31;
      a1 = v30 + 16 * v34;
      v153 = (void (*)(char *, uint64_t))v66;
      do
      {
        v3 = *(char **)(v30 + 16 * v34 + 8);
        v157 = (char *)a1;
        v163 = (char *)v34;
        while (1)
        {
          v164 = v33;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v165 = v3;
          v3 = (char *)sub_235F4CA74();
          v68 = objc_msgSend(v23, sel_dateFromString_, v3);

          if (!v68)
            goto LABEL_154;
          v69 = v169;
          sub_235F4C18C();

          v70 = v166;
          v71 = v167;
          v23 = *(char **)(v167 + 32);
          v72 = v69;
          v3 = v168;
          ((void (*)(char *, char *, char *))v23)(v166, v72, v168);
          v6 = *(_QWORD *)(v71 + 56);
          ((void (*)(char *, _QWORD, uint64_t, char *))v6)(v70, 0, 1, v3);
          v73 = *(unsigned int (**)(char *, uint64_t, char *))(v71 + 48);
          if (v73(v70, 1, v3) == 1)
            goto LABEL_155;
          v3 = (char *)sub_235F4CA74();
          v74 = objc_msgSend(v170, sel_dateFromString_, v3);

          if (!v74)
            goto LABEL_152;
          v3 = v169;
          sub_235F4C18C();

          v75 = v161;
          v76 = v168;
          ((void (*)(char *, char *, char *))v23)(v161, v3, v168);
          ((void (*)(char *, _QWORD, uint64_t, char *))v6)(v75, 0, 1, v76);
          v23 = v76;
          if (v73(v75, 1, v76) == 1)
            goto LABEL_153;
          v6 = (unint64_t)v166;
          v77 = sub_235F4C180();
          v3 = *(char **)(v167 + 8);
          ((void (*)(char *, char *))v3)(v75, v23);
          ((void (*)(unint64_t, char *))v3)(v6, v23);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v23 = v170;
          if ((v77 & 1) == 0)
            break;
          v30 = v162;
          v67 = v163;
          if (!v162)
            goto LABEL_156;
          v78 = *(_QWORD *)a1;
          v3 = *(char **)(a1 + 8);
          *(_OWORD *)a1 = *(_OWORD *)(a1 - 16);
          *(_QWORD *)(a1 - 8) = v3;
          *(_QWORD *)(a1 - 16) = v78;
          a1 -= 16;
          v33 = v164 + 1;
          if (v67 == v164 + 1)
            goto LABEL_50;
        }
        v30 = v162;
        v67 = v163;
LABEL_50:
        v34 = (uint64_t)(v67 + 1);
        a1 = (uint64_t)(v157 + 16);
        v33 = v155;
      }
      while ((void (*)(char *, uint64_t))v34 != v153);
      v34 = (uint64_t)v153;
      v31 = v150;
    }
    goto LABEL_61;
  }
LABEL_151:
  __break(1u);
LABEL_152:
  ((void (*)(char *, uint64_t, uint64_t, char *))v6)(v161, 1, 1, v168);
LABEL_153:
  __break(1u);
LABEL_154:
  (*(void (**)(char *, uint64_t, uint64_t, char *))(v167 + 56))(v166, 1, 1, v168);
LABEL_155:
  __break(1u);
LABEL_156:

  __break(1u);
LABEL_157:
  v143 = v170;

  __break(1u);
LABEL_158:
  ((void (*)(char *, uint64_t, uint64_t, char *))v165)(v158, 1, 1, v168);
LABEL_159:
  __break(1u);
LABEL_160:
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v165)(v154, 1, 1, a1);
LABEL_161:
  __break(1u);
LABEL_162:

  __break(1u);
LABEL_163:
  v144 = v170;

  __break(1u);
LABEL_164:
  (*(void (**)(uint64_t *, uint64_t, uint64_t, char *))(v167 + 56))(v152, 1, 1, v168);
LABEL_165:
  __break(1u);
LABEL_166:
  ((void (*)(char *, uint64_t, uint64_t, char *))v165)(v149, 1, 1, v3);
LABEL_167:
  __break(1u);
LABEL_168:

  sub_235F4CD14();
  __break(1u);
}

void sub_235F2D758(uint64_t *a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[2];

  v3 = *a1;
  v4 = a2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_235F44D9C(v3);
  v5 = *(_QWORD *)(v3 + 16);
  v7[0] = v3 + 32;
  v7[1] = v5;
  v6 = v4;
  sub_235F2C904((uint64_t)v7, v6);

  *a1 = v3;
}

void sub_235F2D7EC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  _QWORD *v39;
  id v40;
  uint64_t v41;
  _QWORD *v42;
  id v43;
  _QWORD *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  void *v50;
  unsigned int v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  id v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  _QWORD *v61;
  id v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  unint64_t v78;
  _QWORD *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;

  v76 = a1;
  v82 = *MEMORY[0x24BDAC8D0];
  v1 = sub_235F4C33C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v64 - v6;
  v8 = sub_235F4C120();
  v75 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395410);
  MEMORY[0x24BDAC7A8](v11);
  v73 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = sub_235F4C150();
  v72 = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v71 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  if (qword_256394A98 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v15 = (void *)sub_235F4CA74();
  swift_bridgeObjectRelease();
  v80 = 0;
  v16 = objc_msgSend(v14, sel_contentsOfDirectoryAtPath_error_, v15, &v80);

  v17 = v80;
  if (v16)
  {
    v18 = sub_235F4CAEC();
    v19 = v17;

    v20 = *(_QWORD *)(v18 + 16);
    if (v20 < 0x1F5)
    {
      swift_bridgeObjectRelease();

    }
    else
    {
      v64 = v10;
      v65 = v8;
      v66 = v5;
      v69 = v2;
      v70 = v14;
      v68 = v1;
      v79 = (_QWORD *)MEMORY[0x24BEE4AF8];
      sub_235F25908(0, v20, 0);
      v21 = v79;
      sub_235F1EA80();
      v67 = v18;
      v22 = (uint64_t *)(v18 + 40);
      do
      {
        v23 = *v22;
        v80 = (id)*(v22 - 1);
        v81 = v23;
        v77 = 46;
        v78 = 0xE100000000000000;
        swift_bridgeObjectRetain();
        v24 = (_QWORD *)sub_235F4CC0C();
        if (v24[2])
        {
          v26 = v24[4];
          v25 = v24[5];
          swift_bridgeObjectRetain();
        }
        else
        {
          v26 = 0;
          v25 = 0xE000000000000000;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v79 = v21;
        v28 = v21[2];
        v27 = v21[3];
        if (v28 >= v27 >> 1)
        {
          sub_235F25908(v27 > 1, v28 + 1, 1);
          v21 = v79;
        }
        v22 += 2;
        v21[2] = v28 + 1;
        v29 = &v21[2 * v28];
        v29[4] = v26;
        v29[5] = v25;
        --v20;
      }
      while (v20);
      swift_bridgeObjectRelease();
      v80 = v21;
      v43 = v76;
      swift_bridgeObjectRetain();
      sub_235F2D758((uint64_t *)&v80, v43);
      swift_bridgeObjectRelease();

      v44 = v80;
      v80 = (id)qword_256395278;
      v81 = unk_256395280;
      v45 = v68;
      v46 = v70;
      if (v44[2])
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_release();
        sub_235F4CABC();
        swift_bridgeObjectRelease();
        sub_235F4CABC();
        v47 = v72;
        v48 = v74;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v72 + 56))(v73, 1, 1, v74);
        (*(void (**)(char *, _QWORD, uint64_t))(v75 + 104))(v64, *MEMORY[0x24BDCD7A0], v65);
        v49 = v71;
        sub_235F4C144();
        v50 = (void *)sub_235F4C138();
        (*(void (**)(char *, uint64_t))(v47 + 8))(v49, v48);
        v80 = 0;
        v51 = objc_msgSend(v46, sel_removeItemAtURL_error_, v50, &v80);

        v52 = v80;
        if (v51)
        {

        }
        else
        {
          v53 = v52;
          v54 = (void *)sub_235F4C114();

          swift_willThrow();
          if (qword_256394AA0 != -1)
            swift_once();
          v55 = __swift_project_value_buffer(v45, (uint64_t)qword_256395488);
          swift_beginAccess();
          (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v66, v55, v45);
          v56 = v54;
          v57 = v54;
          v58 = sub_235F4C324();
          v59 = sub_235F4CB88();
          if (os_log_type_enabled(v58, v59))
          {
            v60 = (uint8_t *)swift_slowAlloc();
            v61 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v60 = 138412290;
            v62 = v54;
            v63 = _swift_stdlib_bridgeErrorToNSError();
            v77 = v63;
            sub_235F4CBF4();
            *v61 = v63;

            _os_log_impl(&dword_235F17000, v58, v59, "Failed to delete old file error: %@", v60, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_256395408);
            swift_arrayDestroy();
            MEMORY[0x23B7E711C](v61, -1, -1);
            MEMORY[0x23B7E711C](v60, -1, -1);

          }
          else
          {

          }
          (*(void (**)(char *, uint64_t))(v69 + 8))(v66, v45);
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_release();
        __break(1u);

        swift_release();
        __break(1u);
      }
    }
  }
  else
  {
    v30 = v80;
    v31 = (void *)sub_235F4C114();

    swift_willThrow();
    if (qword_256394AA0 != -1)
      swift_once();
    v32 = __swift_project_value_buffer(v1, (uint64_t)qword_256395488);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v7, v32, v1);
    v33 = v31;
    v34 = v31;
    v35 = sub_235F4C324();
    v36 = sub_235F4CB88();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      v38 = swift_slowAlloc();
      v69 = v2;
      v39 = (_QWORD *)v38;
      v70 = v14;
      *(_DWORD *)v37 = 138412290;
      v40 = v31;
      v41 = _swift_stdlib_bridgeErrorToNSError();
      v77 = v41;
      sub_235F4CBF4();
      *v39 = v41;

      _os_log_impl(&dword_235F17000, v35, v36, "Failed to read directory: %@", v37, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256395408);
      swift_arrayDestroy();
      v42 = v39;
      v2 = v69;
      MEMORY[0x23B7E711C](v42, -1, -1);
      MEMORY[0x23B7E711C](v37, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  }
}

uint64_t _sSo8AVSStoreC22AdaptiveVoiceShortcutsE22storeEventForDebugging5eventyAC08AVSDebugF0V_tF_0(uint64_t a1)
{
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
  char *v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  void *v25;
  void *v26;
  void *v27;
  void (*v28)(char *, uint64_t);
  void *v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  unsigned int v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  _QWORD *v42;
  id v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v52;
  uint64_t v53;
  id v54;
  char *v55;
  void (*v56)(char *, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t);
  unint64_t v60;
  uint64_t v61;
  id v62;
  char *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;

  v61 = a1;
  v68 = *MEMORY[0x24BDAC8D0];
  v1 = sub_235F4C33C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v63 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v55 = (char *)&v52 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v52 - v7;
  v9 = sub_235F4C1A4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = (id)objc_opt_self();
  v62 = objc_msgSend(v54, sel_defaultManager);
  if (qword_256394A98 != -1)
    swift_once();
  v13 = qword_256395278;
  v14 = unk_256395280;
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  v16 = (void *)sub_235F4CA74();
  objc_msgSend(v15, sel_setDateFormat_, v16);

  v59 = (void (*)(char *, uint64_t))v13;
  v66 = v13;
  v67 = v14;
  swift_bridgeObjectRetain();
  sub_235F4C198();
  v17 = (void *)sub_235F4C174();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v18 = objc_msgSend(v15, sel_stringFromDate_, v17);

  sub_235F4CA80();
  sub_235F4CABC();
  swift_bridgeObjectRelease();
  sub_235F4CABC();
  v19 = v67;
  v58 = v66;
  v60 = v67;
  if (qword_256394AA0 != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v1, (uint64_t)qword_256395488);
  swift_beginAccess();
  v56 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v57 = v20;
  v56(v8, v20, v1);
  swift_bridgeObjectRetain_n();
  v21 = sub_235F4C324();
  v22 = sub_235F4CBA0();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = swift_slowAlloc();
    v52 = v2;
    v24 = (uint8_t *)v23;
    v25 = (void *)swift_slowAlloc();
    v53 = v1;
    v26 = v25;
    v65 = v25;
    *(_DWORD *)v24 = 136315138;
    swift_bridgeObjectRetain();
    v64 = sub_235F43930(v58, v19, (uint64_t *)&v65);
    sub_235F4CBF4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_235F17000, v21, v22, "Will attempt to store event for debugging file: %s", v24, 0xCu);
    swift_arrayDestroy();
    v27 = v26;
    v1 = v53;
    MEMORY[0x23B7E711C](v27, -1, -1);
    MEMORY[0x23B7E711C](v24, -1, -1);

    v28 = *(void (**)(char *, uint64_t))(v52 + 8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v28 = *(void (**)(char *, uint64_t))(v2 + 8);
  }
  v28(v8, v1);
  v29 = v62;
  LOBYTE(v64) = 1;
  v30 = (void *)sub_235F4CA74();
  v31 = objc_msgSend(v29, sel_fileExistsAtPath_isDirectory_, v30, &v64);

  if ((v31 & 1) == 0)
  {
    v32 = (void *)sub_235F4CA74();
    v65 = 0;
    v33 = objc_msgSend(v29, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v32, 1, 0, &v65);

    if (v33)
    {
      v34 = v65;
    }
    else
    {
      v59 = v28;
      v35 = v65;
      v36 = (void *)sub_235F4C114();

      swift_willThrow();
      v56(v55, v57, v1);
      v37 = v36;
      v38 = v36;
      v39 = sub_235F4C324();
      v40 = sub_235F4CB88();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = (uint8_t *)swift_slowAlloc();
        v42 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v41 = 138412290;
        v43 = v36;
        v44 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v65 = v44;
        sub_235F4CBF4();
        *v42 = v44;
        v29 = v62;

        _os_log_impl(&dword_235F17000, v39, v40, "Failed to create directory for debugging events: %@", v41, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256395408);
        swift_arrayDestroy();
        MEMORY[0x23B7E711C](v42, -1, -1);
        MEMORY[0x23B7E711C](v41, -1, -1);

      }
      else
      {

      }
      v59(v55, v1);
    }
  }
  sub_235F4C0C0();
  swift_allocObject();
  sub_235F4C0B4();
  type metadata accessor for AVSDebugEvent();
  sub_235F1BE00(&qword_256395400, (uint64_t (*)(uint64_t))type metadata accessor for AVSDebugEvent, (uint64_t)&protocol conformance descriptor for AVSDebugEvent);
  v45 = sub_235F4C0A8();
  v47 = v46;
  v48 = objc_msgSend(v54, sel_defaultManager);
  v49 = (void *)sub_235F4CA74();
  swift_bridgeObjectRelease();
  v50 = (void *)sub_235F4C168();
  objc_msgSend(v48, sel_createFileAtPath_contents_attributes_, v49, v50, 0);

  sub_235F2D7EC(v15);
  sub_235F2F43C(v45, v47);
  return swift_release();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_235F2E988()
{
  unint64_t result;

  result = qword_2563952A8;
  if (!qword_2563952A8)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4DE5C, &type metadata for AVSDebugEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563952A8);
  }
  return result;
}

uint64_t type metadata accessor for AVSDebugEvent()
{
  uint64_t result;

  result = qword_256395398;
  if (!qword_256395398)
    return swift_getSingletonMetadata();
  return result;
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

uint64_t sub_235F2EA28(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563952B8);
    v8 = a2;
    result = MEMORY[0x23B7E7098](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

void sub_235F2EA94(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_235F26BA0(a1, (SEL *)&selRef_identifier, a2);
}

void sub_235F2EAB0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (SEL *)&selRef_setIdentifier_);
}

char *keypath_get_selector_name()
{
  return sel_name;
}

void sub_235F2EAC8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_235F26BA0(a1, (SEL *)&selRef_name, a2);
}

void sub_235F2EAE4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (SEL *)&selRef_setName_);
}

char *keypath_get_selector_associatedShortcutName()
{
  return sel_associatedShortcutName;
}

void sub_235F2EAFC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_235F26BA0(a1, (SEL *)&selRef_associatedShortcutName, a2);
}

void sub_235F2EB18(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (SEL *)&selRef_setAssociatedShortcutName_);
}

void keypath_setTm(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  id v7;

  v6 = *a2;
  v7 = (id)sub_235F4CA74();
  objc_msgSend(v6, *a5, v7);

}

uint64_t type metadata accessor for AdaptiveVoiceShortcutObjcClass(uint64_t a1)
{
  return sub_235F26110(a1, &qword_256395308);
}

uint64_t type metadata accessor for AVSStore(uint64_t a1)
{
  return sub_235F26110(a1, &qword_256395338);
}

uint64_t *initializeBufferWithCopyOfBuffer for AVSDebugEvent(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_235F4C1C8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    *(_DWORD *)((char *)a1 + a3[7]) = *(_DWORD *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for AVSDebugEvent(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_235F4C1C8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AVSDebugEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v6 = sub_235F4C1C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AVSDebugEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_235F4C1C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t initializeWithTake for AVSDebugEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_235F4C1C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for AVSDebugEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_235F4C1C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVSDebugEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235F2EED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_235F4C1C8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for AVSDebugEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_235F2EF5C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_235F4C1C8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_235F2EFD8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235F4C1C8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AVSDebugEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AVSDebugEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235F2F14C + 4 * byte_235F4DCF5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_235F2F180 + 4 * byte_235F4DCF0[v4]))();
}

uint64_t sub_235F2F180(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F2F188(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235F2F190);
  return result;
}

uint64_t sub_235F2F19C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235F2F1A4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_235F2F1A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F2F1B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F2F1BC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_235F2F1C4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AVSDebugEvent.CodingKeys()
{
  return &type metadata for AVSDebugEvent.CodingKeys;
}

unint64_t sub_235F2F1E0()
{
  unint64_t result;

  result = qword_2563953D8;
  if (!qword_2563953D8)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4DE34, &type metadata for AVSDebugEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563953D8);
  }
  return result;
}

unint64_t sub_235F2F228()
{
  unint64_t result;

  result = qword_2563953E0;
  if (!qword_2563953E0)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4DDA4, &type metadata for AVSDebugEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563953E0);
  }
  return result;
}

unint64_t sub_235F2F270()
{
  unint64_t result;

  result = qword_2563953E8;
  if (!qword_2563953E8)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4DDCC, &type metadata for AVSDebugEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563953E8);
  }
  return result;
}

uint64_t sub_235F2F2B4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_235F4CE1C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64726F7779656BLL && a2 == 0xE700000000000000 || (sub_235F4CE1C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7479426F69647561 && a2 == 0xEA00000000007365 || (sub_235F4CE1C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x65726F6373 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_235F4CE1C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_235F2F43C(uint64_t a1, unint64_t a2)
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

uint64_t sub_235F2F480(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AdaptiveVoiceShortcut();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F2F4C4(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256395430);
    v10 = sub_235F1BE00(a2, (uint64_t (*)(uint64_t))type metadata accessor for AdaptiveVoiceShortcut, a3);
    result = MEMORY[0x23B7E7098](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235F2F548(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id static AVSSettings.avsFeatureEnabled.getter()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v1 = objc_msgSend(v0, sel_isAdaptiveVoiceShortcutsEnabled);

  return v1;
}

void static AVSSettings.avsFeatureEnabled.setter(char a1)
{
  id v2;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  objc_msgSend(v2, sel_setAdaptiveVoiceShortcutsEnabled_, a1 & 1);

}

id static AVSSettings.shouldHideAudioDonationPrompt.getter()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)sub_235F4CA74();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void static AVSSettings.shouldHideAudioDonationPrompt.setter(char a1)
{
  id v2;
  id v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v3 = (id)sub_235F4CA74();
  objc_msgSend(v2, sel_setBool_forKey_, a1 & 1, v3);

}

AVSSettings __swiftcall AVSSettings.init()()
{
  return (AVSSettings)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id AVSSettings.init()()
{
  objc_super v1;

  v1.super_class = (Class)AVSSettings;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for AVSSettings()
{
  unint64_t result;

  result = qword_256395480;
  if (!qword_256395480)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256395480);
  }
  return result;
}

uint64_t sub_235F2F9D8()
{
  uint64_t v0;

  v0 = sub_235F4C33C();
  __swift_allocate_value_buffer(v0, qword_256395488);
  __swift_project_value_buffer(v0, (uint64_t)qword_256395488);
  return sub_235F4C330();
}

uint64_t AVSLogger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256394AA0 != -1)
    swift_once();
  v2 = sub_235F4C33C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256395488);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t AVSLogger.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_256394AA0 != -1)
    swift_once();
  v2 = sub_235F4C33C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256395488);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*AVSLogger.modify())()
{
  uint64_t v0;

  if (qword_256394AA0 != -1)
    swift_once();
  v0 = sub_235F4C33C();
  __swift_project_value_buffer(v0, (uint64_t)qword_256395488);
  swift_beginAccess();
  return j__swift_endAccess;
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

uint64_t sub_235F2FC48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v3 = sub_235F4C1C8();
  v47 = *(_QWORD *)(v3 - 8);
  v48 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v46 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for AvailableShortcutAction();
  v44 = *(_QWORD *)(v5 - 8);
  v45 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = MEMORY[0x24BEE4AF8];
  if (!v8)
    return v9;
  v43 = v7;
  v37 = v1;
  v51 = MEMORY[0x24BEE4AF8];
  sub_235F25924(0, v8, 0);
  v9 = v51;
  result = sub_235F394A4(a1);
  v12 = result;
  v13 = 0;
  v14 = a1 + 64;
  v38 = a1 + 80;
  v39 = v8;
  v40 = v11;
  v41 = a1 + 64;
  v42 = a1;
  while ((v12 & 0x8000000000000000) == 0 && v12 < 1 << *(_BYTE *)(a1 + 32))
  {
    v17 = (unint64_t)v12 >> 6;
    if ((*(_QWORD *)(v14 + 8 * ((unint64_t)v12 >> 6)) & (1 << v12)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v11)
      goto LABEL_24;
    v49 = v13;
    v18 = *(_QWORD *)(a1 + 56);
    v19 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v20 = v19[1];
    v50 = *v19;
    v21 = (uint64_t *)(v18 + 16 * v12);
    v22 = v9;
    v23 = *v21;
    v24 = v21[1];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v25 = v46;
    sub_235F4C1BC();
    v26 = (uint64_t)v43;
    sub_235F4C1BC();
    (*(void (**)(uint64_t, char *, uint64_t))(v47 + 40))(v26, v25, v48);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v27 = v45;
    v28 = (_QWORD *)(v26 + *(int *)(v45 + 20));
    *v28 = v23;
    v28[1] = v24;
    v9 = v22;
    v29 = v26 + *(int *)(v27 + 24);
    *(_QWORD *)v29 = v50;
    *(_QWORD *)(v29 + 8) = v20;
    *(_BYTE *)(v29 + 16) = 1;
    v51 = v22;
    v31 = *(_QWORD *)(v22 + 16);
    v30 = *(_QWORD *)(v22 + 24);
    if (v31 >= v30 >> 1)
    {
      sub_235F25924(v30 > 1, v31 + 1, 1);
      v26 = (uint64_t)v43;
      v9 = v51;
    }
    *(_QWORD *)(v9 + 16) = v31 + 1;
    result = sub_235F253C8(v26, v9+ ((*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80))+ *(_QWORD *)(v44 + 72) * v31, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
    a1 = v42;
    v15 = 1 << *(_BYTE *)(v42 + 32);
    if (v12 >= v15)
      goto LABEL_25;
    v14 = v41;
    v32 = *(_QWORD *)(v41 + 8 * v17);
    if ((v32 & (1 << v12)) == 0)
      goto LABEL_26;
    LODWORD(v11) = v40;
    if (*(_DWORD *)(v42 + 36) != (_DWORD)v40)
      goto LABEL_27;
    v33 = v32 & (-2 << (v12 & 0x3F));
    if (v33)
    {
      v15 = __clz(__rbit64(v33)) | v12 & 0xFFFFFFFFFFFFFFC0;
      v16 = v39;
    }
    else
    {
      v34 = v17 + 1;
      v35 = (unint64_t)(v15 + 63) >> 6;
      v16 = v39;
      if (v17 + 1 < v35)
      {
        v36 = *(_QWORD *)(v41 + 8 * v34);
        if (v36)
        {
LABEL_20:
          v15 = __clz(__rbit64(v36)) + (v34 << 6);
        }
        else
        {
          while (v35 - 2 != v17)
          {
            v36 = *(_QWORD *)(v38 + 8 * v17++);
            if (v36)
            {
              v34 = v17 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    v13 = v49 + 1;
    v12 = v15;
    if (v49 + 1 == v16)
      return v9;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

BOOL static AVSCoordinatorObject.Stage.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AVSCoordinatorObject.Stage.hash(into:)()
{
  return sub_235F4CE40();
}

uint64_t AVSCoordinatorObject.Stage.hashValue.getter()
{
  sub_235F4CE34();
  sub_235F4CE40();
  return sub_235F4CE4C();
}

uint64_t sub_235F30008()
{
  return sub_235F30058();
}

uint64_t sub_235F3001C@<X0>(_QWORD *a1@<X8>)
{
  return sub_235F35610(a1);
}

uint64_t sub_235F30030()
{
  return sub_235F25894();
}

uint64_t sub_235F30044()
{
  return sub_235F30058();
}

uint64_t sub_235F30058()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235F300C8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_235F4C3D8();
}

uint64_t (*sub_235F30134(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235F4C3C0();
  return sub_235F301AC;
}

uint64_t sub_235F301B0()
{
  return sub_235F30C1C((uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__recordingMagnitudes, &qword_2563954A8);
}

uint64_t sub_235F301C4(uint64_t a1)
{
  return sub_235F30C9C(a1, &qword_2563954B0, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__recordingMagnitudes, &qword_2563954A8);
}

uint64_t (*sub_235F301E0(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563954B0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__recordingMagnitudes;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563954A8);
  sub_235F4C3A8();
  swift_endAccess();
  return sub_235F302A8;
}

uint64_t sub_235F302AC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235F4C3CC();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_235F30328()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_235F4C3D8();
}

uint64_t sub_235F30398()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235F30410()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_235F4C3D8();
}

uint64_t (*sub_235F3047C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235F4C3C0();
  return sub_235F301AC;
}

uint64_t sub_235F304F4()
{
  return sub_235F30C1C((uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__enrollmentsRecorded, &qword_2563954C0);
}

uint64_t sub_235F30508(uint64_t a1)
{
  return sub_235F30C9C(a1, &qword_2563954C8, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__enrollmentsRecorded, &qword_2563954C0);
}

uint64_t (*sub_235F30524(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563954C8);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__enrollmentsRecorded;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563954C0);
  sub_235F4C3A8();
  swift_endAccess();
  return sub_235F302A8;
}

uint64_t sub_235F305EC@<X0>(_BYTE *a1@<X8>)
{
  return sub_235F307C8(a1);
}

uint64_t sub_235F30600()
{
  return sub_235F30854();
}

uint64_t sub_235F30614()
{
  return sub_235F308D4();
}

uint64_t sub_235F30630()
{
  return sub_235F30958();
}

uint64_t (*sub_235F30644(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235F4C3C0();
  return sub_235F301AC;
}

uint64_t sub_235F306BC()
{
  return sub_235F30C1C((uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__isRecording, &qword_2563954D8);
}

uint64_t sub_235F306D0(uint64_t a1)
{
  return sub_235F30C9C(a1, &qword_2563954E0, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__isRecording, &qword_2563954D8);
}

uint64_t (*sub_235F306EC(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563954E0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__isRecording;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563954D8);
  sub_235F4C3A8();
  swift_endAccess();
  return sub_235F302A8;
}

uint64_t sub_235F307B4@<X0>(_BYTE *a1@<X8>)
{
  return sub_235F307C8(a1);
}

uint64_t sub_235F307C8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235F4C3CC();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_235F30840()
{
  return sub_235F30854();
}

uint64_t sub_235F30854()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_235F4C3D8();
}

uint64_t sub_235F308C0()
{
  return sub_235F308D4();
}

uint64_t sub_235F308D4()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235F30944()
{
  return sub_235F30958();
}

uint64_t sub_235F30958()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_235F4C3D8();
}

uint64_t (*sub_235F309C0(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235F4C3C0();
  return sub_235F301AC;
}

void sub_235F30A38(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_235F30A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_235F4C3A8();
  return swift_endAccess();
}

uint64_t sub_235F30AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v18 - v14;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_235F4C3B4();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_235F30C08()
{
  return sub_235F30C1C((uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__cacheAVSfeatureEnabled, &qword_2563954D8);
}

uint64_t sub_235F30C1C(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_235F4C3A8();
  return swift_endAccess();
}

uint64_t sub_235F30C80(uint64_t a1)
{
  return sub_235F30C9C(a1, &qword_2563954E0, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__cacheAVSfeatureEnabled, &qword_2563954D8);
}

uint64_t sub_235F30C9C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_235F4C3B4();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_235F30D74(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563954E0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__cacheAVSfeatureEnabled;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2563954D8);
  sub_235F4C3A8();
  swift_endAccess();
  return sub_235F302A8;
}

void sub_235F30E3C(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_235F4C3B4();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_235F4C3B4();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t sub_235F30F54@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  v5 = *v3;
  v4 = v3[1];
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v4;
  *a2 = sub_235F39DB0;
  a2[1] = (uint64_t (*)())v6;
  return swift_retain();
}

uint64_t sub_235F30FD4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = *a1;
  v3 = a1[1];
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  v6 = (uint64_t (**)())(*a2 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  *v6 = sub_235F39DB0;
  v6[1] = (uint64_t (*)())v5;
  swift_retain();
  return swift_release();
}

uint64_t sub_235F31064()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  v2 = *v1;
  swift_retain();
  return v2;
}

uint64_t sub_235F310B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_release();
}

uint64_t (*sub_235F31114())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_235F31158(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory);
  swift_beginAccess();
  *v3 = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_235F311C0()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_235F31208(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory);
  swift_beginAccess();
  *v3 = a1;
  return swift_release();
}

uint64_t (*sub_235F31258())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t AVSCoordinatorObject.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  AVSCoordinatorObject.init()();
  return v0;
}

uint64_t AVSCoordinatorObject.init()()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, char *, uint64_t);
  char *v25;
  uint64_t v26;
  void (*v27)(uint64_t, char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[5];
  _QWORD v49[3];
  uint64_t v50;
  _UNKNOWN **v51;

  v1 = v0;
  v2 = sub_235F4C33C();
  v46 = *(_QWORD *)(v2 - 8);
  v47 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v45 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_235F4C1EC();
  v44 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v41 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563954D8);
  v42 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563954C0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563954F0);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__navigationPath;
  v49[0] = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395500);
  sub_235F4C39C();
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v16, v15, v12);
  v17 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  sub_235F4C1BC();
  v18 = (int *)type metadata accessor for AdaptiveVoiceShortcut();
  v19 = (_QWORD *)(v17 + v18[5]);
  *v19 = 0;
  v19[1] = 0;
  v20 = (_QWORD *)(v17 + v18[6]);
  *v20 = 0;
  v20[1] = 0;
  v21 = v17 + v18[7];
  v22 = type metadata accessor for AvailableShortcutAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  v23 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__enrollmentsRecorded;
  v49[0] = 0;
  sub_235F4C39C();
  v24 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  v25 = v41;
  v24(v23, v11, v8);
  v26 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__isRecording;
  LOBYTE(v49[0]) = 0;
  sub_235F4C39C();
  v27 = *(void (**)(uint64_t, char *, uint64_t))(v42 + 32);
  v27(v26, v7, v5);
  v28 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__cacheAVSfeatureEnabled;
  LOBYTE(v49[0]) = objc_msgSend((id)objc_opt_self(), sel_avsFeatureEnabled);
  v29 = v43;
  sub_235F4C39C();
  v27(v28, v7, v5);
  v30 = v44;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_numberOfSamples) = 50;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_maxEnrollments) = 3;
  v31 = (_QWORD *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  *v31 = nullsub_1;
  v31[1] = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_verifierModel) = 0;
  v32 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allCollectedEnrollments) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allSuccessfulEnrollments) = v32;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory) = 0;
  v33 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_currentEnroller;
  type metadata accessor for AVSAudioProvider();
  *(_OWORD *)v33 = 0u;
  *(_OWORD *)(v33 + 16) = 0u;
  *(_QWORD *)(v33 + 32) = 0;
  swift_allocObject();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_audioProvider) = sub_235F3AB78();
  v34 = sub_235F4CB10();
  *(_QWORD *)(v34 + 16) = 50;
  *(_OWORD *)(v34 + 32) = 0u;
  *(_OWORD *)(v34 + 48) = 0u;
  *(_OWORD *)(v34 + 64) = 0u;
  *(_OWORD *)(v34 + 80) = 0u;
  *(_OWORD *)(v34 + 96) = 0u;
  *(_OWORD *)(v34 + 112) = 0u;
  *(_OWORD *)(v34 + 128) = 0u;
  *(_OWORD *)(v34 + 144) = 0u;
  *(_OWORD *)(v34 + 160) = 0u;
  *(_OWORD *)(v34 + 176) = 0u;
  *(_OWORD *)(v34 + 192) = 0u;
  *(_OWORD *)(v34 + 208) = 0u;
  *(_QWORD *)(v34 + 224) = 0;
  swift_beginAccess();
  v48[0] = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395538);
  sub_235F4C39C();
  swift_endAccess();
  v35 = type metadata accessor for AVSCoordinatorObject(0);
  v50 = v35;
  v51 = (_UNKNOWN **)sub_235F1BE00(&qword_256395540, type metadata accessor for AVSCoordinatorObject, (uint64_t)&protocol conformance descriptor for AVSCoordinatorObject);
  v49[0] = v1;
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v25, *MEMORY[0x24BEC0C48], v29);
  swift_retain();
  v36 = sub_235F4C2DC();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v25, v29);
  sub_235F1BF08((uint64_t)v49, &qword_256395548);
  swift_release();
  v37 = (uint64_t *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory);
  swift_beginAccess();
  *v37 = v36;
  swift_release();
  v38 = *(_QWORD *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_audioProvider);
  v50 = v35;
  v51 = &off_25074FD98;
  v49[0] = v1;
  sub_235F3689C((uint64_t)v49, (uint64_t)v48);
  swift_beginAccess();
  swift_retain();
  swift_retain();
  sub_235F36B28((uint64_t)v48, v38 + 40, &qword_256395550);
  swift_endAccess();
  swift_release();
  return v1;
}

uint64_t sub_235F31A20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v11[6];
  _OWORD v12[2];
  uint64_t v13;

  v1 = v0;
  v2 = sub_235F4C1C8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend((id)objc_opt_self(), sel_setAvsFeatureEnabled_, 0);
  v6 = v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  *(_QWORD *)&v12[0] = sub_235F4C1B0();
  *((_QWORD *)&v12[0] + 1) = v7;
  v11[3] = 45;
  v11[4] = 0xE100000000000000;
  v11[0] = 0;
  v11[1] = 0xE000000000000000;
  sub_235F1EA80();
  sub_235F4CC24();
  swift_bridgeObjectRelease();
  sub_235F4CAA4();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v8 = (_QWORD *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory);
  swift_beginAccess();
  if (*v8)
  {
    swift_retain();
    sub_235F4C2D0();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    v13 = 0;
    memset(v12, 0, sizeof(v12));
  }
  v9 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_currentEnroller;
  swift_beginAccess();
  sub_235F36B28((uint64_t)v12, v9, &qword_256395558);
  swift_endAccess();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v12[0]) = 1;
  swift_retain();
  sub_235F4C3D8();
  return sub_235F3B9CC();
}

uint64_t sub_235F31C80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v15[10];
  _OWORD v16[2];
  uint64_t v17;

  v3 = v2;
  v15[1] = a2;
  v5 = sub_235F4C33C();
  v15[2] = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_235F4C1C8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend((id)objc_opt_self(), sel_setAvsFeatureEnabled_, 0);
  v10 = v2 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  *(_QWORD *)&v16[0] = sub_235F4C1B0();
  *((_QWORD *)&v16[0] + 1) = v11;
  v15[7] = 45;
  v15[8] = 0xE100000000000000;
  v15[4] = 0;
  v15[5] = 0xE000000000000000;
  sub_235F1EA80();
  sub_235F4CC24();
  swift_bridgeObjectRelease();
  sub_235F4CAA4();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v12 = (_QWORD *)(v3 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory);
  swift_beginAccess();
  if (*v12)
  {
    swift_retain();
    sub_235F4C2D0();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v17 = 0;
    memset(v16, 0, sizeof(v16));
  }
  v13 = v3 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_currentEnroller;
  swift_beginAccess();
  sub_235F36B28((uint64_t)v16, v13, &qword_256395558);
  swift_endAccess();
  return sub_235F3CD14(a1);
}

uint64_t sub_235F320AC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3D8();
  return sub_235F3BE0C();
}

uint64_t sub_235F32124(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  _QWORD v16[4];

  v3 = v2;
  v6 = sub_235F4C0D8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = a1;
  v16[2] = a2;
  sub_235F4C0CC();
  sub_235F1EA80();
  v10 = sub_235F4CC18();
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v13 = v3 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  v14 = (uint64_t *)(v13 + *(int *)(type metadata accessor for AdaptiveVoiceShortcut() + 20));
  *v14 = v10;
  v14[1] = v12;
  return swift_bridgeObjectRelease();
}

uint64_t sub_235F32214(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F25368(a1, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
  v6 = type metadata accessor for AvailableShortcutAction();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
  v7 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  v8 = type metadata accessor for AdaptiveVoiceShortcut();
  sub_235F36B28((uint64_t)v5, v7 + *(int *)(v8 + 28), &qword_256394AC8);
  return swift_endAccess();
}

uint64_t sub_235F322FC()
{
  char *v0;
  unint64_t v1;
  char *v2;
  char *v3;
  char **v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  char **v8;
  char **v9;
  char *v10;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  char *v16;
  void (*v17)(uint64_t);
  uint64_t v18;
  char **v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  char *v26;
  unint64_t v27;
  char *v28;
  uint64_t v29[4];

  v2 = v0;
  swift_getKeyPath();
  v3 = "؉D ";
  swift_getKeyPath();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  v4 = *(char ***)(v29[0] + 16);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  if (!v4)
  {
    v2 = (char *)sub_235F4C3C0();
    v9 = v8;
    v10 = *v8;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v9 = v10;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v10 = sub_235F27BA4(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
      *v9 = v10;
    }
    v13 = *((_QWORD *)v10 + 2);
    v12 = *((_QWORD *)v10 + 3);
    if (v13 >= v12 >> 1)
    {
      v10 = sub_235F27BA4((char *)(v12 > 1), v13 + 1, 1, v10);
      *v9 = v10;
    }
    *((_QWORD *)v10 + 2) = v13 + 1;
    v10[v13 + 32] = 3;
    goto LABEL_12;
  }
  sub_235F4C3CC();
  swift_release();
  swift_release();
  v5 = *(_QWORD *)(v29[0] + 16);
  if (!v5)
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  v6 = *(unsigned __int8 *)(v5 + v29[0] + 31);
  swift_bridgeObjectRelease();
  v7 = 0;
  while (*((unsigned __int8 *)&unk_25074F3F0 + v7 + 32) != v6)
  {
    if (++v7 == 6)
      goto LABEL_19;
  }
  v14 = __OFADD__(v7, 1);
  v15 = v7 + 1;
  if (v14)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v15 >= 6)
  {
LABEL_19:
    v16 = &v2[OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow];
    swift_beginAccess();
    v17 = *(void (**)(uint64_t))v16;
    v18 = swift_retain();
    v17(v18);
    return swift_release();
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    LODWORD(v1) = *((unsigned __int8 *)&unk_25074F3F0 + v15 + 32);
    if ((_DWORD)v1 == 5 && objc_msgSend((id)objc_opt_self(), sel_shouldHideAudioDonationPrompt))
      goto LABEL_19;
    swift_getKeyPath();
    swift_getKeyPath();
    v2 = (char *)sub_235F4C3C0();
    v4 = v20;
    v3 = *v20;
    v21 = swift_isUniquelyReferenced_nonNull_native();
    *v4 = v3;
    if ((v21 & 1) != 0)
      goto LABEL_22;
    goto LABEL_27;
  }
LABEL_26:
  __break(1u);
LABEL_27:
  v3 = sub_235F27BA4(0, *((_QWORD *)v3 + 2) + 1, 1, v3);
  *v4 = v3;
LABEL_22:
  v22 = *((_QWORD *)v3 + 2);
  v23 = *((_QWORD *)v3 + 3);
  v24 = v22 + 1;
  if (v22 >= v23 >> 1)
  {
    v25 = v1;
    v1 = v22 + 1;
    v26 = v3;
    v27 = *((_QWORD *)v3 + 2);
    v28 = sub_235F27BA4((char *)(v23 > 1), v22 + 1, 1, v26);
    v22 = v27;
    v24 = v1;
    LOBYTE(v1) = v25;
    v3 = v28;
    *v4 = v28;
  }
  *((_QWORD *)v3 + 2) = v24;
  v3[v22 + 32] = v1;
LABEL_12:
  ((void (*)(uint64_t *, _QWORD))v2)(v29, 0);
  swift_release();
  return swift_release();
}

uint64_t sub_235F32628()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  void (*v4)(_QWORD, _QWORD);
  uint64_t v5;
  void (**v6)(_QWORD);
  void (*v7)(_QWORD);
  uint64_t v8;
  _QWORD v9[4];
  char v10;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  v1 = *(_QWORD *)(v9[0] + 16);
  swift_bridgeObjectRelease();
  if (!v1)
  {
    v6 = (void (**)(_QWORD))(v0
                                      + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
    swift_beginAccess();
    v7 = *v6;
    v8 = swift_retain();
    v7(v8);
    return swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  result = sub_235F4C3C0();
  if (*(_QWORD *)(*(_QWORD *)v3 + 16))
  {
    v4 = (void (*)(_QWORD, _QWORD))result;
    v5 = v3;
    sub_235F37F70(&v10);
    if (v10 == 6)
      sub_235F37E98(*(_QWORD *)(*(_QWORD *)v5 + 16) - 1, &v10);
    v4(v9, 0);
    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_235F3276C()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  _BYTE *v3;
  _QWORD *v4;
  _QWORD *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _BYTE v13[24];
  void *v14;

  v1 = (int *)type metadata accessor for AdaptiveVoiceShortcut();
  MEMORY[0x24BDAC7A8]();
  v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_getKeyPath();
  swift_getKeyPath();
  v14 = &unk_25074F418;
  swift_retain();
  sub_235F4C3D8();
  sub_235F4C1BC();
  v4 = &v3[v1[5]];
  *v4 = 0;
  v4[1] = 0;
  v5 = &v3[v1[6]];
  *v5 = 0;
  v5[1] = 0;
  v6 = &v3[v1[7]];
  v7 = type metadata accessor for AvailableShortcutAction();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  sub_235F2F480((uint64_t)v3, v8);
  swift_endAccess();
  swift_getKeyPath();
  swift_getKeyPath();
  v14 = 0;
  swift_retain();
  sub_235F4C3D8();
  v9 = (_QWORD *)(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allSuccessfulEnrollments);
  swift_beginAccess();
  v10 = MEMORY[0x24BEE4AF8];
  *v9 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v11 = (_QWORD *)(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allCollectedEnrollments);
  swift_beginAccess();
  *v11 = v10;
  return swift_bridgeObjectRelease();
}

uint64_t sub_235F3293C()
{
  return _AXSSetAudioDonationSiriImprovementEnabled();
}

uint64_t sub_235F32944()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3D8();
  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allSuccessfulEnrollments);
  swift_beginAccess();
  v2 = MEMORY[0x24BEE4AF8];
  *v1 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v3 = (_QWORD *)(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allCollectedEnrollments);
  swift_beginAccess();
  *v3 = v2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_235F32A0C(void *a1)
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
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  _QWORD aBlock[3];
  void *v24;
  uint64_t (*v25)();
  uint64_t v26;

  v3 = sub_235F4C33C();
  v18 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_235F4C9FC();
  v21 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_235F4CA20();
  v19 = *(_QWORD *)(v7 - 8);
  v20 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_currentEnroller;
  swift_beginAccess();
  sub_235F1BEC4(v10, (uint64_t)aBlock, &qword_256395558);
  if (v24)
  {
    v16[4] = v3;
    sub_235F39438((uint64_t)aBlock, (uint64_t)v22);
    sub_235F1BF08((uint64_t)aBlock, &qword_256395558);
    __swift_project_boxed_opaque_existential_1(v22, v22[3]);
    v17 = a1;
    sub_235F4C1F8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    a1 = v17;
  }
  else
  {
    sub_235F1BF08((uint64_t)aBlock, &qword_256395558);
  }
  sub_235F26110(0, (unint64_t *)&qword_256394D78);
  v11 = (void *)sub_235F4CBB8();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v1;
  *(_QWORD *)(v12 + 24) = a1;
  v25 = sub_235F39430;
  v26 = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235F34E88;
  v24 = &block_descriptor_53;
  v13 = _Block_copy(aBlock);
  swift_retain();
  v14 = a1;
  swift_release();
  sub_235F4CA14();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_235F1BE00((unint64_t *)&qword_256394D80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D88);
  sub_235F1BF90((unint64_t *)&qword_256394D90, &qword_256394D88, MEMORY[0x24BEE12C8]);
  sub_235F4CC48();
  MEMORY[0x23B7E6900](0, v9, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v9, v20);
}

uint64_t sub_235F32F20(uint64_t a1, void *a2)
{
  sub_235F399DC(a2);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_235F4C3D8();
}

uint64_t sub_235F32F98()
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  char *v41;
  char *v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  void *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t aBlock[9];

  v1 = v0;
  v2 = sub_235F4C9FC();
  v64 = *(_QWORD *)(v2 - 8);
  v65 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v63 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_235F4CA20();
  v61 = *(_QWORD *)(v4 - 8);
  v62 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v60 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_235F4CA38();
  v6 = *(_QWORD *)(v59 - 8);
  v7 = MEMORY[0x24BDAC7A8](v59);
  v57 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v58 = (char *)&v50 - v9;
  v55 = (_QWORD *)type metadata accessor for AdaptiveVoiceShortcut();
  v10 = *(v55 - 1);
  v11 = MEMORY[0x24BDAC7A8](v55);
  v56 = (uint64_t)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v50 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v50 - v16;
  v18 = sub_235F4C33C();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256394AA0 != -1)
    swift_once();
  v22 = __swift_project_value_buffer(v18, (uint64_t)qword_256395488);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v22, v18);
  swift_retain_n();
  v23 = sub_235F4C324();
  v24 = sub_235F4CBA0();
  if (os_log_type_enabled(v23, v24))
  {
    v51 = v19;
    v25 = v1;
    v26 = swift_slowAlloc();
    v54 = v6;
    v27 = (uint8_t *)v26;
    v28 = swift_slowAlloc();
    v52 = v10;
    v29 = v28;
    aBlock[0] = v28;
    v53 = v15;
    *(_DWORD *)v27 = 136315138;
    v50 = v27 + 4;
    v30 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
    swift_beginAccess();
    sub_235F25368(v30, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
    v31 = sub_235F4CA98();
    aBlock[6] = sub_235F43930(v31, v32, aBlock);
    v15 = v53;
    sub_235F4CBF4();
    swift_release_n();
    v1 = v25;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235F17000, v23, v24, "Enrolling command: %s", v27, 0xCu);
    swift_arrayDestroy();
    v33 = v29;
    v10 = v52;
    MEMORY[0x23B7E711C](v33, -1, -1);
    v34 = v27;
    v6 = v54;
    MEMORY[0x23B7E711C](v34, -1, -1);

    (*(void (**)(char *, uint64_t))(v51 + 8))(v21, v18);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }
  v55 = objc_msgSend(objc_allocWithZone((Class)AVSStore), sel_init);
  v35 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  sub_235F25368(v35, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
  v36 = sub_235F28AB0();
  v37 = v56;
  sub_235F25368((uint64_t)v15, v56, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v36 = sub_235F27ED0(0, *(_QWORD *)(v36 + 16) + 1, 1, v36);
  v39 = *(_QWORD *)(v36 + 16);
  v38 = *(_QWORD *)(v36 + 24);
  if (v39 >= v38 >> 1)
    v36 = sub_235F27ED0(v38 > 1, v39 + 1, 1, v36);
  *(_QWORD *)(v36 + 16) = v39 + 1;
  sub_235F253C8(v37, v36+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(_QWORD *)(v10 + 72) * v39, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
  sub_235F2A158(v36);
  swift_bridgeObjectRelease();
  sub_235F1BD10((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
  sub_235F26110(0, (unint64_t *)&qword_256394D78);
  v40 = (void *)sub_235F4CBB8();
  v41 = v57;
  sub_235F4CA2C();
  v42 = v58;
  MEMORY[0x23B7E6780](v41, 0.5);
  v43 = *(void (**)(char *, uint64_t))(v6 + 8);
  v44 = v59;
  v43(v41, v59);
  aBlock[4] = (uint64_t)sub_235F33648;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_235F34E88;
  aBlock[3] = (uint64_t)&block_descriptor_76;
  v45 = _Block_copy(aBlock);
  v46 = v60;
  sub_235F4CA14();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_235F1BE00((unint64_t *)&qword_256394D80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D88);
  sub_235F1BF90((unint64_t *)&qword_256394D90, &qword_256394D88, MEMORY[0x24BEE12C8]);
  v47 = v63;
  v48 = v65;
  sub_235F4CC48();
  MEMORY[0x23B7E68E8](v42, v46, v47, v45);
  _Block_release(v45);

  (*(void (**)(char *, uint64_t))(v64 + 8))(v47, v48);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v46, v62);
  return ((uint64_t (*)(char *, uint64_t))v43)(v42, v44);
}

id sub_235F33648()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  id result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_shortcutsNamesDictionary);
  v1 = sub_235F4CA5C();

  v2 = *(_QWORD *)(v1 + 16);
  result = (id)swift_bridgeObjectRelease();
  if (v2)
    return objc_msgSend((id)objc_opt_self(), sel_setAvsFeatureEnabled_, 1);
  return result;
}

uint64_t AVSCoordinatorObject.deinit()
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
  void (*v9)(uint64_t, uint64_t);

  v1 = v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__navigationPath;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563954F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_235F1BD10(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
  v3 = v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__recordingMagnitudes;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563954A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__enrollmentsRecorded;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563954C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__isRecording;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563954D8);
  v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__cacheAVSfeatureEnabled, v8);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_235F1BF08(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_currentEnroller, &qword_256395558);
  return v0;
}

uint64_t AVSCoordinatorObject.__deallocating_deinit()
{
  AVSCoordinatorObject.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_235F3387C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AVSCoordinatorObject(0);
  result = sub_235F4C390();
  *a1 = result;
  return result;
}

uint64_t sub_235F338B8(void *a1)
{
  return sub_235F32A0C(a1);
}

uint64_t AVSCoordinatorObject.enrollmentDidComplete(VASingleEnrollmentData:)(uint8_t *a1)
{
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  unint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t (*v47)(char *, uint64_t, uint64_t);
  int v48;
  uint64_t result;
  char *v50;
  char *v51;
  void (*v52)(char *, uint64_t);
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  char *v56;
  char *v57;
  NSObject *v58;
  os_log_type_t v59;
  _BOOL4 v60;
  uint8_t *v61;
  char *v62;
  uint8_t *v63;
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  void (*v66)(char *, uint8_t *, uint64_t);
  unint64_t *v67;
  unint64_t v68;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  char v79;
  void (*v80)(char *, uint64_t);
  char *v81;
  NSObject *v82;
  os_log_type_t v83;
  uint8_t *v84;
  uint8_t *v85;
  void (*v86)(char *, uint64_t);
  char *v87;
  uint64_t v88;
  unint64_t *v89;
  unint64_t v90;
  char v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  NSObject *v97;
  os_log_type_t v98;
  char *v99;
  uint8_t *v100;
  char *v101;
  uint64_t v102;
  NSObject *v103;
  os_log_type_t v104;
  uint8_t *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  NSObject *v112;
  os_log_type_t v113;
  uint8_t *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  char *v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  char *v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  char *v139;
  char *v140;
  char *v141;
  char *v142;
  uint64_t v143;
  char *v144;
  char *v145;
  void (*v146)(char *, uint64_t);
  char *v147;
  uint64_t v148;
  char *v149;
  unint64_t *v150;
  char *v151;
  uint64_t v152;
  char *v153;
  uint64_t v154;
  uint64_t v155;
  uint8_t *v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  __int128 aBlock;
  __int128 v164;
  uint64_t (*v165)();
  uint64_t v166;
  uint64_t v167;

  v156 = a1;
  v137 = sub_235F4C9FC();
  v136 = *(_QWORD *)(v137 - 8);
  MEMORY[0x24BDAC7A8](v137);
  v135 = (char *)&v124 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v134 = sub_235F4CA20();
  v133 = *(_QWORD *)(v134 - 8);
  MEMORY[0x24BDAC7A8](v134);
  v132 = (char *)&v124 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = sub_235F4CA08();
  v130 = *(_QWORD *)(v131 - 8);
  MEMORY[0x24BDAC7A8](v131);
  v129 = (char *)&v124 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v152 = sub_235F4C2C4();
  v148 = *(_QWORD *)(v152 - 8);
  v5 = MEMORY[0x24BDAC7A8](v152);
  v147 = (char *)&v124 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v151 = (char *)&v124 - v7;
  v167 = sub_235F4C33C();
  v146 = *(void (**)(char *, uint64_t))(v167 - 8);
  v8 = MEMORY[0x24BDAC7A8](v167);
  v141 = (char *)&v124 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v142 = (char *)&v124 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v149 = (char *)&v124 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v139 = (char *)&v124 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v144 = (char *)&v124 - v16;
  v17 = sub_235F4C1C8();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v127 = (char *)&v124 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v126 = (char *)&v124 - v21;
  v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563950E0);
  MEMORY[0x24BDAC7A8](v155);
  v23 = (char *)&v124 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_235F4C294();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v138 = (char *)&v124 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v140 = (char *)&v124 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v145 = (char *)&v124 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v124 - v32;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394F38);
  v35 = MEMORY[0x24BDAC7A8](v34);
  v153 = (char *)&v124 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)&v124 - v38;
  MEMORY[0x24BDAC7A8](v37);
  v41 = (char *)&v124 - v40;
  v143 = v1;
  v42 = (unint64_t *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allCollectedEnrollments);
  swift_beginAccess();
  v150 = v42;
  v43 = *v42;
  v44 = *(_QWORD *)(*v42 + 16);
  v157 = v24;
  v154 = v25;
  if (v44)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v25 + 16))(v33, v43+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(_QWORD *)(v25 + 72) * (v44 - 1), v24);
    sub_235F4C27C();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v33, v24);
    v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v45(v41, 0, 1, v17);
  }
  else
  {
    v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v45(v41, 1, 1, v17);
  }
  sub_235F4C27C();
  v45(v39, 0, 1, v17);
  v46 = (uint64_t)&v23[*(int *)(v155 + 48)];
  sub_235F1BEC4((uint64_t)v41, (uint64_t)v23, &qword_256394F38);
  sub_235F1BEC4((uint64_t)v39, v46, &qword_256394F38);
  v47 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  v48 = v47(v23, 1, v17);
  v128 = v18;
  if (v48 == 1)
  {
    sub_235F1BF08((uint64_t)v39, &qword_256394F38);
    sub_235F1BF08((uint64_t)v41, &qword_256394F38);
    if (v47((char *)v46, 1, v17) == 1)
      return sub_235F1BF08((uint64_t)v23, &qword_256394F38);
  }
  else
  {
    v50 = v153;
    sub_235F1BEC4((uint64_t)v23, (uint64_t)v153, &qword_256394F38);
    if (v47((char *)v46, 1, v17) != 1)
    {
      v51 = v126;
      (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v126, v46, v17);
      sub_235F1BE00(&qword_256395110, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      LODWORD(v155) = sub_235F4CA68();
      v52 = *(void (**)(char *, uint64_t))(v18 + 8);
      v52(v51, v17);
      sub_235F1BF08((uint64_t)v39, &qword_256394F38);
      sub_235F1BF08((uint64_t)v41, &qword_256394F38);
      v52(v50, v17);
      result = sub_235F1BF08((uint64_t)v23, &qword_256394F38);
      if ((v155 & 1) != 0)
        return result;
      goto LABEL_11;
    }
    sub_235F1BF08((uint64_t)v39, &qword_256394F38);
    sub_235F1BF08((uint64_t)v41, &qword_256394F38);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v50, v17);
  }
  sub_235F1BF08((uint64_t)v23, &qword_2563950E0);
LABEL_11:
  v125 = v17;
  if (qword_256394AA0 != -1)
    swift_once();
  v53 = v167;
  v54 = __swift_project_value_buffer(v167, (uint64_t)qword_256395488);
  swift_beginAccess();
  v55 = v146;
  v56 = (char *)*((_QWORD *)v146 + 2);
  v57 = v144;
  v155 = v54;
  v153 = v56;
  ((void (*)(char *, uint64_t, uint64_t))v56)(v144, v54, v53);
  v58 = sub_235F4C324();
  v59 = sub_235F4CBA0();
  v60 = os_log_type_enabled(v58, v59);
  v61 = v156;
  v62 = v145;
  if (v60)
  {
    v63 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v63 = 0;
    _os_log_impl(&dword_235F17000, v58, v59, "Enrollment did complete", v63, 2u);
    MEMORY[0x23B7E711C](v63, -1, -1);
  }

  v64 = (void (*)(char *, uint64_t))*((_QWORD *)v55 + 1);
  v64(v57, v53);
  v65 = v154;
  v66 = *(void (**)(char *, uint8_t *, uint64_t))(v154 + 16);
  v66(v62, v61, v157);
  v67 = v150;
  swift_beginAccess();
  v68 = *v67;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v67 = v68;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v68 = sub_235F27CB0(0, *(_QWORD *)(v68 + 16) + 1, 1, v68);
    *v150 = v68;
  }
  v71 = *(_QWORD *)(v68 + 16);
  v70 = *(_QWORD *)(v68 + 24);
  v146 = v64;
  if (v71 >= v70 >> 1)
  {
    v68 = sub_235F27CB0(v70 > 1, v71 + 1, 1, v68);
    *v150 = v68;
  }
  *(_QWORD *)(v68 + 16) = v71 + 1;
  v144 = (char *)((*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80));
  v72 = *(_QWORD *)(v65 + 72);
  v73 = v62;
  v74 = v157;
  v150 = *(unint64_t **)(v65 + 32);
  ((void (*)(char *, char *, uint64_t))v150)(&v144[v68 + v72 * v71], v73, v157);
  swift_endAccess();
  v75 = v151;
  sub_235F4C288();
  v76 = v148;
  v77 = v147;
  v78 = v152;
  (*(void (**)(char *, _QWORD, uint64_t))(v148 + 104))(v147, *MEMORY[0x24BEC0D10], v152);
  v79 = sub_235F4C2AC();
  v80 = *(void (**)(char *, uint64_t))(v76 + 8);
  v80(v77, v78);
  v80(v75, v78);
  if ((v79 & 1) != 0)
  {
    v81 = v139;
    ((void (*)(char *, uint64_t, uint64_t))v153)(v139, v155, v167);
    v82 = sub_235F4C324();
    v83 = sub_235F4CBA0();
    if (os_log_type_enabled(v82, v83))
    {
      v84 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v84 = 0;
      _os_log_impl(&dword_235F17000, v82, v83, "Data for enrollment was successfully collected", v84, 2u);
      v85 = v84;
      v61 = v156;
      MEMORY[0x23B7E711C](v85, -1, -1);
    }

    v86 = v146;
    v146(v81, v167);
    v87 = v140;
    v66(v140, v61, v157);
    v88 = v143;
    v89 = (unint64_t *)(v143
                             + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allSuccessfulEnrollments);
    swift_beginAccess();
    v90 = *v89;
    v91 = swift_isUniquelyReferenced_nonNull_native();
    *v89 = v90;
    if ((v91 & 1) == 0)
    {
      v90 = sub_235F27CB0(0, *(_QWORD *)(v90 + 16) + 1, 1, v90);
      *v89 = v90;
    }
    v93 = *(_QWORD *)(v90 + 16);
    v92 = *(_QWORD *)(v90 + 24);
    if (v93 >= v92 >> 1)
    {
      v90 = sub_235F27CB0(v92 > 1, v93 + 1, 1, v90);
      *v89 = v90;
    }
    *(_QWORD *)(v90 + 16) = v93 + 1;
    ((void (*)(char *, char *, uint64_t))v150)(&v144[v90 + v93 * v72], v87, v157);
    swift_endAccess();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_235F4C3CC();
    swift_release();
    result = swift_release();
    v94 = aBlock + 1;
    if (__OFADD__((_QWORD)aBlock, 1))
    {
      __break(1u);
      return result;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    *(_QWORD *)&aBlock = v94;
    swift_retain();
    sub_235F4C3D8();
    v95 = v167;
  }
  else
  {
    v95 = v167;
    ((void (*)(char *, uint64_t, uint64_t))v153)(v149, v155, v167);
    v96 = v138;
    v66(v138, v61, v74);
    v97 = sub_235F4C324();
    v98 = sub_235F4CB88();
    if (os_log_type_enabled(v97, v98))
    {
      v99 = v96;
      v100 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v100 = 134217984;
      v156 = v100 + 4;
      v101 = v151;
      sub_235F4C288();
      v102 = sub_235F4C2B8();
      v80(v101, v152);
      (*(void (**)(char *, uint64_t))(v154 + 8))(v99, v74);
      *(_QWORD *)&aBlock = v102;
      v95 = v167;
      sub_235F4CBF4();
      _os_log_impl(&dword_235F17000, v97, v98, "Data for enrollment was unsuccessful with status: %ld", v100, 0xCu);
      MEMORY[0x23B7E711C](v100, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v154 + 8))(v96, v74);
    }
    v88 = v143;

    v86 = v146;
    v146(v149, v95);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  if ((uint64_t)aBlock >= 3)
  {
    ((void (*)(char *, uint64_t, uint64_t))v153)(v142, v155, v95);
    v112 = sub_235F4C324();
    v113 = sub_235F4CBA0();
    if (os_log_type_enabled(v112, v113))
    {
      v114 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v114 = 0;
      _os_log_impl(&dword_235F17000, v112, v113, "Collected max number of enrollments. Setting audio enrollments to verifier model and saving data.", v114, 2u);
      MEMORY[0x23B7E711C](v114, -1, -1);
    }

    v86(v142, v95);
    sub_235F26110(0, (unint64_t *)&qword_256394D78);
    v115 = v130;
    v116 = v129;
    v117 = v131;
    (*(void (**)(char *, _QWORD, uint64_t))(v130 + 104))(v129, *MEMORY[0x24BEE5490], v131);
    v118 = (void *)sub_235F4CBD0();
    (*(void (**)(char *, uint64_t))(v115 + 8))(v116, v117);
    v165 = sub_235F37FDC;
    v166 = v88;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v164 = sub_235F34E88;
    *((_QWORD *)&v164 + 1) = &block_descriptor_1;
    v119 = _Block_copy(&aBlock);
    swift_retain();
    v120 = v132;
    sub_235F4CA14();
    v162 = MEMORY[0x24BEE4AF8];
    sub_235F1BE00((unint64_t *)&qword_256394D80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256394D88);
    sub_235F1BF90((unint64_t *)&qword_256394D90, &qword_256394D88, MEMORY[0x24BEE12C8]);
    v121 = v135;
    v122 = v137;
    sub_235F4CC48();
    MEMORY[0x23B7E6900](0, v120, v121, v119);
    _Block_release(v119);

    (*(void (**)(char *, uint64_t))(v136 + 8))(v121, v122);
    (*(void (**)(char *, uint64_t))(v133 + 8))(v120, v134);
    return swift_release();
  }
  else
  {
    ((void (*)(char *, uint64_t, uint64_t))v153)(v141, v155, v95);
    v103 = sub_235F4C324();
    v104 = sub_235F4CBA0();
    if (os_log_type_enabled(v103, v104))
    {
      v105 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v105 = 0;
      _os_log_impl(&dword_235F17000, v103, v104, "Starting collection of next enrollment", v105, 2u);
      MEMORY[0x23B7E711C](v105, -1, -1);
    }

    v86(v141, v95);
    v106 = v88 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
    swift_beginAccess();
    v107 = v128;
    v108 = v127;
    v109 = v125;
    (*(void (**)(char *, uint64_t, uint64_t))(v128 + 16))(v127, v106, v125);
    *(_QWORD *)&aBlock = sub_235F4C1B0();
    *((_QWORD *)&aBlock + 1) = v110;
    v160 = 45;
    v161 = 0xE100000000000000;
    v158 = 0;
    v159 = 0xE000000000000000;
    sub_235F1EA80();
    sub_235F4CC24();
    swift_bridgeObjectRelease();
    sub_235F4CAA4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v107 + 8))(v108, v109);
    v111 = (_QWORD *)(v88 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory);
    swift_beginAccess();
    if (*v111)
    {
      swift_retain();
      sub_235F4C2D0();
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      v165 = 0;
      aBlock = 0u;
      v164 = 0u;
    }
    v123 = v88 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_currentEnroller;
    swift_beginAccess();
    sub_235F36B28((uint64_t)&aBlock, v123, &qword_256395558);
    return swift_endAccess();
  }
}

uint64_t sub_235F34AE8(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v2 = sub_235F4C33C();
  MEMORY[0x24BDAC7A8](v2);
  v3 = (uint64_t *)(a1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allSuccessfulEnrollments);
  swift_beginAccess();
  v4 = *v3;
  v5 = a1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  v6 = objc_allocWithZone((Class)AVSStore);
  swift_bridgeObjectRetain();
  v7 = objc_msgSend(v6, sel_init);
  v8 = sub_235F4C1B0();
  v10 = _sSo8AVSStoreC22AdaptiveVoiceShortcutsE33saveShortcutEnrollmentDataToFiles10shortcutId_SSSgSS_Say0C7Actions08VASinglegH0VGtF_0(v8, v9, v4);
  v12 = v11;
  v13 = (_QWORD *)(v5 + *(int *)(type metadata accessor for AdaptiveVoiceShortcut() + 24));
  *v13 = v10;
  v13[1] = v12;
  swift_endAccess();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_verifierModel))
  {
    swift_retain();
    swift_bridgeObjectRetain();
    sub_235F4C228();
    swift_bridgeObjectRelease();
    swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3D8();
  return sub_235F3BE0C();
}

uint64_t sub_235F34E88(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_235F34EB4(uint8_t *a1)
{
  return AVSCoordinatorObject.enrollmentDidComplete(VASingleEnrollmentData:)(a1);
}

uint64_t sub_235F34ED4()
{
  uint64_t v0;

  type metadata accessor for AVSCoordinatorObject(0);
  v0 = swift_allocObject();
  AVSCoordinatorObject.init()();
  return v0;
}

uint64_t sub_235F34F0C@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for AVSEnrollmentCoordinatorView(0) + 24));
  v5 = *v3;
  v4 = v3[1];
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v4;
  *a2 = sub_235F39CE0;
  a2[1] = (uint64_t (*)())v6;
  return swift_retain();
}

uint64_t sub_235F34F70(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (**v6)();
  uint64_t result;

  v4 = *a1;
  v3 = a1[1];
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  v6 = (uint64_t (**)())(a2 + *(int *)(type metadata accessor for AVSEnrollmentCoordinatorView(0) + 24));
  swift_retain();
  result = swift_release();
  *v6 = sub_235F39CE0;
  v6[1] = (uint64_t (*)())v5;
  return result;
}

uint64_t AVSEnrollmentCoordinatorView.completionHandler.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for AVSEnrollmentCoordinatorView(0) + 24));
  swift_retain();
  return v1;
}

uint64_t AVSEnrollmentCoordinatorView.completionHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for AVSEnrollmentCoordinatorView(0) + 24));
  result = swift_release();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*AVSEnrollmentCoordinatorView.completionHandler.modify())()
{
  type metadata accessor for AVSEnrollmentCoordinatorView(0);
  return nullsub_1;
}

uint64_t AVSEnrollmentCoordinatorView.init(completionHandler:axActionsDictionary:systemActionsDictionary:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v17;

  *(_QWORD *)(a5 + 8) = 0;
  *(_QWORD *)a5 = sub_235F34ED4;
  *(_BYTE *)(a5 + 16) = 0;
  v10 = type metadata accessor for AVSEnrollmentCoordinatorView(0);
  v11 = (uint64_t *)(a5 + *(int *)(v10 + 20));
  *v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395560);
  swift_storeEnumTagMultiPayload();
  v12 = (_QWORD *)(a5 + *(int *)(v10 + 24));
  *v12 = a1;
  v12[1] = a2;
  v13 = qword_256394AB0;
  swift_retain();
  if (v13 != -1)
    swift_once();
  v14 = qword_256398360;
  v17 = (_QWORD *)sub_235F2FC48(a3);
  swift_bridgeObjectRetain();
  sub_235F36BB4(&v17);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v14 + 16) = v17;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v15 = qword_256398360;
  v17 = (_QWORD *)sub_235F2FC48(a4);
  swift_bridgeObjectRetain();
  sub_235F36BB4(&v17);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v15 + 24) = v17;
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t AVSEnrollmentCoordinatorView.body.getter@<X0>(uint64_t a1@<X8>)
{
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
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (**v19)();
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD v24[3];
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  ValueMetadata *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;

  v2 = v1;
  v31 = a1;
  v3 = type metadata accessor for AVSEnrollmentCoordinatorView(0);
  v28 = *(_QWORD *)(v3 - 8);
  v4 = *(_QWORD *)(v28 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v26 = (uint64_t)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395568);
  v29 = *(_QWORD *)(v5 - 8);
  v30 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395570);
  MEMORY[0x24BDAC7A8](v27);
  v25 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AVSCoordinatorObject(0);
  sub_235F1BE00(&qword_256395578, type metadata accessor for AVSCoordinatorObject, (uint64_t)&protocol conformance descriptor for AVSCoordinatorObject);
  sub_235F4C450();
  swift_getKeyPath();
  sub_235F4C4C8();
  swift_release();
  swift_release();
  v39 = v41;
  v40 = v42;
  v32 = v1;
  v24[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_256395500);
  v24[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_256395580);
  sub_235F1BF90(&qword_256395588, &qword_256395500, MEMORY[0x24BEE12B8]);
  sub_235F1BF90(&qword_256395590, &qword_256395500, MEMORY[0x24BEE12D8]);
  sub_235F1BF90(&qword_256395598, &qword_256395500, MEMORY[0x24BEE12E8]);
  v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563955A0);
  v10 = sub_235F3805C(&qword_2563955A8, &qword_2563955A0, sub_235F38038, sub_235F38240);
  v11 = sub_235F382EC();
  v33 = v9;
  v34 = &type metadata for AVSCoordinatorObject.Stage;
  v35 = v9;
  v36 = v10;
  v37 = v11;
  v38 = v10;
  swift_getOpaqueTypeConformance2();
  sub_235F4C4EC();
  v12 = v26;
  sub_235F25368(v2, v26, type metadata accessor for AVSEnrollmentCoordinatorView);
  v13 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  v14 = swift_allocObject();
  v15 = v12;
  sub_235F253C8(v12, v14 + v13, type metadata accessor for AVSEnrollmentCoordinatorView);
  v16 = v29;
  v17 = v30;
  v18 = (uint64_t)v25;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v25, v7, v30);
  v19 = (uint64_t (**)())(v18 + *(int *)(v27 + 36));
  *v19 = sub_235F38334;
  v19[1] = (uint64_t (*)())v14;
  v19[2] = 0;
  v19[3] = 0;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  sub_235F25368(v2, v15, type metadata accessor for AVSEnrollmentCoordinatorView);
  v20 = swift_allocObject();
  sub_235F253C8(v15, v20 + v13, type metadata accessor for AVSEnrollmentCoordinatorView);
  v21 = v31;
  sub_235F1BEC4(v18, v31, &qword_256395570);
  v22 = (_QWORD *)(v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256395628) + 36));
  *v22 = 0;
  v22[1] = 0;
  v22[2] = sub_235F38418;
  v22[3] = v20;
  return sub_235F1BF08(v18, &qword_256395570);
}

uint64_t sub_235F35610@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235F4C3CC();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_235F35688(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE v11[15];
  char v12;

  v2 = type metadata accessor for AVSEnrollmentCoordinatorView(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563955A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = 0;
  sub_235F35818((uint64_t)&v12, (uint64_t)v7);
  sub_235F25368(a1, (uint64_t)&v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], type metadata accessor for AVSEnrollmentCoordinatorView);
  v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v9 = swift_allocObject();
  sub_235F253C8((uint64_t)&v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v9 + v8, type metadata accessor for AVSEnrollmentCoordinatorView);
  sub_235F3805C(&qword_2563955A8, &qword_2563955A0, sub_235F38038, sub_235F38240);
  sub_235F382EC();
  sub_235F4C840();
  swift_release();
  return sub_235F1BF08((uint64_t)v7, &qword_2563955A0);
}

void sub_235F35818(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;

  v16 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394F38);
  v4 = MEMORY[0x24BDAC7A8](v3);
  MEMORY[0x24BDAC7A8](v4);
  v10 = type metadata accessor for AVSCommandShortcutActionView(0);
  v5 = MEMORY[0x24BDAC7A8](v10);
  MEMORY[0x24BDAC7A8](v5);
  v9[4] = (char *)v9 - v6;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395A50);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395A58);
  MEMORY[0x24BDAC7A8](v11);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395A60);
  MEMORY[0x24BDAC7A8](v8);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563955C8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563955B8);
  MEMORY[0x24BDAC7A8](v14);
  __asm { BR              X10 }
}

uint64_t sub_235F35A5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v3 = v0;
  type metadata accessor for AVSCoordinatorObject(0);
  sub_235F1BE00(&qword_256395578, type metadata accessor for AVSCoordinatorObject, (uint64_t)&protocol conformance descriptor for AVSCoordinatorObject);
  sub_235F4C444();
  *(_QWORD *)(v2 - 320) = sub_235F4C4BC();
  *(_QWORD *)(v2 - 312) = v4;
  *(_OWORD *)(v2 - 304) = 0u;
  *(_OWORD *)(v2 - 288) = 0u;
  *(_OWORD *)(v2 - 272) = 0u;
  *(_OWORD *)(v2 - 256) = 0u;
  *(_OWORD *)(v2 - 240) = 0u;
  *(_QWORD *)(v2 - 224) = 0;
  *(_BYTE *)(v2 - 216) = 1;
  sub_235F381B8();
  sub_235F381FC();
  swift_retain();
  sub_235F4C63C();
  v5 = *(_QWORD *)(v2 - 112);
  v6 = *(_BYTE *)(v2 - 104);
  v7 = *(_OWORD *)(v2 - 192);
  *(_OWORD *)v1 = *(_OWORD *)(v2 - 208);
  *(_OWORD *)(v1 + 16) = v7;
  v8 = *(_OWORD *)(v2 - 160);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(v2 - 176);
  *(_OWORD *)(v1 + 48) = v8;
  v9 = *(_OWORD *)(v2 - 128);
  *(_OWORD *)(v1 + 64) = *(_OWORD *)(v2 - 144);
  *(_OWORD *)(v1 + 80) = v9;
  *(_QWORD *)(v1 + 96) = v5;
  *(_BYTE *)(v1 + 104) = v6;
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563955E8);
  sub_235F380CC();
  sub_235F38194();
  sub_235F4C63C();
  sub_235F1BEC4(v3, *(_QWORD *)(v2 - 336), &qword_2563955B8);
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395608);
  sub_235F38038();
  sub_235F38240();
  sub_235F4C63C();
  sub_235F1BF08(v3, &qword_2563955B8);
  return swift_release();
}

uint64_t sub_235F36688(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t (**v8)();
  uint64_t v10;

  v2 = type metadata accessor for AVSEnrollmentCoordinatorView(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  type metadata accessor for AVSCoordinatorObject(0);
  sub_235F1BE00(&qword_256395578, type metadata accessor for AVSCoordinatorObject, (uint64_t)&protocol conformance descriptor for AVSCoordinatorObject);
  v5 = sub_235F4C444();
  sub_235F25368(a1, (uint64_t)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVSEnrollmentCoordinatorView);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  sub_235F253C8((uint64_t)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for AVSEnrollmentCoordinatorView);
  v8 = (uint64_t (**)())(v5 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  *v8 = sub_235F39D04;
  v8[1] = (uint64_t (*)())v7;
  swift_release();
  return swift_release();
}

uint64_t sub_235F367D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = sub_235F4C498();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AVSEnrollmentCoordinatorView(0);
  sub_235F368E4((uint64_t)v5);
  sub_235F4C48C();
  v7 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(uint64_t))(a1 + *(int *)(v6 + 24)))(v7);
}

uint64_t type metadata accessor for AVSCoordinatorObject(uint64_t a1)
{
  return sub_235F20914(a1, (uint64_t *)&unk_256395660);
}

uint64_t sub_235F3689C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F368E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;

  v2 = v1;
  v4 = sub_235F4C5A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395560);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F1BEC4(v2, (uint64_t)v10, &qword_256395560);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_235F4C498();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_235F4CB94();
    v14 = sub_235F4C6FC();
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19[1] = a1;
      v18 = v17;
      v20 = v17;
      *(_DWORD *)v16 = 136315138;
      v19[2] = sub_235F43930(0x417373696D736944, 0xED00006E6F697463, &v20);
      sub_235F4CBF4();
      _os_log_impl(&dword_235F17000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7E711C](v18, -1, -1);
      MEMORY[0x23B7E711C](v16, -1, -1);
    }

    sub_235F4C594();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_235F36B28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_235F36B6C@<X0>(_QWORD *a1@<X8>)
{
  return sub_235F35610(a1);
}

uint64_t sub_235F36B90()
{
  return sub_235F25894();
}

uint64_t sub_235F36BB4(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(type metadata accessor for AvailableShortcutAction() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)sub_235F44DB0(v3);
  v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_235F36C34(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_235F36C34(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
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
  _QWORD *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  BOOL v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  char v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
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
  uint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t *v156;

  v152 = type metadata accessor for AvailableShortcutAction();
  v147 = *(_QWORD *)(v152 - 8);
  v2 = MEMORY[0x24BDAC7A8](v152);
  v143 = (uint64_t)&v135 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v153 = (uint64_t)&v135 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v135 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v135 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v145 = (uint64_t)&v135 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v144 = (uint64_t)&v135 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v140 = (uint64_t)&v135 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v139 = (uint64_t)&v135 - v18;
  v156 = a1;
  v19 = a1[1];
  result = sub_235F4CE04();
  if (result >= v19)
  {
    if (v19 < 0)
      goto LABEL_154;
    if (v19)
      return sub_235F376E0(0, v19, 1, v156);
    return result;
  }
  if (v19 >= 0)
    v21 = v19;
  else
    v21 = v19 + 1;
  if (v19 < -1)
    goto LABEL_162;
  v149 = v11;
  v150 = v8;
  v137 = result;
  if (v19 < 2)
  {
    v25 = (char *)MEMORY[0x24BEE4AF8];
    v146 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v147 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v147 + 80));
    v136 = MEMORY[0x24BEE4AF8];
    if (v19 != 1)
    {
      v27 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_120:
      v127 = v25;
      if (v27 >= 2)
      {
        v128 = *v156;
        do
        {
          v129 = v27 - 2;
          if (v27 < 2)
            goto LABEL_149;
          if (!v128)
            goto LABEL_161;
          v130 = *(_QWORD *)&v127[16 * v129 + 32];
          v131 = *(_QWORD *)&v127[16 * v27 + 24];
          v132 = v148;
          sub_235F37954(v128 + *(_QWORD *)(v147 + 72) * v130, v128 + *(_QWORD *)(v147 + 72) * *(_QWORD *)&v127[16 * v27 + 16], v128 + *(_QWORD *)(v147 + 72) * v131, v146);
          v148 = v132;
          if (v132)
            break;
          if (v131 < v130)
            goto LABEL_150;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v127 = sub_235F44CD0((uint64_t)v127);
          if (v129 >= *((_QWORD *)v127 + 2))
            goto LABEL_151;
          v133 = &v127[16 * v129 + 32];
          *(_QWORD *)v133 = v130;
          *((_QWORD *)v133 + 1) = v131;
          v134 = *((_QWORD *)v127 + 2);
          if (v27 > v134)
            goto LABEL_152;
          memmove(&v127[16 * v27 + 16], &v127[16 * v27 + 32], 16 * (v134 - v27));
          *((_QWORD *)v127 + 2) = v134 - 1;
          v27 = v134 - 1;
        }
        while (v134 > 2);
      }
LABEL_131:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v136 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v22 = v21 >> 1;
    v23 = sub_235F4CB10();
    *(_QWORD *)(v23 + 16) = v22;
    v24 = *(unsigned __int8 *)(v147 + 80);
    v136 = v23;
    v146 = v23 + ((v24 + 32) & ~v24);
  }
  v26 = 0;
  v25 = (char *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v28 = v26;
    v29 = v26 + 1;
    if (v26 + 1 >= v19)
      break;
    v30 = *v156;
    v31 = *(_QWORD *)(v147 + 72);
    v32 = v139;
    sub_235F25368(*v156 + v31 * v29, v139, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
    v151 = v30;
    v155 = v31;
    v33 = v30 + v31 * v28;
    v34 = v140;
    sub_235F25368(v33, v140, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
    v35 = *(int *)(v152 + 20);
    v36 = *(_QWORD *)(v32 + v35);
    v37 = *(_QWORD *)(v32 + v35 + 8);
    v38 = (_QWORD *)(v34 + v35);
    if (v36 == *v38 && v37 == v38[1])
      LODWORD(v154) = 0;
    else
      LODWORD(v154) = sub_235F4CE1C();
    sub_235F1BD10(v140, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
    sub_235F1BD10(v139, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
    v26 = v28 + 2;
    if (v28 + 2 < v19)
    {
      v40 = v28;
      v138 = v25;
      v41 = v155 * v29;
      v42 = v151;
      v43 = v155 * v26;
      while (1)
      {
        v44 = v144;
        sub_235F25368(v42 + v43, v144, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
        v45 = v145;
        sub_235F25368(v42 + v41, v145, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
        v46 = *(int *)(v152 + 20);
        v47 = *(_QWORD *)(v44 + v46);
        v48 = *(_QWORD *)(v44 + v46 + 8);
        v49 = (_QWORD *)(v45 + v46);
        v50 = v47 == *v49 && v48 == v49[1];
        v51 = v50 ? 0 : sub_235F4CE1C();
        sub_235F1BD10(v145, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
        sub_235F1BD10(v144, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
        if (((v154 ^ v51) & 1) != 0)
          break;
        v42 += v155;
        if (v19 == ++v26)
        {
          v26 = v19;
          break;
        }
      }
      v25 = v138;
      v28 = v40;
    }
    if ((v154 & 1) == 0)
      goto LABEL_48;
    if (v26 < v28)
      goto LABEL_155;
    if (v28 >= v26)
      goto LABEL_48;
    v154 = v19;
    v138 = v25;
    v52 = 0;
    v53 = v155 * (v26 - 1);
    v54 = v28;
    v55 = v26 * v155;
    v56 = v54;
    v142 = v54;
    v57 = v54 * v155;
    v58 = (uint64_t)v150;
    do
    {
      if (v56 != v26 + v52 - 1)
      {
        v59 = v151;
        if (!v151)
          goto LABEL_160;
        v60 = v151 + v57;
        sub_235F253C8(v151 + v57, v143, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
        if (v57 < v53 || v60 >= v59 + v55)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v57 != v53)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        sub_235F253C8(v143, v59 + v53, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
        v58 = (uint64_t)v150;
      }
      ++v56;
      --v52;
      v53 -= v155;
      v55 -= v155;
      v57 += v155;
    }
    while (v56 < v26 + v52);
    v25 = v138;
    v19 = v154;
    v28 = v142;
    if (v26 < v154)
      goto LABEL_49;
LABEL_72:
    if (v26 < v28)
      goto LABEL_148;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v25 = sub_235F44A24(0, *((_QWORD *)v25 + 2) + 1, 1, v25);
    v75 = *((_QWORD *)v25 + 2);
    v74 = *((_QWORD *)v25 + 3);
    v27 = v75 + 1;
    v76 = v28;
    if (v75 >= v74 >> 1)
      v25 = sub_235F44A24((char *)(v74 > 1), v75 + 1, 1, v25);
    *((_QWORD *)v25 + 2) = v27;
    v77 = v25 + 32;
    v78 = &v25[16 * v75 + 32];
    *(_QWORD *)v78 = v76;
    *((_QWORD *)v78 + 1) = v26;
    if (v75)
    {
      while (1)
      {
        v79 = v27 - 1;
        if (v27 >= 4)
        {
          v84 = &v77[16 * v27];
          v85 = *((_QWORD *)v84 - 8);
          v86 = *((_QWORD *)v84 - 7);
          v90 = __OFSUB__(v86, v85);
          v87 = v86 - v85;
          if (v90)
            goto LABEL_137;
          v89 = *((_QWORD *)v84 - 6);
          v88 = *((_QWORD *)v84 - 5);
          v90 = __OFSUB__(v88, v89);
          v82 = v88 - v89;
          v83 = v90;
          if (v90)
            goto LABEL_138;
          v91 = v27 - 2;
          v92 = &v77[16 * v27 - 32];
          v94 = *(_QWORD *)v92;
          v93 = *((_QWORD *)v92 + 1);
          v90 = __OFSUB__(v93, v94);
          v95 = v93 - v94;
          if (v90)
            goto LABEL_140;
          v90 = __OFADD__(v82, v95);
          v96 = v82 + v95;
          if (v90)
            goto LABEL_143;
          if (v96 >= v87)
          {
            v114 = &v77[16 * v79];
            v116 = *(_QWORD *)v114;
            v115 = *((_QWORD *)v114 + 1);
            v90 = __OFSUB__(v115, v116);
            v117 = v115 - v116;
            if (v90)
              goto LABEL_147;
            v107 = v82 < v117;
            goto LABEL_109;
          }
        }
        else
        {
          if (v27 != 3)
          {
            v108 = *((_QWORD *)v25 + 4);
            v109 = *((_QWORD *)v25 + 5);
            v90 = __OFSUB__(v109, v108);
            v101 = v109 - v108;
            v102 = v90;
            goto LABEL_103;
          }
          v81 = *((_QWORD *)v25 + 4);
          v80 = *((_QWORD *)v25 + 5);
          v90 = __OFSUB__(v80, v81);
          v82 = v80 - v81;
          v83 = v90;
        }
        if ((v83 & 1) != 0)
          goto LABEL_139;
        v91 = v27 - 2;
        v97 = &v77[16 * v27 - 32];
        v99 = *(_QWORD *)v97;
        v98 = *((_QWORD *)v97 + 1);
        v100 = __OFSUB__(v98, v99);
        v101 = v98 - v99;
        v102 = v100;
        if (v100)
          goto LABEL_142;
        v103 = &v77[16 * v79];
        v105 = *(_QWORD *)v103;
        v104 = *((_QWORD *)v103 + 1);
        v90 = __OFSUB__(v104, v105);
        v106 = v104 - v105;
        if (v90)
          goto LABEL_145;
        if (__OFADD__(v101, v106))
          goto LABEL_146;
        if (v101 + v106 >= v82)
        {
          v107 = v82 < v106;
LABEL_109:
          if (v107)
            v79 = v91;
          goto LABEL_111;
        }
LABEL_103:
        if ((v102 & 1) != 0)
          goto LABEL_141;
        v110 = &v77[16 * v79];
        v112 = *(_QWORD *)v110;
        v111 = *((_QWORD *)v110 + 1);
        v90 = __OFSUB__(v111, v112);
        v113 = v111 - v112;
        if (v90)
          goto LABEL_144;
        if (v113 < v101)
          goto LABEL_14;
LABEL_111:
        v118 = v79 - 1;
        if (v79 - 1 >= v27)
        {
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
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
          goto LABEL_157;
        }
        if (!*v156)
          goto LABEL_159;
        v119 = v26;
        v120 = v25;
        v121 = &v77[16 * v118];
        v122 = *(_QWORD *)v121;
        v123 = &v77[16 * v79];
        v124 = *((_QWORD *)v123 + 1);
        v125 = v148;
        sub_235F37954(*v156 + *(_QWORD *)(v147 + 72) * *(_QWORD *)v121, *v156 + *(_QWORD *)(v147 + 72) * *(_QWORD *)v123, *v156 + *(_QWORD *)(v147 + 72) * v124, v146);
        v148 = v125;
        if (v125)
          goto LABEL_131;
        if (v124 < v122)
          goto LABEL_134;
        if (v79 > *((_QWORD *)v120 + 2))
          goto LABEL_135;
        *(_QWORD *)v121 = v122;
        *(_QWORD *)&v77[16 * v118 + 8] = v124;
        v126 = *((_QWORD *)v120 + 2);
        if (v79 >= v126)
          goto LABEL_136;
        v25 = v120;
        v27 = v126 - 1;
        memmove(&v77[16 * v79], v123 + 16, 16 * (v126 - 1 - v79));
        *((_QWORD *)v120 + 2) = v126 - 1;
        v26 = v119;
        if (v126 <= 2)
          goto LABEL_14;
      }
    }
    v27 = 1;
LABEL_14:
    v19 = v156[1];
    if (v26 >= v19)
      goto LABEL_120;
  }
  ++v26;
LABEL_48:
  v58 = (uint64_t)v150;
  if (v26 >= v19)
    goto LABEL_72;
LABEL_49:
  if (__OFSUB__(v26, v28))
    goto LABEL_153;
  if (v26 - v28 >= v137)
    goto LABEL_72;
  if (__OFADD__(v28, v137))
    goto LABEL_156;
  if (v28 + v137 >= v19)
    v61 = v19;
  else
    v61 = v28 + v137;
  if (v61 >= v28)
  {
    if (v26 != v61)
    {
      v138 = v25;
      v151 = *(_QWORD *)(v147 + 72);
      v154 = v26 * v151;
      v155 = v151 * (v26 - 1);
      v141 = v61;
      v142 = v28;
      do
      {
        v62 = 0;
        v63 = v28;
        while (1)
        {
          v64 = *v156;
          v65 = (uint64_t)v149;
          sub_235F25368(v154 + v62 + *v156, (uint64_t)v149, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
          sub_235F25368(v155 + v62 + v64, v58, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
          v66 = *(int *)(v152 + 20);
          v67 = *(_QWORD *)(v65 + v66);
          v68 = *(_QWORD *)(v65 + v66 + 8);
          v69 = (_QWORD *)(v58 + v66);
          if (v67 == *v69 && v68 == v69[1])
            break;
          v71 = sub_235F4CE1C();
          sub_235F1BD10(v58, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
          sub_235F1BD10(v65, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
          if ((v71 & 1) == 0)
            goto LABEL_59;
          v72 = *v156;
          if (!*v156)
            goto LABEL_158;
          v73 = v72 + v155 + v62;
          sub_235F253C8(v72 + v154 + v62, v153, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
          swift_arrayInitWithTakeFrontToBack();
          sub_235F253C8(v153, v73, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
          v58 = (uint64_t)v150;
          v62 -= v151;
          if (v26 == ++v63)
            goto LABEL_59;
        }
        sub_235F1BD10(v58, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
        sub_235F1BD10(v65, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
LABEL_59:
        ++v26;
        v155 += v151;
        v154 += v151;
        v28 = v142;
      }
      while (v26 != v141);
      v26 = v141;
      v25 = v138;
    }
    goto LABEL_72;
  }
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  result = sub_235F4CD14();
  __break(1u);
  return result;
}

uint64_t sub_235F376E0(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
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
  char v25;
  uint64_t v26;
  char *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v32 = a1;
  v36 = type metadata accessor for AvailableShortcutAction();
  v7 = MEMORY[0x24BDAC7A8](v36);
  v37 = (uint64_t)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v30 - v10;
  result = MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)&v30 - v14;
  v35 = a3;
  v31 = a2;
  if (a3 != a2)
  {
    v16 = *(_QWORD *)(v13 + 72);
    v39 = v16 * (v35 - 1);
    v34 = v16;
    v38 = v16 * v35;
    v33 = (char *)&v30 - v14;
LABEL_6:
    v17 = 0;
    v18 = v32;
    while (1)
    {
      v19 = *a4;
      sub_235F25368(v38 + v17 + *a4, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
      sub_235F25368(v39 + v17 + v19, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
      v20 = *(int *)(v36 + 20);
      v21 = *(_QWORD *)&v15[v20];
      v22 = *(_QWORD *)&v15[v20 + 8];
      v23 = &v11[v20];
      if (v21 == *(_QWORD *)v23 && v22 == *((_QWORD *)v23 + 1))
      {
        sub_235F1BD10((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
        result = sub_235F1BD10((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
LABEL_5:
        v39 += v34;
        v38 += v34;
        if (++v35 == v31)
          return result;
        goto LABEL_6;
      }
      v25 = sub_235F4CE1C();
      sub_235F1BD10((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
      result = sub_235F1BD10((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
      if ((v25 & 1) == 0)
        goto LABEL_5;
      v26 = *a4;
      if (!*a4)
        break;
      v27 = v11;
      v28 = a4;
      v29 = v26 + v39 + v17;
      sub_235F253C8(v26 + v38 + v17, v37, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
      swift_arrayInitWithTakeFrontToBack();
      result = sub_235F253C8(v37, v29, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
      v17 -= v34;
      ++v18;
      a4 = v28;
      v11 = v27;
      v15 = v33;
      if (v35 == v18)
        goto LABEL_5;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_235F37954(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  char v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t result;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;

  v54 = type metadata accessor for AvailableShortcutAction();
  v8 = MEMORY[0x24BDAC7A8](v54);
  v53 = (unint64_t)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v52 = (uint64_t)&v51 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v51 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v51 - v16;
  v18 = *(_QWORD *)(v15 + 72);
  if (!v18)
  {
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  v19 = *(_QWORD *)(v15 + 72);
  if (a2 - a1 == 0x8000000000000000 && v19 == -1)
    goto LABEL_72;
  v20 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v18 == -1)
    goto LABEL_73;
  v21 = (uint64_t)(a2 - a1) / v18;
  v57 = a1;
  v56 = a4;
  v22 = v20 / v18;
  if (v21 >= v20 / v19)
  {
    if ((v22 & 0x8000000000000000) == 0)
    {
      v24 = v22 * v19;
      if (a4 < a2 || a2 + v24 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v35 = a4 + v24;
      v55 = a4 + v24;
      v57 = a2;
      if (v24 >= 1 && a1 < a2)
      {
        v37 = -v19;
        do
        {
          v38 = a1;
          v39 = v52;
          sub_235F25368(v35 + v37, v52, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
          v40 = a2 + v37;
          v41 = v53;
          sub_235F25368(a2 + v37, v53, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
          v42 = *(int *)(v54 + 20);
          v43 = *(_QWORD *)(v39 + v42);
          v44 = *(_QWORD *)(v39 + v42 + 8);
          v45 = (_QWORD *)(v41 + v42);
          if (v43 == *v45 && v44 == v45[1])
            v47 = 0;
          else
            v47 = sub_235F4CE1C();
          v48 = a3 + v37;
          sub_235F1BD10(v53, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
          sub_235F1BD10(v52, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
          if ((v47 & 1) != 0)
          {
            if (a3 < a2 || v48 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              a1 = v38;
            }
            else
            {
              a1 = v38;
              if (a3 != a2)
                swift_arrayInitWithTakeBackToFront();
            }
            v57 += v37;
          }
          else
          {
            v49 = v55;
            v55 += v37;
            if (a3 < v49 || v48 >= v49)
            {
              swift_arrayInitWithTakeFrontToBack();
              v40 = a2;
              a1 = v38;
            }
            else
            {
              a1 = v38;
              if (a3 != v49)
                swift_arrayInitWithTakeBackToFront();
              v40 = a2;
            }
          }
          v35 = v55;
          if (v55 <= a4)
            break;
          a2 = v40;
          a3 += v37;
        }
        while (v40 > a1);
      }
LABEL_70:
      sub_235F44BC4(&v57, &v56, (uint64_t *)&v55);
      return 1;
    }
  }
  else if ((v21 & 0x8000000000000000) == 0)
  {
    v23 = v21 * v19;
    if (a4 < a1 || a1 + v23 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v53 = a4 + v23;
    v55 = a4 + v23;
    if (v23 >= 1 && a2 < a3)
    {
      while (1)
      {
        sub_235F25368(a2, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
        sub_235F25368(a4, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
        v26 = *(int *)(v54 + 20);
        v27 = *(_QWORD *)&v17[v26];
        v28 = *(_QWORD *)&v17[v26 + 8];
        v29 = &v14[v26];
        if (v27 == *(_QWORD *)v29 && v28 == *((_QWORD *)v29 + 1))
          break;
        v31 = sub_235F4CE1C();
        sub_235F1BD10((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
        sub_235F1BD10((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
        if ((v31 & 1) == 0)
          goto LABEL_32;
        v32 = v57;
        v33 = a2 + v19;
        if (v57 < a2 || v57 >= v33)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v57 == a2)
        {
          v32 = a2;
        }
        else
        {
          swift_arrayInitWithTakeBackToFront();
        }
LABEL_38:
        v57 = v32 + v19;
        a4 = v56;
        if (v56 < v53)
        {
          a2 = v33;
          if (v33 < a3)
            continue;
        }
        goto LABEL_70;
      }
      sub_235F1BD10((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
      sub_235F1BD10((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
LABEL_32:
      v32 = v57;
      v34 = v56 + v19;
      if (v57 < v56 || v57 >= v34)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v57 != v56)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v56 = v34;
      v33 = a2;
      goto LABEL_38;
    }
    goto LABEL_70;
  }
LABEL_74:
  result = sub_235F4CD50();
  __break(1u);
  return result;
}

uint64_t sub_235F37E98@<X0>(unint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  char **v2;
  char *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_235F39490((uint64_t)v5);
  v6 = *((_QWORD *)v5 + 2);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    *a2 = v5[a1 + 32];
    if ((uint64_t)(v6 - 1 - a1) >= 0)
    {
      result = (uint64_t)memmove(&v5[a1 + 32], &v5[a1 + 33], v6 - 1 - a1);
      *((_QWORD *)v5 + 2) = v7;
      *v2 = v5;
      return result;
    }
  }
  result = sub_235F4CD50();
  __break(1u);
  return result;
}

uint64_t sub_235F37F70@<X0>(_BYTE *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) != 0)
  {
    v5 = *(_QWORD *)(v3 + 16);
    if (v5)
    {
LABEL_3:
      v6 = v5 - 1;
      *a1 = *(_BYTE *)(v3 + v6 + 32);
      *(_QWORD *)(v3 + 16) = v6;
      *v1 = v3;
      return result;
    }
  }
  else
  {
    result = (uint64_t)sub_235F39490(v3);
    v3 = result;
    v5 = *(_QWORD *)(result + 16);
    if (v5)
      goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t sub_235F37FDC()
{
  uint64_t v0;

  return sub_235F34AE8(v0);
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

uint64_t type metadata accessor for AVSEnrollmentCoordinatorView(uint64_t a1)
{
  return sub_235F20914(a1, (uint64_t *)&unk_2563959E8);
}

uint64_t sub_235F38010()
{
  return sub_235F4C588();
}

uint64_t sub_235F38030()
{
  uint64_t v0;

  return sub_235F35688(*(_QWORD *)(v0 + 16));
}

uint64_t sub_235F38038()
{
  return sub_235F3805C(&qword_2563955B0, &qword_2563955B8, (uint64_t (*)(void))sub_235F380CC, sub_235F38194);
}

uint64_t sub_235F3805C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDEF3E0], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_235F380CC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2563955C0;
  if (!qword_2563955C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563955C8);
    v2[0] = sub_235F38150();
    v2[1] = sub_235F1BE00(&qword_2563955D8, type metadata accessor for AVSCommandShortcutActionView, (uint64_t)&unk_235F4DAC8);
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2563955C0);
  }
  return result;
}

unint64_t sub_235F38150()
{
  unint64_t result;

  result = qword_2563955D0;
  if (!qword_2563955D0)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4ED28, &type metadata for AVSCommandRecordingView);
    atomic_store(result, (unint64_t *)&qword_2563955D0);
  }
  return result;
}

uint64_t sub_235F38194()
{
  return sub_235F3805C(&qword_2563955E0, &qword_2563955E8, (uint64_t (*)(void))sub_235F381B8, (uint64_t (*)(void))sub_235F381FC);
}

unint64_t sub_235F381B8()
{
  unint64_t result;

  result = qword_2563955F0;
  if (!qword_2563955F0)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4D91C, &type metadata for AVSCommandNameView);
    atomic_store(result, (unint64_t *)&qword_2563955F0);
  }
  return result;
}

unint64_t sub_235F381FC()
{
  unint64_t result;

  result = qword_2563955F8;
  if (!qword_2563955F8)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E2B8, &type metadata for AVSWelcomeView);
    atomic_store(result, (unint64_t *)&qword_2563955F8);
  }
  return result;
}

uint64_t sub_235F38240()
{
  return sub_235F3805C(&qword_256395600, &qword_256395608, (uint64_t (*)(void))sub_235F38264, (uint64_t (*)(void))sub_235F382A8);
}

unint64_t sub_235F38264()
{
  unint64_t result;

  result = qword_256395610;
  if (!qword_256395610)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4D844, &type metadata for AVSConfirmationView);
    atomic_store(result, (unint64_t *)&qword_256395610);
  }
  return result;
}

unint64_t sub_235F382A8()
{
  unint64_t result;

  result = qword_256395618;
  if (!qword_256395618)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4F018, &type metadata for AVSAudioDonationView);
    atomic_store(result, (unint64_t *)&qword_256395618);
  }
  return result;
}

unint64_t sub_235F382EC()
{
  unint64_t result;

  result = qword_256395620;
  if (!qword_256395620)
  {
    result = MEMORY[0x23B7E7098](&protocol conformance descriptor for AVSCoordinatorObject.Stage, &type metadata for AVSCoordinatorObject.Stage);
    atomic_store(result, (unint64_t *)&qword_256395620);
  }
  return result;
}

uint64_t sub_235F38334()
{
  return sub_235F39D10(sub_235F36688);
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = type metadata accessor for AVSEnrollmentCoordinatorView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  sub_235F1C2BC();
  v3 = v0 + ((v2 + 16) & ~v2) + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395560);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_235F4C498();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F38418()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = type metadata accessor for AVSEnrollmentCoordinatorView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  return (*(uint64_t (**)(void))(v0 + *(int *)(v1 + 24) + ((v2 + 16) & ~v2)))();
}

unint64_t sub_235F38460()
{
  unint64_t result;

  result = qword_256395630;
  if (!qword_256395630)
  {
    result = MEMORY[0x23B7E7098](&protocol conformance descriptor for AVSCoordinatorObject.Stage, &type metadata for AVSCoordinatorObject.Stage);
    atomic_store(result, (unint64_t *)&qword_256395630);
  }
  return result;
}

uint64_t sub_235F384A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235F384B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235F30A84(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__recordingMagnitudes, &qword_2563954A8);
}

uint64_t sub_235F384D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235F30AF0(a1, a2, a3, a4, &qword_2563954B0, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__recordingMagnitudes, &qword_2563954A8);
}

uint64_t sub_235F38504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235F30A84(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__enrollmentsRecorded, &qword_2563954C0);
}

uint64_t sub_235F38528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235F30AF0(a1, a2, a3, a4, &qword_2563954C8, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__enrollmentsRecorded, &qword_2563954C0);
}

uint64_t sub_235F38554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235F30A84(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__isRecording, &qword_2563954D8);
}

uint64_t sub_235F38578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235F30AF0(a1, a2, a3, a4, &qword_2563954E0, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__isRecording, &qword_2563954D8);
}

uint64_t sub_235F385A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235F30A84(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__cacheAVSfeatureEnabled, &qword_2563954D8);
}

uint64_t sub_235F385C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235F30AF0(a1, a2, a3, a4, &qword_2563954E0, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__cacheAVSfeatureEnabled, &qword_2563954D8);
}

uint64_t sub_235F385FC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory);
  swift_beginAccess();
  *a2 = *v3;
  return swift_retain();
}

uint64_t sub_235F3865C()
{
  return type metadata accessor for AVSCoordinatorObject(0);
}

void sub_235F38664()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_235F389D0(319, &qword_256395670, &qword_256395500);
  if (v0 <= 0x3F)
  {
    type metadata accessor for AdaptiveVoiceShortcut();
    if (v1 <= 0x3F)
    {
      sub_235F389D0(319, &qword_256395678, &qword_256395538);
      if (v2 <= 0x3F)
      {
        sub_235F38A1C(319, &qword_256395680);
        if (v3 <= 0x3F)
        {
          sub_235F38A1C(319, qword_256395688);
          if (v4 <= 0x3F)
            swift_updateClassMetadata2();
        }
      }
    }
  }
}

uint64_t method lookup function for AVSCoordinatorObject()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AVSCoordinatorObject.recordingMagnitudes.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.recordingMagnitudes.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.recordingMagnitudes.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$recordingMagnitudes.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$recordingMagnitudes.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$recordingMagnitudes.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.enrollmentsRecorded.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.enrollmentsRecorded.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.enrollmentsRecorded.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$enrollmentsRecorded.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$enrollmentsRecorded.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$enrollmentsRecorded.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.isRecording.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.isRecording.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.isRecording.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$isRecording.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$isRecording.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$isRecording.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.cacheAVSfeatureEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.cacheAVSfeatureEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.cacheAVSfeatureEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$cacheAVSfeatureEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$cacheAVSfeatureEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$cacheAVSfeatureEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.dismissEnrollmentFlow.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.dismissEnrollmentFlow.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.dismissEnrollmentFlow.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 480))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.enrollerFactory.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 560))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.enrollerFactory.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 568))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.enrollerFactory.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 576))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 608))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.startStreamingEnrollment()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 616))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.dumpEnrollment(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 624))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.stopStreamingEnrollment()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 640))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.saveName(name:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 648))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.saveAssociatedShortcut(shortcut:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 656))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.finishEnrollment()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 664))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.navigateToNextView()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 672))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.navigateBack()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 680))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.navigateToRestartEnrollment()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 688))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.enableAudioDonation()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 696))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.resetEnrollmentData()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 704))();
}

void sub_235F389D0(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_235F4C3E4();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_235F38A1C(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_235F4C3E4();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t getEnumTagSinglePayload for AVSCoordinatorObject.Stage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AVSCoordinatorObject.Stage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_235F38B3C + 4 * byte_235F4DF11[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_235F38B70 + 4 * byte_235F4DF0C[v4]))();
}

uint64_t sub_235F38B70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F38B78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235F38B80);
  return result;
}

uint64_t sub_235F38B8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235F38B94);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_235F38B98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F38BA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AVSCoordinatorObject.Stage()
{
  return &type metadata for AVSCoordinatorObject.Stage;
}

uint64_t initializeBufferWithCopyOfBuffer for AVSEnrollmentCoordinatorView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v14 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    v9 = *((_BYTE *)a2 + 16);
    sub_235F1C264();
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v8;
    *(_BYTE *)(a1 + 16) = v9;
    v10 = *(int *)(a3 + 20);
    v11 = (_QWORD *)(a1 + v10);
    v12 = (uint64_t *)((char *)a2 + v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256395560);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_235F4C498();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v15 = *(int *)(a3 + 24);
    v16 = (_QWORD *)(a1 + v15);
    v17 = (uint64_t *)((char *)a2 + v15);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
  }
  swift_retain();
  return a1;
}

uint64_t destroy for AVSEnrollmentCoordinatorView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_235F1C2BC();
  v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395560);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_235F4C498();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

uint64_t initializeWithCopy for AVSEnrollmentCoordinatorView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  sub_235F1C264();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  v9 = *(int *)(a3 + 20);
  v10 = (_QWORD *)(a1 + v9);
  v11 = (uint64_t *)((char *)a2 + v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395560);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_235F4C498();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  }
  else
  {
    *v10 = *v11;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v13 = *(int *)(a3 + 24);
  v14 = (_QWORD *)(a1 + v13);
  v15 = (uint64_t *)((char *)a2 + v13);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AVSEnrollmentCoordinatorView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  sub_235F1C264();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  sub_235F1C2BC();
  if ((uint64_t *)a1 != a2)
  {
    v9 = *(int *)(a3 + 20);
    v10 = (_QWORD *)(a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    sub_235F1BF08(a1 + v9, &qword_256395560);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256395560);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_235F4C498();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v13 = *(int *)(a3 + 24);
  v14 = (_QWORD *)(a1 + v13);
  v15 = (uint64_t *)((char *)a2 + v13);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for AVSEnrollmentCoordinatorView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(int *)(a3 + 20);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395560);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_235F4C498();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for AVSEnrollmentCoordinatorView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v6;
  sub_235F1C2BC();
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 20);
    v8 = (void *)(a1 + v7);
    v9 = (const void *)(a2 + v7);
    sub_235F1BF08(a1 + v7, &qword_256395560);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395560);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_235F4C498();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AVSEnrollmentCoordinatorView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235F3912C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395988);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for AVSEnrollmentCoordinatorView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_235F391BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256395988);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

void sub_235F3923C()
{
  unint64_t v0;

  sub_235F392BC();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_235F392BC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2563959F8[0])
  {
    sub_235F4C498();
    v0 = sub_235F4C438();
    if (!v1)
      atomic_store(v0, qword_2563959F8);
  }
}

unint64_t sub_235F39314()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256395A30;
  if (!qword_256395A30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256395628);
    v2[0] = sub_235F39380();
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256395A30);
  }
  return result;
}

unint64_t sub_235F39380()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256395A38;
  if (!qword_256395A38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256395570);
    v2[0] = sub_235F1BF90(&qword_256395A40, &qword_256395568, MEMORY[0x24BDED358]);
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256395A38);
  }
  return result;
}

uint64_t sub_235F39404()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_235F39430()
{
  uint64_t v0;

  return sub_235F32F20(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_235F39438(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_235F3947C(unint64_t a1)
{
  return sub_235F27ED0(0, *(_QWORD *)(a1 + 16), 0, a1);
}

char *sub_235F39490(uint64_t a1)
{
  return sub_235F27BA4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_235F394A4(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 64);
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
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
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

uint64_t sub_235F3952C(uint64_t a1, int64_t a2)
{
  unint64_t *v2;
  unint64_t v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(_QWORD *)(v4 + 24) >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_235F27ED0(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  v12 = *(_QWORD *)(type metadata accessor for AdaptiveVoiceShortcut() - 8);
  v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v14 * a1;
  v16 = v13 + v14 * a1;
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_25;
  v18 = *(_QWORD *)(v4 + 16);
  v19 = v18 - a2;
  if (__OFSUB__(v18, a2))
    goto LABEL_31;
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      result = swift_arrayInitWithTakeBackToFront();
    }
    v21 = *(_QWORD *)(v4 + 16);
    v22 = __OFADD__(v21, v8);
    v23 = v21 - v7;
    if (!v22)
    {
      *(_QWORD *)(v4 + 16) = v23;
LABEL_25:
      *v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  result = sub_235F4CD50();
  __break(1u);
  return result;
}

uint64_t sub_235F396D4(uint64_t a1, uint64_t a2)
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

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
      if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v21 = sub_235F4CD20();
  swift_bridgeObjectRelease();
  if (v21 < v2)
    goto LABEL_31;
LABEL_4:
  v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v7 = sub_235F4CD20();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v12 = sub_235F4CD20();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62)
    goto LABEL_34;
  v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 - v6;
  if (__OFADD__(v7, v5))
    goto LABEL_36;
LABEL_8:
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_37;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x23B7E69F0](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  sub_235F26110(0, (unint64_t *)&qword_256395A48);
  swift_arrayDestroy();
  if (!v5)
    return sub_235F4CAF8();
  if (!(*v3 >> 62))
  {
    v15 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v16 = v15 - v2;
    if (!__OFSUB__(v15, v2))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v22 = sub_235F4CD20();
  swift_bridgeObjectRelease();
  v16 = v22 - v2;
  if (__OFSUB__(v22, v2))
    goto LABEL_40;
LABEL_21:
  if ((v16 & 0x8000000000000000) == 0)
  {
    v17 = (char *)(v13 + 8 * v2);
    if (v4 != v2 || v14 >= &v17[8 * v16])
      memmove(v14, v17, 8 * v16);
    if (!(*v3 >> 62))
    {
      v18 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      v19 = v18 + v5;
      if (!__OFADD__(v18, v5))
      {
LABEL_27:
        *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v19;
        return sub_235F4CAF8();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v23 = sub_235F4CD20();
    swift_bridgeObjectRelease();
    v19 = v23 + v5;
    if (!__OFADD__(v23, v5))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_235F4CD50();
  __break(1u);
  return result;
}

uint64_t sub_235F399DC(void *a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t i;
  int v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t j;
  id v18;
  int v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;

  if (objc_msgSend(a1, sel_floatChannelData)
    || (v4 = a1, (v3 = (id)convertToFloat32PCM(buffer:)(*(AVAudioPCMBuffer *)(&v2 - 1))) == 0))
  {
    v3 = a1;
  }
  v5 = v3;
  v6 = objc_msgSend(v3, sel_magnitudesWithLevelMultiplier_count_, 53, 10.0);
  if (!v6)
    goto LABEL_28;
  v7 = v6;
  sub_235F26110(0, (unint64_t *)&qword_256395A48);
  v8 = sub_235F4CAEC();

  if (!v8)
    goto LABEL_28;
  v26 = v8;
  if (!(v8 >> 62))
  {
    if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10) > 3uLL)
      goto LABEL_8;
LABEL_25:
    swift_bridgeObjectRelease();
LABEL_28:

    return MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v23 = sub_235F4CD20();
  swift_bridgeObjectRelease();
  if (v23 < 4)
    goto LABEL_25;
  swift_bridgeObjectRetain();
  v24 = sub_235F4CD20();
  swift_bridgeObjectRelease();
  if (v24 < 3)
  {
    __break(1u);
    goto LABEL_25;
  }
LABEL_8:
  sub_235F396D4(0, 3);
  if (!(v8 >> 62))
  {
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_10;
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  v9 = sub_235F4CD20();
  if (!v9)
  {
LABEL_27:
    swift_bridgeObjectRelease_n();
    goto LABEL_28;
  }
LABEL_10:
  v25 = MEMORY[0x24BEE4AF8];
  result = sub_235F2595C(0, v9 & ~(v9 >> 63), 0);
  if ((v9 & 0x8000000000000000) == 0)
  {
    v11 = v25;
    if ((v26 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v9; ++i)
      {
        MEMORY[0x23B7E69E4](i, v26);
        sub_235F4CB70();
        v14 = v13;
        swift_unknownObjectRelease();
        v16 = *(_QWORD *)(v25 + 16);
        v15 = *(_QWORD *)(v25 + 24);
        if (v16 >= v15 >> 1)
          sub_235F2595C(v15 > 1, v16 + 1, 1);
        *(_QWORD *)(v25 + 16) = v16 + 1;
        *(_DWORD *)(v25 + 4 * v16 + 32) = v14;
      }
    }
    else
    {
      for (j = 0; j != v9; ++j)
      {
        v18 = *(id *)(v26 + 8 * j + 32);
        sub_235F4CB70();
        v20 = v19;

        v22 = *(_QWORD *)(v25 + 16);
        v21 = *(_QWORD *)(v25 + 24);
        if (v22 >= v21 >> 1)
          sub_235F2595C(v21 > 1, v22 + 1, 1);
        *(_QWORD *)(v25 + 16) = v22 + 1;
        *(_DWORD *)(v25 + 4 * v22 + 32) = v20;
      }
    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_235F39CBC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F39CE0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_235F39D04()
{
  return sub_235F39D10(sub_235F367D8);
}

uint64_t sub_235F39D10(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AVSEnrollmentCoordinatorView(0) - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

void sub_235F39D50(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v4;

  type metadata accessor for AVSEnrollmentCoordinatorView(0);
  v4 = *a1;
  sub_235F35818((uint64_t)&v4, a2);
}

ValueMetadata *type metadata accessor for AVSWelcomeView()
{
  return &type metadata for AVSWelcomeView;
}

uint64_t sub_235F39DE4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235F39DF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v19[4];
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v19[3] = a1;
  v24 = a2;
  v2 = sub_235F4C2F4();
  v20 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC0);
  MEMORY[0x24BDAC7A8](v5);
  v22 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395A80);
  v21 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256394AA8 != -1)
    swift_once();
  v9 = (void *)qword_256398358;
  if (qword_256398358)
  {
    v10 = (id)qword_256398358;
  }
  else
  {
    v10 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v9 = 0;
  }
  v11 = v9;
  v12 = sub_235F4C108();
  v19[1] = v13;
  v19[2] = v12;

  sub_235F3DA44(0xD000000000000013);
  v14 = (void *)qword_256398358;
  if (qword_256398358)
  {
    v15 = (id)qword_256398358;
  }
  else
  {
    v15 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v14 = 0;
  }
  v16 = v14;
  sub_235F4C108();

  v17 = swift_bridgeObjectRelease();
  MEMORY[0x24BDAC7A8](v17);
  v25 = MEMORY[0x24BEE4AF8];
  sub_235F1BE00(&qword_256394AE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFF7C8], MEMORY[0x24BDFF7E0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394AF0);
  sub_235F1BF90(&qword_256394AF8, &qword_256394AF0, MEMORY[0x24BEE12C8]);
  sub_235F4CC48();
  sub_235F4C960();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395A88);
  sub_235F3A970();
  sub_235F4C2E8();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v21 + 32))(v24, v8, v23);
}

uint64_t sub_235F3A1C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v30 = a1;
  v35 = a3;
  v4 = sub_235F4C684();
  v33 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394B20);
  v31 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394B28);
  v10 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395A88);
  v34 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v30;
  *(_QWORD *)(v16 + 24) = a2;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394B30);
  sub_235F1BD7C();
  sub_235F4C93C();
  sub_235F4C678();
  sub_235F1BF90(&qword_256394B50, &qword_256394B20, MEMORY[0x24BDF43B0]);
  sub_235F1BE00(&qword_256394B58, (uint64_t (*)(uint64_t))MEMORY[0x24BDF0DA8], MEMORY[0x24BDF0D88]);
  sub_235F4C804();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v7);
  v17 = sub_235F4C738();
  sub_235F4C3FC();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = v32;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v15, v12, v32);
  v27 = &v15[*(int *)(v13 + 36)];
  *v27 = v17;
  *((_QWORD *)v27 + 1) = v19;
  *((_QWORD *)v27 + 2) = v21;
  *((_QWORD *)v27 + 3) = v23;
  *((_QWORD *)v27 + 4) = v25;
  v27[40] = 0;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v26);
  v28 = v35;
  sub_235F3AA8C((uint64_t)v15, v35);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v34 + 56))(v28, 0, 1, v13);
}

uint64_t sub_235F3A498@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  v16 = sub_235F4C5B8();
  sub_235F3A564((uint64_t)&v17);
  v2 = v17;
  v3 = v18;
  v4 = v19;
  v5 = v20;
  v6 = v21;
  v7 = v22;
  v8 = v23;
  v9 = v24;
  v10 = sub_235F4C75C();
  result = sub_235F4C3FC();
  *(_QWORD *)a1 = v16;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = v2;
  *(_BYTE *)(a1 + 32) = v3;
  *(_QWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 48) = v5;
  *(_BYTE *)(a1 + 56) = v6;
  *(_QWORD *)(a1 + 64) = v7;
  *(_QWORD *)(a1 + 72) = v8;
  *(_BYTE *)(a1 + 80) = v9;
  *(_BYTE *)(a1 + 88) = v10;
  *(_QWORD *)(a1 + 96) = v12;
  *(_QWORD *)(a1 + 104) = v13;
  *(_QWORD *)(a1 + 112) = v14;
  *(_QWORD *)(a1 + 120) = v15;
  *(_BYTE *)(a1 + 128) = 0;
  return result;
}

uint64_t sub_235F3A564@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;

  sub_235F4C5F4();
  if (qword_256394AA8 != -1)
    swift_once();
  v2 = (void *)qword_256398358;
  if (!qword_256398358)
    v3 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v4 = v2;
  v5 = sub_235F4C7BC();
  v7 = v6;
  v9 = v8 & 1;
  v10 = sub_235F4C7B0();
  v12 = v11;
  v14 = v13;
  v16 = v15 & 1;
  sub_235F1BF54(v5, v7, v9);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 24) = v12;
  *(_BYTE *)(a1 + 32) = v16;
  *(_QWORD *)(a1 + 40) = v14;
  *(_QWORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 56) = 1;
  sub_235F1BF44(v10, v12, v16);
  swift_bridgeObjectRetain();
  sub_235F1BF54(v10, v12, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_235F3A6F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  return sub_235F4C93C();
}

uint64_t sub_235F3A76C(uint64_t a1, uint64_t a2)
{
  void (**v2)(uint64_t);
  void (*v3)(uint64_t);
  uint64_t v4;

  v2 = (void (**)(uint64_t))(a2
                                     + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  v3 = *v2;
  v4 = swift_retain();
  v3(v4);
  return swift_release();
}

uint64_t sub_235F3A7D0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[16];
  uint64_t v9;
  uint64_t v10;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395A68);
  MEMORY[0x24BDAC7A8](v1);
  v3 = &v8[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = *v0;
  v4 = v0[1];
  *(_QWORD *)v3 = sub_235F4C630();
  *((_QWORD *)v3 + 1) = 0;
  v3[16] = 1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395A70);
  sub_235F39DF4(v5, (uint64_t)&v3[*(int *)(v6 + 44)]);
  v9 = v5;
  v10 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394C60);
  sub_235F1BF90(&qword_256395A78, &qword_256395A68, MEMORY[0x24BDF4700]);
  sub_235F1BF90(&qword_256394C70, &qword_256394C60, MEMORY[0x24BDF43B0]);
  sub_235F4C888();
  return sub_235F3A8FC((uint64_t)v3);
}

uint64_t sub_235F3A8F4()
{
  uint64_t v0;

  return sub_235F3A6F0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_235F3A8FC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395A68);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_235F3A93C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F3A960()
{
  uint64_t v0;

  return sub_235F3A76C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_235F3A968@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235F3A1C4(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_235F3A970()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v5[6];

  result = qword_256395A90;
  if (!qword_256395A90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256395A88);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394B20);
    v3 = sub_235F4C684();
    v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF0DA8];
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = sub_235F1BF90(&qword_256394B50, &qword_256394B20, MEMORY[0x24BDF43B0]);
    v5[5] = sub_235F1BE00(&qword_256394B58, v4, MEMORY[0x24BDF0D88]);
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256395A90);
  }
  return result;
}

uint64_t sub_235F3AA60()
{
  swift_retain();
  sub_235F322FC();
  return swift_release();
}

uint64_t sub_235F3AA8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395A88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F3AAD4()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256395A68);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394C60);
  sub_235F1BF90(&qword_256395A78, &qword_256395A68, MEMORY[0x24BDF4700]);
  sub_235F1BF90(&qword_256394C70, &qword_256394C60, MEMORY[0x24BDF43B0]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235F3AB78()
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
  char *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  void *v32;
  uint64_t i;
  id v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v43;
  id v44;
  void *v45;
  void *v46;
  unsigned int v47;
  id v48;
  id v49;
  unsigned int v50;
  id v51;
  id v52;
  uint64_t v53;
  id v54;
  id v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  _QWORD *v60;
  id v61;
  void *v62;
  _QWORD *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  unsigned int v68;
  id v69;
  id v70;
  void *v71;
  uint64_t v72;
  id v73;
  id v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  uint64_t v78;
  _QWORD *v79;
  id v80;
  uint64_t v81;
  void *v82;
  _QWORD *v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  uint64_t v88;
  char *v89;
  id v90;
  id v91;
  NSObject *v92;
  os_log_type_t v93;
  uint8_t *v94;
  _QWORD *v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint8_t *v99;
  id v100;
  uint64_t v101;
  id v102;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  char *v107;
  char *v108;
  uint64_t v109;
  id v110;
  char *v111;
  uint64_t v112;
  id v113[3];
  id v114[3];
  id v115[5];

  v1 = v0;
  v115[3] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_235F4C33C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v111 = (char *)&v104 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v104 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v108 = (char *)&v104 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v104 - v11;
  *(_OWORD *)(v1 + 66) = 0u;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1800]), sel_init);
  *(_QWORD *)(v1 + 16) = v13;
  v110 = (id)objc_opt_self();
  v14 = objc_msgSend(v110, sel_sharedInstance);
  *(_QWORD *)(v1 + 24) = v14;
  *(_QWORD *)(v1 + 32) = objc_msgSend(v13, sel_inputNode);
  v15 = *MEMORY[0x24BDB15A0];
  v16 = *MEMORY[0x24BDB1618];
  v115[0] = 0;
  if (objc_msgSend(v14, sel_setCategory_mode_options_error_, v15, v16, 41, v115))
  {
    v17 = v115[0];
  }
  else
  {
    v18 = v8;
    v19 = v115[0];
    v20 = (void *)sub_235F4C114();

    swift_willThrow();
    if (qword_256394AA0 != -1)
      swift_once();
    v21 = __swift_project_value_buffer(v2, (uint64_t)qword_256395488);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v12, v21, v2);
    v22 = sub_235F4C324();
    v23 = sub_235F4CB88();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_235F17000, v22, v23, "AVS unable to set audio session category to measurement mode", v24, 2u);
      MEMORY[0x23B7E711C](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
    v8 = v18;
  }
  v25 = objc_msgSend(*(id *)(v1 + 24), sel_availableInputs);
  if (!v25)
    goto LABEL_57;
  v26 = v25;
  sub_235F26110(0, &qword_256395C28);
  v27 = sub_235F4CAEC();

  if (!(v27 >> 62))
  {
    v28 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v28)
      goto LABEL_11;
LABEL_36:
    swift_bridgeObjectRelease();
    goto LABEL_57;
  }
  swift_bridgeObjectRetain();
  v28 = sub_235F4CD20();
  swift_bridgeObjectRelease();
  if (!v28)
    goto LABEL_36;
LABEL_11:
  if ((v27 & 0xC000000000000001) != 0)
  {
    v29 = MEMORY[0x23B7E69E4](0, v27);
  }
  else
  {
    if (!*(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_39;
    }
    v29 = *(id *)(v27 + 32);
  }
  v30 = v29;
  swift_bridgeObjectRelease();
  v31 = -[NSObject dataSources](v30, sel_dataSources);
  if (!v31)
  {

    goto LABEL_57;
  }
  v32 = v31;
  v106 = v30;
  v105 = v1;
  sub_235F26110(0, &qword_256395C30);
  v28 = sub_235F4CAEC();

  v114[0] = (id)MEMORY[0x24BEE4AF8];
  if (v28 >> 62)
  {
LABEL_39:
    swift_bridgeObjectRetain();
    v1 = sub_235F4CD20();
    swift_bridgeObjectRelease();
    if (v1)
      goto LABEL_17;
LABEL_40:
    swift_bridgeObjectRelease();
    v28 = MEMORY[0x24BEE4AF8];
    goto LABEL_41;
  }
  v1 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v1)
    goto LABEL_40;
LABEL_17:
  v107 = v8;
  v109 = v3;
  v104 = v2;
  if (v1 < 1)
  {
    __break(1u);
    goto LABEL_77;
  }
  for (i = 0; i != v1; ++i)
  {
    if ((v28 & 0xC000000000000001) != 0)
      v34 = (id)MEMORY[0x23B7E69E4](i, v28);
    else
      v34 = *(id *)(v28 + 8 * i + 32);
    v35 = v34;
    v36 = objc_msgSend(v34, sel_orientation, v104);
    if (!v36)
    {
LABEL_19:

      continue;
    }
    v37 = v36;
    v38 = sub_235F4CA80();
    v40 = v39;
    if (v38 == sub_235F4CA80() && v40 == v41)
    {

      swift_bridgeObjectRelease_n();
    }
    else
    {
      v43 = sub_235F4CE1C();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v43 & 1) == 0)
        goto LABEL_19;
    }
    sub_235F4CCE4();
    sub_235F4CCFC();
    sub_235F4CD08();
    sub_235F4CCF0();
  }
  swift_bridgeObjectRelease();
  v28 = (unint64_t)v114[0];
  v2 = v104;
  v3 = v109;
  v8 = v107;
LABEL_41:
  v1 = v105;
  if ((v28 & 0x8000000000000000) != 0 || (v28 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v64 = sub_235F4CD20();
    swift_release();
    if (!v64)
      goto LABEL_56;
LABEL_44:
    if ((v28 & 0xC000000000000001) == 0)
    {
      if (!*(_QWORD *)(v28 + 16))
      {
        __break(1u);
LABEL_79:
        swift_once();
LABEL_51:
        v53 = __swift_project_value_buffer(v2, (uint64_t)qword_256395488);
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v108, v53, v2);
        v54 = (id)v1;
        v55 = (id)v1;
        v56 = sub_235F4C324();
        v57 = sub_235F4CB88();
        if (os_log_type_enabled(v56, v57))
        {
          v58 = (uint8_t *)swift_slowAlloc();
          v59 = swift_slowAlloc();
          v107 = v8;
          v60 = (_QWORD *)v59;
          *(_DWORD *)v58 = 138412290;
          v61 = (id)v1;
          v62 = (void *)_swift_stdlib_bridgeErrorToNSError();
          v114[0] = v62;
          sub_235F4CBF4();
          *v60 = v62;

          _os_log_impl(&dword_235F17000, v56, v57, "AVS unable to set prefered input data source %@", v58, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_256395408);
          swift_arrayDestroy();
          v63 = v60;
          v8 = v107;
          MEMORY[0x23B7E711C](v63, -1, -1);
          MEMORY[0x23B7E711C](v58, -1, -1);

          v56 = v106;
        }
        else
        {

        }
        (*(void (**)(char *, uint64_t))(v3 + 8))(v108, v2);
        v1 = v105;
        goto LABEL_57;
      }
      v44 = *(id *)(v28 + 32);
LABEL_47:
      v45 = v44;
      swift_release();
      v46 = *(void **)(v1 + 24);
      v114[0] = 0;
      v47 = objc_msgSend(v46, sel_setPreferredInput_error_, v106, v114);
      v48 = v114[0];
      if (v47)
      {
        v114[0] = 0;
        v49 = v48;
        v50 = objc_msgSend(v46, sel_setInputDataSource_error_, v45, v114);
        v48 = v114[0];
        if (v50)
        {
          v51 = v114[0];

          goto LABEL_57;
        }
      }
      v52 = v48;
      v1 = sub_235F4C114();

      swift_willThrow();
      if (qword_256394AA0 == -1)
        goto LABEL_51;
      goto LABEL_79;
    }
LABEL_77:
    v44 = (id)MEMORY[0x23B7E69E4](0, v28);
    goto LABEL_47;
  }
  if (*(_QWORD *)(v28 + 16))
    goto LABEL_44;
LABEL_56:

  swift_release();
LABEL_57:
  v65 = *(void **)(v1 + 24);
  v66 = (void *)sub_235F4CA74();
  v67 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, 1);
  v114[0] = 0;
  v68 = objc_msgSend(v65, sel_setMXSessionProperty_value_error_, v66, v67, v114);

  if (v68)
  {
    v69 = v114[0];
  }
  else
  {
    v70 = v114[0];
    v71 = (void *)sub_235F4C114();

    swift_willThrow();
    if (qword_256394AA0 != -1)
      swift_once();
    v72 = __swift_project_value_buffer(v2, (uint64_t)qword_256395488);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v72, v2);
    v73 = v71;
    v74 = v71;
    v75 = sub_235F4C324();
    v76 = sub_235F4CB88();
    if (os_log_type_enabled(v75, v76))
    {
      v109 = v3;
      v77 = (uint8_t *)swift_slowAlloc();
      v78 = swift_slowAlloc();
      v107 = v8;
      v79 = (_QWORD *)v78;
      *(_DWORD *)v77 = 138412290;
      v80 = v71;
      v81 = v2;
      v82 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v113[0] = v82;
      sub_235F4CBF4();
      *v79 = v82;
      v2 = v81;
      v3 = v109;

      _os_log_impl(&dword_235F17000, v75, v76, "AVS unable to set kMXSessionProperty_PrefersNoInterruptionsDuringRemoteDeviceControl on audio session %@ ", v77, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256395408);
      swift_arrayDestroy();
      v83 = v79;
      v8 = v107;
      MEMORY[0x23B7E711C](v83, -1, -1);
      MEMORY[0x23B7E711C](v77, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  v84 = *(void **)(v1 + 24);
  v113[0] = 0;
  if (objc_msgSend(v84, sel_setAllowHapticsAndSystemSoundsDuringRecording_error_, 1, v113, v104))
  {
    v85 = v113[0];
    if ((*(_BYTE *)(v1 + 81) & 1) != 0)
      return v1;
LABEL_74:
    v100 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v101 = *MEMORY[0x24BDB15D8];
    v102 = objc_msgSend(v110, sel_sharedInstance);
    objc_msgSend(v100, sel_addObserver_selector_name_object_, v1, sel_handleAudioSessionInterruptionWithNotification_, v101, v102);

    *(_BYTE *)(v1 + 81) = 1;
  }
  else
  {
    v86 = v113[0];
    v87 = (void *)sub_235F4C114();

    swift_willThrow();
    if (qword_256394AA0 != -1)
      swift_once();
    v88 = __swift_project_value_buffer(v2, (uint64_t)qword_256395488);
    swift_beginAccess();
    v89 = v111;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v111, v88, v2);
    v90 = v87;
    v91 = v87;
    v92 = sub_235F4C324();
    v93 = sub_235F4CB88();
    if (os_log_type_enabled(v92, v93))
    {
      v109 = v3;
      v94 = (uint8_t *)swift_slowAlloc();
      v95 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v94 = 138412290;
      v96 = v87;
      v97 = v2;
      v98 = _swift_stdlib_bridgeErrorToNSError();
      v112 = v98;
      sub_235F4CBF4();
      *v95 = v98;
      v2 = v97;
      v3 = v109;

      _os_log_impl(&dword_235F17000, v92, v93, "AVS unable to set allow haptics and system sounds during recording %@ ", v94, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256395408);
      swift_arrayDestroy();
      MEMORY[0x23B7E711C](v95, -1, -1);
      v99 = v94;
      v89 = v111;
      MEMORY[0x23B7E711C](v99, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v89, v2);
    if ((*(_BYTE *)(v1 + 81) & 1) == 0)
      goto LABEL_74;
  }
  return v1;
}

uint64_t sub_235F3B8F0()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  id v3;

  if (*(_BYTE *)(v0 + 81) == 1)
  {
    v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v2 = *MEMORY[0x24BDB15D8];
    v3 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    objc_msgSend(v1, sel_removeObserver_name_object_, v0, v2, v3);

    *(_BYTE *)(v0 + 81) = 0;
  }

  sub_235F1BF08(v0 + 40, &qword_256395550);
  return swift_deallocClassInstance();
}

uint64_t sub_235F3B9CC()
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
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t result;
  uint64_t v19;

  v1 = v0;
  v2 = sub_235F4C33C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v19 - v8;
  if ((*(_BYTE *)(v1 + 80) & 1) != 0)
  {
    if (qword_256394AA0 != -1)
      swift_once();
    v10 = __swift_project_value_buffer(v2, (uint64_t)qword_256395488);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v7, v10, v2);
    v11 = sub_235F4C324();
    v12 = sub_235F4CBA0();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_235F17000, v11, v12, "AVS attempted to start listening but it is already actively listening", v13, 2u);
      MEMORY[0x23B7E711C](v13, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  }
  else
  {
    sub_235F3C2DC();
    if (qword_256394AA0 != -1)
      swift_once();
    v14 = __swift_project_value_buffer(v2, (uint64_t)qword_256395488);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v14, v2);
    v15 = sub_235F4C324();
    v16 = sub_235F4CBA0();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_235F17000, v15, v16, "AVS [AVS Audio Engine] started listening successfully", v17, 2u);
      MEMORY[0x23B7E711C](v17, -1, -1);
    }

    result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    *(_BYTE *)(v1 + 80) = 1;
  }
  return result;
}

uint64_t sub_235F3BE0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t result;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  id v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  id v38[4];

  v1 = v0;
  v38[3] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_235F4C33C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v35 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v35 - v10;
  if (*(_BYTE *)(v1 + 80) == 1)
  {
    objc_msgSend(*(id *)(v1 + 32), sel_removeTapOnBus_, 0);
    objc_msgSend(*(id *)(v1 + 16), sel_stop);
    v12 = *(void **)(v1 + 24);
    v38[0] = 0;
    if (objc_msgSend(v12, sel_setActive_withOptions_error_, 0, 0, v38))
    {
      v13 = qword_256394AA0;
      v14 = v38[0];
      if (v13 != -1)
        swift_once();
      v15 = __swift_project_value_buffer(v2, (uint64_t)qword_256395488);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v11, v15, v2);
      v16 = sub_235F4C324();
      v17 = sub_235F4CBA0();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_235F17000, v16, v17, "AVS [AVS Audio Provider] stopped listening successfully", v18, 2u);
        MEMORY[0x23B7E711C](v18, -1, -1);
      }

      result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v11, v2);
      *(_BYTE *)(v1 + 80) = 0;
    }
    else
    {
      v24 = v38[0];
      v25 = (void *)sub_235F4C114();

      swift_willThrow();
      if (qword_256394AA0 != -1)
        swift_once();
      v26 = __swift_project_value_buffer(v2, (uint64_t)qword_256395488);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v26, v2);
      v27 = v25;
      v28 = v25;
      v29 = sub_235F4C324();
      v30 = sub_235F4CB88();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = (uint8_t *)swift_slowAlloc();
        v36 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v31 = 138412290;
        v32 = v25;
        v33 = _swift_stdlib_bridgeErrorToNSError();
        v37 = v33;
        sub_235F4CBF4();
        v34 = v36;
        *v36 = v33;

        _os_log_impl(&dword_235F17000, v29, v30, "AVS [AVS Audio Provider] was unable to stop listening %@", v31, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256395408);
        swift_arrayDestroy();
        MEMORY[0x23B7E711C](v34, -1, -1);
        MEMORY[0x23B7E711C](v31, -1, -1);

      }
      else
      {

      }
      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  else
  {
    if (qword_256394AA0 != -1)
      swift_once();
    v20 = __swift_project_value_buffer(v2, (uint64_t)qword_256395488);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v20, v2);
    v21 = sub_235F4C324();
    v22 = sub_235F4CBA0();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_235F17000, v21, v22, "AVS attempted to stop listening but it is not actively listening", v23, 2u);
      MEMORY[0x23B7E711C](v23, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  }
  return result;
}

void sub_235F3C2DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  NSObject *v33;
  id v34;
  id v35;
  id aBlock[7];

  aBlock[6] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = sub_235F4C33C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&aBlock[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(void **)(v0 + 24);
  aBlock[0] = 0;
  if (objc_msgSend(v5, sel_setActive_withOptions_error_, 1, 0, aBlock))
  {
    v6 = *(void **)(v0 + 16);
    v7 = aBlock[0];
    v8 = objc_msgSend(v6, sel_attachedNodes);
    sub_235F26110(0, &qword_256395C18);
    sub_235F3D8DC();
    v9 = sub_235F4CB7C();

    if ((v9 & 0xC000000000000001) != 0)
      v10 = sub_235F4CC60();
    else
      v10 = *(_QWORD *)(v9 + 16);
    swift_bridgeObjectRelease();
    if (v10 >= 1)
      objc_msgSend(*(id *)(v0 + 32), sel_removeTapOnBus_, 0);
    v12 = objc_msgSend(*(id *)(v0 + 32), sel_inputFormatForBus_, 0);
    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1818]), sel_initWithCommonFormat_sampleRate_channels_interleaved_, 3, 1, 0, 16000.0);
    if (v13)
    {
      v14 = v13;
      v15 = objc_allocWithZone(MEMORY[0x24BDB17F8]);
      v16 = v14;
      v17 = objc_msgSend(v15, sel_initFromFormat_toFormat_, v12, v16);
      if (v17)
      {
        v18 = v17;
        v35 = v6;
        v19 = *(void **)(v0 + 32);
        v20 = swift_allocObject();
        swift_weakInit();
        v21 = (_QWORD *)swift_allocObject();
        v21[2] = v16;
        v21[3] = v18;
        v21[4] = v20;
        aBlock[4] = sub_235F3D98C;
        aBlock[5] = v21;
        aBlock[0] = (id)MEMORY[0x24BDAC760];
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_235F3CCA8;
        aBlock[3] = &block_descriptor_2;
        v22 = _Block_copy(aBlock);
        v23 = v18;
        v24 = v16;
        v25 = v23;
        v26 = v19;
        v27 = v12;
        swift_release();
        objc_msgSend(v26, sel_installTapOnBus_bufferSize_format_block_, 0, 0x2000, v27, v22);
        _Block_release(v22);

        aBlock[0] = 0;
        if (objc_msgSend(v35, sel_startAndReturnError_, aBlock))
        {
          v28 = aBlock[0];

        }
        else
        {
          v34 = aBlock[0];
          sub_235F4C114();

          swift_willThrow();
        }
      }
      else
      {
        if (qword_256394AA0 != -1)
          swift_once();
        v29 = __swift_project_value_buffer(v1, (uint64_t)qword_256395488);
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v29, v1);
        v30 = sub_235F4C324();
        v31 = sub_235F4CB88();
        if (os_log_type_enabled(v30, v31))
        {
          v32 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_235F17000, v30, v31, "AVS [AVS Audio Provider] unable to create converter", v32, 2u);
          MEMORY[0x23B7E711C](v32, -1, -1);
          v33 = v12;
          v12 = v16;
        }
        else
        {
          v33 = v30;
          v30 = v16;
        }

        (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      }
    }
    else
    {

    }
  }
  else
  {
    v11 = aBlock[0];
    sub_235F4C114();

    swift_willThrow();
  }
}

void sub_235F3C774(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  double v14;
  unint64_t v15;
  id v16;
  double v17;
  double v18;
  unsigned int v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t Strong;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  id v35;
  id v36;
  _QWORD v37[3];
  uint64_t v38;
  uint64_t v39;
  id aBlock[3];
  void *v41;
  void *(*v42)(uint64_t, _QWORD *);
  uint64_t v43;
  uint64_t v44;

  v36 = a4;
  v44 = *MEMORY[0x24BDAC8D0];
  v7 = sub_235F4C33C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = 1;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = a1;
  swift_retain();
  v13 = a1;
  objc_msgSend(a3, sel_sampleRate);
  if ((~*(_QWORD *)&v14 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (v14 <= -1.0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v14 >= 4294967300.0)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v35 = a2;
  v15 = v14 * (unint64_t)objc_msgSend(v13, sel_frameLength);
  if ((v15 & 0xFFFFFFFF00000000) != 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v16 = objc_msgSend(v13, sel_format);
  objc_msgSend(v16, sel_sampleRate);
  v18 = v17;

  if ((~*(_QWORD *)&v18 & 0x7FF0000000000000) == 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v18 <= -1.0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v18 >= 4294967300.0)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (!v18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v19 = v18;
  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1838]), sel_initWithPCMFormat_frameCapacity_, a3, v15 / v19);
  if (!v20)
  {
    if (qword_256394AA0 == -1)
    {
LABEL_14:
      v30 = __swift_project_value_buffer(v7, (uint64_t)qword_256395488);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v30, v7);
      v31 = sub_235F4C324();
      v32 = sub_235F4CB88();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_235F17000, v31, v32, "AVS [AVS Audio Provider] unable to convert buffer to output format", v33, 2u);
        MEMORY[0x23B7E711C](v33, -1, -1);
        swift_release();

      }
      else
      {

        swift_release();
      }
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      swift_release();
      return;
    }
LABEL_29:
    swift_once();
    goto LABEL_14;
  }
  v21 = v20;
  v42 = sub_235F3D9EC;
  v43 = v12;
  aBlock[0] = (id)MEMORY[0x24BDAC760];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_235F3E148;
  v41 = &block_descriptor_12;
  v22 = _Block_copy(aBlock);
  swift_retain();
  v23 = v21;
  swift_release();
  aBlock[0] = 0;
  objc_msgSend(v36, sel_convertToBuffer_error_withInputFromBlock_, v23, aBlock, v22);
  _Block_release(v22);
  v24 = aBlock[0];
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v26 = Strong;
    v27 = objc_msgSend(v35, sel_hostTime);
    swift_beginAccess();
    sub_235F3D9F4(v26 + 40, (uint64_t)aBlock);
    if (v41)
    {
      sub_235F39438((uint64_t)aBlock, (uint64_t)v37);
      sub_235F1BF08((uint64_t)aBlock, &qword_256395550);
      v28 = v38;
      v29 = v39;
      __swift_project_boxed_opaque_existential_1(v37, v38);
      (*(void (**)(id, id, uint64_t, uint64_t))(v29 + 8))(v23, v27, v28, v29);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    }
    else
    {
      sub_235F1BF08((uint64_t)aBlock, &qword_256395550);
    }
    swift_release();
  }
  swift_release();

  swift_release();
}

void *sub_235F3CC1C(uint64_t a1, _QWORD *a2, uint64_t a3, void *a4)
{
  _BYTE *v7;
  id v8;

  v7 = (_BYTE *)(a3 + 16);
  swift_beginAccess();
  if (*(_BYTE *)(a3 + 16) == 1)
  {
    *a2 = 0;
    swift_beginAccess();
    *v7 = 0;
    v8 = a4;
  }
  else
  {
    a4 = 0;
    *a2 = 1;
  }
  return a4;
}

void sub_235F3CCA8(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(id, id);
  id v6;
  id v7;

  v5 = *(void (**)(id, id))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(v7, v6);
  swift_release();

}

uint64_t sub_235F3CD14(uint64_t a1)
{
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
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t result;
  _QWORD v29[4];
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;
  id v33[6];

  v29[2] = a1;
  v33[5] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = sub_235F4C120();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395410);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235F4C150();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v29 - v13;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDCD7A0], v1);
  swift_bridgeObjectRetain();
  sub_235F4C144();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  v15 = objc_allocWithZone(MEMORY[0x24BDB1810]);
  v16 = v29[3];
  v17 = sub_235F3D4E0((uint64_t)v12, 3, 0);
  if (v16)
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  v18 = v17;
  v19 = v29[1];
  v20 = objc_msgSend(v17, sel_processingFormat);
  v21 = (unint64_t)objc_msgSend(v18, sel_length);
  if ((v21 & 0x8000000000000000) == 0 && !HIDWORD(v21))
  {
    v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1838]), sel_initWithPCMFormat_frameCapacity_, v20, v21);

    if (v22)
    {
      v33[0] = 0;
      if (objc_msgSend(v18, sel_readIntoBuffer_error_, v22, v33))
      {
        v23 = v33[0];
        v24 = mach_absolute_time();
        swift_beginAccess();
        sub_235F3D9F4(v19 + 40, (uint64_t)v33);
        if (v33[3])
        {
          sub_235F39438((uint64_t)v33, (uint64_t)v30);
          sub_235F1BF08((uint64_t)v33, &qword_256395550);
          v25 = v31;
          v26 = v32;
          __swift_project_boxed_opaque_existential_1(v30, v31);
          (*(void (**)(id, uint64_t, uint64_t, uint64_t))(v26 + 8))(v22, v24, v25, v26);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
        }
        else
        {
          sub_235F1BF08((uint64_t)v33, &qword_256395550);
        }
      }
      else
      {
        v27 = v33[0];
        sub_235F4C114();

        swift_willThrow();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
    __break(1u);
  }
  result = sub_235F4CD14();
  __break(1u);
  return result;
}

uint64_t sub_235F3D0E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[40];
  __int128 v24;
  __int128 v25;

  v0 = sub_235F4C33C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v20 - v5;
  result = sub_235F4C0F0();
  if (result)
  {
    v8 = result;
    v21 = sub_235F4CA80();
    v22 = v9;
    sub_235F4CC84();
    if (*(_QWORD *)(v8 + 16) && (v10 = sub_235F3D65C((uint64_t)v23), (v11 & 1) != 0))
    {
      sub_235F3D6C0(*(_QWORD *)(v8 + 56) + 32 * v10, (uint64_t)&v24);
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_235F3D68C((uint64_t)v23);
    if (*((_QWORD *)&v25 + 1))
    {
      result = swift_dynamicCast();
      if ((result & 1) != 0)
      {
        if (v21)
        {
          if (v21 == 1)
          {
            if (qword_256394AA0 != -1)
              swift_once();
            v12 = __swift_project_value_buffer(v0, (uint64_t)qword_256395488);
            swift_beginAccess();
            (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v6, v12, v0);
            v13 = sub_235F4C324();
            v14 = sub_235F4CBA0();
            if (os_log_type_enabled(v13, v14))
            {
              v15 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v15 = 0;
              _os_log_impl(&dword_235F17000, v13, v14, "AVS - Stopped listening due to interruption", v15, 2u);
              MEMORY[0x23B7E711C](v15, -1, -1);
            }

            (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
            return sub_235F3BE0C();
          }
        }
        else
        {
          if (qword_256394AA0 != -1)
            swift_once();
          v16 = __swift_project_value_buffer(v0, (uint64_t)qword_256395488);
          swift_beginAccess();
          (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v16, v0);
          v17 = sub_235F4C324();
          v18 = sub_235F4CBA0();
          if (os_log_type_enabled(v17, v18))
          {
            v19 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v19 = 0;
            _os_log_impl(&dword_235F17000, v17, v18, "AVS - Interruption ended. Started listening again.", v19, 2u);
            MEMORY[0x23B7E711C](v19, -1, -1);
          }

          (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
          return sub_235F3B9CC();
        }
      }
    }
    else
    {
      return sub_235F1BF08((uint64_t)&v24, &qword_256395450);
    }
  }
  return result;
}

uint64_t type metadata accessor for AVSAudioProvider()
{
  return objc_opt_self();
}

id sub_235F3D4E0(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v4;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  id v13;
  id v14;
  uint64_t v15;
  id v17[2];

  v4 = v3;
  v17[1] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = (void *)sub_235F4C138();
  v17[0] = 0;
  v9 = objc_msgSend(v4, sel_initForReading_commonFormat_interleaved_error_, v8, a2, a3 & 1, v17);

  v10 = v17[0];
  if (v9)
  {
    v11 = sub_235F4C150();
    v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
    v13 = v10;
    v12(a1, v11);
  }
  else
  {
    v14 = v17[0];
    sub_235F4C114();

    swift_willThrow();
    v15 = sub_235F4C150();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a1, v15);
  }
  return v9;
}

unint64_t sub_235F3D5F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_235F4CE34();
  sub_235F4CAB0();
  v4 = sub_235F4CE4C();
  return sub_235F3D6FC(a1, a2, v4);
}

unint64_t sub_235F3D65C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_235F4CC6C();
  return sub_235F3D7DC(a1, v2);
}

uint64_t sub_235F3D68C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_235F3D6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_235F3D6FC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_235F4CE1C() & 1) == 0)
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
      while (!v14 && (sub_235F4CE1C() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_235F3D7DC(uint64_t a1, uint64_t a2)
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
      sub_235F3D8A0(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B7E69B4](v9, a1);
      sub_235F3D68C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_235F3D8A0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

unint64_t sub_235F3D8DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256395C20;
  if (!qword_256395C20)
  {
    v1 = sub_235F26110(255, &qword_256395C18);
    result = MEMORY[0x23B7E7098](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_256395C20);
  }
  return result;
}

uint64_t sub_235F3D934()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235F3D958()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_235F3D98C(void *a1, void *a2)
{
  uint64_t v2;

  sub_235F3C774(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
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

uint64_t sub_235F3D9B0()
{
  return swift_deallocObject();
}

uint64_t sub_235F3D9C0()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void *sub_235F3D9EC(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  return sub_235F3CC1C(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_235F3D9F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F3DA44(uint64_t a1)
{
  id v2;
  id v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v3 = objc_msgSend(v2, sel_userInterfaceIdiom);

  if (v3 == (id)6 || (unint64_t)v3 <= 1)
  {
    swift_bridgeObjectRetain();
    sub_235F4CABC();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t UUID.avsFormattedString.getter()
{
  uint64_t v0;

  sub_235F4C1B0();
  sub_235F1EA80();
  sub_235F4CC24();
  swift_bridgeObjectRelease();
  v0 = sub_235F4CAA4();
  swift_bridgeObjectRelease();
  return v0;
}

AVAudioPCMBuffer_optional __swiftcall convertToFloat32PCM(buffer:)(AVAudioPCMBuffer buffer)
{
  Class isa;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  Swift::Bool v8;
  NSObject *v9;
  id v10;
  char **v11;
  uint64_t v12;
  _QWORD *v13;
  objc_class *v14;
  unint64_t v15;
  double v16;
  id v17;
  double v18;
  double v19;
  unsigned int v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  id v27;
  id v28;
  NSObject *v29;
  char **v30;
  _QWORD *v31;
  id v32;
  _QWORD v33[3];
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  char v39;
  id aBlock[6];
  id v41;
  uint64_t v42;
  AVAudioPCMBuffer_optional result;

  isa = buffer.super.super.isa;
  v42 = *MEMORY[0x24BDAC8D0];
  v2 = sub_235F4C33C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1818]), sel_initWithCommonFormat_sampleRate_channels_interleaved_, 1, 1, 0, 16000.0);
  if (!v6)
  {
LABEL_23:
    v11 = 0;
    goto LABEL_24;
  }
  v9 = v6;
  v10 = -[objc_class format](isa, sel_format);
  v11 = (char **)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB17F8]), sel_initFromFormat_toFormat_, v10, v9);

  if (!v11)
  {

    goto LABEL_24;
  }
  v12 = swift_allocObject();
  *(_BYTE *)(v12 + 16) = 1;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v12;
  v13[3] = isa;
  swift_retain();
  v14 = isa;
  v15 = v11;
  v11 = &selRef_deleteAllShortcuts;
  -[NSObject sampleRate](v9, sel_sampleRate);
  if ((~*(_QWORD *)&v16 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v16 <= -1.0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v16 >= 4294967300.0)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v37 = v15;
  v15 = v16 * (unint64_t)-[objc_class frameLength](v14, sel_frameLength);
  if ((v15 & 0xFFFFFFFF00000000) != 0)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v17 = -[objc_class format](v14, sel_format);
  objc_msgSend(v17, sel_sampleRate);
  v19 = v18;

  if ((~*(_QWORD *)&v19 & 0x7FF0000000000000) == 0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v19 <= -1.0)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v19 >= 4294967300.0)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (!v19)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v20 = v19;
  v21 = (objc_class *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1838]), sel_initWithPCMFormat_frameCapacity_, v9, v15 / v20);
  if (!v21)
  {
    __break(1u);
    goto LABEL_35;
  }
  v11 = (char **)v21;
  aBlock[4] = sub_235F3D9EC;
  aBlock[5] = v13;
  aBlock[0] = (id)MEMORY[0x24BDAC760];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_235F3E148;
  aBlock[3] = &block_descriptor_3;
  v22 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  aBlock[0] = 0;
  v15 = (unint64_t)v37;
  -[NSObject convertToBuffer:error:withInputFromBlock:](v37, sel_convertToBuffer_error_withInputFromBlock_, v11, aBlock, v22);
  _Block_release(v22);
  v41 = aBlock[0];
  if (aBlock[0])
  {
    if (qword_256394AA0 == -1)
    {
LABEL_14:
      v23 = __swift_project_value_buffer(v2, (uint64_t)qword_256395488);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v23, v2);
      v24 = sub_235F4C324();
      v25 = sub_235F4CB88();
      if (os_log_type_enabled(v24, v25))
      {
        v35 = v12;
        v36 = v3;
        v26 = (uint8_t *)swift_slowAlloc();
        v34 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v26 = 138412290;
        swift_beginAccess();
        v27 = v41;
        if (v41)
        {
          v38 = v41;
          v33[1] = &v39;
          v33[2] = v26 + 12;
          v28 = v41;
        }
        else
        {
          v38 = 0;
        }
        sub_235F4CBF4();
        v31 = v34;
        *v34 = v27;
        _os_log_impl(&dword_235F17000, v24, v25, "Error converting buffer %@", v26, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256395408);
        swift_arrayDestroy();
        MEMORY[0x23B7E711C](v31, -1, -1);
        MEMORY[0x23B7E711C](v26, -1, -1);
        v29 = v9;
        v30 = (char **)v9;
        v3 = v36;
        v9 = v37;
      }
      else
      {
        v29 = v24;
        v30 = v11;
        v11 = (char **)v15;
        v24 = v15;
      }

      swift_release();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v32 = v41;
      swift_release();

      goto LABEL_23;
    }
LABEL_33:
    swift_once();
    goto LABEL_14;
  }

  swift_release();
  swift_release();

LABEL_24:
  v21 = (objc_class *)v11;
LABEL_35:
  result.value.super._impl = v7;
  result.value.super.super.isa = v21;
  result.is_nil = v8;
  return result;
}

uint64_t sub_235F3E138()
{
  return swift_deallocObject();
}

id sub_235F3E148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  void *v6;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v6 = (void *)v5(a2, a3);
  swift_release();
  return v6;
}

void sub_235F3E19C()
{
  void *v0;
  id v1;

  v0 = (void *)sub_235F4CA74();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v0);

  qword_256398358 = (uint64_t)v1;
}

uint64_t sub_235F3E208()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
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

uint64_t sub_235F3E24C()
{
  uint64_t result;
  uint64_t v1;

  type metadata accessor for AXShortcutsProvider();
  result = swift_allocObject();
  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(result + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(result + 24) = v1;
  qword_256398360 = result;
  return result;
}

uint64_t sub_235F3E280()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AXShortcutsProvider()
{
  return objc_opt_self();
}

uint64_t AvailableShortcutAction.init(id:name:type:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t result;
  _QWORD *v14;
  uint64_t v15;

  v9 = *a4;
  v10 = a4[1];
  v11 = *((_BYTE *)a4 + 16);
  sub_235F4C1BC();
  v12 = sub_235F4C1C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(a5, a1, v12);
  result = type metadata accessor for AvailableShortcutAction();
  v14 = (_QWORD *)(a5 + *(int *)(result + 20));
  *v14 = a2;
  v14[1] = a3;
  v15 = a5 + *(int *)(result + 24);
  *(_QWORD *)v15 = v9;
  *(_QWORD *)(v15 + 8) = v10;
  *(_BYTE *)(v15 + 16) = v11;
  return result;
}

uint64_t type metadata accessor for AvailableShortcutAction()
{
  uint64_t result;

  result = qword_256395E08;
  if (!qword_256395E08)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_235F3E39C(char a1)
{
  return *(_QWORD *)&aSirishoraxshor[8 * a1];
}

uint64_t sub_235F3E3BC()
{
  return 1;
}

uint64_t sub_235F3E3C8()
{
  return sub_235F4CE40();
}

uint64_t sub_235F3E3F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_235F406F4(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_235F3E41C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_235F3E428()
{
  sub_235F3F528();
  return sub_235F4CE70();
}

uint64_t sub_235F3E450()
{
  sub_235F3F528();
  return sub_235F4CE7C();
}

uint64_t sub_235F3E480()
{
  char *v0;

  return sub_235F3E39C(*v0);
}

uint64_t sub_235F3E488@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_235F404EC(a1, a2);
  *a3 = result;
  return result;
}

void sub_235F3E4AC(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_235F3E4B8()
{
  sub_235F3F4A0();
  return sub_235F4CE70();
}

uint64_t sub_235F3E4E0()
{
  sub_235F3F4A0();
  return sub_235F4CE7C();
}

uint64_t sub_235F3E50C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_235F40658(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_235F3E534()
{
  sub_235F3F4E4();
  return sub_235F4CE70();
}

uint64_t sub_235F3E55C()
{
  sub_235F3F4E4();
  return sub_235F4CE7C();
}

uint64_t sub_235F3E584()
{
  sub_235F4CE34();
  sub_235F4CE40();
  return sub_235F4CE4C();
}

uint64_t sub_235F3E5C4()
{
  sub_235F4CE34();
  sub_235F4CE40();
  return sub_235F4CE4C();
}

uint64_t sub_235F3E600()
{
  sub_235F3F56C();
  return sub_235F4CE70();
}

uint64_t sub_235F3E628()
{
  sub_235F3F56C();
  return sub_235F4CE7C();
}

uint64_t AvailableShortcutAction.AvailableShortcutActionType.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
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
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  char v35;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395D20);
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v26 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395D28);
  v24 = *(_QWORD *)(v5 - 8);
  v25 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395D30);
  v23 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395D38);
  v31 = *(_QWORD *)(v11 - 8);
  v32 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = v1[1];
  v29 = *v1;
  v30 = v14;
  v15 = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235F3F4A0();
  sub_235F4CE64();
  if (v15)
  {
    if (v15 == 1)
    {
      v34 = 1;
      sub_235F3F528();
      v16 = v32;
      sub_235F4CDBC();
      v17 = v25;
      sub_235F4CDE0();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v17);
    }
    else
    {
      v35 = 2;
      sub_235F3F4E4();
      v20 = v26;
      v16 = v32;
      sub_235F4CDBC();
      v21 = v28;
      sub_235F4CDE0();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v20, v21);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v13, v16);
  }
  else
  {
    v33 = 0;
    sub_235F3F56C();
    v18 = v32;
    sub_235F4CDBC();
    sub_235F4CDE0();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v13, v18);
  }
}

uint64_t AvailableShortcutAction.AvailableShortcutActionType.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  char v25;
  char *v26;
  char *v27;
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
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  char *v49;
  char *v50;
  _QWORD *v51;
  uint64_t v52;
  char v53;
  char v54;
  char v55;

  v48 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395D60);
  v44 = *(_QWORD *)(v3 - 8);
  v45 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v50 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395D68);
  v46 = *(_QWORD *)(v5 - 8);
  v47 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v49 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395D70);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395D78);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a1[3];
  v51 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_235F3F4A0();
  v16 = v52;
  sub_235F4CE58();
  if (v16)
    goto LABEL_7;
  v42 = v8;
  v43 = v7;
  v17 = v49;
  v18 = v50;
  v52 = v12;
  v19 = sub_235F4CDB0();
  if (*(_QWORD *)(v19 + 16) != 1)
  {
    v21 = sub_235F4CCCC();
    swift_allocError();
    v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256395D80);
    *v23 = &type metadata for AvailableShortcutAction.AvailableShortcutActionType;
    sub_235F4CD68();
    sub_235F4CCC0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x24BEE26D0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v14, v11);
LABEL_7:
    v34 = (uint64_t)v51;
    return __swift_destroy_boxed_opaque_existential_1(v34);
  }
  LODWORD(v20) = *(unsigned __int8 *)(v19 + 32);
  if (*(_BYTE *)(v19 + 32))
  {
    if ((_DWORD)v20 == 1)
    {
      v54 = 1;
      sub_235F3F528();
      sub_235F4CD5C();
      v30 = v47;
      v31 = sub_235F4CD8C();
      v33 = v32;
      (*(void (**)(char *, uint64_t))(v46 + 8))(v17, v30);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v14, v11);
      v34 = (uint64_t)v51;
      v35 = v31;
    }
    else
    {
      LODWORD(v49) = *(unsigned __int8 *)(v19 + 32);
      v55 = 2;
      sub_235F3F4E4();
      v27 = v18;
      sub_235F4CD5C();
      v28 = v45;
      v35 = sub_235F4CD8C();
      v29 = v27;
      v20 = v52;
      v33 = v39;
      (*(void (**)(char *, uint64_t))(v44 + 8))(v29, v28);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v14, v11);
      v34 = (uint64_t)v51;
      LOBYTE(v20) = (_BYTE)v49;
    }
  }
  else
  {
    v25 = *(_BYTE *)(v19 + 32);
    v53 = 0;
    sub_235F3F56C();
    v26 = v10;
    sub_235F4CD5C();
    v36 = v43;
    v37 = sub_235F4CD8C();
    v33 = v38;
    (*(void (**)(char *, uint64_t))(v42 + 8))(v26, v36);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v14, v11);
    v34 = (uint64_t)v51;
    LOBYTE(v20) = v25;
    v35 = v37;
  }
  v40 = v48;
  *v48 = v35;
  v40[1] = v33;
  *((_BYTE *)v40 + 16) = v20;
  return __swift_destroy_boxed_opaque_existential_1(v34);
}

uint64_t sub_235F3EE1C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return AvailableShortcutAction.AvailableShortcutActionType.init(from:)(a1, a2);
}

uint64_t sub_235F3EE30(_QWORD *a1)
{
  return AvailableShortcutAction.AvailableShortcutActionType.encode(to:)(a1);
}

uint64_t sub_235F3EE44(char a1)
{
  return qword_235F4EAD8[a1];
}

uint64_t sub_235F3EE64()
{
  char *v0;

  return sub_235F3EE44(*v0);
}

uint64_t sub_235F3EE6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_235F40760(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_235F3EE90()
{
  sub_235F3F5B0();
  return sub_235F4CE70();
}

uint64_t sub_235F3EEB8()
{
  sub_235F3F5B0();
  return sub_235F4CE7C();
}

uint64_t AvailableShortcutAction.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  __int128 *v10;
  char v11;
  _BYTE v13[16];
  __int128 v14;
  char v15;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395D88);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235F3F5B0();
  sub_235F4CE64();
  LOBYTE(v14) = 0;
  sub_235F4C1C8();
  sub_235F3F638(&qword_2563952B0, MEMORY[0x24BDCEA70]);
  sub_235F4CDF8();
  if (!v2)
  {
    v9 = type metadata accessor for AvailableShortcutAction();
    LOBYTE(v14) = 1;
    sub_235F4CDE0();
    v10 = (__int128 *)(v3 + *(int *)(v9 + 24));
    v11 = *((_BYTE *)v10 + 16);
    v14 = *v10;
    v15 = v11;
    v13[15] = 2;
    sub_235F3F5F4();
    sub_235F4CDF8();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t AvailableShortcutAction.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  char *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  char v28;
  char v29;

  v22 = a2;
  v4 = sub_235F4C1C8();
  v25 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395DA0);
  v7 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for AvailableShortcutAction();
  MEMORY[0x24BDAC7A8](v26);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F4C1BC();
  v12 = a1[3];
  v24 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_235F3F5B0();
  sub_235F4CE58();
  if (v2)
  {
    v13 = v25;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v11, v4);
  }
  else
  {
    LOBYTE(v27) = 0;
    sub_235F3F638(&qword_2563952D0, MEMORY[0x24BDCEAA8]);
    sub_235F4CDA4();
    (*(void (**)(char *, char *, uint64_t))(v25 + 40))(v11, v6, v4);
    LOBYTE(v27) = 1;
    v14 = sub_235F4CD8C();
    v15 = v26;
    v16 = (uint64_t *)&v11[*(int *)(v26 + 20)];
    *v16 = v14;
    v16[1] = v17;
    v29 = 2;
    sub_235F3F678();
    sub_235F4CDA4();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v23);
    v18 = v28;
    v19 = &v11[*(int *)(v15 + 24)];
    *(_OWORD *)v19 = v27;
    v19[16] = v18;
    sub_235F3F6BC((uint64_t)v11, v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    return sub_235F3F700((uint64_t)v11);
  }
}

uint64_t sub_235F3F35C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AvailableShortcutAction.init(from:)(a1, a2);
}

uint64_t sub_235F3F370(_QWORD *a1)
{
  return AvailableShortcutAction.encode(to:)(a1);
}

uint64_t _s22AdaptiveVoiceShortcuts23AvailableShortcutActionV0deF4TypeO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v10;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(unsigned __int8 *)(a1 + 16);
  v5 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(unsigned __int8 *)(a2 + 16);
  if (!*(_BYTE *)(a1 + 16))
  {
    if (!*(_BYTE *)(a2 + 16))
    {
      if (v2 != v5 || v3 != v6)
        goto LABEL_23;
      LOBYTE(v7) = 0;
      LOBYTE(v4) = 0;
      goto LABEL_17;
    }
LABEL_24:
    v10 = 0;
    goto LABEL_25;
  }
  if (v4 != 1)
  {
    if (v7 == 2)
    {
      if (v2 == v5 && v3 == v6)
      {
        v10 = 1;
        LOBYTE(v7) = 2;
        LOBYTE(v4) = 2;
        goto LABEL_25;
      }
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (v7 != 1)
    goto LABEL_24;
  if (v2 != v5 || v3 != v6)
  {
LABEL_23:
    v10 = sub_235F4CE1C();
    LOBYTE(v7) = v4;
    goto LABEL_25;
  }
  LOBYTE(v7) = 1;
  LOBYTE(v4) = 1;
LABEL_17:
  v10 = 1;
LABEL_25:
  sub_235F3F800(v5, v6, v7);
  sub_235F3F800(v2, v3, v4);
  sub_235F253B0(v2, v3, v4);
  sub_235F253B0(v5, v6, v7);
  return v10 & 1;
}

unint64_t sub_235F3F4A0()
{
  unint64_t result;

  result = qword_256395D40;
  if (!qword_256395D40)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4EA50, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395D40);
  }
  return result;
}

unint64_t sub_235F3F4E4()
{
  unint64_t result;

  result = qword_256395D48;
  if (!qword_256395D48)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4EA00, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.SiriRequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395D48);
  }
  return result;
}

unint64_t sub_235F3F528()
{
  unint64_t result;

  result = qword_256395D50;
  if (!qword_256395D50)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E9B0, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.AxShortcutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395D50);
  }
  return result;
}

unint64_t sub_235F3F56C()
{
  unint64_t result;

  result = qword_256395D58;
  if (!qword_256395D58)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E960, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.SiriShortcutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395D58);
  }
  return result;
}

unint64_t sub_235F3F5B0()
{
  unint64_t result;

  result = qword_256395D90;
  if (!qword_256395D90)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E910, &type metadata for AvailableShortcutAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395D90);
  }
  return result;
}

unint64_t sub_235F3F5F4()
{
  unint64_t result;

  result = qword_256395D98;
  if (!qword_256395D98)
  {
    result = MEMORY[0x23B7E7098](&protocol conformance descriptor for AvailableShortcutAction.AvailableShortcutActionType, &type metadata for AvailableShortcutAction.AvailableShortcutActionType);
    atomic_store(result, (unint64_t *)&qword_256395D98);
  }
  return result;
}

uint64_t sub_235F3F638(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_235F4C1C8();
    result = MEMORY[0x23B7E7098](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_235F3F678()
{
  unint64_t result;

  result = qword_256395DA8;
  if (!qword_256395DA8)
  {
    result = MEMORY[0x23B7E7098](&protocol conformance descriptor for AvailableShortcutAction.AvailableShortcutActionType, &type metadata for AvailableShortcutAction.AvailableShortcutActionType);
    atomic_store(result, (unint64_t *)&qword_256395DA8);
  }
  return result;
}

uint64_t sub_235F3F6BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AvailableShortcutAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F3F700(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AvailableShortcutAction();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for AvailableShortcutAction(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_235F4C1C8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (char *)a1 + v9;
    v14 = (char *)a2 + v9;
    v15 = *(uint64_t *)((char *)a2 + v9);
    v16 = *((_QWORD *)v14 + 1);
    v17 = v14[16];
    swift_bridgeObjectRetain();
    sub_235F3F800(v15, v16, v17);
    *(_QWORD *)v13 = v15;
    *((_QWORD *)v13 + 1) = v16;
    v13[16] = v17;
  }
  return a1;
}

uint64_t sub_235F3F800(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for AvailableShortcutAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_235F4C1C8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  return sub_235F253B0(*(_QWORD *)(a1 + *(int *)(a2 + 24)), *(_QWORD *)(a1 + *(int *)(a2 + 24) + 8), *(_BYTE *)(a1 + *(int *)(a2 + 24) + 16));
}

uint64_t initializeWithCopy for AvailableShortcutAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;

  v6 = sub_235F4C1C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  v14 = *(_QWORD *)(a2 + v8);
  v15 = *(_QWORD *)(a2 + v8 + 8);
  v16 = *(_BYTE *)(v13 + 16);
  swift_bridgeObjectRetain();
  sub_235F3F800(v14, v15, v16);
  *(_QWORD *)v12 = v14;
  *(_QWORD *)(v12 + 8) = v15;
  *(_BYTE *)(v12 + 16) = v16;
  return a1;
}

uint64_t assignWithCopy for AvailableShortcutAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;

  v6 = sub_235F4C1C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 24);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = *(_QWORD *)v12;
  v14 = *(_QWORD *)(v12 + 8);
  v15 = *(_BYTE *)(v12 + 16);
  sub_235F3F800(*(_QWORD *)v12, v14, v15);
  v16 = *(_QWORD *)v11;
  v17 = *(_QWORD *)(v11 + 8);
  *(_QWORD *)v11 = v13;
  *(_QWORD *)(v11 + 8) = v14;
  v18 = *(_BYTE *)(v11 + 16);
  *(_BYTE *)(v11 + 16) = v15;
  sub_235F253B0(v16, v17, v18);
  return a1;
}

uint64_t initializeWithTake for AvailableShortcutAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_235F4C1C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  return a1;
}

uint64_t assignWithTake for AvailableShortcutAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;

  v6 = sub_235F4C1C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = *(int *)(a3 + 24);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = *(_BYTE *)(v14 + 16);
  v16 = *(_QWORD *)v13;
  v17 = *(_QWORD *)(v13 + 8);
  *(_OWORD *)v13 = *(_OWORD *)v14;
  v18 = *(_BYTE *)(v13 + 16);
  *(_BYTE *)(v13 + 16) = v15;
  sub_235F253B0(v16, v17, v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for AvailableShortcutAction()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235F3FADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_235F4C1C8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for AvailableShortcutAction()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_235F3FB68(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_235F4C1C8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_235F3FBE4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235F4C1C8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for AvailableShortcutAction.AvailableShortcutActionType(uint64_t a1)
{
  return sub_235F253B0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s22AdaptiveVoiceShortcuts23AvailableShortcutActionV27AvailableShortcutActionTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_235F3F800(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AvailableShortcutAction.AvailableShortcutActionType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_235F3F800(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_235F253B0(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AvailableShortcutAction.AvailableShortcutActionType(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_235F253B0(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AvailableShortcutAction.AvailableShortcutActionType(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AvailableShortcutAction.AvailableShortcutActionType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_235F3FDF4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_235F3FDFC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AvailableShortcutAction.AvailableShortcutActionType()
{
  return &type metadata for AvailableShortcutAction.AvailableShortcutActionType;
}

ValueMetadata *type metadata accessor for AvailableShortcutAction.CodingKeys()
{
  return &type metadata for AvailableShortcutAction.CodingKeys;
}

uint64_t _s22AdaptiveVoiceShortcuts23AvailableShortcutActionV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s22AdaptiveVoiceShortcuts23AvailableShortcutActionV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235F3FF08 + 4 * byte_235F4E3B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_235F3FF3C + 4 * asc_235F4E3B0[v4]))();
}

uint64_t sub_235F3FF3C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F3FF44(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235F3FF4CLL);
  return result;
}

uint64_t sub_235F3FF58(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235F3FF60);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_235F3FF64(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F3FF6C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AvailableShortcutAction.AvailableShortcutActionType.CodingKeys()
{
  return &type metadata for AvailableShortcutAction.AvailableShortcutActionType.CodingKeys;
}

uint64_t sub_235F3FF94()
{
  return 0;
}

ValueMetadata *type metadata accessor for AvailableShortcutAction.AvailableShortcutActionType.SiriShortcutCodingKeys()
{
  return &type metadata for AvailableShortcutAction.AvailableShortcutActionType.SiriShortcutCodingKeys;
}

ValueMetadata *type metadata accessor for AvailableShortcutAction.AvailableShortcutActionType.AxShortcutCodingKeys()
{
  return &type metadata for AvailableShortcutAction.AvailableShortcutActionType.AxShortcutCodingKeys;
}

uint64_t _s22AdaptiveVoiceShortcuts23AvailableShortcutActionV27AvailableShortcutActionTypeO22SiriShortcutCodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s22AdaptiveVoiceShortcuts23AvailableShortcutActionV27AvailableShortcutActionTypeO22SiriShortcutCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_235F4004C + 4 * byte_235F4E3BA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_235F4006C + 4 * byte_235F4E3BF[v4]))();
}

_BYTE *sub_235F4004C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_235F4006C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235F40074(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235F4007C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235F40084(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235F4008C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AvailableShortcutAction.AvailableShortcutActionType.SiriRequestCodingKeys()
{
  return &type metadata for AvailableShortcutAction.AvailableShortcutActionType.SiriRequestCodingKeys;
}

unint64_t sub_235F400AC()
{
  unint64_t result;

  result = qword_256395E48;
  if (!qword_256395E48)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E608, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.SiriRequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395E48);
  }
  return result;
}

unint64_t sub_235F400F4()
{
  unint64_t result;

  result = qword_256395E50;
  if (!qword_256395E50)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E6C0, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.AxShortcutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395E50);
  }
  return result;
}

unint64_t sub_235F4013C()
{
  unint64_t result;

  result = qword_256395E58;
  if (!qword_256395E58)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E778, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.SiriShortcutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395E58);
  }
  return result;
}

unint64_t sub_235F40184()
{
  unint64_t result;

  result = qword_256395E60;
  if (!qword_256395E60)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E830, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395E60);
  }
  return result;
}

unint64_t sub_235F401CC()
{
  unint64_t result;

  result = qword_256395E68;
  if (!qword_256395E68)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E8E8, &type metadata for AvailableShortcutAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395E68);
  }
  return result;
}

unint64_t sub_235F40214()
{
  unint64_t result;

  result = qword_256395E70;
  if (!qword_256395E70)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E858, &type metadata for AvailableShortcutAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395E70);
  }
  return result;
}

unint64_t sub_235F4025C()
{
  unint64_t result;

  result = qword_256395E78;
  if (!qword_256395E78)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E880, &type metadata for AvailableShortcutAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395E78);
  }
  return result;
}

unint64_t sub_235F402A4()
{
  unint64_t result;

  result = qword_256395E80;
  if (!qword_256395E80)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E6E8, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.SiriShortcutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395E80);
  }
  return result;
}

unint64_t sub_235F402EC()
{
  unint64_t result;

  result = qword_256395E88;
  if (!qword_256395E88)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E710, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.SiriShortcutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395E88);
  }
  return result;
}

unint64_t sub_235F40334()
{
  unint64_t result;

  result = qword_256395E90;
  if (!qword_256395E90)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E630, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.AxShortcutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395E90);
  }
  return result;
}

unint64_t sub_235F4037C()
{
  unint64_t result;

  result = qword_256395E98;
  if (!qword_256395E98)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E658, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.AxShortcutCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395E98);
  }
  return result;
}

unint64_t sub_235F403C4()
{
  unint64_t result;

  result = qword_256395EA0;
  if (!qword_256395EA0)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E578, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.SiriRequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395EA0);
  }
  return result;
}

unint64_t sub_235F4040C()
{
  unint64_t result;

  result = qword_256395EA8;
  if (!qword_256395EA8)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E5A0, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.SiriRequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395EA8);
  }
  return result;
}

unint64_t sub_235F40454()
{
  unint64_t result;

  result = qword_256395EB0;
  if (!qword_256395EB0)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E7A0, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395EB0);
  }
  return result;
}

unint64_t sub_235F4049C()
{
  unint64_t result;

  result = qword_256395EB8;
  if (!qword_256395EB8)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4E7C8, &type metadata for AvailableShortcutAction.AvailableShortcutActionType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395EB8);
  }
  return result;
}

uint64_t sub_235F404E0()
{
  return 25705;
}

uint64_t sub_235F404EC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x726F685369726973 && a2 == 0xEC00000074756374;
  if (v3 || (sub_235F4CE1C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6374726F68537861 && a2 == 0xEA00000000007475 || (sub_235F4CE1C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7571655269726973 && a2 == 0xEB00000000747365)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_235F4CE1C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_235F40658(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x74736575716572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_235F4CE1C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_235F406DC()
{
  return 0x74736575716572;
}

uint64_t sub_235F406F4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 25705 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_235F4CE1C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_235F40760(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_235F4CE1C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_235F4CE1C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1701869940 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_235F4CE1C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_235F40880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235F409E8(a1, a2, a3, (uint64_t)&unk_2507509C0, &qword_256395FB0);
}

uint64_t sub_235F4089C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_235F4CB64();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_235F4CB58();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_235F1BF08(a1, &qword_256395158);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_235F4CB28();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_235F409E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v9 = sub_235F4CB64();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) != 1)
  {
    sub_235F4CB58();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_235F1BF08(a1, &qword_256395158);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_235F4CB28();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a2;
  *(_QWORD *)(v11 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  return swift_task_create();
}

id sub_235F40B44()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)AVSTriggerController), sel_init);
  qword_256395EC0 = (uint64_t)result;
  return result;
}

void __swiftcall AVSTriggerController.init()(AVSTriggerController *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

uint64_t AVSTriggerController.displayAlertHandler.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___AVSTriggerController_displayAlertHandler);
  swift_beginAccess();
  v2 = *v1;
  sub_235F1EC90(*v1);
  return v2;
}

uint64_t sub_235F40CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (!a2)
  {
    v5 = 0;
    v7 = 0;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v5 = sub_235F4CA80();
  v7 = v6;
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v8 = sub_235F4CA80();
  v3 = v9;
LABEL_6:
  swift_retain();
  v4(v5, v7, v8, v3);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_235F40DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  uint64_t v8;
  id v9;

  if (!a2)
  {
    v7 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v7 = (void *)sub_235F4CA74();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8 = sub_235F4CA74();
LABEL_6:
  v9 = (id)v8;
  (*(void (**)(uint64_t, void *))(a5 + 16))(a5, v7);

}

uint64_t AVSTriggerController.displayAlertHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR___AVSTriggerController_displayAlertHandler);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_235F1ED40(v6);
}

_QWORD *sub_235F40EAC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *result;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD *, _QWORD *);

  result = objc_msgSend(*a1, sel_displayAlertHandler);
  if (result)
  {
    v4 = result;
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    result = (_QWORD *)swift_allocObject();
    result[2] = sub_235F4557C;
    result[3] = v5;
    v6 = sub_235F452F4;
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  a2[1] = result;
  return result;
}

void sub_235F40F40(uint64_t a1, void **a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v3 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    v4 = *(_QWORD *)(a1 + 8);
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = *a2;
    v7[4] = sub_235F452BC;
    v7[5] = v5;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 1107296256;
    v7[2] = sub_235F40CA0;
    v7[3] = &block_descriptor_21;
    v3 = _Block_copy(v7);
    swift_retain();
    swift_release();
  }
  else
  {
    v6 = *a2;
  }
  objc_msgSend(v6, sel_setDisplayAlertHandler_, v3);
  _Block_release(v3);
}

void *AVSTriggerController.spotter.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___AVSTriggerController_spotter);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void AVSTriggerController.spotter.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___AVSTriggerController_spotter);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*AVSTriggerController.spotter.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t static AVSTriggerController.sharedInstance()()
{
  void *v0;
  uint64_t v1;
  id v2;

  if (qword_256394AB8 != -1)
    swift_once();
  v0 = (void *)qword_256395EC0;
  v1 = swift_dynamicCastUnknownClass();
  if (v1)
    v2 = v0;
  return v1;
}

char *AVSTriggerController.init()()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[40];
  _QWORD v9[5];
  objc_super v10;

  v1 = &v0[OBJC_IVAR___AVSTriggerController_displayAlertHandler];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  *(_QWORD *)&v0[OBJC_IVAR___AVSTriggerController_spotter] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___AVSTriggerController_enrollmentReceiver] = 0;
  v2 = &v0[OBJC_IVAR___AVSTriggerController_avsBundleDonorID];
  *(_QWORD *)v2 = 0xD000000000000030;
  *((_QWORD *)v2 + 1) = 0x8000000235F4FFD0;
  type metadata accessor for AVSAudioProvider();
  swift_allocObject();
  v3 = v0;
  *(_QWORD *)&v3[OBJC_IVAR___AVSTriggerController_audioProvider] = sub_235F3AB78();

  v10.receiver = v3;
  v10.super_class = (Class)AVSTriggerController;
  v4 = (char *)objc_msgSendSuper2(&v10, sel_init);
  AXPIBridgePerformWarm();
  v5 = *(_QWORD *)&v4[OBJC_IVAR___AVSTriggerController_audioProvider];
  v9[3] = type metadata accessor for AVSTriggerController(v6);
  v9[4] = &off_2507507F8;
  v9[0] = v4;
  sub_235F3689C((uint64_t)v9, (uint64_t)v8);
  swift_beginAccess();
  swift_retain();
  sub_235F412D8((uint64_t)v8, v5 + 40);
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t type metadata accessor for AVSTriggerController(uint64_t a1)
{
  return sub_235F26110(a1, &qword_256395F30);
}

uint64_t sub_235F412D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

Swift::Void __swiftcall AVSTriggerController.startListening()()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  void *v19;
  id v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint8_t *v32;
  uint8_t *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  _QWORD *v42[4];

  v1 = v0;
  v39 = sub_235F4C33C();
  v41 = *(_QWORD *)(v39 - 8);
  v2 = MEMORY[0x24BDAC7A8](v39);
  v40 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v34 - v4;
  v6 = sub_235F4C24C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_235F4C1EC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BEC0C48], v10);
  v14 = sub_235F4C2A0();
  v38 = v1;
  v15 = (void *)v14;
  v34 = v5;
  v35 = v7;
  v36 = v6;
  v37 = v9;
  v17 = v16;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v18 = (void **)(v1 + OBJC_IVAR___AVSTriggerController_spotter);
  swift_beginAccess();
  v19 = *v18;
  *v18 = v15;
  v20 = v15;

  *(_QWORD *)(v1 + OBJC_IVAR___AVSTriggerController_enrollmentReceiver) = v17;
  swift_retain();
  swift_release();
  _sSo8AVSStoreC22AdaptiveVoiceShortcutsE28retriveDataForAllEnrollmentsSay0C7Actions018VASingleEnrollmentF0VGvgZ_0();
  sub_235F4C228();
  swift_bridgeObjectRelease();
  v21 = v37;
  sub_235F4C210();
  v22 = v39;
  sub_235F4C234();
  v42[0] = (_QWORD *)_sSo8AVSStoreC22AdaptiveVoiceShortcutsE29shortcutsFormattedIdentifiersSaySSGvgZ_0();
  swift_bridgeObjectRetain();
  sub_235F43F70((uint64_t *)v42);
  swift_bridgeObjectRelease();
  v23 = v42[0];
  v42[0] = (_QWORD *)sub_235F4C240();
  swift_bridgeObjectRetain();
  sub_235F43F70((uint64_t *)v42);
  v24 = v35;
  swift_bridgeObjectRelease();
  LOBYTE(v15) = sub_235F4193C(v23, v42[0]);
  swift_release();
  swift_release();
  if ((v15 & 1) != 0)
  {
    sub_235F4C204();
    swift_release();

    swift_release();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v36);
    sub_235F3B9CC();
  }
  else
  {
    if (qword_256394AA0 != -1)
      swift_once();
    v25 = __swift_project_value_buffer(v22, (uint64_t)qword_256395488);
    swift_beginAccess();
    v26 = v41;
    v27 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v34, v25, v22);
    v28 = sub_235F4C324();
    v29 = sub_235F4CB88();
    v30 = os_log_type_enabled(v28, v29);
    v31 = v36;
    if (v30)
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_235F17000, v28, v29, "Unexpected state. AVSStore identifiers do not match runtime keywords. Enrollments could be stale.", v32, 2u);
      v33 = v32;
      v27 = v34;
      MEMORY[0x23B7E711C](v33, -1, -1);
    }
    swift_release();

    (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v22);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v31);
  }
}

uint64_t sub_235F4193C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_235F4CE1C(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_235F4CE1C() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

Swift::Void __swiftcall AVSTriggerController.stopListening()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395158);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F3BE0C();
  sub_235F4CB4C();
  v5 = sub_235F4CB64();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 0, 1, v5);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  v7 = v1;
  sub_235F4089C((uint64_t)v4, (uint64_t)&unk_256395EF8, (uint64_t)v6);
  swift_release();
}

uint64_t sub_235F41B0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[9] = a4;
  v5 = sub_235F4C33C();
  v4[10] = v5;
  v4[11] = *(_QWORD *)(v5 - 8);
  v4[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_235F41B6C()
{
  uint64_t v0;
  void **v1;
  void *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v1 = (void **)(*(_QWORD *)(v0 + 72) + OBJC_IVAR___AVSTriggerController_spotter);
  swift_beginAccess();
  v2 = *v1;
  *(_QWORD *)(v0 + 104) = *v1;
  if (v2)
  {
    v5 = (uint64_t (*)(void))((int)*MEMORY[0x24BEC0C78] + MEMORY[0x24BEC0C78]);
    v2;
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v3;
    *v3 = v0;
    v3[1] = sub_235F41C28;
    return v5();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_235F41C28()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 120) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_235F41CA4()
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
  BOOL v10;
  void *v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;

  if (qword_256394AA0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_256395488);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_235F4C324();
  v9 = sub_235F4CB88();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 120);
  if (v10)
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138412290;
    v14 = v11;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 64) = v15;
    sub_235F4CBF4();
    *v13 = v15;

    _os_log_impl(&dword_235F17000, v8, v9, "Error stopping spotter %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256395408);
    swift_arrayDestroy();
    MEMORY[0x23B7E711C](v13, -1, -1);
    MEMORY[0x23B7E711C](v12, -1, -1);

  }
  else
  {

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_235F4201C()
{
  uint64_t v0;
  uint64_t v1;
  id *v2;
  id v3;

  v1 = sub_235F4C33C();
  MEMORY[0x24BDAC7A8](v1);
  v2 = (id *)(v0 + OBJC_IVAR___AVSTriggerController_spotter);
  swift_beginAccess();
  if (*v2)
  {
    v3 = *v2;
    sub_235F4C21C();

  }
}

void sub_235F422A4()
{
  sub_235F4201C();
}

uint64_t AVSTriggerController.keywordSpotterDidDetectKeyword(event:)(void *a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t (*v31)(char *, uint64_t);
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int (*v53)(_QWORD, _QWORD, _QWORD);
  uint64_t v54;
  char *v55;
  id v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int (*v70)(_QWORD, _QWORD, _QWORD);
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  int v74;
  id v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  _QWORD *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  id v89;
  char *v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  char *v108;
  void (*v109)(char *, uint64_t, uint64_t);
  uint64_t (*v110)(char *, uint64_t);
  char *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t aBlock;
  uint64_t v120;
  uint64_t (*v121)(uint64_t);
  void *v122;
  void (*v123)();
  _QWORD *v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;

  v98 = sub_235F4C9FC();
  v97 = *(_QWORD *)(v98 - 8);
  MEMORY[0x24BDAC7A8](v98);
  v96 = (char *)&v93 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = sub_235F4CA20();
  v94 = *(_QWORD *)(v95 - 8);
  MEMORY[0x24BDAC7A8](v95);
  v93 = (char *)&v93 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = type metadata accessor for AVSDebugEvent();
  MEMORY[0x24BDAC7A8](v99);
  v100 = (char *)&v93 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v101 = (uint64_t)&v93 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v114 = (char *)&v93 - v8;
  v9 = type metadata accessor for AvailableShortcutAction();
  v107 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v93 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395F00);
  MEMORY[0x24BDAC7A8](v12);
  v113 = (uint64_t)&v93 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for AdaptiveVoiceShortcut();
  v15 = *(_QWORD *)(v14 - 8);
  v117 = v14;
  v118 = v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v93 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v93 - v19;
  v21 = sub_235F4C33C();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v111 = (char *)&v93 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v93 - v25;
  if (qword_256394AA0 != -1)
    swift_once();
  v115 = v9;
  v108 = v20;
  v27 = __swift_project_value_buffer(v21, (uint64_t)qword_256395488);
  swift_beginAccess();
  v109 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  v109(v26, v27, v21);
  v28 = sub_235F4C324();
  v29 = sub_235F4CBA0();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_235F17000, v28, v29, "Keyword spotter did detect keyword", v30, 2u);
    MEMORY[0x23B7E711C](v30, -1, -1);
  }

  v31 = *(uint64_t (**)(char *, uint64_t))(v22 + 8);
  v112 = v21;
  v110 = v31;
  v31(v26, v21);
  v32 = objc_msgSend(objc_allocWithZone((Class)AVSStore), sel_init);
  v116 = a1;
  sub_235F4C270();
  v33 = sub_235F28AB0();
  v34 = *(_QWORD *)(v33 + 16);
  if (v34)
  {
    v104 = v32;
    v105 = v27;
    v106 = v11;
    v35 = v33 + ((*(unsigned __int8 *)(v118 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v118 + 80));
    v36 = *(_QWORD *)(v118 + 72);
    v103 = v33;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_235F1BC80(v35, (uint64_t)v18);
      aBlock = sub_235F4C1B0();
      v120 = v37;
      v127 = 45;
      v128 = 0xE100000000000000;
      v125 = 0;
      v126 = 0xE000000000000000;
      sub_235F1EA80();
      sub_235F4CC24();
      swift_bridgeObjectRelease();
      sub_235F4CAA4();
      swift_bridgeObjectRelease();
      v38 = (void *)sub_235F4CA74();
      swift_bridgeObjectRelease();
      v39 = (void *)sub_235F4CA74();
      v40 = objc_msgSend(v38, sel_isEqual_, v39);

      if (v40)
        break;
      sub_235F1BD10((uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
      v35 += v36;
      if (!--v34)
      {
        swift_bridgeObjectRelease();
        v41 = 1;
        v11 = v106;
        v42 = v113;
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    v42 = v113;
    sub_235F253C8((uint64_t)v18, v113, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
    v41 = 0;
    v11 = v106;
LABEL_12:
    v27 = v105;
    v32 = v104;
  }
  else
  {
    v41 = 1;
    v42 = v113;
  }
  v44 = v117;
  v43 = v118;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v118 + 56))(v42, v41, 1, v117);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v45 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v42, 1, v44);
  v47 = v115;
  v46 = v116;
  v48 = (uint64_t)v114;
  if (v45 == 1)
  {
    v49 = &qword_256395F00;
    v50 = v42;
  }
  else
  {
    v51 = (uint64_t)v108;
    sub_235F253C8(v42, (uint64_t)v108, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
    v52 = v51 + *(int *)(v44 + 28);
    sub_235F2F548(v52, v48);
    v53 = *(unsigned int (**)(_QWORD, _QWORD, _QWORD))(v107 + 48);
    if (v53(v48, 1, v47) != 1)
    {
      sub_235F253C8(v48, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
      sub_235F44E34((uint64_t)v11);
      if (_AXSAudioDonationSiriImprovementEnabled())
      {
        v64 = (uint64_t *)(v51 + *(int *)(v44 + 20));
        if (v64[1])
        {
          v65 = *v64;
          v66 = v64[1];
        }
        else
        {
          v65 = 0;
          v66 = 0xE000000000000000;
        }
        swift_bridgeObjectRetain();
        sub_235F42DC8((uint64_t)v46, v65, v66);
        swift_bridgeObjectRelease();
      }
      if (AXIsInternalInstall())
      {
        v67 = (uint64_t)v100;
        sub_235F4C1BC();
        v118 = sub_235F4C270();
        v69 = v68;
        v70 = v53;
        v71 = sub_235F4C258();
        sub_235F4C264();
        v72 = v99;
        v73 = (uint64_t *)(v67 + *(int *)(v99 + 20));
        *v73 = v118;
        v73[1] = v69;
        v44 = v117;
        *(_QWORD *)(v67 + *(int *)(v72 + 24)) = v71;
        v53 = v70;
        *(_DWORD *)(v67 + *(int *)(v72 + 28)) = v74;
        v75 = objc_msgSend(objc_allocWithZone((Class)AVSStore), sel_init);
        _sSo8AVSStoreC22AdaptiveVoiceShortcutsE22storeEventForDebugging5eventyAC08AVSDebugF0V_tF_0(v67);

        sub_235F1BD10(v67, (uint64_t (*)(_QWORD))type metadata accessor for AVSDebugEvent);
      }
      v76 = (uint64_t *)(v51 + *(int *)(v44 + 20));
      v77 = v76[1];
      if (v77)
      {
        v78 = *v76;
        v79 = v52;
        v80 = v101;
        sub_235F2F548(v79, v101);
        if (v53(v80, 1, v47) != 1)
        {
          v81 = (uint64_t *)(v80 + *(int *)(v47 + 20));
          v83 = *v81;
          v82 = v81[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_235F1BD10(v80, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
          sub_235F26110(0, (unint64_t *)&qword_256394D78);
          v84 = (void *)sub_235F4CBB8();
          v85 = (_QWORD *)swift_allocObject();
          v86 = v51;
          v87 = v102;
          v85[2] = v102;
          v85[3] = v78;
          v85[4] = v77;
          v85[5] = v83;
          v85[6] = v82;
          v123 = sub_235F44FBC;
          v124 = v85;
          aBlock = MEMORY[0x24BDAC760];
          v120 = 1107296256;
          v121 = sub_235F34E88;
          v122 = &block_descriptor_4;
          v88 = _Block_copy(&aBlock);
          v89 = v87;
          swift_release();
          v90 = v93;
          sub_235F4CA14();
          aBlock = MEMORY[0x24BEE4AF8];
          sub_235F44FE4();
          __swift_instantiateConcreteTypeFromMangledName(&qword_256394D88);
          sub_235F4502C();
          v91 = v96;
          v92 = v98;
          sub_235F4CC48();
          MEMORY[0x23B7E6900](0, v90, v91, v88);
          _Block_release(v88);

          (*(void (**)(char *, uint64_t))(v97 + 8))(v91, v92);
          (*(void (**)(char *, uint64_t))(v94 + 8))(v90, v95);
          sub_235F1BD10((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
          return sub_235F1BD10(v86, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
        }
        sub_235F1BF08(v80, &qword_256394AC8);
      }
      sub_235F1BD10((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
      return sub_235F1BD10(v51, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
    }
    sub_235F1BD10(v51, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
    v49 = &qword_256394AC8;
    v50 = v48;
  }
  sub_235F1BF08(v50, v49);
  v55 = v111;
  v54 = v112;
  v109(v111, v27, v112);
  v56 = v46;
  v57 = sub_235F4C324();
  v58 = sub_235F4CBA0();
  if (os_log_type_enabled(v57, v58))
  {
    v59 = (uint8_t *)swift_slowAlloc();
    v60 = swift_slowAlloc();
    aBlock = v60;
    *(_DWORD *)v59 = 136315138;
    v61 = sub_235F4C270();
    v127 = sub_235F43930(v61, v62, &aBlock);
    sub_235F4CBF4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235F17000, v57, v58, "No shortcut found for keyword %s", v59, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7E711C](v60, -1, -1);
    MEMORY[0x23B7E711C](v59, -1, -1);

  }
  else
  {

  }
  return v110(v55, v54);
}

uint64_t sub_235F42DC8(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v14;
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
  NSObject *v26;
  unint64_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  void **v31;
  char *v32;
  unsigned int v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t result;
  void (**v47)(char *, uint64_t, uint64_t);
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  void (*v52)(char *, uint64_t, uint64_t);
  char *v53;
  uint64_t v54;
  void (**v55)(char *, uint64_t, uint64_t);
  char *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  NSObject *v60;
  _QWORD v61[2];
  char *v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (**v72)(char *, uint64_t, uint64_t);
  uint64_t v73;

  v70 = a2;
  v71 = a3;
  v3 = sub_235F4C33C();
  v72 = *(void (***)(char *, uint64_t, uint64_t))(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v63 = (char *)v61 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395158);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395F40);
  MEMORY[0x24BDAC7A8](v11);
  v68 = (char *)v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395F48);
  MEMORY[0x24BDAC7A8](v13);
  v67 = (char *)v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395F50);
  MEMORY[0x24BDAC7A8](v15);
  v66 = (char *)v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_235F4C1E0();
  MEMORY[0x24BDAC7A8](v17);
  v18 = sub_235F4C1A4();
  MEMORY[0x24BDAC7A8](v18);
  v69 = sub_235F4C378();
  v19 = *(_QWORD *)(v69 - 8);
  v20 = *(_QWORD *)(v19 + 64);
  v21 = MEMORY[0x24BDAC7A8](v69);
  v65 = (char *)v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v61 - v22;
  v24 = sub_235F4C258();
  if (v24)
    v25 = v24;
  else
    v25 = MEMORY[0x24BEE4AF8];
  v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1818]), sel_initWithCommonFormat_sampleRate_channels_interleaved_, 3, 1, 0, 16000.0);
  if (!v26)
    goto LABEL_13;
  v62 = v10;
  v27 = *(_QWORD *)(v25 + 16);
  if (HIDWORD(v27))
  {
    result = sub_235F4CD14();
    __break(1u);
    return result;
  }
  v28 = v26;
  v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1838]), sel_initWithPCMFormat_frameCapacity_, v26, v27);
  if (!v29)
  {

LABEL_13:
    swift_bridgeObjectRelease();
    v47 = v72;
    if (qword_256394AA0 != -1)
      swift_once();
    v48 = __swift_project_value_buffer(v3, (uint64_t)qword_256395488);
    swift_beginAccess();
    v47[2](v6, v48, v3);
    v49 = sub_235F4C324();
    v50 = sub_235F4CB88();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_235F17000, v49, v50, "Unable to get audio buffer for VAKeywordSpottedEvent for donation", v51, 2u);
      MEMORY[0x23B7E711C](v51, -1, -1);
    }

    v52 = v47[1];
    v53 = v6;
    return ((uint64_t (*)(char *, uint64_t))v52)(v53, v3);
  }
  v30 = v29;
  objc_msgSend(v29, sel_setFrameLength_, objc_msgSend(v29, sel_frameCapacity));
  v31 = (void **)objc_msgSend(v30, sel_int16ChannelData);
  if (!v31)
  {
    swift_bridgeObjectRelease();
    if (qword_256394AA0 != -1)
      swift_once();
    v54 = __swift_project_value_buffer(v3, (uint64_t)qword_256395488);
    swift_beginAccess();
    v55 = v72;
    v56 = v63;
    v72[2](v63, v54, v3);
    v57 = sub_235F4C324();
    v58 = sub_235F4CB88();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v59 = 0;
      _os_log_impl(&dword_235F17000, v57, v58, "Unable to get audio buffer pointer for VAKeywordSpottedEvent for donation", v59, 2u);
      MEMORY[0x23B7E711C](v59, -1, -1);
      v60 = v28;
    }
    else
    {
      v60 = v57;
      v57 = v28;
    }

    v52 = v55[1];
    v53 = v56;
    return ((uint64_t (*)(char *, uint64_t))v52)(v53, v3);
  }
  v32 = (char *)*v31;
  v33 = objc_msgSend(v30, sel_frameLength);
  v34 = (char *)(v25 + 32);
  if (v32 != (char *)(v25 + 32) || v32 >= &v34[2 * v33])
    memmove(v32, v34, 2 * v33);
  swift_bridgeObjectRelease();
  v35 = *(_QWORD *)(v64 + OBJC_IVAR___AVSTriggerController_avsBundleDonorID);
  v63 = *(char **)(v64 + OBJC_IVAR___AVSTriggerController_avsBundleDonorID + 8);
  v64 = v35;
  swift_bridgeObjectRetain();
  sub_235F4C198();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395F58);
  v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_235F4EB10;
  *(_QWORD *)(v36 + 32) = v30;
  v73 = v36;
  sub_235F4CAF8();
  v61[1] = v73;
  v72 = v30;
  sub_235F4C1D4();
  v37 = sub_235F4C360();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v66, 1, 1, v37);
  v38 = sub_235F4C384();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v67, 1, 1, v38);
  v39 = sub_235F4C348();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v68, 1, 1, v39);
  swift_bridgeObjectRetain();
  sub_235F4C354();
  v40 = sub_235F4CB64();
  v41 = (uint64_t)v62;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v62, 1, 1, v40);
  v42 = v65;
  v43 = v69;
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v65, v23, v69);
  v44 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v45 = swift_allocObject();
  *(_QWORD *)(v45 + 16) = 0;
  *(_QWORD *)(v45 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v19 + 32))(v45 + v44, v42, v43);
  sub_235F409E8(v41, (uint64_t)&unk_256395F68, v45, (uint64_t)&unk_250750970, &qword_256394F38);

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v23, v43);
}

void sub_235F43560(void *a1)
{
  id v1;
  void (**v2)(_QWORD, _QWORD, _QWORD);
  void *v3;
  void *v4;

  v1 = objc_msgSend(a1, sel_displayAlertHandler);
  if (v1)
  {
    v2 = (void (**)(_QWORD, _QWORD, _QWORD))v1;
    _Block_copy(v1);
    v3 = (void *)sub_235F4CA74();
    v4 = (void *)sub_235F4CA74();
    ((void (**)(_QWORD, void *, void *))v2)[2](v2, v3, v4);

    _Block_release(v2);
    _Block_release(v2);
  }
}

uint64_t AVSTriggerController.keywordSpotterDidStopWithSummary(json:uuid:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_235F4C33C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256394AA0 != -1)
    swift_once();
  v4 = __swift_project_value_buffer(v0, (uint64_t)qword_256395488);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_235F4C324();
  v6 = sub_235F4CBA0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_235F17000, v5, v6, "Keywors spotter did stop.", v7, 2u);
    MEMORY[0x23B7E711C](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_235F437C4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_235F26988;
  return sub_235F4C36C();
}

uint64_t sub_235F4381C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_235F45580;
  return v6(a1);
}

uint64_t sub_235F43880(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_235F438E4;
  return v6(a1);
}

uint64_t sub_235F438E4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_235F43930(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_235F43A00(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_235F3D6C0((uint64_t)v12, *a3);
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
      sub_235F3D6C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_235F43A00(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_235F4CC00();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_235F43BB8(a5, a6);
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
  v8 = sub_235F4CCD8();
  if (!v8)
  {
    sub_235F4CD14();
    __break(1u);
LABEL_17:
    result = sub_235F4CD50();
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

uint64_t sub_235F43BB8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_235F43C4C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_235F43E24(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_235F43E24(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235F43C4C(uint64_t a1, unint64_t a2)
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
      v3 = sub_235F43DC0(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_235F4CC9C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_235F4CD14();
      __break(1u);
LABEL_10:
      v2 = sub_235F4CAC8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_235F4CD50();
    __break(1u);
LABEL_14:
    result = sub_235F4CD14();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_235F43DC0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395F80);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_235F43E24(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256395F80);
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
  result = sub_235F4CD50();
  __break(1u);
  return result;
}

uint64_t sub_235F43F70(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_235F44D9C(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_235F43FD8(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_235F43FD8(uint64_t *a1)
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
  result = sub_235F4CE04();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_235F446C0(0, v3, 1, a1);
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
          sub_235F4478C((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(_QWORD *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1)
            break;
          if (v99 < v98)
            goto LABEL_148;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v97 = sub_235F44CD0((uint64_t)v97);
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
    v7 = sub_235F4CB10();
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
      v19 = sub_235F4CE1C();
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
      else if (((v19 ^ sub_235F4CE1C()) & 1) != 0)
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
      v11 = sub_235F44A24(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v41 = *((_QWORD *)v11 + 2);
    v40 = *((_QWORD *)v11 + 3);
    v12 = v41 + 1;
    if (v41 >= v40 >> 1)
      v11 = sub_235F44A24((char *)(v40 > 1), v41 + 1, 1, v11);
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
        sub_235F4478C((char *)(v84 + 16 * *(_QWORD *)v86), (char *)(v84 + 16 * *(_QWORD *)v90), v84 + 16 * v91, __dst);
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
          if (v39 || (sub_235F4CE1C() & 1) == 0)
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
  result = sub_235F4CD14();
  __break(1u);
  return result;
}

uint64_t sub_235F446C0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
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
      if (v13 || (result = sub_235F4CE1C(), (result & 1) == 0))
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

uint64_t sub_235F4478C(char *__src, char *a2, unint64_t a3, char *__dst)
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
          if (v23 || (sub_235F4CE1C() & 1) == 0)
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
        if (v15 || (sub_235F4CE1C() & 1) == 0)
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
    sub_235F44B1C((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  result = sub_235F4CD50();
  __break(1u);
  return result;
}

char *sub_235F44A24(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256395F98);
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

char *sub_235F44B1C(void **a1, const void **a2, _QWORD *a3)
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
    result = (char *)sub_235F4CD50();
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

uint64_t sub_235F44BC4(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for AvailableShortcutAction();
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = sub_235F4CD50();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_235F44CD0(uint64_t a1)
{
  return sub_235F44A24(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_235F44CE4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_235F44D4C;
  return v5(v2 + 32);
}

uint64_t sub_235F44D4C()
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

uint64_t sub_235F44D9C(uint64_t a1)
{
  return sub_235F25978(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_235F44DB0(_QWORD *a1)
{
  return sub_235F25AE0(0, a1[2], 0, a1);
}

uint64_t sub_235F44DC8(uint64_t a1)
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
  v7[1] = sub_235F26988;
  return sub_235F41B0C(a1, v4, v5, v6);
}

void sub_235F44E34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v1 = a1 + *(int *)(type metadata accessor for AvailableShortcutAction() + 24);
  v3 = *(_QWORD *)v1;
  v2 = *(_QWORD *)(v1 + 8);
  v4 = *(unsigned __int8 *)(v1 + 16);
  if (v4)
  {
    if (v4 == 1)
    {
      swift_bridgeObjectRetain();
      v9 = (id)sub_235F4CA74();
      sub_235F253B0(v3, v2, 1u);
      AXPIBridgePerformActionForSystemAction(v9);
    }
    else
    {
      v7 = objc_allocWithZone(MEMORY[0x24BE092B8]);
      swift_bridgeObjectRetain();
      v8 = objc_msgSend(v7, sel_init);
      v9 = (id)sub_235F4CA74();
      sub_235F253B0(v3, v2, 2u);
      objc_msgSend(v8, sel_startUIRequest_, v9);

    }
  }
  else
  {
    v5 = objc_allocWithZone(MEMORY[0x24BEC1328]);
    swift_bridgeObjectRetain();
    v6 = (void *)sub_235F4CA74();
    sub_235F253B0(v3, v2, 0);
    v9 = objc_msgSend(v5, sel_initWithWorkflowIdentifier_, v6);

    objc_msgSend(v9, sel_start);
  }

}

uint64_t sub_235F44F88()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_235F44FBC()
{
  uint64_t v0;

  sub_235F43560(*(void **)(v0 + 16));
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

unint64_t sub_235F44FE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256394D80;
  if (!qword_256394D80)
  {
    v1 = sub_235F4C9FC();
    result = MEMORY[0x23B7E7098](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_256394D80);
  }
  return result;
}

unint64_t sub_235F4502C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256394D90;
  if (!qword_256394D90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394D88);
    result = MEMORY[0x23B7E7098](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256394D90);
  }
  return result;
}

uint64_t _sSo20AVSTriggerControllerC22AdaptiveVoiceShortcutsE29keywordSpotterDidUpdateScores10verboseLogySS_tF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_235F4C33C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256394AA0 != -1)
    swift_once();
  v4 = __swift_project_value_buffer(v0, (uint64_t)qword_256395488);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_235F4C324();
  v6 = sub_235F4CBA0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_235F17000, v5, v6, "Keyword spotter did update scores", v7, 2u);
    MEMORY[0x23B7E711C](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

char *keypath_get_selector_displayAlertHandler()
{
  return sel_displayAlertHandler;
}

uint64_t objectdestroyTm_2()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_235F45200(uint64_t a1)
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
  v7[1] = sub_235F26898;
  return sub_235F41B0C(a1, v4, v5, v6);
}

uint64_t sub_235F4526C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_235F45290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_235F40DD0(a1, a2, a3, a4, *(_QWORD *)(v4 + 16));
}

uint64_t sub_235F45298()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F452BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t (*v5)(_QWORD *, _QWORD *);
  _QWORD v7[2];
  _QWORD v8[2];

  v5 = *(uint64_t (**)(_QWORD *, _QWORD *))(v4 + 16);
  v8[0] = a1;
  v8[1] = a2;
  v7[0] = a3;
  v7[1] = a4;
  return v5(v8, v7);
}

uint64_t sub_235F452F4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_235F45324()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_235F4C378();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_235F45398()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  sub_235F4C378();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_235F26988;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_235F26988;
  return sub_235F4C36C();
}

uint64_t sub_235F4542C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_235F26898;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256395F70 + dword_256395F70))(a1, v4);
}

uint64_t sub_235F4549C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_235F26988;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256395F88 + dword_256395F88))(a1, v4);
}

uint64_t sub_235F4550C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_235F26988;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256395FA0 + dword_256395FA0))(a1, v4);
}

uint64_t sub_235F455A8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_235F455E0 + 4 * byte_235F4EB50[a1]))(0xD000000000000011, 0x8000000235F503A0);
}

uint64_t sub_235F455E0()
{
  return 0x696669746E656469;
}

uint64_t sub_235F455FC(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_235F45614()
{
  return 1701667182;
}

uint64_t sub_235F45624()
{
  unsigned __int8 *v0;

  return sub_235F455A8(*v0);
}

uint64_t sub_235F4562C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_235F469D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_235F45650()
{
  sub_235F45888();
  return sub_235F4CE70();
}

uint64_t sub_235F45678()
{
  sub_235F45888();
  return sub_235F4CE7C();
}

uint64_t AdaptiveVoiceShortcut.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395FB8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235F45888();
  sub_235F4CE64();
  v8[15] = 0;
  sub_235F4C1C8();
  sub_235F1BE00(&qword_2563952B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_235F4CDF8();
  if (!v1)
  {
    type metadata accessor for AdaptiveVoiceShortcut();
    v8[14] = 1;
    sub_235F4CDC8();
    v8[13] = 2;
    sub_235F4CDC8();
    v8[12] = 3;
    type metadata accessor for AvailableShortcutAction();
    sub_235F1BE00(&qword_256395FC8, (uint64_t (*)(uint64_t))type metadata accessor for AvailableShortcutAction, (uint64_t)&protocol conformance descriptor for AvailableShortcutAction);
    sub_235F4CDD4();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_235F45888()
{
  unint64_t result;

  result = qword_256395FC0;
  if (!qword_256395FC0)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4ECA4, &type metadata for AdaptiveVoiceShortcut.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256395FC0);
  }
  return result;
}

uint64_t type metadata accessor for AdaptiveVoiceShortcut()
{
  uint64_t result;

  result = qword_256396038;
  if (!qword_256396038)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AdaptiveVoiceShortcut.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  _QWORD v35[2];
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  char v46;
  char v47;
  char v48;
  char v49;

  v38 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC8);
  MEMORY[0x24BDAC7A8](v3);
  v37 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_235F4C1C8();
  v40 = *(_QWORD *)(v5 - 8);
  v41 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v43 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256395FD0);
  v39 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (int *)type metadata accessor for AdaptiveVoiceShortcut();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235F4C1BC();
  v12 = &v11[v9[5]];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  v13 = &v11[v9[6]];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v14 = (uint64_t)&v11[v9[7]];
  v15 = type metadata accessor for AvailableShortcutAction();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v36 = v14;
  v16(v14, 1, 1, v15);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235F45888();
  v44 = v8;
  v17 = v45;
  sub_235F4CE58();
  if (!v17)
  {
    v18 = (uint64_t *)v12;
    v45 = v13;
    v35[1] = v15;
    v20 = v39;
    v19 = v40;
    v21 = a1;
    v49 = 0;
    sub_235F1BE00(&qword_2563952D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    v22 = v42;
    v23 = v41;
    sub_235F4CDA4();
    (*(void (**)(char *, char *, uint64_t))(v19 + 40))(v11, v43, v23);
    v48 = 1;
    v25 = sub_235F4CD74();
    v27 = v26;
    swift_bridgeObjectRelease();
    *v18 = v25;
    v18[1] = v27;
    v47 = 2;
    v28 = sub_235F4CD74();
    v30 = v29;
    v31 = (uint64_t *)v45;
    swift_bridgeObjectRelease();
    *v31 = v28;
    v31[1] = v30;
    v46 = 3;
    sub_235F1BE00(&qword_256395FD8, (uint64_t (*)(uint64_t))type metadata accessor for AvailableShortcutAction, (uint64_t)&protocol conformance descriptor for AvailableShortcutAction);
    v32 = (uint64_t)v37;
    v33 = v44;
    sub_235F4CD80();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v33, v22);
    a1 = v21;
    v34 = v38;
    sub_235F2549C(v32, v36);
    sub_235F1BC80((uint64_t)v11, v34);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_235F1BD10((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for AdaptiveVoiceShortcut);
}

uint64_t sub_235F45CAC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AdaptiveVoiceShortcut.init(from:)(a1, a2);
}

uint64_t sub_235F45CC0(_QWORD *a1)
{
  return AdaptiveVoiceShortcut.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for AdaptiveVoiceShortcut(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int8 v34;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v24 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_235F4C1C8();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = a3[5];
    v10 = a3[6];
    v11 = (uint64_t *)((char *)a1 + v9);
    v12 = (uint64_t *)((char *)a2 + v9);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    v14 = (uint64_t *)((char *)a1 + v10);
    v15 = (uint64_t *)((char *)a2 + v10);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = a3[7];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = type metadata accessor for AvailableShortcutAction();
    v21 = *(_QWORD *)(v20 - 8);
    v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v22(v19, 1, v20))
    {
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC8);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      v8((uint64_t *)v18, (uint64_t *)v19, v7);
      v25 = *(int *)(v20 + 20);
      v26 = &v18[v25];
      v27 = &v19[v25];
      v28 = *((_QWORD *)v27 + 1);
      *(_QWORD *)v26 = *(_QWORD *)v27;
      *((_QWORD *)v26 + 1) = v28;
      v29 = *(int *)(v20 + 24);
      v30 = &v18[v29];
      v31 = &v19[v29];
      v32 = *(_QWORD *)v31;
      v33 = *((_QWORD *)v31 + 1);
      v34 = v31[16];
      swift_bridgeObjectRetain();
      sub_235F3F800(v32, v33, v34);
      *(_QWORD *)v30 = v32;
      *((_QWORD *)v30 + 1) = v33;
      v30[16] = v34;
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
  }
  return a1;
}

uint64_t destroy for AdaptiveVoiceShortcut(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = sub_235F4C1C8();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = a1 + *(int *)(a2 + 28);
  v7 = type metadata accessor for AvailableShortcutAction();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7);
  if (!(_DWORD)result)
  {
    v5(v6, v4);
    swift_bridgeObjectRelease();
    return sub_235F253B0(*(_QWORD *)(v6 + *(int *)(v7 + 24)), *(_QWORD *)(v6 + *(int *)(v7 + 24) + 8), *(_BYTE *)(v6 + *(int *)(v7 + 24) + 16));
  }
  return result;
}

uint64_t initializeWithCopy for AdaptiveVoiceShortcut(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 v32;

  v6 = sub_235F4C1C8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a3[6];
  v10 = (_QWORD *)(a1 + v8);
  v11 = (_QWORD *)(a2 + v8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v13 = (_QWORD *)(a1 + v9);
  v14 = (_QWORD *)(a2 + v9);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = a3[7];
  v17 = (char *)(a1 + v16);
  v18 = (char *)(a2 + v16);
  v19 = type metadata accessor for AvailableShortcutAction();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v21(v18, 1, v19))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC8);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v17, (uint64_t)v18, v6);
    v23 = *(int *)(v19 + 20);
    v24 = &v17[v23];
    v25 = &v18[v23];
    v26 = *((_QWORD *)v25 + 1);
    *(_QWORD *)v24 = *(_QWORD *)v25;
    *((_QWORD *)v24 + 1) = v26;
    v27 = *(int *)(v19 + 24);
    v28 = &v17[v27];
    v29 = &v18[v27];
    v30 = *(_QWORD *)v29;
    v31 = *((_QWORD *)v29 + 1);
    v32 = v29[16];
    swift_bridgeObjectRetain();
    sub_235F3F800(v30, v31, v32);
    *(_QWORD *)v28 = v30;
    *((_QWORD *)v28 + 1) = v31;
    v28[16] = v32;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  return a1;
}

uint64_t assignWithCopy for AdaptiveVoiceShortcut(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  uint64_t v32;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int8 v45;

  v6 = sub_235F4C1C8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = (_QWORD *)(a1 + v9);
  v11 = (_QWORD *)(a2 + v9);
  *v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (_QWORD *)(a2 + v12);
  *v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = a3[7];
  v16 = (char *)(a1 + v15);
  v17 = (char *)(a2 + v15);
  v18 = type metadata accessor for AvailableShortcutAction();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  v21 = v20(v16, 1, v18);
  v22 = v20(v17, 1, v18);
  if (!v21)
  {
    if (!v22)
    {
      v8((uint64_t)v16, (uint64_t)v17, v6);
      v34 = *(int *)(v18 + 20);
      v35 = &v16[v34];
      v36 = &v17[v34];
      *(_QWORD *)v35 = *(_QWORD *)v36;
      *((_QWORD *)v35 + 1) = *((_QWORD *)v36 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v37 = *(int *)(v18 + 24);
      v38 = &v16[v37];
      v39 = &v17[v37];
      v40 = *(_QWORD *)v39;
      v41 = *((_QWORD *)v39 + 1);
      v42 = v39[16];
      sub_235F3F800(*(_QWORD *)v39, v41, v42);
      v43 = *(_QWORD *)v38;
      v44 = *((_QWORD *)v38 + 1);
      *(_QWORD *)v38 = v40;
      *((_QWORD *)v38 + 1) = v41;
      v45 = v38[16];
      v38[16] = v42;
      sub_235F253B0(v43, v44, v45);
      return a1;
    }
    sub_235F1BD10((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC8);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v16, v17, v6);
  v23 = *(int *)(v18 + 20);
  v24 = &v16[v23];
  v25 = &v17[v23];
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
  v26 = *(int *)(v18 + 24);
  v27 = &v16[v26];
  v28 = &v17[v26];
  v29 = *(_QWORD *)v28;
  v30 = *((_QWORD *)v28 + 1);
  v31 = v28[16];
  swift_bridgeObjectRetain();
  sub_235F3F800(v29, v30, v31);
  *(_QWORD *)v27 = v29;
  *((_QWORD *)v27 + 1) = v30;
  v27[16] = v31;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  return a1;
}

uint64_t initializeWithTake for AdaptiveVoiceShortcut(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;

  v6 = sub_235F4C1C8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  v9 = a3[7];
  v10 = (char *)(a1 + v9);
  v11 = (char *)(a2 + v9);
  v12 = type metadata accessor for AvailableShortcutAction();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v10, (uint64_t)v11, v6);
    *(_OWORD *)&v10[*(int *)(v12 + 20)] = *(_OWORD *)&v11[*(int *)(v12 + 20)];
    v15 = *(int *)(v12 + 24);
    v16 = &v10[v15];
    v17 = &v11[v15];
    v16[16] = v17[16];
    *(_OWORD *)v16 = *(_OWORD *)v17;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  return a1;
}

uint64_t assignWithTake for AdaptiveVoiceShortcut(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  int v25;
  int v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  unsigned __int8 v43;

  v6 = sub_235F4C1C8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = (_QWORD *)(a1 + v9);
  v11 = (uint64_t *)(a2 + v9);
  v13 = *v11;
  v12 = v11[1];
  *v10 = v13;
  v10[1] = v12;
  swift_bridgeObjectRelease();
  v14 = a3[6];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (uint64_t *)(a2 + v14);
  v18 = *v16;
  v17 = v16[1];
  *v15 = v18;
  v15[1] = v17;
  swift_bridgeObjectRelease();
  v19 = a3[7];
  v20 = (char *)(a1 + v19);
  v21 = (char *)(a2 + v19);
  v22 = type metadata accessor for AvailableShortcutAction();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  v25 = v24(v20, 1, v22);
  v26 = v24(v21, 1, v22);
  if (!v25)
  {
    if (!v26)
    {
      v8((uint64_t)v20, (uint64_t)v21, v6);
      v32 = *(int *)(v22 + 20);
      v33 = &v20[v32];
      v34 = &v21[v32];
      v36 = *(_QWORD *)v34;
      v35 = *((_QWORD *)v34 + 1);
      *(_QWORD *)v33 = v36;
      *((_QWORD *)v33 + 1) = v35;
      swift_bridgeObjectRelease();
      v37 = *(int *)(v22 + 24);
      v38 = &v20[v37];
      v39 = &v21[v37];
      v40 = v39[16];
      v41 = *(_QWORD *)v38;
      v42 = *((_QWORD *)v38 + 1);
      *(_OWORD *)v38 = *(_OWORD *)v39;
      v43 = v38[16];
      v38[16] = v40;
      sub_235F253B0(v41, v42, v43);
      return a1;
    }
    sub_235F1BD10((uint64_t)v20, (uint64_t (*)(_QWORD))type metadata accessor for AvailableShortcutAction);
    goto LABEL_6;
  }
  if (v26)
  {
LABEL_6:
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC8);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v20, v21, v6);
  *(_OWORD *)&v20[*(int *)(v22 + 20)] = *(_OWORD *)&v21[*(int *)(v22 + 20)];
  v27 = *(int *)(v22 + 24);
  v28 = &v20[v27];
  v29 = &v21[v27];
  v28[16] = v29[16];
  *(_OWORD *)v28 = *(_OWORD *)v29;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdaptiveVoiceShortcut()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235F465D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;
  uint64_t v11;

  v6 = sub_235F4C1C8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  if ((_DWORD)a2 == 2147483646)
  {
    v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
    if (v9 >= 0xFFFFFFFF)
      LODWORD(v9) = -1;
    v10 = v9 - 1;
    if (v10 < 0)
      v10 = -1;
    return (v10 + 1);
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for AdaptiveVoiceShortcut()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_235F4669C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_235F4C1C8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = a2;
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC8);
    v12 = a1 + *(int *)(a4 + 28);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_235F46748()
{
  unint64_t v0;
  unint64_t v1;

  sub_235F4C1C8();
  if (v0 <= 0x3F)
  {
    sub_235F467D8();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_235F467D8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256396048[0])
  {
    type metadata accessor for AvailableShortcutAction();
    v0 = sub_235F4CBE8();
    if (!v1)
      atomic_store(v0, qword_256396048);
  }
}

uint64_t storeEnumTagSinglePayload for AdaptiveVoiceShortcut.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235F46878 + 4 * byte_235F4EB59[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_235F468AC + 4 * byte_235F4EB54[v4]))();
}

uint64_t sub_235F468AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F468B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235F468BCLL);
  return result;
}

uint64_t sub_235F468C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235F468D0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_235F468D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235F468DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AdaptiveVoiceShortcut.CodingKeys()
{
  return &type metadata for AdaptiveVoiceShortcut.CodingKeys;
}

unint64_t sub_235F468FC()
{
  unint64_t result;

  result = qword_256396080;
  if (!qword_256396080)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4EC7C, &type metadata for AdaptiveVoiceShortcut.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256396080);
  }
  return result;
}

unint64_t sub_235F46944()
{
  unint64_t result;

  result = qword_256396088;
  if (!qword_256396088)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4EBEC, &type metadata for AdaptiveVoiceShortcut.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256396088);
  }
  return result;
}

unint64_t sub_235F4698C()
{
  unint64_t result;

  result = qword_256396090;
  if (!qword_256396090)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4EC14, &type metadata for AdaptiveVoiceShortcut.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256396090);
  }
  return result;
}

uint64_t sub_235F469D0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_235F4CE1C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_235F4CE1C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000235F503A0 || (sub_235F4CE1C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000235F503C0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_235F4CE1C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

ValueMetadata *type metadata accessor for AVSCommandRecordingView()
{
  return &type metadata for AVSCommandRecordingView;
}

uint64_t sub_235F46B74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235F46B84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
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
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t (**v39)();
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
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

  v45 = a1;
  v56 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563960A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563960A8);
  MEMORY[0x24BDAC7A8](v46);
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563960B0);
  MEMORY[0x24BDAC7A8](v47);
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563960B8);
  MEMORY[0x24BDAC7A8](v51);
  v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563960C0);
  v50 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v48 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563960C8);
  MEMORY[0x24BDAC7A8](v49);
  v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563960D0);
  MEMORY[0x24BDAC7A8](v53);
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563960D8);
  MEMORY[0x24BDAC7A8](v55);
  v54 = (uint64_t)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v7 = sub_235F4C630();
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563960E0);
  sub_235F47234(a1, a2, &v7[*(int *)(v20 + 44)]);
  sub_235F4C9A8();
  sub_235F4C99C();
  swift_release();
  v21 = sub_235F4C990();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  swift_release();
  v22 = v59;
  sub_235F1BEC4((uint64_t)v7, (uint64_t)v9, &qword_2563960A0);
  v23 = (uint64_t *)&v9[*(int *)(v46 + 36)];
  *v23 = v21;
  v23[1] = v22;
  sub_235F1BF08((uint64_t)v7, &qword_2563960A0);
  LOBYTE(v7) = sub_235F4C72C();
  sub_235F4C3FC();
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  sub_235F1BEC4((uint64_t)v9, (uint64_t)v11, &qword_2563960A8);
  v32 = &v11[*(int *)(v47 + 36)];
  *v32 = (char)v7;
  *((_QWORD *)v32 + 1) = v25;
  *((_QWORD *)v32 + 2) = v27;
  *((_QWORD *)v32 + 3) = v29;
  *((_QWORD *)v32 + 4) = v31;
  v32[40] = 0;
  sub_235F1BF08((uint64_t)v9, &qword_2563960A8);
  sub_235F4C984();
  sub_235F483E4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v13, 0.0, 1, INFINITY, 0);
  sub_235F1BF08((uint64_t)v11, &qword_2563960B0);
  v33 = v45;
  v57 = v45;
  v58 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394C60);
  sub_235F4A460(&qword_2563960E8, &qword_2563960B8, sub_235F48864, MEMORY[0x24BDEDBB8]);
  sub_235F1BF90(&qword_256394C70, &qword_256394C60, MEMORY[0x24BDF43B0]);
  v34 = v48;
  sub_235F4C888();
  sub_235F1BF08((uint64_t)v13, &qword_2563960B8);
  LOBYTE(v11) = sub_235F4C720();
  v35 = v50;
  v36 = v52;
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v16, v34, v52);
  v37 = &v16[*(int *)(v49 + 36)];
  *v37 = (char)v11;
  *(_OWORD *)(v37 + 8) = 0u;
  *(_OWORD *)(v37 + 24) = 0u;
  v37[40] = 1;
  (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v36);
  v38 = swift_allocObject();
  *(_QWORD *)(v38 + 16) = v33;
  *(_QWORD *)(v38 + 24) = a2;
  sub_235F1BEC4((uint64_t)v16, (uint64_t)v18, &qword_2563960C8);
  v39 = (uint64_t (**)())&v18[*(int *)(v53 + 36)];
  *v39 = sub_235F48948;
  v39[1] = (uint64_t (*)())v38;
  v39[2] = 0;
  v39[3] = 0;
  swift_retain();
  sub_235F1BF08((uint64_t)v16, &qword_2563960C8);
  v40 = swift_allocObject();
  *(_QWORD *)(v40 + 16) = v33;
  *(_QWORD *)(v40 + 24) = a2;
  v41 = v54;
  sub_235F1BEC4((uint64_t)v18, v54, &qword_2563960D0);
  v42 = (_QWORD *)(v41 + *(int *)(v55 + 36));
  *v42 = 0;
  v42[1] = 0;
  v42[2] = sub_235F48974;
  v42[3] = v40;
  swift_retain();
  sub_235F1BF08((uint64_t)v18, &qword_2563960D0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  swift_release();
  v43 = swift_allocObject();
  *(_QWORD *)(v43 + 16) = v33;
  *(_QWORD *)(v43 + 24) = a2;
  sub_235F4A460(&qword_256396118, &qword_2563960D8, sub_235F48984, MEMORY[0x24BDF0910]);
  swift_retain();
  sub_235F4C894();
  swift_release();
  return sub_235F1BF08(v41, &qword_2563960D8);
}

uint64_t sub_235F47234@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t KeyPath;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  char *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _OWORD *v62;
  __int128 v63;
  uint64_t v64;
  void (*v65)(char *, char *, uint64_t);
  char *v66;
  uint64_t v67;
  char *v68;
  int *v69;
  char *v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t);
  uint64_t v79;
  uint64_t v81;
  uint64_t v82;
  int v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  int v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  _OWORD v108[12];
  char v109;
  _BYTE v110[200];
  char v111;
  _BYTE v112[7];
  unsigned __int8 v113;
  _BYTE v114[7];
  unsigned __int8 v115;
  _BYTE v116[7];
  unsigned __int8 v117;
  _BYTE v118[7];
  _QWORD v119[40];
  uint64_t v120;
  uint64_t v121;
  char v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  _BYTE v136[7];
  uint64_t v137;
  char v138;
  _BYTE v139[7];
  uint64_t v140;
  char v141;
  _BYTE v142[7];
  char *v143;
  uint64_t v144;
  char v145;
  _BYTE v146[7];
  __int128 v147;
  __int128 v148;
  char v149;
  uint64_t v150;
  unsigned __int8 v151;
  uint64_t v152;
  unsigned __int8 v153;
  char *v154;
  uint64_t v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;

  v90 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396130);
  MEMORY[0x24BDAC7A8](v5);
  v89 = (uint64_t *)((char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396138);
  v7 = MEMORY[0x24BDAC7A8](v88);
  v91 = (uint64_t)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v103 = (uint64_t)&v81 - v9;
  v10 = sub_235F4C624();
  v98 = *(_QWORD *)(v10 - 8);
  v99 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563951F0);
  MEMORY[0x24BDAC7A8](v13);
  v101 = (char *)&v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396140);
  MEMORY[0x24BDAC7A8](v97);
  v16 = (char *)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396148);
  MEMORY[0x24BDAC7A8](v102);
  v18 = (char *)&v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396150);
  v106 = *(_QWORD *)(v19 - 8);
  v107 = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v104 = (char *)&v81 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v100 = (char *)&v81 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v105 = (char *)&v81 - v24;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  swift_release();
  v86 = a1;
  v87 = a2;
  sub_235F498C8();
  if (qword_256394AA8 != -1)
    swift_once();
  v25 = (void *)qword_256398358;
  if (!qword_256398358)
    v26 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v27 = v25;
  v120 = sub_235F4C7BC();
  v121 = v28;
  v122 = v29 & 1;
  *(_QWORD *)((char *)&v123 + 7) = v30;
  sub_235F4C618();
  v31 = (uint64_t)v101;
  sub_235F4C84C();
  (*(void (**)(char *, uint64_t))(v98 + 8))(v12, v99);
  sub_235F1BF54(v120, v121, v122);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  sub_235F1BEC4(v31, (uint64_t)v16, &qword_2563951F0);
  v33 = &v16[*(int *)(v97 + 36)];
  *(_QWORD *)v33 = KeyPath;
  v33[8] = 1;
  sub_235F1BF08(v31, &qword_2563951F0);
  v34 = sub_235F4C768();
  v35 = swift_getKeyPath();
  sub_235F1BEC4((uint64_t)v16, (uint64_t)v18, &qword_256396140);
  v36 = (uint64_t *)&v18[*(int *)(v102 + 36)];
  *v36 = v35;
  v36[1] = v34;
  sub_235F1BF08((uint64_t)v16, &qword_256396140);
  sub_235F49C44();
  v37 = v100;
  sub_235F4C864();
  sub_235F1BF08((uint64_t)v18, &qword_256396148);
  (*(void (**)(char *, char *, uint64_t))(v106 + 32))(v105, v37, v107);
  sub_235F3DA44(0xD000000000000026);
  v38 = (void *)qword_256398358;
  if (qword_256398358)
  {
    v39 = (id)qword_256398358;
  }
  else
  {
    v39 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v38 = 0;
  }
  v40 = v38;
  sub_235F4C108();

  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394AD8);
  v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_235F4ED00;
  v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16F0]), sel_init);
  sub_235F49D4C();
  v43 = (void *)sub_235F4CBDC();
  v44 = objc_msgSend(v42, sel_stringFromNumber_, v43);

  if (v44)
  {
    v45 = sub_235F4CA80();
    v47 = v46;

  }
  else
  {

    v45 = 0;
    v47 = 0xE000000000000000;
  }
  *(_QWORD *)(v41 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v41 + 64) = sub_235F1BC3C();
  *(_QWORD *)(v41 + 32) = v45;
  *(_QWORD *)(v41 + 40) = v47;
  v48 = sub_235F4CA8C();
  v50 = v49;
  swift_bridgeObjectRelease();
  v120 = v48;
  v121 = v50;
  sub_235F1EA80();
  v51 = sub_235F4C7C8();
  v82 = v51;
  v85 = v52;
  v93 = v53;
  v84 = v54 & 1;
  v92 = swift_getKeyPath();
  v83 = sub_235F4C720();
  v102 = sub_235F4C5B8();
  v56 = v86;
  v55 = v87;
  sub_235F47EFC((uint64_t)v108);
  *(_OWORD *)&v110[151] = v108[9];
  *(_OWORD *)&v110[167] = v108[10];
  *(_OWORD *)&v110[183] = v108[11];
  *(_OWORD *)&v110[87] = v108[5];
  *(_OWORD *)&v110[103] = v108[6];
  *(_OWORD *)&v110[119] = v108[7];
  *(_OWORD *)&v110[135] = v108[8];
  *(_OWORD *)&v110[23] = v108[1];
  *(_OWORD *)&v110[39] = v108[2];
  *(_OWORD *)&v110[55] = v108[3];
  *(_OWORD *)&v110[71] = v108[4];
  v111 = 1;
  v110[199] = v109;
  *(_OWORD *)&v110[7] = v108[0];
  LODWORD(v101) = 1;
  sub_235F4C984();
  sub_235F4C480();
  v97 = v150;
  v98 = v152;
  v99 = v155;
  v100 = v154;
  v115 = v151;
  v113 = v153;
  v57 = sub_235F4C720();
  v94 = v115;
  v95 = v113;
  v96 = v57;
  v117 = 1;
  v58 = sub_235F4C5B8();
  v59 = (uint64_t)v89;
  *v89 = v58;
  *(_QWORD *)(v59 + 8) = 0x4000000000000000;
  *(_BYTE *)(v59 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256396168);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  v60 = swift_allocObject();
  *(_QWORD *)(v60 + 16) = v56;
  *(_QWORD *)(v60 + 24) = v55;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395538);
  sub_235F1BF90(&qword_256396170, &qword_256395538, MEMORY[0x24BEE12D8]);
  sub_235F49DF0();
  sub_235F4C96C();
  sub_235F4C984();
  sub_235F4C480();
  v61 = v91;
  sub_235F1BEC4(v59, v91, &qword_256396130);
  v62 = (_OWORD *)(v61 + *(int *)(v88 + 36));
  v63 = v157;
  *v62 = v156;
  v62[1] = v63;
  v62[2] = v158;
  sub_235F1BF08(v59, &qword_256396130);
  v64 = v103;
  sub_235F1EBAC(v61, v103, &qword_256396138);
  v65 = *(void (**)(char *, char *, uint64_t))(v106 + 16);
  v66 = v104;
  v67 = v107;
  v65(v104, v105, v107);
  LOBYTE(v56) = v117;
  LODWORD(v89) = v117;
  sub_235F1BEC4(v64, v61, &qword_256396138);
  v68 = v90;
  v65(v90, v66, v67);
  v69 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_256396180);
  v70 = &v68[v69[12]];
  *(_QWORD *)v70 = v51;
  v71 = v85;
  *((_QWORD *)v70 + 1) = v85;
  v72 = v83;
  LOBYTE(v66) = v84;
  v70[16] = v84;
  v73 = v92;
  *((_QWORD *)v70 + 3) = v93;
  *((_QWORD *)v70 + 4) = v73;
  v70[40] = 1;
  v70[48] = v72;
  *(_OWORD *)(v70 + 56) = 0u;
  *(_OWORD *)(v70 + 72) = 0u;
  v70[88] = 1;
  v74 = v69[16];
  *(_OWORD *)((char *)&v119[2] + 1) = *(_OWORD *)v110;
  *(_OWORD *)((char *)&v119[20] + 1) = *(_OWORD *)&v110[144];
  *(_OWORD *)((char *)&v119[22] + 1) = *(_OWORD *)&v110[160];
  *(_OWORD *)((char *)&v119[24] + 1) = *(_OWORD *)&v110[176];
  *(_OWORD *)((char *)&v119[12] + 1) = *(_OWORD *)&v110[80];
  *(_OWORD *)((char *)&v119[14] + 1) = *(_OWORD *)&v110[96];
  *(_OWORD *)((char *)&v119[16] + 1) = *(_OWORD *)&v110[112];
  *(_OWORD *)((char *)&v119[18] + 1) = *(_OWORD *)&v110[128];
  *(_OWORD *)((char *)&v119[6] + 1) = *(_OWORD *)&v110[32];
  *(_OWORD *)((char *)&v119[8] + 1) = *(_OWORD *)&v110[48];
  *(_OWORD *)((char *)&v119[10] + 1) = *(_OWORD *)&v110[64];
  v119[0] = v102;
  v119[1] = 0;
  LOBYTE(v119[2]) = (_BYTE)v101;
  *(_QWORD *)((char *)&v119[26] + 1) = *(_QWORD *)&v110[192];
  *(_OWORD *)((char *)&v119[4] + 1) = *(_OWORD *)&v110[16];
  *(_DWORD *)((char *)&v119[27] + 1) = *(_DWORD *)v116;
  HIDWORD(v119[27]) = *(_DWORD *)&v116[3];
  v119[28] = v97;
  LOBYTE(v119[29]) = v94;
  *(_DWORD *)((char *)&v119[29] + 1) = *(_DWORD *)v114;
  HIDWORD(v119[29]) = *(_DWORD *)&v114[3];
  v119[30] = v98;
  LOBYTE(v119[31]) = v95;
  *(_DWORD *)((char *)&v119[31] + 1) = *(_DWORD *)v112;
  HIDWORD(v119[31]) = *(_DWORD *)&v112[3];
  v119[32] = v100;
  v119[33] = v99;
  LOBYTE(v119[34]) = v96;
  *(_DWORD *)((char *)&v119[34] + 1) = *(_DWORD *)v118;
  HIDWORD(v119[34]) = *(_DWORD *)&v118[3];
  memset(&v119[35], 0, 32);
  LOBYTE(v119[39]) = v56;
  memcpy(&v68[v74], v119, 0x139uLL);
  v75 = &v68[v69[20]];
  *(_QWORD *)v75 = 0;
  v75[8] = 1;
  sub_235F1BEC4(v61, (uint64_t)&v68[v69[24]], &qword_256396138);
  v76 = &v68[v69[28]];
  *(_QWORD *)v76 = 0;
  v76[8] = 1;
  v77 = v82;
  sub_235F1BF44(v82, v71, (char)v66);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_235F49E34((uint64_t)v119);
  sub_235F1BF08(v103, &qword_256396138);
  v78 = *(void (**)(char *, uint64_t))(v106 + 8);
  v79 = v107;
  v78(v105, v107);
  sub_235F1BF08(v61, &qword_256396138);
  v132 = *(_OWORD *)&v110[144];
  v133 = *(_OWORD *)&v110[160];
  v134 = *(_OWORD *)&v110[176];
  v128 = *(_OWORD *)&v110[80];
  v129 = *(_OWORD *)&v110[96];
  v130 = *(_OWORD *)&v110[112];
  v131 = *(_OWORD *)&v110[128];
  v124 = *(_OWORD *)&v110[16];
  v125 = *(_OWORD *)&v110[32];
  v126 = *(_OWORD *)&v110[48];
  v127 = *(_OWORD *)&v110[64];
  v120 = v102;
  v121 = 0;
  v122 = (char)v101;
  v135 = *(_QWORD *)&v110[192];
  v123 = *(_OWORD *)v110;
  *(_DWORD *)v136 = *(_DWORD *)v116;
  *(_DWORD *)&v136[3] = *(_DWORD *)&v116[3];
  v137 = v97;
  v138 = v94;
  *(_DWORD *)v139 = *(_DWORD *)v114;
  *(_DWORD *)&v139[3] = *(_DWORD *)&v114[3];
  v140 = v98;
  v141 = v95;
  *(_DWORD *)v142 = *(_DWORD *)v112;
  *(_DWORD *)&v142[3] = *(_DWORD *)&v112[3];
  v143 = v100;
  v144 = v99;
  v145 = v96;
  *(_DWORD *)v146 = *(_DWORD *)v118;
  *(_DWORD *)&v146[3] = *(_DWORD *)&v118[3];
  v147 = 0u;
  v148 = 0u;
  v149 = (char)v89;
  sub_235F49E7C((uint64_t)&v120);
  sub_235F1BF54(v77, v71, (char)v66);
  swift_release();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v78)(v104, v79);
}

double sub_235F47EFC@<D0>(uint64_t a1@<X8>)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  double result;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  swift_release();
  v16 = v17 > 0;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  swift_release();
  v2 = v17;
  v21 = 0x4040000000000000;
  sub_235F4C90C();
  v3 = v17;
  v4 = v18;
  v5 = sub_235F4C744();
  sub_235F480E4((uint64_t)&v17);
  v6 = v17;
  v7 = v18;
  v8 = v19;
  v9 = v20;
  sub_235F48264((uint64_t)&v17);
  v10 = v17;
  v11 = v18;
  v12 = v19;
  v13 = v20;
  v14 = sub_235F4C750();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v16;
  *(_BYTE *)(a1 + 17) = v2;
  *(_BYTE *)(a1 + 24) = v5;
  result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_BYTE *)(a1 + 64) = 1;
  *(_QWORD *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 80) = 1;
  *(_QWORD *)(a1 + 88) = v6;
  *(_QWORD *)(a1 + 96) = v7;
  *(_BYTE *)(a1 + 104) = v8;
  *(_BYTE *)(a1 + 105) = v9;
  *(_QWORD *)(a1 + 112) = 0;
  *(_BYTE *)(a1 + 120) = 1;
  *(_QWORD *)(a1 + 128) = v10;
  *(_QWORD *)(a1 + 136) = v11;
  *(_BYTE *)(a1 + 144) = v12;
  *(_BYTE *)(a1 + 145) = v13;
  *(_BYTE *)(a1 + 152) = v14;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_BYTE *)(a1 + 192) = 1;
  return result;
}

double sub_235F480E4@<D0>(uint64_t a1@<X8>)
{
  char v2;
  double result;
  double v4;
  uint64_t v5;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  swift_release();
  if (*(_QWORD *)&v4 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_235F4C3CC();
    swift_release();
    swift_release();
    swift_release();
    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  sub_235F4C90C();
  result = v4;
  *(double *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = *(_QWORD *)&v4 > 1;
  *(_BYTE *)(a1 + 17) = v2;
  return result;
}

double sub_235F48264@<D0>(uint64_t a1@<X8>)
{
  char v2;
  double result;
  double v4;
  uint64_t v5;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  swift_release();
  if (*(_QWORD *)&v4 == 2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_235F4C3CC();
    swift_release();
    swift_release();
    swift_release();
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }
  sub_235F4C90C();
  result = v4;
  *(double *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = *(_QWORD *)&v4 == 3;
  *(_BYTE *)(a1 + 17) = v2;
  return result;
}

__n128 sub_235F483E4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  _OWORD *v24;
  __n128 result;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __n128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_235F4CB94();
    v23 = (void *)sub_235F4C6FC();
    sub_235F4C318();

  }
  sub_235F4C504();
  sub_235F1BEC4(v13, a9, &qword_2563960B0);
  v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2563960B8) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *v24 = v26;
  v24[1] = v27;
  result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_235F485A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  return sub_235F4C93C();
}

uint64_t sub_235F4861C(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain_n();
  sub_235F4C3D8();
  v3 = (_QWORD *)(a2 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allSuccessfulEnrollments);
  swift_beginAccess();
  v4 = MEMORY[0x24BEE4AF8];
  *v3 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  v5 = (_QWORD *)(a2 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allCollectedEnrollments);
  swift_beginAccess();
  *v5 = v4;
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3D8();
  return sub_235F3BE0C();
}

uint64_t sub_235F4874C()
{
  uint64_t result;
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  result = swift_release();
  if (v1 == 3)
  {
    swift_retain();
    sub_235F322FC();
    swift_release();
    swift_retain();
    sub_235F32F98();
    return swift_release();
  }
  return result;
}

uint64_t sub_235F487FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *v1;
  v3 = v1[1];
  *(_QWORD *)a1 = sub_235F4C5B8();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396098);
  return sub_235F46B84(v4, v3, a1 + *(int *)(v5 + 44));
}

uint64_t sub_235F4885C()
{
  uint64_t v0;

  return sub_235F485A0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_235F48864()
{
  return sub_235F4A460(&qword_2563960F0, &qword_2563960B0, (uint64_t (*)(void))sub_235F48888, MEMORY[0x24BDECC60]);
}

unint64_t sub_235F48888()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2563960F8;
  if (!qword_2563960F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563960A8);
    v2[0] = sub_235F1BF90(&qword_256396100, &qword_2563960A0, MEMORY[0x24BDF4700]);
    v2[1] = sub_235F1BF90(&qword_256396108, &qword_256396110, MEMORY[0x24BDEEC10]);
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2563960F8);
  }
  return result;
}

uint64_t sub_235F48924()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F48948()
{
  swift_retain();
  sub_235F31A20();
  return swift_release();
}

uint64_t sub_235F48974()
{
  uint64_t v0;

  return sub_235F4861C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_235F4897C()
{
  return sub_235F4874C();
}

uint64_t sub_235F48984()
{
  return sub_235F4A460(&qword_256396120, &qword_2563960D0, (uint64_t (*)(void))sub_235F489A8, MEMORY[0x24BDF0910]);
}

unint64_t sub_235F489A8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_256396128;
  if (!qword_256396128)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563960C8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563960B8);
    v2[3] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394C60);
    v2[4] = sub_235F4A460(&qword_2563960E8, &qword_2563960B8, sub_235F48864, MEMORY[0x24BDEDBB8]);
    v2[5] = sub_235F1BF90(&qword_256394C70, &qword_256394C60, MEMORY[0x24BDF43B0]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256396128);
  }
  return result;
}

_QWORD *sub_235F48AA8@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v20;
  char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  char *v42;
  uint64_t v43;
  uint64_t (*v44)@<X0>(uint64_t *@<X8>);
  uint64_t (*v45)@<X0>(uint64_t *@<X8>);
  uint64_t (**v46)@<X0>(uint64_t *@<X8>);
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t KeyPath;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  _BYTE v66[160];
  _QWORD v67[20];
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  char v84;
  __int128 v85;
  double v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  char v94;
  __int128 v95;
  double v96;
  uint64_t v97;

  v65 = a2;
  v64 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563961B8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563961C0);
  MEMORY[0x24BDAC7A8](v9);
  v63 = (uint64_t)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563961C8);
  MEMORY[0x24BDAC7A8](v60);
  v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563961D0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563961D8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v50 - v20;
  v96 = a4;
  v59 = a1;
  v97 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563961E0);
  sub_235F4C918();
  v61 = v13;
  v62 = v16;
  if ((v68 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    v22 = v65;
    if ((v65 & 1) != 0)
    {
      v24 = sub_235F4C8DC();
    }
    else if ((v65 & 0x100) != 0)
    {
      v24 = sub_235F4C8B8();
    }
    else
    {
      v23 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemFillColor);
      v24 = MEMORY[0x23B7E65E8](v23);
    }
    v56 = v24;
    sub_235F4C45C();
    v25 = v86;
    v26 = v87;
    v27 = v88;
    v53 = v89;
    v28 = v90;
    v29 = sub_235F4C984();
    v57 = v8;
    v58 = v21;
    v54 = v30;
    v55 = v29;
    if ((v22 & 1) != 0)
    {
      v32 = sub_235F4C8DC();
    }
    else if ((v22 & 0x100) != 0)
    {
      v32 = sub_235F4C8B8();
    }
    else
    {
      v31 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemFillColor);
      v32 = MEMORY[0x23B7E65E8](v31);
    }
    v52 = v32;
    KeyPath = swift_getKeyPath();
    v33 = sub_235F4C984();
    v35 = v34;
    v96 = a4;
    v36 = v59;
    v97 = v59;
    sub_235F4C918();
    v96 = a4;
    v97 = v36;
    sub_235F4C918();
    sub_235F4C984();
    sub_235F4C480();
    LOBYTE(v67[0]) = v92;
    v66[0] = v94;
    *(double *)&v68 = v25 * 0.5;
    *((double *)&v68 + 1) = v25;
    v69 = v26;
    v70 = v27;
    v71 = v53;
    v72 = v28;
    v73 = v56;
    v74 = 256;
    v75 = v55;
    v76 = v54;
    v77 = KeyPath;
    v78 = v52;
    v79 = v33;
    v80 = v35;
    v81 = v91;
    v82 = v92;
    v83 = v93;
    v84 = v94;
    v85 = v95;
    nullsub_1(&v68);
    sub_235F1EBAC((uint64_t)&v68, (uint64_t)&v96, &qword_2563961E8);
    v8 = v57;
    v21 = v58;
  }
  else
  {
    sub_235F4A378(&v68);
    sub_235F1EBAC((uint64_t)&v68, (uint64_t)&v96, &qword_2563961E8);
  }
  v37 = v63;
  sub_235F490B4(v65 & 0x101, v63);
  v38 = sub_235F4C774();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v8, 1, 1, v38);
  v39 = sub_235F4C78C();
  sub_235F1BF08((uint64_t)v8, &qword_2563961B8);
  v40 = swift_getKeyPath();
  sub_235F1BEC4(v37, (uint64_t)v12, &qword_2563961C0);
  v41 = (uint64_t *)&v12[*(int *)(v60 + 36)];
  *v41 = v40;
  v41[1] = v39;
  sub_235F1BF08(v37, &qword_2563961C0);
  LOBYTE(v39) = sub_235F4C720();
  sub_235F1BEC4((uint64_t)v12, (uint64_t)v15, &qword_2563961C8);
  v42 = &v15[*(int *)(v61 + 36)];
  *v42 = v39;
  *(_OWORD *)(v42 + 8) = 0u;
  *(_OWORD *)(v42 + 24) = 0u;
  v42[40] = 1;
  sub_235F1BF08((uint64_t)v12, &qword_2563961C8);
  v43 = sub_235F4C984();
  v45 = v44;
  sub_235F1BEC4((uint64_t)v15, (uint64_t)v19, &qword_2563961D0);
  v46 = (uint64_t (**)@<X0>(uint64_t *@<X8>))&v19[*(int *)(v62 + 36)];
  *v46 = sub_235F494D8;
  v46[1] = 0;
  v46[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v43;
  v46[3] = v45;
  sub_235F1BF08((uint64_t)v15, &qword_2563961D0);
  sub_235F1EBAC((uint64_t)v19, (uint64_t)v21, &qword_2563961D8);
  sub_235F1EBAC((uint64_t)&v96, (uint64_t)v66, &qword_2563961E8);
  sub_235F1BEC4((uint64_t)v21, (uint64_t)v19, &qword_2563961D8);
  sub_235F1EBAC((uint64_t)v66, (uint64_t)v67, &qword_2563961E8);
  v47 = v64;
  sub_235F1EBAC((uint64_t)v67, v64, &qword_2563961E8);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563961F0);
  sub_235F1BEC4((uint64_t)v19, v47 + *(int *)(v48 + 48), &qword_2563961D8);
  sub_235F4A2C8(v67, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_235F4A27C);
  sub_235F1BF08((uint64_t)v21, &qword_2563961D8);
  sub_235F1BF08((uint64_t)v19, &qword_2563961D8);
  sub_235F1EBAC((uint64_t)v66, (uint64_t)&v68, &qword_2563961E8);
  return sub_235F4A2C8(&v68, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_235F4A32C);
}

uint64_t sub_235F490B4@<X0>(__int16 a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t KeyPath;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v36[2];
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563950F0);
  v44 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v36 - v8;
  v10 = sub_235F4C9F0();
  v40 = *(_QWORD *)(v10 - 8);
  v41 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_235F4C9D8();
  v39 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_235F4C51C();
  v42 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = v17;
  if ((a1 & 1) != 0)
  {
    v37 = a2;
    v38 = (char *)v4;
LABEL_6:
    v28 = sub_235F4C900();
    v29 = sub_235F4C8E8();
    v45 = v28;
    v46 = v29;
    sub_235F4C780();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256395100);
    sub_235F25418();
    sub_235F4C7EC();
    swift_release();
    swift_release();
    sub_235F4C9CC();
    sub_235F4C9E4();
    sub_235F1BE00(&qword_2563961F8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF5618], MEMORY[0x24BDF5608]);
    sub_235F4C510();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v41);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v15, v13);
    KeyPath = swift_getKeyPath();
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563961C0);
    a2 = v37;
    v32 = (uint64_t *)(v37 + *(int *)(v31 + 36));
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396200);
    v27 = v42;
    v23 = v43;
    (*(void (**)(char *, char *, uint64_t))(v42 + 16))((char *)v32 + *(int *)(v33 + 28), v19, v43);
    *v32 = KeyPath;
    v4 = (uint64_t)v38;
    goto LABEL_7;
  }
  if ((a1 & 0x100) != 0)
  {
    v37 = a2;
    v38 = (char *)v4;
    goto LABEL_6;
  }
  v20 = sub_235F4C900();
  v37 = v20;
  v21 = sub_235F4C8D0();
  v38 = v9;
  v45 = v20;
  v46 = v21;
  sub_235F4C780();
  v36[1] = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256395100);
  sub_235F25418();
  v23 = v43;
  sub_235F4C7EC();
  swift_release();
  swift_release();
  sub_235F4C9CC();
  sub_235F4C9E4();
  sub_235F1BE00(&qword_2563961F8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF5618], MEMORY[0x24BDF5608]);
  sub_235F4C510();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v41);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v15, v13);
  v24 = swift_getKeyPath();
  v25 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2563961C0) + 36));
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396200);
  v27 = v42;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))((char *)v25 + *(int *)(v26 + 28), v19, v23);
  *v25 = v24;
  v7 = v38;
LABEL_7:
  v34 = v44;
  (*(void (**)(uint64_t, char *, uint64_t))(v44 + 16))(a2, v7, v4);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v19, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v7, v4);
}

uint64_t sub_235F494D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_235F4C8D0();
  *a1 = result;
  return result;
}

_QWORD *sub_235F494FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  double v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v3 = *(double *)v1;
  v4 = *(_QWORD *)(v1 + 8);
  v5 = *(unsigned __int8 *)(v1 + 16);
  v6 = *(unsigned __int8 *)(v1 + 17);
  *a1 = sub_235F4C984();
  a1[1] = v7;
  v8 = (uint64_t)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2563961B0) + 44);
  if (v6)
    v9 = 256;
  else
    v9 = 0;
  return sub_235F48AA8(v4, v9 | v5, v8, v3);
}

uint64_t sub_235F49570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D1>)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t *v24;
  char *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD v30[3];

  v6 = sub_235F4C4F8();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (_OWORD *)((char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396198);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563961A0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (char *)v8 + *(int *)(v6 + 20);
  v16 = *MEMORY[0x24BDEEB68];
  v17 = sub_235F4C60C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v15, v16, v17);
  __asm { FMOV            V0.2D, #3.0 }
  *v8 = _Q0;
  KeyPath = swift_getKeyPath();
  sub_235F1EB2C((uint64_t)v8, (uint64_t)v11);
  v24 = (uint64_t *)&v11[*(int *)(v9 + 36)];
  *v24 = KeyPath;
  v24[1] = a1;
  swift_retain();
  sub_235F1EB70((uint64_t)v8);
  sub_235F4C984();
  sub_235F4C480();
  sub_235F1BEC4((uint64_t)v11, (uint64_t)v14, &qword_256396198);
  v25 = &v14[*(int *)(v12 + 36)];
  v26 = v30[1];
  *(_OWORD *)v25 = v30[0];
  *((_OWORD *)v25 + 1) = v26;
  *((_OWORD *)v25 + 2) = v30[2];
  sub_235F1BF08((uint64_t)v11, &qword_256396198);
  v27 = sub_235F4C9B4();
  sub_235F1BEC4((uint64_t)v14, a2, &qword_2563961A0);
  v28 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2563961A8) + 36);
  *(_QWORD *)v28 = v27;
  *(double *)(v28 + 8) = a3;
  return sub_235F1BF08((uint64_t)v14, &qword_2563961A0);
}

uint64_t sub_235F497A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235F49570(*(_QWORD *)(v1 + 16), a1, *(double *)(v1 + 8));
}

uint64_t sub_235F497B0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_235F4C51C();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_235F4C54C();
}

uint64_t sub_235F4982C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_235F4C558();
  *a1 = result;
  return result;
}

uint64_t sub_235F49854()
{
  return sub_235F4C564();
}

uint64_t sub_235F49878@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_235F4C570();
  *a1 = result;
  return result;
}

uint64_t sub_235F498A0()
{
  swift_retain();
  return sub_235F4C57C();
}

uint64_t sub_235F498C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_235F4C5E8();
  v1 = MEMORY[0x24BDAC7A8](v0);
  v2 = MEMORY[0x24BDAC7A8](v1);
  MEMORY[0x24BDAC7A8](v2);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_235F4C3CC();
  swift_release();
  swift_release();
  swift_release();
  sub_235F4C5DC();
  sub_235F4C5D0();
  swift_beginAccess();
  type metadata accessor for AdaptiveVoiceShortcut();
  swift_bridgeObjectRetain();
  sub_235F4C5C4();
  swift_bridgeObjectRelease();
  sub_235F4C5D0();
  return sub_235F4C600();
}

uint64_t sub_235F49BA8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_235F4C558();
  *a1 = result;
  return result;
}

uint64_t sub_235F49BD0()
{
  return sub_235F4C564();
}

uint64_t sub_235F49BF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_235F4C570();
  *a1 = result;
  return result;
}

uint64_t sub_235F49C1C()
{
  swift_retain();
  return sub_235F4C57C();
}

unint64_t sub_235F49C44()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256396158;
  if (!qword_256396158)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256396148);
    v2[0] = sub_235F49CC8();
    v2[1] = sub_235F1BF90(&qword_256394D38, &qword_256394D40, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256396158);
  }
  return result;
}

unint64_t sub_235F49CC8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256396160;
  if (!qword_256396160)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256396140);
    v2[0] = sub_235F266FC();
    v2[1] = sub_235F1BF90(&qword_256394D10, &qword_256394D18, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256396160);
  }
  return result;
}

unint64_t sub_235F49D4C()
{
  unint64_t result;

  result = qword_256395A48;
  if (!qword_256395A48)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256395A48);
  }
  return result;
}

uint64_t sub_235F49D90@<X0>(float *a1@<X0>, uint64_t a2@<X8>)
{
  double v3;
  uint64_t result;

  v3 = fminf((float)(*a1 * 80.0) + 4.4444, 80.0);
  result = sub_235F4C8C4();
  *(_QWORD *)a2 = 0x4008000000000000;
  *(double *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = result;
  return result;
}

unint64_t sub_235F49DF0()
{
  unint64_t result;

  result = qword_256396178;
  if (!qword_256396178)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4EF44, &type metadata for WaveformCell);
    atomic_store(result, (unint64_t *)&qword_256396178);
  }
  return result;
}

uint64_t sub_235F49E34(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_235F49E7C(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for WaveformCell(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t destroy for WaveformCell()
{
  return swift_release();
}

_QWORD *assignWithCopy for WaveformCell(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for WaveformCell(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WaveformCell(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WaveformCell(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WaveformCell()
{
  return &type metadata for WaveformCell;
}

uint64_t sub_235F4A030(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for RecordingCircleView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for RecordingCircleView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for RecordingCircleView(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 18))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for RecordingCircleView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 18) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 18) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for RecordingCircleView()
{
  return &type metadata for RecordingCircleView;
}

uint64_t sub_235F4A1E0()
{
  return sub_235F1BF90(&qword_256396188, &qword_256396190, MEMORY[0x24BDF4498]);
}

uint64_t sub_235F4A20C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235F4A21C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235F4A22C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_235F4C528();
  *a1 = result;
  return result;
}

uint64_t sub_235F4A254()
{
  swift_retain();
  return sub_235F4C534();
}

uint64_t sub_235F4A27C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  if (a5)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

_QWORD *sub_235F4A2C8(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19]);
  return a1;
}

uint64_t sub_235F4A32C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  if (a5)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

double sub_235F4A378(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_235F4A394()
{
  return sub_235F4C540();
}

unint64_t sub_235F4A3BC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256396208;
  if (!qword_256396208)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563961A8);
    v2[0] = sub_235F4A460(&qword_256396210, &qword_2563961A0, (uint64_t (*)(void))sub_235F4A4C8, MEMORY[0x24BDEBEE0]);
    v2[1] = sub_235F1BF90(&qword_256396238, &qword_256396240, MEMORY[0x24BDEEC10]);
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256396208);
  }
  return result;
}

uint64_t sub_235F4A460(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_235F4A4C8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256396218;
  if (!qword_256396218)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256396198);
    v2[0] = sub_235F1BE00(&qword_256396220, (uint64_t (*)(uint64_t))MEMORY[0x24BDED998], MEMORY[0x24BDED988]);
    v2[1] = sub_235F1BF90(&qword_256396228, &qword_256396230, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256396218);
  }
  return result;
}

uint64_t sub_235F4A564()
{
  return sub_235F1BF90(&qword_256396248, &qword_256396250, MEMORY[0x24BDF4750]);
}

uint64_t destroy for AVSAudioDonationView()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AVSAudioDonationView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AVSAudioDonationView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for AVSAudioDonationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AVSAudioDonationView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AVSAudioDonationView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AVSAudioDonationView()
{
  return &type metadata for AVSAudioDonationView;
}

uint64_t sub_235F4A770()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235F4A780@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD v41[2];
  uint64_t v42;
  uint64_t OpaqueTypeConformance2;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[5];
  int v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;

  v47 = a3;
  v55 = a5;
  v8 = sub_235F4C2F4();
  v49 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394AC0);
  MEMORY[0x24BDAC7A8](v11);
  v48 = (char *)v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396258);
  v53 = *(_QWORD *)(v13 - 8);
  v54 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v52 = (char *)v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396260);
  MEMORY[0x24BDAC7A8](v50);
  v51 = (char *)v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256394AA8 != -1)
    swift_once();
  v16 = (void *)qword_256398358;
  if (qword_256398358)
  {
    v17 = (id)qword_256398358;
  }
  else
  {
    v17 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v16 = 0;
  }
  v18 = v16;
  v44 = 0x8000000235F50540;
  v19 = sub_235F4C108();
  v46[3] = v20;
  v46[4] = v19;

  v21 = (void *)qword_256398358;
  if (qword_256398358)
  {
    v22 = (id)qword_256398358;
  }
  else
  {
    v22 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v21 = 0;
  }
  v23 = v21;
  v44 = 0x8000000235F50540;
  v24 = sub_235F4C108();
  v46[0] = v25;
  v46[1] = v24;

  v46[2] = v46;
  v27 = MEMORY[0x24BDAC7A8](v26);
  MEMORY[0x24BDAC7A8](v27);
  v42 = a1;
  OpaqueTypeConformance2 = a2;
  LOBYTE(v44) = v28;
  v45 = a4;
  v56 = MEMORY[0x24BEE4AF8];
  sub_235F1BE00(&qword_256394AE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDFF7C8], MEMORY[0x24BDFF7E0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394AF0);
  sub_235F1BF90(&qword_256394AF8, &qword_256394AF0, MEMORY[0x24BEE12C8]);
  sub_235F4CC48();
  sub_235F4C960();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v10, v8);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396268);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396270);
  v31 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256396278);
  v32 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256396280);
  v33 = sub_235F4BB80();
  v34 = sub_235F1BF90(&qword_256396298, &qword_256396280, MEMORY[0x24BDEC988]);
  v56 = v31;
  v57 = v32;
  v58 = v33;
  v59 = v34;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v44 = sub_235F1BF90(&qword_2563962A0, &qword_256396270, MEMORY[0x24BDF4700]);
  v41[1] = v29;
  v42 = v30;
  v41[0] = v41;
  v35 = v52;
  sub_235F4C2E8();
  v37 = v53;
  v36 = v54;
  v38 = (uint64_t)v51;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v51, v35, v54);
  v39 = (_QWORD *)(v38 + *(int *)(v50 + 36));
  *v39 = 0;
  v39[1] = 0;
  v39[2] = sub_235F4BB28;
  v39[3] = 0;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v35, v36);
  return sub_235F4BC04(v38, v55);
}

uint64_t sub_235F4AC6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;

  v35 = a4;
  v39 = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563962B8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_235F4C300();
  v11 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396278);
  MEMORY[0x24BDAC7A8](v40);
  v34 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396268);
  v37 = *(_QWORD *)(v15 - 8);
  v38 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v36 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256394AA8 != -1)
    swift_once();
  v17 = (void *)qword_256398358;
  if (qword_256398358)
  {
    v18 = (id)qword_256398358;
  }
  else
  {
    v18 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v17 = 0;
  }
  v19 = v17;
  sub_235F4C108();

  v20 = sub_235F4C3F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v10, 1, 1, v20);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = a1;
  *(_QWORD *)(v21 + 24) = a2;
  v22 = a2;
  v23 = a3 & 1;
  *(_BYTE *)(v21 + 32) = a3 & 1;
  v24 = v35;
  *(_QWORD *)(v21 + 40) = v35;
  swift_retain();
  swift_retain();
  sub_235F4C30C();
  v25 = sub_235F4C720();
  v26 = v33;
  v27 = (uint64_t)v34;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v34, v13, v33);
  v28 = v27 + *(int *)(v40 + 36);
  *(_BYTE *)v28 = v25;
  *(_OWORD *)(v28 + 8) = 0u;
  *(_OWORD *)(v28 + 24) = 0u;
  *(_BYTE *)(v28 + 40) = 1;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v26);
  v41 = v23;
  v42 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D68);
  sub_235F4C930();
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = a1;
  *(_QWORD *)(v29 + 24) = v22;
  *(_BYTE *)(v29 + 32) = v23;
  *(_QWORD *)(v29 + 40) = v24;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256396280);
  sub_235F4BB80();
  sub_235F1BF90(&qword_256396298, &qword_256396280, MEMORY[0x24BDEC988]);
  v30 = v36;
  sub_235F4C870();
  swift_release();
  swift_release();
  swift_release();
  sub_235F4BC94(v27);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v37 + 32))(v39, v30, v38);
}

uint64_t sub_235F4B060()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563962C0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256394C60);
  sub_235F4BCE4();
  sub_235F1BF90(&qword_256394C70, &qword_256394C60, MEMORY[0x24BDF43B0]);
  swift_getOpaqueTypeConformance2();
  return sub_235F4C4B0();
}

uint64_t sub_235F4B124@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v24 = a3;
  v23 = a1;
  v26 = a5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394C60);
  v25 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563962C0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB08]), sel_init);
  if (qword_256394AA8 != -1)
    swift_once();
  v14 = (void *)qword_256398358;
  if (qword_256398358)
  {
    v15 = (id)qword_256398358;
  }
  else
  {
    v15 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v14 = 0;
  }
  v16 = v14;
  v17 = sub_235F4C108();
  v19 = v18;

  v27 = v17;
  v28 = v19;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v23;
  *(_QWORD *)(v20 + 24) = a2;
  *(_BYTE *)(v20 + 32) = v24 & 1;
  *(_QWORD *)(v20 + 40) = a4;
  sub_235F1EA80();
  swift_retain();
  swift_retain();
  sub_235F4C948();
  sub_235F4BCE4();
  sub_235F1BF90(&qword_256394C70, &qword_256394C60, MEMORY[0x24BDF43B0]);
  sub_235F4C834();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v7);

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(v26, v13, v10);
}

uint64_t sub_235F4B3B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)a5 = sub_235F4C630();
  *(_QWORD *)(a5 + 8) = 0;
  *(_BYTE *)(a5 + 16) = 1;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563962A8);
  sub_235F4B448(a1, a2, a3, a4, (char *)(a5 + *(int *)(v10 + 44)));
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396270);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(a5, 0, 1, v11);
}

uint64_t sub_235F4B448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  char v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  char *v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;

  v6 = a3;
  v44 = a3;
  v43 = a1;
  v49 = a5;
  v9 = sub_235F4C684();
  v10 = *(_QWORD *)(v9 - 8);
  v46 = v9;
  v47 = v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394B20);
  v40 = *(_QWORD *)(v13 - 8);
  v14 = v40;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v48 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v40 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256394B28);
  v50 = *(_QWORD *)(v19 - 8);
  v51 = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v40 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v45 = (char *)&v40 - v23;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = a1;
  *(_QWORD *)(v24 + 24) = a2;
  v41 = a2;
  v42 = a4;
  *(_BYTE *)(v24 + 32) = v6;
  *(_QWORD *)(v24 + 40) = a4;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394B30);
  sub_235F1BD7C();
  sub_235F4C93C();
  sub_235F4C678();
  sub_235F1BF90(&qword_256394B50, &qword_256394B20, MEMORY[0x24BDF43B0]);
  sub_235F1BE00(&qword_256394B58, (uint64_t (*)(uint64_t))MEMORY[0x24BDF0DA8], MEMORY[0x24BDF0D88]);
  v25 = v46;
  sub_235F4C804();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v25);
  v26 = *(void (**)(char *, uint64_t))(v14 + 8);
  v26(v18, v13);
  v27 = v50;
  v28 = v45;
  (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v45, v22, v51);
  v29 = swift_allocObject();
  v30 = v42;
  *(_QWORD *)(v29 + 16) = v43;
  *(_QWORD *)(v29 + 24) = v41;
  *(_BYTE *)(v29 + 32) = v44;
  *(_QWORD *)(v29 + 40) = v30;
  swift_retain();
  swift_retain();
  sub_235F4C93C();
  v31 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
  v32 = v28;
  v33 = v51;
  v31(v22, v28, v51);
  v34 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  v35 = v48;
  v34(v48, v18, v13);
  v36 = v49;
  v31(v49, v22, v33);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563962B0);
  v34(&v36[*(int *)(v37 + 48)], v35, v13);
  v26(v18, v13);
  v38 = *(void (**)(char *, uint64_t))(v50 + 8);
  v38(v32, v33);
  v26(v35, v13);
  return ((uint64_t (*)(char *, uint64_t))v38)(v22, v33);
}

uint64_t sub_235F4B7C0(uint64_t a1, uint64_t a2)
{
  void (**v3)(uint64_t);
  void (*v4)(uint64_t);
  uint64_t v5;

  _AXSSetAudioDonationSiriImprovementEnabled();
  v3 = (void (**)(uint64_t))(a2
                                     + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  v4 = *v3;
  v5 = swift_retain();
  v4(v5);
  return swift_release();
}

uint64_t sub_235F4B830@<X0>(uint64_t a1@<X8>)
{
  return sub_235F1B9B0((void (*)(uint64_t *__return_ptr))sub_235F4B83C, a1);
}

uint64_t sub_235F4B83C@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;

  sub_235F4C5F4();
  if (qword_256394AA8 != -1)
    swift_once();
  v2 = (void *)qword_256398358;
  if (!qword_256398358)
    v3 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v4 = v2;
  v5 = sub_235F4C7BC();
  v7 = v6;
  v9 = v8 & 1;
  v10 = sub_235F4C7B0();
  v12 = v11;
  v14 = v13;
  v16 = v15 & 1;
  sub_235F1BF54(v5, v7, v9);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 24) = v12;
  *(_BYTE *)(a1 + 32) = v16;
  *(_QWORD *)(a1 + 40) = v14;
  *(_QWORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 56) = 1;
  sub_235F1BF44(v10, v12, v16);
  swift_bridgeObjectRetain();
  sub_235F1BF54(v10, v12, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_235F4B9CC@<X0>(uint64_t a1@<X8>)
{
  return sub_235F1B9B0((void (*)(uint64_t *__return_ptr))sub_235F4B9D8, a1);
}

uint64_t sub_235F4B9D8@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;

  sub_235F4C5F4();
  if (qword_256394AA8 != -1)
    swift_once();
  v2 = (void *)qword_256398358;
  if (!qword_256398358)
    v3 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v4 = v2;
  v5 = sub_235F4C7BC();
  v7 = v6;
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  v9 = v8 & 1;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v8 & 1;
  *(_QWORD *)(a1 + 40) = v10;
  *(_QWORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 56) = 1;
  sub_235F1BF44(v5, v6, v8 & 1);
  swift_bridgeObjectRetain();
  sub_235F1BF54(v5, v7, v9);
  return swift_bridgeObjectRelease();
}

id sub_235F4BB28()
{
  return objc_msgSend((id)objc_opt_self(), sel_setShouldHideAudioDonationPrompt_, 1);
}

uint64_t sub_235F4BB50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235F4A780(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(unsigned __int8 *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_235F4BB60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235F4AC6C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

uint64_t sub_235F4BB70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235F4B3B0(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

unint64_t sub_235F4BB80()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256396288;
  if (!qword_256396288)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256396278);
    v2[0] = sub_235F1BE00(&qword_256396290, (uint64_t (*)(uint64_t))MEMORY[0x24BDFF7F0], MEMORY[0x24BDFF7E8]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256396288);
  }
  return result;
}

uint64_t sub_235F4BC04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396260);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235F4BC50()
{
  uint64_t v0;

  return sub_235F4B7C0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_235F4BC64()
{
  uint64_t v0;

  return sub_235F3A76C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_235F4BC78()
{
  return sub_235F4BD60();
}

uint64_t sub_235F4BC84()
{
  return sub_235F4B060();
}

uint64_t sub_235F4BC94(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256396278);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_235F4BCD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235F4B124(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

unint64_t sub_235F4BCE4()
{
  unint64_t result;

  result = qword_2563962C8;
  if (!qword_2563962C8)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4F100, &type metadata for PrivacyPresenterBridge);
    atomic_store(result, (unint64_t *)&qword_2563962C8);
  }
  return result;
}

uint64_t objectdestroyTm_3()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235F4BD58()
{
  return sub_235F4BD60();
}

uint64_t sub_235F4BD60()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256394D68);
  return sub_235F4C924();
}

ValueMetadata *type metadata accessor for PrivacyPresenterBridge()
{
  return &type metadata for PrivacyPresenterBridge;
}

unint64_t sub_235F4BDC4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2563962D0;
  if (!qword_2563962D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256396260);
    v2[0] = sub_235F1BF90(&qword_2563962D8, &qword_256396258, MEMORY[0x24BDFF798]);
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x23B7E7098](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2563962D0);
  }
  return result;
}

id sub_235F4BE4C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id result;
  id v5;

  v2 = (void *)sub_235F4CA74();
  v3 = objc_msgSend((id)objc_opt_self(), sel_presenterForPrivacySplashWithIdentifier_, v2);

  if (!v3)
    return a2;
  result = objc_msgSend(v3, sel_splashController);
  if (result)
  {
    v5 = result;

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_235F4BF00(uint64_t a1)
{
  void **v1;

  return sub_235F4BE4C(a1, *v1);
}

uint64_t sub_235F4BF14()
{
  return sub_235F4C6A8();
}

uint64_t sub_235F4BF4C()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_235F4BF58()
{
  sub_235F4C01C();
  return sub_235F4C6E4();
}

uint64_t sub_235F4BFA8()
{
  sub_235F4C01C();
  return sub_235F4C6B4();
}

void sub_235F4BFF8()
{
  sub_235F4C01C();
  sub_235F4C6D8();
  __break(1u);
}

unint64_t sub_235F4C01C()
{
  unint64_t result;

  result = qword_2563962E0;
  if (!qword_2563962E0)
  {
    result = MEMORY[0x23B7E7098](&unk_235F4F088, &type metadata for PrivacyPresenterBridge);
    atomic_store(result, (unint64_t *)&qword_2563962E0);
  }
  return result;
}

void __getAXPISystemActionHelperClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_235F4C084();
}

uint64_t sub_235F4C084()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_235F4C090()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_235F4C09C()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_235F4C0A8()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_235F4C0B4()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_235F4C0C0()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_235F4C0CC()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_235F4C0D8()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_235F4C0E4()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_235F4C0F0()
{
  return MEMORY[0x24BDCB918]();
}

uint64_t sub_235F4C0FC()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_235F4C108()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_235F4C114()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_235F4C120()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_235F4C12C()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_235F4C138()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_235F4C144()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_235F4C150()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_235F4C15C()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_235F4C168()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_235F4C174()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_235F4C180()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_235F4C18C()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_235F4C198()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_235F4C1A4()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_235F4C1B0()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_235F4C1BC()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_235F4C1C8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_235F4C1D4()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_235F4C1E0()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_235F4C1EC()
{
  return MEMORY[0x24BEC0C50]();
}

uint64_t sub_235F4C1F8()
{
  return MEMORY[0x24BEC0C60]();
}

uint64_t sub_235F4C204()
{
  return MEMORY[0x24BEC0C68]();
}

uint64_t sub_235F4C210()
{
  return MEMORY[0x24BEC0C70]();
}

uint64_t sub_235F4C21C()
{
  return MEMORY[0x24BEC0C80]();
}

uint64_t sub_235F4C228()
{
  return MEMORY[0x24BEC0C88]();
}

uint64_t sub_235F4C234()
{
  return MEMORY[0x24BEC0C98]();
}

uint64_t sub_235F4C240()
{
  return MEMORY[0x24BEC0CA0]();
}

uint64_t sub_235F4C24C()
{
  return MEMORY[0x24BEC0CA8]();
}

uint64_t sub_235F4C258()
{
  return MEMORY[0x24BEC0CB0]();
}

uint64_t sub_235F4C264()
{
  return MEMORY[0x24BEC0CB8]();
}

uint64_t sub_235F4C270()
{
  return MEMORY[0x24BEC0CC0]();
}

uint64_t sub_235F4C27C()
{
  return MEMORY[0x24BEC0CC8]();
}

uint64_t sub_235F4C288()
{
  return MEMORY[0x24BEC0CD0]();
}

uint64_t sub_235F4C294()
{
  return MEMORY[0x24BEC0CD8]();
}

uint64_t sub_235F4C2A0()
{
  return MEMORY[0x24BEC0D00]();
}

uint64_t sub_235F4C2AC()
{
  return MEMORY[0x24BEC0D08]();
}

uint64_t sub_235F4C2B8()
{
  return MEMORY[0x24BEC0D18]();
}

uint64_t sub_235F4C2C4()
{
  return MEMORY[0x24BEC0D20]();
}

uint64_t sub_235F4C2D0()
{
  return MEMORY[0x24BEC0D28]();
}

uint64_t sub_235F4C2DC()
{
  return MEMORY[0x24BEC0D38]();
}

uint64_t sub_235F4C2E8()
{
  return MEMORY[0x24BDFF788]();
}

uint64_t sub_235F4C2F4()
{
  return MEMORY[0x24BDFF7C8]();
}

uint64_t sub_235F4C300()
{
  return MEMORY[0x24BDFF7F0]();
}

uint64_t sub_235F4C30C()
{
  return MEMORY[0x24BDFF800]();
}

uint64_t sub_235F4C318()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_235F4C324()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_235F4C330()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_235F4C33C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_235F4C348()
{
  return MEMORY[0x24BDE9BD8]();
}

uint64_t sub_235F4C354()
{
  return MEMORY[0x24BDE9BE8]();
}

uint64_t sub_235F4C360()
{
  return MEMORY[0x24BDE9BF0]();
}

uint64_t sub_235F4C36C()
{
  return MEMORY[0x24BDE9C00]();
}

uint64_t sub_235F4C378()
{
  return MEMORY[0x24BDE9C10]();
}

uint64_t sub_235F4C384()
{
  return MEMORY[0x24BDE9DF0]();
}

uint64_t sub_235F4C390()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_235F4C39C()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_235F4C3A8()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_235F4C3B4()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_235F4C3C0()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_235F4C3CC()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_235F4C3D8()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_235F4C3E4()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_235F4C3F0()
{
  return MEMORY[0x24BDEAFA8]();
}

uint64_t sub_235F4C3FC()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_235F4C408()
{
  return MEMORY[0x24BDEB0B0]();
}

uint64_t sub_235F4C414()
{
  return MEMORY[0x24BDEB0B8]();
}

uint64_t sub_235F4C420()
{
  return MEMORY[0x24BDEB0E0]();
}

uint64_t sub_235F4C42C()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_235F4C438()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_235F4C444()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_235F4C450()
{
  return MEMORY[0x24BDEB798]();
}

uint64_t sub_235F4C45C()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_235F4C468()
{
  return MEMORY[0x24BDEB7E0]();
}

uint64_t sub_235F4C474()
{
  return MEMORY[0x24BDEB800]();
}

uint64_t sub_235F4C480()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_235F4C48C()
{
  return MEMORY[0x24BDEC030]();
}

uint64_t sub_235F4C498()
{
  return MEMORY[0x24BDEC038]();
}

uint64_t sub_235F4C4A4()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_235F4C4B0()
{
  return MEMORY[0x24BDEC970]();
}

uint64_t sub_235F4C4BC()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_235F4C4C8()
{
  return MEMORY[0x24BDEC9B0]();
}

uint64_t sub_235F4C4D4()
{
  return MEMORY[0x24BDECB20]();
}

uint64_t sub_235F4C4E0()
{
  return MEMORY[0x24BDECB30]();
}

uint64_t sub_235F4C4EC()
{
  return MEMORY[0x24BDED320]();
}

uint64_t sub_235F4C4F8()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_235F4C504()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_235F4C510()
{
  return MEMORY[0x24BDEDD68]();
}

uint64_t sub_235F4C51C()
{
  return MEMORY[0x24BDEDDD8]();
}

uint64_t sub_235F4C528()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_235F4C534()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_235F4C540()
{
  return MEMORY[0x24BDEE100]();
}

uint64_t sub_235F4C54C()
{
  return MEMORY[0x24BDEE108]();
}

uint64_t sub_235F4C558()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_235F4C564()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_235F4C570()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_235F4C57C()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_235F4C588()
{
  return MEMORY[0x24BDEE3F0]();
}

uint64_t sub_235F4C594()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_235F4C5A0()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_235F4C5AC()
{
  return MEMORY[0x24BDEE608]();
}

uint64_t sub_235F4C5B8()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_235F4C5C4()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_235F4C5D0()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_235F4C5DC()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_235F4C5E8()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_235F4C5F4()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_235F4C600()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_235F4C60C()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_235F4C618()
{
  return MEMORY[0x24BDEED70]();
}

uint64_t sub_235F4C624()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_235F4C630()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_235F4C63C()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_235F4C648()
{
  return MEMORY[0x24BDEF610]();
}

uint64_t sub_235F4C654()
{
  return MEMORY[0x24BDEF618]();
}

uint64_t sub_235F4C660()
{
  return MEMORY[0x24BDEF628]();
}

uint64_t sub_235F4C66C()
{
  return MEMORY[0x24BDEF648]();
}

uint64_t sub_235F4C678()
{
  return MEMORY[0x24BDF0D98]();
}

uint64_t sub_235F4C684()
{
  return MEMORY[0x24BDF0DA8]();
}

uint64_t sub_235F4C690()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_235F4C69C()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_235F4C6A8()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_235F4C6B4()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_235F4C6C0()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_235F4C6CC()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_235F4C6D8()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_235F4C6E4()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_235F4C6F0()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_235F4C6FC()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_235F4C708()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_235F4C714()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_235F4C720()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_235F4C72C()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_235F4C738()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_235F4C744()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_235F4C750()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_235F4C75C()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_235F4C768()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_235F4C774()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_235F4C780()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_235F4C78C()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_235F4C798()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_235F4C7A4()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_235F4C7B0()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_235F4C7BC()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_235F4C7C8()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_235F4C7D4()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_235F4C7E0()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_235F4C7EC()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_235F4C7F8()
{
  return MEMORY[0x24BDF2200]();
}

uint64_t sub_235F4C804()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_235F4C810()
{
  return MEMORY[0x24BDF2440]();
}

uint64_t sub_235F4C81C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_235F4C828()
{
  return MEMORY[0x24BDF2890]();
}

uint64_t sub_235F4C834()
{
  return MEMORY[0x24BDF2C68]();
}

uint64_t sub_235F4C840()
{
  return MEMORY[0x24BDF3060]();
}

uint64_t sub_235F4C84C()
{
  return MEMORY[0x24BDF30D8]();
}

uint64_t sub_235F4C858()
{
  return MEMORY[0x24BDF3390]();
}

uint64_t sub_235F4C864()
{
  return MEMORY[0x24BDF3470]();
}

uint64_t sub_235F4C870()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_235F4C87C()
{
  return MEMORY[0x24BDF3750]();
}

uint64_t sub_235F4C888()
{
  return MEMORY[0x24BDF3868]();
}

uint64_t sub_235F4C894()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_235F4C8A0()
{
  return MEMORY[0x24BDF3920]();
}

uint64_t sub_235F4C8AC()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_235F4C8B8()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_235F4C8C4()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_235F4C8D0()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_235F4C8DC()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t sub_235F4C8E8()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_235F4C8F4()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_235F4C900()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_235F4C90C()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_235F4C918()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_235F4C924()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_235F4C930()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_235F4C93C()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_235F4C948()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_235F4C954()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_235F4C960()
{
  return MEMORY[0x24BDF4808]();
}

uint64_t sub_235F4C96C()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_235F4C978()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_235F4C984()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_235F4C990()
{
  return MEMORY[0x24BDF4F98]();
}

uint64_t sub_235F4C99C()
{
  return MEMORY[0x24BDF4FA0]();
}

uint64_t sub_235F4C9A8()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_235F4C9B4()
{
  return MEMORY[0x24BDF4FF0]();
}

uint64_t sub_235F4C9C0()
{
  return MEMORY[0x24BDF5388]();
}

uint64_t sub_235F4C9CC()
{
  return MEMORY[0x24BDF5610]();
}

uint64_t sub_235F4C9D8()
{
  return MEMORY[0x24BDF5618]();
}

uint64_t sub_235F4C9E4()
{
  return MEMORY[0x24BDF5620]();
}

uint64_t sub_235F4C9F0()
{
  return MEMORY[0x24BDF5628]();
}

uint64_t sub_235F4C9FC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_235F4CA08()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_235F4CA14()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_235F4CA20()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_235F4CA2C()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_235F4CA38()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_235F4CA44()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_235F4CA50()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_235F4CA5C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_235F4CA68()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_235F4CA74()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_235F4CA80()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_235F4CA8C()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_235F4CA98()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_235F4CAA4()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_235F4CAB0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_235F4CABC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_235F4CAC8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_235F4CAD4()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_235F4CAE0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_235F4CAEC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_235F4CAF8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_235F4CB04()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_235F4CB10()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_235F4CB1C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_235F4CB28()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_235F4CB34()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_235F4CB40()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_235F4CB4C()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_235F4CB58()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_235F4CB64()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_235F4CB70()
{
  return MEMORY[0x24BDCFC78]();
}

uint64_t sub_235F4CB7C()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_235F4CB88()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_235F4CB94()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_235F4CBA0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_235F4CBAC()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_235F4CBB8()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_235F4CBC4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_235F4CBD0()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_235F4CBDC()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_235F4CBE8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_235F4CBF4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_235F4CC00()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_235F4CC0C()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_235F4CC18()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_235F4CC24()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_235F4CC30()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_235F4CC3C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_235F4CC48()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_235F4CC54()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_235F4CC60()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_235F4CC6C()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_235F4CC78()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_235F4CC84()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_235F4CC90()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_235F4CC9C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_235F4CCA8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_235F4CCB4()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_235F4CCC0()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_235F4CCCC()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_235F4CCD8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_235F4CCE4()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_235F4CCF0()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_235F4CCFC()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_235F4CD08()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_235F4CD14()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_235F4CD20()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_235F4CD2C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_235F4CD38()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_235F4CD44()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_235F4CD50()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_235F4CD5C()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_235F4CD68()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_235F4CD74()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_235F4CD80()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_235F4CD8C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_235F4CD98()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_235F4CDA4()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_235F4CDB0()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_235F4CDBC()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_235F4CDC8()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_235F4CDD4()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_235F4CDE0()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_235F4CDEC()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_235F4CDF8()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_235F4CE04()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_235F4CE10()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_235F4CE1C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_235F4CE28()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_235F4CE34()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_235F4CE40()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_235F4CE4C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_235F4CE58()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_235F4CE64()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_235F4CE70()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_235F4CE7C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AXCPSharedResourcesDirectory()
{
  return MEMORY[0x24BED1FD8]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x24BDFE088]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BEBDE98](*(_QWORD *)&notification, argument);
}

uint64_t _AXSAudioDonationSiriImprovementEnabled()
{
  return MEMORY[0x24BED20A8]();
}

uint64_t _AXSSetAudioDonationSiriImprovementEnabled()
{
  return MEMORY[0x24BED2428]();
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

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x24BEE4C88]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x24BDB31A0](__Log2n, *(_QWORD *)&__Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
  MEMORY[0x24BDB31A8](__C, __IC, __Z, __IZ, __N);
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
  MEMORY[0x24BDB31C0](__setup);
}

void vDSP_fft_zrip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
  MEMORY[0x24BDB31F8](__Setup, __C, __IC, __Log2N, *(_QWORD *)&__Direction);
}

void vDSP_hann_window(float *__C, vDSP_Length __N, int __Flag)
{
  MEMORY[0x24BDB3208](__C, __N, *(_QWORD *)&__Flag);
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB3328](__A, __IA, __B, __C, __D, __ID, __N);
}

void vDSP_vdbcon(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N, unsigned int __F)
{
  MEMORY[0x24BDB3340](__A, __IA, __B, __C, __IC, __N, *(_QWORD *)&__F);
}

void vDSP_vfix16(const float *__A, vDSP_Stride __IA, __int16 *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3378](__A, __IA, __C, __IC, __N);
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3430](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3498](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB34F0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB35C0](__A, __IA, __C, __IC, __N);
}


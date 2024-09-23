void sub_18EAB9658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EAB9824(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18EABB300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18EABBB40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_18EABC478(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18EABC7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
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

void sub_18EABD9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
  _Block_object_dispose(&a28, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EABE0BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,id a57)
{
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

void sub_18EABF1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_8(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

id getSLCollaborationSigningControllerClass()
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
  v0 = (void *)getSLCollaborationSigningControllerClass_softClass;
  v7 = getSLCollaborationSigningControllerClass_softClass;
  if (!getSLCollaborationSigningControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSLCollaborationSigningControllerClass_block_invoke;
    v3[3] = &unk_1E2873C40;
    v3[4] = &v4;
    __getSLCollaborationSigningControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18EABFB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSLCollaborationSigningControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SocialLayerLibraryCore_frameworkLibrary)
  {
    SocialLayerLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SocialLayerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SLCollaborationSigningController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSLCollaborationSigningControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getSLCollaborationSigningControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_18EAC1D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EAC2280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18EAC2C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void type metadata accessor for Identifier()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EE12F690)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EE12F690);
  }
}

uint64_t sub_18EAC43A4(uint64_t a1, uint64_t a2)
{
  return sub_18EAC46BC(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_18EAC43B0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_18EAE6EBC();
  *a2 = 0;
  return result;
}

uint64_t sub_18EAC4424(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_18EAE6EC8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_18EAC44A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_18EAE6ED4();
  v2 = sub_18EAE6EB0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_18EAC44E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_18EAE6ED4();
  v2 = v1;
  if (v0 == sub_18EAE6ED4() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_18EAE7120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_18EAC456C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_18EAE6ED4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_18EAC4594@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_18EAE6EB0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_18EAC45D8()
{
  sub_18EAC47A8(&qword_1EE12F6B0, (uint64_t)&unk_18EAE95A8);
  sub_18EAC47A8(&qword_1EE12F6B8, (uint64_t)&unk_18EAE9548);
  return sub_18EAE70FC();
}

uint64_t sub_18EAC4644()
{
  return sub_18EAC47A8(&qword_1EE12F698, (uint64_t)&unk_18EAE950C);
}

uint64_t sub_18EAC4668()
{
  return sub_18EAC47A8(&qword_1EE12F6A0, (uint64_t)&unk_18EAE94E0);
}

uint64_t sub_18EAC468C()
{
  return sub_18EAC47A8(&qword_1EE12F6A8, (uint64_t)&unk_18EAE957C);
}

uint64_t sub_18EAC46B0(uint64_t a1, uint64_t a2)
{
  return sub_18EAC46BC(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_18EAC46BC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_18EAE6ED4();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_18EAC46F8()
{
  sub_18EAE6ED4();
  sub_18EAE6EEC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18EAC4738()
{
  uint64_t v0;

  sub_18EAE6ED4();
  sub_18EAE7150();
  sub_18EAE6EEC();
  v0 = sub_18EAE715C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_18EAC47A8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Identifier();
    result = MEMORY[0x193FF6024](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18EAC47EC()
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
  uint64_t result;
  _QWORD v10[2];

  v0 = sub_18EAE6FC4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0, v2);
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_18EAE6FB8();
  MEMORY[0x1E0C80A78](v5, v6);
  v7 = sub_18EAE6EA4();
  MEMORY[0x1E0C80A78](v7, v8);
  sub_18EAC570C(0, (unint64_t *)&unk_1EE12FE30);
  sub_18EAE6E98();
  v10[1] = MEMORY[0x1E0DEE9D8];
  sub_18EAC5744();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F850);
  sub_18EAC578C(&qword_1EE12F858, &qword_1EE12F850, MEMORY[0x1E0DEAF38]);
  sub_18EAE7060();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x1E0DEF8D0], v0);
  result = sub_18EAE6FE8();
  qword_1EE12F7E0 = result;
  return result;
}

uint64_t static SWCollaborationMetadata.transferRepresentation.getter@<X0>(uint64_t a1@<X8>)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  void (*v24)(char *, uint64_t);
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v31 = a1;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F7E8);
  MEMORY[0x1E0C80A78](v30, v2);
  v29 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FA00);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_18EAE69E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F7F0);
  v28 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x1E0C80A78](v11, v12);
  v27 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13, v15);
  v17 = (char *)&v26 - v16;
  sub_18EAE6ED4();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v18(v7, 1, 1, v8);
  sub_18EAE69C4();
  *(_QWORD *)(swift_allocObject() + 16) = v1;
  sub_18EAC570C(0, &qword_1EE12F808);
  sub_18EAC4F60();
  sub_18EAE69AC();
  sub_18EAE6ED4();
  v18(v7, 1, 1, v8);
  sub_18EAE69C4();
  v19 = swift_allocObject();
  v20 = v27;
  *(_QWORD *)(v19 + 16) = v26;
  sub_18EAE69AC();
  v21 = &v29[*(int *)(v30 + 48)];
  v22 = v28;
  v23 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
  v23(v29, v17, v11);
  v23(v21, v20, v11);
  sub_18EAE69B8();
  v24 = *(void (**)(char *, uint64_t))(v22 + 8);
  v24(v20, v11);
  return ((uint64_t (*)(char *, uint64_t))v24)(v17, v11);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x193FF600C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_18EAC4CC4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v3;
  *v3 = v1;
  v3[1] = sub_18EAC4D50;
  v3[17] = v2;
  return swift_task_switch();
}

uint64_t sub_18EAC4D50(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 32) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_18EAC4DD8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = (void *)objc_opt_self();
  *(_QWORD *)(v0 + 16) = 0;
  v3 = objc_msgSend(v2, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v1, 1, v0 + 16);
  v4 = *(id *)(v0 + 16);
  v5 = *(void **)(v0 + 32);
  if (v3)
  {
    v6 = sub_18EAE68D4();
    v8 = v7;

    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v6, v8);
  }
  else
  {
    v10 = v4;
    sub_18EAE6874();

    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_18EAC4EFC()
{
  return swift_deallocObject();
}

uint64_t sub_18EAC4F0C(uint64_t *a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_18EAC57CC;
  return sub_18EAC4CC4(a1);
}

unint64_t sub_18EAC4F60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE12F810;
  if (!qword_1EE12F810)
  {
    v1 = sub_18EAC570C(255, &qword_1EE12F808);
    result = MEMORY[0x193FF6024](&protocol conformance descriptor for SWCollaborationMetadata, v1);
    atomic_store(result, &qword_1EE12F810);
  }
  return result;
}

uint64_t sub_18EAC4FB8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v3;
  *v3 = v1;
  v3[1] = sub_18EAC5044;
  v3[17] = v2;
  return swift_task_switch();
}

uint64_t sub_18EAC5044(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 32) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_18EAC50CC()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD7428]), sel_initWithAPIMetadata_, *(_QWORD *)(v0 + 32));
  v2 = (void *)objc_opt_self();
  *(_QWORD *)(v0 + 16) = 0;
  v3 = objc_msgSend(v2, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v1, 1, v0 + 16);
  v4 = *(id *)(v0 + 16);
  v5 = *(void **)(v0 + 32);
  if (v3)
  {
    v6 = sub_18EAE68D4();
    v8 = v7;

    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v6, v8);
  }
  else
  {
    v10 = v4;
    sub_18EAE6874();

    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_18EAC521C()
{
  return swift_deallocObject();
}

uint64_t sub_18EAC522C(uint64_t *a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_18EAC5280;
  return sub_18EAC4FB8(a1);
}

uint64_t sub_18EAC5280(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t sub_18EAC52E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18EAC52F0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F840);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v8 = a2;
    v9 = sub_18EAE68D4();
    v11 = v10;

    v12 = *(uint64_t **)(*(_QWORD *)(v3 + 64) + 40);
    *v12 = v9;
    v12[1] = v11;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_18EAC5394()
{
  return sub_18EAC578C(&qword_1EE12F828, &qword_1EE12F830, MEMORY[0x1E0CA8840]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x193FF6018](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_18EAC5404(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 136) = a1;
  return swift_task_switch();
}

uint64_t sub_18EAC541C()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = objc_msgSend(*(id *)(v0 + 136), sel_sourceProcessData);
  if (v1)
  {
    v2 = v1;
    v3 = sub_18EAE68D4();
    v5 = v4;

    sub_18EAC56C8(v3, v5);
    return (*(uint64_t (**)(id))(v0 + 8))(*(id *)(v0 + 136));
  }
  else
  {
    if (qword_1EE12F5B0 != -1)
      swift_once();
    v7 = *(_QWORD *)(v0 + 136);
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DA8840]), sel_initWithTargetSerialQueue_synchronous_, qword_1EE12F7E0, 1);
    *(_QWORD *)(v0 + 144) = v8;
    *(_QWORD *)(v0 + 56) = v0 + 120;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_18EAC5584;
    v9 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x1E0C809B0];
    v10 = (_QWORD *)(v0 + 80);
    v10[1] = 0x40000000;
    v10[2] = sub_18EAC52F0;
    v10[3] = &block_descriptor;
    v10[4] = v9;
    objc_msgSend(v8, sel_signSourceProcessWithMetadata_timeout_completion_, v7, v10, 5.0);
    return swift_continuation_await();
  }
}

uint64_t sub_18EAC5584()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 152) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_18EAC55E4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;

  v1 = *(void **)(v0 + 136);
  v2 = *(void **)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 128);
  v5 = (void *)sub_18EAE68C8();
  sub_18EAC56C8(v3, v4);
  objc_msgSend(v1, sel_setSourceProcessData_, v5);

  return (*(uint64_t (**)(id))(v0 + 8))(*(id *)(v0 + 136));
}

uint64_t sub_18EAC566C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(void **)(v0 + 144);
  v2 = *(void **)(v0 + 152);
  v3 = *(void **)(v0 + 136);
  swift_willThrow();

  v4 = v3;
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 136));
}

uint64_t sub_18EAC56C8(uint64_t a1, unint64_t a2)
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

uint64_t sub_18EAC570C(uint64_t a1, unint64_t *a2)
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

unint64_t sub_18EAC5744()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE12F848;
  if (!qword_1EE12F848)
  {
    v1 = sub_18EAE6FB8();
    result = MEMORY[0x193FF6024](MEMORY[0x1E0DEF828], v1);
    atomic_store(result, (unint64_t *)&qword_1EE12F848);
  }
  return result;
}

uint64_t sub_18EAC578C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x193FF6024](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void _SWCollaborationBarButtonItem.setDetailViewListContent<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v7;
  id v8;

  v7 = objc_msgSend(v3, sel_collaborationButtonView);
  v8 = objc_msgSend(v7, sel_buttonView);

  sub_18EAD269C(a1, a2, a3);
}

void _SWCollaborationBarButtonItem.setDetailViewListContent<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v9;
  id v10;

  v9 = objc_msgSend(v4, sel_collaborationButtonView);
  v10 = objc_msgSend(v9, sel_buttonView);

  sub_18EAD26C4(a1, a2, a3, a4);
}

id _SWCollaborationBarButtonItem.highlight.getter()
{
  void *v0;
  id v1;
  char *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_collaborationButtonView);
  v2 = (char *)objc_msgSend(v1, sel_buttonView);

  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_collaborationHighlight);
  return v3;
}

void _SWCollaborationBarButtonItem.highlight.setter(void *a1)
{
  void *v1;
  id v2;
  char *v3;

  v2 = objc_msgSend(v1, sel_collaborationButtonView);
  v3 = (char *)objc_msgSend(v2, sel_buttonView);

  objc_msgSend(*(id *)&v3[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_setCollaborationHighlight_, a1);
}

uint64_t _SWCollaborationBarButtonItem.customContentTitle.getter()
{
  void *v0;
  id v1;
  char *v2;
  id v3;
  uint64_t v5;

  v1 = objc_msgSend(v0, sel_collaborationButtonView);
  v2 = (char *)objc_msgSend(v1, sel_buttonView);

  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();

  swift_release();
  swift_release();
  return v5;
}

void sub_18EAC5BDC(uint64_t a1, void **a2)
{
  void *v2;
  id v3;
  char *v4;
  id v5;

  v2 = *a2;
  swift_bridgeObjectRetain();
  v3 = objc_msgSend(v2, sel_collaborationButtonView);
  v4 = (char *)objc_msgSend(v3, sel_buttonView);

  v5 = objc_msgSend(*(id *)&v4[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A6C();

}

void _SWCollaborationBarButtonItem.customContentTitle.setter()
{
  void *v0;
  id v1;
  char *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_collaborationButtonView);
  v2 = (char *)objc_msgSend(v1, sel_buttonView);

  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A6C();

}

void (*_SWCollaborationBarButtonItem.customContentTitle.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  void *v1;
  void *v2;
  _QWORD *v4;
  id v5;
  char *v6;
  id v7;

  v2 = v1;
  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = v2;
  v5 = objc_msgSend(v2, sel_collaborationButtonView);
  v6 = (char *)objc_msgSend(v5, sel_buttonView);

  v7 = objc_msgSend(*(id *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  swift_release();

  *(_OWORD *)v4 = *((_OWORD *)v4 + 1);
  return sub_18EAC5E84;
}

void sub_18EAC5E84(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  char *v7;
  id v8;
  id v9;
  char *v10;
  id v11;

  v2 = *a1;
  v4 = **a1;
  v3 = (*a1)[1];
  v5 = (void *)(*a1)[4];
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v6 = objc_msgSend(v5, sel_collaborationButtonView);
    v7 = (char *)objc_msgSend(v6, sel_buttonView);

    v8 = objc_msgSend(*(id *)&v7[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    v2[2] = v4;
    v2[3] = v3;
    sub_18EAE6A6C();

    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = objc_msgSend((id)(*a1)[4], sel_collaborationButtonView);
    v10 = (char *)objc_msgSend(v9, sel_buttonView);

    v11 = objc_msgSend(*(id *)&v10[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    v2[2] = v4;
    v2[3] = v3;
    sub_18EAE6A6C();

  }
  free(v2);
}

uint64_t _SWCollaborationBarButtonItem.customCollaborators.getter()
{
  void *v0;
  id v1;
  char *v2;
  id v3;
  uint64_t v5;

  v1 = objc_msgSend(v0, sel_collaborationButtonView);
  v2 = (char *)objc_msgSend(v1, sel_buttonView);

  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();

  swift_release();
  swift_release();
  return v5;
}

void sub_18EAC60DC(uint64_t a1, void **a2)
{
  void *v2;
  id v3;
  char *v4;
  id v5;

  v2 = *a2;
  swift_bridgeObjectRetain();
  v3 = objc_msgSend(v2, sel_collaborationButtonView);
  v4 = (char *)objc_msgSend(v3, sel_buttonView);

  v5 = objc_msgSend(*(id *)&v4[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A6C();

}

void _SWCollaborationBarButtonItem.customCollaborators.setter()
{
  void *v0;
  id v1;
  char *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_collaborationButtonView);
  v2 = (char *)objc_msgSend(v1, sel_buttonView);

  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A6C();

}

void (*_SWCollaborationBarButtonItem.customCollaborators.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  void *v1;
  id v3;
  char *v4;
  id v5;

  a1[2] = v1;
  v3 = objc_msgSend(v1, sel_collaborationButtonView);
  v4 = (char *)objc_msgSend(v3, sel_buttonView);

  v5 = objc_msgSend(*(id *)&v4[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  swift_release();

  *a1 = a1[1];
  return sub_18EAC635C;
}

void sub_18EAC635C(uint64_t *a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  char *v11;

  v2 = a1 + 1;
  v3 = *a1;
  v4 = (void *)a1[2];
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v6 = objc_msgSend(v4, sel_collaborationButtonView);
    v7 = (char *)objc_msgSend(v6, sel_buttonView);

    v8 = objc_msgSend(*(id *)&v7[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    a1[1] = v3;
    sub_18EAE6A6C();

    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = objc_msgSend((id)a1[2], sel_collaborationButtonView);
    v11 = (char *)objc_msgSend(v9, sel_buttonView);

    v10 = objc_msgSend(*(id *)&v11[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    *v2 = v3;
    sub_18EAE6A6C();

  }
}

void __swiftcall _SWCollaborationBarButtonItem.init(highlight:)(_SWCollaborationBarButtonItem *__return_ptr retstr, SWHighlight_optional highlight)
{
  Class isa;

  isa = highlight.value.super.isa;
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithHighlight_, highlight.value.super.isa);

}

id _SWCollaborationBarButtonItem.init(highlight:)(void *a1)
{
  void *v1;
  void *v2;
  id v4;
  id v5;
  char *v6;
  id v7;
  id v8;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone((Class)_SWCollaborationDetailViewController), sel_initWithHighlight_, a1);
  v5 = objc_allocWithZone((Class)type metadata accessor for _SWCollaborationButtonViewImpl());
  v6 = sub_18EAD3484(v4);
  v7 = objc_msgSend(objc_allocWithZone((Class)_SWCollaborationButtonView), sel_initWithTypeErasedButtonView_, v6);
  v8 = objc_msgSend(v2, sel_initWithCollaborationButtonView_, v7);

  return v8;
}

id _SWCollaborationBarButtonItem.init<A>(highlight:detailViewListContent:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v8;
  id v9;
  id v10;
  id v11;

  type metadata accessor for _SWCollaborationButtonViewImpl();
  v8 = sub_18EAD6DC4(a1, a2, a3, a4);
  v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v10 = objc_msgSend(objc_allocWithZone((Class)_SWCollaborationButtonView), sel_initWithTypeErasedButtonView_, v8);
  v11 = objc_msgSend(v9, sel_initWithCollaborationButtonView_, v10);

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a2, a3);
  return v11;
}

id _SWCollaborationBarButtonItem.init<A>(highlight:detailViewListContent:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v10;
  id v11;
  id v12;
  id v13;

  type metadata accessor for _SWCollaborationButtonViewImpl();
  v10 = sub_18EAD6E50(a1, a2, a3, a4, a5);
  v11 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v12 = objc_msgSend(objc_allocWithZone((Class)_SWCollaborationButtonView), sel_initWithTypeErasedButtonView_, v10);
  v13 = objc_msgSend(v11, sel_initWithCollaborationButtonView_, v12);

  return v13;
}

id _SWCollaborationBarButtonItem.updateHighlight<A>(_:newListContent:)(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setHighlight_, a1);
}

{
  void *v1;

  return objc_msgSend(v1, sel_setHighlight_, a1);
}

double sub_18EAC693C@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_18EAC69B8(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v3 = v2;
  return sub_18EAE6A6C();
}

uint64_t sub_18EAC6A34@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18EAC6AB0(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v3 = v2;
  return sub_18EAE6A6C();
}

char *keypath_get_selector_highlight()
{
  return sel_highlight;
}

id sub_18EAC6B40@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_highlight);
  *a2 = result;
  return result;
}

id sub_18EAC6B78(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHighlight_, *a1);
}

uint64_t sub_18EAC6B8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = _SWCollaborationBarButtonItem.customContentTitle.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_18EAC6BB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = _SWCollaborationBarButtonItem.customCollaborators.getter();
  *a1 = result;
  return result;
}

uint64_t sub_18EAC6BE4(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t inited;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v2 = sub_18EAE69E8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    v19 = MEMORY[0x1E0DEE9D8];
    v9 = objc_msgSend((id)objc_opt_self(), sel_readableTypeIdentifiersForItemProvider);
    v10 = sub_18EAE6F34();

    sub_18EAC6E04(v10);
    v11 = objc_msgSend((id)objc_opt_self(), sel_readableTypeIdentifiersForItemProvider);
    v8 = sub_18EAE6F34();

    goto LABEL_5;
  }
  if (a1 == 1)
  {
    v19 = MEMORY[0x1E0DEE9D8];
    v7 = objc_msgSend((id)objc_opt_self(), sel_readableTypeIdentifiersForItemProvider);
    v8 = sub_18EAE6F34();

LABEL_5:
    sub_18EAC6E04(v8);
    v12 = sub_18EACDBA0(v19);
    swift_bridgeObjectRelease();
    return v12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FA28);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_18EAE9780;
  sub_18EAE69DC();
  v14 = sub_18EAE69D0();
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  *(_QWORD *)(inited + 32) = v14;
  *(_QWORD *)(inited + 40) = v16;
  if (*(_QWORD *)(inited + 16))
  {
    v12 = sub_18EACD910(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
  }
  else
  {
    swift_setDeallocating();
    swift_arrayDestroy();
    return MEMORY[0x1E0DEE9E8];
  }
  return v12;
}

uint64_t sub_18EAC6E04(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_18EACC6CC(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_18EAE70F0();
  __break(1u);
  return result;
}

uint64_t sub_18EAC6F54(char a1)
{
  return *(_QWORD *)&aCloudkitcustom[8 * a1];
}

uint64_t sub_18EAC6F74(char *a1, char *a2)
{
  return sub_18EADBF80(*a1, *a2);
}

uint64_t sub_18EAC6F80()
{
  return sub_18EADC004();
}

uint64_t sub_18EAC6F88()
{
  return sub_18EADC114();
}

uint64_t sub_18EAC6F90()
{
  return sub_18EADC154();
}

uint64_t sub_18EAC6F98@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_18EACDC34();
  *a1 = result;
  return result;
}

uint64_t sub_18EAC6FC4@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_18EAC6F54(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_18EAC6FEC(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E28732D8;
}

unint64_t sub_18EAC6FFC(void *a1, unint64_t a2)
{
  id v4;
  id v5;
  id v6;
  id v7;

  if (a2 >> 62)
  {
    if (a2 >> 62 == 1)
    {
      v4 = a1;
      sub_18EAE7090();
      sub_18EAE6F04();
      sub_18EAE70C0();
      sub_18EAE6F04();
      sub_18EAE6F04();
      sub_18EAE6F04();
      v5 = objc_msgSend(v4, sel_description);
      sub_18EAE6ED4();

      sub_18EAE6F04();
      swift_bridgeObjectRelease();
      sub_18EAE6F04();

      swift_bridgeObjectRelease();
    }
    else
    {
      sub_18EAE6F04();
    }
  }
  else
  {
    v6 = a1;
    sub_18EAE7090();
    sub_18EAE6F04();
    v7 = objc_msgSend(v6, sel_description);
    sub_18EAE6ED4();

    sub_18EAE6F04();
    swift_bridgeObjectRelease();
    sub_18EAE6F04();
    swift_bridgeObjectRelease();
    sub_18EACF2D8(a1, a2);
  }
  return 0xD00000000000001DLL;
}

unint64_t sub_18EAC7264()
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
  uint64_t v9;
  void **v10;
  int EnumCaseMultiPayload;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v19;
  unint64_t v20;

  v1 = v0;
  v2 = sub_18EAE68BC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for CollaborationInfo(0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (void **)((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_18EACEDDC(v1, (uint64_t)v10);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload != 1)
    {
      (*(void (**)(char *, void **, uint64_t))(v3 + 32))(v6, v10, v2);
      v19 = 0;
      v20 = 0xE000000000000000;
      sub_18EAE7090();
      swift_bridgeObjectRelease();
      v19 = 0xD000000000000018;
      v20 = 0x800000018EAEBD60;
      sub_18EAE688C();
      sub_18EAE6F04();
      swift_bridgeObjectRelease();
      sub_18EAE6F04();
      v17 = v19;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      return v17;
    }
    v12 = *v10;
    v19 = 0;
    v20 = 0xE000000000000000;
    sub_18EAE7090();
    swift_bridgeObjectRelease();
    v19 = 0xD000000000000018;
    v20 = 0x800000018EAEBD20;
    v13 = objc_msgSend(v12, sel_description);
    sub_18EAE6ED4();

    sub_18EAE6F04();
    swift_bridgeObjectRelease();
    sub_18EAE6F04();
  }
  else
  {
    v14 = *v10;
    v12 = v10[1];
    v19 = 0;
    v20 = 0xE000000000000000;
    sub_18EAE7090();
    sub_18EAE6F04();
    sub_18EAE6F04();
    swift_bridgeObjectRelease();
    sub_18EAE6F04();
    v15 = objc_msgSend(v14, sel_description);
    sub_18EAE6ED4();

    sub_18EAE6F04();
    swift_bridgeObjectRelease();
    sub_18EAE6F04();
    v16 = objc_msgSend(v12, sel_description);
    sub_18EAE6ED4();

    sub_18EAE6F04();
    swift_bridgeObjectRelease();
    sub_18EAE6F04();

  }
  return v19;
}

id CollaborationDetailViewModel.itemProvider.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider);
  swift_beginAccess();
  return *v1;
}

void CollaborationDetailViewModel.itemProvider.setter(void *a1)
{
  sub_18EACE308(a1);

}

void (*CollaborationDetailViewModel.itemProvider.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_18EAC76FC;
}

void sub_18EAC76FC(_QWORD **a1, char a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = *(void **)(v3[3] + v3[4]);
    v5 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v6 = v4;
    swift_retain();
    sub_18EACDC7C(v6, (uint64_t)sub_18EACE3E4, v5);
    swift_release_n();

  }
  free(v3);
}

id sub_18EAC7794()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR___SWCollaborationDetailViewModel____lazy_storage___highlightCenter;
  v2 = *(void **)(v0 + OBJC_IVAR___SWCollaborationDetailViewModel____lazy_storage___highlightCenter);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___SWCollaborationDetailViewModel____lazy_storage___highlightCenter);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)SWHighlightCenter), sel_init);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

uint64_t CollaborationDetailViewModel.cloudSharingControllerDelegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SWCollaborationDetailViewModel_cloudSharingControllerDelegate;
  swift_beginAccess();
  return MEMORY[0x193FF6168](v1);
}

uint64_t CollaborationDetailViewModel.cloudSharingControllerDelegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*CollaborationDetailViewModel.cloudSharingControllerDelegate.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___SWCollaborationDetailViewModel_cloudSharingControllerDelegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x193FF6168](v5);
  return sub_18EAC79AC;
}

void sub_18EAC79AC(void **a1, char a2)
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

uint64_t sub_18EAC7A18()
{
  return sub_18EAC7CE4();
}

uint64_t sub_18EAC7AA8()
{
  return sub_18EAC7E10();
}

uint64_t sub_18EAC7BD0()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_18EAC7CD0()
{
  return sub_18EAC7CE4();
}

uint64_t sub_18EAC7CE4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  return swift_release();
}

uint64_t sub_18EAC7DFC()
{
  return sub_18EAC7E10();
}

uint64_t sub_18EAC7E10()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t CollaborationDetailViewModel.manageButtonTitle.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t CollaborationDetailViewModel.manageButtonTitle.setter()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_18EAE6A6C();
}

uint64_t sub_18EAC8108@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_18EAC8184(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v3 = v2;
  return sub_18EAE6A6C();
}

uint64_t (*CollaborationDetailViewModel.manageButtonTitle.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_18EAE6A54();
  return sub_18EAC8278;
}

uint64_t CollaborationDetailViewModel.$manageButtonTitle.getter()
{
  return sub_18EAC86F8((uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle, &qword_1EE12F878);
}

uint64_t CollaborationDetailViewModel.$manageButtonTitle.setter(uint64_t a1)
{
  return sub_18EAC88FC(a1, &qword_1EE12F880, (uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle, &qword_1EE12F878);
}

uint64_t (*CollaborationDetailViewModel.$manageButtonTitle.modify(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F880);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F878);
  sub_18EAE6A3C();
  swift_endAccess();
  return sub_18EAC8374;
}

uint64_t CollaborationDetailViewModel.showManageButton.getter()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t CollaborationDetailViewModel.showManageButton.setter()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_18EAE6A6C();
}

uint64_t sub_18EAC8538@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18EAC85B4(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_18EAE6A6C();
}

uint64_t (*CollaborationDetailViewModel.showManageButton.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_18EAE6A54();
  return sub_18EAC8278;
}

void sub_18EAC8698(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t CollaborationDetailViewModel.$showManageButton.getter()
{
  return sub_18EAC86F8((uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton, &qword_1EE12F890);
}

uint64_t sub_18EAC86F8(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_18EAE6A3C();
  return swift_endAccess();
}

uint64_t sub_18EAC875C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_18EAE6A3C();
  return swift_endAccess();
}

uint64_t sub_18EAC87C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v10 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x1E0C80A78](v9, v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12, v15);
  v17 = (char *)&v20 - v16;
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v18((char *)&v20 - v16, a1, v9);
  v18(v14, (uint64_t)v17, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_18EAE6A48();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v17, v9);
}

uint64_t CollaborationDetailViewModel.$showManageButton.setter(uint64_t a1)
{
  return sub_18EAC88FC(a1, &qword_1EE12F898, (uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton, &qword_1EE12F890);
}

uint64_t sub_18EAC88FC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_18EAE6A48();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*CollaborationDetailViewModel.$showManageButton.modify(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F898);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F890);
  sub_18EAE6A3C();
  swift_endAccess();
  return sub_18EAC8374;
}

void sub_18EAC8A9C(uint64_t a1, char a2)
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
    sub_18EAE6A48();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_18EAE6A48();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

id CollaborationDetailViewModel.__allocating_init(itemProvider:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return CollaborationDetailViewModel.init(itemProvider:)(a1);
}

id CollaborationDetailViewModel.init(itemProvider:)(void *a1)
{
  char *v1;
  char *v2;
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t ObjCClassFromMetadata;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  objc_class *ObjectType;
  objc_super v90;
  uint64_t v91;
  uint64_t v92;

  v2 = v1;
  v88 = a1;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F890);
  v86 = *(_QWORD *)(v3 - 8);
  v87 = v3;
  MEMORY[0x1E0C80A78](v3, v4);
  v85 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F878);
  v83 = *(_QWORD *)(v6 - 8);
  v84 = v6;
  MEMORY[0x1E0C80A78](v6, v7);
  v82 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8A0);
  v80 = *(_QWORD *)(v9 - 8);
  v81 = v9;
  MEMORY[0x1E0C80A78](v9, v10);
  v79 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8A8);
  v77 = *(_QWORD *)(v12 - 8);
  v78 = v12;
  MEMORY[0x1E0C80A78](v12, v13);
  v76 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_18EAE6928();
  v74 = *(_QWORD *)(v15 - 8);
  v75 = v15;
  v17 = MEMORY[0x1E0C80A78](v15, v16);
  v73 = (char *)&v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17, v19);
  v72 = (char *)&v67 - v20;
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8B0);
  v70 = *(_QWORD *)(v71 - 8);
  MEMORY[0x1E0C80A78](v71, v21);
  v67 = (char *)&v67 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8B8);
  v68 = *(_QWORD *)(v69 - 8);
  MEMORY[0x1E0C80A78](v69, v23);
  v25 = (char *)&v67 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C0);
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26, v28);
  v30 = (char *)&v67 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
  v33 = MEMORY[0x1E0C80A78](v31, v32);
  v35 = (char *)&v67 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v33, v36);
  v38 = (char *)&v67 - v37;
  *(_QWORD *)&v2[OBJC_IVAR___SWCollaborationDetailViewModel____lazy_storage___highlightCenter] = 0;
  swift_unknownObjectWeakInit();
  v39 = &v2[OBJC_IVAR___SWCollaborationDetailViewModel__collaborationInfo];
  v40 = type metadata accessor for CollaborationInfo(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v38, 1, 1, v40);
  sub_18EACEF08((uint64_t)v38, (uint64_t)v35, &qword_1EE12F8C8);
  v41 = v2;
  sub_18EAE6A30();
  sub_18EACF070((uint64_t)v38, &qword_1EE12F8C8);
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v39, v30, v26);
  v42 = &v41[OBJC_IVAR___SWCollaborationDetailViewModel__highlight];
  v91 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8E8);
  sub_18EAE6A30();
  (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v42, v25, v69);
  v43 = &v41[OBJC_IVAR___SWCollaborationDetailViewModel__customContentTitle];
  v91 = 0;
  v92 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8F8);
  v44 = v67;
  sub_18EAE6A30();
  (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v43, v44, v71);
  v45 = &v41[OBJC_IVAR___SWCollaborationDetailViewModel__headerFallback];
  v46 = v72;
  sub_18EAE68F8();
  v47 = v74;
  v48 = v75;
  (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v73, v46, v75);
  v49 = v76;
  sub_18EAE6A30();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v48);
  (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v45, v49, v78);
  v50 = &v41[OBJC_IVAR___SWCollaborationDetailViewModel__customCollaborators];
  v91 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F910);
  v51 = v79;
  sub_18EAE6A30();
  (*(void (**)(char *, char *, uint64_t))(v80 + 32))(v50, v51, v81);
  v52 = &v41[OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle];
  sub_18EAC570C(0, (unint64_t *)&unk_1EE12F918);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v54 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v55 = sub_18EAE685C();
  v57 = v56;

  v91 = v55;
  v92 = v57;
  v58 = v82;
  sub_18EAE6A30();
  (*(void (**)(char *, char *, uint64_t))(v83 + 32))(v52, v58, v84);
  v59 = &v41[OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton];
  LOBYTE(v91) = 1;
  v60 = v85;
  sub_18EAE6A30();
  (*(void (**)(char *, char *, uint64_t))(v86 + 32))(v59, v60, v87);
  v61 = v88;
  *(_QWORD *)&v41[OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider] = v88;
  v62 = v61;

  v90.receiver = v41;
  v90.super_class = ObjectType;
  v63 = objc_msgSendSuper2(&v90, sel_init);
  v64 = sub_18EAC7794();
  objc_msgSend(v64, sel_setDelegate_, v63);

  v65 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_18EACDC7C(v62, (uint64_t)sub_18EACE3E4, v65);

  swift_release_n();
  return v63;
}

void sub_18EAC930C(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  os_log_type_t v30;
  NSObject *v31;
  NSObject *v32;
  _BOOL4 v33;
  uint8_t *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
  v14 = MEMORY[0x1E0C80A78](v12, v13);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14, v17);
  v19 = (char *)&v38 - v18;
  swift_beginAccess();
  v20 = MEMORY[0x193FF6168](a6 + 16);
  if (v20)
  {
    v21 = (void *)v20;
    v40 = a5;
    sub_18EACEF08(a1, (uint64_t)v19, &qword_1EE12F8C8);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18EACEF08((uint64_t)v19, (uint64_t)v16, &qword_1EE12F8C8);
    v22 = v21;
    sub_18EAE6A6C();
    sub_18EACF070((uint64_t)v19, &qword_1EE12F8C8);
    sub_18EAC9778(a1);
    v23 = type metadata accessor for CollaborationInfo(0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 48))(a1, 1, v23) != 1)
    {
LABEL_14:

      return;
    }
    if (a3 >> 2 == 0xFFFFFFFF)
    {
      sub_18EAE6F88();
      v24 = (id)SWFrameworkLogHandle();
      if (v24)
      {
        v25 = v24;
        sub_18EAE69F4();

        goto LABEL_14;
      }
      __break(1u);
      goto LABEL_17;
    }
    sub_18EACF274(a2, a3);
    v30 = sub_18EAE6F88();
    v31 = (id)SWFrameworkLogHandle();
    if (!v31)
    {
LABEL_17:
      __break(1u);
      return;
    }
    v32 = v31;
    v33 = os_log_type_enabled(v31, v30);
    sub_18EACF2B0(a2, a3);
    if (v33)
    {
      sub_18EACF2B0(a2, a3);
      v38 = a4;
      v34 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      v42 = v39;
      *(_DWORD *)v34 = 136315138;
      v35 = sub_18EAC6FFC(a2, a3);
      v41 = sub_18EADDB8C(v35, v36, &v42);
      sub_18EAE703C();
      swift_bridgeObjectRelease();
      sub_18EACF2C4(a2, a3);
      sub_18EACF2C4(a2, a3);
      _os_log_impl(&dword_18EAB1000, v32, v30, "Error loading collaboration info: %s", v34, 0xCu);
      v37 = v39;
      swift_arrayDestroy();
      MEMORY[0x193FF60CC](v37, -1, -1);
      MEMORY[0x193FF60CC](v34, -1, -1);
      sub_18EACF2C4(a2, a3);

      goto LABEL_14;
    }

    sub_18EACF2C4(a2, a3);
    sub_18EACF2C4(a2, a3);
  }
  else
  {
    if (qword_1EE12F5C0 != -1)
      swift_once();
    v26 = sub_18EAE6A18();
    __swift_project_value_buffer(v26, (uint64_t)qword_1EE131138);
    v27 = sub_18EAE6A00();
    v28 = sub_18EAE6F7C();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_18EAB1000, v27, v28, "Bailing from item provider collaboration info load completion because self was nil.", v29, 2u);
      MEMORY[0x193FF60CC](v29, -1, -1);
    }

  }
}

uint64_t sub_18EAC9778(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
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
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  _QWORD *v52;
  NSObject *v53;
  void (*v54)(char *, uint64_t, uint64_t, uint64_t);
  int EnumCaseMultiPayload;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  id v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  id v69;
  id v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  __objc2_meth *v75;
  NSObject *v76;
  NSObject *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  uint64_t v88;
  uint8_t *v89;
  NSObject *v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  os_log_type_t v97;
  uint8_t *v98;
  NSObject *v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void (*v105)(char *, uint64_t, uint64_t);
  char *v106;
  id v107;
  uint64_t v108;
  void *v109;
  char *v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  void *v114;
  id v115;
  id v116;
  uint64_t v117;
  id v118;
  void *v119;
  id v120;
  uint64_t v121;
  void *v122;
  void *v123;
  id v124;
  id v125;
  Swift::String v126;
  SWCollaborationHighlight *v127;
  NSObject *v128;
  void *v129;
  id v130;
  id v131;
  NSObject *v132;
  os_log_type_t v133;
  uint64_t v134;
  void *v135;
  id v136;
  uint64_t v137;
  unint64_t v138;
  unint64_t v139;
  NSObject *v140;
  uint64_t v141;
  NSObject *v142;
  os_log_type_t v143;
  uint8_t *v144;
  NSObject *v145;
  unint64_t v146;
  unint64_t v147;
  NSObject *v148;
  id v149;
  NSObject *v150;
  NSObject *v151;
  os_log_type_t v152;
  uint8_t *v153;
  NSObject *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  char *v159;
  char *v160;
  char *v161;
  NSObject *v162;
  char *v163;
  char *v164;
  char *v165;
  char *v166;
  id v167;
  NSObject *aBlock;
  uint64_t v169;
  void (*v170)(uint64_t, void *, void *);
  void *v171;
  void (*v172)(void *, void *);
  uint64_t v173;
  uint64_t v174;

  v2 = sub_18EAE68BC();
  v3 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x1E0C80A78](v2, v4);
  v162 = v6;
  v163 = (char *)&v155 - (((unint64_t)&v6[1].isa + 7) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5, v7);
  v164 = (char *)&v155 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F9F0);
  v11 = MEMORY[0x1E0C80A78](v9, v10);
  v166 = (char *)&v155 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v11, v13);
  v158 = (uint64_t)&v155 - v15;
  v17 = MEMORY[0x1E0C80A78](v14, v16);
  v160 = (char *)&v155 - v18;
  v20 = MEMORY[0x1E0C80A78](v17, v19);
  v159 = (char *)&v155 - v21;
  MEMORY[0x1E0C80A78](v20, v22);
  v24 = (char *)&v155 - v23;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
  MEMORY[0x1E0C80A78](v25, v26);
  v28 = (char *)&v155 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = type metadata accessor for CollaborationInfo(0);
  v30 = *(_QWORD *)(v29 - 8);
  v32 = MEMORY[0x1E0C80A78](v29, v31);
  v161 = (char *)&v155 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = MEMORY[0x1E0C80A78](v32, v34);
  v156 = (uint64_t)&v155 - v36;
  v38 = MEMORY[0x1E0C80A78](v35, v37);
  v157 = (uint64_t)&v155 - v39;
  v41 = MEMORY[0x1E0C80A78](v38, v40);
  v43 = (id *)((char *)&v155 - v42);
  MEMORY[0x1E0C80A78](v41, v44);
  v46 = (char *)&v155 - v45;
  sub_18EACEF08(a1, (uint64_t)v28, &qword_1EE12F8C8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29) != 1)
  {
    sub_18EACEE7C((uint64_t)v28, (uint64_t)v46);
    v54 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v165 = v24;
    v54(v24, 1, 1, v2);
    sub_18EACEDDC((uint64_t)v46, (uint64_t)v43);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v56 = v2;
    if (!EnumCaseMultiPayload)
    {
      v69 = *v43;

      v70 = objc_msgSend(v69, "URL");
      v71 = (uint64_t)v166;
      if (v70)
      {
        v72 = v70;
        v73 = (uint64_t)v159;
        sub_18EAE68A4();

        v74 = 0;
        v61 = (uint64_t)v165;
      }
      else
      {
        v74 = 1;
        v61 = (uint64_t)v165;
        v73 = (uint64_t)v159;
      }

      sub_18EACF070(v61, &qword_1EE12F9F0);
      v56 = v2;
      v54((char *)v73, v74, 1, v2);
      sub_18EACEEC0(v73, v61);
      goto LABEL_30;
    }
    if (EnumCaseMultiPayload != 1)
    {
      v61 = (uint64_t)v165;
      sub_18EACF070((uint64_t)v165, &qword_1EE12F9F0);
      (*(void (**)(uint64_t, id *, uint64_t))(v3 + 32))(v61, v43, v2);
      v54((char *)v61, 0, 1, v2);
LABEL_29:
      v71 = (uint64_t)v166;
LABEL_30:
      sub_18EACEF08(v61, v71, &qword_1EE12F9F0);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v71, 1, v56) != 1)
      {
        v166 = v46;
        v104 = v3;
        v105 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 32);
        v106 = v164;
        v105(v164, v71, v56);
        v107 = v167;
        v108 = v56;
        v161 = (char *)sub_18EAC7794();
        v109 = (void *)sub_18EAE6898();
        v110 = v163;
        (*(void (**)(char *, char *, uint64_t))(v104 + 16))(v163, v106, v108);
        v111 = (*(unsigned __int8 *)(v104 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v104 + 80);
        v112 = ((unint64_t)&v162->isa + v111 + 7) & 0xFFFFFFFFFFFFFFF8;
        v113 = swift_allocObject();
        v105((char *)(v113 + v111), (uint64_t)v110, v108);
        *(_QWORD *)(v113 + v112) = v107;
        v172 = sub_18EACEFC0;
        v173 = v113;
        aBlock = MEMORY[0x1E0C809B0];
        v169 = 1107296256;
        v170 = sub_18EACADE4;
        v171 = &block_descriptor_0;
        v114 = _Block_copy(&aBlock);
        v115 = v107;
        swift_release();
        v116 = v161;
        objc_msgSend(v161, sel_getCollaborationHighlightForURL_completionHandler_, v109, v114);
        _Block_release(v114);

        (*(void (**)(char *, uint64_t))(v104 + 8))(v106, v108);
        v117 = (uint64_t)v165;
        goto LABEL_37;
      }
      sub_18EACF070(v71, &qword_1EE12F9F0);
      if (qword_1EE12F5C0 != -1)
        swift_once();
      v94 = sub_18EAE6A18();
      __swift_project_value_buffer(v94, (uint64_t)qword_1EE131138);
      v95 = (uint64_t)v161;
      sub_18EACEDDC((uint64_t)v46, (uint64_t)v161);
      v96 = sub_18EAE6A00();
      v97 = sub_18EAE6F7C();
      if (!os_log_type_enabled(v96, v97))
      {

        sub_18EACEBCC(v95);
        sub_18EACF070(v61, &qword_1EE12F9F0);
        v103 = (uint64_t)v46;
        return sub_18EACEBCC(v103);
      }
      v98 = (uint8_t *)swift_slowAlloc();
      v99 = swift_slowAlloc();
      aBlock = v99;
      v100 = (uint64_t)v46;
      *(_DWORD *)v98 = 136315138;
      v101 = sub_18EAC7264();
      v174 = sub_18EADDB8C(v101, v102, (uint64_t *)&aBlock);
      sub_18EAE703C();
      swift_bridgeObjectRelease();
      sub_18EACEBCC(v95);
      _os_log_impl(&dword_18EAB1000, v96, v97, "Unable to derive share URL from collaboration info %s", v98, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x193FF60CC](v99, -1, -1);
      MEMORY[0x193FF60CC](v98, -1, -1);

LABEL_35:
      sub_18EACF070(v61, &qword_1EE12F9F0);
      v103 = v100;
      return sub_18EACEBCC(v103);
    }
    v57 = v3;
    v58 = (char *)*v43;
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(aBlock) = 0;
    v59 = v167;
    sub_18EAE6A6C();
    v159 = v58;
    v60 = objc_msgSend(v58, sel_fileURL);
    v61 = (uint64_t)v165;
    if (v60)
    {
      v62 = v60;
      v63 = (uint64_t)v160;
      sub_18EAE68A4();

      v64 = 0;
    }
    else
    {
      v64 = 1;
      v63 = (uint64_t)v160;
    }
    sub_18EACF070(v61, &qword_1EE12F9F0);
    v54((char *)v63, v64, 1, v56);
    sub_18EACEEC0(v63, v61);
    v75 = &stru_1E2879000;
    v76 = objc_msgSend(v159, sel_collaborationMetadata);
    v77 = v76;
    if (v76)
    {
      v78 = -[NSObject title](v76, sel_title);

      if (v78)
      {
        v77 = sub_18EAE6ED4();
        v80 = v79;

LABEL_23:
        swift_getKeyPath();
        swift_getKeyPath();
        aBlock = v77;
        v169 = v80;
        v81 = v59;
        sub_18EAE6A6C();
        v82 = v158;
        sub_18EACEF08(v61, v158, &qword_1EE12F9F0);
        v3 = v57;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v57 + 48))(v82, 1, v56) == 1)
        {
          v167 = v81;
          sub_18EACF070(v82, &qword_1EE12F9F0);
          if (qword_1EE12F5C0 != -1)
            swift_once();
          v83 = sub_18EAE6A18();
          v84 = __swift_project_value_buffer(v83, (uint64_t)qword_1EE131138);
          v166 = v46;
          v85 = v157;
          sub_18EACEDDC((uint64_t)v46, v157);
          v86 = sub_18EAE6A00();
          v87 = sub_18EAE6F7C();
          if (os_log_type_enabled(v86, v87))
          {
            v88 = v85;
            v89 = (uint8_t *)swift_slowAlloc();
            v90 = swift_slowAlloc();
            aBlock = v90;
            *(_DWORD *)v89 = 136315138;
            v91 = sub_18EAC7264();
            v174 = sub_18EADDB8C(v91, v92, (uint64_t *)&aBlock);
            v61 = (uint64_t)v165;
            sub_18EAE703C();
            swift_bridgeObjectRelease();
            v93 = v88;
            v75 = &stru_1E2879000;
            sub_18EACEBCC(v93);
            _os_log_impl(&dword_18EAB1000, v86, v87, "Unable to derive share URL from collaboration info %s", v89, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x193FF60CC](v90, -1, -1);
            MEMORY[0x193FF60CC](v89, -1, -1);
          }
          else
          {
            sub_18EACEBCC(v85);
          }

          v118 = objc_msgSend(v159, (SEL)v75[161].imp);
          if (v118)
          {
            v119 = v118;
            v164 = (char *)v84;
            v120 = objc_msgSend(v118, sel_collaborationIdentifier);

            v121 = sub_18EAE6ED4();
            v123 = v122;

            v124 = v167;
            v125 = sub_18EAC7794();
            v126._countAndFlagsBits = v121;
            v126._object = v123;
            SWHighlightCenter.collaborationHighlight(forIdentifier:)(v127, v126);
            if (v129)
            {

              if (qword_1EE12F5C8 != -1)
                swift_once();
              __swift_project_value_buffer(v83, (uint64_t)qword_1EE131150);
              swift_bridgeObjectRetain();
              v130 = v129;
              swift_bridgeObjectRetain();
              v131 = v129;
              v132 = sub_18EAE6A00();
              v133 = sub_18EAE6F88();
              if (os_log_type_enabled(v132, v133))
              {
                v134 = swift_slowAlloc();
                v162 = swift_slowAlloc();
                aBlock = v162;
                *(_DWORD *)v134 = 136315394;
                swift_bridgeObjectRetain();
                v174 = sub_18EADDB8C(v121, (unint64_t)v123, (uint64_t *)&aBlock);
                v163 = (char *)v121;
                sub_18EAE703C();
                swift_bridgeObjectRelease_n();
                *(_WORD *)(v134 + 12) = 2080;
                v135 = (void *)sub_18EAE6868();
                v136 = objc_msgSend(v135, sel_description);

                v137 = sub_18EAE6ED4();
                v139 = v138;

                v174 = sub_18EADDB8C(v137, v139, (uint64_t *)&aBlock);
                v121 = (uint64_t)v163;
                sub_18EAE703C();
                v61 = (uint64_t)v165;
                swift_bridgeObjectRelease();

                _os_log_impl(&dword_18EAB1000, v132, v133, "Error fetching collaboration highlights for identifier %s. Error: %s", (uint8_t *)v134, 0x16u);
                v140 = v162;
                swift_arrayDestroy();
                MEMORY[0x193FF60CC](v140, -1, -1);
                MEMORY[0x193FF60CC](v134, -1, -1);

              }
              else
              {

                swift_bridgeObjectRelease_n();
              }
            }
            else
            {
              v148 = v128;

              swift_getKeyPath();
              swift_getKeyPath();
              aBlock = v148;
              v149 = v124;
              sub_18EAE6A6C();
            }
            swift_getKeyPath();
            swift_getKeyPath();
            sub_18EAE6A60();
            swift_release();
            swift_release();
            v150 = aBlock;

            if (v150)
            {
              swift_bridgeObjectRelease();
LABEL_57:

              v117 = v61;
              goto LABEL_37;
            }
            swift_bridgeObjectRetain();
            v151 = sub_18EAE6A00();
            v152 = sub_18EAE6F7C();
            if (!os_log_type_enabled(v151, v152))
            {
              swift_bridgeObjectRelease_n();

              goto LABEL_57;
            }
            v153 = (uint8_t *)swift_slowAlloc();
            v154 = swift_slowAlloc();
            aBlock = v154;
            *(_DWORD *)v153 = 136315138;
            swift_bridgeObjectRetain();
            v174 = sub_18EADDB8C(v121, (unint64_t)v123, (uint64_t *)&aBlock);
            sub_18EAE703C();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_18EAB1000, v151, v152, "Found no collaboration highlights in highlight center for idenfitier %s", v153, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x193FF60CC](v154, -1, -1);
            MEMORY[0x193FF60CC](v153, -1, -1);

            v117 = v61;
LABEL_37:
            sub_18EACF070(v117, &qword_1EE12F9F0);
            v103 = (uint64_t)v166;
            return sub_18EACEBCC(v103);
          }
          v100 = (uint64_t)v166;
          v141 = v156;
          sub_18EACEDDC((uint64_t)v166, v156);
          v142 = sub_18EAE6A00();
          v143 = sub_18EAE6F7C();
          if (os_log_type_enabled(v142, v143))
          {
            v144 = (uint8_t *)swift_slowAlloc();
            v145 = swift_slowAlloc();
            aBlock = v145;
            *(_DWORD *)v144 = 136315138;
            v146 = sub_18EAC7264();
            v174 = sub_18EADDB8C(v146, v147, (uint64_t *)&aBlock);
            sub_18EAE703C();
            swift_bridgeObjectRelease();
            sub_18EACEBCC(v141);
            _os_log_impl(&dword_18EAB1000, v142, v143, "Unable to derive collaboration identifier from collaboration info %s", v144, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x193FF60CC](v145, -1, -1);
            MEMORY[0x193FF60CC](v144, -1, -1);

          }
          else
          {

            sub_18EACEBCC(v141);
          }
          goto LABEL_35;
        }

        sub_18EACF070(v82, &qword_1EE12F9F0);
        goto LABEL_29;
      }
      v77 = 0;
    }
    v80 = 0;
    goto LABEL_23;
  }
  sub_18EACF070((uint64_t)v28, &qword_1EE12F8C8);
  if (qword_1EE12F5C0 != -1)
    swift_once();
  v47 = sub_18EAE6A18();
  __swift_project_value_buffer(v47, (uint64_t)qword_1EE131138);
  v48 = v167;
  v49 = sub_18EAE6A00();
  v50 = sub_18EAE6F7C();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)swift_slowAlloc();
    v52 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v51 = 138412290;
    aBlock = v48;
    v53 = v48;
    sub_18EAE703C();
    *v52 = v48;

    _os_log_impl(&dword_18EAB1000, v49, v50, "Updating %@ for nil collaboration info.", v51, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F9F8);
    swift_arrayDestroy();
    MEMORY[0x193FF60CC](v52, -1, -1);
    MEMORY[0x193FF60CC](v51, -1, -1);
  }
  else
  {

    v49 = v48;
  }

  swift_getKeyPath();
  swift_getKeyPath();
  aBlock = 0;
  v65 = v48;
  sub_18EAE6A6C();
  swift_getKeyPath();
  swift_getKeyPath();
  aBlock = 0;
  v169 = 0;
  v66 = v65;
  sub_18EAE6A6C();
  swift_getKeyPath();
  swift_getKeyPath();
  aBlock = 0;
  v67 = v66;
  return sub_18EAE6A6C();
}

void sub_18EACA94C(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v8 = sub_18EAE68BC();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x1E0C80A78](v8, v10);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v14);
  v16 = (char *)&v41 - v15;
  if (a2)
  {
    v17 = a2;
    if (qword_1EE12F5C8 != -1)
      swift_once();
    v18 = sub_18EAE6A18();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EE131150);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v16, a3, v8);
    v19 = a2;
    v20 = a2;
    v21 = sub_18EAE6A00();
    v22 = sub_18EAE6F88();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc();
      v42 = swift_slowAlloc();
      v44 = v42;
      *(_DWORD *)v23 = 136315394;
      v24 = sub_18EAE688C();
      v43 = sub_18EADDB8C(v24, v25, &v44);
      sub_18EAE703C();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
      *(_WORD *)(v23 + 12) = 2080;
      v26 = (void *)sub_18EAE6868();
      v27 = objc_msgSend(v26, sel_description);

      v28 = sub_18EAE6ED4();
      v30 = v29;

      v43 = sub_18EADDB8C(v28, v30, &v44);
      sub_18EAE703C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_18EAB1000, v21, v22, "Error fetching collaboration highlights for url %s. Error: %s", (uint8_t *)v23, 0x16u);
      v31 = v42;
      swift_arrayDestroy();
      MEMORY[0x193FF60CC](v31, -1, -1);
      MEMORY[0x193FF60CC](v23, -1, -1);

    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
    }
  }
  else if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v44 = (uint64_t)a1;
    v32 = a1;
    v33 = a4;
    sub_18EAE6A6C();
  }
  else
  {
    if (qword_1EE12F5C0 != -1)
      swift_once();
    v34 = sub_18EAE6A18();
    __swift_project_value_buffer(v34, (uint64_t)qword_1EE131138);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, a3, v8);
    v35 = sub_18EAE6A00();
    v36 = sub_18EAE6F7C();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      v38 = swift_slowAlloc();
      v44 = v38;
      *(_DWORD *)v37 = 136315138;
      v39 = sub_18EAE688C();
      v43 = sub_18EADDB8C(v39, v40, &v44);
      sub_18EAE703C();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
      _os_log_impl(&dword_18EAB1000, v35, v36, "Found no collaboration highlights in highlight center for url %s", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x193FF60CC](v38, -1, -1);
      MEMORY[0x193FF60CC](v37, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
    }

  }
}

void sub_18EACADE4(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_18EACAE58(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD aBlock[6];
  _OWORD v34[2];

  v28 = a6;
  v29 = a3;
  v13 = sub_18EAE6E74();
  v32 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_18EAE6EA4();
  v30 = *(_QWORD *)(v17 - 8);
  v31 = v17;
  MEMORY[0x1E0C80A78](v17, v18);
  v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18EAC570C(0, (unint64_t *)&unk_1EE12FE30);
  v21 = (void *)sub_18EAE6FD0();
  sub_18EACF194(a1, (uint64_t)v34);
  v22 = swift_allocObject();
  *(_BYTE *)(v22 + 16) = a2;
  sub_18EACF20C(v34, (_OWORD *)(v22 + 24));
  *(_QWORD *)(v22 + 56) = v28;
  *(_QWORD *)(v22 + 64) = a7;
  v23 = v29;
  *(_QWORD *)(v22 + 72) = a8;
  *(_QWORD *)(v22 + 80) = v23;
  *(_QWORD *)(v22 + 88) = a4;
  aBlock[4] = sub_18EACF21C;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18EAD26EC;
  aBlock[3] = &block_descriptor_78;
  v24 = _Block_copy(aBlock);
  swift_retain();
  v25 = a8;
  swift_bridgeObjectRetain();
  swift_release();
  sub_18EAE6E8C();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_18EACF234((unint64_t *)&qword_1EE12FA40, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FE40);
  sub_18EAC578C(&qword_1EE12FA50, &qword_1EE12FE40, MEMORY[0x1E0DEAF38]);
  sub_18EAE7060();
  MEMORY[0x193FF5820](0, v20, v16, v24);
  _Block_release(v24);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v13);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v20, v31);
}

uint64_t sub_18EACB0BC(char a1, uint64_t a2, void (*a3)(char *, _QWORD, unint64_t, _QWORD, _QWORD), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t, uint64_t);
  id v28;
  void (*v29)(char *, _QWORD, unint64_t, _QWORD, _QWORD);
  id v30;
  id v31;
  id v32;
  int v33;
  void (*v34)(char *, uint64_t, uint64_t, uint64_t);
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  void (*v41)(char *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, _QWORD, unint64_t, _QWORD, _QWORD);
  id v51;
  _BYTE v52[32];

  v47 = a6;
  v48 = a7;
  v46 = a5;
  v49 = a4;
  v50 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F9F0);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_18EAE68BC();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13, v15);
  v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
  v20 = MEMORY[0x1E0C80A78](v18, v19);
  v22 = (char *)&v46 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20, v23);
  v25 = (char *)&v46 - v24;
  v26 = type metadata accessor for CollaborationInfo(0);
  v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56);
  v27(v25, 1, 1, v26);
  if (!a1)
  {
    sub_18EACF194(a2, (uint64_t)v52);
    sub_18EAC570C(0, &qword_1EE12FA58);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v30 = v51;
      v31 = objc_msgSend(v51, sel_share);

      v32 = 0;
    }
    else
    {
      sub_18EACF194(a2, (uint64_t)v52);
      sub_18EAC570C(0, &qword_1EE12FA08);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v27(v22, 1, 1, v26);
        v36 = v22;
        v37 = v46;
        v38 = 0x4000000000000000;
        goto LABEL_24;
      }
      v39 = v51;
      v31 = objc_msgSend(v51, sel_share);
      v40 = objc_msgSend(v39, sel_containerSetupInfo);
      v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C94C28]), sel_initWithContainerSetupInfo_, v40);

      if (v31)
      {
        v29 = v50;
        if (v32)
        {
          sub_18EACF070((uint64_t)v25, &qword_1EE12F8C8);
          *(_QWORD *)v25 = v31;
          *((_QWORD *)v25 + 1) = v32;
          v25[16] = 1;
          goto LABEL_6;
        }
        goto LABEL_10;
      }
    }
    v29 = v50;
LABEL_10:
    v27(v22, 1, 1, v26);
    v29(v22, 0, 0x8000000000000000, 0, 0);

LABEL_25:
    sub_18EACF070((uint64_t)v22, &qword_1EE12F8C8);
    return sub_18EACF070((uint64_t)v25, &qword_1EE12F8C8);
  }
  if (a1 != 1)
  {
    sub_18EACF194(a2, (uint64_t)v52);
    v33 = swift_dynamicCast();
    v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
    if (v33)
    {
      v34(v12, 0, 1, v13);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) != 1)
      {
        v35 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
        v35(v17, v12, v13);
        if ((sub_18EAE6880() & 1) != 0)
        {
          sub_18EACF070((uint64_t)v25, &qword_1EE12F8C8);
          v35(v25, v17, v13);
          goto LABEL_5;
        }
        (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
        goto LABEL_22;
      }
    }
    else
    {
      v34(v12, 1, 1, v13);
    }
    sub_18EACF070((uint64_t)v12, &qword_1EE12F9F0);
LABEL_22:
    v41 = (void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))v50;
    v43 = v47;
    v42 = v48;
    v44 = v46;
    v27(v22, 1, 1, v26);
    v41(v22, v44, 0x4000000000000002, v43, v42);
    goto LABEL_25;
  }
  sub_18EACF194(a2, (uint64_t)v52);
  sub_18EAC570C(0, &qword_1EE12FA10);
  if ((swift_dynamicCast() & 1) == 0)
  {
    v27(v22, 1, 1, v26);
    v36 = v22;
    v37 = v46;
    v38 = 0x4000000000000001;
LABEL_24:
    v50(v36, v37, v38, v47, v48);
    goto LABEL_25;
  }
  v28 = v51;
  sub_18EACF070((uint64_t)v25, &qword_1EE12F8C8);
  *(_QWORD *)v25 = v28;
LABEL_5:
  v29 = v50;
LABEL_6:
  swift_storeEnumTagMultiPayload();
  v27(v25, 0, 1, v26);
  v29(v25, 0, 0x3FFFFFFFCuLL, 0, 0);
  return sub_18EACF070((uint64_t)v25, &qword_1EE12F8C8);
}

void sub_18EACB5C8(uint64_t a1, id a2, void (*a3)(uint64_t *, _QWORD, _QWORD, unint64_t, _QWORD))
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  os_log_type_t v16;
  uint8_t *v17;
  NSObject *oslog;
  uint64_t v19[4];

  if (a2)
  {
    v4 = a2;
    if (qword_1EE12F5C8 != -1)
      swift_once();
    v5 = sub_18EAE6A18();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EE131150);
    v6 = a2;
    v7 = a2;
    oslog = sub_18EAE6A00();
    v8 = sub_18EAE6F88();
    if (os_log_type_enabled(oslog, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      v19[0] = v10;
      *(_DWORD *)v9 = 136315138;
      swift_getErrorValue();
      v11 = sub_18EAE7144();
      sub_18EADDB8C(v11, v12, v19);
      sub_18EAE703C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_18EAB1000, oslog, v8, "Failed to load object from item provider with error: %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x193FF60CC](v10, -1, -1);
      MEMORY[0x193FF60CC](v9, -1, -1);

      return;
    }

  }
  else
  {
    if (a1)
    {
      v19[3] = swift_getObjectType();
      v19[0] = a1;
      swift_unknownObjectRetain();
      a3(v19, 0, 0, 0xE000000000000000, 0);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
      return;
    }
    if (qword_1EE12F5C8 != -1)
      swift_once();
    v15 = sub_18EAE6A18();
    __swift_project_value_buffer(v15, (uint64_t)qword_1EE131150);
    oslog = sub_18EAE6A00();
    v16 = sub_18EAE6F7C();
    if (os_log_type_enabled(oslog, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_18EAB1000, oslog, v16, "Object loaded from item provider is nil", v17, 2u);
      MEMORY[0x193FF60CC](v17, -1, -1);
    }
  }

}

uint64_t sub_18EACB8B4(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_18EACB91C(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *, uint64_t, _QWORD, unint64_t, uint64_t))
{
  _QWORD v7[4];

  v7[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FA20);
  v7[0] = a1;
  swift_unknownObjectRetain();
  a3(v7, 1, 0, 0xE000000000000000, a2);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
}

void sub_18EACB990(uint64_t a1, uint64_t a2, void *a3, void (*a4)(uint64_t *, uint64_t, uint64_t, NSObject *, _QWORD), uint64_t a5, uint64_t a6, uint64_t a7, NSObject *a8)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v39;
  void (*v40)(uint64_t *, uint64_t, uint64_t, NSObject *, _QWORD);
  NSObject *v41;
  uint64_t v42;
  uint64_t v43[4];

  v41 = a8;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F9F0);
  MEMORY[0x1E0C80A78](v14, v15);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_18EAE68BC();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18, v20);
  v22 = (char *)&v39 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v23 = a3;
    if (qword_1EE12F5C8 != -1)
      swift_once();
    v24 = sub_18EAE6A18();
    __swift_project_value_buffer(v24, (uint64_t)qword_1EE131150);
    v25 = a3;
    v26 = a3;
    v41 = sub_18EAE6A00();
    v27 = sub_18EAE6F88();
    if (os_log_type_enabled(v41, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v43[0] = v29;
      *(_DWORD *)v28 = 136315138;
      swift_getErrorValue();
      v30 = sub_18EAE7144();
      v42 = sub_18EADDB8C(v30, v31, v43);
      sub_18EAE703C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_18EAB1000, v41, v27, "Failed to load object from item provider with error: %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x193FF60CC](v29, -1, -1);
      MEMORY[0x193FF60CC](v28, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    v32 = a6;
    v39 = a5;
    v40 = a4;
    v33 = v41;
    sub_18EACEF08(a1, (uint64_t)v17, &qword_1EE12F9F0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
    {
      sub_18EACF070((uint64_t)v17, &qword_1EE12F9F0);
      if (qword_1EE12F5C8 != -1)
        swift_once();
      v34 = sub_18EAE6A18();
      __swift_project_value_buffer(v34, (uint64_t)qword_1EE131150);
      v35 = sub_18EAE6A00();
      v36 = sub_18EAE6F7C();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_18EAB1000, v35, v36, "Object loaded from item provider is nil", v37, 2u);
        MEMORY[0x193FF60CC](v37, -1, -1);
      }

    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v22, v17, v18);
      v43[3] = v18;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v43);
      (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 16))(boxed_opaque_existential_0, v22, v18);
      v40(v43, v32, a7, v33, 0);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v43);
    }
  }
}

void sub_18EACBD7C(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, NSObject *, _QWORD), uint64_t a4, uint64_t a5, uint64_t a6, NSObject *a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v38;
  void (*v39)(uint64_t *, uint64_t, uint64_t, NSObject *, _QWORD);
  NSObject *v40;
  uint64_t v41;
  uint64_t v42[4];

  v40 = a7;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F9F0);
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_18EAE68BC();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17, v19);
  v21 = (char *)&v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v22 = a2;
    if (qword_1EE12F5C8 != -1)
      swift_once();
    v23 = sub_18EAE6A18();
    __swift_project_value_buffer(v23, (uint64_t)qword_1EE131150);
    v24 = a2;
    v25 = a2;
    v40 = sub_18EAE6A00();
    v26 = sub_18EAE6F88();
    if (os_log_type_enabled(v40, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v42[0] = v28;
      *(_DWORD *)v27 = 136315138;
      swift_getErrorValue();
      v29 = sub_18EAE7144();
      v41 = sub_18EADDB8C(v29, v30, v42);
      sub_18EAE703C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_18EAB1000, v40, v26, "Failed to load object from item provider with error: %s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x193FF60CC](v28, -1, -1);
      MEMORY[0x193FF60CC](v27, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    v31 = a5;
    v38 = a4;
    v39 = a3;
    v32 = v40;
    sub_18EACEF08(a1, (uint64_t)v16, &qword_1EE12F9F0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
    {
      sub_18EACF070((uint64_t)v16, &qword_1EE12F9F0);
      if (qword_1EE12F5C8 != -1)
        swift_once();
      v33 = sub_18EAE6A18();
      __swift_project_value_buffer(v33, (uint64_t)qword_1EE131150);
      v34 = sub_18EAE6A00();
      v35 = sub_18EAE6F7C();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_18EAB1000, v34, v35, "Object loaded from item provider is nil", v36, 2u);
        MEMORY[0x193FF60CC](v36, -1, -1);
      }

    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v21, v16, v17);
      v42[3] = v17;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v42);
      (*(void (**)(uint64_t *, char *, uint64_t))(v18 + 16))(boxed_opaque_existential_0, v21, v17);
      v39(v42, v31, a6, v32, 0);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v42);
    }
  }
}

id CollaborationDetailViewModel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CollaborationDetailViewModel.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CollaborationDetailViewModel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18EACC390@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  swift_getObjectType();
  result = sub_18EAE6A24();
  *a1 = result;
  return result;
}

Swift::Void __swiftcall CollaborationDetailViewModel.highlightCenterHighlightsDidChange(_:)(SWHighlightCenter *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
  MEMORY[0x1E0C80A78](v1, v2);
  v4 = (char *)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  swift_release();
  sub_18EAC9778((uint64_t)v4);
  sub_18EACF070((uint64_t)v4, &qword_1EE12F8C8);
}

uint64_t sub_18EACC570()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  return swift_release();
}

uint64_t sub_18EACC5D8(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
  v6 = MEMORY[0x1E0C80A78](v4, v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6, v9);
  v11 = (char *)&v15 - v10;
  sub_18EACEF08(a1, (uint64_t)&v15 - v10, &qword_1EE12F8C8);
  v12 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EACEF08((uint64_t)v11, (uint64_t)v8, &qword_1EE12F8C8);
  v13 = v12;
  sub_18EAE6A6C();
  return sub_18EACF070((uint64_t)v11, &qword_1EE12F8C8);
}

_QWORD *sub_18EACC6CC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FA28);
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
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_18EACDAB0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_18EACC7D8(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_18EAE7150();
  swift_bridgeObjectRetain();
  sub_18EAE6EEC();
  v8 = sub_18EAE715C();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_18EAE7120() & 1) != 0)
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
      if (v19 || (sub_18EAE7120() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_18EACCC60(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_18EACC984()
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE12FA30);
  v3 = sub_18EAE7078();
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
      sub_18EAE7150();
      sub_18EAE6EEC();
      result = sub_18EAE715C();
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

uint64_t sub_18EACCC60(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_18EACC984();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_18EACCDF8();
      goto LABEL_22;
    }
    sub_18EACCFA8();
  }
  v11 = *v4;
  sub_18EAE7150();
  sub_18EAE6EEC();
  result = sub_18EAE715C();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_18EAE7120(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_18EAE7138();
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
          result = sub_18EAE7120();
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

void *sub_18EACCDF8()
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE12FA30);
  v2 = *v0;
  v3 = sub_18EAE706C();
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

uint64_t sub_18EACCFA8()
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE12FA30);
  v3 = sub_18EAE7078();
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
    sub_18EAE7150();
    swift_bridgeObjectRetain();
    sub_18EAE6EEC();
    result = sub_18EAE715C();
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

id sub_18EACD254(void *a1)
{
  char *v1;
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t ObjCClassFromMetadata;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  id v61;
  void (*v62)(char *, uint64_t);
  id v63;
  id v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  objc_class *ObjectType;
  objc_super v91;
  id v92;
  uint64_t v93;
  uint64_t v94;

  v89 = a1;
  ObjectType = (objc_class *)swift_getObjectType();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F890);
  v87 = *(_QWORD *)(v2 - 8);
  v88 = v2;
  MEMORY[0x1E0C80A78](v2, v3);
  v86 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F878);
  v84 = *(_QWORD *)(v5 - 8);
  v85 = v5;
  MEMORY[0x1E0C80A78](v5, v6);
  v83 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8A0);
  v81 = *(_QWORD *)(v8 - 8);
  v82 = v8;
  MEMORY[0x1E0C80A78](v8, v9);
  v80 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8A8);
  v78 = *(_QWORD *)(v11 - 8);
  v79 = v11;
  MEMORY[0x1E0C80A78](v11, v12);
  v77 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_18EAE6928();
  v74 = *(_QWORD *)(v76 - 8);
  v15 = MEMORY[0x1E0C80A78](v76, v14);
  v73 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15, v17);
  v72 = (char *)&v66 - v18;
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8B0);
  v70 = *(_QWORD *)(v71 - 8);
  MEMORY[0x1E0C80A78](v71, v19);
  v69 = (char *)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8B8);
  v67 = *(_QWORD *)(v68 - 8);
  MEMORY[0x1E0C80A78](v68, v21);
  v23 = (char *)&v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C0);
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24, v26);
  v28 = (char *)&v66 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
  v31 = MEMORY[0x1E0C80A78](v29, v30);
  v33 = (char *)&v66 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v31, v34);
  v36 = (char *)&v66 - v35;
  *(_QWORD *)&v1[OBJC_IVAR___SWCollaborationDetailViewModel____lazy_storage___highlightCenter] = 0;
  swift_unknownObjectWeakInit();
  v37 = &v1[OBJC_IVAR___SWCollaborationDetailViewModel__collaborationInfo];
  v38 = type metadata accessor for CollaborationInfo(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v36, 1, 1, v38);
  sub_18EACEF08((uint64_t)v36, (uint64_t)v33, &qword_1EE12F8C8);
  v39 = v1;
  sub_18EAE6A30();
  sub_18EACF070((uint64_t)v36, &qword_1EE12F8C8);
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v37, v28, v24);
  v40 = &v39[OBJC_IVAR___SWCollaborationDetailViewModel__highlight];
  v93 = 0;
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8E8);
  sub_18EAE6A30();
  v41 = v67;
  v42 = v68;
  (*(void (**)(char *, char *, uint64_t))(v67 + 32))(v40, v23, v68);
  v43 = &v39[OBJC_IVAR___SWCollaborationDetailViewModel__customContentTitle];
  v93 = 0;
  v94 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8F8);
  v44 = v69;
  sub_18EAE6A30();
  (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v43, v44, v71);
  v45 = &v39[OBJC_IVAR___SWCollaborationDetailViewModel__headerFallback];
  v46 = v72;
  sub_18EAE68F8();
  v47 = v74;
  v48 = v76;
  (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v73, v46, v76);
  v49 = v77;
  sub_18EAE6A30();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v48);
  (*(void (**)(char *, char *, uint64_t))(v78 + 32))(v45, v49, v79);
  v50 = &v39[OBJC_IVAR___SWCollaborationDetailViewModel__customCollaborators];
  v93 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F910);
  v51 = v80;
  sub_18EAE6A30();
  (*(void (**)(char *, char *, uint64_t))(v81 + 32))(v50, v51, v82);
  v52 = &v39[OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle];
  sub_18EAC570C(0, (unint64_t *)&unk_1EE12F918);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v54 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v55 = sub_18EAE685C();
  v57 = v56;

  v93 = v55;
  v94 = v57;
  v58 = v83;
  sub_18EAE6A30();
  (*(void (**)(char *, char *, uint64_t))(v84 + 32))(v52, v58, v85);
  v59 = &v39[OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton];
  LOBYTE(v93) = 1;
  v60 = v86;
  sub_18EAE6A30();
  (*(void (**)(char *, char *, uint64_t))(v87 + 32))(v59, v60, v88);
  v61 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB36C8]), sel_init);
  *(_QWORD *)&v39[OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider] = v61;
  swift_beginAccess();
  v62 = *(void (**)(char *, uint64_t))(v41 + 8);
  v63 = v89;
  v64 = v89;
  v62(v40, v42);
  v92 = v63;
  sub_18EAE6A30();
  swift_endAccess();

  v91.receiver = v39;
  v91.super_class = ObjectType;
  return objc_msgSendSuper2(&v91, sel_init);
}

uint64_t sub_18EACD910(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE12FA30);
    v3 = sub_18EAE7084();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_18EAE7150();
      swift_bridgeObjectRetain();
      sub_18EAE6EEC();
      result = sub_18EAE715C();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = sub_18EAE7120(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = sub_18EAE7120();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x1E0DEE9E8];
}

uint64_t sub_18EACDAB0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_18EAE70F0();
  __break(1u);
  return result;
}

uint64_t sub_18EACDBA0(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_18EAE6F70();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_18EACC7D8(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_18EACDC34()
{
  unint64_t v0;

  v0 = sub_18EAE7108();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

void sub_18EACDC7C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  unsigned __int8 v34;
  uint64_t ObjCClassFromMetadata;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t);
  uint64_t v51;
  _QWORD *v52;
  char *v53;
  uint64_t v54;
  _QWORD *v55;
  void *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t aBlock;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t, void *);
  void *v68;
  void *v69;
  uint64_t v70;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FA00);
  MEMORY[0x1E0C80A78](v6, v7);
  v59 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_18EAE69E8();
  v60 = *(_QWORD *)(v9 - 8);
  v61 = v9;
  MEMORY[0x1E0C80A78](v9, v10);
  v58 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a2;
  v12[3] = a3;
  v63 = v12;
  v12[4] = a1;
  swift_retain();
  v13 = a1;
  v14 = 0;
  while (2)
  {
    v15 = *((unsigned __int8 *)&unk_1E28733B8 + v14 + 32);
    v64 = v14 + 1;
    v62 = v15;
    v16 = sub_18EAC6BE4(v15);
    v17 = v16;
    v18 = 0;
    v19 = v16 + 56;
    v20 = 1 << *(_BYTE *)(v16 + 32);
    if (v20 < 64)
      v21 = ~(-1 << v20);
    else
      v21 = -1;
    v22 = v21 & *(_QWORD *)(v16 + 56);
    v23 = (unint64_t)(v20 + 63) >> 6;
    if (v22)
    {
LABEL_6:
      v24 = __clz(__rbit64(v22));
      v22 &= v22 - 1;
      v25 = v24 | (v18 << 6);
      goto LABEL_21;
    }
    while (1)
    {
      v26 = v18 + 1;
      if (__OFADD__(v18, 1))
      {
        __break(1u);
        goto LABEL_41;
      }
      if (v26 >= v23)
        goto LABEL_24;
      v27 = *(_QWORD *)(v19 + 8 * v26);
      ++v18;
      if (!v27)
      {
        v18 = v26 + 1;
        if (v26 + 1 >= v23)
          goto LABEL_24;
        v27 = *(_QWORD *)(v19 + 8 * v18);
        if (!v27)
        {
          v18 = v26 + 2;
          if (v26 + 2 >= v23)
            goto LABEL_24;
          v27 = *(_QWORD *)(v19 + 8 * v18);
          if (!v27)
            break;
        }
      }
LABEL_20:
      v22 = (v27 - 1) & v27;
      v25 = __clz(__rbit64(v27)) + (v18 << 6);
LABEL_21:
      v29 = (uint64_t *)(*(_QWORD *)(v17 + 48) + 16 * v25);
      v31 = *v29;
      v30 = v29[1];
      swift_bridgeObjectRetain();
      v32 = (void *)sub_18EAE6EB0();
      v33 = v13;
      v34 = objc_msgSend(v13, sel_hasItemConformingToTypeIdentifier_, v32);

      if ((v34 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_release();
        v13 = v33;
        goto LABEL_27;
      }
      swift_bridgeObjectRelease();
      v13 = v33;
      if (v22)
        goto LABEL_6;
    }
    v28 = v26 + 3;
    if (v28 >= v23)
    {
LABEL_24:
      swift_release();
      v14 = v64;
      if (v64 != 3)
        continue;
      v62 = 0;
      v31 = 0;
      v30 = 0;
LABEL_27:
      sub_18EAC570C(0, &qword_1EE12FA08);
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      if (objc_msgSend(v13, sel_canLoadObjectOfClass_, ObjCClassFromMetadata))
      {
        swift_bridgeObjectRelease();
        v36 = swift_allocObject();
        v37 = v63;
        *(_QWORD *)(v36 + 16) = sub_18EACF064;
        *(_QWORD *)(v36 + 24) = v37;
        v69 = sub_18EACF12C;
        v70 = v36;
        aBlock = MEMORY[0x1E0C809B0];
        v66 = 1107296256;
        v67 = sub_18EACB8B4;
        v68 = &block_descriptor_72;
        v38 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        v39 = objc_msgSend(v13, sel_loadObjectOfClass_completionHandler_, ObjCClassFromMetadata, v38);
      }
      else
      {
        sub_18EAC570C(0, &qword_1EE12FA10);
        v40 = swift_getObjCClassFromMetadata();
        if (!objc_msgSend(v13, sel_canLoadObjectOfClass_, v40))
        {
          if (v30)
          {
            v44 = objc_msgSend(v13, sel_registeredContentTypesForOpenInPlace);
            v45 = v61;
            v46 = sub_18EAE6F34();

            if (*(_QWORD *)(v46 + 16))
            {
              v47 = (uint64_t)v59;
              v48 = v60;
              (*(void (**)(char *, unint64_t, uint64_t))(v60 + 16))(v59, v46 + ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80)), v45);
              v49 = 0;
            }
            else
            {
              v49 = 1;
              v47 = (uint64_t)v59;
              v48 = v60;
            }
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 56))(v47, v49, 1, v45);
            swift_bridgeObjectRelease();
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v47, 1, v45) == 1)
            {
              sub_18EACF070(v47, &qword_1EE12FA00);
              sub_18EAE68BC();
              v50 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8];
              v51 = swift_allocObject();
              v52 = v63;
              *(_QWORD *)(v51 + 16) = sub_18EACF064;
              *(_QWORD *)(v51 + 24) = v52;
              *(_BYTE *)(v51 + 32) = v62;
              *(_QWORD *)(v51 + 40) = v31;
              *(_QWORD *)(v51 + 48) = v30;
              sub_18EACF234(&qword_1EE12FA18, v50, MEMORY[0x1E0CB0040]);
              swift_retain();

              swift_release();
              swift_release();
            }
            else
            {
              v53 = v58;
              (*(void (**)(char *, uint64_t, uint64_t))(v48 + 32))(v58, v47, v45);
              v54 = swift_allocObject();
              v55 = v63;
              *(_QWORD *)(v54 + 16) = sub_18EACF064;
              *(_QWORD *)(v54 + 24) = v55;
              *(_BYTE *)(v54 + 32) = v62;
              *(_QWORD *)(v54 + 40) = v31;
              *(_QWORD *)(v54 + 48) = v30;
              swift_retain();
              v56 = (void *)sub_18EAE6FAC();
              swift_release();

              swift_release();
              (*(void (**)(char *, uint64_t))(v48 + 8))(v53, v45);
            }
          }
          else
          {
            swift_release();
          }
          return;
        }
        swift_bridgeObjectRelease();
        v41 = swift_allocObject();
        v42 = v63;
        *(_QWORD *)(v41 + 16) = sub_18EACF064;
        *(_QWORD *)(v41 + 24) = v42;
        v69 = sub_18EACF124;
        v70 = v41;
        aBlock = MEMORY[0x1E0C809B0];
        v66 = 1107296256;
        v67 = sub_18EACB8B4;
        v68 = &block_descriptor_66;
        v38 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        v39 = objc_msgSend(v13, sel_loadObjectOfClass_completionHandler_, v40, v38);
      }
      v43 = v39;
      swift_release();
      _Block_release(v38);

      return;
    }
    break;
  }
  v27 = *(_QWORD *)(v19 + 8 * v28);
  if (v27)
  {
    v18 = v28;
    goto LABEL_20;
  }
  while (1)
  {
    v18 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v18 >= v23)
      goto LABEL_24;
    v27 = *(_QWORD *)(v19 + 8 * v18);
    ++v28;
    if (v27)
      goto LABEL_20;
  }
LABEL_41:
  __break(1u);
}

uint64_t sub_18EACE308(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = (void **)(v1 + OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  v6 = *v3;
  v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v8 = v6;
  swift_retain();
  sub_18EACDC7C(v8, (uint64_t)sub_18EACE3E4, v7);

  return swift_release_n();
}

uint64_t sub_18EACE3C0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_18EACE3E4(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  sub_18EAC930C(a1, a2, a3, a4, a5, v5);
}

uint64_t type metadata accessor for CollaborationInfo(uint64_t a1)
{
  return sub_18EACE610(a1, qword_1EE12F9D0);
}

uint64_t sub_18EACE418()
{
  return MEMORY[0x1E0C96020];
}

id sub_18EACE424@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

void sub_18EACE474(id *a1)
{
  id v1;

  v1 = *a1;
  sub_18EACE308(v1);

}

uint64_t sub_18EACE4AC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR___SWCollaborationDetailViewModel_cloudSharingControllerDelegate;
  swift_beginAccess();
  result = MEMORY[0x193FF6168](v3);
  *a2 = result;
  return result;
}

uint64_t sub_18EACE500()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_18EACE554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18EAC875C(a1, a2, a3, (uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle, &qword_1EE12F878);
}

uint64_t sub_18EACE578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_18EAC87C8(a1, a2, a3, a4, &qword_1EE12F880, (uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle, &qword_1EE12F878);
}

uint64_t sub_18EACE5A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18EAC875C(a1, a2, a3, (uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton, &qword_1EE12F890);
}

uint64_t sub_18EACE5C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_18EAC87C8(a1, a2, a3, a4, &qword_1EE12F898, (uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton, &qword_1EE12F890);
}

uint64_t sub_18EACE5F4()
{
  return type metadata accessor for CollaborationDetailViewModel(0);
}

uint64_t type metadata accessor for CollaborationDetailViewModel(uint64_t a1)
{
  return sub_18EACE610(a1, (uint64_t *)&unk_1EE12F928);
}

uint64_t sub_18EACE610(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_18EACE644()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  sub_18EACE840(319, &qword_1EE12F938, &qword_1EE12F8C8);
  if (v0 <= 0x3F)
  {
    sub_18EACE840(319, &qword_1EE12F940, &qword_1EE12F8E8);
    if (v1 <= 0x3F)
    {
      sub_18EACE840(319, &qword_1EE12F948, &qword_1EE12F8F8);
      if (v2 <= 0x3F)
      {
        sub_18EACE7EC();
        if (v3 <= 0x3F)
        {
          sub_18EACE840(319, &qword_1EE12F958, &qword_1EE12F910);
          if (v4 <= 0x3F)
          {
            sub_18EACE88C(319, &qword_1EE12F960);
            if (v5 <= 0x3F)
            {
              sub_18EACE88C(319, &qword_1EE12F968);
              if (v6 <= 0x3F)
                swift_updateClassMetadata2();
            }
          }
        }
      }
    }
  }
}

uint64_t method lookup function for CollaborationDetailViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CollaborationDetailViewModel.__allocating_init(itemProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

void sub_18EACE7EC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EE12F950)
  {
    sub_18EAE6928();
    v0 = sub_18EAE6A78();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EE12F950);
  }
}

void sub_18EACE840(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_18EAE6A78();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_18EACE88C(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_18EAE6A78();
    if (!v4)
      atomic_store(v3, a2);
  }
}

char *sub_18EACE8D0(char *a1, char **a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v9[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v10 = sub_18EAE68BC();
      (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
    }
    else
    {
      v7 = *a2;
      if (EnumCaseMultiPayload == 1)
      {
        *(_QWORD *)a1 = *a2;
        v8 = v7;
      }
      else
      {
        v11 = a2[1];
        *(_QWORD *)a1 = *a2;
        *((_QWORD *)a1 + 1) = v11;
        a1[16] = *((_BYTE *)a2 + 16);
        v12 = v7;
        v13 = v11;
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_18EACE9BC(id *a1)
{
  int EnumCaseMultiPayload;
  uint64_t v3;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      v3 = sub_18EAE68BC();
      (*(void (**)(id *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    case 1:

      break;
    case 0:

      break;
  }
}

uint64_t sub_18EACEA34(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v7 = sub_18EAE68BC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
  }
  else
  {
    v5 = *(void **)a2;
    if (EnumCaseMultiPayload == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v6 = v5;
    }
    else
    {
      v8 = *(void **)(a2 + 8);
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = v8;
      *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
      v9 = v5;
      v10 = v8;
    }
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_18EACEAF4(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  if (a1 != a2)
  {
    sub_18EACEBCC(a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v7 = sub_18EAE68BC();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      v5 = *(void **)a2;
      *(_QWORD *)a1 = *(_QWORD *)a2;
      if (EnumCaseMultiPayload == 1)
      {
        v6 = v5;
      }
      else
      {
        v8 = *(void **)(a2 + 8);
        *(_QWORD *)(a1 + 8) = v8;
        *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
        v9 = v5;
        v10 = v8;
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_18EACEBCC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CollaborationInfo(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_18EACEC08(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v6 = sub_18EAE68BC();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_18EACEC94(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_18EACEBCC((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v6 = sub_18EAE68BC();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_18EACED30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_18EACED3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_18EACED50()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_18EACED60()
{
  uint64_t result;
  unint64_t v1;

  result = sub_18EAE68BC();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_18EACEDDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CollaborationInfo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18EACEE38(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_18EACEE7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CollaborationInfo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18EACEEC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F9F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18EACEF08(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_18EACEF4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_18EAE68BC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

void sub_18EACEFC0(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(sub_18EAE68BC() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_18EACA94C(a1, a2, v2 + v6, *(void **)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
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

uint64_t sub_18EACF038()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_18EACF064(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  return sub_18EACAE58(a1, a2, a3, a4, a5, *(_QWORD *)(v5 + 16), *(_QWORD *)(v5 + 24), *(void **)(v5 + 32));
}

uint64_t sub_18EACF070(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_18EACF0B0(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_18EACBD7C(a1, a2, *(void (**)(uint64_t *, uint64_t, uint64_t, NSObject *, _QWORD))(v2 + 16), *(_QWORD *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), *(_QWORD *)(v2 + 40), *(NSObject **)(v2 + 48));
}

uint64_t objectdestroy_56Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_18EACF0F0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;

  sub_18EACB990(a1, a2, a3, *(void (**)(uint64_t *, uint64_t, uint64_t, NSObject *, _QWORD))(v3 + 16), *(_QWORD *)(v3 + 24), *(unsigned __int8 *)(v3 + 32), *(_QWORD *)(v3 + 40), *(NSObject **)(v3 + 48));
}

uint64_t sub_18EACF100()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18EACF124(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_18EACB91C(a1, a2, *(void (**)(_QWORD *, uint64_t, _QWORD, unint64_t, uint64_t))(v2 + 16));
}

void sub_18EACF12C(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_18EACB5C8(a1, a2, *(void (**)(uint64_t *, _QWORD, _QWORD, unint64_t, _QWORD))(v2 + 16));
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

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

uint64_t sub_18EACF194(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_18EACF1D0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 24);
  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

_OWORD *sub_18EACF20C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_18EACF21C()
{
  uint64_t v0;

  return sub_18EACB0BC(*(_BYTE *)(v0 + 16), v0 + 24, *(void (**)(char *, _QWORD, unint64_t, _QWORD, _QWORD))(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
}

uint64_t sub_18EACF234(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x193FF6024](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id sub_18EACF274(id result, unint64_t a2)
{
  id v2;

  if (a2 >> 62 == 1)
  {
    v2 = result;
    return (id)swift_bridgeObjectRetain();
  }
  else if (!(a2 >> 62))
  {
    return result;
  }
  return result;
}

id sub_18EACF2B0(id result, unint64_t a2)
{
  if (a2 >> 2 != 0xFFFFFFFF)
    return sub_18EACF274(result, a2);
  return result;
}

void sub_18EACF2C4(void *a1, unint64_t a2)
{
  if (a2 >> 2 != 0xFFFFFFFF)
    sub_18EACF2D8(a1, a2);
}

void sub_18EACF2D8(void *a1, unint64_t a2)
{
  if (a2 >> 62 == 1)
  {

    swift_bridgeObjectRelease();
  }
  else if (!(a2 >> 62))
  {

  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CollaborationEngine(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CollaborationEngine(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_18EACF400 + 4 * byte_18EAE97A5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_18EACF434 + 4 * byte_18EAE97A0[v4]))();
}

uint64_t sub_18EACF434(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18EACF43C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18EACF444);
  return result;
}

uint64_t sub_18EACF450(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18EACF458);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_18EACF45C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18EACF464(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18EACF470(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_18EACF478(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CollaborationEngine()
{
  return &type metadata for CollaborationEngine;
}

uint64_t sub_18EACF490()
{
  return sub_18EAC578C(&qword_1EE12FA60, &qword_1EE12FA68, MEMORY[0x1E0DEAF50]);
}

unint64_t sub_18EACF4C0()
{
  unint64_t result;

  result = qword_1EE12FA70;
  if (!qword_1EE12FA70)
  {
    result = MEMORY[0x193FF6024](&unk_18EAE9C10, &type metadata for CollaborationEngine);
    atomic_store(result, (unint64_t *)&qword_1EE12FA70);
  }
  return result;
}

void **sub_18EACF520(void **a1, void **a2, uint64_t a3)
{
  int v3;
  char *v4;
  void **v7;
  uint64_t v8;
  void **v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(void **, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  int EnumCaseMultiPayload;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = *(int *)(a3 + 20);
    v9 = (void **)((char *)a1 + v8);
    v10 = (void **)((char *)a2 + v8);
    v11 = type metadata accessor for CollaborationInfo(0);
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v12 + 48);
    v14 = v4;
    if (v13(v10, 1, v11))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        v19 = sub_18EAE68BC();
        (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v9, v10, v19);
      }
      else
      {
        v17 = *v10;
        if (EnumCaseMultiPayload == 1)
        {
          *v9 = *v10;
          v18 = v17;
        }
        else
        {
          v20 = v10[1];
          *v9 = *v10;
          v9[1] = v20;
          *((_BYTE *)v9 + 16) = *((_BYTE *)v10 + 16);
          v21 = v17;
          v22 = v20;
        }
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v23 = *(int *)(a3 + 24);
    v24 = *(void **)((char *)a2 + v23);
    *(void **)((char *)v7 + v23) = v24;
    v25 = v24;
  }
  return v7;
}

void sub_18EACF698(id *a1, uint64_t a2)
{
  id *v4;
  uint64_t v5;
  int EnumCaseMultiPayload;
  uint64_t v7;

  v4 = (id *)((char *)a1 + *(int *)(a2 + 20));
  v5 = type metadata accessor for CollaborationInfo(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 2:
        v7 = sub_18EAE68BC();
        (*(void (**)(id *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v4, v7);
        break;
      case 1:

        break;
      case 0:

        break;
    }
  }

}

void **sub_18EACF760(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void **v8;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(void **, uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  int EnumCaseMultiPayload;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;

  v6 = *a2;
  *a1 = *a2;
  v7 = *(int *)(a3 + 20);
  v8 = (void **)((char *)a1 + v7);
  v9 = (void **)((char *)a2 + v7);
  v10 = type metadata accessor for CollaborationInfo(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v11 + 48);
  v13 = v6;
  if (v12(v9, 1, v10))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v18 = sub_18EAE68BC();
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v8, v9, v18);
    }
    else
    {
      v16 = *v9;
      if (EnumCaseMultiPayload == 1)
      {
        *v8 = *v9;
        v17 = v16;
      }
      else
      {
        v19 = v9[1];
        *v8 = *v9;
        v8[1] = v19;
        *((_BYTE *)v8 + 16) = *((_BYTE *)v9 + 16);
        v20 = v16;
        v21 = v19;
      }
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v22 = *(int *)(a3 + 24);
  v23 = *(void **)((char *)a2 + v22);
  *(void **)((char *)a1 + v22) = v23;
  v24 = v23;
  return a1;
}

void **sub_18EACF8B0(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  int v15;
  int v16;
  int EnumCaseMultiPayload;
  void *v18;
  id v19;
  uint64_t v20;
  int v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = *(int *)(a3 + 20);
  v10 = (uint64_t)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for CollaborationInfo(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14((uint64_t)v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        v24 = sub_18EAE68BC();
        (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v10, v11, v24);
      }
      else
      {
        v18 = *(void **)v11;
        *(_QWORD *)v10 = *(_QWORD *)v11;
        if (EnumCaseMultiPayload == 1)
        {
          v19 = v18;
        }
        else
        {
          v25 = (void *)*((_QWORD *)v11 + 1);
          *(_QWORD *)(v10 + 8) = v25;
          *(_BYTE *)(v10 + 16) = v11[16];
          v26 = v18;
          v27 = v25;
        }
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_17;
    }
LABEL_8:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
    memcpy((void *)v10, v11, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_17;
  }
  if (v16)
  {
    sub_18EACEBCC(v10);
    goto LABEL_8;
  }
  if (a1 != a2)
  {
    sub_18EACEBCC(v10);
    v21 = swift_getEnumCaseMultiPayload();
    if (v21 == 2)
    {
      v33 = sub_18EAE68BC();
      (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v10, v11, v33);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      v22 = *(void **)v11;
      *(_QWORD *)v10 = *(_QWORD *)v11;
      if (v21 == 1)
      {
        v23 = v22;
      }
      else
      {
        v34 = (void *)*((_QWORD *)v11 + 1);
        *(_QWORD *)(v10 + 8) = v34;
        *(_BYTE *)(v10 + 16) = v11[16];
        v35 = v22;
        v36 = v34;
      }
      swift_storeEnumTagMultiPayload();
    }
  }
LABEL_17:
  v28 = *(int *)(a3 + 24);
  v29 = *(void **)((char *)a2 + v28);
  v30 = *(void **)((char *)a1 + v28);
  *(void **)((char *)a1 + v28) = v29;
  v31 = v29;

  return a1;
}

_QWORD *sub_18EACFAF0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for CollaborationInfo(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v12 = sub_18EAE68BC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v7, v8, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(v10 + 64));
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void **sub_18EACFC0C(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for CollaborationInfo(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      if (a1 == a2)
        goto LABEL_14;
      sub_18EACEBCC((uint64_t)v8);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        v17 = sub_18EAE68BC();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v8, v9, v17);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      v16 = *(_QWORD *)(v11 + 64);
      goto LABEL_8;
    }
    sub_18EACEBCC((uint64_t)v8);
LABEL_7:
    v16 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8) - 8) + 64);
LABEL_8:
    memcpy(v8, v9, v16);
    goto LABEL_14;
  }
  if (v14)
    goto LABEL_7;
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v15 = sub_18EAE68BC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v8, v9, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(v11 + 64));
  }
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_14:
  v18 = *(int *)(a3 + 24);
  v19 = *(void **)((char *)a1 + v18);
  *(void **)((char *)a1 + v18) = *(void **)((char *)a2 + v18);

  return a1;
}

uint64_t sub_18EACFDC4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_18EACFDD0(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_18EACFE50()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_18EACFE5C(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for ComposeViewController()
{
  uint64_t result;

  result = qword_1EE12FA80;
  if (!qword_1EE12FA80)
    return swift_getSingletonMetadata();
  return result;
}

void sub_18EACFF10()
{
  unint64_t v0;

  sub_18EACFF88();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_18EACFF88()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EE12FA90)
  {
    type metadata accessor for CollaborationInfo(255);
    v0 = sub_18EAE7030();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EE12FA90);
  }
}

uint64_t sub_18EACFFDC()
{
  return sub_18EAD0398(&qword_1EE12FA98, (uint64_t)&unk_18EAE9D00);
}

id sub_18EAD0000()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  int EnumCaseMultiPayload;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v27;
  uint64_t v28;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
  MEMORY[0x1E0C80A78](v1, v2);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CollaborationInfo(0);
  v6 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x1E0C80A78](v5, v7);
  v10 = (void **)((char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v8, v11);
  v13 = (char *)&v28 - v12;
  v14 = type metadata accessor for ComposeViewController();
  sub_18EAD03D8((uint64_t)v0 + *(int *)(v14 + 20), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_18EAD0420((uint64_t)v4);
LABEL_9:
    v21 = (void *)objc_opt_self();
    v22 = 0;
    v19 = 0;
    v16 = 0;
    v23 = *(uint64_t *)((char *)v0 + *(int *)(v14 + 24));
    v24 = *v0;
    goto LABEL_10;
  }
  sub_18EACEE7C((uint64_t)v4, (uint64_t)v13);
  sub_18EACEE7C((uint64_t)v13, (uint64_t)v10);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_18EACEBCC((uint64_t)v10);
    goto LABEL_9;
  }
  if (EnumCaseMultiPayload != 1)
  {
    v20 = sub_18EAE68BC();
    (*(void (**)(void **, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v10, v20);
    goto LABEL_9;
  }
  v16 = *v10;
  v17 = objc_msgSend(v16, sel_collaborationMetadata);
  if (v17)
  {
    v18 = v17;
    v19 = objc_msgSend(v17, sel_defaultShareOptions);

  }
  else
  {
    v19 = 0;
  }
  v27 = *(int *)(v14 + 24);
  v24 = *v0;
  v23 = *(uint64_t *)((char *)v0 + v27);
  v21 = (void *)objc_opt_self();
  v22 = objc_msgSend(v16, sel_collaborationMetadata);
LABEL_10:
  v25 = objc_msgSend(v21, sel_newComposeViewControllerInstanceWithDelegate_itemProvider_collaborationOptions_collaborationMetadata_, v23, v24, v19, v22);

  return v25;
}

uint64_t sub_18EAD0248()
{
  return sub_18EAE6C1C();
}

uint64_t sub_18EAD0280()
{
  return MEMORY[0x1E0CE0788];
}

uint64_t sub_18EAD028C()
{
  sub_18EAD0398(&qword_1EE12FAA0, (uint64_t)&unk_18EAE9C88);
  return sub_18EAE6C58();
}

uint64_t sub_18EAD02EC()
{
  sub_18EAD0398(&qword_1EE12FAA0, (uint64_t)&unk_18EAE9C88);
  return sub_18EAE6C28();
}

uint64_t sub_18EAD034C()
{
  return sub_18EAE6D60();
}

void sub_18EAD0364()
{
  sub_18EAD0398(&qword_1EE12FAA0, (uint64_t)&unk_18EAE9C88);
  sub_18EAE6C4C();
  __break(1u);
}

uint64_t sub_18EAD0398(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for ComposeViewController();
    result = MEMORY[0x193FF6024](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18EAD03D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18EAD0420(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for CollaborationDetailViewHeader(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CollaborationDetailViewHeader(uint64_t a1)
{

  return swift_release();
}

uint64_t initializeWithCopy for CollaborationDetailViewHeader(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CollaborationDetailViewHeader(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

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

uint64_t assignWithTake for CollaborationDetailViewHeader(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CollaborationDetailViewHeader(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CollaborationDetailViewHeader(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CollaborationDetailViewHeader()
{
  return &type metadata for CollaborationDetailViewHeader;
}

uint64_t sub_18EAD0654()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18EAD0664(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_18EAD06A0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
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
  char *v18;
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
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  __n128 v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  char v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  id v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(char *, char *, uint64_t);
  uint64_t v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  _OWORD v96[10];
  uint64_t v97;
  _OWORD v98[11];
  char v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _OWORD v109[3];

  v90 = a1;
  v91 = a4;
  v83 = a3;
  v89 = a5;
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAB0);
  MEMORY[0x1E0C80A78](v84, v6);
  v95 = (uint64_t)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAB8);
  v86 = *(_QWORD *)(v88 - 8);
  v9 = MEMORY[0x1E0C80A78](v88, v8);
  v87 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9, v11);
  v85 = (char *)&v76 - v12;
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAC0);
  MEMORY[0x1E0C80A78](v81, v13);
  v82 = (uint64_t)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_18EAE69A0();
  v78 = *(_QWORD *)(v15 - 8);
  v79 = v15;
  MEMORY[0x1E0C80A78](v15, v16);
  v18 = (char *)&v76 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAC8);
  MEMORY[0x1E0C80A78](v19, v20);
  v22 = (char *)&v76 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAD0);
  v24 = MEMORY[0x1E0C80A78](v80, v23);
  v26 = (char *)&v76 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v24, v27);
  v29 = (char *)&v76 - v28;
  v77 = sub_18EAE6928();
  v30 = *(_QWORD *)(v77 - 8);
  MEMORY[0x1E0C80A78](v77, v31);
  v33 = (char *)&v76 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAD8);
  v36 = MEMORY[0x1E0C80A78](v34, v35);
  v92 = (uint64_t)&v76 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v36, v38);
  v94 = (uint64_t)&v76 - v39;
  swift_getKeyPath();
  swift_getKeyPath();
  v93 = a2;
  sub_18EAE6A60();
  swift_release();
  swift_release();
  v40 = (void *)v100;
  if ((_QWORD)v100)
  {
    v41 = objc_msgSend((id)v100, sel_slHighlight);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18EAE6A60();
    swift_release();
    swift_release();
    sub_18EAE6994();
    sub_18EAE6E50();
    v42 = sub_18EAD0FC8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v22, 0.0, 1, 0.0, 1);
    (*(void (**)(char *, uint64_t, __n128))(v78 + 8))(v18, v79, v42);
    sub_18EACEF08((uint64_t)v22, (uint64_t)v26, &qword_1EE12FAC8);
    v26[*(int *)(v80 + 36)] = 0;
    sub_18EACF070((uint64_t)v22, &qword_1EE12FAC8);
    sub_18EAD20BC((uint64_t)v26, (uint64_t)v29, &qword_1EE12FAD0);
    sub_18EACEF08((uint64_t)v29, v82, &qword_1EE12FAD0);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FB00);
    sub_18EAD1E58();
    sub_18EAC578C(&qword_1EE12FB28, &qword_1EE12FB00, MEMORY[0x1E0CDFB10]);
    v43 = v92;
    sub_18EAE6BEC();

    sub_18EACF070((uint64_t)v29, &qword_1EE12FAD0);
    v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAE0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v43, 0, 1, v44);
    sub_18EAD20BC(v43, v94, &qword_1EE12FAD8);
    v45 = v83;
  }
  else
  {
    v46 = v82;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18EAE6A60();
    swift_release();
    swift_release();
    v47 = sub_18EAE68E0();
    v48 = *(void (**)(char *, uint64_t))(v30 + 8);
    v48(v33, v77);
    v45 = v83;
    if ((v47 & 1) != 0)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_18EAE6A60();
      swift_release();
      swift_release();
      v49 = sub_18EAE6AF0();
      sub_18EAD1564((uint64_t)v33, (uint64_t)v96);
      *(_OWORD *)((char *)&v98[4] + 7) = v96[4];
      *(_OWORD *)((char *)&v98[3] + 7) = v96[3];
      *(_OWORD *)((char *)&v98[7] + 7) = v96[7];
      *(_OWORD *)((char *)&v98[8] + 7) = v96[8];
      *(_OWORD *)((char *)&v98[9] + 7) = v96[9];
      *(_OWORD *)((char *)&v98[5] + 7) = v96[5];
      *(_OWORD *)((char *)&v98[6] + 7) = v96[6];
      *(_OWORD *)((char *)v98 + 7) = v96[0];
      v99 = 1;
      *(_QWORD *)((char *)&v98[10] + 7) = v97;
      *(_OWORD *)((char *)&v98[1] + 7) = v96[1];
      *(_OWORD *)((char *)&v98[2] + 7) = v96[2];
      v108 = v98[8];
      v109[0] = v98[9];
      *(_OWORD *)((char *)v109 + 15) = *(_OWORD *)((char *)&v98[9] + 15);
      v104 = v98[4];
      v105 = v98[5];
      v106 = v98[6];
      v107 = v98[7];
      v100 = v98[0];
      v101 = v98[1];
      v102 = v98[2];
      v103 = v98[3];
      v48(v33, v77);
      v50 = v106;
      *(_OWORD *)(v46 + 129) = v107;
      v51 = v109[0];
      *(_OWORD *)(v46 + 145) = v108;
      *(_OWORD *)(v46 + 161) = v51;
      *(_OWORD *)(v46 + 176) = *(_OWORD *)((char *)v109 + 15);
      v52 = v102;
      *(_OWORD *)(v46 + 65) = v103;
      v53 = v105;
      *(_OWORD *)(v46 + 81) = v104;
      *(_OWORD *)(v46 + 97) = v53;
      *(_OWORD *)(v46 + 113) = v50;
      v54 = v101;
      *(_OWORD *)(v46 + 17) = v100;
      *(_OWORD *)(v46 + 33) = v54;
      *(_QWORD *)v46 = v49;
      *(_QWORD *)(v46 + 8) = 0;
      *(_BYTE *)(v46 + 16) = 1;
      *(_OWORD *)(v46 + 49) = v52;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FB00);
      sub_18EAD1E58();
      sub_18EAC578C(&qword_1EE12FB28, &qword_1EE12FB00, MEMORY[0x1E0CDFB10]);
      v55 = v94;
      sub_18EAE6BEC();
      v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAE0);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v55, 0, 1, v56);
    }
    else
    {
      v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAE0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v94, 1, 1, v57);
    }
  }
  v58 = v45 & 1;
  v60 = v90;
  v59 = v91;
  v61 = v93;
  sub_18EAD1190(v90, v93, v58, v91, v95);
  LOBYTE(v98[0]) = v58;
  *((_QWORD *)&v98[0] + 1) = v59;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAE8);
  sub_18EAE6E14();
  v83 = v101;
  v62 = swift_allocObject();
  *(_QWORD *)(v62 + 16) = v60;
  *(_QWORD *)(v62 + 24) = v61;
  *(_BYTE *)(v62 + 32) = v58;
  *(_QWORD *)(v62 + 40) = v59;
  type metadata accessor for ComposeViewController();
  sub_18EAC578C(&qword_1EE12FAF0, &qword_1EE12FAB0, MEMORY[0x1E0CDFB10]);
  sub_18EACF234(&qword_1EE12FA98, (uint64_t (*)(uint64_t))type metadata accessor for ComposeViewController, (uint64_t)&unk_18EAE9D00);
  v63 = v61;
  swift_retain();
  v64 = v87;
  v65 = v95;
  sub_18EAE6D9C();
  swift_release();
  swift_release();
  swift_release();
  sub_18EACF070(v65, &qword_1EE12FAB0);
  v67 = v85;
  v66 = v86;
  v68 = v88;
  (*(void (**)(char *, char *, uint64_t))(v86 + 32))(v85, v64, v88);
  v69 = v94;
  v70 = v92;
  sub_18EACEF08(v94, v92, &qword_1EE12FAD8);
  v71 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
  v71(v64, v67, v68);
  v72 = v89;
  sub_18EACEF08(v70, v89, &qword_1EE12FAD8);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAF8);
  v71((char *)(v72 + *(int *)(v73 + 48)), v64, v68);
  v74 = *(void (**)(char *, uint64_t))(v66 + 8);
  v74(v67, v68);
  sub_18EACF070(v69, &qword_1EE12FAD8);
  v74(v64, v68);
  return sub_18EACF070(v70, &qword_1EE12FAD8);
}

__n128 sub_18EAD0FC8@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  uint64_t v24;
  _OWORD *v25;
  __n128 result;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __n128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

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
    sub_18EAE6F94();
    v23 = (void *)sub_18EAE6C88();
    sub_18EAE69F4();

  }
  sub_18EAE6AB4();
  v24 = sub_18EAE69A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(a9, v13, v24);
  v25 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAC8) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *v25 = v27;
  v25[1] = v28;
  result = v30;
  v25[2] = v29;
  v25[3] = v30;
  return result;
}

uint64_t sub_18EAD1190@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v20[2];

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAB0);
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v15 = objc_msgSend(v14, sel_userInterfaceIdiom);

  if (v15 == (id)6)
    v16 = 0x402A000000000000;
  else
    v16 = 0x4024000000000000;
  *(_QWORD *)v13 = sub_18EAE6AF0();
  *((_QWORD *)v13 + 1) = v16;
  v13[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FB38);
  v20[1] = &unk_1E28733E0;
  swift_getKeyPath();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a1;
  *(_QWORD *)(v17 + 24) = a2;
  *(_BYTE *)(v17 + 32) = a3;
  *(_QWORD *)(v17 + 40) = a4;
  swift_retain();
  v18 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FE20);
  sub_18EAC578C(&qword_1EE12FB40, &qword_1EE12FE20, MEMORY[0x1E0DEAF48]);
  sub_18EAD2034();
  sub_18EAD2078();
  sub_18EAE6E38();
  return sub_18EAD20BC((uint64_t)v13, a5, &qword_1EE12FAB0);
}

uint64_t sub_18EAD1358@<X0>(uint64_t a1@<X0>, char *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void **v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  char *v22;
  id v23;
  uint64_t result;
  _QWORD aBlock[6];

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)&aBlock[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (void **)&a2[OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider];
  swift_beginAccess();
  v15 = *v14;
  swift_getKeyPath();
  swift_getKeyPath();
  v16 = v15;
  sub_18EAE6A60();
  swift_release();
  swift_release();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a1;
  *(_QWORD *)(v17 + 24) = a2;
  *(_BYTE *)(v17 + 32) = a3;
  *(_QWORD *)(v17 + 40) = a4;
  *a5 = v16;
  v18 = type metadata accessor for ComposeViewController();
  sub_18EACEF08((uint64_t)v13, (uint64_t)a5 + *(int *)(v18 + 20), &qword_1EE12F8C8);
  v19 = (void *)objc_opt_self();
  aBlock[4] = sub_18EAD1FB8;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18EAD0664;
  aBlock[3] = &block_descriptor_1;
  v20 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  v21 = v16;
  v22 = a2;
  swift_release();
  v23 = objc_msgSend(v19, sel_newComposeViewControllerDelegateInstance_, v20);
  _Block_release(v20);

  swift_release();
  result = sub_18EACF070((uint64_t)v13, &qword_1EE12F8C8);
  *(_QWORD *)((char *)a5 + *(int *)(v18 + 24)) = v23;
  return result;
}

uint64_t sub_18EAD1564@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;

  v30 = a1;
  v3 = sub_18EAE6DE4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18EAE691C();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x1E0CDF6F8], v3);
  v29 = sub_18EAE6DF0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  v8 = (void *)objc_opt_self();
  v9 = objc_msgSend(v8, sel_currentDevice);
  objc_msgSend(v9, sel_userInterfaceIdiom);

  v10 = objc_msgSend(v8, sel_currentDevice);
  objc_msgSend(v10, sel_userInterfaceIdiom);

  sub_18EAE6E50();
  sub_18EAE6A90();
  v28 = v43;
  v11 = v44;
  v27 = v45;
  v12 = v46;
  v26 = v47;
  v25 = v48;
  v24 = sub_18EAE6B14();
  sub_18EAD1864(v30, (uint64_t)v31);
  v13 = v31[0];
  v14 = v31[1];
  v15 = v32;
  v17 = v33;
  v16 = v34;
  v18 = v35;
  v19 = v36;
  v20 = v37;
  LOBYTE(v31[0]) = 1;
  v42 = v11;
  v41 = v12;
  v40 = 1;
  v39 = v32;
  v38 = v36;
  *(_QWORD *)a2 = v29;
  *(_QWORD *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 257;
  *(_QWORD *)(a2 + 24) = v28;
  *(_BYTE *)(a2 + 32) = v11;
  *(_QWORD *)(a2 + 40) = v27;
  *(_BYTE *)(a2 + 48) = v12;
  v21 = v25;
  *(_QWORD *)(a2 + 56) = v26;
  *(_QWORD *)(a2 + 64) = v21;
  *(_WORD *)(a2 + 72) = 256;
  *(_QWORD *)(a2 + 80) = v24;
  *(_QWORD *)(a2 + 88) = 0;
  *(_BYTE *)(a2 + 96) = 1;
  *(_QWORD *)(a2 + 104) = v13;
  *(_QWORD *)(a2 + 112) = v14;
  *(_BYTE *)(a2 + 120) = v15;
  *(_QWORD *)(a2 + 128) = v17;
  *(_QWORD *)(a2 + 136) = v16;
  *(_QWORD *)(a2 + 144) = v18;
  *(_BYTE *)(a2 + 152) = v19;
  *(_QWORD *)(a2 + 160) = v20;
  swift_retain();
  sub_18EAD1F8C(v13, v14, v15);
  swift_bridgeObjectRetain();
  sub_18EAD1F8C(v16, v18, v19);
  swift_bridgeObjectRetain();
  sub_18EAD1F9C(v13, v14, v15);
  swift_bridgeObjectRelease();
  sub_18EAD1F9C(v16, v18, v19);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18EAD1864@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  void (*v40)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  unsigned int v42;
  void (*v43)(char *);
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;

  v44 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FB30);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (uint64_t)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_18EAE6CE8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18EAE6904();
  v42 = *MEMORY[0x1E0CDD790];
  v43 = *(void (**)(char *))(v8 + 104);
  v43(v11);
  v12 = sub_18EAE6CD0();
  v40 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
  v41 = v12;
  v40(v6, 1, 1, v12);
  sub_18EAE6CDC();
  sub_18EACF070(v6, &qword_1EE12FB30);
  v39 = *(void (**)(char *, uint64_t))(v8 + 8);
  v39(v11, v7);
  v13 = sub_18EAE6D24();
  v15 = v14;
  v17 = v16;
  swift_bridgeObjectRelease();
  swift_release();
  v18 = sub_18EAE6D18();
  v46 = v19;
  v47 = v18;
  v48 = v20;
  v45 = v21 & 1;
  sub_18EAD1F9C(v13, v15, v17 & 1);
  swift_bridgeObjectRelease();
  sub_18EAE6910();
  ((void (*)(char *, _QWORD, uint64_t))v43)(v11, v42, v7);
  v40(v6, 1, 1, v41);
  sub_18EAE6CDC();
  sub_18EACF070(v6, &qword_1EE12FB30);
  v39(v11, v7);
  v22 = sub_18EAE6D24();
  v24 = v23;
  LOBYTE(v6) = v25;
  swift_bridgeObjectRelease();
  swift_release();
  LOBYTE(v15) = v6 & 1;
  sub_18EAE6DCC();
  v26 = sub_18EAE6D0C();
  v28 = v27;
  v30 = v29;
  v32 = v31;
  swift_release();
  v30 &= 1u;
  sub_18EAD1F9C(v22, v24, v15);
  swift_bridgeObjectRelease();
  v33 = v45;
  v49 = v45;
  v35 = v46;
  v34 = v47;
  *(_QWORD *)a2 = v47;
  *(_QWORD *)(a2 + 8) = v35;
  *(_BYTE *)(a2 + 16) = v33;
  *(_QWORD *)(a2 + 24) = v48;
  *(_QWORD *)(a2 + 32) = v26;
  *(_QWORD *)(a2 + 40) = v28;
  *(_BYTE *)(a2 + 48) = v30;
  *(_QWORD *)(a2 + 56) = v32;
  v36 = v34;
  sub_18EAD1F8C(v34, v35, v33);
  swift_bridgeObjectRetain();
  sub_18EAD1F8C(v26, v28, v30);
  swift_bridgeObjectRetain();
  sub_18EAD1F9C(v26, v28, v30);
  swift_bridgeObjectRelease();
  sub_18EAD1F9C(v36, v35, v49);
  return swift_bridgeObjectRelease();
}

uint64_t sub_18EAD1BB4@<X0>(char *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v8;
  void (*v9)();
  uint64_t v10;
  id v14;
  id v15;
  uint64_t result;
  uint64_t v17;

  v8 = *a1;
  if (*a1)
  {
    v9 = 0;
    v10 = 0;
  }
  else
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = a2;
    *(_QWORD *)(v10 + 24) = a3;
    *(_BYTE *)(v10 + 32) = a4 & 1;
    *(_QWORD *)(v10 + 40) = a5;
    swift_retain();
    v14 = a3;
    v9 = sub_18EAD2130;
  }
  type metadata accessor for CollaborationDetailViewModel(0);
  sub_18EACF234((unint64_t *)&qword_1EE12FB58, type metadata accessor for CollaborationDetailViewModel, (uint64_t)&protocol conformance descriptor for CollaborationDetailViewModel);
  v15 = a3;
  result = sub_18EAE6A9C();
  *(_QWORD *)a6 = result;
  *(_QWORD *)(a6 + 8) = v17;
  *(_BYTE *)(a6 + 16) = v8;
  *(_QWORD *)(a6 + 24) = v9;
  *(_QWORD *)(a6 + 32) = v10;
  return result;
}

void sub_18EAD1C90()
{
  void *v0;

  if (objc_msgSend((id)objc_opt_self(), sel_canSendText))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18EAE6A60();
    swift_release();
    swift_release();

    if (!v0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAE8);
      sub_18EAE6E08();
    }
  }
}

uint64_t sub_18EAD1D70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;

  v3 = *(_QWORD *)v1;
  v4 = *(void **)(v1 + 8);
  v5 = *(unsigned __int8 *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = sub_18EAE6B14();
  v8 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v9 = objc_msgSend(v8, sel_userInterfaceIdiom);

  v10 = v9 == (id)1 || v9 == (id)6;
  v11 = 0x4028000000000000;
  if (v10)
    v11 = 0x4030000000000000;
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v11;
  *(_BYTE *)(a1 + 16) = 0;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAA8);
  return sub_18EAD06A0(v3, v4, v5, v6, a1 + *(int *)(v12 + 44));
}

uint64_t sub_18EAD1E48@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_18EAD1358(*(_QWORD *)(v1 + 16), *(char **)(v1 + 24), *(_BYTE *)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

unint64_t sub_18EAD1E58()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE12FB08;
  if (!qword_1EE12FB08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FAD0);
    v2[0] = sub_18EAD1EC4();
    v2[1] = sub_18EAD1F48();
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE12FB08);
  }
  return result;
}

unint64_t sub_18EAD1EC4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE12FB10;
  if (!qword_1EE12FB10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FAC8);
    v2[0] = sub_18EACF234(&qword_1EE12FB18, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA8810], MEMORY[0x1E0DA8800]);
    v2[1] = MEMORY[0x1E0CDA228];
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE12FB10);
  }
  return result;
}

unint64_t sub_18EAD1F48()
{
  unint64_t result;

  result = qword_1EE12FB20;
  if (!qword_1EE12FB20)
  {
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CDC898], MEMORY[0x1E0CDC8A8]);
    atomic_store(result, (unint64_t *)&qword_1EE12FB20);
  }
  return result;
}

uint64_t sub_18EAD1F8C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_18EAD1F9C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_18EAD1FB8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAE8);
  return sub_18EAE6E08();
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

uint64_t sub_18EAD2024@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_18EAD1BB4(a1, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), *(_BYTE *)(v2 + 32), *(_QWORD *)(v2 + 40), a2);
}

unint64_t sub_18EAD2034()
{
  unint64_t result;

  result = qword_1EE12FB48;
  if (!qword_1EE12FB48)
  {
    result = MEMORY[0x193FF6024](&unk_18EAEA448, &type metadata for CommunicationChannel);
    atomic_store(result, (unint64_t *)&qword_1EE12FB48);
  }
  return result;
}

unint64_t sub_18EAD2078()
{
  unint64_t result;

  result = qword_1EE12FB50;
  if (!qword_1EE12FB50)
  {
    result = MEMORY[0x193FF6024](&unk_18EAEA1A4, &type metadata for CommunicationButton);
    atomic_store(result, (unint64_t *)&qword_1EE12FB50);
  }
  return result;
}

uint64_t sub_18EAD20BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_18EAD2130()
{
  sub_18EAD1C90();
}

uint64_t sub_18EAD2140()
{
  return sub_18EAC578C(&qword_1EE12FB60, &qword_1EE12FB68, MEMORY[0x1E0CDFCC0]);
}

ValueMetadata *type metadata accessor for UIDocumentSharingControllerRepresentable()
{
  return &type metadata for UIDocumentSharingControllerRepresentable;
}

id sub_18EAD217C()
{
  id *v0;

  return *v0;
}

uint64_t sub_18EAD2184()
{
  sub_18EAD2290();
  return sub_18EAE6C58();
}

uint64_t sub_18EAD21D4()
{
  sub_18EAD2290();
  return sub_18EAE6C28();
}

void sub_18EAD2224()
{
  sub_18EAD2290();
  sub_18EAE6C4C();
  __break(1u);
}

unint64_t sub_18EAD224C()
{
  unint64_t result;

  result = qword_1EE12FB70;
  if (!qword_1EE12FB70)
  {
    result = MEMORY[0x193FF6024](&unk_18EAE9F0C, &type metadata for UIDocumentSharingControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_1EE12FB70);
  }
  return result;
}

unint64_t sub_18EAD2290()
{
  unint64_t result;

  result = qword_1EE12FB78;
  if (!qword_1EE12FB78)
  {
    result = MEMORY[0x193FF6024](&unk_18EAE9F5C, &type metadata for UIDocumentSharingControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_1EE12FB78);
  }
  return result;
}

id sub_18EAD22D4(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id result;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26[2];

  v26[1] = *(id *)MEMORY[0x1E0C80C00];
  if ((sub_18EAE6880() & 1) != 0)
  {
    v26[0] = 0;
    v2 = objc_allocWithZone(MEMORY[0x1E0DC3740]);
    v3 = (void *)sub_18EAE6898();
    v4 = objc_msgSend(v2, sel_initWithFileURL_error_, v3, v26);

    if (!v26[0])
    {
      v25 = sub_18EAE68BC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(a1, v25);
      return v4;
    }
    v5 = v26[0];
    sub_18EAE6F88();
    result = (id)SWFrameworkLogHandle();
    if (result)
    {
      v7 = result;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE12FE60);
      v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_18EAE9ED0;
      v9 = sub_18EAE688C();
      v11 = v10;
      v12 = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v8 + 56) = MEMORY[0x1E0DEA968];
      v13 = sub_18EAD2584();
      *(_QWORD *)(v8 + 64) = v13;
      *(_QWORD *)(v8 + 32) = v9;
      *(_QWORD *)(v8 + 40) = v11;
      v14 = objc_msgSend(v5, sel_description);
      v15 = sub_18EAE6ED4();
      v17 = v16;

      *(_QWORD *)(v8 + 96) = v12;
      *(_QWORD *)(v8 + 104) = v13;
      *(_QWORD *)(v8 + 72) = v15;
      *(_QWORD *)(v8 + 80) = v17;
      sub_18EAE69F4();

      swift_bridgeObjectRelease();
      v18 = sub_18EAE68BC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(a1, v18);

      return 0;
    }
  }
  else
  {
    sub_18EAE6F88();
    result = (id)SWFrameworkLogHandle();
    if (result)
    {
      v19 = result;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE12FE60);
      v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_18EAE9780;
      v21 = sub_18EAE688C();
      v23 = v22;
      *(_QWORD *)(v20 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v20 + 64) = sub_18EAD2584();
      *(_QWORD *)(v20 + 32) = v21;
      *(_QWORD *)(v20 + 40) = v23;
      sub_18EAE69F4();

      swift_bridgeObjectRelease();
      v24 = sub_18EAE68BC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(a1, v24);
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_18EAD2584()
{
  unint64_t result;

  result = qword_1EE12FB80;
  if (!qword_1EE12FB80)
  {
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EE12FB80);
  }
  return result;
}

ValueMetadata *type metadata accessor for SWUIBehavior()
{
  return &type metadata for SWUIBehavior;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SWHighlightCenter.collaborationHighlight(forIdentifier:)(SWCollaborationHighlight *__return_ptr retstr, Swift::String forIdentifier)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7[2];

  v7[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = (void *)sub_18EAE6EB0();
  v7[0] = 0;
  v4 = objc_msgSend(v2, sel_collaborationHighlightForIdentifier_error_, v3, v7);

  if (v4)
  {
    v5 = v7[0];
  }
  else
  {
    v6 = v7[0];
    sub_18EAE6874();

    swift_willThrow();
  }
}

uint64_t sub_18EAD269C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _SWCollaborationDetailViewController.setListContent<A>(_:)(a1, a2, a3);
}

uint64_t sub_18EAD26C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _SWCollaborationDetailViewController.setListContent<A>(_:)(a1, a2, a3, a4);
}

uint64_t sub_18EAD26EC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id _SWCollaborationButtonViewImpl.cloudSharingControllerDelegate.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_cloudSharingControllerDelegate);
}

uint64_t _SWCollaborationButtonViewImpl.cloudSharingControllerDelegate.setter(uint64_t a1)
{
  uint64_t v1;

  objc_msgSend(*(id *)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_setCloudSharingControllerDelegate_, a1);
  return swift_unknownObjectRelease();
}

uint64_t (*_SWCollaborationButtonViewImpl.cloudSharingControllerDelegate.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
  a1[1] = v3;
  *a1 = objc_msgSend(v3, sel_cloudSharingControllerDelegate);
  return sub_18EAD2818;
}

uint64_t sub_18EAD2818(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 8), sel_setCloudSharingControllerDelegate_, *(_QWORD *)a1);
  return swift_unknownObjectRelease();
}

uint64_t _SWCollaborationButtonViewImpl.activeParticipantCount.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

id _SWCollaborationButtonViewImpl.activeParticipantCount.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount);
  swift_beginAccess();
  *v3 = a1;
  return sub_18EAD2994(a1);
}

id sub_18EAD2994(uint64_t a1)
{
  char *v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if (a1
    && (v2 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_numberFormatter],
        v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithUnsignedInteger_, a1),
        v4 = objc_msgSend(v2, sel_stringFromNumber_, v3),
        v3,
        v4))
  {
    v5 = sub_18EAE6ED4();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0xE000000000000000;
  }
  sub_18EAD6670(v5, v7);
  swift_bridgeObjectRelease();
  return objc_msgSend(v1, sel_invalidateIntrinsicContentSize);
}

void (*_SWCollaborationButtonViewImpl.activeParticipantCount.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_18EAD2AA8;
}

void sub_18EAD2AA8(_QWORD **a1, char a2)
{
  _QWORD *v3;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_18EAD2994(*(_QWORD *)(v3[3] + v3[4]));
  free(v3);
}

uint64_t _SWCollaborationButtonViewImpl.headerTitle.getter()
{
  return sub_18EAD2BFC(&OBJC_IVAR____SWCollaborationButtonViewImpl_headerTitle);
}

uint64_t _SWCollaborationButtonViewImpl.headerTitle.setter(uint64_t a1, uint64_t a2)
{
  return sub_18EAD2CCC(a1, a2, &OBJC_IVAR____SWCollaborationButtonViewImpl_headerTitle, MEMORY[0x1E0DA8788]);
}

void (*_SWCollaborationButtonViewImpl.headerTitle.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____SWCollaborationButtonViewImpl_headerTitle;
  v3[4] = v1;
  v3[5] = v4;
  swift_beginAccess();
  return sub_18EAD2B74;
}

void sub_18EAD2B74(_QWORD **a1, char a2)
{
  sub_18EAD2E38(a1, a2, MEMORY[0x1E0DA8788]);
}

id sub_18EAD2B8C()
{
  void *v0;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v0 = (void *)sub_18EAE6EB0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t _SWCollaborationButtonViewImpl.headerSubtitle.getter()
{
  return sub_18EAD2BFC(&OBJC_IVAR____SWCollaborationButtonViewImpl_headerSubtitle);
}

uint64_t sub_18EAD2BFC(_QWORD *a1)
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

void sub_18EAD2C58(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = sub_18EAE6ED4();
  v8 = v7;
  v9 = a1;
  a4(v6, v8);

}

uint64_t _SWCollaborationButtonViewImpl.headerSubtitle.setter(uint64_t a1, uint64_t a2)
{
  return sub_18EAD2CCC(a1, a2, &OBJC_IVAR____SWCollaborationButtonViewImpl_headerSubtitle, MEMORY[0x1E0DA8798]);
}

uint64_t sub_18EAD2CCC(uint64_t a1, uint64_t a2, _QWORD *a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_BYTE *, _QWORD);
  _BYTE v14[32];

  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  *v8 = a1;
  v8[1] = a2;
  swift_bridgeObjectRelease();
  v9 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v4
                                                             + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_viewModel));
  v10 = *v8;
  v11 = v8[1];
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v12 = (void (*)(_BYTE *, _QWORD))sub_18EAE6A54();
  a4(v10, v11);
  v12(v14, 0);

  swift_release();
  return swift_release();
}

void (*_SWCollaborationButtonViewImpl.headerSubtitle.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____SWCollaborationButtonViewImpl_headerSubtitle;
  v3[4] = v1;
  v3[5] = v4;
  swift_beginAccess();
  return sub_18EAD2E2C;
}

void sub_18EAD2E2C(_QWORD **a1, char a2)
{
  sub_18EAD2E38(a1, a2, MEMORY[0x1E0DA8798]);
}

void sub_18EAD2E38(_QWORD **a1, char a2, void (*a3)(uint64_t, uint64_t))
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD *, _QWORD);

  v5 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v6 = v5[4];
    v7 = (uint64_t *)(v6 + v5[5]);
    v8 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v6
                                                               + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_viewModel));
    v9 = *v7;
    v10 = v7[1];
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    v11 = (void (*)(_QWORD *, _QWORD))sub_18EAE6A54();
    a3(v9, v10);
    v11(v5, 0);
    swift_release();
    swift_release();

  }
  free(v5);
}

void *_SWCollaborationButtonViewImpl.headerImage.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void _SWCollaborationButtonViewImpl.headerImage.setter(void *a1)
{
  sub_18EAD6EE4(a1);

}

void (*_SWCollaborationButtonViewImpl.headerImage.modify(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage;
  v3[4] = v1;
  v3[5] = v4;
  swift_beginAccess();
  return sub_18EAD3080;
}

void sub_18EAD3080(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void (*v9)(_QWORD *, _QWORD);

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v5 = v3[4];
    v4 = v3[5];
    v6 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v5
                                                               + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_viewModel));
    v7 = *(void **)(v5 + v4);
    swift_getKeyPath();
    swift_getKeyPath();
    v8 = v7;
    v9 = (void (*)(_QWORD *, _QWORD))sub_18EAE6A54();
    sub_18EAE68EC();
    v9(v3, 0);
    swift_release();
    swift_release();

  }
  free(v3);
}

uint64_t sub_18EAD3154(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t _SWCollaborationButtonViewImpl.outerButton.getter()
{
  return sub_18EAD3320(&OBJC_IVAR____SWCollaborationButtonViewImpl_outerButton);
}

void _SWCollaborationButtonViewImpl.outerButton.setter(void *a1)
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

}

void (*_SWCollaborationButtonViewImpl.outerButton.modify(_QWORD *a1))(id **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____SWCollaborationButtonViewImpl_outerButton;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x193FF6168](v5);
  return sub_18EAD325C;
}

void sub_18EAD325C(id **a1, char a2)
{
  id *v3;
  id v4;

  v3 = *a1;
  v4 = (*a1)[3];
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {

    swift_endAccess();
  }
  else
  {
    swift_endAccess();

  }
  free(v3);
}

id sub_18EAD32D0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = a1 + *a3;
  swift_beginAccess();
  return (id)MEMORY[0x193FF6168](v3);
}

uint64_t _SWCollaborationButtonViewImpl.delegate.getter()
{
  return sub_18EAD3320(&OBJC_IVAR____SWCollaborationButtonViewImpl_delegate);
}

uint64_t sub_18EAD3320(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *a1;
  swift_beginAccess();
  return MEMORY[0x193FF6168](v2);
}

uint64_t sub_18EAD3370()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t _SWCollaborationButtonViewImpl.delegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*_SWCollaborationButtonViewImpl.delegate.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____SWCollaborationButtonViewImpl_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x193FF6168](v5);
  return sub_18EAC79AC;
}

char *sub_18EAD3484(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  id v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  char *v17;
  char *v18;
  id v19;
  void *v20;
  id v21;
  char *v22;
  void *v23;
  char *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  char *result;
  char *v36;
  double v37;
  double v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char *v48;
  char isEscapingClosureAtFileLocation;
  _QWORD v50[6];
  objc_super v51;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____SWCollaborationButtonViewImpl_sharedWithYouCenter;
  v5 = objc_allocWithZone((Class)SWHighlightCenter);
  v6 = v1;
  *(_QWORD *)&v1[v4] = objc_msgSend(v5, sel_init);
  *(_QWORD *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage] = 0;
  v6[OBJC_IVAR____SWCollaborationButtonViewImpl__isContentShared] = 1;
  *(_QWORD *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_highlightSubscriptionCancellable] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v7 = OBJC_IVAR____SWCollaborationButtonViewImpl_containerView;
  *(_QWORD *)&v6[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  v8 = OBJC_IVAR____SWCollaborationButtonViewImpl_label;
  *(_QWORD *)&v6[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v9 = OBJC_IVAR____SWCollaborationButtonViewImpl_isRTL;
  v10 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v11 = objc_msgSend(v10, sel_userInterfaceLayoutDirection);

  v6[v9] = v11 == (id)1;
  v12 = OBJC_IVAR____SWCollaborationButtonViewImpl_numberFormatter;
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37F0]), sel_init);
  objc_msgSend(v13, sel_setNumberStyle_, 0);
  *(_QWORD *)&v6[v12] = v13;
  *(_QWORD *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController] = a1;
  v14 = (void *)objc_opt_self();
  v15 = a1;
  v16 = objc_msgSend(v14, sel_buttonWithType_, 1);
  *(_QWORD *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_button] = v16;
  v17 = &v6[OBJC_IVAR____SWCollaborationButtonViewImpl_headerTitle];
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = 0xE000000000000000;
  v18 = &v6[OBJC_IVAR____SWCollaborationButtonViewImpl_headerSubtitle];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0xE000000000000000;
  v19 = objc_allocWithZone((Class)sub_18EAE6988());
  v20 = (void *)sub_18EAE6964();
  sub_18EAE6958();
  *(_QWORD *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionView] = v20;
  v21 = v20;

  v51.receiver = v6;
  v51.super_class = ObjectType;
  v22 = (char *)objc_msgSendSuper2(&v51, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v23 = *(void **)&v22[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionView];
  v24 = v22;
  v25 = v23;
  v26 = objc_msgSend(v24, sel_tintColor);
  objc_msgSend(v25, sel_setTintColor_, v26);

  v27 = *(void **)&v24[OBJC_IVAR____SWCollaborationButtonViewImpl_button];
  objc_msgSend(v27, sel_addTarget_action_forControlEvents_, v24, sel_buttonTapped_, 64);
  v28 = v27;
  v29 = objc_msgSend(v24, sel_tintColor);
  objc_msgSend(v28, sel_setTintColor_, v29);

  v30 = OBJC_IVAR____SWCollaborationButtonViewImpl_label;
  v31 = *(id *)&v24[OBJC_IVAR____SWCollaborationButtonViewImpl_label];
  v32 = objc_msgSend(v24, sel_tintColor);
  objc_msgSend(v31, sel_setTextColor_, v32);

  v33 = *(id *)&v24[v30];
  v34 = objc_msgSend(v24, sel_traitCollection);
  result = (char *)objc_msgSend(v33, sel_font);
  if (result)
  {
    v36 = result;
    objc_msgSend(result, sel_pointSize);
    v38 = v37;

    v39 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v40 = objc_msgSend(v39, sel_userInterfaceIdiom);

    v41 = (void *)objc_opt_self();
    if (v40 == (id)6)
      v42 = objc_msgSend(v41, sel_preferredFontForTextStyle_compatibleWithTraitCollection_, *MEMORY[0x1E0DC4B10], v34);
    else
      v42 = objc_msgSend(v41, sel_systemFontOfSize_weight_, v38, *MEMORY[0x1E0DC1438]);
    v43 = v42;

    objc_msgSend(v33, sel_setFont_, v43);
    v44 = (void *)objc_opt_self();
    v45 = swift_allocObject();
    *(_QWORD *)(v45 + 16) = v24;
    v46 = swift_allocObject();
    *(_QWORD *)(v46 + 16) = sub_18EAD7C14;
    *(_QWORD *)(v46 + 24) = v45;
    v50[4] = sub_18EAD7C70;
    v50[5] = v46;
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 1107296256;
    v50[2] = sub_18EAD3154;
    v50[3] = &block_descriptor_97;
    v47 = _Block_copy(v50);
    v48 = v24;
    swift_retain();
    swift_release();
    objc_msgSend(v44, sel_performWithoutAnimation_, v47);

    _Block_release(v47);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = (char *)swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
      return v48;
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_18EAD3A68()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  double v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  void *v104;
  uint64_t v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE12FCD0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v105 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(*(id *)&v0[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8B8);
  sub_18EAE6A3C();
  swift_endAccess();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_18EAC578C(&qword_1EE12FCE0, (uint64_t *)&unk_1EE12FCD0, MEMORY[0x1E0C96190]);
  v8 = sub_18EAE6A84();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  *(_QWORD *)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_highlightSubscriptionCancellable] = v8;
  swift_release();
  v9 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_containerView];
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, v9);
  v10 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionView];
  objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v9, sel_addSubview_, v10);
  v11 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_label];
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v9, sel_addSubview_, v11);
  v12 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_button];
  objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v108 = v12;
  objc_msgSend(v1, sel_addSubview_, v12);
  v13 = objc_msgSend(v10, sel_centerXAnchor);
  v14 = objc_msgSend(v9, sel_centerXAnchor);
  v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v14);

  v16 = OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel;
  v17 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel];
  *(_QWORD *)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel] = v15;

  v18 = objc_msgSend(v11, sel_centerXAnchor);
  v19 = objc_msgSend(v9, sel_centerXAnchor);
  v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

  v21 = OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden;
  v22 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden];
  *(_QWORD *)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden] = v20;

  v109 = v11;
  v23 = objc_msgSend(v11, sel_leadingAnchor);
  v111 = v10;
  v24 = objc_msgSend(v10, sel_trailingAnchor);
  v25 = (void *)objc_opt_self();
  v26 = objc_msgSend(v25, sel_currentDevice);
  objc_msgSend(v26, sel_userInterfaceIdiom);

  v27 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v24, 2.0);
  v28 = OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel;
  v29 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel];
  *(_QWORD *)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel] = v27;

  v30 = *(void **)&v1[v28];
  if (v30)
    objc_msgSend(v30, sel_setActive_, 0);
  v31 = *(void **)&v1[v16];
  if (v31)
    objc_msgSend(v31, sel_setActive_, 1);
  v32 = *(void **)&v1[v21];
  if (v32)
    objc_msgSend(v32, sel_setActive_, 1);
  v33 = objc_msgSend(v25, sel_currentDevice);
  v34 = objc_msgSend(v33, sel_userInterfaceIdiom);

  if (v34 == (id)6)
    v35 = 0.0;
  else
    v35 = 4.0;
  v36 = objc_msgSend(v9, sel_leadingAnchor);
  v37 = objc_msgSend(v1, sel_leadingAnchor);
  v38 = objc_msgSend(v36, sel_constraintEqualToAnchor_constant_, v37, v35);

  v39 = OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint;
  v40 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint] = v38;

  v41 = objc_msgSend(v9, sel_trailingAnchor);
  v42 = objc_msgSend(v1, sel_trailingAnchor);
  v43 = objc_msgSend(v41, sel_constraintEqualToAnchor_constant_, v42, -v35);

  v44 = OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint;
  v45 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint] = v43;

  v46 = *(void **)&v1[v39];
  if (v46)
  {
    v47 = *(void **)&v1[v44];
    if (v47)
    {
      v48 = (void *)objc_opt_self();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FCE8);
      v49 = swift_allocObject();
      *(_OWORD *)(v49 + 16) = xmmword_18EAE9FF0;
      *(_QWORD *)(v49 + 32) = v46;
      *(_QWORD *)(v49 + 40) = v47;
      v112 = v49;
      sub_18EAE6F40();
      sub_18EAC570C(0, (unint64_t *)&qword_1EE12FCF0);
      v50 = v46;
      v51 = v47;
      v52 = v50;
      v53 = v51;
      v54 = (void *)sub_18EAE6F28();
      swift_bridgeObjectRelease();
      objc_msgSend(v48, sel_activateConstraints_, v54);

    }
  }
  v55 = v111;
  v56 = objc_msgSend(v111, sel_leadingAnchor);
  v57 = objc_msgSend(v9, sel_leadingAnchor);
  v58 = objc_msgSend(v56, sel_constraintGreaterThanOrEqualToAnchor_, v57);

  v106 = v58;
  v59 = objc_msgSend(v55, sel_topAnchor);
  v60 = objc_msgSend(v9, (SEL)&selRef_setTranslatesAutoresizingMaskIntoConstraints_ + 4);
  v61 = objc_msgSend(v59, (SEL)&selRef_getShareURLForFileURL_, v60);

  v107 = (id)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FCE8);
  v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_18EAEA000;
  v110 = v61;
  v63 = objc_msgSend(v9, (SEL)&selRef_setTranslatesAutoresizingMaskIntoConstraints_ + 4);
  v64 = objc_msgSend(v1, (SEL)&selRef_setTranslatesAutoresizingMaskIntoConstraints_ + 4);
  v65 = objc_msgSend(v63, sel_constraintEqualToAnchor_, v64);

  *(_QWORD *)(v62 + 32) = v65;
  v66 = objc_msgSend(v9, sel_bottomAnchor);
  v67 = objc_msgSend(v1, sel_bottomAnchor);
  v68 = objc_msgSend(v66, sel_constraintEqualToAnchor_, v67);

  *(_QWORD *)(v62 + 40) = v68;
  v69 = v108;
  v70 = objc_msgSend(v108, sel_leadingAnchor);
  v71 = objc_msgSend(v1, sel_leadingAnchor);
  v72 = objc_msgSend(v70, sel_constraintEqualToAnchor_, v71);

  *(_QWORD *)(v62 + 48) = v72;
  v73 = objc_msgSend(v69, sel_trailingAnchor);
  v74 = objc_msgSend(v1, (SEL)&selRef_setIsContentShared_);
  v75 = objc_msgSend(v73, sel_constraintEqualToAnchor_, v74);

  *(_QWORD *)(v62 + 56) = v75;
  v76 = objc_msgSend(v69, sel_topAnchor);
  v77 = objc_msgSend(v1, sel_topAnchor);
  v78 = objc_msgSend(v76, sel_constraintEqualToAnchor_, v77);

  *(_QWORD *)(v62 + 64) = v78;
  v79 = objc_msgSend(v69, sel_bottomAnchor);
  v80 = objc_msgSend(v1, sel_bottomAnchor);
  v81 = objc_msgSend(v79, sel_constraintEqualToAnchor_, v80);

  v82 = v110;
  v83 = v111;
  *(_QWORD *)(v62 + 72) = v81;
  *(_QWORD *)(v62 + 80) = v82;
  v84 = objc_msgSend(v83, sel_bottomAnchor);
  v85 = objc_msgSend(v9, sel_bottomAnchor);
  v86 = objc_msgSend(v84, sel_constraintLessThanOrEqualToAnchor_, v85);

  *(_QWORD *)(v62 + 88) = v86;
  v87 = objc_msgSend(v83, sel_centerYAnchor);
  v88 = objc_msgSend(v9, sel_centerYAnchor);
  v89 = objc_msgSend(v87, sel_constraintEqualToAnchor_, v88);

  v90 = v106;
  *(_QWORD *)(v62 + 96) = v89;
  *(_QWORD *)(v62 + 104) = v90;
  v91 = v109;
  v92 = objc_msgSend(v109, sel_topAnchor);
  v93 = objc_msgSend(v9, sel_topAnchor);
  v94 = objc_msgSend(v92, sel_constraintGreaterThanOrEqualToAnchor_, v93);

  *(_QWORD *)(v62 + 112) = v94;
  v95 = objc_msgSend(v91, sel_bottomAnchor);
  v96 = objc_msgSend(v9, sel_bottomAnchor);
  v97 = objc_msgSend(v95, sel_constraintLessThanOrEqualToAnchor_, v96);

  *(_QWORD *)(v62 + 120) = v97;
  v98 = objc_msgSend(v91, sel_centerYAnchor);
  v99 = objc_msgSend(v9, sel_centerYAnchor);
  v100 = objc_msgSend(v98, sel_constraintEqualToAnchor_, v99);

  *(_QWORD *)(v62 + 128) = v100;
  v101 = objc_msgSend(v91, sel_trailingAnchor);
  v102 = objc_msgSend(v9, sel_trailingAnchor);
  v103 = objc_msgSend(v101, sel_constraintEqualToAnchor_, v102);

  *(_QWORD *)(v62 + 136) = v103;
  v112 = v62;
  sub_18EAE6F40();
  sub_18EAC570C(0, (unint64_t *)&qword_1EE12FCF0);
  v104 = (void *)sub_18EAE6F28();
  swift_bridgeObjectRelease();
  objc_msgSend(v107, sel_activateConstraints_, v104);

  objc_msgSend(v111, sel_setRemoteRenderingEnabled_, 1);
}

Swift::Void __swiftcall _SWCollaborationButtonViewImpl.layoutSubviews()()
{
  sub_18EAD555C((SEL *)&selRef_layoutSubviews);
}

uint64_t sub_18EAD4684(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v3;
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = v1;
  swift_getObjectType();
  v3 = OBJC_IVAR____SWCollaborationButtonViewImpl_sharedWithYouCenter;
  v21 = OBJC_IVAR____SWCollaborationButtonViewImpl_sharedWithYouCenter;
  v4 = objc_allocWithZone((Class)SWHighlightCenter);
  v5 = v1;
  *(_QWORD *)&v2[v3] = objc_msgSend(v4, sel_init);
  *(_QWORD *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount] = 0;
  v18 = OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage;
  *(_QWORD *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage] = 0;
  v5[OBJC_IVAR____SWCollaborationButtonViewImpl__isContentShared] = 1;
  *(_QWORD *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_highlightSubscriptionCancellable] = 0;
  swift_unknownObjectWeakInit();
  v6 = OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel;
  *(_QWORD *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel] = 0;
  v7 = OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel;
  *(_QWORD *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel] = 0;
  v17 = OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden;
  *(_QWORD *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden] = 0;
  v20 = OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint;
  *(_QWORD *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint] = 0;
  v22 = OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint;
  *(_QWORD *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint] = 0;
  swift_unknownObjectWeakInit();
  v19 = (uint64_t)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_delegate];
  swift_unknownObjectWeakInit();
  v8 = OBJC_IVAR____SWCollaborationButtonViewImpl_containerView;
  *(_QWORD *)&v5[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), (SEL)&selRef_setSourceView_);
  v9 = OBJC_IVAR____SWCollaborationButtonViewImpl_label;
  *(_QWORD *)&v5[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), (SEL)&selRef_setSourceView_);
  v10 = OBJC_IVAR____SWCollaborationButtonViewImpl_isRTL;
  v11 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v12 = objc_msgSend(v11, sel_userInterfaceLayoutDirection);

  v5[v10] = v12 == (id)1;
  v13 = OBJC_IVAR____SWCollaborationButtonViewImpl_numberFormatter;
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37F0]), sel_init);
  objc_msgSend(v14, sel_setNumberStyle_, 0);

  *(_QWORD *)&v5[v13] = v14;
  swift_release();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
  sub_18EACEE38(v19);

  v15 = *(void **)&v5[v13];
  swift_deallocPartialClassInstance();
  return 0;
}

Swift::Void __swiftcall _SWCollaborationButtonViewImpl.tintColorDidChange()()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v1 = *(void **)&v0[OBJC_IVAR____SWCollaborationButtonViewImpl_button];
  v2 = objc_msgSend(v0, sel_tintColor);
  objc_msgSend(v1, sel_setTintColor_, v2);

  v3 = *(void **)&v0[OBJC_IVAR____SWCollaborationButtonViewImpl_label];
  v4 = objc_msgSend(v0, sel_tintColor);
  objc_msgSend(v3, sel_setTextColor_, v4);

  v5 = *(void **)&v0[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionView];
  v6 = objc_msgSend(v0, sel_tintColor);
  objc_msgSend(v5, sel_setTintColor_, v6);

}

uint64_t sub_18EAD4A88()
{
  char *v0;
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
  void *v12;
  char *v13;
  id v14;
  void *v15;
  uint64_t v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  id v21;
  NSObject *v22;
  uint64_t v24;
  char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  id v29;
  _QWORD *v30;
  NSObject *v31;
  uint8_t *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint8_t *v38;
  _QWORD *v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  void *aBlock;
  uint64_t v45;
  uint64_t (*v46)(uint64_t);
  void *v47;
  uint64_t (*v48)();
  uint64_t v49;

  v1 = sub_18EAE6E74();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v3);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_18EAE6EA4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v0;
  v12 = *(void **)&v0[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController];
  v13 = v0;
  if (objc_msgSend(v12, sel_isBeingDismissed))
  {
    v14 = objc_msgSend(v12, sel_transitionCoordinator);
    if (v14)
    {
      v15 = v14;
      if (qword_1EE12F5C8 != -1)
        swift_once();
      v16 = sub_18EAE6A18();
      __swift_project_value_buffer(v16, (uint64_t)qword_1EE131150);
      v17 = v13;
      v18 = sub_18EAE6A00();
      v19 = sub_18EAE6F7C();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        v43 = swift_slowAlloc();
        aBlock = v12;
        *(_DWORD *)v20 = 138412290;
        v21 = v12;
        sub_18EAE703C();
        v22 = v43;
        v43->isa = (Class)v12;

        _os_log_impl(&dword_18EAB1000, v18, v19, "detailViewController (%@) was being dismissed when the button was tapped. Using its transition coordinator to present once the dismissal completes.", v20, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F9F8);
        swift_arrayDestroy();
        MEMORY[0x193FF60CC](v22, -1, -1);
        MEMORY[0x193FF60CC](v20, -1, -1);

      }
      else
      {

      }
      v33 = swift_allocObject();
      *(_QWORD *)(v33 + 16) = sub_18EAD7B10;
      *(_QWORD *)(v33 + 24) = v11;
      v48 = sub_18EAD767C;
      v49 = v33;
      aBlock = (void *)MEMORY[0x1E0C809B0];
      v45 = 1107296256;
      v46 = sub_18EAD5188;
      v47 = &block_descriptor_69;
      v34 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v15, sel_animateAlongsideTransition_completion_, 0, v34);
      swift_release();
      _Block_release(v34);
      return swift_unknownObjectRelease();
    }
    else
    {
      v41 = v6;
      v42 = v2;
      if (qword_1EE12F5C8 != -1)
        swift_once();
      v24 = sub_18EAE6A18();
      __swift_project_value_buffer(v24, (uint64_t)qword_1EE131150);
      v25 = v13;
      v26 = sub_18EAE6A00();
      v27 = sub_18EAE6F7C();
      v43 = v26;
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        v39 = (_QWORD *)swift_slowAlloc();
        v40 = v28;
        *(_DWORD *)v28 = 138412290;
        v38 = v28 + 4;
        aBlock = v12;
        v29 = v12;
        sub_18EAE703C();
        v30 = v39;
        *v39 = v12;

        v31 = v43;
        v32 = v40;
        _os_log_impl(&dword_18EAB1000, v43, v27, "Detail view controller (%@) was being dismissed when the button was tapped. There is no transition coordinator, so we'll dispatch async to wait for dismissal to complete.", v40, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F9F8);
        swift_arrayDestroy();
        MEMORY[0x193FF60CC](v30, -1, -1);
        MEMORY[0x193FF60CC](v32, -1, -1);

      }
      else
      {

      }
      sub_18EAC570C(0, (unint64_t *)&unk_1EE12FE30);
      v35 = (void *)sub_18EAE6FD0();
      v36 = swift_allocObject();
      *(_QWORD *)(v36 + 16) = sub_18EAD7B10;
      *(_QWORD *)(v36 + 24) = v11;
      v48 = sub_18EAD767C;
      v49 = v36;
      aBlock = (void *)MEMORY[0x1E0C809B0];
      v45 = 1107296256;
      v46 = sub_18EAD26EC;
      v47 = &block_descriptor_63;
      v37 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      sub_18EAE6E8C();
      aBlock = (void *)MEMORY[0x1E0DEE9D8];
      sub_18EAD7B3C();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FE40);
      sub_18EAC578C(&qword_1EE12FA50, &qword_1EE12FE40, MEMORY[0x1E0DEAF38]);
      sub_18EAE7060();
      MEMORY[0x193FF5820](0, v10, v5, v37);
      _Block_release(v37);
      swift_release();

      (*(void (**)(char *, uint64_t))(v42 + 8))(v5, v1);
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v41);
    }
  }
  else
  {
    sub_18EAD5090(v13);
    return swift_release();
  }
}

void sub_18EAD5090(char *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v2 = objc_msgSend(a1, sel_window);
  if (v2)
  {
    v8 = v2;
    v3 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController];
    objc_msgSend(v3, sel_setModalPresentationStyle_, 7);
    v4 = objc_msgSend(v3, sel_popoverPresentationController);
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, sel_setDelegate_, a1);

    }
    v6 = objc_msgSend(v3, sel_popoverPresentationController);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, sel_setSourceView_, *(_QWORD *)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionView]);

    }
    sub_18EAD6FF0(v3, (uint64_t)v8);

  }
}

uint64_t sub_18EAD5188(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t _SWCollaborationButtonViewImpl.updatePlaceholderSymbol(scale:weight:pointSize:)()
{
  return sub_18EAE694C();
}

void _SWCollaborationButtonViewImpl.dismissPopover(animated:completion:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v5;
  void *v6;
  _QWORD v7[6];

  v5 = *(void **)(v3 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
  if (a2)
  {
    v7[4] = a2;
    v7[5] = a3;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 1107296256;
    v7[2] = sub_18EAD26EC;
    v7[3] = &block_descriptor_2;
    v6 = _Block_copy(v7);
    swift_retain();
    swift_release();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v5, sel_dismissViewControllerAnimated_completion_, a1 & 1, v6);
  _Block_release(v6);
}

id _SWCollaborationButtonViewImpl.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void _SWCollaborationButtonViewImpl.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _SWCollaborationButtonViewImpl.__deallocating_deinit()
{
  return sub_18EAD555C((SEL *)&selRef_dealloc);
}

id sub_18EAD555C(SEL *a1)
{
  void *v1;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v4, *a1);
}

UIModalPresentationStyle __swiftcall _SWCollaborationButtonViewImpl.adaptivePresentationStyle(for:traitCollection:)(UIPresentationController a1, UITraitCollection traitCollection)
{
  return -1;
}

Swift::Void __swiftcall _SWCollaborationButtonViewImpl.prepareForPopoverPresentation(_:)(UIPopoverPresentationController a1)
{
  sub_18EAD7560((SEL *)&selRef_collaborationViewWillPresentPopover_);
}

Swift::Void __swiftcall _SWCollaborationButtonViewImpl.presentationControllerDidDismiss(_:)(UIPresentationController a1)
{
  sub_18EAD7560((SEL *)&selRef_collaborationViewDidDismissPopover_);
}

void SWCollaborationView.setDetailViewListContent<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v7;

  v7 = objc_msgSend(v3, sel_buttonView);
  _SWCollaborationDetailViewController.setListContent<A>(_:)(a1, a2, a3);

}

void SWCollaborationView.setDetailViewListContent<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v9;

  v9 = objc_msgSend(v4, sel_buttonView);
  _SWCollaborationDetailViewController.setListContent<A>(_:)(a1, a2, a3, a4);

}

_SWCollaborationButtonViewImpl *__cdecl sub_18EAD58D8(SWCollaborationView *self, SEL a2)
{
  UIView *v2;

  v2 = -[SWCollaborationView typeErasedButtonView](self, sel_typeErasedButtonView);
  type metadata accessor for _SWCollaborationButtonViewImpl();
  return (_SWCollaborationButtonViewImpl *)(id)swift_dynamicCastClassUnconditional();
}

uint64_t SWCollaborationView.buttonView.getter()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(v0, sel_typeErasedButtonView);
  type metadata accessor for _SWCollaborationButtonViewImpl();
  return swift_dynamicCastClassUnconditional();
}

id _SWCollaborationButtonViewImpl.itemProvider.getter()
{
  uint64_t v0;

  return objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                               + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_itemProvider));
}

void _SWCollaborationButtonViewImpl.itemProvider.setter(void *a1)
{
  uint64_t v1;

  objc_msgSend(*(id *)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_setItemProvider_, a1);

}

void (*_SWCollaborationButtonViewImpl.itemProvider.modify(_QWORD *a1))(id *a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
  a1[1] = v3;
  *a1 = objc_msgSend(v3, sel_itemProvider);
  return sub_18EAD5A70;
}

void sub_18EAD5A70(id *a1)
{
  id v1;

  v1 = *a1;
  objc_msgSend(a1[1], sel_setItemProvider_);

}

uint64_t _SWCollaborationButtonViewImpl.isContentShared.getter()
{
  uint64_t v0;
  uint64_t result;

  if ((*(_BYTE *)(v0 + OBJC_IVAR____SWCollaborationButtonViewImpl__isContentShared) & 1) == 0)
  {
    result = (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_collaborationHighlight);
    if (!result)
      return result;

  }
  return 1;
}

void _SWCollaborationButtonViewImpl.isContentShared.setter(char a1)
{
  _BYTE *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BYTE *v8;
  char isEscapingClosureAtFileLocation;
  _QWORD v10[6];

  v3 = objc_msgSend(*(id *)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_collaborationHighlight);

  if (!v3)
  {
    v1[OBJC_IVAR____SWCollaborationButtonViewImpl__isContentShared] = a1 & 1;
    v4 = (void *)objc_opt_self();
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v1;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_18EAD7668;
    *(_QWORD *)(v6 + 24) = v5;
    v10[4] = sub_18EAD767C;
    v10[5] = v6;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 1107296256;
    v10[2] = sub_18EAD3154;
    v10[3] = &block_descriptor_8;
    v7 = _Block_copy(v10);
    v8 = v1;
    swift_retain();
    swift_release();
    objc_msgSend(v4, sel_performWithoutAnimation_, v7);
    _Block_release(v7);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
}

void sub_18EAD5D14(_QWORD *a1@<X0>, char *a2@<X8>)
{
  id v3;
  char v4;

  if ((*(_BYTE *)(*a1 + OBJC_IVAR____SWCollaborationButtonViewImpl__isContentShared) & 1) == 0)
  {
    v3 = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_collaborationHighlight);
    if (!v3)
    {
      v4 = 0;
      goto LABEL_6;
    }

  }
  v4 = 1;
LABEL_6:
  *a2 = v4;
}

void (*_SWCollaborationButtonViewImpl.isContentShared.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  char *v3;
  char *v4;
  uint64_t v5;
  id v6;
  char v7;

  v3 = (char *)malloc(0x48uLL);
  *a1 = v3;
  v4 = v3 + 64;
  v5 = OBJC_IVAR____SWCollaborationButtonViewImpl__isContentShared;
  *((_QWORD *)v3 + 6) = v1;
  *((_QWORD *)v3 + 7) = v5;
  if ((*(_BYTE *)(v1 + v5) & 1) == 0)
  {
    v6 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_collaborationHighlight);
    if (!v6)
    {
      v7 = 0;
      goto LABEL_6;
    }

  }
  v7 = 1;
LABEL_6:
  *v4 = v7;
  return sub_18EAD5E00;
}

void sub_18EAD5E00(uint64_t a1, char a2)
{
  _QWORD *v3;
  char isEscapingClosureAtFileLocation;
  _QWORD *v5;
  _BYTE *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BYTE *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BYTE *v16;

  v3 = *(_QWORD **)a1;
  isEscapingClosureAtFileLocation = *(_BYTE *)(*(_QWORD *)a1 + 64);
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a1 + 48) + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_collaborationHighlight);

  if ((a2 & 1) != 0)
  {
    if (v5)
      goto LABEL_7;
    v6 = (_BYTE *)v3[6];
    v6[v3[7]] = isEscapingClosureAtFileLocation;
    v7 = (void *)objc_opt_self();
    v5 = (_QWORD *)swift_allocObject();
    v5[2] = v6;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = sub_18EAD7668;
    *(_QWORD *)(v8 + 24) = v5;
    v3[4] = sub_18EAD7C70;
    v3[5] = v8;
    *v3 = MEMORY[0x1E0C809B0];
    v3[1] = 1107296256;
    v3[2] = sub_18EAD3154;
    v3[3] = &block_descriptor_19;
    v9 = _Block_copy(v3);
    v10 = v6;
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_performWithoutAnimation_, v9);
    _Block_release(v9);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
      goto LABEL_7;
    __break(1u);
  }
  if (v5)
    goto LABEL_7;
  v11 = (_BYTE *)v3[6];
  v11[v3[7]] = isEscapingClosureAtFileLocation;
  v12 = objc_opt_self();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v11;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = sub_18EAD7668;
  *(_QWORD *)(v14 + 24) = v13;
  v3[4] = sub_18EAD7C70;
  v3[5] = v14;
  *v3 = MEMORY[0x1E0C809B0];
  v3[1] = 1107296256;
  v3[2] = sub_18EAD3154;
  v3[3] = &block_descriptor_30;
  v15 = _Block_copy(v3);
  v16 = v11;
  swift_retain();
  swift_release();
  objc_msgSend((id)v12, sel_performWithoutAnimation_, v15);
  _Block_release(v15);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((v12 & 1) == 0)
  {
LABEL_7:
    free(v3);
    return;
  }
  __break(1u);
}

void sub_18EAD6090(void **a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  char v17;
  id v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v4 = sub_18EAE6A18();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  swift_beginAccess();
  v10 = MEMORY[0x193FF6168](a2 + 16);
  if (v10)
  {
    v11 = v10;
    v44 = OBJC_IVAR____SWCollaborationButtonViewImpl_attributionView;
    v12 = sub_18EAE6970();
    v13 = (void *)v12;
    if (v9)
    {
      v14 = objc_msgSend(v9, sel_slHighlight);
      v15 = v14;
      if (v13)
      {
        if (v14)
        {
          sub_18EAC570C(0, &qword_1EE12FCF8);
          v16 = v13;
          v17 = sub_18EAE7018();

          if ((v17 & 1) != 0)
          {
LABEL_24:
            if (qword_1EE12F5C8 != -1)
              swift_once();
            __swift_project_value_buffer(v4, (uint64_t)qword_1EE131150);
            v29 = sub_18EAE6A00();
            v30 = sub_18EAE6F7C();
            if (!os_log_type_enabled(v29, v30))
            {
              v39 = v29;
              v29 = v11;
              goto LABEL_35;
            }
            v31 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v31 = 0;
            _os_log_impl(&dword_18EAB1000, v29, v30, "Skipping refresh of attribution view because highlights are the same", v31, 2u);
            MEMORY[0x193FF60CC](v31, -1, -1);
LABEL_33:
            v39 = v11;
LABEL_35:

            v11 = v29;
            goto LABEL_36;
          }
        }
      }
      else
      {
        if (!v14)
          goto LABEL_24;

      }
      v18 = objc_msgSend(v9, sel_slHighlight);
      if (v18)
      {

        v19 = 0;
        goto LABEL_14;
      }
    }
    else if (!v12)
    {
      goto LABEL_24;
    }
    v19 = 1;
LABEL_14:
    if (qword_1EE12F5C8 != -1)
      swift_once();
    v20 = __swift_project_value_buffer(v4, (uint64_t)qword_1EE131150);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v20, v4);
    v21 = sub_18EAE6A00();
    v22 = sub_18EAE6F7C();
    if (os_log_type_enabled(v21, v22))
    {
      v42 = v9;
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v43 = v13;
      v25 = v24;
      v41 = v5;
      *(_DWORD *)v23 = 136315138;
      v46 = v24;
      if (v19)
        v26 = 7104878;
      else
        v26 = 0x696E2D6E6F6E2061;
      if (v19)
        v27 = 0xE300000000000000;
      else
        v27 = 0xEF65756C6176206CLL;
      v45 = sub_18EADDB8C(v26, v27, &v46);
      v9 = v42;
      sub_18EAE703C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_18EAB1000, v21, v22, "Updating attribution view highlight to %s", v23, 0xCu);
      swift_arrayDestroy();
      v28 = v25;
      v13 = v43;
      MEMORY[0x193FF60CC](v28, -1, -1);
      MEMORY[0x193FF60CC](v23, -1, -1);

      (*(void (**)(char *, uint64_t))(v41 + 8))(v8, v4);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    v32 = *(Class *)((char *)&v11->isa + v44);
    if (v9)
    {
      v33 = v32;
      v34 = objc_msgSend(v9, sel_slHighlight);
      sub_18EAE697C();

      objc_opt_self();
      v35 = swift_dynamicCastObjCClass();
      if (!v35)
      {
LABEL_36:

        return;
      }
      v36 = v35;
      v37 = *(Class *)((char *)&v11->isa + OBJC_IVAR____SWCollaborationButtonViewImpl_sharedWithYouCenter);
      v38 = v9;
      v29 = v37;
      -[NSObject clearNoticesForHighlight:](v29, sel_clearNoticesForHighlight_, v36);

    }
    else
    {
      v29 = v32;
      sub_18EAE697C();
    }
    goto LABEL_33;
  }
}

id _SWCollaborationButtonViewImpl.__allocating_init(itemProvider:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithItemProvider_, a1);

  return v3;
}

char *_SWCollaborationButtonViewImpl.init(itemProvider:)(void *a1)
{
  objc_class *ObjectType;
  id v3;
  id v4;
  char *v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v3 = objc_msgSend(objc_allocWithZone((Class)_SWCollaborationDetailViewController), sel_initWithItemProvider_impl_, a1);
  v4 = objc_allocWithZone(ObjectType);
  v5 = sub_18EAD3484(v3);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

void sub_18EAD6670(uint64_t a1, unint64_t a2)
{
  char *v2;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  void *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;

  v5 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v5 = a1 & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    v6 = *(void **)&v2[OBJC_IVAR____SWCollaborationButtonViewImpl_label];
    v7 = (void *)sub_18EAE6EB0();
    objc_msgSend(v6, sel_setText_, v7);

    v8 = (void *)objc_opt_self();
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v2;
    v23 = sub_18EAD7B84;
    v24 = (_QWORD *)v9;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 1107296256;
    v21 = sub_18EAD26EC;
    v22 = &block_descriptor_75;
    v10 = _Block_copy(&v19);
    v11 = v2;
    swift_release();
    objc_msgSend(v8, sel__animateUsingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_animations_completion_, 0, v10, 0, 2.0, 0.0, 2.0, 300.0, 50.0, 0.0);
  }
  else
  {
    v12 = (void *)objc_opt_self();
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v2;
    v23 = sub_18EAD7B8C;
    v24 = (_QWORD *)v13;
    v14 = MEMORY[0x1E0C809B0];
    v19 = MEMORY[0x1E0C809B0];
    v20 = 1107296256;
    v21 = sub_18EAD26EC;
    v22 = &block_descriptor_81;
    v10 = _Block_copy(&v19);
    v15 = v2;
    swift_release();
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = v15;
    v16[3] = a1;
    v16[4] = a2;
    v23 = sub_18EAD7BC0;
    v24 = v16;
    v19 = v14;
    v20 = 1107296256;
    v21 = sub_18EAD0664;
    v22 = &block_descriptor_87;
    v17 = _Block_copy(&v19);
    v18 = v15;
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v12, sel__animateUsingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_animations_completion_, 0, v10, v17, 2.0, 0.0, 2.0, 300.0, 50.0, 0.0);
    _Block_release(v17);
  }
  _Block_release(v10);
}

id sub_18EAD68F8(char *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  id result;

  objc_msgSend(*(id *)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_label], sel_setAlpha_, 1.0);
  v2 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel];
  if (v2)
    objc_msgSend(v2, sel_setActive_, 0);
  v3 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel];
  if (v3)
    objc_msgSend(v3, sel_setActive_, 1);
  v4 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden];
  if (v4)
    objc_msgSend(v4, sel_setActive_, 0);
  objc_msgSend(a1, sel_layoutIfNeeded);
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_currentDevice);
  v7 = objc_msgSend(v6, sel_userInterfaceIdiom);

  v8 = objc_msgSend(v5, sel_currentDevice);
  v9 = objc_msgSend(v8, sel_userInterfaceIdiom);

  v10 = 4.0;
  if (v9 == (id)6)
    v11 = 12.0;
  else
    v11 = 4.0;
  v12 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint];
  if (v12)
  {
    if (v7 == (id)6)
      v10 = 0.0;
    objc_msgSend(v12, sel_setConstant_, v10);
  }
  result = *(id *)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint];
  if (result)
    return objc_msgSend(result, sel_setConstant_, -v11);
  return result;
}

id sub_18EAD6A7C(char *a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel];
  if (v2)
    objc_msgSend(v2, sel_setActive_, 1);
  v3 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel];
  if (v3)
    objc_msgSend(v3, sel_setActive_, 0);
  v4 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden];
  if (v4)
    objc_msgSend(v4, sel_setActive_, 1);
  objc_msgSend(*(id *)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_label], sel_setAlpha_, 0.0);
  return objc_msgSend(a1, sel_layoutIfNeeded);
}

Swift::Void __swiftcall _SWCollaborationButtonViewImpl.setManageButtonTitle(manageButtonTitle:)(Swift::String manageButtonTitle)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
  v3 = (id)sub_18EAE6EB0();
  objc_msgSend(v2, sel_setManageButtonTitle_, v3);

}

Swift::Void __swiftcall _SWCollaborationButtonViewImpl.setShowManageButton(showManageButton:)(Swift::Bool showManageButton)
{
  uint64_t v1;

  objc_msgSend(*(id *)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_setShowManageButton_, showManageButton);
}

Swift::Void __swiftcall _SWCollaborationButtonViewImpl.setDetailViewListContent(_:)(UIView *a1)
{
  uint64_t v1;

  objc_msgSend(*(id *)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_setListContentView_, a1);
}

uint64_t sub_18EAD6C54()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  return swift_release();
}

uint64_t sub_18EAD6CC0(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  void *v14;
  id v15;
  uint64_t v17;

  v4 = sub_18EAE6928();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x1E0C80A78](v4, v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7, v10);
  v12 = (char *)&v17 - v11;
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v13((char *)&v17 - v11, a1, v4);
  v14 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v13(v9, (uint64_t)v12, v4);
  v15 = v14;
  sub_18EAE6A6C();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v12, v4);
}

char *sub_18EAD6DC4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  objc_class *v5;
  id v10;
  id v11;

  v5 = v4;
  sub_18EAC570C(0, &qword_1EE12FCC8);
  v10 = sub_18EAE569C(a1, a2, a3, a4);
  v11 = objc_allocWithZone(v5);
  return sub_18EAD3484(v10);
}

char *sub_18EAD6E50(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  objc_class *v6;
  id v12;
  id v13;

  v6 = v5;
  sub_18EAC570C(0, &qword_1EE12FCC8);
  v12 = sub_18EAE57D4(a1, a2, a3, a4, a5);
  v13 = objc_allocWithZone(v6);
  return sub_18EAD3484(v12);
}

uint64_t sub_18EAD6EE4(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void (*v9)(_BYTE *, _QWORD);
  _BYTE v11[32];

  v3 = (void **)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  v6 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_viewModel));
  v7 = *v3;
  swift_getKeyPath();
  swift_getKeyPath();
  v8 = v7;
  v9 = (void (*)(_BYTE *, _QWORD))sub_18EAE6A54();
  sub_18EAE68EC();
  v9(v11, 0);

  swift_release();
  return swift_release();
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

void sub_18EAD6FF0(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  NSObject *v32;
  id v33;
  _QWORD *v34;
  uint8_t *buf;

  v3 = v2;
  v6 = v3 + OBJC_IVAR____SWCollaborationButtonViewImpl_outerButton;
  swift_beginAccess();
  v7 = MEMORY[0x193FF6168](v6);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = v3 + OBJC_IVAR____SWCollaborationButtonViewImpl_delegate;
    swift_beginAccess();
    v10 = (void *)MEMORY[0x193FF6168](v9);
    if (v10)
    {
      v11 = v10;
      if ((objc_msgSend(v10, sel_respondsToSelector_, sel_collaborationViewShouldPresentPopover_) & 1) != 0)
      {
        v12 = objc_msgSend(v11, sel_collaborationViewShouldPresentPopover_, v8);
        swift_unknownObjectRelease();
        if (!v12)
          goto LABEL_24;
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    v13 = objc_msgSend(a1, sel_presentingViewController);

    if (v13)
    {
      if (qword_1EE12F5C8 != -1)
        swift_once();
      v14 = sub_18EAE6A18();
      __swift_project_value_buffer(v14, (uint64_t)qword_1EE131150);
      v15 = a1;
      v16 = sub_18EAE6A00();
      v17 = sub_18EAE6F88();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = swift_slowAlloc();
        v19 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v18 = 138412546;
        v20 = v15;
        sub_18EAE703C();
        *v19 = v15;

        *(_WORD *)(v18 + 12) = 2112;
        v21 = objc_msgSend(v20, sel_presentingViewController);
        sub_18EAE703C();
        v19[1] = v21;

        _os_log_impl(&dword_18EAB1000, v16, v17, "View controller to present (%@) already has a presentingViewController (%@). Bailing on presentation.", (uint8_t *)v18, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F9F8);
        swift_arrayDestroy();
        MEMORY[0x193FF60CC](v19, -1, -1);
        MEMORY[0x193FF60CC](v18, -1, -1);

      }
      else
      {

      }
      goto LABEL_24;
    }
    v22 = objc_msgSend((id)objc_opt_self(), sel__viewControllerForFullScreenPresentationFromView_, a2);
    if (v22)
    {
      sub_18EAC570C(0, &qword_1EE12FCC0);
      v23 = v22;
      if ((sub_18EAE7018() & 1) == 0)
      {
        objc_msgSend(v23, sel_presentViewController_animated_completion_, a1, 1, 0);

        swift_unknownObjectWeakAssign();
        v8 = v23;
LABEL_24:

        return;
      }

      v24 = v23;
      v25 = a1;
      v26 = sub_18EAE7018();

      if ((v26 & 1) != 0)
      {
        if (qword_1EE12F5C8 != -1)
          swift_once();
        v27 = sub_18EAE6A18();
        __swift_project_value_buffer(v27, (uint64_t)qword_1EE131150);
        v28 = v25;
        v29 = sub_18EAE6A00();
        v30 = sub_18EAE6F88();
        if (os_log_type_enabled(v29, v30))
        {
          v31 = (uint8_t *)swift_slowAlloc();
          v34 = (_QWORD *)swift_slowAlloc();
          buf = v31;
          *(_DWORD *)v31 = 138412290;
          v32 = v28;
          sub_18EAE703C();
          *v34 = v28;

          _os_log_impl(&dword_18EAB1000, v29, v30, "_viewControllerForFullScreenPresentation returned the same view controller we are trying to present (%@). Using a fallback presentation view controller instead.", buf, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F9F8);
          swift_arrayDestroy();
          MEMORY[0x193FF60CC](v34, -1, -1);
          MEMORY[0x193FF60CC](buf, -1, -1);
        }
        else
        {

          v29 = v28;
        }

      }
    }
    v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC4150]), sel_init);
    objc_msgSend(v33, sel__presentViewController_sendingView_animated_, a1, 0, 1);

    swift_unknownObjectWeakAssign();
    v8 = v33;
    goto LABEL_24;
  }
}

void sub_18EAD7560(SEL *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_outerButton;
  swift_beginAccess();
  v4 = MEMORY[0x193FF6168](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_delegate;
    swift_beginAccess();
    v7 = (void *)MEMORY[0x193FF6168](v6);
    if (v7)
    {
      v8 = v7;
      if ((objc_msgSend(v7, sel_respondsToSelector_, *a1) & 1) != 0)
        objc_msgSend(v8, *a1, v5);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

uint64_t type metadata accessor for _SWCollaborationButtonViewImpl()
{
  return objc_opt_self();
}

uint64_t sub_18EAD7644()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_18EAD766C()
{
  return swift_deallocObject();
}

uint64_t sub_18EAD767C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_18EAD769C()
{
  return swift_deallocObject();
}

id sub_18EAD76AC()
{
  uint64_t v0;
  uint64_t *v1;

  v1 = (uint64_t *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount);
  swift_beginAccess();
  return sub_18EAD2994(*v1);
}

uint64_t sub_18EAD76F8()
{
  return swift_deallocObject();
}

id sub_18EAD7708@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_31Tm(a1, (SEL *)&selRef_cloudSharingControllerDelegate, a2);
}

id sub_18EAD7714(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_32Tm(a1, a2, a3, a4, (SEL *)&selRef_setCloudSharingControllerDelegate_);
}

uint64_t sub_18EAD7720@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

id sub_18EAD7770(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t *v3;

  v2 = *a1;
  v3 = (uint64_t *)(*a2 + OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount);
  swift_beginAccess();
  *v3 = v2;
  return sub_18EAD2994(v2);
}

uint64_t sub_18EAD77CC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_35Tm(a1, &OBJC_IVAR____SWCollaborationButtonViewImpl_headerTitle, a2);
}

uint64_t sub_18EAD77D8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_36Tm(a1, a2, a3, a4, _SWCollaborationButtonViewImpl.headerTitle.setter);
}

uint64_t sub_18EAD77E4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_35Tm(a1, &OBJC_IVAR____SWCollaborationButtonViewImpl_headerSubtitle, a2);
}

uint64_t keypath_get_35Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(*a1 + *a2);
  swift_beginAccess();
  v5 = v4[1];
  *a3 = *v4;
  a3[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_18EAD7840(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_36Tm(a1, a2, a3, a4, _SWCollaborationButtonViewImpl.headerSubtitle.setter);
}

uint64_t keypath_set_36Tm(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;

  v7 = *a1;
  v6 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v7, v6);
}

id sub_18EAD788C@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

void sub_18EAD78DC(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_18EAD6EE4(v1);

}

uint64_t sub_18EAD7918@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_get_41Tm(a1, &OBJC_IVAR____SWCollaborationButtonViewImpl_outerButton, a2);
}

uint64_t sub_18EAD7924()
{
  return keypath_set_42Tm();
}

uint64_t sub_18EAD7930@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_get_41Tm(a1, &OBJC_IVAR____SWCollaborationButtonViewImpl_delegate, a2);
}

uint64_t keypath_get_41Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = *a1 + *a2;
  swift_beginAccess();
  result = MEMORY[0x193FF6168](v4);
  *a3 = result;
  return result;
}

uint64_t sub_18EAD798C()
{
  return keypath_set_42Tm();
}

uint64_t keypath_set_42Tm()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

id sub_18EAD79E8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_31Tm(a1, (SEL *)&selRef_itemProvider, a2);
}

id keypath_get_31Tm@<X0>(_QWORD *a1@<X0>, SEL *a2@<X3>, _QWORD *a3@<X8>)
{
  id result;

  result = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(*a1
                                                                 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), *a2));
  *a3 = result;
  return result;
}

id sub_18EAD7A34(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_32Tm(a1, a2, a3, a4, (SEL *)&selRef_setItemProvider_);
}

id keypath_set_32Tm(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), *a5, *a1);
}

void sub_18EAD7A60(char *a1)
{
  _SWCollaborationButtonViewImpl.isContentShared.setter(*a1);
}

uint64_t method lookup function for _SWCollaborationButtonViewImpl()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_18EAD7A90(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_18EAD7AA0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_18EAD7AC4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_18EAD7AD0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE12FCB0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_18EAD7B10()
{
  uint64_t v0;

  sub_18EAD5090(*(char **)(v0 + 16));
}

uint64_t sub_18EAD7B18()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_18EAD7B3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE12FA40;
  if (!qword_1EE12FA40)
  {
    v1 = sub_18EAE6E74();
    result = MEMORY[0x193FF6024](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1EE12FA40);
  }
  return result;
}

id sub_18EAD7B84()
{
  uint64_t v0;

  return sub_18EAD68F8(*(char **)(v0 + 16));
}

id sub_18EAD7B8C()
{
  uint64_t v0;

  return sub_18EAD6A7C(*(char **)(v0 + 16));
}

uint64_t sub_18EAD7B94()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_18EAD7BC0()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____SWCollaborationButtonViewImpl_label);
  v2 = (id)sub_18EAE6EB0();
  objc_msgSend(v1, sel_setText_, v2);

}

void sub_18EAD7C14()
{
  sub_18EAD3A68();
}

uint64_t sub_18EAD7C34()
{
  return swift_deallocObject();
}

uint64_t sub_18EAD7C44()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_18EAD7C68(void **a1)
{
  uint64_t v1;

  sub_18EAD6090(a1, v1);
}

void sub_18EAD7CE0(_BYTE *a1)
{
  __int128 *v1;
  __int128 *v2;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  objc_class *v7;
  char v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  char v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  void *v39;
  id v40;
  objc_super v41;
  objc_super v42;
  __int128 v43;

  v2 = v1;
  v43 = *v1;
  v4 = (void *)*((_QWORD *)&v43 + 1);
  v5 = sub_18EADB318(*((void **)&v43 + 1), *((_BYTE *)v1 + 16));
  v6 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock;
  a1[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock] = 0;
  v7 = (objc_class *)type metadata accessor for CommunicationControl();
  v42.receiver = a1;
  v42.super_class = v7;
  v8 = objc_msgSendSuper2(&v42, sel_isEnabled);
  v41.receiver = a1;
  v41.super_class = v7;
  objc_msgSendSuper2(&v41, sel_setEnabled_, v5 & 1);
  sub_18EAD99DC(v8);
  a1[v6] = 1;
  swift_getKeyPath();
  swift_getKeyPath();
  v9 = v4;
  sub_18EAE6A60();
  swift_release();
  swift_release();
  sub_18EADB9C4((uint64_t)&v43);
  if (v40)
  {
    v10 = objc_msgSend(v40, sel_slHighlight);

    v11 = objc_msgSend(v10, sel_attributions);
    sub_18EAC570C(0, &qword_1EE12FDC0);
    v12 = sub_18EAE6F34();

    v13 = v12 >> 62;
    if (!(v12 >> 62))
    {
LABEL_3:
      v14 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  else
  {
    v12 = MEMORY[0x1E0DEE9D8];
    v13 = MEMORY[0x1E0DEE9D8] >> 62;
    if (!(MEMORY[0x1E0DEE9D8] >> 62))
      goto LABEL_3;
  }
  swift_bridgeObjectRetain();
  v14 = sub_18EAE70E4();
  swift_bridgeObjectRelease();
LABEL_4:
  objc_msgSend(a1, sel_setContextMenuInteractionEnabled_, v14 > 1);
  objc_msgSend(a1, sel_setShowsMenuAsPrimaryAction_, v14 > 1);
  if (v14 >= 2)
  {
    sub_18EAC570C(0, &qword_1EE12FDC0);
    sub_18EADBA74();
    sub_18EAE6F64();
    sub_18EAE7114();
    v15 = (id)sub_18EAE6EB0();
    swift_bridgeObjectRelease();
    v16 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_menu;
    v17 = *(void **)&a1[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_menu];
    if (v17)
    {
      v18 = objc_msgSend(v17, sel_identifier);
      v19 = sub_18EAE6ED4();
      v21 = v20;
      if (v19 == sub_18EAE6ED4() && v21 == v22)
      {
        v23 = v15;

LABEL_27:
        swift_bridgeObjectRelease_n();
        goto LABEL_28;
      }
      v28 = sub_18EAE7120();
      v29 = v15;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v28 & 1) != 0)
      {
LABEL_28:
        swift_bridgeObjectRelease();
        goto LABEL_31;
      }
    }
    v30 = sub_18EAD8240(v12, a1, v15);
    swift_bridgeObjectRelease();

    v15 = *(id *)&a1[v16];
    *(_QWORD *)&a1[v16] = v30;
LABEL_31:

    return;
  }
  if (!v13)
  {
    v24 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v24)
      goto LABEL_11;
LABEL_19:
    swift_bridgeObjectRelease();
    v15 = (id)sub_18EAE6EB0();
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  if (!sub_18EAE70E4())
    goto LABEL_19;
LABEL_11:
  if ((v12 & 0xC000000000000001) != 0)
  {
    v25 = (id)MEMORY[0x193FF58EC](0, v12);
    goto LABEL_14;
  }
  if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v25 = *(id *)(v12 + 32);
LABEL_14:
    v26 = v25;
    swift_bridgeObjectRelease();
    v27 = objc_msgSend(v26, sel_uniqueIdentifier);
    if (v27)
    {
      v15 = v27;
    }
    else
    {
      sub_18EAE6ED4();
      v15 = (id)sub_18EAE6EB0();
      swift_bridgeObjectRelease();
    }

LABEL_24:
    if (*(_QWORD *)&a1[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_touchUpInsideActionIdentifier])
    {
      v31 = sub_18EAE6ED4();
      v33 = v32;
      if (v31 == sub_18EAE6ED4() && v33 == v34)
        goto LABEL_27;
      v35 = sub_18EAE7120();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v35 & 1) != 0)
        goto LABEL_28;
    }
    sub_18EAC570C(0, &qword_1EE12FDC8);
    v36 = *((_QWORD *)v2 + 3);
    v37 = swift_allocObject();
    *(_QWORD *)(v37 + 16) = v12;
    *(_QWORD *)(v37 + 24) = a1;
    v38 = v2[1];
    *(_OWORD *)(v37 + 32) = *v2;
    *(_OWORD *)(v37 + 48) = v38;
    *(_QWORD *)(v37 + 64) = *((_QWORD *)v2 + 4);
    sub_18EADBA3C((uint64_t)&v43);
    a1;
    sub_18EADBA64(v36);
    v39 = (void *)sub_18EAE7024();
    v15 = v15;
    sub_18EAD8B58((uint64_t)v39, v15);

    goto LABEL_31;
  }
  __break(1u);
}

uint64_t sub_18EAD8240(unint64_t a1, void *a2, void *a3)
{
  __int128 *v3;
  __int128 *v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t aBlock;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  __int128 v39;

  v4 = v3;
  v7 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v27 = sub_18EAE70E4();
    swift_bridgeObjectRelease();
    if (v27 > 0)
    {
      v38 = MEMORY[0x1E0DEE9D8];
      swift_bridgeObjectRetain();
      v31 = sub_18EAE70E4();
      if (!v31)
      {
        swift_bridgeObjectRelease();
        if (!(MEMORY[0x1E0DEE9D8] >> 62))
        {
LABEL_13:
          swift_bridgeObjectRetain();
          sub_18EAE712C();
          sub_18EAC570C(0, &qword_1EE12FDA8);
LABEL_14:
          swift_bridgeObjectRelease();
          sub_18EAC570C(0, &qword_1EE12FDD8);
          v26 = a3;
          return sub_18EAE7000();
        }
LABEL_18:
        sub_18EAC570C(0, &qword_1EE12FDA8);
        swift_bridgeObjectRetain();
        sub_18EAE70D8();
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
      goto LABEL_4;
    }
    return 0;
  }
  v31 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v31)
    return 0;
  v38 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRetain();
LABEL_4:
  v39 = *v4;
  v8 = *((_QWORD *)v4 + 3);
  result = objc_opt_self();
  v30 = (id)result;
  if (v31 >= 1)
  {
    v10 = 0;
    v28 = a3;
    v29 = v7 & 0xC000000000000001;
    v11 = v7;
    do
    {
      if (v29)
        v12 = (id)MEMORY[0x193FF58EC](v10, v7);
      else
        v12 = *(id *)(v7 + 8 * v10 + 32);
      v13 = v12;
      v14 = swift_allocObject();
      *(_QWORD *)(v14 + 16) = v13;
      v15 = v4[1];
      *(_OWORD *)(v14 + 24) = *v4;
      *(_OWORD *)(v14 + 40) = v15;
      *(_QWORD *)(v14 + 56) = *((_QWORD *)v4 + 4);
      v36 = sub_18EADBB08;
      v37 = v14;
      v16 = MEMORY[0x1E0C809B0];
      aBlock = MEMORY[0x1E0C809B0];
      v33 = 1107296256;
      v34 = sub_18EAD90C8;
      v35 = &block_descriptor_11;
      v17 = _Block_copy(&aBlock);
      v18 = v13;
      sub_18EADBA3C((uint64_t)&v39);
      sub_18EADBA64(v8);
      v19 = objc_msgSend(v30, sel_elementWithViewProvider_, v17);
      _Block_release(v17);
      swift_release();
      v20 = swift_allocObject();
      *(_QWORD *)(v20 + 16) = v18;
      *(_QWORD *)(v20 + 24) = a2;
      v21 = v4[1];
      *(_OWORD *)(v20 + 32) = *v4;
      *(_OWORD *)(v20 + 48) = v21;
      *(_QWORD *)(v20 + 64) = *((_QWORD *)v4 + 4);
      v36 = sub_18EADBB58;
      v37 = v20;
      aBlock = v16;
      v33 = 1107296256;
      v34 = sub_18EAD9498;
      v35 = &block_descriptor_17;
      v22 = _Block_copy(&aBlock);
      v23 = v18;
      sub_18EADBA3C((uint64_t)&v39);
      sub_18EADBA64(v8);
      v24 = a2;
      swift_release();
      objc_msgSend(v19, sel_setPrimaryActionHandler_, v22);
      _Block_release(v22);
      v25 = v19;
      MEMORY[0x193FF5760]();
      if (*(_QWORD *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_18EAE6F4C();
      ++v10;
      sub_18EAE6F58();
      sub_18EAE6F40();

      v7 = v11;
    }
    while (v31 != v10);
    swift_bridgeObjectRelease();
    a3 = v28;
    if (!(v38 >> 62))
      goto LABEL_13;
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

void sub_18EAD8658(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  char **v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void (*v46)(uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v7 = sub_18EAE6A18();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    v12 = (id)sub_18EAE70E4();
    if (v12)
    {
LABEL_3:
      v52 = a4;
      if ((a2 & 0xC000000000000001) != 0)
      {
        v13 = (id)MEMORY[0x193FF58EC](0, a2);
      }
      else
      {
        if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_27:
          swift_once();
LABEL_16:
          v34 = *(void **)(qword_1EE131130
                         + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController);
          *(_QWORD *)(qword_1EE131130 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController) = v12;
          v35 = v12;

          v36 = objc_msgSend((id)a2, (SEL)(v7 + 3400));
          v37 = sub_18EAE6ED4();
          v39 = v38;

          v40 = objc_msgSend((id)a2, (SEL)(v8 + 1039));
          if (v40)
          {
            v41 = v40;
            v42 = sub_18EAE6ED4();
            v44 = v43;

          }
          else
          {
            v42 = 0;
            v44 = 0xE000000000000000;
          }
          sub_18EADC5E0(v37, v39, v42, v44, *(unsigned __int8 *)(v52 + 16));
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v45 = *(void **)(qword_1EE131130
                         + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController);
          *(_QWORD *)(qword_1EE131130 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController) = 0;

          return;
        }
        v13 = *(id *)(a2 + 32);
      }
      v14 = v13;
      swift_bridgeObjectRelease();
      if (qword_1EE12F5C0 != -1)
        swift_once();
      v15 = __swift_project_value_buffer(v7, (uint64_t)qword_1EE131138);
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v15, v7);
      a2 = v14;
      v16 = sub_18EAE6A00();
      v17 = sub_18EAE6F7C();
      v18 = &selRef_delegate;
      v19 = 0x1F3B7D000;
      if (os_log_type_enabled(v16, (os_log_type_t)v17))
      {
        v50 = v17;
        v51 = a3;
        v20 = swift_slowAlloc();
        v49 = swift_slowAlloc();
        v55 = v49;
        *(_DWORD *)v20 = 136315394;
        v21 = objc_msgSend((id)a2, sel_uniqueIdentifier);
        v22 = sub_18EAE6ED4();
        v24 = v23;

        v53 = sub_18EADDB8C(v22, v24, &v55);
        sub_18EAE703C();

        v19 = (unint64_t)&stru_1E2879000;
        swift_bridgeObjectRelease();
        *(_WORD *)(v20 + 12) = 2080;
        v25 = objc_msgSend((id)a2, sel_attachmentGUID);
        if (v25)
        {
          v26 = v25;
          v27 = sub_18EAE6ED4();
          v29 = v28;

          v53 = v27;
          v54 = v29;
          v19 = 0x1F3B7D000uLL;
          v30 = sub_18EAE6EE0();
          v32 = v31;
        }
        else
        {
          v32 = 0xE300000000000000;
          v30 = 7104878;
        }
        v53 = sub_18EADDB8C(v30, v32, &v55);
        sub_18EAE703C();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_18EAB1000, v16, (os_log_type_t)v50, "Calling  performCommunicationAction with values messageGUID: %s, attachmentGUID: %s", (uint8_t *)v20, 0x16u);
        v33 = v49;
        swift_arrayDestroy();
        MEMORY[0x193FF60CC](v33, -1, -1);
        MEMORY[0x193FF60CC](v20, -1, -1);

        (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
        a3 = v51;
        v18 = (char **)0x1F32C5000;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      }
      if ((objc_msgSend(a3, sel_respondsToSelector_, sel__viewControllerForAncestor) & 1) == 0)
      {

        return;
      }
      v7 = (uint64_t)v18;
      v8 = v19;
      v12 = objc_msgSend(a3, sel__viewControllerForAncestor);
      if (qword_1EE12F5B8 == -1)
        goto LABEL_16;
      goto LABEL_27;
    }
  }
  else
  {
    v12 = *(id *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v12)
      goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  v46 = *(void (**)(uint64_t))(a4 + 24);
  if (v46)
  {
    v47 = swift_retain();
    v46(v47);
    sub_18EAD7A90((uint64_t)v46);
  }
}

id sub_18EAD8B58(uint64_t a1, void *a2)
{
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  id result;
  uint64_t v12;
  void *v13;

  v4 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_touchUpInsideActionIdentifier;
  if (!*(_QWORD *)&v2[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_touchUpInsideActionIdentifier])
  {
LABEL_9:
    objc_msgSend(v2, sel_addAction_forControlEvents_, a1, 64);
    v13 = *(void **)&v2[v4];
    *(_QWORD *)&v2[v4] = a2;

    return a2;
  }
  v5 = sub_18EAE6ED4();
  v7 = v6;
  if (v5 != sub_18EAE6ED4() || v7 != v8)
  {
    v10 = sub_18EAE7120();
    swift_bridgeObjectRelease();
    result = (id)swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      return result;
    v12 = *(_QWORD *)&v2[v4];
    if (v12)
      objc_msgSend(v2, sel_removeActionForIdentifier_forControlEvents_, v12, 64);
    goto LABEL_9;
  }
  return (id)swift_bridgeObjectRelease_n();
}

id sub_18EAD8C64(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  double v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  double v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  void *v37;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v3, sel_setBackgroundColor_, v4);

  v5 = objc_allocWithZone((Class)sub_18EAE6940());
  v6 = a2;
  v7 = (void *)sub_18EAE6934();
  objc_msgSend(v7, sel_setRemoteRenderingEnabled_, 1);
  v8 = v7;
  sub_18EAE6958();

  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v8, sel_setUserInteractionEnabled_, 0);
  objc_msgSend(v3, sel_addSubview_, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FCE8);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_18EAEA0B0;
  v10 = objc_msgSend(v8, sel_topAnchor);
  v11 = objc_msgSend(v3, sel_topAnchor);
  v12 = (void *)objc_opt_self();
  v13 = objc_msgSend(v12, sel_currentDevice);
  v14 = objc_msgSend(v13, sel_userInterfaceIdiom);

  if (v14 == (id)6)
    v15 = 12.0;
  else
    v15 = 8.0;
  if (v14 == (id)5)
    v15 = 5.0;
  v16 = objc_msgSend(v10, sel_constraintEqualToAnchor_constant_, v11, v15);

  *(_QWORD *)(v9 + 32) = v16;
  v17 = objc_msgSend(v8, sel_bottomAnchor);
  v18 = objc_msgSend(v3, sel_bottomAnchor);
  v19 = objc_msgSend(v12, sel_currentDevice);
  v20 = objc_msgSend(v19, sel_userInterfaceIdiom);

  if (v20 == (id)6)
    v21 = 12.0;
  else
    v21 = 8.0;
  if (v20 == (id)5)
    v21 = 5.0;
  v22 = objc_msgSend(v17, sel_constraintEqualToAnchor_constant_, v18, -v21);

  *(_QWORD *)(v9 + 40) = v22;
  v23 = objc_msgSend(v8, sel_leadingAnchor);
  v24 = objc_msgSend(v3, sel_leadingAnchor);
  v25 = objc_msgSend(v12, sel_currentDevice);
  v26 = objc_msgSend(v25, sel_userInterfaceIdiom);

  v27 = 16.0;
  if (v26 == (id)6)
    v27 = 20.0;
  v28 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v24, v27);

  *(_QWORD *)(v9 + 48) = v28;
  v29 = objc_msgSend(v8, sel_trailingAnchor);
  v30 = objc_msgSend(v3, sel_trailingAnchor);
  v31 = objc_msgSend(v12, sel_currentDevice);
  v32 = objc_msgSend(v31, sel_userInterfaceIdiom);

  if (v32 == (id)6)
    v33 = 12.0;
  else
    v33 = 8.0;
  if (v32 == (id)5)
    v34 = 5.0;
  else
    v34 = v33;
  v35 = (void *)objc_opt_self();
  v36 = objc_msgSend(v29, sel_constraintEqualToAnchor_constant_, v30, -v34);

  *(_QWORD *)(v9 + 56) = v36;
  sub_18EAE6F40();
  sub_18EAC570C(0, (unint64_t *)&qword_1EE12FCF0);
  v37 = (void *)sub_18EAE6F28();
  swift_bridgeObjectRelease();
  objc_msgSend(v35, sel_activateConstraints_, v37);

  return v3;
}

id sub_18EAD90C8(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  void *v5;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = (void *)v3();
  swift_release();

  return v5;
}

void sub_18EAD9118(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v34;

  if (qword_1EE12F5C8 != -1)
    swift_once();
  v6 = sub_18EAE6A18();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EE131150);
  v7 = sub_18EAE6A00();
  v8 = sub_18EAE6F7C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_18EAB1000, v7, v8, "Something was tapped in the disambiguation menu", v9, 2u);
    MEMORY[0x193FF60CC](v9, -1, -1);
  }

  v10 = a2;
  v11 = sub_18EAE6A00();
  v12 = sub_18EAE6F7C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v34 = v14;
    *(_DWORD *)v13 = 136315138;
    v15 = objc_msgSend(v10, sel_uniqueIdentifier);
    v16 = sub_18EAE6ED4();
    v17 = a3;
    v19 = v18;

    sub_18EADDB8C(v16, v19, &v34);
    sub_18EAE703C();

    a3 = v17;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_18EAB1000, v11, v12, "Conversation attribution view was tapped in disambiguation menu. attribution.identifer: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x193FF60CC](v14, -1, -1);
    MEMORY[0x193FF60CC](v13, -1, -1);

  }
  else
  {

  }
  if ((objc_msgSend(a3, sel_respondsToSelector_, sel__viewControllerForAncestor) & 1) != 0)
  {
    v20 = objc_msgSend(a3, sel__viewControllerForAncestor);
    if (qword_1EE12F5B8 != -1)
      swift_once();
    v21 = *(void **)(qword_1EE131130 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController);
    *(_QWORD *)(qword_1EE131130 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController) = v20;
    v22 = v20;

    v23 = objc_msgSend(v10, sel_uniqueIdentifier);
    v24 = sub_18EAE6ED4();
    v26 = v25;

    v27 = objc_msgSend(v10, sel_attachmentGUID);
    if (v27)
    {
      v28 = v27;
      v29 = sub_18EAE6ED4();
      v31 = v30;

    }
    else
    {
      v31 = 0xE600000000000000;
      v29 = 0x29656E6F6E28;
    }
    sub_18EADC5E0(v24, v26, v29, v31, *(unsigned __int8 *)(a4 + 16));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v32 = *(void **)(qword_1EE131130 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController);
    *(_QWORD *)(qword_1EE131130 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController) = 0;

  }
}

void sub_18EAD9498(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

char *sub_18EAD94E8(uint64_t a1)
{
  uint64_t v1;

  return sub_18EADB4B0(a1, *(void **)(v1 + 8), *(_BYTE *)(v1 + 16));
}

void sub_18EAD94F4(_BYTE *a1)
{
  sub_18EAD7CE0(a1);
}

uint64_t sub_18EAD953C()
{
  return sub_18EAE6B68();
}

uint64_t sub_18EAD957C()
{
  sub_18EADB978();
  return sub_18EAE6BC8();
}

uint64_t sub_18EAD95CC()
{
  sub_18EADB978();
  return sub_18EAE6B74();
}

void sub_18EAD961C()
{
  sub_18EADB978();
  sub_18EAE6BBC();
  __break(1u);
}

id sub_18EAD9680()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  double i;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  uint64_t ObjectType;
  objc_class *v16;
  char *v17;
  objc_super v18;

  ObjectType = swift_getObjectType();
  v0 = (void *)objc_opt_self();
  v1 = 0;
  v2 = *MEMORY[0x1E0DC4B60];
  for (i = 0.0; ; i = v10)
  {
    v4 = (void *)sub_18EAE6EB0();
    swift_bridgeObjectRelease();
    v5 = objc_msgSend(v0, sel_systemImageNamed_, v4);

    if (!v5)
      goto LABEL_6;
    v6 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, v2);
    v7 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_scale_, v6, 2);

    v8 = objc_msgSend(v5, sel_imageWithSymbolConfiguration_, v7);
    if (v8)
    {
      objc_msgSend(v8, sel_size);
      v10 = v9;

      if (i > v10)
        v10 = i;
    }
    else
    {
LABEL_6:
      v10 = i;
      if (i <= 0.0)
        v10 = 0.0;
    }
    if (v1 == 2)
      break;
    ++v1;
  }
  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_currentDevice);
  objc_msgSend(v12, sel_userInterfaceIdiom);

  v13 = objc_msgSend(v11, sel_currentDevice, ObjectType);
  objc_msgSend(v13, sel_userInterfaceIdiom);

  objc_msgSend(*(id *)&v17[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label], sel_intrinsicContentSize);
  v18.receiver = v17;
  v18.super_class = v16;
  return objc_msgSendSuper2(&v18, sel_intrinsicContentSize);
}

void sub_18EAD99DC(char a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t ObjectType;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  objc_super v21;
  objc_super v22;

  v2 = v1;
  ObjectType = swift_getObjectType();
  v5 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock;
  if (v1[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock] == 1)
  {
    v6 = (objc_class *)ObjectType;
    if (qword_1EE12F5C0 != -1)
      swift_once();
    v7 = sub_18EAE6A18();
    __swift_project_value_buffer(v7, (uint64_t)qword_1EE131138);
    v8 = v1;
    v9 = sub_18EAE6A00();
    v10 = sub_18EAE6F88();
    if (os_log_type_enabled(v9, v10))
    {
      v19 = a1;
      v11 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v20 = v18;
      *(_DWORD *)v11 = 136315138;
      v12 = objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label], sel_text);
      if (v12)
      {
        v13 = v12;
        v14 = sub_18EAE6ED4();
        v16 = v15;

      }
      else
      {
        v16 = 0x800000018EAEC710;
        v14 = 0xD000000000000013;
      }
      sub_18EADDB8C(v14, v16, &v20);
      sub_18EAE703C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_18EAB1000, v9, v10, "%s - Tried to set CommunicationControl.isEnabled, but enablementLock was true. Setting isEnabled back to oldValue. If this was an intentional setting, use CommunicationControl.setIsEnabled(_:) instead of setting this property directly.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x193FF60CC](v18, -1, -1);
      MEMORY[0x193FF60CC](v11, -1, -1);

      a1 = v19;
    }
    else
    {

    }
    v2[v5] = 0;
    v22.receiver = v8;
    v22.super_class = v6;
    v17 = objc_msgSendSuper2(&v22, sel_isEnabled);
    v21.receiver = v8;
    v21.super_class = v6;
    objc_msgSendSuper2(&v21, sel_setEnabled_, a1 & 1);
    sub_18EAD99DC(v17);
    v2[v5] = 1;
  }
  else
  {
    sub_18EAD9C58();
  }
}

void sub_18EAD9C58()
{
  void *v0;
  void *v1;
  objc_class *ObjectType;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v10;
  objc_super v11;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_tintLock;
  *((_BYTE *)v0 + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_tintLock) = 0;
  v4 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v5 = objc_msgSend(v4, sel_userInterfaceIdiom);

  if (v5 == (id)6)
  {
    v6 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  }
  else
  {
    sub_18EAC570C(0, &qword_1EE12FDB0);
    sub_18EAE6DB4();
    v6 = (id)sub_18EAE700C();
  }
  v7 = v6;
  v11.receiver = v1;
  v11.super_class = ObjectType;
  if (objc_msgSendSuper2(&v11, sel_isEnabled))
    v8 = v7;
  else
    v8 = objc_msgSend((id)objc_opt_self(), sel_lightGrayColor);
  v9 = v8;
  v10.receiver = v1;
  v10.super_class = ObjectType;
  objc_msgSendSuper2(&v10, sel_setTintColor_, v8);
  sub_18EAD9E50();

  *((_BYTE *)v1 + v3) = 1;
}

void sub_18EAD9E50()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;

  if (*((_BYTE *)v0 + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_tintLock) == 1)
  {
    if (qword_1EE12F5C0 != -1)
      swift_once();
    v1 = sub_18EAE6A18();
    __swift_project_value_buffer(v1, (uint64_t)qword_1EE131138);
    v11 = v0;
    v2 = sub_18EAE6A00();
    v3 = sub_18EAE6F88();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      v5 = swift_slowAlloc();
      v12 = v5;
      *(_DWORD *)v4 = 136315138;
      v6 = objc_msgSend(*(id *)&v11[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label], sel_text);
      if (v6)
      {
        v7 = v6;
        v8 = sub_18EAE6ED4();
        v10 = v9;

      }
      else
      {
        v10 = 0x800000018EAEC710;
        v8 = 0xD000000000000013;
      }
      sub_18EADDB8C(v8, v10, &v12);
      sub_18EAE703C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_18EAB1000, v2, v3, "%s - Set CommunicationControl.tintColor, but tintLock was true. This is unexpected, as CommunicationControl manages tint color internally", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x193FF60CC](v5, -1, -1);
      MEMORY[0x193FF60CC](v4, -1, -1);

    }
    else
    {

    }
  }
}

char *sub_18EADA068(char a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  id v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
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
  double v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  double v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  double v90;
  double v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  void *v100;
  id v102;
  objc_super v103;
  objc_super v104;
  objc_super v105;
  objc_super v106;
  objc_super v107;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v1[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_touchUpInsideActionIdentifier] = 0;
  v4 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_contentView;
  v5 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v6 = v1;
  *(_QWORD *)&v1[v4] = objc_msgSend(v5, sel_init);
  v7 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_imageView;
  *(_QWORD *)&v6[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_init);
  v8 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label;
  *(_QWORD *)&v6[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  *(_QWORD *)&v6[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_menu] = 0;
  v6[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock] = 1;
  v6[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_tintLock] = 1;
  v6[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_communicationChannel] = a1;

  v107.receiver = v6;
  v107.super_class = ObjectType;
  v9 = objc_msgSendSuper2(&v107, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_18EAD9C58();
  v10 = (void *)objc_opt_self();
  v11 = (char *)v9;
  v12 = objc_msgSend(v10, sel_tertiarySystemBackgroundColor);
  objc_msgSend(v11, sel_setBackgroundColor_, v12);

  v13 = objc_msgSend(v11, sel_layer);
  v102 = (id)objc_opt_self();
  v14 = objc_msgSend(v102, sel_currentDevice);
  v15 = objc_msgSend(v14, sel_userInterfaceIdiom);

  v16 = 16.0;
  if (v15 != (id)6)
    v16 = 12.0;
  objc_msgSend(v13, sel_setCornerRadius_, v16);

  v17 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_contentView;
  v18 = *(void **)&v11[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_contentView];
  objc_msgSend(v18, sel_setUserInteractionEnabled_, 0);
  v19 = v18;
  v20 = objc_msgSend(v10, sel_clearColor);
  objc_msgSend(v19, sel_setBackgroundColor_, v20);

  v21 = *(void **)&v11[v17];
  v106.receiver = v11;
  v106.super_class = ObjectType;
  v22 = v21;
  v23 = objc_msgSendSuper2(&v106, sel_tintColor);
  objc_msgSend(v22, sel_setTintColor_, v23);

  v24 = *(void **)&v11[v17];
  objc_msgSend(v24, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v11, sel_addSubview_, v24);
  v25 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_imageView;
  v26 = *(void **)&v11[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_imageView];
  v105.receiver = v11;
  v105.super_class = ObjectType;
  v27 = v26;
  v28 = objc_msgSendSuper2(&v105, sel_tintColor);
  objc_msgSend(v27, sel_setTintColor_, v28);

  v29 = *(id *)&v11[v25];
  v30 = (void *)sub_18EAE6EB0();
  swift_bridgeObjectRelease();
  v31 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v30);

  if (v31)
  {
    v32 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x1E0DC4B60]);
    v33 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_scale_, v32, 2);

    v34 = objc_msgSend(v31, sel_imageWithSymbolConfiguration_, v33);
  }
  else
  {
    v34 = 0;
  }
  objc_msgSend(v29, sel_setImage_, v34);

  v35 = *(void **)&v11[v25];
  objc_msgSend(v35, sel_setContentMode_, 4);
  objc_msgSend(v35, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(*(id *)&v11[v17], sel_addSubview_, v35);
  v36 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label;
  v37 = *(id *)&v11[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label];
  sub_18EADC21C();
  v38 = (void *)sub_18EAE6EB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v37, sel_setText_, v38);

  v39 = *(void **)&v11[v36];
  v104.receiver = v11;
  v104.super_class = ObjectType;
  v40 = v39;
  v41 = objc_msgSendSuper2(&v104, sel_tintColor);
  objc_msgSend(v40, sel_setTintColor_, v41);

  v42 = *(void **)&v11[v36];
  v103.receiver = v11;
  v103.super_class = ObjectType;
  v43 = v42;
  v44 = objc_msgSendSuper2(&v103, sel_tintColor);
  objc_msgSend(v43, sel_setTextColor_, v44);

  v45 = *(void **)&v11[v36];
  objc_msgSend(v45, sel_setTextAlignment_, 1);
  v46 = (void *)objc_opt_self();
  v47 = *MEMORY[0x1E0DC4AA0];
  v48 = v45;
  v49 = objc_msgSend(v46, sel_preferredFontForTextStyle_, v47);
  objc_msgSend(v48, sel_setFont_, v49);

  v50 = *(void **)&v11[v36];
  objc_msgSend(v50, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v50, (SEL)&selRef_setStringIdentifier_, 0);
  v51 = *(void **)&v11[v17];
  objc_msgSend(v51, sel_addSubview_, v50);
  objc_msgSend(v50, sel_setNumberOfLines_, 1);
  objc_msgSend(v50, sel_setLineBreakMode_, 4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FCE8);
  v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_18EAEA0C0;
  v53 = objc_msgSend(*(id *)&v11[v25], sel_centerXAnchor);
  v54 = objc_msgSend(v51, sel_centerXAnchor);
  v55 = objc_msgSend(v53, sel_constraintEqualToAnchor_, v54);

  *(_QWORD *)(v52 + 32) = v55;
  v56 = objc_msgSend(*(id *)&v11[v25], sel_leadingAnchor);
  v57 = objc_msgSend(*(id *)&v11[v17], (SEL)&selRef_highlight + 6);
  v58 = objc_msgSend(v56, sel_constraintGreaterThanOrEqualToAnchor_, v57);

  *(_QWORD *)(v52 + 40) = v58;
  v59 = objc_msgSend(*(id *)&v11[v25], sel_trailingAnchor);
  v60 = objc_msgSend(*(id *)&v11[v17], (SEL)&selRef_setIsContentShared_);
  v61 = objc_msgSend(v59, sel_constraintGreaterThanOrEqualToAnchor_, v60);

  *(_QWORD *)(v52 + 48) = v61;
  v62 = objc_msgSend(*(id *)&v11[v25], sel_topAnchor);
  v63 = objc_msgSend(*(id *)&v11[v17], (SEL)&selRef_setTranslatesAutoresizingMaskIntoConstraints_ + 4);
  v64 = objc_msgSend(v62, (SEL)&selRef_configurationWithScale_ + 6, v63);

  *(_QWORD *)(v52 + 56) = v64;
  v65 = objc_msgSend(*(id *)&v11[v36], (SEL)&selRef_setTranslatesAutoresizingMaskIntoConstraints_ + 4);
  v66 = objc_msgSend(*(id *)&v11[v25], sel_bottomAnchor);
  v67 = objc_msgSend(v102, sel_currentDevice);
  v68 = objc_msgSend(v67, sel_userInterfaceIdiom);

  v69 = 3.0;
  if (v68 == (id)6)
    v69 = 4.0;
  if (v68 == (id)5)
    v69 = 1.0;
  v70 = objc_msgSend(v65, sel_constraintEqualToAnchor_constant_, v66, v69);

  *(_QWORD *)(v52 + 64) = v70;
  v71 = objc_msgSend(*(id *)&v11[v36], sel_bottomAnchor);
  v72 = objc_msgSend(*(id *)&v11[v17], sel_bottomAnchor);
  v73 = objc_msgSend(v71, sel_constraintEqualToAnchor_, v72);

  *(_QWORD *)(v52 + 72) = v73;
  v74 = objc_msgSend(*(id *)&v11[v36], sel_leadingAnchor);
  v75 = objc_msgSend(*(id *)&v11[v17], sel_leadingAnchor);
  v76 = objc_msgSend(v74, sel_constraintEqualToAnchor_, v75);

  *(_QWORD *)(v52 + 80) = v76;
  v77 = objc_msgSend(*(id *)&v11[v36], sel_trailingAnchor);
  v78 = objc_msgSend(*(id *)&v11[v17], sel_trailingAnchor);
  v79 = objc_msgSend(v77, sel_constraintEqualToAnchor_, v78);

  *(_QWORD *)(v52 + 88) = v79;
  v80 = objc_msgSend(*(id *)&v11[v17], sel_topAnchor);
  v81 = objc_msgSend(v11, sel_topAnchor);
  v82 = objc_msgSend(v102, sel_currentDevice);
  v83 = objc_msgSend(v82, sel_userInterfaceIdiom);

  if (v83 == (id)6)
    v84 = 12.0;
  else
    v84 = 9.0;
  if (v83 == (id)5)
    v84 = 5.0;
  v85 = objc_msgSend(v80, sel_constraintEqualToAnchor_constant_, v81, v84);

  *(_QWORD *)(v52 + 96) = v85;
  v86 = objc_msgSend(*(id *)&v11[v17], sel_bottomAnchor);
  v87 = objc_msgSend(v11, sel_bottomAnchor);
  v88 = objc_msgSend(v102, sel_currentDevice);
  v89 = objc_msgSend(v88, sel_userInterfaceIdiom);

  if (v89 == (id)6)
    v90 = 12.0;
  else
    v90 = 9.0;
  if (v89 == (id)5)
    v91 = 5.0;
  else
    v91 = v90;
  v92 = (void *)objc_opt_self();
  v93 = objc_msgSend(v86, sel_constraintEqualToAnchor_constant_, v87, -v91);

  *(_QWORD *)(v52 + 104) = v93;
  v94 = objc_msgSend(*(id *)&v11[v17], sel_leadingAnchor);
  v95 = objc_msgSend(v11, sel_leadingAnchor);
  v96 = objc_msgSend(v94, sel_constraintEqualToAnchor_, v95);

  *(_QWORD *)(v52 + 112) = v96;
  v97 = objc_msgSend(*(id *)&v11[v17], sel_trailingAnchor);
  v98 = objc_msgSend(v11, sel_trailingAnchor);
  v99 = objc_msgSend(v97, sel_constraintEqualToAnchor_, v98);

  *(_QWORD *)(v52 + 120) = v99;
  sub_18EAE6F40();
  sub_18EAC570C(0, (unint64_t *)&qword_1EE12FCF0);
  v100 = (void *)sub_18EAE6F28();
  swift_bridgeObjectRelease();
  objc_msgSend(v92, sel_activateConstraints_, v100);

  return v11;
}

uint64_t sub_18EADAC98(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;

  v2 = v1;
  swift_getObjectType();
  v4 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_touchUpInsideActionIdentifier;
  *(_QWORD *)&v1[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_touchUpInsideActionIdentifier] = 0;
  v5 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_contentView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v7 = v1;
  *(_QWORD *)&v2[v5] = objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_imageView;
  *(_QWORD *)&v7[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_init);
  v9 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label;
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);

  *(_QWORD *)&v7[v9] = v10;
  v11 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_menu;
  *(_QWORD *)&v7[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_menu] = 0;
  v7[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock] = 1;
  v7[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_tintLock] = 1;

  v12 = *(void **)&v7[v11];
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_18EADAE00()
{
  char *v0;
  objc_class *ObjectType;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;
  objc_super v10;
  objc_super v11;
  objc_super v12;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v13.receiver = v0;
  v13.super_class = ObjectType;
  objc_msgSendSuper2(&v13, sel_tintColorDidChange);
  v2 = *(void **)&v0[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_contentView];
  v12.receiver = v0;
  v12.super_class = ObjectType;
  v3 = objc_msgSendSuper2(&v12, sel_tintColor);
  objc_msgSend(v2, sel_setTintColor_, v3);

  v4 = *(void **)&v0[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_imageView];
  v11.receiver = v0;
  v11.super_class = ObjectType;
  v5 = objc_msgSendSuper2(&v11, sel_tintColor);
  objc_msgSend(v4, sel_setTintColor_, v5);

  v6 = *(void **)&v0[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label];
  v10.receiver = v0;
  v10.super_class = ObjectType;
  v7 = objc_msgSendSuper2(&v10, sel_tintColor);
  objc_msgSend(v6, sel_setTintColor_, v7);

  v9.receiver = v0;
  v9.super_class = ObjectType;
  v8 = objc_msgSendSuper2(&v9, sel_tintColor);
  objc_msgSend(v6, sel_setTextColor_, v8);

}

id sub_18EADAF74(id a1)
{
  void *v1;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  id result;
  objc_super v12;

  v12.receiver = v1;
  v12.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v12, sel_traitCollectionDidChange_, a1);
  if (a1)
    a1 = objc_msgSend(a1, sel_preferredContentSizeCategory);
  v3 = objc_msgSend(v1, sel_traitCollection);
  v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  if (!a1)
  {

    return objc_msgSend(v1, sel_invalidateIntrinsicContentSize);
  }
  v5 = sub_18EAE6ED4();
  v7 = v6;
  if (v5 == sub_18EAE6ED4() && v7 == v8)
  {

    return (id)swift_bridgeObjectRelease_n();
  }
  v10 = sub_18EAE7120();

  swift_bridgeObjectRelease();
  result = (id)swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
    return objc_msgSend(v1, sel_invalidateIntrinsicContentSize);
  return result;
}

void *sub_18EADB108(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x193FF6168](v2);
  if (!v3)
    return 0;
  v4 = (void *)v3;
  v5 = *(void **)(v3 + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_menu);
  v6 = v5;

  return v5;
}

id sub_18EADB1E4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CommunicationControl()
{
  return objc_opt_self();
}

id sub_18EADB2A0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  void *v3;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  sub_18EAC570C(0, &qword_1EE12FDA8);
  v2 = sub_18EAE6F34();
  swift_retain();
  v3 = (void *)v1(v2);
  swift_release();
  swift_bridgeObjectRelease();
  return v3;
}

id sub_18EADB318(void *a1, char a2)
{
  id v4;
  id result;
  void *v6;
  unsigned int v7;
  char v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;

  swift_getKeyPath();
  swift_getKeyPath();
  v4 = a1;
  sub_18EAE6A60();

  swift_release();
  swift_release();

  if (!a2)
    goto LABEL_5;
  if (a2 != 1)
  {
    result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    if (!result)
      goto LABEL_16;
    v9 = result;
    v10 = objc_msgSend(result, sel_faceTimeAvailable);

    if ((v10 & 1) == 0)
      goto LABEL_9;
LABEL_5:
    if (v11)
    {
      v8 = 1;
    }
    else
    {
      if (a2)
        v8 = sub_18EAE7120();
      else
        v8 = 1;
      swift_bridgeObjectRelease();
    }
    return (id)(v8 & 1);
  }
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v6 = result;
    v7 = objc_msgSend(result, sel_callingAvailable);

    if (v7)
      goto LABEL_5;
LABEL_9:
    v8 = 0;
    return (id)(v8 & 1);
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

char *sub_18EADB4B0(uint64_t a1, void *a2, char a3)
{
  objc_class *v5;
  id v6;
  char *v7;
  double v8;
  unsigned __int8 v9;
  uint64_t v10;
  objc_super v12;
  objc_super v13;

  v5 = (objc_class *)type metadata accessor for CommunicationControl();
  v6 = objc_allocWithZone(v5);
  v7 = sub_18EADA068(a3);
  LODWORD(v8) = 1132068864;
  objc_msgSend(v7, sel_setContentCompressionResistancePriority_forAxis_, 0, v8);
  v9 = sub_18EADB318(a2, a3);
  v10 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock;
  v7[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock] = 0;
  v13.receiver = v7;
  v13.super_class = v5;
  LOBYTE(a2) = objc_msgSendSuper2(&v13, sel_isEnabled);
  v12.receiver = v7;
  v12.super_class = v5;
  objc_msgSendSuper2(&v12, sel_setEnabled_, v9 & 1);
  sub_18EAD99DC((char)a2);
  v7[v10] = 1;
  return v7;
}

id sub_18EADB57C()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)swift_getObjectType();
  if (!objc_msgSendSuper2(&v7, sel_isEnabled))
    return 0;
  v1 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v2 = (void *)objc_opt_self();
  v6[4] = sub_18EADB6C4;
  v6[5] = v1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_18EADB2A0;
  v6[3] = &block_descriptor_3;
  v3 = _Block_copy(v6);
  swift_retain_n();
  swift_release();
  v4 = objc_msgSend(v2, sel_configurationWithIdentifier_previewProvider_actionProvider_, 0, 0, v3);
  swift_release();
  _Block_release(v3);
  swift_release();
  return v4;
}

uint64_t sub_18EADB6A0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void *sub_18EADB6C4(uint64_t a1)
{
  uint64_t v1;

  return sub_18EADB108(a1, v1);
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

void destroy for CommunicationButton(uint64_t a1)
{

  if (*(_QWORD *)(a1 + 24))
    swift_release();
}

uint64_t initializeWithCopy for CommunicationButton(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  _OWORD *v6;
  id v7;
  uint64_t v8;

  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = (_OWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 24);
  v7 = v4;
  if (v5)
  {
    v8 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = v5;
    *(_QWORD *)(a1 + 32) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *v6;
  }
  return a1;
}

uint64_t assignWithCopy for CommunicationButton(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  v7 = *(_QWORD *)(a1 + 24);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  if (!v7)
  {
    if (v8)
    {
      v10 = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 24) = v8;
      *(_QWORD *)(a1 + 32) = v10;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    return a1;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_7;
  }
  v9 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for CommunicationButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;

  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  if (!v7)
  {
    if (v6)
    {
      v9 = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 24) = v6;
      *(_QWORD *)(a1 + 32) = v9;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    return a1;
  }
  if (!v6)
  {
    swift_release();
    goto LABEL_7;
  }
  v8 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v8;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CommunicationButton(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CommunicationButton(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CommunicationButton()
{
  return &type metadata for CommunicationButton;
}

unint64_t sub_18EADB978()
{
  unint64_t result;

  result = qword_1EE12FDB8;
  if (!qword_1EE12FDB8)
  {
    result = MEMORY[0x193FF6024](&unk_18EAEA114, &type metadata for CommunicationButton);
    atomic_store(result, (unint64_t *)&qword_1EE12FDB8);
  }
  return result;
}

uint64_t sub_18EADB9C4(uint64_t a1)
{

  return a1;
}

uint64_t sub_18EADB9EC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  if (*(_QWORD *)(v0 + 56))
    swift_release();
  return swift_deallocObject();
}

void sub_18EADBA30(uint64_t a1)
{
  uint64_t v1;

  sub_18EAD8658(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), v1 + 32);
}

uint64_t sub_18EADBA3C(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 8);
  return a1;
}

uint64_t sub_18EADBA64(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

unint64_t sub_18EADBA74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE12FDD0;
  if (!qword_1EE12FDD0)
  {
    v1 = sub_18EAC570C(255, &qword_1EE12FDC0);
    result = MEMORY[0x193FF6024](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EE12FDD0);
  }
  return result;
}

uint64_t sub_18EADBACC()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 48))
    swift_release();
  return swift_deallocObject();
}

id sub_18EADBB08(uint64_t a1)
{
  uint64_t v1;

  return sub_18EAD8C64(a1, *(void **)(v1 + 16));
}

uint64_t sub_18EADBB14()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 56))
    swift_release();
  return swift_deallocObject();
}

void sub_18EADBB58(uint64_t a1)
{
  uint64_t v1;

  sub_18EAD9118(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), v1 + 32);
}

void destroy for UICloudSharingControllerRepresentable(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();

}

uint64_t initializeWithCopy for UICloudSharingControllerRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = swift_unknownObjectWeakCopyInit();
  v5 = *(void **)(a2 + 8);
  v6 = *(void **)(a2 + 16);
  *(_QWORD *)(v4 + 8) = v5;
  *(_QWORD *)(v4 + 16) = v6;
  v7 = v5;
  v8 = v6;
  return a1;
}

uint64_t assignWithCopy for UICloudSharingControllerRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = swift_unknownObjectWeakCopyAssign();
  v5 = *(void **)(a2 + 8);
  v6 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v5;
  v7 = v5;

  v8 = *(void **)(a2 + 16);
  v9 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v8;
  v10 = v8;

  return a1;
}

__n128 initializeWithTake for UICloudSharingControllerRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;

  v3 = swift_unknownObjectWeakTakeInit();
  result = *(__n128 *)(a2 + 8);
  *(__n128 *)(v3 + 8) = result;
  return result;
}

uint64_t assignWithTake for UICloudSharingControllerRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = swift_unknownObjectWeakTakeAssign();
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = *(_QWORD *)(a2 + 8);

  v6 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for UICloudSharingControllerRepresentable(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for UICloudSharingControllerRepresentable(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for UICloudSharingControllerRepresentable()
{
  return &type metadata for UICloudSharingControllerRepresentable;
}

id sub_18EADBD38()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC35A0]), sel_initWithShare_container_, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16));
  objc_msgSend(v1, sel_setDelegate_, MEMORY[0x193FF6168](v0));
  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_18EADBDAC()
{
  sub_18EADBEB8();
  return sub_18EAE6C58();
}

uint64_t sub_18EADBDFC()
{
  sub_18EADBEB8();
  return sub_18EAE6C28();
}

void sub_18EADBE4C()
{
  sub_18EADBEB8();
  sub_18EAE6C4C();
  __break(1u);
}

unint64_t sub_18EADBE74()
{
  unint64_t result;

  result = qword_1EE12FDE0;
  if (!qword_1EE12FDE0)
  {
    result = MEMORY[0x193FF6024](&unk_18EAEA2B0, &type metadata for UICloudSharingControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_1EE12FDE0);
  }
  return result;
}

unint64_t sub_18EADBEB8()
{
  unint64_t result;

  result = qword_1EE12FDE8;
  if (!qword_1EE12FDE8)
  {
    result = MEMORY[0x193FF6024](&unk_18EAEA300, &type metadata for UICloudSharingControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_1EE12FDE8);
  }
  return result;
}

uint64_t sub_18EADBEFC(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aMessage_1[8 * a1] == *(_QWORD *)&aMessage_1[8 * a2] && qword_18EAEA508[a1] == qword_18EAEA508[a2])
    v3 = 1;
  else
    v3 = sub_18EAE7120();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_18EADBF80(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aCloudkitcustom_0[8 * a1] == *(_QWORD *)&aCloudkitcustom_0[8 * a2]
    && *(_QWORD *)&aFileprov_0[8 * a1 + 8] == *(_QWORD *)&aFileprov_0[8 * a2 + 8])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_18EAE7120();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_18EADC004()
{
  sub_18EAE7150();
  sub_18EAE6EEC();
  swift_bridgeObjectRelease();
  return sub_18EAE715C();
}

uint64_t sub_18EADC06C()
{
  sub_18EAE7150();
  sub_18EAE6EEC();
  swift_bridgeObjectRelease();
  return sub_18EAE715C();
}

uint64_t sub_18EADC0D4()
{
  sub_18EAE6EEC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18EADC114()
{
  sub_18EAE6EEC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18EADC154()
{
  sub_18EAE7150();
  sub_18EAE6EEC();
  swift_bridgeObjectRelease();
  return sub_18EAE715C();
}

uint64_t sub_18EADC1B8()
{
  sub_18EAE7150();
  sub_18EAE6EEC();
  swift_bridgeObjectRelease();
  return sub_18EAE715C();
}

uint64_t sub_18EADC21C()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  sub_18EAC570C(0, (unint64_t *)&unk_1EE12F918);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_18EAE685C();

  return v2;
}

uint64_t sub_18EADC3B4(char a1)
{
  return *(_QWORD *)&aMessage_1[8 * a1];
}

uint64_t sub_18EADC3D4(char *a1, char *a2)
{
  return sub_18EADBEFC(*a1, *a2);
}

uint64_t sub_18EADC3E0()
{
  return sub_18EADC06C();
}

uint64_t sub_18EADC3E8()
{
  return sub_18EADC0D4();
}

uint64_t sub_18EADC3F0()
{
  return sub_18EADC1B8();
}

uint64_t sub_18EADC3F8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_18EADE1CC();
  *a1 = result;
  return result;
}

uint64_t sub_18EADC424@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_18EADC3B4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_18EADC44C(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E2873368;
}

id sub_18EADC45C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CommunicationManager()), sel_init);
  qword_1EE131130 = (uint64_t)result;
  return result;
}

id sub_18EADC488()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t ObjCClassFromMetadata;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;

  v1 = v0;
  v2 = sub_18EAE6E80();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OBJC_IVAR____TtC13SharedWithYou20CommunicationManager____lazy_storage___facetimeServiceProxy;
  v8 = *(void **)(v0 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager____lazy_storage___facetimeServiceProxy);
  if (v8)
  {
    v9 = *(id *)(v0 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager____lazy_storage___facetimeServiceProxy);
  }
  else
  {
    sub_18EAC570C(0, &qword_1EE12FE70);
    sub_18EAC570C(0, (unint64_t *)&unk_1EE12FE30);
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E0DEF520], v2);
    v10 = (void *)sub_18EAE6FF4();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v12 = objc_msgSend((id)objc_opt_self(), sel_proxyForServiceClass_targetSerialQueue_delegate_, ObjCClassFromMetadata, v10, v1);

    v13 = *(void **)(v1 + v7);
    *(_QWORD *)(v1 + v7) = v12;
    v9 = v12;

    v8 = 0;
  }
  v14 = v8;
  return v9;
}

void sub_18EADC5E0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
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
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  unsigned __int8 v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;

  v6 = v5;
  v58 = a3;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F9F0);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_18EAE6A18();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15, v17);
  v19 = (char *)&v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_18EAE6EF8() < 1)
  {
    sub_18EAE6F88();
    v29 = (id)SWFrameworkLogHandle();
    if (v29)
    {
      v30 = v29;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE12FE60);
      v31 = swift_allocObject();
      v32 = 8 * (char)a5;
      v33 = *(_QWORD *)&aMessage_1[v32];
      *(_OWORD *)(v31 + 16) = xmmword_18EAE9780;
      v34 = *(_QWORD *)((char *)&unk_18EAEA508 + v32);
      *(_QWORD *)(v31 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v31 + 64) = sub_18EAD2584();
      *(_QWORD *)(v31 + 32) = v33;
      *(_QWORD *)(v31 + 40) = v34;
      sub_18EAE69F4();

      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
    goto LABEL_24;
  }
  if (qword_1EE12F5C0 != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v15, (uint64_t)qword_1EE131138);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, v20, v15);
  swift_bridgeObjectRetain_n();
  v21 = sub_18EAE6A00();
  v22 = sub_18EAE6F7C();
  v59 = v21;
  v56 = v22;
  if (os_log_type_enabled(v21, v22))
  {
    v23 = swift_slowAlloc();
    v57 = a5;
    a5 = v23;
    v53 = swift_slowAlloc();
    v61 = v53;
    v24 = 8 * (char)v57;
    v25 = *(_QWORD *)&aMessage_1[v24];
    *(_DWORD *)a5 = 136315394;
    v54 = v16;
    v55 = a4;
    v60 = sub_18EADDB8C(v25, *(_QWORD *)((char *)&unk_18EAEA508 + v24), &v61);
    sub_18EAE703C();
    swift_bridgeObjectRelease();
    *(_WORD *)(a5 + 12) = 2080;
    swift_bridgeObjectRetain();
    v60 = sub_18EADDB8C(a1, a2, &v61);
    sub_18EAE703C();
    swift_bridgeObjectRelease_n();
    v26 = v59;
    _os_log_impl(&dword_18EAB1000, v59, (os_log_type_t)v56, "Received request to perform %s communication action for attribution with identifier %s", (uint8_t *)a5, 0x16u);
    v27 = v53;
    swift_arrayDestroy();
    MEMORY[0x193FF60CC](v27, -1, -1);
    v28 = a5;
    LOBYTE(a5) = v57;
    MEMORY[0x193FF60CC](v28, -1, -1);

    (*(void (**)(char *, uint64_t))(v54 + 8))(v19, v15);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
  }
  if (!(_BYTE)a5)
  {
    v61 = 0;
    v62 = 0xE000000000000000;
    sub_18EAE7090();
    swift_bridgeObjectRelease();
    v61 = 0xD000000000000018;
    v62 = 0x800000018EAECB60;
    sub_18EAE6F04();
    sub_18EAE6F04();
    v37 = v61;
    v36 = v62;
    sub_18EAE68B0();
    v38 = sub_18EAE68BC();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 48))(v14, 1, v38) != 1)
    {
      swift_bridgeObjectRelease();
      sub_18EACF070((uint64_t)v14, &qword_1EE12F9F0);
      v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DA88A8]), sel_init);
      v47 = *(void **)(v6 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController);
      if (v47)
      {
        v48 = v47;
        v49 = (void *)sub_18EAE6EB0();
        v50 = (void *)sub_18EAE6EB0();
        objc_msgSend(v46, sel_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController_, v49, v50, v48);

        return;
      }
      sub_18EAE6F88();
      v51 = (id)SWFrameworkLogHandle();
      if (v51)
      {
        v52 = v51;
        sub_18EAE69F4();

        return;
      }
      goto LABEL_25;
    }
    sub_18EACF070((uint64_t)v14, &qword_1EE12F9F0);
    sub_18EAE6F88();
    v39 = (id)SWFrameworkLogHandle();
    if (v39)
    {
      v40 = v39;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE12FE60);
      v41 = swift_allocObject();
      *(_OWORD *)(v41 + 16) = xmmword_18EAEA380;
      v42 = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v41 + 56) = MEMORY[0x1E0DEA968];
      v43 = sub_18EAD2584();
      *(_QWORD *)(v41 + 32) = 0x6567617373656DLL;
      *(_QWORD *)(v41 + 40) = 0xE700000000000000;
      *(_QWORD *)(v41 + 96) = v42;
      *(_QWORD *)(v41 + 104) = v43;
      *(_QWORD *)(v41 + 64) = v43;
      *(_QWORD *)(v41 + 72) = a1;
      *(_QWORD *)(v41 + 80) = a2;
      *(_QWORD *)(v41 + 136) = v42;
      *(_QWORD *)(v41 + 144) = v43;
      *(_QWORD *)(v41 + 112) = v37;
      *(_QWORD *)(v41 + 120) = v36;
      swift_bridgeObjectRetain();
      sub_18EAE69F4();

      swift_bridgeObjectRelease();
      return;
    }
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    return;
  }
  v35 = (uint64_t *)(v6 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_attributionIdentifier);
  *v35 = a1;
  v35[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v6 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_videoEnabled) = a5 != 1;
  v44 = sub_18EADC488();
  v45 = objc_msgSend(v44, sel_connectionActive);

  if ((v45 & 1) != 0)
    sub_18EADD018();
  else
    sub_18EADCCB8();
}

uint64_t sub_18EADCCB8()
{
  void *v0;
  void *v1;
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
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t aBlock[6];

  v1 = v0;
  v2 = sub_18EAE6E74();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_18EAE6EA4();
  v25 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EE12F5C0 != -1)
    swift_once();
  v11 = sub_18EAE6A18();
  __swift_project_value_buffer(v11, (uint64_t)qword_1EE131138);
  v12 = sub_18EAE6A00();
  v13 = sub_18EAE6F7C();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v24 = v3;
    v16 = v15;
    aBlock[0] = v15;
    v23 = v10;
    *(_DWORD *)v14 = 136315138;
    v26 = sub_18EADDB8C(0xD000000000000013, 0x800000018EAECAE0, aBlock);
    v10 = v23;
    sub_18EAE703C();
    _os_log_impl(&dword_18EAB1000, v12, v13, "%s: Not currently connected to FaceTime service. We'll wait for the connection to finish posting pending notices.", v14, 0xCu);
    swift_arrayDestroy();
    v17 = v16;
    v3 = v24;
    MEMORY[0x193FF60CC](v17, -1, -1);
    MEMORY[0x193FF60CC](v14, -1, -1);
  }

  sub_18EAC570C(0, (unint64_t *)&unk_1EE12FE30);
  v18 = (void *)sub_18EAE6FD0();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v1;
  aBlock[4] = (uint64_t)sub_18EADE2CC;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_18EAD26EC;
  aBlock[3] = (uint64_t)&block_descriptor_13;
  v20 = _Block_copy(aBlock);
  v21 = v1;
  swift_release();
  sub_18EAE6E8C();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_18EAD7B3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FE40);
  sub_18EAC578C(&qword_1EE12FA50, &qword_1EE12FE40, MEMORY[0x1E0DEAF38]);
  sub_18EAE7060();
  MEMORY[0x193FF5820](0, v10, v6, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v10, v7);
}

uint64_t sub_18EADD018()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[6];

  v1 = sub_18EAE6E74();
  v21 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v2);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_18EAE6EA4();
  v5 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20, v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_18EAE6E80();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18EAC570C(0, (unint64_t *)&unk_1EE12FE30);
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v13, *MEMORY[0x1E0DEF520], v9);
  v14 = (void *)sub_18EAE6FF4();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v0;
  aBlock[4] = sub_18EADE238;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18EAD26EC;
  aBlock[3] = &block_descriptor_4;
  v16 = _Block_copy(aBlock);
  v17 = v0;
  sub_18EAE6E8C();
  v22 = MEMORY[0x1E0DEE9D8];
  sub_18EAD7B3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FE40);
  sub_18EAC578C(&qword_1EE12FA50, &qword_1EE12FE40, MEMORY[0x1E0DEAF38]);
  sub_18EAE7060();
  MEMORY[0x193FF5820](0, v8, v4, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v20);
  return swift_release();
}

void sub_18EADD274(char *a1)
{
  unint64_t v1;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  char **v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *oslog;
  os_log_t osloga;
  uint64_t aBlock[3];
  void *v26;
  void (*v27)(uint64_t);
  uint64_t v28;
  id v29;
  _OWORD v30[2];

  v1 = *(_QWORD *)&a1[OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_attributionIdentifier + 8];
  if (v1)
  {
    v3 = *(_QWORD *)&a1[OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_attributionIdentifier];
    swift_bridgeObjectRetain();
    v4 = sub_18EADC488();
    v5 = objc_msgSend(v4, sel_remoteService);

    if (v5)
    {
      sub_18EAE7054();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v30, 0, sizeof(v30));
    }
    sub_18EADE258((uint64_t)v30, (uint64_t)aBlock);
    if (v26)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FE48);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v9 = v29;
        v10 = &selRef_delegate;
        if (objc_msgSend(v29, sel_respondsToSelector_, sel_initiateTUConversationForAttributionIdentifier_videoEnabled_completion_))
        {
          if (qword_1EE12F5C0 != -1)
            swift_once();
          v11 = sub_18EAE6A18();
          __swift_project_value_buffer(v11, (uint64_t)qword_1EE131138);
          swift_bridgeObjectRetain_n();
          v12 = a1;
          v13 = sub_18EAE6A00();
          v14 = sub_18EAE6F7C();
          if (os_log_type_enabled(v13, v14))
          {
            v15 = swift_slowAlloc();
            osloga = (os_log_t)swift_slowAlloc();
            aBlock[0] = (uint64_t)osloga;
            *(_DWORD *)v15 = 136315394;
            swift_bridgeObjectRetain();
            *(_QWORD *)&v30[0] = sub_18EADDB8C(v3, v1, aBlock);
            sub_18EAE703C();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v15 + 12) = 1024;
            v16 = v12[OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_videoEnabled];

            LODWORD(v30[0]) = v16;
            v10 = &selRef_delegate;
            sub_18EAE703C();

            _os_log_impl(&dword_18EAB1000, v13, v14, "Sending highlight to SLD to initiate FaceTime call for attribution identifier %s with video enabled: %{BOOL}d}", (uint8_t *)v15, 0x12u);
            swift_arrayDestroy();
            MEMORY[0x193FF60CC](osloga, -1, -1);
            MEMORY[0x193FF60CC](v15, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          swift_bridgeObjectRetain();
          v19 = (void *)sub_18EAE6EB0();
          swift_bridgeObjectRelease();
          v20 = v12[OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_videoEnabled];
          v21 = swift_allocObject();
          *(_QWORD *)(v21 + 16) = v3;
          *(_QWORD *)(v21 + 24) = v1;
          v27 = sub_18EADE2C4;
          v28 = v21;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 1107296256;
          aBlock[2] = (uint64_t)sub_18EAD0664;
          v26 = &block_descriptor_7;
          v22 = _Block_copy(aBlock);
          swift_release();
          objc_msgSend(v9, v10[510], v19, v20, v22);
          _Block_release(v22);
          swift_unknownObjectRelease();

        }
        else
        {
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
        }
        return;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_18EACF070((uint64_t)aBlock, (uint64_t *)&unk_1EE12FCB0);
    }
    sub_18EAE6F88();
    v17 = (id)SLFrameworkLogHandle();
    if (v17)
    {
      v18 = v17;
      sub_18EAE69F4();

    }
    else
    {
      __break(1u);
    }
    return;
  }
  if (qword_1EE12F5C0 != -1)
    swift_once();
  v6 = sub_18EAE6A18();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EE131138);
  oslog = sub_18EAE6A00();
  v7 = sub_18EAE6F7C();
  if (os_log_type_enabled(oslog, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_18EAB1000, oslog, v7, "No attribution identifier found, could not start facetime", v8, 2u);
    MEMORY[0x193FF60CC](v8, -1, -1);
  }

}

void sub_18EADD754(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;

  if (qword_1EE12F5C0 != -1)
    swift_once();
  v5 = sub_18EAE6A18();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EE131138);
  swift_bridgeObjectRetain_n();
  v6 = sub_18EAE6A00();
  v7 = sub_18EAE6F7C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v10 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_18EADDB8C(a2, a3, &v10);
    sub_18EAE703C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_18EAB1000, v6, v7, "FaceTime started for attribution with identifier: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x193FF60CC](v9, -1, -1);
    MEMORY[0x193FF60CC](v8, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

id sub_18EADD9B0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CommunicationManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CommunicationManager()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for CommunicationChannel(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_18EADDA98 + 4 * byte_18EAEA395[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_18EADDACC + 4 * byte_18EAEA390[v4]))();
}

uint64_t sub_18EADDACC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18EADDAD4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18EADDADCLL);
  return result;
}

uint64_t sub_18EADDAE8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18EADDAF0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_18EADDAF4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18EADDAFC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CommunicationChannel()
{
  return &type metadata for CommunicationChannel;
}

uint64_t sub_18EADDB18()
{
  return sub_18EAC578C(&qword_1EE12FE18, &qword_1EE12FE20, MEMORY[0x1E0DEAF50]);
}

unint64_t sub_18EADDB48()
{
  unint64_t result;

  result = qword_1EE12FE28;
  if (!qword_1EE12FE28)
  {
    result = MEMORY[0x193FF6024](&unk_18EAEA488, &type metadata for CommunicationChannel);
    atomic_store(result, (unint64_t *)&qword_1EE12FE28);
  }
  return result;
}

uint64_t sub_18EADDB8C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_18EADDC5C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_18EACF194((uint64_t)v12, *a3);
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
      sub_18EACF194((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_18EADDC5C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_18EAE7048();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_18EADDE14(a5, a6);
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
  v8 = sub_18EAE70B4();
  if (!v8)
  {
    sub_18EAE70CC();
    __break(1u);
LABEL_17:
    result = sub_18EAE70F0();
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

uint64_t sub_18EADDE14(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_18EADDEA8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_18EADE080(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_18EADE080(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_18EADDEA8(uint64_t a1, unint64_t a2)
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
      v3 = sub_18EADE01C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_18EAE709C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_18EAE70CC();
      __break(1u);
LABEL_10:
      v2 = sub_18EAE6F10();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_18EAE70F0();
    __break(1u);
LABEL_14:
    result = sub_18EAE70CC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_18EADE01C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE12FE50);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_18EADE080(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE12FE50);
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
  result = sub_18EAE70F0();
  __break(1u);
  return result;
}

uint64_t sub_18EADE1CC()
{
  unint64_t v0;

  v0 = sub_18EAE7108();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_18EADE214()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_18EADE238()
{
  uint64_t v0;

  sub_18EADD274(*(char **)(v0 + 16));
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

uint64_t sub_18EADE258(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE12FCB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18EADE2A0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_18EADE2C4(uint64_t a1)
{
  uint64_t v1;

  sub_18EADD754(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_18EADE2CC()
{
  id v0;

  v0 = sub_18EADC488();
  objc_msgSend(v0, sel_connect);

}

uint64_t sub_18EADE31C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v4 = sub_18EAE6BE0();
  MEMORY[0x1E0C80A78](v4, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v8 - v6, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_18EAE6BEC();
}

uint64_t sub_18EADE3E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v5 = sub_18EAE6BE0();
  MEMORY[0x1E0C80A78](v5, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v9 - v7, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_18EAE6BEC();
}

uint64_t sub_18EADE4A4(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t TupleTypeMetadata;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;

  v4 = a1;
  v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    TupleTypeMetadata = *v5;
    MEMORY[0x1E0C80A78](a1, 1);
    v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_12:
    v23 = 32;
    v24 = a2;
    do
    {
      if (a2 == 1)
        v25 = 0;
      else
        v25 = *(_DWORD *)(TupleTypeMetadata + v23);
      v27 = *v5++;
      v26 = v27;
      v28 = *v4++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(&v8[v25], v28);
      v23 += 16;
      --v24;
    }
    while (v24);
    return sub_18EAE6E68();
  }
  MEMORY[0x1E0C80A78](a1, a2);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v11 = 0;
    if (a2 < 4)
      goto LABEL_9;
    if ((unint64_t)(v10 - (char *)v5) < 0x20)
      goto LABEL_9;
    v11 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    v12 = (__int128 *)(v5 + 2);
    v13 = v10 + 16;
    v14 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 4;
    }
    while (v14);
    if (v11 != a2)
    {
LABEL_9:
      v16 = a2 - v11;
      v17 = v11;
      v18 = &v10[8 * v11];
      v19 = &v5[v17];
      do
      {
        v20 = *v19++;
        *(_QWORD *)v18 = v20;
        v18 += 8;
        --v16;
      }
      while (v16);
    }
  }
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  MEMORY[0x1E0C80A78](TupleTypeMetadata, v21);
  v8 = (char *)&v30 - v22;
  if (a2)
    goto LABEL_12;
  return sub_18EAE6E68();
}

uint64_t sub_18EADE658()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAE8);
  return sub_18EAE6E08();
}

uint64_t sub_18EADE6B0()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FAE8);
  sub_18EAE6E14();
  return v1;
}

uint64_t sub_18EADE708@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v11;
  uint64_t v12;

  v7 = type metadata accessor for _CollaborationDetailView(0, a2, a3, a3);
  v8 = (char *)a4 + *(int *)(v7 + 40);
  sub_18EAE6DFC();
  *v8 = v11;
  *((_QWORD *)v8 + 1) = v12;
  swift_getObjectType();
  sub_18EAE12D0();
  *a4 = sub_18EAE6A9C();
  a4[1] = v9;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))((char *)a4 + *(int *)(v7 + 36), a1, a2);
}

void _CollaborationDetailView.init(itemProvider:listContent:)(void *a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;

  MEMORY[0x1E0C80A78](a1, a2);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_allocWithZone((Class)type metadata accessor for CollaborationDetailViewModel(0));
  v12 = a1;
  CollaborationDetailViewModel.init(itemProvider:)(v12);
  a2();
  sub_18EADE708((uint64_t)v11, a3, a4, a5);

}

void _CollaborationDetailView.init(itemProvider:contentTitle:collaborators:listContent:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(uint64_t)@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v24 = a5;
  v25 = a8;
  v23[1] = a6;
  MEMORY[0x1E0C80A78](a1, a2);
  v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = objc_allocWithZone((Class)type metadata accessor for CollaborationDetailViewModel(0));
  v18 = a1;
  v19 = CollaborationDetailViewModel.init(itemProvider:)(v18);
  swift_getKeyPath();
  swift_getKeyPath();
  v26 = a2;
  v27 = a3;
  v20 = v19;
  sub_18EAE6A6C();
  swift_getKeyPath();
  swift_getKeyPath();
  v26 = a4;
  v21 = v20;
  v22 = sub_18EAE6A6C();
  v24(v22);
  sub_18EADE708((uint64_t)v16, a7, v25, a9);

}

uint64_t _CollaborationDetailView.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t OpaqueTypeConformance2;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void (*v27)(char *, uint64_t);
  void (*v28)(char *, char *, uint64_t);
  uint64_t v30;
  char *v31;
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v31 = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE78);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE88);
  sub_18EAE6BF8();
  swift_getTupleTypeMetadata2();
  sub_18EAE6E5C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE90);
  sub_18EAE6AA8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE98);
  sub_18EAE6AA8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EE12FEA0);
  swift_getTupleTypeMetadata3();
  v3 = sub_18EAE6E5C();
  v4 = MEMORY[0x193FF6024](MEMORY[0x1E0CE0680], v3);
  v35 = MEMORY[0x1E0DEDCF8];
  v36 = v4;
  v5 = sub_18EAE6D00();
  v6 = MEMORY[0x193FF6024](MEMORY[0x1E0CDD950], v5);
  v33 = v5;
  v34 = v6;
  v7 = MEMORY[0x193FF5FD0](255, &v33, MEMORY[0x1E0CDEC60], 0);
  v33 = v5;
  v34 = v6;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v33 = v7;
  v34 = OpaqueTypeConformance2;
  v9 = MEMORY[0x1E0CDE0D0];
  v10 = MEMORY[0x193FF5FD0](255, &v33, MEMORY[0x1E0CDE0D0], 0);
  v33 = v7;
  v34 = OpaqueTypeConformance2;
  v11 = swift_getOpaqueTypeConformance2();
  v33 = v10;
  v34 = v11;
  MEMORY[0x193FF5FD0](255, &v33, v9, 0);
  v12 = sub_18EAE6AA8();
  v33 = v10;
  v34 = v11;
  v32[0] = swift_getOpaqueTypeConformance2();
  v32[1] = MEMORY[0x1E0CDA228];
  v13 = MEMORY[0x193FF6024](MEMORY[0x1E0CD9C20], v12, v32);
  v33 = v12;
  v34 = v13;
  v14 = MEMORY[0x193FF5FD0](0, &v33, MEMORY[0x1E0CDE3D8], 0);
  v15 = *(_QWORD *)(v14 - 8);
  v17 = MEMORY[0x1E0C80A78](v14, v16);
  v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x1E0C80A78](v17, v20);
  v23 = (char *)&v30 - v22;
  MEMORY[0x1E0C80A78](v21, v24);
  v26 = (char *)&v30 - v25;
  sub_18EADED58(a1, v19);
  v33 = v12;
  v34 = v13;
  swift_getOpaqueTypeConformance2();
  sub_18EADF4A8((uint64_t)v19, v14, (uint64_t)v23);
  v27 = *(void (**)(char *, uint64_t))(v15 + 8);
  v27(v19, v14);
  v28 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v28(v26, v23, v14);
  v27(v23, v14);
  v28(v31, v26, v14);
  return ((uint64_t (*)(char *, uint64_t))v27)(v26, v14);
}

uint64_t sub_18EADED58@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  uint64_t OpaqueTypeConformance2;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  char *v37;
  unsigned __int8 v38;
  unsigned __int8 v39;
  id v40;
  char *v41;
  id v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  void (*v48)(char *, char *, uint64_t);
  void (*v49)(char *, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[2];
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v54 = a1;
  v70 = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE78);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE88);
  v53 = *(_QWORD *)(a1 + 16);
  sub_18EAE6BF8();
  swift_getTupleTypeMetadata2();
  sub_18EAE6E5C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE90);
  sub_18EAE6AA8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE98);
  sub_18EAE6AA8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EE12FEA0);
  swift_getTupleTypeMetadata3();
  v3 = sub_18EAE6E5C();
  v51 = MEMORY[0x193FF6024](MEMORY[0x1E0CE0680], v3);
  v75 = MEMORY[0x1E0DEDCE8];
  v76 = v3;
  v77 = MEMORY[0x1E0DEDCF8];
  v78 = v51;
  v4 = sub_18EAE6D00();
  v52 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v51 - v6;
  v8 = MEMORY[0x193FF6024](MEMORY[0x1E0CDD950], v4);
  v75 = v4;
  v76 = v8;
  v9 = MEMORY[0x193FF5FD0](0, &v75, MEMORY[0x1E0CDEC60], 0);
  v55 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v51 - v11;
  v75 = v4;
  v76 = v8;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v75 = v9;
  v76 = OpaqueTypeConformance2;
  v14 = MEMORY[0x1E0CDE0D0];
  v15 = MEMORY[0x193FF5FD0](0, &v75, MEMORY[0x1E0CDE0D0], 0);
  v60 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15, v16);
  v59 = (char *)&v51 - v17;
  v75 = v9;
  v76 = OpaqueTypeConformance2;
  v18 = swift_getOpaqueTypeConformance2();
  v75 = v15;
  v76 = v18;
  v19 = MEMORY[0x193FF5FD0](0, &v75, v14, 0);
  v68 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19, v19);
  v66 = (char *)&v51 - v20;
  v69 = v21;
  v22 = sub_18EAE6AA8();
  v67 = *(_QWORD *)(v22 - 8);
  v24 = MEMORY[0x1E0C80A78](v22, v23);
  v65 = (char *)&v51 - v25;
  v75 = v15;
  v76 = v18;
  v57 = v18;
  v26 = v24;
  v58 = swift_getOpaqueTypeConformance2();
  v74[0] = v58;
  v74[1] = MEMORY[0x1E0CDA228];
  v27 = MEMORY[0x193FF6024](MEMORY[0x1E0CD9C20], v26, v74);
  v75 = v26;
  v76 = v27;
  v62 = v27;
  v28 = MEMORY[0x193FF5FD0](0, &v75, MEMORY[0x1E0CDE3D8], 0);
  v64 = *(_QWORD *)(v28 - 8);
  v30 = MEMORY[0x1E0C80A78](v28, v29);
  v61 = (char *)&v51 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v30, v32);
  v63 = (char *)&v51 - v33;
  v34 = *(_QWORD *)(v54 + 24);
  v71 = v53;
  v72 = v34;
  v73 = v56;
  sub_18EAE6CF4();
  sub_18EAE6D84();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v7, v4);
  LOBYTE(v8) = sub_18EAE6CAC();
  sub_18EAE6CC4();
  sub_18EAE6CC4();
  if (sub_18EAE6CC4() != v8)
    sub_18EAE6CC4();
  v35 = (void *)objc_opt_self();
  v36 = objc_msgSend(v35, sel_currentDevice, v51);
  objc_msgSend(v36, sel_userInterfaceIdiom);

  v37 = v59;
  sub_18EAE6D54();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v12, v9);
  v38 = sub_18EAE6C94();
  v39 = sub_18EAE6CB8();
  sub_18EAE6CC4();
  sub_18EAE6CC4();
  if (sub_18EAE6CC4() != v38)
    sub_18EAE6CC4();
  sub_18EAE6CC4();
  if (sub_18EAE6CC4() != v39)
    sub_18EAE6CC4();
  v40 = objc_msgSend(v35, sel_currentDevice);
  objc_msgSend(v40, sel_userInterfaceIdiom);

  v41 = v66;
  sub_18EAE6D54();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v37, v15);
  v42 = objc_msgSend(v35, sel_currentDevice);
  objc_msgSend(v42, sel_userInterfaceIdiom);

  sub_18EAE6E50();
  v43 = v69;
  v44 = v65;
  sub_18EAE6D90();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v41, v43);
  v45 = v61;
  sub_18EAE6D6C();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v44, v26);
  v47 = v63;
  v46 = v64;
  v48 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
  v48(v63, v45, v28);
  v49 = *(void (**)(char *, uint64_t))(v46 + 8);
  v49(v45, v28);
  v48(v70, v47, v28);
  return ((uint64_t (*)(char *, uint64_t))v49)(v47, v28);
}

uint64_t sub_18EADF4A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *);
  uint64_t v10;

  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1, a1);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void (**)(char *))(v5 + 16);
  v8(v7);
  ((void (*)(uint64_t, char *, uint64_t))v8)(a3, v7, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, a2);
}

uint64_t sub_18EADF538@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(char *, char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, char *, uint64_t);
  void (*v51)(char *, _QWORD, uint64_t, uint64_t);
  char *v52;
  uint64_t v53;
  uint64_t KeyPath;
  uint64_t v55;
  uint64_t *v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t);
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  void (*v79)(char *, char *, uint64_t);
  char *v80;
  void (*v81)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  void (*v94)(uint64_t, _QWORD, uint64_t, uint64_t);
  void (*v95)(char *, char *, uint64_t);
  uint64_t v96;
  char *v97;
  uint64_t v98;
  char *v99;
  void (*v100)(char *, uint64_t);
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void (*v105)(char *, char *, uint64_t);
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void (**v118)(char *, char *, uint64_t);
  uint64_t v119;
  uint64_t v120;
  char *v121;
  char *v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  _QWORD v127[3];
  uint64_t v128[3];
  _QWORD v129[2];
  _QWORD v130[2];

  v114 = a3;
  v119 = a1;
  v112 = a4;
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FF28);
  MEMORY[0x1E0C80A78](v96, v5);
  v99 = (char *)&v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FF30);
  MEMORY[0x1E0C80A78](v7, v8);
  v98 = (uint64_t)&v94 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FF38);
  v109 = *(_QWORD *)(v117 - 8);
  MEMORY[0x1E0C80A78](v117, v10);
  v97 = (char *)&v94 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = __swift_instantiateConcreteTypeFromMangledName(qword_1EE12FEA0);
  v13 = MEMORY[0x1E0C80A78](v110, v12);
  v111 = (uint64_t)&v94 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13, v15);
  v116 = (uint64_t)&v94 - v16;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE88);
  sub_18EAE6BF8();
  swift_getTupleTypeMetadata2();
  v17 = sub_18EAE6E5C();
  v18 = *(_QWORD *)(v17 - 8);
  v104 = v17;
  v106 = v18;
  MEMORY[0x1E0C80A78](v17, v19);
  v103 = (uint64_t)&v94 - v20;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE90);
  v105 = (void (*)(char *, char *, uint64_t))sub_18EAE6AA8();
  v115 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE98);
  v123 = sub_18EAE6AA8();
  v107 = *(_QWORD *)(v123 - 8);
  v22 = MEMORY[0x1E0C80A78](v123, v21);
  v122 = (char *)&v94 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v22, v24);
  v121 = (char *)&v94 - v25;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FF40);
  MEMORY[0x1E0C80A78](v26, v27);
  v113 = (char *)&v94 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FF48);
  MEMORY[0x1E0C80A78](v29, v30);
  v32 = (char *)&v94 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_18EAE6B08();
  v34 = *(char **)(v33 - 8);
  MEMORY[0x1E0C80A78](v33, v35);
  v37 = (char *)&v94 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FF50);
  v118 = *(void (***)(char *, char *, uint64_t))(v102 - 8);
  MEMORY[0x1E0C80A78](v102, v38);
  v40 = (void (*)(char *, uint64_t))((char *)&v94 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FE78);
  v43 = MEMORY[0x1E0C80A78](v41, v42);
  v45 = (void (**)(char *, char *, uint64_t))((char *)&v94 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v43, v46);
  v120 = (uint64_t)&v94 - v47;
  v114 = type metadata accessor for _CollaborationDetailView(0, a2, v114, v48);
  v100 = v40;
  sub_18EADFF44();
  sub_18EAE6AFC();
  v49 = &v32[*(int *)(v29 + 36)];
  v101 = v34;
  v50 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v34 + 2);
  v50(v49, v37, v33);
  v51 = (void (*)(char *, _QWORD, uint64_t, uint64_t))*((_QWORD *)v34 + 7);
  v51(v49, 0, 1, v33);
  v52 = (char *)v40;
  v53 = v102;
  v118[2](v32, v52, v102);
  KeyPath = swift_getKeyPath();
  v55 = (uint64_t)v113;
  v95 = v50;
  v50(v113, v37, v33);
  v94 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v51;
  v51((char *)v55, 0, 1, v33);
  v108 = v41;
  v56 = (uint64_t *)((char *)v45 + *(int *)(v41 + 36));
  sub_18EACEF08(v55, (uint64_t)v56 + *(int *)(v115 + 28), &qword_1EE12FF40);
  *v56 = KeyPath;
  sub_18EACEF08((uint64_t)v32, (uint64_t)v45, &qword_1EE12FF48);
  sub_18EACF070(v55, &qword_1EE12FF40);
  sub_18EACF070((uint64_t)v32, &qword_1EE12FF48);
  v57 = (void (*)(char *, uint64_t))*((_QWORD *)v101 + 1);
  v58 = v119;
  v57(v37, v33);
  ((void (*)(_QWORD, uint64_t))v118[1])(v100, v53);
  v118 = v45;
  sub_18EAD20BC((uint64_t)v45, v120, &qword_1EE12FE78);
  v59 = v103;
  sub_18EADFFA4(v114, v103);
  sub_18EAE6AFC();
  v60 = v104;
  v61 = MEMORY[0x193FF6024](MEMORY[0x1E0CE0680], v104);
  v62 = v122;
  sub_18EAE6D78();
  v101 = v37;
  v102 = v33;
  v100 = v57;
  v57(v37, v33);
  (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v59, v60);
  v63 = sub_18EAC578C(&qword_1EE12FF58, &qword_1EE12FE90, MEMORY[0x1E0CDBEF0]);
  v130[0] = v61;
  v130[1] = v63;
  v64 = MEMORY[0x1E0CD9C20];
  v65 = MEMORY[0x193FF6024](MEMORY[0x1E0CD9C20], v105, v130);
  v66 = sub_18EAC578C(&qword_1EE12FF60, &qword_1EE12FE98, MEMORY[0x1E0CDCF80]);
  v129[0] = v65;
  v129[1] = v66;
  v67 = v64;
  v68 = v123;
  v106 = MEMORY[0x193FF6024](v67, v123, v129);
  v69 = v107;
  v105 = *(void (**)(char *, char *, uint64_t))(v107 + 16);
  v105(v121, v62, v68);
  v70 = *(void (**)(char *, uint64_t))(v69 + 8);
  v70(v62, v68);
  v71 = *(void **)(v58 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v72 = v71;
  sub_18EAE6A60();

  swift_release();
  swift_release();
  v73 = 1;
  if (LOBYTE(v128[0]) == 1)
  {
    v74 = v98;
    sub_18EAE0410(v114, v98);
    v75 = v101;
    sub_18EAE6AFC();
    v76 = (uint64_t)v99;
    v77 = &v99[*(int *)(v96 + 36)];
    v78 = v102;
    v79 = v95;
    v95(v77, v75, v102);
    v80 = v77;
    v81 = v94;
    v94((uint64_t)v80, 0, 1, v78);
    sub_18EACEF08(v74, v76, &qword_1EE12FF30);
    v82 = swift_getKeyPath();
    v83 = (uint64_t)v113;
    v79(v113, v75, v78);
    v81(v83, 0, 1, v78);
    v84 = (uint64_t)v97;
    v85 = (uint64_t *)&v97[*(int *)(v117 + 36)];
    sub_18EACEF08(v83, (uint64_t)v85 + *(int *)(v115 + 28), &qword_1EE12FF40);
    *v85 = v82;
    sub_18EACEF08(v76, v84, &qword_1EE12FF28);
    sub_18EACF070(v83, &qword_1EE12FF40);
    sub_18EACF070(v76, &qword_1EE12FF28);
    v100(v75, v78);
    sub_18EACF070(v74, &qword_1EE12FF30);
    sub_18EAD20BC(v84, v116, &qword_1EE12FF38);
    v73 = 0;
  }
  v86 = v116;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v109 + 56))(v116, v73, 1, v117);
  v87 = v120;
  v88 = (uint64_t)v118;
  sub_18EACEF08(v120, (uint64_t)v118, &qword_1EE12FE78);
  v128[0] = v88;
  v90 = v121;
  v89 = (uint64_t)v122;
  v91 = v123;
  v105(v122, v121, v123);
  v128[1] = v89;
  v92 = v111;
  sub_18EACEF08(v86, v111, qword_1EE12FEA0);
  v128[2] = v92;
  v127[0] = v108;
  v127[1] = v91;
  v127[2] = v110;
  v124 = sub_18EAE1D3C();
  v125 = v106;
  v126 = sub_18EAE2120(&qword_1EE12FFC8, qword_1EE12FEA0, (uint64_t (*)(void))sub_18EAE2000);
  sub_18EADE4A4(v128, 3uLL, (uint64_t)v127);
  sub_18EACF070(v86, qword_1EE12FEA0);
  v70(v90, v91);
  sub_18EACF070(v87, &qword_1EE12FE78);
  sub_18EACF070(v92, qword_1EE12FEA0);
  v70((char *)v89, v91);
  return sub_18EACF070(v88, &qword_1EE12FE78);
}

uint64_t sub_18EADFF44()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FF88);
  sub_18EAE1EB4();
  return sub_18EAE6E44();
}

uint64_t sub_18EADFFA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  char v30;
  char *v31;
  uint64_t v32;
  char *v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  char *v41;
  void (*v42)(char *, uint64_t);
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  char v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  char v57;
  __int128 v58;
  _QWORD v59[4];
  _QWORD v60[2];
  char v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  char v65;
  __int128 v66;

  v48 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE88);
  v5 = *(_QWORD *)(a1 + 16);
  v44 = v4;
  v6 = sub_18EAE6BF8();
  v47 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6, v7);
  v46 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v8, v10);
  v45 = (char *)&v44 - v12;
  v13 = *(_QWORD *)(v5 - 8);
  v15 = MEMORY[0x1E0C80A78](v11, v14);
  v17 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v15, v18);
  v21 = (char *)&v44 - v20;
  v23 = MEMORY[0x1E0C80A78](v19, v22);
  v25 = (char *)&v44 - v24;
  MEMORY[0x1E0C80A78](v23, v26);
  v27 = v2 + *(int *)(a1 + 36);
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v28((char *)&v44 - v29, v27, v5);
  v30 = swift_dynamicCast();
  v28(v25, v27, v5);
  if (swift_dynamicCast())
  {
    v31 = v49;
    v32 = sub_18EAE6E2C();
    v33 = v31;
    objc_msgSend(v33, sel_frame);
    v35 = v34;
    objc_msgSend(v33, sel_frame);
    objc_msgSend(v33, sel_systemLayoutSizeFittingSize_, v35, v36);
    sub_18EAE6E50();
    sub_18EAE6A90();
    v49 = v33;
    v50 = v32;
    v51 = 0u;
    v52 = 0u;
    v53 = 0;
    v54 = v62;
    v55 = v63;
    v56 = v64;
    v57 = v65;
    v58 = v66;
    sub_18EAE2834(&qword_1EE130078, &qword_1EE12FE88, (uint64_t (*)(void))sub_18EAE289C, MEMORY[0x1E0CD8D70]);
    v37 = *(_QWORD *)(a1 + 24);
    swift_retain();
    v38 = v45;
    sub_18EADE31C((uint64_t)&v49, v44);
    swift_release_n();

  }
  else
  {
    v37 = *(_QWORD *)(a1 + 24);
    v28(v21, v27, v5);
    v28(v17, (uint64_t)v21, v5);
    sub_18EAE2834(&qword_1EE130078, &qword_1EE12FE88, (uint64_t (*)(void))sub_18EAE289C, MEMORY[0x1E0CD8D70]);
    v38 = v45;
    sub_18EADE3E0((uint64_t)v17, v44, v5);
    v39 = *(void (**)(char *, uint64_t))(v13 + 8);
    v39(v17, v5);
    v39(v21, v5);
  }
  v61 = v30;
  v49 = &v61;
  v40 = v47;
  v41 = v46;
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v46, v38, v6);
  v50 = (uint64_t)v41;
  v60[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FE80);
  v60[1] = v6;
  v59[2] = sub_18EAE29E8();
  v59[0] = sub_18EAE2834(&qword_1EE130078, &qword_1EE12FE88, (uint64_t (*)(void))sub_18EAE289C, MEMORY[0x1E0CD8D70]);
  v59[1] = v37;
  v59[3] = MEMORY[0x193FF6024](MEMORY[0x1E0CDB8A0], v6, v59);
  sub_18EADE4A4((uint64_t *)&v49, 2uLL, (uint64_t)v60);
  v42 = *(void (**)(char *, uint64_t))(v40 + 8);
  v42(v38, v6);
  return ((uint64_t (*)(char *, uint64_t))v42)(v41, v6);
}

uint64_t sub_18EAE0410@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  _QWORD v26[4];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12F8C8);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for CollaborationInfo(0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(void **)(v2 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v15 = v14;
  sub_18EAE6A60();

  swift_release();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_18EACF070((uint64_t)v8, &qword_1EE12F8C8);
  }
  else
  {
    sub_18EACEE7C((uint64_t)v8, (uint64_t)v13);
    swift_getKeyPath();
    swift_getKeyPath();
    v16 = v15;
    sub_18EAE6A60();

    swift_release();
    v17 = swift_release();
    if (LOBYTE(v26[0]) == 1)
    {
      MEMORY[0x1E0C80A78](v17, v18);
      *(_OWORD *)&v26[-4] = *(_OWORD *)(a1 + 16);
      v26[-2] = v2;
      v26[-1] = v13;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE130058);
      v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FFF8);
      v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE130000);
      v21 = sub_18EAC578C(&qword_1EE130008, &qword_1EE12FFF8, MEMORY[0x1E0CDFA58]);
      v22 = sub_18EAE2834(&qword_1EE130010, &qword_1EE130000, (uint64_t (*)(void))sub_18EAE2280, MEMORY[0x1E0CDC500]);
      v26[0] = v19;
      v26[1] = v20;
      v26[2] = v21;
      v26[3] = v22;
      swift_getOpaqueTypeConformance2();
      sub_18EAE6E44();
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FFF0);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(a2, 0, 1, v23);
      return sub_18EACEBCC((uint64_t)v13);
    }
    sub_18EACEBCC((uint64_t)v13);
  }
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FFF0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(a2, 1, 1, v25);
}

double sub_18EAE06EC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double result;
  char v9;
  uint64_t v10;

  v3 = *(id *)(a1 + 8);
  sub_18EAE6DFC();
  type metadata accessor for CollaborationDetailViewModel(0);
  sub_18EAE12D0();
  v4 = sub_18EAE6A9C();
  v6 = v5;
  v7 = sub_18EAE6E2C();
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v9;
  *(_QWORD *)(a2 + 24) = v10;
  *(_QWORD *)(a2 + 32) = v7;
  result = 0.0;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_BYTE *)(a2 + 72) = 0;
  return result;
}

uint64_t sub_18EAE07A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t);
  void (*v38)(uint64_t, char *, uint64_t);
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v43 = a2;
  v46 = a5;
  v8 = type metadata accessor for CollaborationInfo(0);
  v9 = *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64);
  v41 = *(_QWORD *)(v8 - 8);
  v42 = v9;
  MEMORY[0x1E0C80A78](v8, v10);
  v40 = (uint64_t)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for _CollaborationDetailView(0, a3, a4, v12);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x1E0C80A78](v13, v16);
  v18 = (char *)&v33 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FFF8);
  v20 = *(_QWORD *)(v19 - 8);
  v44 = v19;
  v45 = v20;
  MEMORY[0x1E0C80A78](v19, v21);
  v39 = (char *)&v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v37(v18, a1, v13);
  v23 = *(unsigned __int8 *)(v14 + 80);
  v24 = (v23 + 32) & ~v23;
  v36 = v23 | 7;
  v25 = swift_allocObject();
  v34 = a4;
  v35 = a3;
  *(_QWORD *)(v25 + 16) = a3;
  *(_QWORD *)(v25 + 24) = a4;
  v38 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 32);
  v38(v25 + v24, v18, v13);
  v47 = a3;
  v48 = a4;
  v49 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE130060);
  sub_18EAC578C(&qword_1EE130068, &qword_1EE130060, MEMORY[0x1E0CDFB10]);
  sub_18EAE6E20();
  sub_18EADE6B0();
  v37(v18, a1, v13);
  v26 = v40;
  sub_18EACEDDC(v43, v40);
  v27 = (v24 + v15 + *(unsigned __int8 *)(v41 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  v28 = swift_allocObject();
  v29 = v34;
  *(_QWORD *)(v28 + 16) = v35;
  *(_QWORD *)(v28 + 24) = v29;
  v38(v28 + v24, v18, v13);
  sub_18EACEE7C(v26, v28 + v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE130000);
  sub_18EAC578C(&qword_1EE130008, &qword_1EE12FFF8, MEMORY[0x1E0CDFA58]);
  sub_18EAE2834(&qword_1EE130010, &qword_1EE130000, (uint64_t (*)(void))sub_18EAE2280, MEMORY[0x1E0CDC500]);
  v30 = v44;
  v31 = v39;
  sub_18EAE6DA8();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v31, v30);
}

__n128 sub_18EAE0AC4@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  __n128 result;
  __int128 v11;
  __int128 v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  __n128 v17;
  uint64_t v18;

  v4 = sub_18EAE6AF0();
  sub_18EAE0B5C(a1, (uint64_t)&v12);
  v5 = v13;
  v6 = v14;
  v7 = v15;
  v8 = v16;
  v9 = v18;
  result = v17;
  v11 = v12;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(_OWORD *)(a2 + 24) = v11;
  *(_BYTE *)(a2 + 40) = v5;
  *(_QWORD *)(a2 + 48) = v6;
  *(_QWORD *)(a2 + 56) = v7;
  *(_BYTE *)(a2 + 64) = v8;
  *(__n128 *)(a2 + 72) = result;
  *(_QWORD *)(a2 + 88) = v9;
  return result;
}

uint64_t sub_18EAE0B5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t KeyPath;

  v3 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = v3;
  sub_18EAE6A60();

  swift_release();
  swift_release();
  sub_18EAE27A0();
  v5 = sub_18EAE6D30();
  v7 = v6;
  v9 = v8 & 1;
  sub_18EAE6DC0();
  v10 = sub_18EAE6D0C();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  swift_release();
  sub_18EAD1F9C(v5, v7, v9);
  swift_bridgeObjectRelease();
  v17 = sub_18EAE6DD8();
  v18 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v19 = objc_msgSend(v18, sel_userInterfaceIdiom);

  if (v19 == (id)6)
    v20 = sub_18EAE6DC0();
  else
    v20 = sub_18EAE6DB4();
  v21 = v20;
  v22 = v14 & 1;
  KeyPath = swift_getKeyPath();
  *(_QWORD *)a2 = v10;
  *(_QWORD *)(a2 + 8) = v12;
  *(_BYTE *)(a2 + 16) = v22;
  *(_QWORD *)(a2 + 24) = v16;
  *(_QWORD *)(a2 + 32) = 0;
  *(_BYTE *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 48) = v17;
  *(_QWORD *)(a2 + 56) = KeyPath;
  *(_QWORD *)(a2 + 64) = v21;
  sub_18EAD1F8C(v10, v12, v22);
  swift_bridgeObjectRetain();
  sub_18EAD1F9C(v10, v12, v22);
  return swift_bridgeObjectRelease();
}

uint64_t sub_18EAE0D38@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  _BYTE v7[32];

  type metadata accessor for _CollaborationDetailView(0, a2, a3, a3);
  sub_18EAE0DBC(a1);
  LOBYTE(a1) = sub_18EAE6CA0();
  sub_18EACEF08((uint64_t)v7, a4, &qword_1EE130020);
  *(_BYTE *)(a4 + 27) = a1;
  return sub_18EACF070((uint64_t)v7, &qword_1EE130020);
}

uint64_t sub_18EAE0DBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  int EnumCaseMultiPayload;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  _BYTE v27[32];
  id v28;
  char v29;
  id v30;
  id v31;
  id v32;
  char v33;
  char v34;
  char v35;

  v3 = sub_18EAE68BC();
  v4 = *(_QWORD *)(v3 - 8);
  v6 = MEMORY[0x1E0C80A78](v3, v5);
  v8 = v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  MEMORY[0x1E0C80A78](v6, v9);
  v11 = v27 - v10 + 16;
  v12 = type metadata accessor for CollaborationInfo(0);
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  sub_18EACEDDC(a1, (uint64_t)v15);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {

      v35 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE130030);
      sub_18EAE22EC();
      return sub_18EAE6BEC();
    }
    else
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 32))(v11, v15, v3);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 16))(v8, v11, v3);
      v23 = sub_18EAD22D4((uint64_t)v8);
      if (v23)
      {
        v28 = v23;
        v29 = 0;
      }
      else
      {
        v28 = 0;
        v29 = 1;
      }
      sub_18EAD224C();
      sub_18EAE6BEC();
      v24 = v30;
      v25 = (char)v31;
      v34 = 1;
      sub_18EAE26D4(v30, (char)v31);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE130040);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE130050);
      sub_18EAE2358();
      sub_18EAE23C4();
      sub_18EAE6BEC();
      sub_18EACEF08((uint64_t)&v28, (uint64_t)&v30, &qword_1EE130030);
      v35 = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE130030);
      sub_18EAE22EC();
      sub_18EAE6BEC();
      sub_18EAE26E0(v24, v25);
      sub_18EACF070((uint64_t)&v28, &qword_1EE130030);
      return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v11, v3);
    }
  }
  else
  {
    v19 = *(id *)v15;
    v18 = (void *)*((_QWORD *)v15 + 1);
    if (v15[16] == 1)
    {
      v20 = *(_QWORD *)(v1 + 8) + OBJC_IVAR___SWCollaborationDetailViewModel_cloudSharingControllerDelegate;
      swift_beginAccess();
      MEMORY[0x193FF6168](v20);
      swift_unknownObjectWeakInit();
      v21 = v19;
      v22 = v18;
      swift_unknownObjectRelease();
      v31 = v21;
      v32 = v22;
      sub_18EAE26EC((uint64_t)&v30, (uint64_t)&v28);
      sub_18EAE2728((uint64_t)&v28, (uint64_t)&v30);
      v33 = 0;
      sub_18EADBE74();
      sub_18EAE6BEC();
      sub_18EAE2764((uint64_t)&v28);
    }
    else
    {
      v33 = 1;
      sub_18EADBE74();
      sub_18EAE6BEC();
    }
    sub_18EACEF08((uint64_t)v27, (uint64_t)&v30, &qword_1EE130040);
    v34 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE130040);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE130050);
    sub_18EAE2358();
    sub_18EAE23C4();
    sub_18EAE6BEC();
    sub_18EACEF08((uint64_t)&v28, (uint64_t)&v30, &qword_1EE130030);
    v35 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE130030);
    sub_18EAE22EC();
    sub_18EAE6BEC();

    sub_18EACF070((uint64_t)&v28, &qword_1EE130030);
    return sub_18EACF070((uint64_t)v27, &qword_1EE130040);
  }
}

void _CollaborationDetailView<>.init(itemProvider:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v4 = objc_allocWithZone((Class)type metadata accessor for CollaborationDetailViewModel(0));
  v5 = a1;
  CollaborationDetailViewModel.init(itemProvider:)(v5);
  sub_18EAE6DFC();
  sub_18EAE12D0();
  v6 = sub_18EAE6A9C();
  v8 = v7;

  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v8;
  *(_BYTE *)(a2 + 16) = v9;
  *(_QWORD *)(a2 + 24) = v10;
}

unint64_t sub_18EAE12D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE12FB58;
  if (!qword_1EE12FB58)
  {
    v1 = type metadata accessor for CollaborationDetailViewModel(255);
    result = MEMORY[0x193FF6024](&protocol conformance descriptor for CollaborationDetailViewModel, v1);
    atomic_store(result, (unint64_t *)&qword_1EE12FB58);
  }
  return result;
}

uint64_t sub_18EAE1318()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18EAE134C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_18EAE1354()
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

uint64_t *sub_18EAE13D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  id v15;
  unint64_t v16;
  unint64_t v17;

  v3 = a1;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64) + 7;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v10 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
  }
  else
  {
    v11 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = (uint64_t)v11;
    v12 = ((unint64_t)a1 + v6 + 16) & ~v6;
    v13 = ((unint64_t)a2 + v6 + 16) & ~v6;
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    v15 = v11;
    v14(v12, v13, v4);
    v16 = (v7 + v12) & 0xFFFFFFFFFFFFFFF8;
    v17 = (v7 + v13) & 0xFFFFFFFFFFFFFFF8;
    *(_BYTE *)v16 = *(_BYTE *)v17;
    *(_QWORD *)(v16 + 8) = *(_QWORD *)(v17 + 8);
  }
  swift_retain();
  return v3;
}

uint64_t sub_18EAE14C0(uint64_t a1, uint64_t a2)
{

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)
                                                                                            + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
  return swift_release();
}

_QWORD *sub_18EAE1528(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v4 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v11 = v4;
  v10(v8, v9, v5);
  v12 = *(_QWORD *)(v6 + 64) + 7;
  v13 = (v12 + v8) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v12 + v9) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v13 = *(_BYTE *)v14;
  *(_QWORD *)(v13 + 8) = *(_QWORD *)(v14 + 8);
  swift_retain();
  return a1;
}

_QWORD *sub_18EAE15C4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  *a1 = *a2;
  v6 = (void *)a2[1];
  v7 = (void *)a1[1];
  a1[1] = v6;
  v8 = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = ((unint64_t)a1 + v10 + 16) & ~v10;
  v12 = ((unint64_t)a2 + v10 + 16) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v9 + 24))(v11, v12);
  v13 = *(_QWORD *)(v9 + 64) + 7;
  v14 = (v13 + v11) & 0xFFFFFFFFFFFFFFF8;
  v15 = (v13 + v12) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v14 = *(_BYTE *)v15;
  *(_QWORD *)(v14 + 8) = *(_QWORD *)(v15 + 8);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_18EAE1678(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = ((unint64_t)a1 + v5 + 16) & ~v5;
  v7 = ((unint64_t)a2 + v5 + 16) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v6, v7);
  *(_OWORD *)((*(_QWORD *)(v4 + 64) + 7 + v6) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v4 + 64) + 7 + v7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_18EAE16F8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v6 = a2[1];
  v7 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v6;

  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = ((unint64_t)a1 + v9 + 16) & ~v9;
  v11 = ((unint64_t)a2 + v9 + 16) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v10, v11);
  v12 = *(_QWORD *)(v8 + 64) + 7;
  v13 = (v12 + v10) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v12 + v11) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v13 = *(_BYTE *)v14;
  *(_QWORD *)(v13 + 8) = *(_QWORD *)(v14 + 8);
  swift_release();
  return a1;
}

uint64_t sub_18EAE1798(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  if (v6 >= a2)
  {
    if ((v5 & 0x80000000) != 0)
    {
      return (*(uint64_t (**)(uint64_t))(v4 + 48))((a1 + v7 + 16) & ~v7);
    }
    else
    {
      v12 = *(_QWORD *)(a1 + 8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
  }
  else
  {
    if (((((*(_QWORD *)(v4 + 64) + ((v7 + 16) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
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
    return ((uint64_t (*)(void))((char *)&loc_18EAE1824 + 4 * byte_18EAEA520[v10]))();
  }
}

void sub_18EAE18A4(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a3)
  {
    v10 = 0u;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + (((_DWORD)v7 + 16) & ~(_DWORD)v7) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
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
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X13 }
  }
  if (((*(_DWORD *)(v5 + 64) + (((_DWORD)v7 + 16) & ~(_DWORD)v7) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v11 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + ((v7 + 16) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_18EAE19AC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x18EAE1A18);
}

void sub_18EAE19B4(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x18EAE19BCLL);
  JUMPOUT(0x18EAE1A18);
}

void sub_18EAE19D0()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x18EAE1A18);
}

void sub_18EAE19D8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x18EAE1A18);
}

void sub_18EAE19E0(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_WORD *)(v3 + v4) = 0;
  if (a2)
  {
    if (a3 < 0)
      JUMPOUT(0x18EAE19ECLL);
    if (a2 < 0)
      JUMPOUT(0x18EAE1A10);
    *(_QWORD *)(v3 + 8) = (a2 - 1);
  }
  JUMPOUT(0x18EAE1A18);
}

uint64_t type metadata accessor for _CollaborationDetailView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _CollaborationDetailView);
}

uint64_t sub_18EAE1A3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t OpaqueTypeConformance2;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE78);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE88);
  sub_18EAE6BF8();
  swift_getTupleTypeMetadata2();
  sub_18EAE6E5C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE90);
  sub_18EAE6AA8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE98);
  sub_18EAE6AA8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EE12FEA0);
  swift_getTupleTypeMetadata3();
  v0 = sub_18EAE6E5C();
  v1 = MEMORY[0x193FF6024](MEMORY[0x1E0CE0680], v0);
  v15 = MEMORY[0x1E0DEDCF8];
  v16 = v1;
  v2 = sub_18EAE6D00();
  v3 = MEMORY[0x193FF6024](MEMORY[0x1E0CDD950], v2);
  v13 = v2;
  v14 = v3;
  v4 = MEMORY[0x193FF5FD0](255, &v13, MEMORY[0x1E0CDEC60], 0);
  v13 = v2;
  v14 = v3;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v13 = v4;
  v14 = OpaqueTypeConformance2;
  v6 = MEMORY[0x1E0CDE0D0];
  v7 = MEMORY[0x193FF5FD0](255, &v13, MEMORY[0x1E0CDE0D0], 0);
  v13 = v4;
  v14 = OpaqueTypeConformance2;
  v8 = swift_getOpaqueTypeConformance2();
  v13 = v7;
  v14 = v8;
  MEMORY[0x193FF5FD0](255, &v13, v6, 0);
  v9 = sub_18EAE6AA8();
  v13 = v7;
  v14 = v8;
  v12[0] = swift_getOpaqueTypeConformance2();
  v12[1] = MEMORY[0x1E0CDA228];
  v10 = MEMORY[0x193FF6024](MEMORY[0x1E0CD9C20], v9, v12);
  v13 = v9;
  v14 = v10;
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18EAE1C84@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_18EADF538(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_18EAE1C90()
{
  return sub_18EAE6AD8();
}

uint64_t sub_18EAE1CB0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FF40);
  MEMORY[0x1E0C80A78](v2, v3);
  sub_18EACEF08(a1, (uint64_t)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1EE12FF40);
  return sub_18EAE6AE4();
}

unint64_t sub_18EAE1D3C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE12FF68;
  if (!qword_1EE12FF68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE78);
    v2[0] = sub_18EAE1DC0();
    v2[1] = sub_18EAC578C(&qword_1EE12FF60, &qword_1EE12FE98, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE12FF68);
  }
  return result;
}

unint64_t sub_18EAE1DC0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE12FF70;
  if (!qword_1EE12FF70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FF48);
    v2[0] = sub_18EAE1E44();
    v2[1] = sub_18EAC578C(&qword_1EE12FF58, &qword_1EE12FE90, MEMORY[0x1E0CDBEF0]);
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE12FF70);
  }
  return result;
}

unint64_t sub_18EAE1E44()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[3];

  result = qword_1EE12FF78;
  if (!qword_1EE12FF78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FF50);
    v2 = sub_18EAE1EB4();
    v3[0] = MEMORY[0x1E0CE0400];
    v3[1] = v2;
    v3[2] = MEMORY[0x1E0CE0400];
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CDFF98], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EE12FF78);
  }
  return result;
}

unint64_t sub_18EAE1EB4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE12FF80;
  if (!qword_1EE12FF80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FF88);
    v2[0] = sub_18EAE1F38();
    v2[1] = sub_18EAC578C(&qword_1EE12FFB8, &qword_1EE12FFC0, MEMORY[0x1E0CDBEF0]);
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE12FF80);
  }
  return result;
}

unint64_t sub_18EAE1F38()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE12FF90;
  if (!qword_1EE12FF90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FF98);
    v2[0] = sub_18EAE1FBC();
    v2[1] = sub_18EAC578C(&qword_1EE12FFA8, &qword_1EE12FFB0, MEMORY[0x1E0CDBEF0]);
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE12FF90);
  }
  return result;
}

unint64_t sub_18EAE1FBC()
{
  unint64_t result;

  result = qword_1EE12FFA0;
  if (!qword_1EE12FFA0)
  {
    result = MEMORY[0x193FF6024](&unk_18EAE9D70, &type metadata for CollaborationDetailViewHeader);
    atomic_store(result, (unint64_t *)&qword_1EE12FFA0);
  }
  return result;
}

unint64_t sub_18EAE2000()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE12FFD0;
  if (!qword_1EE12FFD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FF38);
    v2[0] = sub_18EAE2084();
    v2[1] = sub_18EAC578C(&qword_1EE12FF60, &qword_1EE12FE98, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE12FFD0);
  }
  return result;
}

unint64_t sub_18EAE2084()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE12FFD8;
  if (!qword_1EE12FFD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FF28);
    v2[0] = sub_18EAE2120(&qword_1EE12FFE0, &qword_1EE12FF30, (uint64_t (*)(void))sub_18EAE2184);
    v2[1] = sub_18EAC578C(&qword_1EE12FF58, &qword_1EE12FE90, MEMORY[0x1E0CDBEF0]);
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE12FFD8);
  }
  return result;
}

uint64_t sub_18EAE2120(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CE0798], v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_18EAE2184()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  _QWORD v3[7];

  result = qword_1EE12FFE8;
  if (!qword_1EE12FFE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FFF0);
    v3[3] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FFF8);
    v3[4] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE130000);
    v3[5] = sub_18EAC578C(&qword_1EE130008, &qword_1EE12FFF8, MEMORY[0x1E0CDFA58]);
    v3[6] = sub_18EAE2834(&qword_1EE130010, &qword_1EE130000, (uint64_t (*)(void))sub_18EAE2280, MEMORY[0x1E0CDC500]);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v3[0] = MEMORY[0x1E0CE0400];
    v3[1] = OpaqueTypeConformance2;
    v3[2] = MEMORY[0x1E0CE0400];
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CDFF98], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EE12FFE8);
  }
  return result;
}

unint64_t sub_18EAE2280()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE130018;
  if (!qword_1EE130018)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE130020);
    v2[0] = sub_18EAE22EC();
    v2[1] = MEMORY[0x1E0CE0400];
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE130018);
  }
  return result;
}

unint64_t sub_18EAE22EC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE130028;
  if (!qword_1EE130028)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE130030);
    v2[0] = sub_18EAE2358();
    v2[1] = sub_18EAE23C4();
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE130028);
  }
  return result;
}

unint64_t sub_18EAE2358()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE130038;
  if (!qword_1EE130038)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE130040);
    v2[0] = sub_18EADBE74();
    v2[1] = MEMORY[0x1E0CE0400];
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE130038);
  }
  return result;
}

unint64_t sub_18EAE23C4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE130048;
  if (!qword_1EE130048)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE130050);
    v2[0] = sub_18EAD224C();
    v2[1] = MEMORY[0x1E0CE0400];
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE130048);
  }
  return result;
}

uint64_t sub_18EAE2438@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_18EAE07A4(v1[4], v1[5], v1[2], v1[3], a1);
}

uint64_t sub_18EAE2444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for _CollaborationDetailView(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = v4 + ((v7 + 32) & ~v7);

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v8 + *(int *)(v6 + 36), v5);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18EAE24DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for _CollaborationDetailView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  return sub_18EADE658();
}

double sub_18EAE2520@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_QWORD *)&result = sub_18EAE0AC4(*(_QWORD *)(v1 + 32), a1).n128_u64[0];
  return result;
}

uint64_t sub_18EAE252C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int EnumCaseMultiPayload;
  id v15;
  uint64_t v16;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for _CollaborationDetailView(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CollaborationInfo(0) - 8) + 80);
  v11 = (v8 + v9 + v10) & ~v10;
  v12 = v4 + v8;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v12 + *(int *)(v6 + 36), v5);
  swift_release();
  v13 = v4 + v11;
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      v16 = sub_18EAE68BC();
      (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v4 + v11, v16);
      break;
    case 1:
      v15 = *(id *)v13;
      goto LABEL_7;
    case 0:

      v15 = *(id *)(v13 + 8);
LABEL_7:

      break;
  }
  return swift_deallocObject();
}

uint64_t sub_18EAE2650@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(_QWORD *)(v2 + 24);
  v6 = *(_QWORD *)(type metadata accessor for _CollaborationDetailView(0, v4, v5, a1) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CollaborationInfo(0) - 8) + 80);
  return sub_18EAE0D38(v2 + ((v7 + v8 + v9) & ~v9), v4, v5, a2);
}

id sub_18EAE26D4(id result, char a2)
{
  if ((a2 & 1) == 0)
    return result;
  return result;
}

void sub_18EAE26E0(id a1, char a2)
{
  if ((a2 & 1) == 0)

}

uint64_t sub_18EAE26EC(uint64_t a1, uint64_t a2)
{
  initializeWithTake for UICloudSharingControllerRepresentable(a2, a1);
  return a2;
}

uint64_t sub_18EAE2728(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for UICloudSharingControllerRepresentable(a2, a1);
  return a2;
}

uint64_t sub_18EAE2764(uint64_t a1)
{
  destroy for UICloudSharingControllerRepresentable(a1);
  return a1;
}

unint64_t sub_18EAE27A0()
{
  unint64_t result;

  result = qword_1EE130070;
  if (!qword_1EE130070)
  {
    result = MEMORY[0x193FF6024](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EE130070);
  }
  return result;
}

uint64_t sub_18EAE27E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_18EAE6AC0();
  *a1 = result;
  return result;
}

uint64_t sub_18EAE280C()
{
  swift_retain();
  return sub_18EAE6ACC();
}

uint64_t sub_18EAE2834(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
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
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CD9C20], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_18EAE289C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE130080;
  if (!qword_1EE130080)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE130088);
    v2[0] = sub_18EAE2920();
    v2[1] = sub_18EAC578C(&qword_1EE12FFB8, &qword_1EE12FFC0, MEMORY[0x1E0CDBEF0]);
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE130080);
  }
  return result;
}

unint64_t sub_18EAE2920()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EE130090;
  if (!qword_1EE130090)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE130098);
    v2[0] = sub_18EAE29A4();
    v2[1] = sub_18EAC578C(&qword_1EE12FFA8, &qword_1EE12FFB0, MEMORY[0x1E0CDBEF0]);
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EE130090);
  }
  return result;
}

unint64_t sub_18EAE29A4()
{
  unint64_t result;

  result = qword_1EE1300A0;
  if (!qword_1EE1300A0)
  {
    result = MEMORY[0x193FF6024](&unk_18EAEA9E0, &type metadata for ListContentViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_1EE1300A0);
  }
  return result;
}

unint64_t sub_18EAE29E8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1EE1300A8;
  if (!qword_1EE1300A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE12FE80);
    v2 = MEMORY[0x1E0CE0400];
    result = MEMORY[0x193FF6024](MEMORY[0x1E0CE0798], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EE1300A8);
  }
  return result;
}

double sub_18EAE2A44@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_18EAE06EC(*(_QWORD *)(v1 + 32), a1);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x193FF5F88](a1, v6, a5);
}

uint64_t sub_18EAE2A7C()
{
  uint64_t v0;

  v0 = sub_18EAE6A18();
  __swift_allocate_value_buffer(v0, qword_1EE131138);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EE131138);
  return sub_18EAE6A0C();
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

uint64_t sub_18EAE2B30()
{
  uint64_t v0;

  v0 = sub_18EAE6A18();
  __swift_allocate_value_buffer(v0, qword_1EE131150);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EE131150);
  return sub_18EAE6A0C();
}

uint64_t sub_18EAE2BB0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18EAE2C2C(void **a1, void **a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = v2;
  v5 = v3;
  return sub_18EAE6A6C();
}

void __swiftcall _SWCollaborationDetailViewController.init(itemProvider:)(_SWCollaborationDetailViewController *__return_ptr retstr, NSItemProvider itemProvider)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithItemProvider_impl_, itemProvider.super.isa);

}

uint64_t _SWCollaborationDetailViewController.setListContent<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
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
  uint64_t *v17;
  id v18;
  uint64_t v20;

  v7 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for _CollaborationDetailView(0, v10, v11, v12);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13, v15);
  v17 = (uint64_t *)((char *)&v20 - v16);
  v18 = objc_msgSend(v3, sel_viewModel);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a2);
  sub_18EADE708((uint64_t)v9, a2, a3, v17);
  sub_18EAE3F3C((uint64_t)v17, a2, a3);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v14 + 8))(v17, v13);
}

uint64_t _SWCollaborationDetailViewController.setListContent<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void (*v7)(void);
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v6 = *(_QWORD *)(a3 - 8);
  v7 = (void (*)(void))MEMORY[0x1E0C80A78](a1, a2);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7();
  _SWCollaborationDetailViewController.setListContent<A>(_:)((uint64_t)v9, a3, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, a3);
}

uint64_t _SWCollaborationDetailViewController.customContentTitle.getter()
{
  void *v0;
  id v1;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();

  swift_release();
  swift_release();
  return v3;
}

uint64_t _SWCollaborationDetailViewController.customContentTitle.setter()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(v0, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  return sub_18EAE6A6C();
}

uint64_t _SWCollaborationDetailViewController.customCollaborators.getter()
{
  return sub_18EAE4B98();
}

uint64_t _SWCollaborationDetailViewController.customCollaborators.setter()
{
  return sub_18EAE4CC8();
}

void __swiftcall _SWCollaborationDetailViewController.init(highlight:listContent:)(_SWCollaborationDetailViewController *__return_ptr retstr, SWHighlight_optional highlight, UIView *listContent)
{
  NSSecureCoding *identifier;
  Class isa;

  identifier = highlight.value._identifier;
  isa = highlight.value.super.isa;
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithHighlight_listContent_, highlight.value.super.isa, highlight.value._identifier);

}

id sub_18EAE3014(void *a1, void *a2)
{
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char v20;
  uint64_t v21;

  v4 = objc_allocWithZone((Class)type metadata accessor for CollaborationDetailViewModel(0));
  v5 = sub_18EACD254(a1);
  v6 = a2;
  v7 = v5;
  sub_18EAE6DFC();
  v8 = v17;
  v9 = v18;
  sub_18EAE12D0();
  v10 = sub_18EAE6A9C();
  v12 = v11;
  v17 = v10;
  v18 = (uint64_t)v11;
  v19 = v6;
  v20 = v8;
  v21 = v9;
  swift_retain();
  v13 = v12;
  v14 = v6;
  v15 = sub_18EAE5880(v7, (uint64_t)&v17);
  swift_release_n();

  return v15;
}

id _SWCollaborationDetailViewController.init<A>(highlight:listContent:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;

  v7 = sub_18EAE569C(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a2, a3);

  return v7;
}

id _SWCollaborationDetailViewController.init<A>(highlight:listContent:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;

  v6 = sub_18EAE57D4(a1, a2, a3, a4, a5);

  return v6;
}

void __swiftcall _SWCollaborationDetailViewController.init(highlight:)(_SWCollaborationDetailViewController *__return_ptr retstr, SWHighlight_optional highlight)
{
  Class isa;

  isa = highlight.value.super.isa;
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithHighlight_, highlight.value.super.isa);

}

void sub_18EAE31E4(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  char *v26;
  __n128 v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;

  v5 = v4;
  v10 = sub_18EAE6C7C();
  MEMORY[0x1E0C80A78](v10, v11);
  v12 = objc_msgSend(v5, sel_typeErasedHostingController);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, sel_willMoveToParentViewController_, 0);

  }
  v14 = objc_msgSend(v5, sel_typeErasedHostingController);
  objc_msgSend(v14, sel_removeFromParentViewController);

  v15 = objc_msgSend(v5, sel_typeErasedHostingController);
  if (!v15)
  {
LABEL_6:
    v69 = a2;
    LOBYTE(v70) = a3 & 1;
    objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE1300C0));
    swift_retain();
    v18 = a2;
    v19 = (id)sub_18EAE6B38();
    v20 = objc_msgSend(v19, sel_view, a1, v69, v70, a4);
    if (v20)
    {
      v21 = v20;
      v22 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
      objc_msgSend(v21, sel_setBackgroundColor_, v22);

      sub_18EAE6C70();
      sub_18EAE6B20();
      v23 = (void *)objc_opt_self();
      v24 = v19;
      v25 = objc_msgSend(v23, sel_currentDevice);
      v26 = (char *)objc_msgSend(v25, sel_userInterfaceIdiom);

      if ((unint64_t)(v26 - 1) > 5)
        v27.n128_u64[0] = 0x4072480000000000;
      else
        v27.n128_u64[0] = qword_18EAEAAC8[(_QWORD)(v26 - 1)];
      objc_msgSend(v24, sel_setPreferredContentSize_, CGSizeMake(v27), 0.0);

      objc_msgSend(v5, sel_addChildViewController_, v24);
      v28 = objc_msgSend(v5, sel_view);
      if (v28)
      {
        v29 = v28;
        v30 = objc_msgSend(v24, sel_view);
        if (v30)
        {
          v31 = v30;
          objc_msgSend(v29, sel_addSubview_, v30);

          objc_msgSend(v24, sel_didMoveToParentViewController_, v5);
          v32 = objc_msgSend(v24, sel_view);
          if (v32)
          {
            v33 = v32;
            objc_msgSend(v32, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

            __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FCE8);
            v34 = swift_allocObject();
            *(_OWORD *)(v34 + 16) = xmmword_18EAEA0B0;
            v35 = objc_msgSend(v24, sel_view);
            if (v35)
            {
              v36 = v35;
              v37 = objc_msgSend(v35, sel_topAnchor);

              v38 = objc_msgSend(v5, sel_view);
              if (v38)
              {
                v39 = v38;
                v40 = objc_msgSend(v38, sel_safeAreaLayoutGuide);

                v41 = objc_msgSend(v40, sel_topAnchor);
                v42 = objc_msgSend(v37, sel_constraintEqualToAnchor_, v41);

                *(_QWORD *)(v34 + 32) = v42;
                v43 = objc_msgSend(v24, sel_view);
                if (v43)
                {
                  v44 = v43;
                  v45 = objc_msgSend(v43, sel_bottomAnchor);

                  v46 = objc_msgSend(v5, sel_view);
                  if (v46)
                  {
                    v47 = v46;
                    v48 = objc_msgSend(v46, sel_safeAreaLayoutGuide);

                    v49 = objc_msgSend(v48, sel_bottomAnchor);
                    v50 = objc_msgSend(v45, sel_constraintEqualToAnchor_, v49);

                    *(_QWORD *)(v34 + 40) = v50;
                    v51 = objc_msgSend(v24, sel_view);
                    if (v51)
                    {
                      v52 = v51;
                      v53 = objc_msgSend(v51, sel_leadingAnchor);

                      v54 = objc_msgSend(v5, sel_view);
                      if (v54)
                      {
                        v55 = v54;
                        v56 = objc_msgSend(v54, sel_safeAreaLayoutGuide);

                        v57 = objc_msgSend(v56, sel_leadingAnchor);
                        v58 = objc_msgSend(v53, sel_constraintEqualToAnchor_, v57);

                        *(_QWORD *)(v34 + 48) = v58;
                        v59 = objc_msgSend(v24, sel_view);
                        if (v59)
                        {
                          v60 = v59;
                          v61 = objc_msgSend(v59, sel_trailingAnchor);

                          v62 = objc_msgSend(v5, sel_view);
                          if (v62)
                          {
                            v63 = v62;
                            v64 = (void *)objc_opt_self();
                            v65 = objc_msgSend(v63, sel_safeAreaLayoutGuide);

                            v66 = objc_msgSend(v65, sel_trailingAnchor);
                            v67 = objc_msgSend(v61, sel_constraintEqualToAnchor_, v66);

                            *(_QWORD *)(v34 + 56) = v67;
                            sub_18EAE6F40();
                            sub_18EAE5C50();
                            v68 = (void *)sub_18EAE6F28();
                            swift_bridgeObjectRelease();
                            objc_msgSend(v64, sel_activateConstraints_, v68, v34);

                            objc_msgSend(v5, sel_setTypeErasedHostingController_, v24);
                            return;
                          }
                          goto LABEL_33;
                        }
LABEL_32:
                        __break(1u);
LABEL_33:
                        __break(1u);
                        goto LABEL_34;
                      }
LABEL_31:
                      __break(1u);
                      goto LABEL_32;
                    }
LABEL_30:
                    __break(1u);
                    goto LABEL_31;
                  }
LABEL_29:
                  __break(1u);
                  goto LABEL_30;
                }
LABEL_28:
                __break(1u);
                goto LABEL_29;
              }
LABEL_27:
              __break(1u);
              goto LABEL_28;
            }
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
LABEL_25:
          __break(1u);
          goto LABEL_26;
        }
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_24;
  }
  v16 = v15;
  v17 = objc_msgSend(v15, sel_view);

  if (v17)
  {
    objc_msgSend(v17, sel_removeFromSuperview);

    goto LABEL_6;
  }
LABEL_34:
  __break(1u);
}

void sub_18EAE3898(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  char *v19;
  __n128 v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;

  v2 = v1;
  v4 = sub_18EAE6C7C();
  MEMORY[0x1E0C80A78](v4, v5);
  v6 = objc_msgSend(v2, sel_typeErasedHostingController);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_willMoveToParentViewController_, 0);

  }
  v8 = objc_msgSend(v2, sel_typeErasedHostingController);
  objc_msgSend(v8, sel_removeFromParentViewController);

  v9 = objc_msgSend(v2, sel_typeErasedHostingController);
  if (!v9)
  {
LABEL_6:
    v62 = *(_OWORD *)a1;
    v63 = *(_OWORD *)(a1 + 16);
    v64 = *(_QWORD *)(a1 + 32);
    objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE1300B8));
    sub_18EAE5C14(a1);
    v12 = (id)sub_18EAE6B38();
    v13 = objc_msgSend(v12, sel_view, v62, v63, v64);
    if (v13)
    {
      v14 = v13;
      v15 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
      objc_msgSend(v14, sel_setBackgroundColor_, v15);

      sub_18EAE6C70();
      sub_18EAE6B20();
      v16 = (void *)objc_opt_self();
      v17 = v12;
      v18 = objc_msgSend(v16, sel_currentDevice);
      v19 = (char *)objc_msgSend(v18, sel_userInterfaceIdiom);

      if ((unint64_t)(v19 - 1) > 5)
        v20.n128_u64[0] = 0x4072480000000000;
      else
        v20.n128_u64[0] = qword_18EAEAAC8[(_QWORD)(v19 - 1)];
      objc_msgSend(v17, sel_setPreferredContentSize_, CGSizeMake(v20), 0.0);

      objc_msgSend(v2, sel_addChildViewController_, v17);
      v21 = objc_msgSend(v2, sel_view);
      if (v21)
      {
        v22 = v21;
        v23 = objc_msgSend(v17, sel_view);
        if (v23)
        {
          v24 = v23;
          objc_msgSend(v22, sel_addSubview_, v23);

          objc_msgSend(v17, sel_didMoveToParentViewController_, v2);
          v25 = objc_msgSend(v17, sel_view);
          if (v25)
          {
            v26 = v25;
            objc_msgSend(v25, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

            __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FCE8);
            v27 = swift_allocObject();
            *(_OWORD *)(v27 + 16) = xmmword_18EAEA0B0;
            v28 = objc_msgSend(v17, sel_view);
            if (v28)
            {
              v29 = v28;
              v30 = objc_msgSend(v28, sel_topAnchor);

              v31 = objc_msgSend(v2, sel_view);
              if (v31)
              {
                v32 = v31;
                v33 = objc_msgSend(v31, sel_safeAreaLayoutGuide);

                v34 = objc_msgSend(v33, sel_topAnchor);
                v35 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v34);

                *(_QWORD *)(v27 + 32) = v35;
                v36 = objc_msgSend(v17, sel_view);
                if (v36)
                {
                  v37 = v36;
                  v38 = objc_msgSend(v36, sel_bottomAnchor);

                  v39 = objc_msgSend(v2, sel_view);
                  if (v39)
                  {
                    v40 = v39;
                    v41 = objc_msgSend(v39, sel_safeAreaLayoutGuide);

                    v42 = objc_msgSend(v41, sel_bottomAnchor);
                    v43 = objc_msgSend(v38, sel_constraintEqualToAnchor_, v42);

                    *(_QWORD *)(v27 + 40) = v43;
                    v44 = objc_msgSend(v17, sel_view);
                    if (v44)
                    {
                      v45 = v44;
                      v46 = objc_msgSend(v44, sel_leadingAnchor);

                      v47 = objc_msgSend(v2, sel_view);
                      if (v47)
                      {
                        v48 = v47;
                        v49 = objc_msgSend(v47, sel_safeAreaLayoutGuide);

                        v50 = objc_msgSend(v49, sel_leadingAnchor);
                        v51 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v50);

                        *(_QWORD *)(v27 + 48) = v51;
                        v52 = objc_msgSend(v17, sel_view);
                        if (v52)
                        {
                          v53 = v52;
                          v54 = objc_msgSend(v52, sel_trailingAnchor);

                          v55 = objc_msgSend(v2, sel_view);
                          if (v55)
                          {
                            v56 = v55;
                            v57 = (void *)objc_opt_self();
                            v58 = objc_msgSend(v56, sel_safeAreaLayoutGuide);

                            v59 = objc_msgSend(v58, sel_trailingAnchor);
                            v60 = objc_msgSend(v54, sel_constraintEqualToAnchor_, v59);

                            *(_QWORD *)(v27 + 56) = v60;
                            sub_18EAE6F40();
                            sub_18EAE5C50();
                            v61 = (void *)sub_18EAE6F28();
                            swift_bridgeObjectRelease();
                            objc_msgSend(v57, sel_activateConstraints_, v61, v27);

                            objc_msgSend(v2, sel_setTypeErasedHostingController_, v17);
                            return;
                          }
                          goto LABEL_33;
                        }
LABEL_32:
                        __break(1u);
LABEL_33:
                        __break(1u);
                        goto LABEL_34;
                      }
LABEL_31:
                      __break(1u);
                      goto LABEL_32;
                    }
LABEL_30:
                    __break(1u);
                    goto LABEL_31;
                  }
LABEL_29:
                  __break(1u);
                  goto LABEL_30;
                }
LABEL_28:
                __break(1u);
                goto LABEL_29;
              }
LABEL_27:
              __break(1u);
              goto LABEL_28;
            }
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
LABEL_25:
          __break(1u);
          goto LABEL_26;
        }
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_24;
  }
  v10 = v9;
  v11 = objc_msgSend(v9, sel_view);

  if (v11)
  {
    objc_msgSend(v11, sel_removeFromSuperview);

    goto LABEL_6;
  }
LABEL_34:
  __break(1u);
}

void sub_18EAE3F3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  char *v29;
  __n128 v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  _QWORD v72[2];

  v4 = v3;
  v8 = sub_18EAE6C7C();
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = type metadata accessor for _CollaborationDetailView(0, a2, a3, v10);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v13);
  v15 = (char *)v72 - v14;
  v16 = objc_msgSend(v4, sel_typeErasedHostingController);
  if (v16)
  {
    v17 = v16;
    objc_msgSend(v16, sel_willMoveToParentViewController_, 0);

  }
  v18 = objc_msgSend(v4, sel_typeErasedHostingController);
  objc_msgSend(v18, sel_removeFromParentViewController);

  v19 = objc_msgSend(v4, sel_typeErasedHostingController);
  if (!v19)
  {
LABEL_6:
    MEMORY[0x193FF6024](&protocol conformance descriptor for _CollaborationDetailView<A>, v11);
    sub_18EAE6B44();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a1, v11);
    v22 = (id)sub_18EAE6B2C();
    v23 = objc_msgSend(v22, sel_view);
    if (v23)
    {
      v24 = v23;
      v25 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
      objc_msgSend(v24, sel_setBackgroundColor_, v25);

      sub_18EAE6C70();
      sub_18EAE6B20();
      v26 = (void *)objc_opt_self();
      v27 = v22;
      v28 = objc_msgSend(v26, sel_currentDevice);
      v29 = (char *)objc_msgSend(v28, sel_userInterfaceIdiom);

      if ((unint64_t)(v29 - 1) > 5)
        v30.n128_u64[0] = 0x4072480000000000;
      else
        v30.n128_u64[0] = qword_18EAEAAC8[(_QWORD)(v29 - 1)];
      objc_msgSend(v27, sel_setPreferredContentSize_, CGSizeMake(v30), 0.0);

      objc_msgSend(v4, sel_addChildViewController_, v27);
      v31 = objc_msgSend(v4, sel_view);
      if (v31)
      {
        v32 = v31;
        v33 = objc_msgSend(v27, sel_view);
        if (v33)
        {
          v34 = v33;
          objc_msgSend(v32, sel_addSubview_, v33);

          objc_msgSend(v27, sel_didMoveToParentViewController_, v4);
          v35 = objc_msgSend(v27, sel_view);
          if (v35)
          {
            v36 = v35;
            objc_msgSend(v35, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

            __swift_instantiateConcreteTypeFromMangledName(&qword_1EE12FCE8);
            v37 = swift_allocObject();
            *(_OWORD *)(v37 + 16) = xmmword_18EAEA0B0;
            v38 = objc_msgSend(v27, sel_view);
            if (v38)
            {
              v39 = v38;
              v40 = objc_msgSend(v38, sel_topAnchor);

              v41 = objc_msgSend(v4, sel_view);
              if (v41)
              {
                v42 = v41;
                v43 = objc_msgSend(v41, sel_safeAreaLayoutGuide);

                v44 = objc_msgSend(v43, sel_topAnchor);
                v45 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v44);

                *(_QWORD *)(v37 + 32) = v45;
                v46 = objc_msgSend(v27, sel_view);
                if (v46)
                {
                  v47 = v46;
                  v48 = objc_msgSend(v46, sel_bottomAnchor);

                  v49 = objc_msgSend(v4, sel_view);
                  if (v49)
                  {
                    v50 = v49;
                    v51 = objc_msgSend(v49, sel_safeAreaLayoutGuide);

                    v52 = objc_msgSend(v51, sel_bottomAnchor);
                    v53 = objc_msgSend(v48, sel_constraintEqualToAnchor_, v52);

                    *(_QWORD *)(v37 + 40) = v53;
                    v54 = objc_msgSend(v27, sel_view);
                    if (v54)
                    {
                      v55 = v54;
                      v56 = objc_msgSend(v54, sel_leadingAnchor);

                      v57 = objc_msgSend(v4, sel_view);
                      if (v57)
                      {
                        v58 = v57;
                        v59 = objc_msgSend(v57, sel_safeAreaLayoutGuide);

                        v60 = objc_msgSend(v59, sel_leadingAnchor);
                        v61 = objc_msgSend(v56, sel_constraintEqualToAnchor_, v60);

                        *(_QWORD *)(v37 + 48) = v61;
                        v62 = objc_msgSend(v27, sel_view);
                        if (v62)
                        {
                          v63 = v62;
                          v64 = objc_msgSend(v62, sel_trailingAnchor);

                          v65 = objc_msgSend(v4, sel_view);
                          if (v65)
                          {
                            v66 = v65;
                            v67 = (void *)objc_opt_self();
                            v68 = objc_msgSend(v66, sel_safeAreaLayoutGuide);

                            v69 = objc_msgSend(v68, sel_trailingAnchor);
                            v70 = objc_msgSend(v64, sel_constraintEqualToAnchor_, v69);

                            *(_QWORD *)(v37 + 56) = v70;
                            v72[1] = v37;
                            sub_18EAE6F40();
                            sub_18EAE5C50();
                            v71 = (void *)sub_18EAE6F28();
                            swift_bridgeObjectRelease();
                            objc_msgSend(v67, sel_activateConstraints_, v71);

                            objc_msgSend(v4, sel_setTypeErasedHostingController_, v27);
                            return;
                          }
                          goto LABEL_33;
                        }
LABEL_32:
                        __break(1u);
LABEL_33:
                        __break(1u);
                        goto LABEL_34;
                      }
LABEL_31:
                      __break(1u);
                      goto LABEL_32;
                    }
LABEL_30:
                    __break(1u);
                    goto LABEL_31;
                  }
LABEL_29:
                  __break(1u);
                  goto LABEL_30;
                }
LABEL_28:
                __break(1u);
                goto LABEL_29;
              }
LABEL_27:
              __break(1u);
              goto LABEL_28;
            }
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
LABEL_25:
          __break(1u);
          goto LABEL_26;
        }
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_24;
  }
  v20 = v19;
  v21 = objc_msgSend(v19, sel_view);

  if (v21)
  {
    objc_msgSend(v21, sel_removeFromSuperview);

    goto LABEL_6;
  }
LABEL_34:
  __break(1u);
}

id _SWCollaborationDetailViewController.init(itemProvider:)(void *a1)
{
  void *v1;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  char v12;
  uint64_t v13;

  objc_allocWithZone((Class)type metadata accessor for CollaborationDetailViewModel(0));
  v3 = v1;
  v4 = a1;
  v5 = CollaborationDetailViewModel.init(itemProvider:)(v4);
  sub_18EAE6DFC();
  sub_18EAE12D0();
  v6 = sub_18EAE6A9C();
  v8 = v7;
  swift_getObjectType();

  swift_retain();
  v9 = v8;
  v10 = sub_18EAE59A0(v5, v6, v9, v12, v13);

  swift_release_n();
  swift_deallocPartialClassInstance();
  return v10;
}

id _SWCollaborationDetailViewController.viewModel.getter()
{
  void *v0;
  id result;

  result = objc_msgSend(v0, sel_typeErasedViewModel);
  if (result)
  {
    type metadata accessor for CollaborationDetailViewModel(0);
    return (id)swift_dynamicCastClassUnconditional();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void _SWCollaborationDetailViewController.viewModel.setter(void *a1)
{
  void *v1;

  objc_msgSend(v1, sel_setTypeErasedViewModel_, a1);

}

Swift::Void __swiftcall _SWCollaborationDetailViewController.setListContentView(_:)(UIView *a1)
{
  void *v1;
  UIView *v2;
  id v3;
  UIView *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  UIView *v12;
  char v13;
  uint64_t v14;

  v2 = a1;
  v3 = objc_msgSend(v1, sel_viewModel);
  v4 = v2;
  sub_18EAE6DFC();
  v5 = v10;
  v6 = v11;
  type metadata accessor for CollaborationDetailViewModel(0);
  sub_18EAE12D0();
  v7 = sub_18EAE6A9C();
  v9 = v8;
  v10 = v7;
  v11 = (uint64_t)v8;
  v12 = v4;
  v13 = v5;
  v14 = v6;
  sub_18EAE3898((uint64_t)&v10);

  swift_release();
}

uint64_t sub_18EAE4A28()
{
  sub_18EAE5BD0();
  return sub_18EAE6BC8();
}

uint64_t sub_18EAE4A78()
{
  sub_18EAE5BD0();
  return sub_18EAE6B74();
}

void sub_18EAE4AC8()
{
  sub_18EAE5BD0();
  sub_18EAE6BBC();
  __break(1u);
}

uint64_t _SWCollaborationDetailViewController.highlight.getter()
{
  return sub_18EAE4B98();
}

uint64_t sub_18EAE4B98()
{
  void *v0;
  id v1;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();

  swift_release();
  swift_release();
  return v3;
}

uint64_t _SWCollaborationDetailViewController.highlight.setter()
{
  return sub_18EAE4CC8();
}

uint64_t sub_18EAE4CC8()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(v0, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  return sub_18EAE6A6C();
}

double sub_18EAE4D44@<D0>(id *a1@<X0>, _OWORD *a2@<X8>)
{
  id v3;
  double result;
  __int128 v5;

  v3 = objc_msgSend(*a1, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();

  swift_release();
  swift_release();
  result = *(double *)&v5;
  *a2 = v5;
  return result;
}

uint64_t sub_18EAE4DDC(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_bridgeObjectRetain();
  v3 = objc_msgSend(v2, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  return sub_18EAE6A6C();
}

void (*_SWCollaborationDetailViewController.customContentTitle.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  void *v1;
  _QWORD *v3;
  id v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  v4 = objc_msgSend(v1, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  swift_release();

  *(_OWORD *)v3 = *((_OWORD *)v3 + 1);
  return sub_18EAE4F20;
}

void sub_18EAE4F20(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v2 = *a1;
  v4 = **a1;
  v3 = (*a1)[1];
  v5 = (void *)(*a1)[4];
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v6 = objc_msgSend(v5, sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    v2[2] = v4;
    v2[3] = v3;
    sub_18EAE6A6C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = objc_msgSend((id)(*a1)[4], sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    v2[2] = v4;
    v2[3] = v3;
    sub_18EAE6A6C();
  }
  free(v2);
}

uint64_t sub_18EAE5014@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  uint64_t result;
  uint64_t v5;

  v3 = objc_msgSend(*a1, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();

  swift_release();
  result = swift_release();
  *a2 = v5;
  return result;
}

uint64_t sub_18EAE50AC(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_bridgeObjectRetain();
  v3 = objc_msgSend(v2, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  return sub_18EAE6A6C();
}

uint64_t (*_SWCollaborationDetailViewController.customCollaborators.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  void *v1;
  id v3;

  a1[2] = v1;
  v3 = objc_msgSend(v1, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();
  swift_release();
  swift_release();

  *a1 = a1[1];
  return sub_18EAE51E0;
}

uint64_t sub_18EAE51E0(uint64_t *a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id v6;
  id v8;

  v2 = a1 + 1;
  v3 = *a1;
  v4 = (void *)a1[2];
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v6 = objc_msgSend(v4, sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    a1[1] = v3;
    sub_18EAE6A6C();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v8 = objc_msgSend((id)a1[2], sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    *v2 = v3;
    return sub_18EAE6A6C();
  }
}

id _SWCollaborationDetailViewController.init(highlight:listContent:)(void *a1, void *a2)
{
  id v4;

  swift_getObjectType();
  v4 = sub_18EAE3014(a1, a2);
  swift_deallocPartialClassInstance();
  return v4;
}

id _SWCollaborationDetailViewController.init(highlight:)(void *a1)
{
  void *v1;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  char v11;
  uint64_t v12;

  objc_allocWithZone((Class)type metadata accessor for CollaborationDetailViewModel(0));
  v3 = v1;
  v4 = sub_18EACD254(a1);
  sub_18EAE6DFC();
  sub_18EAE12D0();
  v5 = sub_18EAE6A9C();
  v7 = v6;
  swift_getObjectType();

  swift_retain();
  v8 = v7;
  v9 = sub_18EAE59A0(v4, v5, v8, v11, v12);
  swift_release_n();

  swift_deallocPartialClassInstance();
  return v9;
}

id _SWCollaborationDetailViewController.updateHighlight<A>(_:newListContent:)(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setCollaborationHighlight_, a1);
}

{
  void *v1;

  return objc_msgSend(v1, sel_setCollaborationHighlight_, a1);
}

id sub_18EAE5510(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v20;

  v8 = sub_18EAE6C7C();
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = type metadata accessor for _CollaborationDetailView(0, a3, a4, v10);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v13);
  v15 = (char *)&v20 - v14;
  v16 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v16, sel_setTypeErasedViewModel_, a1);
  MEMORY[0x193FF6024](&protocol conformance descriptor for _CollaborationDetailView<A>, v11);
  sub_18EAE6B44();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a2, v11);
  v17 = (void *)sub_18EAE6B2C();
  sub_18EAE6C70();
  sub_18EAE6B20();
  v18 = v17;
  objc_msgSend(v16, sel_setTypeErasedHostingController_, v18);
  sub_18EAE3F3C(a2, a3, a4);

  return v16;
}

id sub_18EAE569C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v23;

  v8 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for _CollaborationDetailView(0, v11, v12, v12);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13, v15);
  v17 = (uint64_t *)((char *)&v23 - v16);
  v18 = objc_allocWithZone((Class)type metadata accessor for CollaborationDetailViewModel(0));
  v19 = sub_18EACD254(a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, a3);
  v20 = v19;
  sub_18EADE708((uint64_t)v10, a3, a4, v17);
  v21 = sub_18EAE5510(v20, (uint64_t)v17, a3, a4);
  (*(void (**)(uint64_t *, uint64_t))(v14 + 8))(v17, v13);
  return v21;
}

id sub_18EAE57D4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(uint64_t);
  id v13;
  uint64_t v15;

  v8 = *(_QWORD *)(a4 - 8);
  v9 = MEMORY[0x1E0C80A78](a1, a2);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12(v9);
  v13 = sub_18EAE569C(a1, (uint64_t)v11, a4, a5);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, a4);
  return v13;
}

id sub_18EAE5880(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v4 = sub_18EAE6C7C();
  MEMORY[0x1E0C80A78](v4, v5);
  v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v6, sel_setTypeErasedViewModel_, a1);
  v11 = *(_OWORD *)a2;
  v12 = *(_OWORD *)(a2 + 16);
  v13 = *(_QWORD *)(a2 + 32);
  v7 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE1300B8));
  sub_18EAE5C14(a2);
  v8 = (void *)sub_18EAE6B38();
  sub_18EAE6C70();
  sub_18EAE6B20();
  v9 = v8;
  objc_msgSend(v6, sel_setTypeErasedHostingController_, v9, v11, v12, v13);
  sub_18EAE3898(a2);

  return v6;
}

id sub_18EAE59A0(void *a1, uint64_t a2, void *a3, char a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v17;
  uint64_t v18;

  v10 = sub_18EAE6C7C();
  MEMORY[0x1E0C80A78](v10, v11);
  v12 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v12, sel_setTypeErasedViewModel_, a1);
  v17 = a3;
  LOBYTE(v18) = a4;
  objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE1300C0));
  swift_retain();
  v13 = a3;
  v14 = (void *)sub_18EAE6B38();
  sub_18EAE6C70();
  sub_18EAE6B20();
  v15 = v14;
  objc_msgSend(v12, sel_setTypeErasedHostingController_, v15, a2, v17, v18, a5);
  sub_18EAE31E4(a2, v13, a4, a5);

  return v12;
}

char *keypath_get_selector_viewModel()
{
  return sel_viewModel;
}

id sub_18EAE5B08@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_viewModel);
  *a2 = result;
  return result;
}

id sub_18EAE5B40(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setViewModel_, *a1);
}

char *keypath_get_selector_collaborationHighlight()
{
  return sel_collaborationHighlight;
}

id sub_18EAE5B60@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_collaborationHighlight);
  *a2 = result;
  return result;
}

id sub_18EAE5B98(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCollaborationHighlight_, *a1);
}

ValueMetadata *type metadata accessor for ListContentViewRepresentable()
{
  return &type metadata for ListContentViewRepresentable;
}

unint64_t sub_18EAE5BD0()
{
  unint64_t result;

  result = qword_1EE1300B0;
  if (!qword_1EE1300B0)
  {
    result = MEMORY[0x193FF6024](&unk_18EAEAA30, &type metadata for ListContentViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_1EE1300B0);
  }
  return result;
}

uint64_t sub_18EAE5C14(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 8);
  v3 = *(void **)(a1 + 16);
  swift_retain();
  v4 = v2;
  v5 = v3;
  return a1;
}

unint64_t sub_18EAE5C50()
{
  unint64_t result;

  result = qword_1EE12FCF0;
  if (!qword_1EE12FCF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE12FCF0);
  }
  return result;
}

uint64_t __getSLCollaborationSigningControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SWHighlight replyContextMenuWithPresentingViewController:].cold.1(v0);
}

uint64_t sub_18EAE685C()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_18EAE6868()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_18EAE6874()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_18EAE6880()
{
  return MEMORY[0x1E0CAFD30]();
}

uint64_t sub_18EAE688C()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_18EAE6898()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_18EAE68A4()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_18EAE68B0()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_18EAE68BC()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_18EAE68C8()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_18EAE68D4()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_18EAE68E0()
{
  return MEMORY[0x1E0DA8768]();
}

uint64_t sub_18EAE68EC()
{
  return MEMORY[0x1E0DA8770]();
}

uint64_t sub_18EAE68F8()
{
  return MEMORY[0x1E0DA8778]();
}

uint64_t sub_18EAE6904()
{
  return MEMORY[0x1E0DA8780]();
}

uint64_t sub_18EAE6910()
{
  return MEMORY[0x1E0DA8790]();
}

uint64_t sub_18EAE691C()
{
  return MEMORY[0x1E0DA87A0]();
}

uint64_t sub_18EAE6928()
{
  return MEMORY[0x1E0DA87A8]();
}

uint64_t sub_18EAE6934()
{
  return MEMORY[0x1E0DA87B8]();
}

uint64_t sub_18EAE6940()
{
  return MEMORY[0x1E0DA87C0]();
}

uint64_t sub_18EAE694C()
{
  return MEMORY[0x1E0DA87C8]();
}

uint64_t sub_18EAE6958()
{
  return MEMORY[0x1E0DA87D0]();
}

uint64_t sub_18EAE6964()
{
  return MEMORY[0x1E0DA87D8]();
}

uint64_t sub_18EAE6970()
{
  return MEMORY[0x1E0DA87E0]();
}

uint64_t sub_18EAE697C()
{
  return MEMORY[0x1E0DA87E8]();
}

uint64_t sub_18EAE6988()
{
  return MEMORY[0x1E0DA87F0]();
}

uint64_t sub_18EAE6994()
{
  return MEMORY[0x1E0DA8808]();
}

uint64_t sub_18EAE69A0()
{
  return MEMORY[0x1E0DA8810]();
}

uint64_t sub_18EAE69AC()
{
  return MEMORY[0x1E0CA8768]();
}

uint64_t sub_18EAE69B8()
{
  return MEMORY[0x1E0CA8838]();
}

uint64_t sub_18EAE69C4()
{
  return MEMORY[0x1E0DF0188]();
}

uint64_t sub_18EAE69D0()
{
  return MEMORY[0x1E0DF0190]();
}

uint64_t sub_18EAE69DC()
{
  return MEMORY[0x1E0DF0290]();
}

uint64_t sub_18EAE69E8()
{
  return MEMORY[0x1E0DF0340]();
}

uint64_t sub_18EAE69F4()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_18EAE6A00()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_18EAE6A0C()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_18EAE6A18()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_18EAE6A24()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_18EAE6A30()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_18EAE6A3C()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_18EAE6A48()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t sub_18EAE6A54()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t sub_18EAE6A60()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_18EAE6A6C()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_18EAE6A78()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_18EAE6A84()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_18EAE6A90()
{
  return MEMORY[0x1E0CD8D60]();
}

uint64_t sub_18EAE6A9C()
{
  return MEMORY[0x1E0CD94E8]();
}

uint64_t sub_18EAE6AA8()
{
  return MEMORY[0x1E0CD9BF0]();
}

uint64_t sub_18EAE6AB4()
{
  return MEMORY[0x1E0CDA218]();
}

uint64_t sub_18EAE6AC0()
{
  return MEMORY[0x1E0CDA630]();
}

uint64_t sub_18EAE6ACC()
{
  return MEMORY[0x1E0CDA640]();
}

uint64_t sub_18EAE6AD8()
{
  return MEMORY[0x1E0CDA740]();
}

uint64_t sub_18EAE6AE4()
{
  return MEMORY[0x1E0CDA748]();
}

uint64_t sub_18EAE6AF0()
{
  return MEMORY[0x1E0CDACC8]();
}

uint64_t sub_18EAE6AFC()
{
  return MEMORY[0x1E0CDAF60]();
}

uint64_t sub_18EAE6B08()
{
  return MEMORY[0x1E0CDAF70]();
}

uint64_t sub_18EAE6B14()
{
  return MEMORY[0x1E0CDB430]();
}

uint64_t sub_18EAE6B20()
{
  return MEMORY[0x1E0CDB5D0]();
}

uint64_t sub_18EAE6B2C()
{
  return MEMORY[0x1E0CDB5F8]();
}

uint64_t sub_18EAE6B38()
{
  return MEMORY[0x1E0CDB608]();
}

uint64_t sub_18EAE6B44()
{
  return MEMORY[0x1E0CDB630]();
}

uint64_t sub_18EAE6B50()
{
  return MEMORY[0x1E0CDB658]();
}

uint64_t sub_18EAE6B5C()
{
  return MEMORY[0x1E0CDB668]();
}

uint64_t sub_18EAE6B68()
{
  return MEMORY[0x1E0CDB678]();
}

uint64_t sub_18EAE6B74()
{
  return MEMORY[0x1E0CDB688]();
}

uint64_t sub_18EAE6B80()
{
  return MEMORY[0x1E0CDB698]();
}

uint64_t sub_18EAE6B8C()
{
  return MEMORY[0x1E0CDB6A8]();
}

uint64_t sub_18EAE6B98()
{
  return MEMORY[0x1E0CDB6B8]();
}

uint64_t sub_18EAE6BA4()
{
  return MEMORY[0x1E0CDB6D0]();
}

uint64_t sub_18EAE6BB0()
{
  return MEMORY[0x1E0CDB6E0]();
}

uint64_t sub_18EAE6BBC()
{
  return MEMORY[0x1E0CDB6F0]();
}

uint64_t sub_18EAE6BC8()
{
  return MEMORY[0x1E0CDB6F8]();
}

uint64_t sub_18EAE6BD4()
{
  return MEMORY[0x1E0CDB708]();
}

uint64_t sub_18EAE6BE0()
{
  return MEMORY[0x1E0CDB848]();
}

uint64_t sub_18EAE6BEC()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_18EAE6BF8()
{
  return MEMORY[0x1E0CDB880]();
}

uint64_t sub_18EAE6C04()
{
  return MEMORY[0x1E0CDCE48]();
}

uint64_t sub_18EAE6C10()
{
  return MEMORY[0x1E0CDCE60]();
}

uint64_t sub_18EAE6C1C()
{
  return MEMORY[0x1E0CDCE68]();
}

uint64_t sub_18EAE6C28()
{
  return MEMORY[0x1E0CDCE78]();
}

uint64_t sub_18EAE6C34()
{
  return MEMORY[0x1E0CDCE90]();
}

uint64_t sub_18EAE6C40()
{
  return MEMORY[0x1E0CDCEA0]();
}

uint64_t sub_18EAE6C4C()
{
  return MEMORY[0x1E0CDCEB0]();
}

uint64_t sub_18EAE6C58()
{
  return MEMORY[0x1E0CDCEB8]();
}

uint64_t sub_18EAE6C64()
{
  return MEMORY[0x1E0CDCEC8]();
}

uint64_t sub_18EAE6C70()
{
  return MEMORY[0x1E0CDD0A8]();
}

uint64_t sub_18EAE6C7C()
{
  return MEMORY[0x1E0CDD0B0]();
}

uint64_t sub_18EAE6C88()
{
  return MEMORY[0x1E0CDD2D8]();
}

uint64_t sub_18EAE6C94()
{
  return MEMORY[0x1E0CDD348]();
}

uint64_t sub_18EAE6CA0()
{
  return MEMORY[0x1E0CDD358]();
}

uint64_t sub_18EAE6CAC()
{
  return MEMORY[0x1E0CDD368]();
}

uint64_t sub_18EAE6CB8()
{
  return MEMORY[0x1E0CDD380]();
}

uint64_t sub_18EAE6CC4()
{
  return MEMORY[0x1E0CDD3A0]();
}

uint64_t sub_18EAE6CD0()
{
  return MEMORY[0x1E0CDD560]();
}

uint64_t sub_18EAE6CDC()
{
  return MEMORY[0x1E0CDD658]();
}

uint64_t sub_18EAE6CE8()
{
  return MEMORY[0x1E0CDD7F0]();
}

uint64_t sub_18EAE6CF4()
{
  return MEMORY[0x1E0CDD928]();
}

uint64_t sub_18EAE6D00()
{
  return MEMORY[0x1E0CDD938]();
}

uint64_t sub_18EAE6D0C()
{
  return MEMORY[0x1E0CDDB88]();
}

uint64_t sub_18EAE6D18()
{
  return MEMORY[0x1E0CDDC38]();
}

uint64_t sub_18EAE6D24()
{
  return MEMORY[0x1E0CDDC48]();
}

uint64_t sub_18EAE6D30()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_18EAE6D3C()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_18EAE6D48()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_18EAE6D54()
{
  return MEMORY[0x1E0CDE0C0]();
}

uint64_t sub_18EAE6D60()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_18EAE6D6C()
{
  return MEMORY[0x1E0CDE3D0]();
}

uint64_t sub_18EAE6D78()
{
  return MEMORY[0x1E0CDE830]();
}

uint64_t sub_18EAE6D84()
{
  return MEMORY[0x1E0CDEC48]();
}

uint64_t sub_18EAE6D90()
{
  return MEMORY[0x1E0CDEF48]();
}

uint64_t sub_18EAE6D9C()
{
  return MEMORY[0x1E0CDEF58]();
}

uint64_t sub_18EAE6DA8()
{
  return MEMORY[0x1E0CDF238]();
}

uint64_t sub_18EAE6DB4()
{
  return MEMORY[0x1E0CDF3C0]();
}

uint64_t sub_18EAE6DC0()
{
  return MEMORY[0x1E0CDF530]();
}

uint64_t sub_18EAE6DCC()
{
  return MEMORY[0x1E0CDF588]();
}

uint64_t sub_18EAE6DD8()
{
  return MEMORY[0x1E0CDF6D8]();
}

uint64_t sub_18EAE6DE4()
{
  return MEMORY[0x1E0CDF700]();
}

uint64_t sub_18EAE6DF0()
{
  return MEMORY[0x1E0CDF810]();
}

uint64_t sub_18EAE6DFC()
{
  return MEMORY[0x1E0CDF968]();
}

uint64_t sub_18EAE6E08()
{
  return MEMORY[0x1E0CDF988]();
}

uint64_t sub_18EAE6E14()
{
  return MEMORY[0x1E0CDF990]();
}

uint64_t sub_18EAE6E20()
{
  return MEMORY[0x1E0CDF9F0]();
}

uint64_t sub_18EAE6E2C()
{
  return MEMORY[0x1E0CDFD20]();
}

uint64_t sub_18EAE6E38()
{
  return MEMORY[0x1E0CDFE98]();
}

uint64_t sub_18EAE6E44()
{
  return MEMORY[0x1E0CDFF60]();
}

uint64_t sub_18EAE6E50()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_18EAE6E5C()
{
  return MEMORY[0x1E0CE0648]();
}

uint64_t sub_18EAE6E68()
{
  return MEMORY[0x1E0CE0670]();
}

uint64_t sub_18EAE6E74()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_18EAE6E80()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_18EAE6E8C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_18EAE6E98()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_18EAE6EA4()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_18EAE6EB0()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_18EAE6EBC()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_18EAE6EC8()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_18EAE6ED4()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_18EAE6EE0()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_18EAE6EEC()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_18EAE6EF8()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_18EAE6F04()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_18EAE6F10()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_18EAE6F1C()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_18EAE6F28()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_18EAE6F34()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_18EAE6F40()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_18EAE6F4C()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_18EAE6F58()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_18EAE6F64()
{
  return MEMORY[0x1E0DEAEE8]();
}

uint64_t sub_18EAE6F70()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_18EAE6F7C()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_18EAE6F88()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_18EAE6F94()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_18EAE6FA0()
{
  return MEMORY[0x1E0CB1DD8]();
}

uint64_t sub_18EAE6FAC()
{
  return MEMORY[0x1E0DF0388]();
}

uint64_t sub_18EAE6FB8()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_18EAE6FC4()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_18EAE6FD0()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_18EAE6FDC()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_18EAE6FE8()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_18EAE6FF4()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_18EAE7000()
{
  return MEMORY[0x1E0DC2F48]();
}

uint64_t sub_18EAE700C()
{
  return MEMORY[0x1E0CE0758]();
}

uint64_t sub_18EAE7018()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_18EAE7024()
{
  return MEMORY[0x1E0DC2FF8]();
}

uint64_t sub_18EAE7030()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_18EAE703C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_18EAE7048()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_18EAE7054()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_18EAE7060()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_18EAE706C()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_18EAE7078()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_18EAE7084()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_18EAE7090()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_18EAE709C()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_18EAE70A8()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_18EAE70B4()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_18EAE70C0()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_18EAE70CC()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_18EAE70D8()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_18EAE70E4()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_18EAE70F0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_18EAE70FC()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_18EAE7108()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_18EAE7114()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_18EAE7120()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_18EAE712C()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_18EAE7138()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_18EAE7144()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_18EAE7150()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_18EAE715C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x1E0D131E0]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t SLFrameworkLogHandle()
{
  return MEMORY[0x1E0DA88B0]();
}

uint64_t SLSendPortraitFeedbackTypeAppButtonForAttribution()
{
  return MEMORY[0x1E0DA88C8]();
}

uint64_t SLSendPortraitFeedbackTypeDisplayedHighlight()
{
  return MEMORY[0x1E0DA88D0]();
}

uint64_t SLSendPortraitFeedbackTypeUserInteractedWithHighlight()
{
  return MEMORY[0x1E0DA88D8]();
}

uint64_t SLURLMinusFragmentForCKURLs()
{
  return MEMORY[0x1E0DA88E0]();
}

uint64_t SL_CGFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x1E0DA88E8]();
}

uint64_t SWFrameworkBundle()
{
  return MEMORY[0x1E0CD7470]();
}

uint64_t SWFrameworkLogHandle()
{
  return MEMORY[0x1E0CD7478]();
}

uint64_t SWShareableContentLogHandle()
{
  return MEMORY[0x1E0CD74A0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C851B0]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1E0DEECF0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1E0DEED18]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1E0DEED28]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1E0DEEF28]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1E0DEEF30]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1E0DEEF50]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1E0DEEF58]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}


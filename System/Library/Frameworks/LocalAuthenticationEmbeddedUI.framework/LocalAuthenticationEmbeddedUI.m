void sub_22FE98ABC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_22FE98EC8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id LA_LOG()
{
  if (LA_LOG_once != -1)
    dispatch_once(&LA_LOG_once, &__block_literal_global_1);
  return (id)LA_LOG_log;
}

void sub_22FE990E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FE9A248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  uint64_t v12;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 152));
  _Unwind_Resume(a1);
}

void sub_22FE9A570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getCDPStateControllerClass()
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
  v0 = (void *)getCDPStateControllerClass_softClass;
  v7 = getCDPStateControllerClass_softClass;
  if (!getCDPStateControllerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCDPStateControllerClass_block_invoke;
    v3[3] = &unk_24FDCD840;
    v3[4] = &v4;
    __getCDPStateControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22FE9AA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCDPStateControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreCDPLibraryCore_frameworkLibrary)
  {
    CoreCDPLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreCDPLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CDPStateController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCDPStateControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getCDPStateControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22FE9C1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FE9C528(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_22FE9D384(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22FE9D458(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22FE9D874(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id LA_LOG_0()
{
  if (LA_LOG_once_0 != -1)
    dispatch_once(&LA_LOG_once_0, &__block_literal_global_131);
  return (id)LA_LOG_log_0;
}

void sub_22FE9DFA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FE9E284(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_22FE9F728(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_22FE9F9C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FEA16F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FEA1A24(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22FEA2314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FEA2D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FEA4598(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22FEA4674(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22FEA4818(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22FEA48F4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22FEA4ACC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_22FEA4BB4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22FEA5D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FEA5F38(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22FEA8774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromLAPSPasscodeTypeIdentifier(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("LAPSPasscodeTypeIdentifierUnknown");
  else
    return off_24FDCE158[a1];
}

id LAViewControllerForPresentationContext(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (v1)
  {
    objc_msgSend(v1, "rootViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBDB58], "_applicationKeyWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rootViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

void sub_22FEA94FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FEA9908(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22FEAA680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FEABB14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FEABE2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FEAC114(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22FEAC224(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22FEAC350(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22FEAC48C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22FEAC640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22FEAC7AC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22FEAC8F4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22FEACC5C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22FEACDA4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_22FEAD7B0()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  swift_bridgeObjectRetain();
  v1 = (void *)sub_22FEB1874();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithOptions_configuration_, v1, 0);

  return v2;
}

id sub_22FEAD8B0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  swift_bridgeObjectRetain();
  v4 = a2;
  v5 = (void *)sub_22FEB1874();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v3, sel_initWithOptions_configuration_, v5, v4);

  return v6;
}

uint64_t sub_22FEAD9D8()
{
  return sub_22FEADEE4(MEMORY[0x24BE607F0]);
}

void sub_22FEAD9E4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  id v24;
  void *v25;
  _BYTE *v26;
  void *v27;
  void *v28;
  _BYTE *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;

  v2 = v1;
  v43 = a1;
  v3 = sub_22FEB1820();
  v41 = *(_QWORD *)(v3 - 8);
  v42 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22FEB1808();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v37 - v11;
  v13 = sub_22FEB1760();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = objc_msgSend(v2, sel_viewModel);
  if (v17)
  {
    if ((objc_msgSend(v17, sel_isInvalidated) & 1) == 0)
    {
      sub_22FEB17B4();
      sub_22FEAEA1C();
      v25 = (void *)swift_allocError();
      *v26 = 1;
      v27 = (void *)sub_22FEB17A8();

      sub_22FEAEA60(0, v27);
      swift_unknownObjectRelease();
      return;
    }
    swift_unknownObjectRelease();
  }
  v40 = v10;
  v18 = objc_msgSend(v2, sel_presentationContext);

  if (v18)
  {
    v38 = v7;
    v39 = v6;
    objc_msgSend(v2, sel_clean);
    sub_22FEB1754();
    v45 = 0;
    v46 = 0xE000000000000000;
    sub_22FEB1910();
    v19 = objc_msgSend(v2, sel_description);
    v20 = sub_22FEB18B0();
    v22 = v21;
    swift_bridgeObjectRelease();

    v45 = v20;
    v46 = v22;
    sub_22FEB18D4();
    v44 = sub_22FEB1814();
    sub_22FEB194C();
    sub_22FEB18D4();
    swift_bridgeObjectRelease();
    sub_22FEB173C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    v23 = objc_msgSend(v2, sel_configuration);
    v24 = objc_msgSend(v23, sel_countdownPrimaryActionTitle);

    if (v24)
    {
      sub_22FEB18B0();

    }
    v31 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v5, v43, v42);
    sub_22FEB17FC();
    type metadata accessor for LAContextProvider();
    sub_22FEB0E88();
    v32 = objc_msgSend(v2, sel_internalOptions);
    sub_22FEB1880();

    v33 = v39;
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v40, v12, v39);
    v34 = objc_allocWithZone((Class)sub_22FEB17B4());
    v35 = (void *)sub_22FEB1784();
    sub_22FEAE518((uint64_t)v35);
    objc_msgSend(v2, sel_setViewModel_, v35);
    v36 = objc_msgSend(v2, sel_viewModel);
    if (v36)
    {
      objc_msgSend(v36, sel_start);

      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v33);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v33);

    }
  }
  else
  {
    sub_22FEB17B4();
    sub_22FEAEA1C();
    v28 = (void *)swift_allocError();
    *v29 = 0;
    v30 = (void *)sub_22FEB17A8();

    sub_22FEAEA60(0, v30);
  }
}

uint64_t sub_22FEADED8()
{
  return sub_22FEADEE4(MEMORY[0x24BE607F8]);
}

uint64_t sub_22FEADEE4(unsigned int *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = sub_22FEB1820();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *a1, v2);
  sub_22FEAD9E4((uint64_t)v5);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_22FEADF84(void *a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;

  v5 = sub_22FEB1820();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *a3, v5);
  v9 = a1;
  sub_22FEAD9E4((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

}

uint64_t sub_22FEAE028()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD v14[2];
  uint64_t v15;
  unint64_t v16;

  v1 = v0;
  v2 = sub_22FEB1760();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v0, sel_viewModel);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)sub_22FEB188C();
    objc_msgSend(v7, sel_stopWithReason_invalidate_, v8, 1);

    swift_unknownObjectRelease();
  }
  objc_msgSend(v1, sel_clean);
  sub_22FEB1754();
  v15 = 0;
  v16 = 0xE000000000000000;
  sub_22FEB1910();
  v9 = objc_msgSend(v1, sel_description);
  v10 = sub_22FEB18B0();
  v12 = v11;
  swift_bridgeObjectRelease();

  v15 = v10;
  v16 = v12;
  sub_22FEB18D4();
  v14[1] = objc_msgSend(v1, sel_viewModel);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E520A0);
  sub_22FEB1904();
  swift_unknownObjectRelease();
  sub_22FEB18D4();
  swift_bridgeObjectRelease();
  sub_22FEB173C();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348AFB7C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id sub_22FEAE288()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[32];

  v1 = v0;
  v2 = objc_msgSend(v0, sel_subscriptions);
  if (v2)
  {
    v3 = v2;
    v4 = sub_22FEB18EC();

    v5 = *(_QWORD *)(v4 + 16);
    if (!v5)
      goto LABEL_9;
  }
  else
  {
    v4 = MEMORY[0x24BEE4AF8];
    v5 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (!v5)
      goto LABEL_9;
  }
  v6 = v4 + 32;
  do
  {
    sub_22FEAE388(v6, (uint64_t)v8);
    sub_22FEB1838();
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_22FEB182C();
      swift_release();
    }
    v6 += 32;
    --v5;
  }
  while (v5);
LABEL_9:
  swift_bridgeObjectRelease();
  return objc_msgSend(v1, sel_setSubscriptions_, 0);
}

uint64_t sub_22FEAE388(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

BOOL sub_22FEAE3F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_22FEAE410()
{
  sub_22FEB1994();
  sub_22FEB19A0();
  return sub_22FEB19AC();
}

uint64_t sub_22FEAE454()
{
  return sub_22FEB19A0();
}

uint64_t sub_22FEAE47C()
{
  sub_22FEB1994();
  sub_22FEB19A0();
  return sub_22FEB19AC();
}

unint64_t sub_22FEAE4BC()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000054;
  else
    return 0xD00000000000004ELL;
}

void sub_22FEAE518(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
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
  uint64_t v41;

  v38 = a1;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E52120);
  MEMORY[0x24BDAC7A8](v36);
  v2 = (char *)&v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E52128);
  v3 = MEMORY[0x24BDAC7A8](v32);
  v33 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v30 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E52130);
  v31 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E52138);
  v11 = *(_QWORD *)(v10 - 8);
  v34 = v10;
  v35 = v11;
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E52140);
  v39 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_22FEB1778();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E52148);
  sub_22FEAF8DC(&qword_255E52150, &qword_255E52148, MEMORY[0x24BDB9AF8]);
  sub_22FEB0DEC(&qword_255E52158, (uint64_t (*)(uint64_t))MEMORY[0x24BE60788], MEMORY[0x24BE60798]);
  sub_22FEB185C();
  swift_release();
  sub_22FEAF8DC(&qword_255E52160, &qword_255E52130, MEMORY[0x24BDB9658]);
  sub_22FEB1844();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v7);
  v16 = sub_22FEB179C();
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v6, 1, 1, v16);
  v18 = (uint64_t)v33;
  v17(v33, 1, 1, v16);
  v19 = (uint64_t)&v2[*(int *)(v36 + 48)];
  sub_22FEAED8C((uint64_t)v6, (uint64_t)v2);
  sub_22FEAED8C(v18, v19);
  sub_22FEAF8DC(&qword_255E52168, &qword_255E52138, MEMORY[0x24BDB96C0]);
  v20 = v34;
  sub_22FEB1850();
  sub_22FEB0B20((uint64_t)v2, &qword_255E52120);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v20);
  v21 = swift_allocObject();
  v22 = v40;
  swift_unknownObjectWeakInit();
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = sub_22FEAEED0;
  *(_QWORD *)(v23 + 24) = v21;
  sub_22FEAF8DC(&qword_255E52170, &qword_255E52140, MEMORY[0x24BDB9710]);
  v24 = v37;
  v25 = sub_22FEB1868();
  swift_release();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v15, v24);
  v41 = sub_22FEB1790();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E52178);
  sub_22FEAF8DC(&qword_255E52180, &qword_255E52178, MEMORY[0x24BDB9AF8]);
  v26 = sub_22FEB1868();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E52188);
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_22FEB4DC0;
  v28 = sub_22FEB1838();
  *(_QWORD *)(v27 + 32) = v25;
  *(_QWORD *)(v27 + 88) = v28;
  *(_QWORD *)(v27 + 56) = v28;
  *(_QWORD *)(v27 + 64) = v26;
  swift_retain();
  swift_retain();
  v29 = (void *)sub_22FEB18E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_setSubscriptions_, v29);
  swift_release();
  swift_release();

}

unint64_t sub_22FEAEA1C()
{
  unint64_t result;

  result = qword_255E52340[0];
  if (!qword_255E52340[0])
  {
    result = MEMORY[0x2348AFB94](&unk_22FEB50A0, &_s13FailureReasonON);
    atomic_store(result, qword_255E52340);
  }
  return result;
}

void sub_22FEAEA60(void *a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;

  v3 = v2;
  v6 = sub_22FEB1760();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22FEB1754();
  v14 = 0;
  v15 = 0xE000000000000000;
  sub_22FEB1910();
  v10 = objc_msgSend(v2, sel_description);
  sub_22FEB18B0();

  sub_22FEB18D4();
  swift_bridgeObjectRelease();
  sub_22FEB18D4();
  v13 = objc_msgSend(v3, sel_delegate);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E52108);
  sub_22FEB1904();
  swift_unknownObjectRelease();
  sub_22FEB18D4();
  swift_bridgeObjectRelease();
  sub_22FEB18D4();
  v13 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E52110);
  sub_22FEB1904();
  sub_22FEB18D4();
  swift_bridgeObjectRelease();
  sub_22FEB18D4();
  v13 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E52118);
  sub_22FEB1904();
  sub_22FEB18D4();
  swift_bridgeObjectRelease();
  sub_22FEB173C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (!a1)
  {
    v11 = 0;
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  v11 = (void *)sub_22FEB1874();
  if (a2)
LABEL_3:
    a2 = (void *)sub_22FEB170C();
LABEL_4:
  objc_msgSend(v3, sel_finishWithResult_error_, v11, a2);

}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348AFB88](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22FEAED2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_22FEB179C();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, a1, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
}

uint64_t sub_22FEAED8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E52128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22FEAEDD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255E52120);
  v6 = MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(int *)(v6 + 48);
  v10 = a3 + v9;
  v11 = (uint64_t)&v8[v9];
  v12 = a1 + v9;
  sub_22FEB0ADC(a1, (uint64_t)v8, &qword_255E52128);
  sub_22FEB0ADC(v12, v11, &qword_255E52128);
  sub_22FEAED8C(v11, a3);
  sub_22FEB0ADC(a2, v10, &qword_255E52128);
  return sub_22FEB0B20((uint64_t)v8, &qword_255E52128);
}

uint64_t sub_22FEAEEAC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_22FEAEED0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  void *v6;

  swift_beginAccess();
  v5 = MEMORY[0x2348AFBDC](v2 + 16);
  if (v5)
  {
    v6 = (void *)v5;
    sub_22FEAEF3C(a1, a2);

  }
}

void sub_22FEAEF3C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  char *v5;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int (*v38)(uint64_t, uint64_t, uint64_t);
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  int v43;
  int v44;
  void (*v45)(uint64_t, uint64_t);
  unsigned int v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  id v55;
  id v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  id v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  id v67;
  void *v68;
  void *v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;

  v82 = a2;
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E52120);
  MEMORY[0x24BDAC7A8](v83);
  v5 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22FEB17E4();
  v76 = *(_QWORD *)(v6 - 8);
  v77 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v75 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v80 = (char *)&v70 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v73 = (char *)&v70 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E52128);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v72 = (char *)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v70 = (char *)&v70 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v71 = (char *)&v70 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v74 = (char *)&v70 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v79 = (uint64_t)&v70 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v70 - v23;
  v81 = sub_22FEB1760();
  v25 = *(_QWORD *)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  v27 = (char *)&v70 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22FEB1754();
  v84 = 0;
  v85 = 0xE000000000000000;
  sub_22FEB1910();
  v78 = v2;
  v28 = objc_msgSend(v2, sel_description);
  v29 = sub_22FEB18B0();
  v31 = v30;
  swift_bridgeObjectRelease();

  v84 = v29;
  v85 = v31;
  v32 = (uint64_t)v5;
  sub_22FEB18D4();
  sub_22FEB0ADC(a1, (uint64_t)v24, &qword_255E52128);
  sub_22FEB18BC();
  sub_22FEB18D4();
  swift_bridgeObjectRelease();
  sub_22FEB18D4();
  v33 = v82;
  sub_22FEB0ADC(v82, (uint64_t)v24, &qword_255E52128);
  sub_22FEB18BC();
  sub_22FEB18D4();
  swift_bridgeObjectRelease();
  sub_22FEB173C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v81);
  v34 = v32 + *(int *)(v83 + 48);
  v35 = v32;
  sub_22FEB0ADC(a1, v32, &qword_255E52128);
  sub_22FEB0ADC(v33, v34, &qword_255E52128);
  v36 = sub_22FEB179C();
  v37 = *(_QWORD *)(v36 - 8);
  v38 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48);
  if (v38(v34, 1, v36) == 1)
    goto LABEL_2;
  v41 = v79;
  sub_22FEB0ADC(v34, v79, &qword_255E52128);
  v42 = *(uint64_t (**)(uint64_t, uint64_t))(v37 + 88);
  v43 = v42(v41, v36);
  v44 = v43;
  if (v43 == *MEMORY[0x24BE60760])
  {
    v45 = *(void (**)(uint64_t, uint64_t))(v37 + 96);
    v45(v41, v36);
    v46 = v38(v32, 1, v36);
    v47 = v80;
    if (v46 == 1)
      goto LABEL_29;
    v48 = v35;
    v49 = (uint64_t)v74;
  }
  else
  {
    v47 = v80;
    if (v43 == *MEMORY[0x24BE60770])
    {
      v45 = *(void (**)(uint64_t, uint64_t))(v37 + 96);
      v45(v41, v36);
      if (v38(v35, 1, v36) == 1)
        goto LABEL_29;
      v48 = v35;
      v49 = (uint64_t)v72;
    }
    else if (v43 == *MEMORY[0x24BE60780])
    {
      v45 = *(void (**)(uint64_t, uint64_t))(v37 + 96);
      v45(v41, v36);
      if (v38(v35, 1, v36) == 1)
        goto LABEL_29;
      v48 = v35;
      v49 = (uint64_t)v71;
    }
    else
    {
      if (v43 != *MEMORY[0x24BE60768])
      {
        if (v43 == *MEMORY[0x24BE60778])
        {
          (*(void (**)(uint64_t, uint64_t))(v37 + 96))(v41, v36);
          v69 = *(void **)(v41 + 8);
          sub_22FEAEA60(*(void **)v41, v69);

          swift_bridgeObjectRelease();
          sub_22FEB0B20(v34, &qword_255E52128);
          v40 = v35;
          v39 = &qword_255E52128;
          goto LABEL_3;
        }
        (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v41, v36);
LABEL_2:
        v39 = &qword_255E52120;
        v40 = v35;
LABEL_3:
        sub_22FEB0B20(v40, v39);
        return;
      }
      v45 = *(void (**)(uint64_t, uint64_t))(v37 + 96);
      v45(v41, v36);
      if (v38(v35, 1, v36) == 1)
        goto LABEL_29;
      v48 = v35;
      v49 = (uint64_t)v70;
    }
  }
  sub_22FEB0ADC(v48, v49, &qword_255E52128);
  if (v42(v49, v36) != v44)
  {
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v49, v36);
LABEL_29:
    v63 = v76;
    v62 = v77;
    (*(void (**)(char *, uint64_t, uint64_t))(v76 + 32))(v47, v41, v77);
    sub_22FEB0B20(v34, &qword_255E52128);
    sub_22FEB0B20(v35, &qword_255E52128);
    (*(void (**)(char *))(v63 + 16))(v75);
    v64 = objc_msgSend(v78, sel_viewModel);
    if (v64)
    {
      v65 = v64;
      swift_getObjectType();
      if (!(swift_conformsToProtocol2() ? v65 : 0))
        swift_unknownObjectRelease();
    }
    v67 = objc_allocWithZone((Class)sub_22FEB17D8());
    v68 = (void *)sub_22FEB17C0();
    (*(void (**)(char *, uint64_t))(v63 + 8))(v47, v62);
    sub_22FEAFCE0(v68);

    return;
  }
  v45(v49, v36);
  v50 = v76;
  v51 = v73;
  v52 = v49;
  v53 = v77;
  (*(void (**)(char *, uint64_t, uint64_t))(v76 + 32))(v73, v41, v77);
  v54 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
  v54(v52, v53);
  sub_22FEB0B20(v34, &qword_255E52128);
  sub_22FEB0B20(v35, &qword_255E52128);
  v55 = objc_msgSend(v78, sel_pageViewController);
  v56 = objc_msgSend(v55, sel_viewControllers);

  if (!v56)
  {
LABEL_42:
    v54((uint64_t)v51, v53);
    return;
  }
  sub_22FEB0B5C();
  v57 = sub_22FEB18EC();

  if (!(v57 >> 62))
  {
    v58 = *(_QWORD *)((v57 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v58)
      goto LABEL_20;
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v58 = sub_22FEB1928();
  swift_bridgeObjectRelease();
  if (!v58)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
LABEL_20:
  v59 = v58 - 1;
  if (__OFSUB__(v58, 1))
  {
    __break(1u);
    goto LABEL_44;
  }
  if ((v57 & 0xC000000000000001) != 0)
  {
LABEL_44:
    v60 = (id)MEMORY[0x2348AF594](v59, v57);
    goto LABEL_25;
  }
  if ((v59 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v59 < *(_QWORD *)((v57 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v60 = *(id *)(v57 + 8 * v59 + 32);
LABEL_25:
    v61 = v60;
    swift_bridgeObjectRelease();
    sub_22FEB17D8();
    if (swift_dynamicCastClass())
      sub_22FEB17CC();

    goto LABEL_42;
  }
  __break(1u);
}

uint64_t sub_22FEAF78C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22FEAF7B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;

  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E52120);
  return v3(a1, a1 + *(int *)(v4 + 48));
}

uint64_t sub_22FEAF7F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  void *v7;
  id v8;
  uint64_t v9;

  v2 = sub_22FEB1730();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = MEMORY[0x2348AFBDC](a1 + 16);
  if (result)
  {
    v7 = (void *)result;
    v8 = objc_msgSend((id)objc_opt_self(), sel_dtoLearnMoreLinkURL);
    sub_22FEB1724();

    sub_22FEAF91C();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

uint64_t sub_22FEAF8D4()
{
  uint64_t v0;

  return sub_22FEAF7F4(v0);
}

uint64_t sub_22FEAF8DC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2348AFB94](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_22FEAF91C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;

  v1 = sub_22FEB1760();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22FEB1754();
  v15 = 0;
  v16 = 0xE000000000000000;
  sub_22FEB1910();
  v5 = objc_msgSend(v0, sel_description);
  v6 = sub_22FEB18B0();
  v8 = v7;
  swift_bridgeObjectRelease();

  v15 = v6;
  v16 = v8;
  sub_22FEB18D4();
  sub_22FEB1730();
  sub_22FEB0DEC(&qword_255E52190, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
  sub_22FEB194C();
  sub_22FEB18D4();
  swift_bridgeObjectRelease();
  sub_22FEB1748();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v9 = (void *)objc_opt_self();
  v10 = objc_msgSend(v9, sel_sharedApplication);
  v11 = (void *)sub_22FEB1718();
  LODWORD(v5) = objc_msgSend(v10, sel_canOpenURL_, v11);

  if ((_DWORD)v5)
  {
    v12 = objc_msgSend(v9, sel_sharedApplication);
    v13 = (void *)sub_22FEB1718();
    sub_22FEB03AC(MEMORY[0x24BEE4AF8]);
    type metadata accessor for OpenExternalURLOptionsKey();
    sub_22FEB0DEC(&qword_255E52198, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22FEB505C);
    v14 = (void *)sub_22FEB1874();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_openURL_options_completionHandler_, v13, v14, 0);

  }
}

uint64_t sub_22FEAFB8C@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = sub_22FEB1808();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v13 - v8;
  if (objc_msgSend(v1, sel_viewModel))
  {
    sub_22FEB17B4();
    if (swift_dynamicCastClass())
    {
      sub_22FEB176C();
      swift_unknownObjectRelease();
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v7, v3);
      sub_22FEB17F0();
      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    }
    swift_unknownObjectRelease();
  }
  v11 = *MEMORY[0x24BE607F8];
  v12 = sub_22FEB1820();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(a1, v11, v12);
}

void sub_22FEAFCE0(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  char **v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  int v46;
  void *v47;
  _BYTE *v48;
  void *v49;
  id v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  void *v57;
  _QWORD v58[2];

  v2 = v1;
  v4 = sub_22FEB1820();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(v1, sel_presentationContext);
  if (!v8)
  {
    sub_22FEB17B4();
    sub_22FEAEA1C();
    v47 = (void *)swift_allocError();
    *v48 = 0;
    v49 = (void *)sub_22FEB17A8();

    sub_22FEAEA60(0, v49);
    return;
  }
  v9 = v8;
  v10 = &selRef_setIsPasscodeRecoveryOptionVisible_;
  if ((objc_msgSend(v1, sel_isInViewHierarchy) & 1) != 0)
    goto LABEL_20;
  v11 = objc_msgSend(v1, sel_pageViewController);
  objc_msgSend(v2, sel_addChildViewController_, v11);
  v12 = objc_msgSend(v11, sel_view);
  if (!v12)
  {
    __break(1u);
    goto LABEL_27;
  }
  v13 = v12;
  objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v14 = objc_msgSend(v2, sel_view);
  if (!v14)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v15 = v14;
  v16 = objc_msgSend(v11, sel_view);
  if (!v16)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v17 = v16;
  v58[0] = a1;
  objc_msgSend(v15, sel_addSubview_, v16);

  v18 = objc_msgSend(v2, sel_view);
  if (!v18)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v19 = v18;
  v20 = objc_msgSend(v18, sel_topAnchor);

  v21 = objc_msgSend(v11, sel_view);
  if (!v21)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v22 = v21;
  v23 = objc_msgSend(v21, sel_topAnchor);

  v24 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v23);
  objc_msgSend(v24, sel_setActive_, 1);

  v25 = objc_msgSend(v2, sel_view);
  if (!v25)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v26 = v25;
  v27 = objc_msgSend(v25, sel_leadingAnchor);

  v28 = objc_msgSend(v11, sel_view);
  if (!v28)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v29 = v28;
  v30 = objc_msgSend(v28, sel_leadingAnchor);

  v31 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v30);
  objc_msgSend(v31, sel_setActive_, 1);

  v32 = objc_msgSend(v2, sel_view);
  if (!v32)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v33 = v32;
  v34 = objc_msgSend(v32, sel_bottomAnchor);

  v35 = objc_msgSend(v11, sel_view);
  if (!v35)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v36 = v35;
  v37 = objc_msgSend(v35, sel_bottomAnchor);

  v38 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v37);
  objc_msgSend(v38, sel_setActive_, 1);

  v39 = objc_msgSend(v2, sel_view);
  if (!v39)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v40 = v39;
  v41 = objc_msgSend(v39, sel_trailingAnchor);

  v42 = objc_msgSend(v11, sel_view);
  if (!v42)
  {
LABEL_36:
    __break(1u);
    return;
  }
  v43 = v42;
  v44 = objc_msgSend(v42, sel_trailingAnchor);

  v45 = objc_msgSend(v41, sel_constraintEqualToAnchor_, v44);
  objc_msgSend(v45, sel_setActive_, 1);

  objc_msgSend(v11, sel_didMoveToParentViewController_, v2);
  sub_22FEAFB8C((uint64_t)v7);
  v46 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v46 == *MEMORY[0x24BE607F0])
  {
    objc_msgSend(v9, sel_showViewController_sender_, v2, 0);
    a1 = (void *)v58[0];
    v10 = &selRef_setIsPasscodeRecoveryOptionVisible_;
  }
  else
  {
    a1 = (void *)v58[0];
    v10 = &selRef_setIsPasscodeRecoveryOptionVisible_;
    if (v46 == *MEMORY[0x24BE607F8])
    {
      objc_msgSend(v2, sel_setModalInPresentation_, 1);
      objc_msgSend(v9, sel_presentViewController_animated_completion_, v2, 1, 0);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
LABEL_20:
  v50 = objc_msgSend(v2, v10[223]);
  v51 = (unint64_t)objc_msgSend(v50, sel_viewControllers);

  if (v51)
  {
    sub_22FEB0B5C();
    v52 = sub_22FEB18EC();

    if (v52 >> 62)
    {
      swift_bridgeObjectRetain();
      v53 = sub_22FEB1928();
      swift_bridgeObjectRelease();
    }
    else
    {
      v53 = *(_QWORD *)((v52 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v51 = v53 != 0;
  }
  v54 = objc_msgSend(v2, v10[223]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E521B8);
  v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_22FEB4DD0;
  *(_QWORD *)(v55 + 32) = a1;
  v58[1] = v55;
  sub_22FEB18F8();
  sub_22FEB0B5C();
  v56 = a1;
  v57 = (void *)sub_22FEB18E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v54, sel_setViewControllers_direction_animated_completion_, v57, 0, v51, 0);

}

unint64_t sub_22FEB03AC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E521A0);
  v2 = sub_22FEB1934();
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
    sub_22FEB0ADC(v6, (uint64_t)&v13, &qword_255E521A8);
    v7 = v13;
    result = sub_22FEB08D8(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_22FEB0958(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
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

void type metadata accessor for OpenExternalURLOptionsKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_255E521C0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_255E521C0);
  }
}

uint64_t sub_22FEB052C(uint64_t a1, uint64_t a2)
{
  return sub_22FEB0674(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_22FEB0538(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_22FEB1898();
  *a2 = 0;
  return result;
}

uint64_t sub_22FEB05AC(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_22FEB18A4();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_22FEB0628@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_22FEB18B0();
  v2 = sub_22FEB188C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22FEB0668(uint64_t a1, uint64_t a2)
{
  return sub_22FEB0674(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_22FEB0674(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_22FEB18B0();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22FEB06B0()
{
  sub_22FEB18B0();
  sub_22FEB18C8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22FEB06F0()
{
  uint64_t v0;

  sub_22FEB18B0();
  sub_22FEB1994();
  sub_22FEB18C8();
  v0 = sub_22FEB19AC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22FEB0760()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_22FEB18B0();
  v2 = v1;
  if (v0 == sub_22FEB18B0() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_22FEB1958();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_22FEB07E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_22FEB188C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22FEB082C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_22FEB18B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22FEB0854()
{
  sub_22FEB0DEC(&qword_255E52198, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22FEB505C);
  sub_22FEB0DEC((unint64_t *)&unk_255E521E0, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22FEB4FB0);
  return sub_22FEB1940();
}

unint64_t sub_22FEB08D8(uint64_t a1)
{
  uint64_t v2;

  sub_22FEB18B0();
  sub_22FEB1994();
  sub_22FEB18C8();
  v2 = sub_22FEB19AC();
  swift_bridgeObjectRelease();
  return sub_22FEB0968(a1, v2);
}

_OWORD *sub_22FEB0958(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_22FEB0968(uint64_t a1, uint64_t a2)
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
    v6 = sub_22FEB18B0();
    v8 = v7;
    if (v6 == sub_22FEB18B0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_22FEB1958();
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
          v13 = sub_22FEB18B0();
          v15 = v14;
          if (v13 == sub_22FEB18B0() && v15 == v16)
            break;
          v18 = sub_22FEB1958();
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

uint64_t sub_22FEB0ADC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22FEB0B20(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_22FEB0B5C()
{
  unint64_t result;

  result = qword_255E521B0;
  if (!qword_255E521B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255E521B0);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s13FailureReasonOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s13FailureReasonOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22FEB0C84 + 4 * byte_22FEB4DE5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22FEB0CB8 + 4 * byte_22FEB4DE0[v4]))();
}

uint64_t sub_22FEB0CB8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22FEB0CC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22FEB0CC8);
  return result;
}

uint64_t sub_22FEB0CD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22FEB0CDCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22FEB0CE0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22FEB0CE8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22FEB0CF4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22FEB0D00(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *_s13FailureReasonOMa()
{
  return &_s13FailureReasonON;
}

unint64_t sub_22FEB0D24()
{
  unint64_t result;

  result = qword_255E523D0[0];
  if (!qword_255E523D0[0])
  {
    result = MEMORY[0x2348AFB94](&unk_22FEB4F14, &_s13FailureReasonON);
    atomic_store(result, qword_255E523D0);
  }
  return result;
}

uint64_t sub_22FEB0D68()
{
  return sub_22FEB0DEC(&qword_255E521C8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22FEB4F74);
}

uint64_t sub_22FEB0D94()
{
  return sub_22FEB0DEC(&qword_255E521D0, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22FEB4F48);
}

uint64_t sub_22FEB0DC0()
{
  return sub_22FEB0DEC(&qword_255E521D8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22FEB4FE4);
}

uint64_t sub_22FEB0DEC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2348AFB94](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id sub_22FEB0E2C()
{
  return objc_msgSend((id)objc_opt_self(), sel_createContext);
}

id sub_22FEB0E88()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id sub_22FEB0EA8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LAContextProvider();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for LAContextProvider()
{
  return objc_opt_self();
}

id sub_22FEB0F34()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LAContextProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t __getCDPStateControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[LAPSCurrentPasscodeService changePasscode:to:enableRecovery:completion:].cold.1(v0);
}

uint64_t sub_22FEB16E8()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_22FEB16F4()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_22FEB1700()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_22FEB170C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_22FEB1718()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_22FEB1724()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_22FEB1730()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22FEB173C()
{
  return MEMORY[0x24BE60510]();
}

uint64_t sub_22FEB1748()
{
  return MEMORY[0x24BE60520]();
}

uint64_t sub_22FEB1754()
{
  return MEMORY[0x24BE60528]();
}

uint64_t sub_22FEB1760()
{
  return MEMORY[0x24BE60540]();
}

uint64_t sub_22FEB176C()
{
  return MEMORY[0x24BE60740]();
}

uint64_t sub_22FEB1778()
{
  return MEMORY[0x24BE60748]();
}

uint64_t sub_22FEB1784()
{
  return MEMORY[0x24BE60750]();
}

uint64_t sub_22FEB1790()
{
  return MEMORY[0x24BE60758]();
}

uint64_t sub_22FEB179C()
{
  return MEMORY[0x24BE60788]();
}

uint64_t sub_22FEB17A8()
{
  return MEMORY[0x24BE607A0]();
}

uint64_t sub_22FEB17B4()
{
  return MEMORY[0x24BE607A8]();
}

uint64_t sub_22FEB17C0()
{
  return MEMORY[0x24BE607B0]();
}

uint64_t sub_22FEB17CC()
{
  return MEMORY[0x24BE607B8]();
}

uint64_t sub_22FEB17D8()
{
  return MEMORY[0x24BE607C0]();
}

uint64_t sub_22FEB17E4()
{
  return MEMORY[0x24BE607C8]();
}

uint64_t sub_22FEB17F0()
{
  return MEMORY[0x24BE607D8]();
}

uint64_t sub_22FEB17FC()
{
  return MEMORY[0x24BE607E0]();
}

uint64_t sub_22FEB1808()
{
  return MEMORY[0x24BE607E8]();
}

uint64_t sub_22FEB1814()
{
  return MEMORY[0x24BE60800]();
}

uint64_t sub_22FEB1820()
{
  return MEMORY[0x24BE60808]();
}

uint64_t sub_22FEB182C()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_22FEB1838()
{
  return MEMORY[0x24BDB9B60]();
}

uint64_t sub_22FEB1844()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_22FEB1850()
{
  return MEMORY[0x24BDB9FA8]();
}

uint64_t sub_22FEB185C()
{
  return MEMORY[0x24BDBA0E8]();
}

uint64_t sub_22FEB1868()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_22FEB1874()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22FEB1880()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_22FEB188C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22FEB1898()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_22FEB18A4()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_22FEB18B0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22FEB18BC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22FEB18C8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22FEB18D4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22FEB18E0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_22FEB18EC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22FEB18F8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22FEB1904()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_22FEB1910()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22FEB191C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_22FEB1928()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22FEB1934()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22FEB1940()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_22FEB194C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22FEB1958()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22FEB1964()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_22FEB1970()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_22FEB197C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_22FEB1988()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_22FEB1994()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22FEB19A0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22FEB19AC()
{
  return MEMORY[0x24BEE4328]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t LACLogDTO()
{
  return MEMORY[0x24BE60610]();
}

uint64_t LACLogPasscodeService()
{
  return MEMORY[0x24BE60620]();
}

uint64_t LALogForCategory()
{
  return MEMORY[0x24BDDA9A0]();
}

uint64_t LALogTypeForInternalError()
{
  return MEMORY[0x24BDDA9B0]();
}

uint64_t MKBGetDeviceLockStateInfo()
{
  return MEMORY[0x24BE67170]();
}

uint64_t MKBKeyBagMementoGetBlobState()
{
  return MEMORY[0x24BE671B8]();
}

uint64_t MKBVerifyPasswordWithContext()
{
  return MEMORY[0x24BE671F8]();
}

uint64_t NSLocalizedStringFromLACBiometryType()
{
  return MEMORY[0x24BE606A0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t SecPasswordIsPasswordWeak2()
{
  return MEMORY[0x24BDE8BD8]();
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x24BEB37B0]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BEBE0B0](category);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x24BDADFD8](source);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
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


void sub_1A9D33870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _CS_Private_MainScreenClass()
{
  if (_CS_Private_MainScreenClass_onceToken != -1)
    dispatch_once(&_CS_Private_MainScreenClass_onceToken, &__block_literal_global_5);
  return _CS_Private_MainScreenClass_mainScreenClass;
}

uint64_t _CS_Private_BaseIsN84OrSimilarDevice()
{
  if (_CS_Private_BaseIsN84OrSimilarDevice_onceToken != -1)
    dispatch_once(&_CS_Private_BaseIsN84OrSimilarDevice_onceToken, &__block_literal_global_9);
  return _CS_Private_BaseIsN84OrSimilarDevice_baseIsN84OrSimilarDevice;
}

uint64_t _CS_Private_ProductType()
{
  if (_CS_Private_ProductType_onceToken != -1)
    dispatch_once(&_CS_Private_ProductType_onceToken, &__block_literal_global_8);
  return _CS_Private_ProductType_productType;
}

uint64_t CSEffectiveArtworkSubtype()
{
  if (CSEffectiveArtworkSubtype_onceToken != -1)
    dispatch_once(&CSEffectiveArtworkSubtype_onceToken, &__block_literal_global_1);
  return CSEffectiveArtworkSubtype_deviceSubtype;
}

uint64_t CSTimeNumberingSystemStringToType(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("latn")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("arab")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("deva")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("khmr")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("mymr")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("beng")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("guru")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("gujr")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("taml")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("telu")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("mlym")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("knda")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("orya")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("olck")) & 1) != 0)
  {
    v2 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("mtei")) & 1) != 0)
  {
    v2 = 15;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("arabext")))
  {
    v2 = 16;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *CSTimeNumberingSystemTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xF)
    return 0;
  else
    return off_1E55EB090[a1 - 1];
}

BOOL CSTimeNumberingSystemTypeRequiresLanguageTagging(uint64_t a1)
{
  return a1 == 3 || a1 == 16;
}

__CFString *CSTimeNumberingSystemTypeLanguageTag(uint64_t a1)
{
  void *v1;
  __CFString *v2;

  if (a1 == 16)
  {
    v2 = CFSTR("ur");
  }
  else if (a1 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:", &unk_1E55F0878);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "firstObject");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void sub_1A9D3A988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPRPosterContentVibrantMonochromeStyleClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!PosterKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E55EB188;
    v5 = 0;
    PosterKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PosterKitLibraryCore_frameworkLibrary)
    __getPRPosterContentVibrantMonochromeStyleClass_block_invoke_cold_1(&v3);
  result = objc_getClass("PRPosterContentVibrantMonochromeStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPRPosterContentVibrantMonochromeStyleClass_block_invoke_cold_2();
  getPRPosterContentVibrantMonochromeStyleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id CSFrameworkBundle()
{
  if (CSFrameworkBundle___once != -1)
    dispatch_once(&CSFrameworkBundle___once, &__block_literal_global_3);
  return (id)CSFrameworkBundle___bundle;
}

id CSLogCommon()
{
  if (CSLogCommon_onceToken != -1)
    dispatch_once(&CSLogCommon_onceToken, &__block_literal_global_4);
  return (id)CSLogCommon___logObj;
}

uint64_t sub_1A9D3F7B4()
{
  return 1;
}

uint64_t sub_1A9D3F7BC()
{
  return 1;
}

uint64_t sub_1A9D3F7C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;

  v6 = sub_1A9D4334C(a1, a2, a3, a4);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v4 + qword_1EEB58598) - 8) + 8))(a1);
  return v6;
}

uint64_t sub_1A9D3F810(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *MEMORY[0x1E0DEEDD8] & *v1;
  v4 = sub_1A9D432D0(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + qword_1EEB58598) - 8) + 8))(a1);
  return v4;
}

void *sub_1A9D3F870(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_1A9D3F8B0(a1, a2);
}

void *sub_1A9D3F8B0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  uint64_t v11;

  v4 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v2) + qword_1EEB58598);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  (*(void (**)(char *))(v5 + 16))((char *)&v11 - v6);
  v7 = (void *)sub_1A9D4432C();
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v9 = v7;
  v8(a2, v4);
  if (v7)

  return v7;
}

id sub_1A9D3F970(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id sub_1A9D3F9B0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v6;
  id v7;
  objc_super v9;

  v6 = (objc_class *)type metadata accessor for LockScreenHostingController(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + qword_1EEB58598), *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + qword_1EEB58598 + 8), a4);
  v9.receiver = v4;
  v9.super_class = v6;
  v7 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);

  return v7;
}

id sub_1A9D3FA24(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  return sub_1A9D3F9B0(v3, v4, v5, v6);
}

id sub_1A9D3FA48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for LockScreenHostingController(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + qword_1EEB58598), *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + qword_1EEB58598 + 8), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_1A9D3FAA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = type metadata accessor for LockScreenHostingController(0, a1, a2, a4);
  return sub_1A9D4334C(v4, v5, v6, v7);
}

uint64_t sub_1A9D3FAD8()
{
  uint64_t v0;

  v0 = sub_1A9D442B4();
  __swift_allocate_value_buffer(v0, qword_1EEB58580);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EEB58580);
  return sub_1A9D442A8();
}

uint64_t sub_1A9D3FB48()
{
  uint64_t v0;

  if (qword_1EEB58390 != -1)
    swift_once();
  v0 = sub_1A9D442B4();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEB58580);
}

uint64_t sub_1A9D3FB90@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EEB58390 != -1)
    swift_once();
  v2 = sub_1A9D442B4();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EEB58580);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

id sub_1A9D3FC10()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_hostingController);
}

uint64_t sub_1A9D3FC64()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_animatesChanges);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1A9D3FCF0(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___CSTitleElementViewAdapter_animatesChanges);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t sub_1A9D3FD38@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x78))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1A9D3FD7C(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x80))(*a1);
}

uint64_t (*sub_1A9D3FDB8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1A9D3FE74()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 152);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_1A9D3FF28(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  void (*v8)(uint64_t, uint64_t);

  v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x78))();
  if ((v5 & 1) != 0)
  {
    MEMORY[0x1E0C80A78](v5, v6);
    sub_1A9D443B0();
    sub_1A9D442C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(void (**)(uint64_t, uint64_t))(**(_QWORD **)((char *)v2
                                                               + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                                 + 160);
    swift_retain();
    v8(a1, a2);
  }
  return swift_release();
}

uint64_t sub_1A9D40028@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xC0))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1A9D40068(uint64_t *a1, _QWORD **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xC8);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_1A9D400BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t, uint64_t);

  v5 = *(void (**)(uint64_t, uint64_t))(**(_QWORD **)(a1 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                               + 160);
  swift_retain();
  swift_bridgeObjectRetain();
  v5(a2, a3);
  return swift_release();
}

uint64_t (*sub_1A9D4011C(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = OBJC_IVAR___CSTitleElementViewAdapter_coordinator;
  a1[2] = v1;
  a1[3] = v3;
  v4 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v1 + v3) + 152);
  v5 = swift_retain();
  v6 = v4(v5);
  v8 = v7;
  swift_release();
  *a1 = v6;
  a1[1] = v8;
  return sub_1A9D40184;
}

uint64_t sub_1A9D40184(uint64_t *a1, char a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t, uint64_t);

  v3 = a1[1];
  v4 = (_QWORD *)a1[2];
  v5 = *a1;
  v6 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v4) + 0x78);
  if ((a2 & 1) != 0)
  {
    v7 = swift_bridgeObjectRetain();
    v8 = ((uint64_t (*)(uint64_t))v6)(v7);
    if ((v8 & 1) != 0)
    {
      MEMORY[0x1E0C80A78](v8, v9);
      sub_1A9D443B0();
      sub_1A9D442C0();
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      v13 = *(void (**)(uint64_t, uint64_t))(**(_QWORD **)((char *)v4 + a1[3]) + 160);
      swift_retain();
      v13(v5, v3);
      swift_release();
    }
    return swift_bridgeObjectRelease();
  }
  else
  {
    v10 = v6();
    if ((v10 & 1) != 0)
    {
      MEMORY[0x1E0C80A78](v10, v11);
      sub_1A9D443B0();
      sub_1A9D442C0();
      swift_release();
      return swift_bridgeObjectRelease();
    }
    else
    {
      v14 = *(void (**)(uint64_t, uint64_t))(**(_QWORD **)((char *)v4 + a1[3]) + 160);
      swift_retain();
      v14(v5, v3);
      return swift_release();
    }
  }
}

uint64_t sub_1A9D40394()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 200);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_1A9D40424(void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  void (*v6)(void *);

  v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x78))();
  if ((v3 & 1) != 0)
  {
    MEMORY[0x1E0C80A78](v3, v4);
    sub_1A9D443B0();
    sub_1A9D442C0();

  }
  else
  {
    v6 = *(void (**)(void *))(**(_QWORD **)((char *)v1 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                       + 208);
    swift_retain();
    v6(a1);
  }
  return swift_release();
}

uint64_t sub_1A9D40508@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xD8))();
  *a2 = result;
  return result;
}

uint64_t sub_1A9D40548(id *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xE0))(*a1);
}

uint64_t sub_1A9D40588(uint64_t a1, void *a2)
{
  void (*v3)(void *);

  v3 = *(void (**)(void *))(**(_QWORD **)(a1 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 208);
  swift_retain();
  v3(a2);
  return swift_release();
}

void (*sub_1A9D405D4(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;

  v3 = OBJC_IVAR___CSTitleElementViewAdapter_coordinator;
  a1[1] = v1;
  a1[2] = v3;
  v4 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v1 + v3) + 200);
  v5 = swift_retain();
  v6 = v4(v5);
  swift_release();
  *a1 = v6;
  return sub_1A9D40638;
}

void sub_1A9D40638(uint64_t a1, char a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t (*v5)(void);
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(id);
  void (*v12)(void *);

  v3 = *(void **)a1;
  v4 = *(_QWORD **)(a1 + 8);
  v5 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v4) + 0x78);
  if ((a2 & 1) != 0)
  {
    v6 = v3;
    v7 = v5();
    if ((v7 & 1) != 0)
    {
      MEMORY[0x1E0C80A78](v7, v8);
      sub_1A9D443B0();
      sub_1A9D442C0();
      swift_release();

    }
    else
    {
      v11 = *(void (**)(id))(**(_QWORD **)((char *)v4 + *(_QWORD *)(a1 + 16)) + 208);
      swift_retain();
      v11(v6);
      swift_release();
    }

  }
  else
  {
    v9 = v5();
    if ((v9 & 1) != 0)
    {
      MEMORY[0x1E0C80A78](v9, v10);
      sub_1A9D443B0();
      sub_1A9D442C0();
      swift_release();

    }
    else
    {
      v12 = *(void (**)(void *))(**(_QWORD **)((char *)v4 + *(_QWORD *)(a1 + 16)) + 208);
      swift_retain();
      v12(v3);
      swift_release();
    }
  }
}

uint64_t sub_1A9D4081C()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 248);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_1A9D408AC(void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  void (*v6)(void *);

  v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x78))();
  if ((v3 & 1) != 0)
  {
    MEMORY[0x1E0C80A78](v3, v4);
    sub_1A9D443B0();
    sub_1A9D442C0();

  }
  else
  {
    v6 = *(void (**)(void *))(**(_QWORD **)((char *)v1 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                       + 256);
    swift_retain();
    v6(a1);
  }
  return swift_release();
}

uint64_t sub_1A9D40990@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xF0))();
  *a2 = result;
  return result;
}

uint64_t sub_1A9D409D0(id *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xF8))(*a1);
}

uint64_t sub_1A9D40A10(uint64_t a1, void *a2)
{
  void (*v3)(void *);

  v3 = *(void (**)(void *))(**(_QWORD **)(a1 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 256);
  swift_retain();
  v3(a2);
  return swift_release();
}

void (*sub_1A9D40A5C(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;

  v3 = OBJC_IVAR___CSTitleElementViewAdapter_coordinator;
  a1[1] = v1;
  a1[2] = v3;
  v4 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v1 + v3) + 248);
  v5 = swift_retain();
  v6 = v4(v5);
  swift_release();
  *a1 = v6;
  return sub_1A9D40AC0;
}

void sub_1A9D40AC0(uint64_t a1, char a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t (*v5)(void);
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(id);
  void (*v12)(void *);

  v3 = *(void **)a1;
  v4 = *(_QWORD **)(a1 + 8);
  v5 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v4) + 0x78);
  if ((a2 & 1) != 0)
  {
    v6 = v3;
    v7 = v5();
    if ((v7 & 1) != 0)
    {
      MEMORY[0x1E0C80A78](v7, v8);
      sub_1A9D443B0();
      sub_1A9D442C0();
      swift_release();

    }
    else
    {
      v11 = *(void (**)(id))(**(_QWORD **)((char *)v4 + *(_QWORD *)(a1 + 16)) + 256);
      swift_retain();
      v11(v6);
      swift_release();
    }

  }
  else
  {
    v9 = v5();
    if ((v9 & 1) != 0)
    {
      MEMORY[0x1E0C80A78](v9, v10);
      sub_1A9D443B0();
      sub_1A9D442C0();
      swift_release();

    }
    else
    {
      v12 = *(void (**)(void *))(**(_QWORD **)((char *)v4 + *(_QWORD *)(a1 + 16)) + 256);
      swift_retain();
      v12(v3);
      swift_release();
    }
  }
}

uint64_t sub_1A9D40CA4()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 296);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_1A9D40D44(uint64_t a1)
{
  uint64_t v1;
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(**(_QWORD **)(v1 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 304);
  swift_retain();
  v3(a1);
  return swift_release();
}

uint64_t sub_1A9D40D90@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x108))();
  *a2 = result;
  return result;
}

uint64_t sub_1A9D40DD0(_QWORD *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x110))(*a1);
}

uint64_t (*sub_1A9D40E0C(uint64_t *a1))(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;

  v3 = OBJC_IVAR___CSTitleElementViewAdapter_coordinator;
  a1[1] = v1;
  a1[2] = v3;
  v4 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v1 + v3) + 296);
  v5 = swift_retain();
  v6 = v4(v5);
  swift_release();
  *a1 = v6;
  return sub_1A9D40E70;
}

uint64_t sub_1A9D40E70(uint64_t *a1)
{
  uint64_t v1;
  void (*v2)(uint64_t);

  v1 = *a1;
  v2 = *(void (**)(uint64_t))(**(_QWORD **)(a1[1] + a1[2]) + 304);
  swift_retain();
  v2(v1);
  return swift_release();
}

double sub_1A9D40F1C()
{
  uint64_t v0;
  double (*v1)(uint64_t);
  uint64_t v2;
  double v3;

  v1 = *(double (**)(uint64_t))(**(_QWORD **)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator) + 344);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_1A9D40FCC(double a1)
{
  uint64_t v1;
  void (*v3)(uint64_t, double);
  uint64_t v4;

  v3 = *(void (**)(uint64_t, double))(**(_QWORD **)(v1 + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                              + 352);
  v4 = swift_retain();
  v3(v4, a1);
  return swift_release();
}

void sub_1A9D41018(_QWORD **a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x120))();
}

uint64_t sub_1A9D41058(double *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(double))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x128))(*a1);
}

uint64_t (*sub_1A9D41094(double *a1))(double *a1)
{
  uint64_t v1;
  uint64_t v3;
  double (*v4)(uint64_t);
  uint64_t v5;
  double v6;

  v3 = OBJC_IVAR___CSTitleElementViewAdapter_coordinator;
  *((_QWORD *)a1 + 1) = v1;
  *((_QWORD *)a1 + 2) = v3;
  v4 = *(double (**)(uint64_t))(**(_QWORD **)(v1 + v3) + 344);
  v5 = swift_retain();
  v6 = v4(v5);
  swift_release();
  *a1 = v6;
  return sub_1A9D41100;
}

uint64_t sub_1A9D41100(double *a1)
{
  double v1;
  void (*v2)(uint64_t, double);
  uint64_t v3;

  v1 = *a1;
  v2 = *(void (**)(uint64_t, double))(**(_QWORD **)(*((_QWORD *)a1 + 1) + *((_QWORD *)a1 + 2)) + 352);
  v3 = swift_retain();
  v2(v3, v1);
  return swift_release();
}

void sub_1A9D411FC()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
  v2 = objc_msgSend(v1, sel_view);

  if (v2)
  {
    objc_msgSend(v2, sel_frame);

  }
  else
  {
    __break(1u);
  }
}

void sub_1A9D41354(double a1, double a2, double a3, double a4)
{
  _QWORD *v4;
  void *v9;
  id v10;

  v9 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v4) + 0x70))();
  v10 = objc_msgSend(v9, sel_view);

  if (v10)
  {
    objc_msgSend(v10, sel_setFrame_, a1, a2, a3, a4);

  }
  else
  {
    __break(1u);
  }
}

void sub_1A9D41400(_QWORD **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(double *)a2 = (*(double (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x138))();
  *(_QWORD *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 24) = v5;
}

uint64_t sub_1A9D41444(double *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(double, double, double, double))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x140))(*a1, a1[1], a1[2], a1[3]);
}

void sub_1A9D41484(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t (*v4)(void);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x70);
  v3[5] = v4;
  v5 = (void *)v4();
  v6 = objc_msgSend(v5, sel_view);

  if (v6)
  {
    objc_msgSend(v6, sel_frame);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    *v3 = v8;
    v3[1] = v10;
    v3[2] = v12;
    v3[3] = v14;
  }
  else
  {
    __break(1u);
  }
}

void sub_1A9D4154C(double **a1, char a2)
{
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v3 = *a1;
  v4 = **a1;
  v5 = (*a1)[1];
  v6 = (*a1)[2];
  v7 = (*a1)[3];
  v8 = (void *)(*((uint64_t (**)(double **))*a1 + 5))(a1);
  v9 = objc_msgSend(v8, sel_view);

  if ((a2 & 1) != 0)
  {
    if (v9)
    {
LABEL_5:
      objc_msgSend(v9, sel_setFrame_, v4, v5, v6, v7);

      free(v3);
      return;
    }
    __break(1u);
  }
  if (v9)
    goto LABEL_5;
  __break(1u);
}

uint64_t sub_1A9D415F0()
{
  return 0;
}

uint64_t sub_1A9D4163C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___CSTitleElementViewAdapter_visible);
  swift_beginAccess();
  return *v1;
}

void sub_1A9D416E8(char a1)
{
  uint64_t v1;
  char *v3;

  v3 = (char *)(v1 + OBJC_IVAR___CSTitleElementViewAdapter_visible);
  swift_beginAccess();
  *v3 = a1;
  sub_1A9D419A4(a1);
}

uint64_t sub_1A9D41740@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x150))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1A9D41784(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x158))(*a1);
}

void (*sub_1A9D417C0(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___CSTitleElementViewAdapter_visible;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_1A9D41818;
}

void sub_1A9D41818(_QWORD **a1, char a2)
{
  _QWORD *v3;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_1A9D419A4(*(_BYTE *)(v3[3] + v3[4]));
  free(v3);
}

id TitleElementViewAdapter.__allocating_init(frame:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return _s13CoverSheetKit23TitleElementViewAdapterC5frameACSo6CGRectV_tcfc_0();
}

uint64_t sub_1A9D41880()
{
  return 0;
}

id sub_1A9D4188C()
{
  return objc_msgSend((id)objc_opt_self(), sel_whiteColor);
}

id sub_1A9D418B8()
{
  if (qword_1EEB58398 != -1)
    swift_once();
  return (id)qword_1EEB583A0;
}

double sub_1A9D418F8()
{
  return 0.5;
}

uint64_t sub_1A9D41900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v12;

  v12 = swift_allocObject();
  sub_1A9D44284();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  *(_QWORD *)(v12 + 32) = a3;
  *(_QWORD *)(v12 + 40) = a4;
  *(_QWORD *)(v12 + 48) = a5;
  *(double *)(v12 + 56) = a6;
  return v12;
}

void sub_1A9D419A4(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  void (*v9)(int *, _QWORD);
  int v10[8];

  v2 = v1;
  if (qword_1EEB58390 != -1)
    swift_once();
  v4 = sub_1A9D442B4();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EEB58580);
  v5 = sub_1A9D4429C();
  v6 = sub_1A9D443D4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    v10[0] = a1 & 1;
    sub_1A9D443E0();
    _os_log_impl(&dword_1A9D2F000, v5, v6, "[TitleElementViewAdapter] text became visible: %{BOOL}d", v7, 8u);
    MEMORY[0x1AF420BC8](v7, -1, -1);
  }

  v8 = *(id *)(v2 + OBJC_IVAR___CSTitleElementViewAdapter_hostingController);
  v9 = (void (*)(int *, _QWORD))sub_1A9D44320();
  sub_1A9D44350();
  v9(v10, 0);

}

id TitleElementViewAdapter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void TitleElementViewAdapter.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TitleElementViewAdapter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TitleElementViewAdapter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A9D41BF4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_release();
  *v1 = a1;
  return result;
}

uint64_t (*sub_1A9D41C1C())()
{
  return nullsub_1;
}

uint64_t sub_1A9D41C2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v43 = a2;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEB58270);
  MEMORY[0x1E0C80A78](v39, v3);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEB58278);
  MEMORY[0x1E0C80A78](v41, v6);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEB58280);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEB58288);
  MEMORY[0x1E0C80A78](v42, v13);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEB58290);
  v17 = MEMORY[0x1E0C80A78](v40, v16);
  v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17, v20);
  v22 = (char *)&v38 - v21;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEB58298);
  v25 = MEMORY[0x1E0C80A78](v23, v24);
  v27 = (char *)&v38 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(v25);
  if (v28 == 2)
  {
    *(_QWORD *)v5 = sub_1A9D44314();
    *((_QWORD *)v5 + 1) = 0;
    v5[16] = 1;
    v34 = &v5[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEB58310) + 44)];
    sub_1A9D42150(a1, (uint64_t)v22);
    sub_1A9D44014((uint64_t)v22, (uint64_t)v19, &qword_1EEB58290);
    *(_QWORD *)v34 = 0;
    v34[8] = 1;
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEB58318);
    sub_1A9D44014((uint64_t)v19, (uint64_t)&v34[*(int *)(v35 + 48)], &qword_1EEB58290);
    sub_1A9D44068((uint64_t)v22, &qword_1EEB58290);
    sub_1A9D44068((uint64_t)v19, &qword_1EEB58290);
    sub_1A9D44014((uint64_t)v5, (uint64_t)v12, &qword_1EEB58270);
    swift_storeEnumTagMultiPayload();
    v36 = MEMORY[0x1E0CDFB10];
    sub_1A9D438B4(&qword_1EEB582A8, &qword_1EEB58298, MEMORY[0x1E0CDFB10]);
    sub_1A9D438B4(&qword_1EEB582B0, &qword_1EEB58270, v36);
    sub_1A9D44344();
    sub_1A9D44014((uint64_t)v15, (uint64_t)v8, &qword_1EEB58288);
    swift_storeEnumTagMultiPayload();
    sub_1A9D43640();
    sub_1A9D43728();
    sub_1A9D44344();
    sub_1A9D44068((uint64_t)v15, &qword_1EEB58288);
    v32 = (uint64_t)v5;
    v33 = &qword_1EEB58270;
  }
  else if (v28)
  {
    sub_1A9D42150(a1, (uint64_t)v22);
    sub_1A9D44014((uint64_t)v22, (uint64_t)v8, &qword_1EEB58290);
    swift_storeEnumTagMultiPayload();
    sub_1A9D43640();
    sub_1A9D43728();
    sub_1A9D44344();
    v32 = (uint64_t)v22;
    v33 = &qword_1EEB58290;
  }
  else
  {
    *(_QWORD *)v27 = sub_1A9D44314();
    *((_QWORD *)v27 + 1) = 0;
    v27[16] = 1;
    v29 = (uint64_t)&v27[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEB58320) + 44)];
    sub_1A9D42150(a1, (uint64_t)v22);
    sub_1A9D44014((uint64_t)v22, (uint64_t)v19, &qword_1EEB58290);
    sub_1A9D44014((uint64_t)v19, v29, &qword_1EEB58290);
    v30 = v29 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEB58328) + 48);
    *(_QWORD *)v30 = 0;
    *(_BYTE *)(v30 + 8) = 1;
    sub_1A9D44068((uint64_t)v22, &qword_1EEB58290);
    sub_1A9D44068((uint64_t)v19, &qword_1EEB58290);
    sub_1A9D44014((uint64_t)v27, (uint64_t)v12, &qword_1EEB58298);
    swift_storeEnumTagMultiPayload();
    v31 = MEMORY[0x1E0CDFB10];
    sub_1A9D438B4(&qword_1EEB582A8, &qword_1EEB58298, MEMORY[0x1E0CDFB10]);
    sub_1A9D438B4(&qword_1EEB582B0, &qword_1EEB58270, v31);
    sub_1A9D44344();
    sub_1A9D44014((uint64_t)v15, (uint64_t)v8, &qword_1EEB58288);
    swift_storeEnumTagMultiPayload();
    sub_1A9D43640();
    sub_1A9D43728();
    sub_1A9D44344();
    sub_1A9D44068((uint64_t)v15, &qword_1EEB58288);
    v32 = (uint64_t)v27;
    v33 = &qword_1EEB58298;
  }
  return sub_1A9D44068(v32, v33);
}

uint64_t sub_1A9D42150@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  double v24;
  uint64_t KeyPath;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEB58308);
  MEMORY[0x1E0C80A78](v43, v4);
  v6 = (uint64_t *)((char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_1A9D442D8();
  v41 = *(_QWORD *)(v7 - 8);
  v42 = v7;
  v9 = MEMORY[0x1E0C80A78](v7, v8);
  v44 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 152))(v9);
  v46 = v11;
  sub_1A9D43FC0();
  v12 = sub_1A9D44374();
  v14 = v13;
  v16 = v15 & 1;
  (*(void (**)(void))(*(_QWORD *)a1 + 248))();
  sub_1A9D4435C();
  v39 = sub_1A9D44368();
  v40 = v17;
  v19 = v18;
  v21 = v20;
  swift_release();
  v22 = v21 & 1;
  sub_1A9D44004(v12, v14, v16);
  v23 = swift_bridgeObjectRelease();
  v24 = (*(double (**)(uint64_t))(*(_QWORD *)a1 + 344))(v23);
  KeyPath = swift_getKeyPath();
  v26 = (*(uint64_t (**)(void))(*(_QWORD *)a1 + 200))();
  v27 = MEMORY[0x1AF420580](v26);
  v28 = v44;
  sub_1A9D442CC();
  v29 = swift_getKeyPath();
  v30 = v41;
  v31 = v28;
  v32 = v42;
  (*(void (**)(char *, char *, uint64_t))(v41 + 16))((char *)v6 + *(int *)(v43 + 28), v31, v42);
  *v6 = v29;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEB58290);
  sub_1A9D44014((uint64_t)v6, a2 + *(int *)(v33 + 36), &qword_1EEB58308);
  v34 = v39;
  v35 = v40;
  *(_QWORD *)a2 = v39;
  *(_QWORD *)(a2 + 8) = v19;
  *(_BYTE *)(a2 + 16) = v22;
  *(_QWORD *)(a2 + 24) = v35;
  *(_QWORD *)(a2 + 32) = KeyPath;
  *(double *)(a2 + 40) = v24;
  *(_QWORD *)(a2 + 48) = v27;
  v36 = v34;
  sub_1A9D44058(v34, v19, v22);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_1A9D44068((uint64_t)v6, &qword_1EEB58308);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v44, v32);
  sub_1A9D44004(v36, v19, v22);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A9D423D8()
{
  return sub_1A9D44398();
}

uint64_t sub_1A9D423F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1A9D41C2C(*v1, a1);
}

id sub_1A9D423F8()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x1E0DC4AE8]);
  qword_1EEB583A0 = (uint64_t)result;
  return result;
}

uint64_t (*sub_1A9D4243C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1A9D42478()
{
  _QWORD *v0;
  uint64_t v1;

  swift_getKeyPath();
  (*(void (**)(void))(*v0 + 376))();
  swift_release();
  swift_beginAccess();
  v1 = v0[2];
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A9D424E4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 152))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1A9D42514(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 160);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_1A9D42558(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  swift_getKeyPath();
  v6 = v2;
  v7 = a1;
  v8 = a2;
  (*(void (**)(void))(*(_QWORD *)v2 + 384))();
  swift_release();
  return swift_bridgeObjectRelease();
}

void (*sub_1A9D425D8(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  (*(void (**)(void))(*(_QWORD *)v2 + 376))();
  swift_release();
  v4[5] = OBJC_IVAR____TtCV13CoverSheetKit14TitleLabelView11Coordinator___observationRegistrar;
  *v4 = v2;
  swift_getKeyPath();
  v4[6] = sub_1A9D43958();
  sub_1A9D44278();
  swift_release();
  v4[7] = sub_1A9D4243C();
  return sub_1A9D426A0;
}

void sub_1A9D426A0(_QWORD *a1)
{
  sub_1A9D42F64(a1);
}

uint64_t (*sub_1A9D426AC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_1A9D426EC()
{
  id *v0;

  swift_getKeyPath();
  (*((void (**)(void))*v0 + 47))();
  swift_release();
  swift_beginAccess();
  return v0[4];
}

uint64_t sub_1A9D42748@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 200))();
  *a2 = result;
  return result;
}

uint64_t sub_1A9D42778(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(_QWORD **)a2 + 208))(*a1);
}

void sub_1A9D427A8(void *a1)
{
  sub_1A9D4299C(a1);
}

void (*sub_1A9D427BC(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  (*(void (**)(void))(*(_QWORD *)v2 + 376))();
  swift_release();
  v4[5] = OBJC_IVAR____TtCV13CoverSheetKit14TitleLabelView11Coordinator___observationRegistrar;
  *v4 = v2;
  swift_getKeyPath();
  v4[6] = sub_1A9D43958();
  sub_1A9D44278();
  swift_release();
  v4[7] = sub_1A9D426AC();
  return sub_1A9D42884;
}

void sub_1A9D42884(_QWORD *a1)
{
  sub_1A9D42F64(a1);
}

uint64_t (*sub_1A9D42890())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1A9D428CC()
{
  id *v0;

  swift_getKeyPath();
  (*((void (**)(void))*v0 + 47))();
  swift_release();
  swift_beginAccess();
  return v0[5];
}

uint64_t sub_1A9D42928@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 248))();
  *a2 = result;
  return result;
}

uint64_t sub_1A9D42958(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(_QWORD **)a2 + 256))(*a1);
}

void sub_1A9D42988(void *a1)
{
  sub_1A9D4299C(a1);
}

void sub_1A9D4299C(void *a1)
{
  uint64_t v1;

  swift_getKeyPath();
  (*(void (**)(void))(*(_QWORD *)v1 + 384))();
  swift_release();

}

void (*sub_1A9D42A14(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  (*(void (**)(void))(*(_QWORD *)v2 + 376))();
  swift_release();
  v4[5] = OBJC_IVAR____TtCV13CoverSheetKit14TitleLabelView11Coordinator___observationRegistrar;
  *v4 = v2;
  swift_getKeyPath();
  v4[6] = sub_1A9D43958();
  sub_1A9D44278();
  swift_release();
  v4[7] = sub_1A9D42890();
  return sub_1A9D42ADC;
}

void sub_1A9D42ADC(_QWORD *a1)
{
  sub_1A9D42F64(a1);
}

uint64_t (*sub_1A9D42AE8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1A9D42B24()
{
  _QWORD *v0;

  swift_getKeyPath();
  (*(void (**)(void))(*v0 + 376))();
  swift_release();
  swift_beginAccess();
  return v0[6];
}

uint64_t sub_1A9D42B80@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 296))();
  *a2 = result;
  return result;
}

uint64_t sub_1A9D42BB0(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 304))(*a1);
}

uint64_t sub_1A9D42BDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v4;
  uint64_t v5;

  swift_getKeyPath();
  v4 = v1;
  v5 = a1;
  (*(void (**)(void))(*(_QWORD *)v1 + 384))();
  return swift_release();
}

void (*sub_1A9D42C4C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  (*(void (**)(void))(*(_QWORD *)v2 + 376))();
  swift_release();
  v4[5] = OBJC_IVAR____TtCV13CoverSheetKit14TitleLabelView11Coordinator___observationRegistrar;
  *v4 = v2;
  swift_getKeyPath();
  v4[6] = sub_1A9D43958();
  sub_1A9D44278();
  swift_release();
  v4[7] = sub_1A9D42AE8();
  return sub_1A9D42D14;
}

void sub_1A9D42D14(_QWORD *a1)
{
  sub_1A9D42F64(a1);
}

uint64_t (*sub_1A9D42D20())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_1A9D42D5C()
{
  double *v0;

  swift_getKeyPath();
  (*(void (**)(void))(*(_QWORD *)v0 + 376))();
  swift_release();
  swift_beginAccess();
  return v0[7];
}

void sub_1A9D42DB8(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))(**(_QWORD **)a1 + 344))();
}

uint64_t sub_1A9D42DE8(double *a1, uint64_t a2)
{
  return (*(uint64_t (**)(double))(**(_QWORD **)a2 + 352))(*a1);
}

uint64_t sub_1A9D42E14()
{
  uint64_t v0;

  swift_getKeyPath();
  (*(void (**)(void))(*(_QWORD *)v0 + 384))();
  return swift_release();
}

void (*sub_1A9D42E90(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  (*(void (**)(void))(*(_QWORD *)v2 + 376))();
  swift_release();
  v4[5] = OBJC_IVAR____TtCV13CoverSheetKit14TitleLabelView11Coordinator___observationRegistrar;
  *v4 = v2;
  swift_getKeyPath();
  v4[6] = sub_1A9D43958();
  sub_1A9D44278();
  swift_release();
  v4[7] = sub_1A9D42D20();
  return sub_1A9D42F58;
}

void sub_1A9D42F58(_QWORD *a1)
{
  sub_1A9D42F64(a1);
}

void sub_1A9D42F64(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 56))(*a1, 0);
  *v1 = v1[4];
  swift_getKeyPath();
  sub_1A9D4426C();
  swift_release();
  free(v1);
}

uint64_t sub_1A9D42FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v6;

  sub_1A9D44284();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a3;
  *(_QWORD *)(v6 + 40) = a4;
  *(_QWORD *)(v6 + 48) = a5;
  *(double *)(v6 + 56) = a6;
  return v6;
}

uint64_t sub_1A9D43044()
{
  sub_1A9D43958();
  return sub_1A9D44260();
}

uint64_t sub_1A9D43098()
{
  sub_1A9D43958();
  return sub_1A9D44254();
}

uint64_t sub_1A9D43124()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();

  v1 = v0 + OBJC_IVAR____TtCV13CoverSheetKit14TitleLabelView11Coordinator___observationRegistrar;
  v2 = sub_1A9D44290();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_1A9D43180()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();

  v1 = v0 + OBJC_IVAR____TtCV13CoverSheetKit14TitleLabelView11Coordinator___observationRegistrar;
  v2 = sub_1A9D44290();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_1A9D431E8()
{
  return sub_1A9D442E4();
}

uint64_t sub_1A9D43208(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_1A9D442D8();
  MEMORY[0x1E0C80A78](v2, v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1A9D442F0();
}

uint64_t sub_1A9D43284@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1A9D442FC();
  *a1 = v3;
  return result;
}

uint64_t sub_1A9D432AC()
{
  return sub_1A9D44308();
}

uint64_t sub_1A9D432D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  MEMORY[0x1E0C80A78](a1, a1);
  (*(void (**)(char *))(v1 + 16))((char *)&v4 - v2);
  return sub_1A9D44338();
}

uint64_t sub_1A9D4334C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v6;

  v6 = objc_allocWithZone((Class)type metadata accessor for LockScreenHostingController(0, *(_QWORD *)(v4 + qword_1EEB58598), *(_QWORD *)(v4 + qword_1EEB58598 + 8), a4));
  return sub_1A9D432D0(a1);
}

uint64_t type metadata accessor for LockScreenHostingController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LockScreenHostingController);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1A9D433B4()
{
  uint64_t *v0;

  return sub_1A9D400BC(v0[2], v0[3], v0[4]);
}

uint64_t sub_1A9D433E0()
{
  uint64_t v0;

  return sub_1A9D40588(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1A9D43408()
{
  uint64_t v0;

  return sub_1A9D40A10(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

id _s13CoverSheetKit23TitleElementViewAdapterC5frameACSo6CGRectV_tcfc_0()
{
  _BYTE *v0;
  void *v1;
  char *v2;
  id v3;
  void *v4;
  _QWORD *v5;
  id v6;
  id v7;
  void *v8;
  id result;
  void *v10;
  id v11;
  objc_super v12;
  _QWORD *v13;

  v0[OBJC_IVAR___CSTitleElementViewAdapter_animatesChanges] = 1;
  v0[OBJC_IVAR___CSTitleElementViewAdapter_visible] = 0;
  v1 = (void *)objc_opt_self();
  v2 = v0;
  v3 = objc_msgSend(v1, sel_whiteColor);
  if (qword_1EEB58398 != -1)
    swift_once();
  v4 = (void *)qword_1EEB583A0;
  type metadata accessor for TitleLabelView.Coordinator();
  v5 = (_QWORD *)swift_allocObject();
  v6 = v4;
  sub_1A9D44284();
  v5[2] = 0;
  v5[3] = 0xE000000000000000;
  v5[4] = v3;
  v5[5] = v6;
  v5[6] = 1;
  v5[7] = 0x3FE0000000000000;
  *(_QWORD *)&v2[OBJC_IVAR___CSTitleElementViewAdapter_coordinator] = v5;
  v7 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EEB58358));
  v13 = v5;
  swift_retain();
  v8 = (void *)sub_1A9D44338();
  *(_QWORD *)&v2[OBJC_IVAR___CSTitleElementViewAdapter_hostingController] = v8;
  result = objc_msgSend(v8, sel_view);
  if (result)
  {
    v10 = result;
    v11 = objc_msgSend(v1, sel_clearColor);
    objc_msgSend(v10, sel_setBackgroundColor_, v11);

    v12.receiver = v2;
    v12.super_class = (Class)type metadata accessor for TitleElementViewAdapter();
    return objc_msgSendSuper2(&v12, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for TitleElementViewAdapter()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1AF420B5C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1A9D43640()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEB582A0;
  if (!qword_1EEB582A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEB58288);
    v2 = MEMORY[0x1E0CDFB10];
    v3[0] = sub_1A9D438B4(&qword_1EEB582A8, &qword_1EEB58298, MEMORY[0x1E0CDFB10]);
    v3[1] = sub_1A9D438B4(&qword_1EEB582B0, &qword_1EEB58270, v2);
    result = MEMORY[0x1AF420B74](MEMORY[0x1E0CDB8A0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEB582A0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1AF420B68](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1A9D43728()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEB582B8;
  if (!qword_1EEB582B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEB58290);
    v2[0] = sub_1A9D437AC();
    v2[1] = sub_1A9D438B4(&qword_1EEB58300, &qword_1EEB58308, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x1AF420B74](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEB582B8);
  }
  return result;
}

unint64_t sub_1A9D437AC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEB582C0;
  if (!qword_1EEB582C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEB582C8);
    v2[0] = sub_1A9D43830();
    v2[1] = sub_1A9D438B4(&qword_1EEB582F0, &qword_1EEB582F8, MEMORY[0x1E0CDC718]);
    result = MEMORY[0x1AF420B74](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEB582C0);
  }
  return result;
}

unint64_t sub_1A9D43830()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEB582D0;
  if (!qword_1EEB582D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEB582D8);
    v2 = sub_1A9D438B4(&qword_1EEB582E0, &qword_1EEB582E8, MEMORY[0x1E0CDCF80]);
    v3[0] = MEMORY[0x1E0CDDD58];
    v3[1] = v2;
    result = MEMORY[0x1AF420B74](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EEB582D0);
  }
  return result;
}

uint64_t sub_1A9D438B4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1AF420B74](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A9D438F4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[2];
  v2 = v0[3];
  v3 = v0[4];
  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

unint64_t sub_1A9D43958()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEB58330;
  if (!qword_1EEB58330)
  {
    v1 = type metadata accessor for TitleLabelView.Coordinator();
    result = MEMORY[0x1AF420B74](&unk_1A9D47668, v1);
    atomic_store(result, (unint64_t *)&qword_1EEB58330);
  }
  return result;
}

uint64_t type metadata accessor for TitleLabelView.Coordinator()
{
  uint64_t result;

  result = qword_1EEB58560;
  if (!qword_1EEB58560)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1A9D439DC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(void **)(v0 + 24);
  swift_beginAccess();
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = v1;
  v4 = v1;

}

void sub_1A9D43A34()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(void **)(v0 + 24);
  swift_beginAccess();
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;
  v4 = v1;

}

uint64_t sub_1A9D43A8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  result = swift_beginAccess();
  *(_QWORD *)(v2 + 48) = v1;
  return result;
}

uint64_t sub_1A9D43AD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  result = swift_beginAccess();
  *(_QWORD *)(v1 + 56) = v2;
  return result;
}

uint64_t sub_1A9D43B28()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1A9D43B3C()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for TitleElementViewAdapter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TitleElementViewAdapter.viewController.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.animatesChanges.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.animatesChanges.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.animatesChanges.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.text.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.text.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.text.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.textColor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.textColor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.textColor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.font.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.font.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.font.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.textAlignment.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.textAlignment.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.textAlignment.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.minimumScaleFactor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.minimumScaleFactor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.minimumScaleFactor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.frame.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.frame.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.frame.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.visible.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.visible.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.visible.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of TitleElementViewAdapter.__allocating_init(frame:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 360))();
}

ValueMetadata *type metadata accessor for TitleLabelView()
{
  return &type metadata for TitleLabelView;
}

uint64_t sub_1A9D43E5C()
{
  return type metadata accessor for TitleLabelView.Coordinator();
}

uint64_t sub_1A9D43E64()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A9D44290();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_1A9D43F00()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEB58338;
  if (!qword_1EEB58338)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEB58340);
    v2[0] = sub_1A9D43640();
    v2[1] = sub_1A9D43728();
    result = MEMORY[0x1AF420B74](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEB58338);
  }
  return result;
}

void type metadata accessor for NSTextAlignment()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EEB58348)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EEB58348);
  }
}

unint64_t sub_1A9D43FC0()
{
  unint64_t result;

  result = qword_1EEB58350;
  if (!qword_1EEB58350)
  {
    result = MEMORY[0x1AF420B74](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EEB58350);
  }
  return result;
}

uint64_t sub_1A9D44004(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_1A9D44014(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1A9D44058(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_1A9D44068(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
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

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1AF420B2C](a1, v6, a5);
}

void sub_1A9D44110()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_1A9D44120()
{
  return sub_1A9D433E0();
}

uint64_t sub_1A9D44134()
{
  return sub_1A9D43408();
}

uint64_t sub_1A9D44148()
{
  return sub_1A9D433B4();
}

void __getPRPosterContentVibrantMonochromeStyleClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PosterKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CSProminentDisplayViewController.m"), 35, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPRPosterContentVibrantMonochromeStyleClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPRPosterContentVibrantMonochromeStyleClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CSProminentDisplayViewController.m"), 36, CFSTR("Unable to find class %s"), "PRPosterContentVibrantMonochromeStyle");

  __break(1u);
  sub_1A9D44254();
}

uint64_t sub_1A9D44254()
{
  return MEMORY[0x1E0DEFD58]();
}

uint64_t sub_1A9D44260()
{
  return MEMORY[0x1E0DEFD60]();
}

uint64_t sub_1A9D4426C()
{
  return MEMORY[0x1E0DEFD68]();
}

uint64_t sub_1A9D44278()
{
  return MEMORY[0x1E0DEFD70]();
}

uint64_t sub_1A9D44284()
{
  return MEMORY[0x1E0DEFD78]();
}

uint64_t sub_1A9D44290()
{
  return MEMORY[0x1E0DEFD80]();
}

uint64_t sub_1A9D4429C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1A9D442A8()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1A9D442B4()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1A9D442C0()
{
  return MEMORY[0x1E0CD9210]();
}

uint64_t sub_1A9D442CC()
{
  return MEMORY[0x1E0CDA360]();
}

uint64_t sub_1A9D442D8()
{
  return MEMORY[0x1E0CDA400]();
}

uint64_t sub_1A9D442E4()
{
  return MEMORY[0x1E0CDA6D0]();
}

uint64_t sub_1A9D442F0()
{
  return MEMORY[0x1E0CDA6E8]();
}

uint64_t sub_1A9D442FC()
{
  return MEMORY[0x1E0CDA750]();
}

uint64_t sub_1A9D44308()
{
  return MEMORY[0x1E0CDA758]();
}

uint64_t sub_1A9D44314()
{
  return MEMORY[0x1E0CDACC8]();
}

uint64_t sub_1A9D44320()
{
  return MEMORY[0x1E0CDB5E8]();
}

uint64_t sub_1A9D4432C()
{
  return MEMORY[0x1E0CDB5F0]();
}

uint64_t sub_1A9D44338()
{
  return MEMORY[0x1E0CDB608]();
}

uint64_t sub_1A9D44344()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_1A9D44350()
{
  return MEMORY[0x1E0CDC210]();
}

uint64_t sub_1A9D4435C()
{
  return MEMORY[0x1E0CDD860]();
}

uint64_t sub_1A9D44368()
{
  return MEMORY[0x1E0CDDC48]();
}

uint64_t sub_1A9D44374()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_1A9D44380()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_1A9D4438C()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_1A9D44398()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_1A9D443A4()
{
  return MEMORY[0x1E0CDF628]();
}

uint64_t sub_1A9D443B0()
{
  return MEMORY[0x1E0CE02D8]();
}

uint64_t sub_1A9D443BC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1A9D443C8()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1A9D443D4()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1A9D443E0()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x1E0D01268]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1E0D012E0]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1E0D012F0]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1E0D012F8]();
}

uint64_t BSPointRoundForScale()
{
  return MEMORY[0x1E0D01490]();
}

uint64_t BSRectEqualToRect()
{
  return MEMORY[0x1E0D014E0]();
}

uint64_t BSSizeEqualToSize()
{
  return MEMORY[0x1E0D015C0]();
}

uint64_t BSSizeRoundForScale()
{
  return MEMORY[0x1E0D015D8]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CTFontCopyVariation(CTFontRef font)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA7A10](font);
}

CFArrayRef CTFontCopyVariationAxes(CTFontRef font)
{
  return (CFArrayRef)MEMORY[0x1E0CA7A18](font);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1E0DC5240]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0DC52E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _UIConvertPointFromOrientationToOrientation()
{
  return MEMORY[0x1E0DC57B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1E0DEEB78]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
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

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}


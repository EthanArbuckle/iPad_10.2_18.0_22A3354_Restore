id sub_100003C70(uint64_t a1)
{
  if (qword_1000496C8 != -1)
    dispatch_once(&qword_1000496C8, &stru_1000413F8);
  return (id)qword_1000496C0[a1];
}

void sub_100003CC0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.AppDistributionLaunchAngel", "LaunchAngel");
  v2 = (void *)qword_1000496C0[0];
  qword_1000496C0[0] = (uint64_t)v1;

}

id sub_100004090()
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
  v0 = (void *)qword_1000496E8;
  v7 = qword_1000496E8;
  if (!qword_1000496E8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000046D0;
    v3[3] = &unk_100041420;
    v3[4] = &v4;
    sub_1000046D0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100004130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100004148()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)qword_1000496F0;
  v7 = qword_1000496F0;
  if (!qword_1000496F0)
  {
    v1 = (void *)sub_1000045CC();
    v0 = (id *)dlsym(v1, "ASCLockupKindApp");
    v5[3] = (uint64_t)v0;
    qword_1000496F0 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)sub_1000314AC();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

Class sub_100004578(uint64_t a1)
{
  Class result;

  sub_1000045CC();
  result = objc_getClass("ASCMiniProductPageView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_100031620();
  qword_1000496D0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000045CC()
{
  uint64_t v0;
  char *v1;
  char *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_1000496D8)
  {
    v4 = off_100041440;
    v5 = 0;
    qword_1000496D8 = _sl_dlopen(&v4, &v3);
  }
  v0 = qword_1000496D8;
  v1 = v3;
  if (!qword_1000496D8)
  {
    v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_7;
  }
  if (v3)
LABEL_7:
    free(v1);
  return v0;
}

Class sub_10000467C(uint64_t a1)
{
  Class result;

  sub_1000045CC();
  result = objc_getClass("ASCAdamID");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_100031644();
  qword_1000496E0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_1000046D0(uint64_t a1)
{
  Class result;

  sub_1000045CC();
  result = objc_getClass("ASCLockupRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_100031668();
  qword_1000496E8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100004724(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

__n128 initializeWithTake for XPCEncoder(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10000474C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_10000476C(uint64_t result, int a2, int a3)
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
  sub_100005A2C(a1, (unint64_t *)&unk_100048030, (uint64_t)&unk_1000416D0);
}

void sub_1000047A8()
{
  __int128 *v0;
  _QWORD v1[4];

  sub_1000051D8(v0, (uint64_t)v1);
  __asm { BR              X11 }
}

uint64_t sub_100004800()
{
  return 0x100000000000002BLL;
}

void sub_1000048A8(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  if (!(a5 | a6 | a1 | a4)
    || (v6 = a5 | a6 | a4, a1 == 1) && !v6
    || a1 == 2 && !v6
    || (a1 != 3 || v6)
    && (a1 == 4 && !v6
     || a1 == 5 && !v6
     || (a1 != 6 || v6) && (a1 != 7 || v6) && (a1 == 8 && !v6 || (a1 != 9 || v6) && (a1 != 10 || v6))))
  {
    JUMPOUT(0x100004898);
  }
  JUMPOUT(0x100004890);
}

void sub_100004AB0()
{
  __int128 *v0;
  _QWORD v1[4];

  sub_1000051D8(v0, (uint64_t)v1);
  __asm { BR              X11 }
}

uint64_t sub_100004B04()
{
  uint64_t v0;

  return v0 + 4;
}

unint64_t sub_100004D20()
{
  __int128 *v0;
  __int128 *v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  unint64_t result;
  uint64_t v11;
  uint64_t inited;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[64];
  _BYTE v23[96];
  _BYTE v24[64];
  _BYTE v25[96];
  _BYTE v26[8];
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  __int128 v32;

  v1 = v0;
  sub_1000051D8(v0, (uint64_t)v26);
  v2 = v27;
  sub_1000051D8(v1, (uint64_t)&v28);
  switch(v31)
  {
    case 0:
      v32 = v28;
      v11 = sub_1000051F0(&qword_100048440);
      inited = swift_initStackObject(v11, &v21);
      v5 = inited;
      *(_OWORD *)(inited + 16) = xmmword_1000336A0;
      v13 = 0x726F4D6E7261656CLL;
      v14 = 0xED00006B6E694C65;
      goto LABEL_7;
    case 1:
      v32 = v28;
      v15 = sub_1000051F0(&qword_100048440);
      inited = swift_initStackObject(v15, v22);
      v5 = inited;
      *(_OWORD *)(inited + 16) = xmmword_1000336A0;
      v13 = 1701667182;
      v14 = 0xE400000000000000;
LABEL_7:
      *(_QWORD *)(inited + 32) = v13;
      *(_QWORD *)(inited + 40) = v14;
      *(_OWORD *)(inited + 48) = v32;
      v16 = v2;
      goto LABEL_9;
    case 2:
      v17 = v28;
      v19 = v29;
      v18 = v30;
      v20 = sub_1000051F0(&qword_100048440);
      v5 = swift_initStackObject(v20, v23);
      *(_OWORD *)(v5 + 16) = xmmword_100033690;
      *(_QWORD *)(v5 + 32) = 1701667182;
      *(_QWORD *)(v5 + 40) = 0xE400000000000000;
      *(_OWORD *)(v5 + 48) = v17;
      strcpy((char *)(v5 + 64), "learnMoreLink");
      *(_WORD *)(v5 + 78) = -4864;
      *(_QWORD *)(v5 + 80) = v19;
      *(_QWORD *)(v5 + 88) = v18;
      swift_bridgeObjectRetain(*((_QWORD *)&v17 + 1));
      v16 = v18;
LABEL_9:
      swift_bridgeObjectRetain(v16);
      goto LABEL_10;
    case 3:
    case 5:
      v3 = v28;
      v4 = sub_1000051F0(&qword_100048440);
      v5 = swift_initStackObject(v4, v24);
      *(_OWORD *)(v5 + 16) = xmmword_1000336A0;
      *(_QWORD *)(v5 + 32) = 0x6E69616D6F64;
      *(_QWORD *)(v5 + 40) = 0xE600000000000000;
      *(_OWORD *)(v5 + 48) = v3;
      sub_100005230((uint64_t)v1);
      goto LABEL_10;
    case 4:
    case 6:
      v7 = v29;
      v6 = v30;
      v8 = v28;
      swift_bridgeObjectRetain(*((_QWORD *)&v28 + 1));
      swift_bridgeObjectRetain(v6);
      v9 = sub_1000051F0(&qword_100048440);
      v5 = swift_initStackObject(v9, v25);
      *(_OWORD *)(v5 + 16) = xmmword_100033690;
      strcpy((char *)(v5 + 32), "developerName");
      *(_WORD *)(v5 + 46) = -4864;
      *(_OWORD *)(v5 + 48) = v8;
      strcpy((char *)(v5 + 64), "learnMoreLink");
      *(_WORD *)(v5 + 78) = -4864;
      *(_QWORD *)(v5 + 80) = v7;
      *(_QWORD *)(v5 + 88) = v6;
LABEL_10:
      result = sub_10002906C(v5);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

void sub_100004F98(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_100004FA4(uint64_t a1, uint64_t a2)
{
  return sub_10000506C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004FB0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100004FF0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100005060(uint64_t a1, uint64_t a2)
{
  return sub_10000506C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10000506C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_1000050A8(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_10000511C(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_100005198@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

uint64_t sub_1000051D8(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_BYTE *)(a2 + 32) = *((_BYTE *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1000051F0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005230(uint64_t a1)
{
  sub_100005264(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  return a1;
}

uint64_t sub_100005264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 <= 6u)
  {
    if (((1 << a5) & 0x2B) != 0)
    {
      return swift_bridgeObjectRetain(a2);
    }
    else
    {
      swift_bridgeObjectRetain(a2);
      return swift_bridgeObjectRetain(a4);
    }
  }
  return result;
}

id sub_1000052B8()
{
  id *v0;

  return *v0;
}

uint64_t sub_1000052C0@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1000052C8(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
  sub_100005A2C(a1, &qword_100048040, (uint64_t)&unk_1000416F8);
}

uint64_t initializeBufferWithCopyOfBuffer for LocalizationKey(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for LocalizationKey(uint64_t a1)
{
  return sub_1000053A8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t sub_1000053A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 <= 6u)
  {
    if (((1 << a5) & 0x2B) != 0)
    {
      return swift_bridgeObjectRelease(a2);
    }
    else
    {
      swift_bridgeObjectRelease(a2);
      return swift_bridgeObjectRelease(a4);
    }
  }
  return result;
}

uint64_t initializeWithCopy for LocalizationKey(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_100005264(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for LocalizationKey(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_100005264(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_1000053A8(v8, v9, v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for LocalizationKey(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LocalizationKey(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  unsigned __int8 v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_1000053A8(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for LocalizationKey(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF9 && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 249);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 7)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LocalizationKey(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 249;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_1000055B8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 6u)
    return *(unsigned __int8 *)(a1 + 32);
  else
    return (*(_DWORD *)a1 + 7);
}

uint64_t sub_1000055D4(uint64_t result, unsigned int a2)
{
  if (a2 >= 7)
  {
    *(_QWORD *)result = a2 - 7;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 7;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
  }
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LocalizationKey()
{
  return &type metadata for LocalizationKey;
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_100005A2C(a1, &qword_100048048, (uint64_t)&unk_1000417B0);
}

uint64_t sub_100005614()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(LAErrorDomain);
}

uint64_t sub_100005624(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005954(&qword_100048070, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_1000334CC);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100005664(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005954(&qword_100048070, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_1000334CC);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_1000056A4(void *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005954(&qword_100048070, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_1000334CC);
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_100005708()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_10000573C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005954(&qword_100048070, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_1000334CC);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_10000578C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD v7[10];

  v7[9] = *v3;
  Hasher.init(_seed:)(v7, a1);
  dispatch thunk of Hashable.hash(into:)(v7, a2, a3);
  return Hasher._finalize()();
}

_QWORD *sub_1000057E8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

BOOL sub_1000057F8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000580C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100005850@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005878(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100005954(&qword_1000480B8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10003344C);
  v3 = sub_100005954(&qword_1000480C0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_1000333A0);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000058FC()
{
  return sub_100005954(&qword_100048050, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100033364);
}

uint64_t sub_100005928()
{
  return sub_100005954(&qword_100048058, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100033338);
}

uint64_t sub_100005954(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005994()
{
  return sub_100005954(&qword_100048060, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_1000333D4);
}

uint64_t sub_1000059C0()
{
  return sub_100005954(&qword_100048068, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1000332C4);
}

uint64_t sub_1000059EC()
{
  return sub_100005954(&qword_100048070, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_1000334CC);
}

void type metadata accessor for LAError(uint64_t a1)
{
  sub_100005A2C(a1, &qword_1000480C8, (uint64_t)&unk_1000417D0);
}

void sub_100005A2C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_100005A70()
{
  return sub_100005954(&qword_100048078, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_100033620);
}

uint64_t sub_100005A9C()
{
  return sub_100005954(&qword_100048080, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_1000335A8);
}

uint64_t sub_100005AC8()
{
  return sub_100005954(&qword_100048088, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_100033538);
}

uint64_t sub_100005AF4()
{
  return sub_100005954(&qword_100048090, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_100033490);
}

uint64_t sub_100005B20()
{
  return sub_100005954(&qword_100048098, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1000332F0);
}

unint64_t sub_100005B50()
{
  unint64_t result;

  result = qword_1000480A0;
  if (!qword_1000480A0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_1000480A0);
  }
  return result;
}

uint64_t sub_100005B94()
{
  return sub_100005954(&qword_1000480A8, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_10003357C);
}

uint64_t sub_100005BC0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005954(&qword_100048078, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_100033620);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100005C00(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005954(&qword_100048078, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_100033620);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100005C44(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005954(&qword_100048070, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_1000334CC);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100005C84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_100005954(&qword_100048070, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_1000334CC);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100005CDC()
{
  return sub_100005954(&qword_1000480B0, (uint64_t (*)(uint64_t))type metadata accessor for LAError, (uint64_t)&unk_1000335DC);
}

uint64_t sub_100005D0C(_BYTE *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_signpost_type_t v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  void (*v35)(char *, char *, uint64_t);
  uint8_t *v36;
  os_signpost_id_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  char v49;

  v5 = v4;
  v48 = a3;
  v47 = a2;
  v8 = type metadata accessor for OSSignpostID(0);
  v9 = *(_QWORD *)(v8 - 8);
  v45 = v8;
  v46 = v9;
  v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  v44 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v40 - v12;
  v14 = type metadata accessor for Logger(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for OSSignposter(0);
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = (unint64_t)a1;
  v42 = v15;
  *(_QWORD *)(v5 + 16) = a1;
  v22 = (char *)v5;
  v23 = v48;
  *((_QWORD *)v22 + 3) = v47;
  v22[32] = v23;
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v47 = a4;
  v43 = v14;
  v25 = v14;
  v26 = v13;
  v24(v17, a4, v25);
  OSSignposter.init(logger:)(v17);
  v27 = (*(uint64_t (**)(char *, char *, uint64_t))(v19 + 32))(&v22[OBJC_IVAR____TtC26AppDistributionLaunchAngel16SignpostInterval_signposter], v21, v18);
  v28 = static OSSignpostID.exclusive.getter(v27);
  v29 = OSSignposter.logHandle.getter(v28);
  v30 = static os_signpost_type_t.begin.getter();
  result = OS_os_log.signpostsEnabled.getter();
  if ((result & 1) == 0)
    goto LABEL_5;
  v32 = v46;
  v40 = v22;
  if ((v23 & 1) == 0)
  {
    v34 = v44;
    v33 = v45;
    v22 = (char *)v41;
    if (!v41)
    {
      __break(1u);
LABEL_5:

      v33 = v45;
      v32 = v46;
      v34 = v44;
      (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v44, v13, v45);
LABEL_11:
      v38 = type metadata accessor for OSSignpostIntervalState(0);
      swift_allocObject(v38, *(unsigned int *)(v38 + 48), *(unsigned __int16 *)(v38 + 52));
      v39 = OSSignpostIntervalState.init(id:isOpen:)(v34, 1);
      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v47, v43);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v26, v33);
      *(_QWORD *)&v22[OBJC_IVAR____TtC26AppDistributionLaunchAngel16SignpostInterval_interval] = v39;
      return (uint64_t)v22;
    }
LABEL_10:
    v35 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
    v35(v34, v13, v33);
    v36 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v36 = 0;
    v37 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, v30, v37, v22, "", v36, 2u);
    swift_slowDealloc(v36, -1, -1);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v33);
    v22 = v40;
    v35(v34, v13, v33);
    goto LABEL_11;
  }
  v34 = v44;
  v33 = v45;
  if (HIDWORD(v41))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v41 >> 11 != 27)
  {
    if (WORD1(v41) <= 0x10u)
    {
      v22 = &v49;
      goto LABEL_10;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_10000600C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  const char *v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint8_t *v27;
  os_signpost_id_t v28;
  void (*v29)(_BYTE *, uint64_t);
  uint64_t v30;
  _BYTE v31[12];
  int v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char v38;

  v1 = v0;
  v2 = type metadata accessor for OSSignpostError(0);
  v3 = *(const char **)(v2 - 8);
  v33 = v2;
  v34 = v3;
  __chkstk_darwin(v2);
  v5 = &v31[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = type metadata accessor for OSSignpostID(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = &v31[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = __chkstk_darwin(v8);
  v13 = &v31[-v12];
  v14 = *(const char **)(v0 + 16);
  v36 = v0 + OBJC_IVAR____TtC26AppDistributionLaunchAngel16SignpostInterval_signposter;
  v37 = (char *)v14;
  v15 = *(_BYTE *)(v0 + 32);
  v35 = OBJC_IVAR____TtC26AppDistributionLaunchAngel16SignpostInterval_interval;
  v16 = *(_QWORD *)(v0 + OBJC_IVAR____TtC26AppDistributionLaunchAngel16SignpostInterval_interval);
  v17 = OSSignposter.logHandle.getter(v11);
  v18 = OSSignpostIntervalState.signpostID.getter();
  v32 = static os_signpost_type_t.end.getter(v18);
  result = OS_os_log.signpostsEnabled.getter();
  if ((result & 1) == 0)
  {

    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v13, v6);
    v23 = v35;
    v22 = v36;
LABEL_14:
    v30 = type metadata accessor for OSSignposter(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 8))(v22, v30);
    swift_release(*(_QWORD *)(v1 + v23));
    return v1;
  }
  v20 = v7;
  if ((v15 & 1) == 0)
  {
    if (v37)
    {
      v21 = v34;
LABEL_10:
      v24 = swift_retain(v16);
      checkForErrorAndConsumeState(state:)(v24);
      swift_release(v16);
      v25 = v33;
      if ((*((unsigned int (**)(_BYTE *, uint64_t))v21 + 11))(v5, v33) == enum case for OSSignpostError.doubleEnd(_:))
      {
        v26 = "[Error] Interval already ended";
      }
      else
      {
        (*((void (**)(_BYTE *, uint64_t))v21 + 1))(v5, v25);
        v26 = "";
      }
      v34 = v26;
      v23 = v35;
      v22 = v36;
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v20 + 16))(v10, v13, v6);
      v27 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v27 = 0;
      v28 = OSSignpostID.rawValue.getter();
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, (os_signpost_type_t)v32, v28, v37, v34, v27, 2u);
      swift_slowDealloc(v27, -1, -1);

      v29 = *(void (**)(_BYTE *, uint64_t))(v20 + 8);
      v29(v13, v6);
      v29(v10, v6);
      goto LABEL_14;
    }
    __break(1u);
    goto LABEL_16;
  }
  if ((unint64_t)v37 >> 32)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v37 >> 11 != 27)
  {
    v21 = v34;
    if (v37 >> 16 <= 0x10)
    {
      v37 = &v38;
      goto LABEL_10;
    }
    goto LABEL_17;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_1000062C4()
{
  uint64_t v0;

  sub_10000600C();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_1000062E8()
{
  return type metadata accessor for SignpostInterval(0);
}

uint64_t type metadata accessor for SignpostInterval(uint64_t a1)
{
  uint64_t result;

  result = qword_100048158;
  if (!qword_100048158)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SignpostInterval);
  return result;
}

uint64_t sub_10000632C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_1000336D8;
  result = type metadata accessor for OSSignposter(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

void sub_1000066DC(char a1)
{
  void *v1;
  void *v2;
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
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t isCurrentExecutor;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  id v46;
  NSURL *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  double v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  objc_super v70;

  v2 = v1;
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v67 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v9 = (char *)&v62 - v8;
  v11 = type metadata accessor for MainActor(0, v10);
  v12 = static MainActor.shared.getter(v11);
  v13 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
  v15 = v14;
  if ((swift_task_isCurrentExecutor(v13) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 36, v13, v15);
  v16 = (objc_class *)type metadata accessor for LicenseResolutionViewController(0);
  v70.receiver = v2;
  v70.super_class = v16;
  objc_msgSendSuper2(&v70, "viewDidAppear:", a1 & 1);
  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v17 = type metadata accessor for Logger(0);
  sub_100007D98(v17, (uint64_t)qword_10004AD30);
  v18 = v2;
  v19 = Logger.logObject.getter();
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, (os_log_type_t)v20))
  {
    v63 = v20;
    v64 = v5;
    v65 = v4;
    v66 = v12;
    v21 = swift_slowAlloc(22, -1);
    v22 = swift_slowAlloc(64, -1);
    v62 = v22;
    v69 = v22;
    *(_DWORD *)v21 = 136446467;
    v23 = static MainActor.shared.getter(v22);
    v24 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
    v26 = v25;
    isCurrentExecutor = swift_task_isCurrentExecutor(v24);
    if ((isCurrentExecutor & 1) == 0)
      isCurrentExecutor = swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 39, v24, v26);
    v28 = LicenseResolutionContext.logKey.getter(isCurrentExecutor);
    v30 = v29;
    swift_release(v23);
    v68 = sub_100030804(v28, v30, &v69);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69, v21 + 4, v21 + 12);

    v31 = swift_bridgeObjectRelease(v30);
    *(_WORD *)(v21 + 12) = 2085;
    v32 = static MainActor.shared.getter(v31);
    v33 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
    v35 = v34;
    v36 = swift_task_isCurrentExecutor(v33);
    if ((v36 & 1) == 0)
      v36 = swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 39, v33, v35);
    LicenseResolutionContext.url.getter(v36);
    swift_release(v32);
    v37 = sub_100007E48();
    v4 = v65;
    v38 = dispatch thunk of CustomStringConvertible.description.getter(v65, v37);
    v40 = v39;
    v41 = v64;
    (*(void (**)(char *, uint64_t))(v64 + 8))(v9, v4);
    v68 = sub_100030804(v38, v40, &v69);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69, v21 + 14, v21 + 22);

    swift_bridgeObjectRelease(v40);
    _os_log_impl((void *)&_mh_execute_header, v19, (os_log_type_t)v63, "[%{public}s] Activating license resolution sheet: %{sensitive}s", (uint8_t *)v21, 0x16u);
    v42 = v62;
    swift_arrayDestroy(v62, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v42, -1, -1);
    v43 = v21;
    v5 = v41;
    swift_slowDealloc(v43, -1, -1);

    v12 = v66;
    v45 = v67;
  }
  else
  {

    v45 = v67;
  }
  LicenseResolutionContext.url.getter(v44);
  v46 = objc_allocWithZone((Class)SFSafariViewController);
  URL._bridgeToObjectiveC()(v47);
  v49 = v48;
  v50 = objc_msgSend(v46, "initWithURL:", v48);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v45, v4);
  objc_msgSend(v50, "setModalPresentationStyle:", 2);
  objc_msgSend(v50, "setDelegate:", v18);
  v51 = objc_msgSend(v50, "presentationController");
  if (v51)
  {
    v52 = v51;
    objc_msgSend(v51, "setDelegate:", v18);

  }
  v53 = objc_msgSend(v18, "view");
  if (!v53)
  {
    __break(1u);
    goto LABEL_22;
  }
  v54 = v53;
  v55 = objc_msgSend(v53, "window");

  if (v55)
  {
    v56 = objc_msgSend(v55, "_rootSheetPresentationController");

    if (v56)
    {
      objc_msgSend(v56, "_setShouldScaleDownBehindDescendantSheets:", 0);

      goto LABEL_18;
    }
LABEL_22:
    __break(1u);
    return;
  }
LABEL_18:
  v57 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
  v58 = v57;
  v59 = 0.8;
  if (*((_BYTE *)v18 + OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_isIPad))
    v59 = 0.4;
  v60 = objc_msgSend(v57, "colorWithAlphaComponent:", v59);

  sub_100006D60(v60, v61);
  objc_msgSend(v18, "presentViewController:animated:completion:", v50, 1, 0);
  swift_release(v12);

}

uint64_t sub_100006D60(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v17[5];
  uint64_t v18;

  v3 = v2;
  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 51, v7, v9);
  v10 = (void *)objc_opt_self(UIView);
  v11 = swift_allocObject(&unk_100041A20, 32, 7);
  *(_QWORD *)(v11 + 16) = v3;
  *(_QWORD *)(v11 + 24) = a1;
  v17[4] = sub_100007E40;
  v18 = v11;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_10002D630;
  v17[3] = &unk_100041A38;
  v12 = _Block_copy(v17);
  v13 = v18;
  v14 = v3;
  v15 = a1;
  swift_release(v13);
  objc_msgSend(v10, "animateWithDuration:animations:", v12, 0.3);
  _Block_release(v12);
  return swift_release(v6);
}

void sub_100006EA0(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = type metadata accessor for MainActor(0, a2);
  v5 = static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 52, v6, v8);
  v9 = objc_msgSend(a1, "view");
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "setBackgroundColor:", a2);
    swift_release(v5);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100006F70(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t isCurrentExecutor;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v30;
  uint64_t aBlock[5];
  uint64_t v32;

  v3 = v2;
  v4 = type metadata accessor for MainActor(0, a2);
  v5 = static MainActor.shared.getter(v4);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor(v6) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 57, v6, v8);
  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v9 = type metadata accessor for Logger(0);
  sub_100007D98(v9, (uint64_t)qword_10004AD30);
  v10 = v3;
  v11 = Logger.logObject.getter();
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    v14 = swift_slowAlloc(32, -1);
    aBlock[0] = v14;
    *(_DWORD *)v13 = 136446210;
    v15 = static MainActor.shared.getter(v14);
    v16 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
    v18 = v17;
    isCurrentExecutor = swift_task_isCurrentExecutor(v16);
    if ((isCurrentExecutor & 1) == 0)
      isCurrentExecutor = swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 58, v16, v18);
    v20 = LicenseResolutionContext.logKey.getter(isCurrentExecutor);
    v22 = v21;
    swift_release(v15);
    v30 = sub_100030804(v20, v22, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, aBlock, v13 + 4, v13 + 12);

    swift_bridgeObjectRelease(v22);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%{public}s] Completing license resolution request", v13, 0xCu);
    swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v13, -1, -1);

  }
  else
  {

  }
  v23 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
  sub_100006D60(v23, v24);

  v25 = swift_allocObject(&unk_1000419D0, 24, 7);
  *(_QWORD *)(v25 + 16) = v10;
  aBlock[4] = (uint64_t)sub_100007DD4;
  v32 = v25;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10002D630;
  aBlock[3] = (uint64_t)&unk_1000419E8;
  v26 = _Block_copy(aBlock);
  v27 = v32;
  v28 = v10;
  swift_release(v27);
  objc_msgSend(v28, "dismissViewControllerAnimated:completion:", 1, v26);
  _Block_release(v26);
  return swift_release(v5);
}

uint64_t sub_100007298(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t isCurrentExecutor;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = type metadata accessor for MainActor(0, a2);
  v4 = static MainActor.shared.getter(v3);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v7 = v6;
  isCurrentExecutor = swift_task_isCurrentExecutor(v5);
  if ((isCurrentExecutor & 1) == 0)
    isCurrentExecutor = swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 62, v5, v7);
  v9 = static MainActor.shared.getter(isCurrentExecutor);
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v12 = v11;
  if ((swift_task_isCurrentExecutor(v10) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 13, v10, v12);
  v13 = (uint64_t *)(a1 + OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction);
  v14 = *(void (**)(uint64_t))(a1
                                       + OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction);
  v15 = v13[1];
  sub_100007DF4((uint64_t)v14, v15);
  v16 = swift_release(v9);
  if (v14)
  {
    v14(v16);
    v16 = sub_100007E04((uint64_t)v14, v15);
  }
  v17 = static MainActor.shared.getter(v16);
  v18 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v20 = v19;
  if ((swift_task_isCurrentExecutor(v18) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 13, v18, v20);
  v21 = *v13;
  v22 = v13[1];
  *v13 = 0;
  v13[1] = 0;
  sub_100007E04(v21, v22);
  swift_release(v4);
  return swift_release(v17);
}

id sub_1000074A0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LicenseResolutionViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100007528()
{
  return type metadata accessor for LicenseResolutionViewController(0);
}

uint64_t type metadata accessor for LicenseResolutionViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100048230;
  if (!qword_100048230)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LicenseResolutionViewController);
  return result;
}

uint64_t sub_10000756C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_100033760;
  result = type metadata accessor for LicenseResolutionContext(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = &unk_100033778;
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1000075EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch(sub_100007604, 0, 0);
}

uint64_t sub_100007604(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = type metadata accessor for MainActor(0, a2);
  *(_QWORD *)(v2 + 24) = static MainActor.shared.getter(v3);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000766C, v4, v5);
}

uint64_t sub_10000766C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = swift_release(*(_QWORD *)(v0 + 24));
  sub_100006F70(v1, v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_1000077F8(uint64_t a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  void *v5;
  char *v6;
  id v7;
  id v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  objc_super v14;

  v3 = &v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_isIPad;
  v5 = (void *)objc_opt_self(UIDevice);
  v6 = v1;
  v7 = objc_msgSend(v5, "currentDevice");
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v1[v4] = v8 == (id)1;
  v9 = &v6[OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_sheetContext];
  v10 = type metadata accessor for LicenseResolutionContext(0);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);

  v14.receiver = v6;
  v14.super_class = (Class)type metadata accessor for LicenseResolutionViewController(0);
  v12 = objc_msgSendSuper2(&v14, "initWithNibName:bundle:", 0, 0);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  return v12;
}

uint64_t sub_100007908()
{
  _BYTE *v0;
  _QWORD *v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v1 = &v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction];
  *v1 = 0;
  v1[1] = 0;
  v2 = OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_isIPad;
  v3 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v0[v2] = v4 == (id)1;
  v6 = type metadata accessor for MainActor(0, v5);
  v7 = static MainActor.shared.getter();
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  v10 = v9;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 24, v8, v10);
  swift_release(v7);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000350F0, "AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 2, 24, 0);
  __break(1u);
  return result;
}

uint64_t sub_100007A28()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v22[4];

  v1 = sub_1000051F0(&qword_100048300);
  __chkstk_darwin(v1);
  v3 = (char *)v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for TaskPriority(0);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = (_QWORD *)swift_allocObject(&unk_100041980, 40, 7);
  v6[2] = 0;
  v7 = v6 + 2;
  v6[3] = 0;
  v6[4] = v0;
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  v9 = v0;
  if (v8 == 1)
  {
    sub_100007CC4((uint64_t)v3);
    v10 = 0;
    v11 = 0;
    v12 = 7168;
  }
  else
  {
    v13 = TaskPriority.rawValue.getter(v9);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    v12 = v13 | 0x1C00;
    v14 = *v7;
    if (*v7)
    {
      v15 = v6[3];
      ObjectType = swift_getObjectType(*v7);
      swift_unknownObjectRetain(v14);
      v10 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v15);
      v11 = v17;
      swift_unknownObjectRelease(v14);
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
  }
  v18 = swift_allocObject(&unk_1000419A8, 32, 7);
  *(_QWORD *)(v18 + 16) = &unk_100048310;
  *(_QWORD *)(v18 + 24) = v6;
  if (v11 | v10)
  {
    v22[0] = 0;
    v22[1] = 0;
    v19 = v22;
    v22[2] = v10;
    v22[3] = v11;
  }
  else
  {
    v19 = 0;
  }
  v20 = swift_task_create(v12, v19, (char *)&type metadata for () + 8, &unk_100048318, v18);
  return swift_release(v20);
}

uint64_t sub_100007BF0()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100007C1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc(dword_10004830C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_100007C7C;
  v3[2] = v2;
  return swift_task_switch(sub_100007604, 0, 0);
}

uint64_t sub_100007C7C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100007CC4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000051F0(&qword_100048300);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007D04()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007D28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100048B5C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100007C7C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100048B58 + dword_100048B58))(a1, v4);
}

uint64_t sub_100007D98(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100007DB0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100007DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100007298(*(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_100007DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100007DEC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100007DF4(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_100007E04(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100007E14()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100007E40()
{
  uint64_t v0;

  sub_100006EA0(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_100007E48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100048320;
  if (!qword_100048320)
  {
    v1 = type metadata accessor for URL(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_100048320);
  }
  return result;
}

uint64_t sub_100007E98()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
  return swift_task_switch(sub_100007EB0, 0, 0);
}

uint64_t sub_100007EB0()
{
  uint64_t v0;
  void *v1;
  id *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  char *v7;
  uint8_t *v8;
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSString v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  char *v27;
  uint8_t *v28;
  _QWORD *v29;
  void *v30;
  id v31;
  uint64_t v32;
  unint64_t v33;

  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v2 = (id *)(v0 + 40);
  v1 = *(void **)(v0 + 40);
  v3 = type metadata accessor for Logger(0);
  sub_100007D98(v3, (uint64_t)qword_10004AD30);
  v4 = Logger.logObject.getter(v1);
  v5 = static os_log_type_t.default.getter();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(char **)(v0 + 40);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    v10 = *(void **)&v7[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey];
    *(_QWORD *)(v0 + 32) = v10;
    v11 = v10;
    v2 = (id *)(v0 + 40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v8 + 4, v8 + 12);
    *v9 = v10;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "[%@] Running OAuth web authentication task", v8, 0xCu);
    v12 = sub_1000051F0(&qword_1000483E8);
    swift_arrayDestroy(v9, 1, v12);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }
  else
  {

  }
  v13 = objc_msgSend((id)objc_opt_self(RBSProcessIdentity), "identityOfCurrentProcess");
  *(_QWORD *)(v0 + 48) = v13;
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)(v0 + 40);
    v16 = objc_allocWithZone((Class)SBSRemoteAlertDefinition);
    v17 = v14;
    v18 = String._bridgeToObjectiveC()();
    v19 = objc_msgSend(v16, "initWithSceneProvidingProcess:configurationIdentifier:", v17, v18);
    *(_QWORD *)(v0 + 56) = v19;

    v20 = swift_task_alloc(32);
    *(_QWORD *)(v0 + 64) = v20;
    *(_QWORD *)(v20 + 16) = v15;
    *(_QWORD *)(v20 + 24) = v19;
    v21 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
    *(_QWORD *)(v0 + 72) = v21;
    v22 = sub_1000051F0(&qword_1000483F0);
    *v21 = v0;
    v21[1] = sub_1000082AC;
    return withCheckedContinuation<A>(isolation:function:_:)(v0 + 24, 0, 0, 0x29286E7572, 0xE500000000000000, sub_100009EE4, v20, v22);
  }
  else
  {
    v24 = Logger.logObject.getter(*v2);
    v25 = static os_log_type_t.error.getter();
    v26 = os_log_type_enabled(v24, v25);
    v27 = (char *)*v2;
    if (v26)
    {
      v28 = (uint8_t *)swift_slowAlloc(12, -1);
      v29 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v28 = 138412290;
      v30 = *(void **)&v27[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey];
      *(_QWORD *)(v0 + 16) = v30;
      v31 = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v28 + 4, v28 + 12);
      *v29 = v30;

      _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%@] No identity", v28, 0xCu);
      v32 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v29, 1, v32);
      swift_slowDealloc(v29, -1, -1);
      swift_slowDealloc(v28, -1, -1);
    }
    else
    {

      v24 = *v2;
    }

    v33 = sub_10002906C((uint64_t)&_swiftEmptyArrayStorage);
    return (*(uint64_t (**)(unint64_t))(v0 + 8))(v33);
  }
}

uint64_t sub_1000082AC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 64);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 72));
  swift_task_dealloc(v1);
  return swift_task_switch(sub_100008308, 0, 0);
}

uint64_t sub_100008308()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 56);

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 24));
}

void sub_100008340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, char *, uint64_t);
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t inited;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  Class isa;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  Class v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v52[112];
  _BYTE v53[40];
  uint64_t aBlock;
  unint64_t v55;
  void (*v56)(uint64_t, void *);
  void *v57;
  void (*v58)(void *);
  uint64_t v59;

  v50 = a3;
  v5 = sub_1000051F0(&qword_1000483F8);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  __chkstk_darwin(v5);
  v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(objc_allocWithZone((Class)SBSRemoteAlertConfigurationContext), "init");
  v10 = swift_allocObject(&unk_100041A70, 24, 7);
  swift_unknownObjectWeakInit(v10 + 16, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v11 = *(unsigned __int8 *)(v6 + 80);
  v12 = (v11 + 24) & ~v11;
  v13 = swift_allocObject(&unk_100041A98, v12 + v7, v11 | 7);
  *(_QWORD *)(v13 + 16) = v10;
  v14 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 32);
  v51 = v5;
  v14(v13 + v12, v8, v5);
  v58 = sub_100009F88;
  v59 = v13;
  aBlock = (uint64_t)_NSConcreteStackBlock;
  v55 = 1107296256;
  v56 = sub_1000125C0;
  v57 = &unk_100041AB0;
  v15 = _Block_copy(&aBlock);
  v16 = (void *)objc_opt_self(BSActionResponder);
  swift_retain(v10);
  v17 = objc_msgSend(v16, "responderWithHandler:", v15);
  _Block_release(v15);
  swift_release(v59);
  swift_release(v10);
  v18 = objc_msgSend(objc_allocWithZone((Class)BSAction), "initWithInfo:responder:", 0, v17);
  v19 = sub_1000051F0((uint64_t *)&unk_100048400);
  inited = swift_initStackObject(v19, v53);
  *(_OWORD *)(inited + 16) = xmmword_1000337A0;
  *(_QWORD *)(inited + 32) = v18;
  aBlock = inited;
  specialized Array._endMutation()();
  v21 = aBlock;
  if ((unint64_t)aBlock >> 62)
  {
    if (aBlock < 0)
      v26 = aBlock;
    else
      v26 = aBlock & 0xFFFFFFFFFFFFFF8;
    v27 = v18;
    swift_bridgeObjectRetain(v21);
    v28 = _CocoaArrayWrapper.endIndex.getter(v26);
    swift_bridgeObjectRelease(v21);
    if (v28)
      goto LABEL_3;
LABEL_8:
    v25 = &_swiftEmptySetSingleton;
    goto LABEL_9;
  }
  v22 = *(_QWORD *)((aBlock & 0xFFFFFFFFFFFFF8) + 0x10);
  v23 = v18;
  if (!v22)
    goto LABEL_8;
LABEL_3:
  sub_100024BEC(v21);
  v25 = v24;
LABEL_9:
  swift_bridgeObjectRelease(v21);
  sub_100009FE4();
  sub_100005954((unint64_t *)&qword_100048410, (uint64_t (*)(uint64_t))sub_100009FE4, (uint64_t)&protocol conformance descriptor for NSObject);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v25);
  objc_msgSend(v9, "setActions:", isa);

  v30 = type metadata accessor for JSONEncoder(0);
  swift_allocObject(v30, *(unsigned int *)(v30 + 48), *(unsigned __int16 *)(v30 + 52));
  v31 = JSONEncoder.init()();
  v32 = a2 + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_context;
  v34 = v9;
  v35 = type metadata accessor for OAuthAuthorizationContext(0, v33);
  v36 = sub_100005954(&qword_100048418, (uint64_t (*)(uint64_t))&type metadata accessor for OAuthAuthorizationContext, (uint64_t)&protocol conformance descriptor for OAuthAuthorizationContext);
  v37 = dispatch thunk of JSONEncoder.encode<A>(_:)(v32, v35, v36);
  v39 = v38;
  swift_release(v31);
  v40 = sub_1000051F0(&qword_100048420);
  v41 = swift_initStackObject(v40, v52);
  *(_OWORD *)(v41 + 16) = xmmword_1000336A0;
  aBlock = 0x44747865746E6F63;
  v55 = 0xEB00000000617461;
  AnyHashable.init<A>(_:)((_QWORD *)(v41 + 32), &aBlock, &type metadata for String, &protocol witness table for String);
  *(_QWORD *)(v41 + 96) = &type metadata for Data;
  *(_QWORD *)(v41 + 72) = v37;
  *(_QWORD *)(v41 + 80) = v39;
  sub_10000A020(v37, v39);
  v42 = sub_10002918C(v41);
  v43 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v42);
  objc_msgSend(v34, "setUserInfo:", v43);

  v44 = (void *)objc_opt_self(SBSRemoteAlertHandle);
  v45 = objc_msgSend(v44, "newHandleWithDefinition:configurationContext:", v50, v34);
  v46 = *(void **)(a2 + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_remoteHandle);
  *(_QWORD *)(a2 + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_remoteHandle) = v45;
  v47 = v45;

  objc_msgSend(v47, "registerObserver:", a2);
  v48 = objc_msgSend(objc_allocWithZone((Class)SBSRemoteAlertActivationContext), "init");
  objc_msgSend(v47, "activateWithContext:", v48);

  sub_10000A064(v37, v39);
}

void sub_1000089D0(void *a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t Strong;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  _QWORD *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t i;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t (*v63)(char *, unint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _OWORD v67[2];
  __int128 v68;
  __int128 v69;
  char v70[32];

  v6 = type metadata accessor for URLQueryItem(0);
  v66 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000051F0(&qword_100048428);
  __chkstk_darwin(v9);
  v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for URLComponents(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2 += 16;
  swift_beginAccess(a2, v70, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a2);
  if (!Strong)
    return;
  v17 = (void *)Strong;
  v18 = objc_msgSend(a1, "info");
  if (!v18)
  {
    v68 = 0u;
    v69 = 0u;
LABEL_11:
    v23 = &qword_100048430;
    v24 = (char *)&v68;
    goto LABEL_12;
  }
  v19 = v18;
  v65 = v6;
  v20 = objc_msgSend(v18, "objectForSetting:", 2);

  if (v20)
  {
    _bridgeAnyObjectToAny(_:)(v67, v20);
    swift_unknownObjectRelease(v20);
  }
  else
  {
    memset(v67, 0, sizeof(v67));
  }
  sub_10000A0A8((uint64_t)v67, (uint64_t)&v68);
  v21 = v65;
  if (!*((_QWORD *)&v69 + 1))
    goto LABEL_11;
  if ((swift_dynamicCast(v67, &v68, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
LABEL_13:
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v25 = type metadata accessor for Logger(0);
    sub_100007D98(v25, (uint64_t)qword_10004AD30);
    v26 = v17;
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v29 = 138412290;
      v31 = *(Class *)((char *)&v26->isa + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey);
      *(_QWORD *)&v68 = v31;
      v32 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, (char *)&v68 + 8, v29 + 4, v29 + 12);
      *v30 = v31;

      _os_log_impl((void *)&_mh_execute_header, v27, v28, "[%@] No response provided, defaulting to cancel.", v29, 0xCu);
      v33 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v30, 1, v33);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v29, -1, -1);
    }
    else
    {

      v27 = v26;
    }

    *(_QWORD *)&v68 = sub_10002906C((uint64_t)&_swiftEmptyArrayStorage);
    v34 = sub_1000051F0(&qword_1000483F8);
    CheckedContinuation.resume(returning:)(&v68, v34);

    return;
  }
  v22 = *((_QWORD *)&v67[0] + 1);
  URLComponents.init(string:)(*(_QWORD *)&v67[0], *((_QWORD *)&v67[0] + 1));
  swift_bridgeObjectRelease(v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    v23 = &qword_100048428;
    v24 = v11;
LABEL_12:
    sub_10000A0F0((uint64_t)v24, v23);
    goto LABEL_13;
  }
  v35 = (*(uint64_t (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  v36 = URLComponents.queryItems.getter(v35);
  if (!v36)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    goto LABEL_13;
  }
  v58 = v15;
  v59 = v13;
  v60 = v12;
  v61 = v17;
  v62 = a3;
  v37 = *(_QWORD *)(v36 + 16);
  v57 = v36;
  if (v37)
  {
    v38 = v36 + ((*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80));
    v39 = *(_QWORD *)(v66 + 72);
    v63 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v66 + 16);
    v64 = v39;
    v40 = (char *)&_swiftEmptyArrayStorage;
    for (i = v63(v8, v38, v21); ; i = v63(v8, v38, v21))
    {
      v42 = URLQueryItem.value.getter(i);
      if (v43)
      {
        v44 = v42;
        v45 = v43;
        v46 = URLQueryItem.name.getter();
        v48 = v47;
        (*(void (**)(char *, uint64_t))(v66 + 8))(v8, v21);
        if ((swift_isUniquelyReferenced_nonNull_native(v40) & 1) == 0)
          v40 = sub_100009208(0, *((_QWORD *)v40 + 2) + 1, 1, v40);
        v50 = *((_QWORD *)v40 + 2);
        v49 = *((_QWORD *)v40 + 3);
        if (v50 >= v49 >> 1)
          v40 = sub_100009208((char *)(v49 > 1), v50 + 1, 1, v40);
        *((_QWORD *)v40 + 2) = v50 + 1;
        v51 = &v40[32 * v50];
        *((_QWORD *)v51 + 4) = v46;
        *((_QWORD *)v51 + 5) = v48;
        *((_QWORD *)v51 + 6) = v44;
        *((_QWORD *)v51 + 7) = v45;
        v21 = v65;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v66 + 8))(v8, v21);
      }
      v38 += v64;
      if (!--v37)
        break;
    }
  }
  else
  {
    v40 = (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease(v57);
  v52 = *((_QWORD *)v40 + 2);
  if (v52)
  {
    sub_1000051F0(&qword_100048438);
    v53 = (void *)static _DictionaryStorage.allocate(capacity:)(v52);
  }
  else
  {
    v53 = &_swiftEmptyDictionarySingleton;
  }
  v54 = v58;
  *(_QWORD *)&v68 = v53;
  sub_10000941C((uint64_t)v40, 1, &v68);
  swift_bridgeObjectRelease(v40);
  v55 = sub_1000051F0(&qword_1000483F8);
  CheckedContinuation.resume(returning:)(&v68, v55);

  (*(void (**)(char *, uint64_t))(v59 + 8))(v54, v60);
}

id sub_100008FB8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OAuthAuthorizationTask(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000904C()
{
  return type metadata accessor for OAuthAuthorizationTask(0);
}

uint64_t type metadata accessor for OAuthAuthorizationTask(uint64_t a1)
{
  uint64_t result;

  result = qword_100048370;
  if (!qword_100048370)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for OAuthAuthorizationTask);
  return result;
}

uint64_t sub_100009090(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  _QWORD v5[3];

  result = type metadata accessor for OAuthAuthorizationContext(319, a2);
  if (v4 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    v5[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v5[2] = "\b";
    result = swift_updateClassMetadata2(a1, 256, 3, v5, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

char *sub_100009208(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

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
      v10 = sub_1000051F0(&qword_100048440);
      v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 1;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 5);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[32 * v8 + 32])
          memmove(v14, a4 + 32, 32 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100009314(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_100009314(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v6 = a4 + 32 * a1 + 32;
    v7 = a3 + 32 * v4;
    if (v6 >= v7 || v6 + 32 * v4 <= a3)
    {
      v8 = sub_1000051F0(&qword_100048448);
      swift_arrayInitWithCopy(a3, v6, v4, v8);
      return v7;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10000941C(uint64_t result, char a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t *v26;
  _QWORD *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  char v46;
  char v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  _QWORD *v56;

  v3 = *(_QWORD *)(result + 16);
  if (v3)
  {
    v6 = (_QWORD *)swift_bridgeObjectRetain(result);
    v8 = v6[4];
    v7 = v6[5];
    v9 = v6[7];
    v54 = v6[6];
    v55 = v6;
    v10 = (_QWORD *)*a3;
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v9);
    v12 = sub_10002ADBC(v8, v7);
    v13 = v10[2];
    v14 = (v11 & 1) == 0;
    v15 = v13 + v14;
    if (__OFADD__(v13, v14))
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v16 = v11;
    if (v10[3] < v15)
    {
      sub_10002BBA0(v15, a2 & 1);
      v17 = sub_10002ADBC(v8, v7);
      if ((v16 & 1) != (v18 & 1))
      {
LABEL_27:
        result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
        __break(1u);
        return result;
      }
      v12 = v17;
      v19 = (_QWORD *)*a3;
      if ((v16 & 1) == 0)
        goto LABEL_12;
LABEL_9:
      v20 = (uint64_t *)(v19[7] + 16 * v12);
      v21 = a3;
      v23 = *v20;
      v22 = v20[1];
      swift_bridgeObjectRetain(v22);
      swift_bridgeObjectRelease(v7);
      swift_bridgeObjectRelease(v9);
      v24 = (_QWORD *)(v19[7] + 16 * v12);
      swift_bridgeObjectRelease(v24[1]);
      *v24 = v23;
      v24[1] = v22;
      a3 = v21;
      v25 = v3 - 1;
      if (v3 == 1)
        return swift_bridgeObjectRelease(v55);
LABEL_16:
      v31 = v55 + 11;
      v56 = a3;
      while (1)
      {
        v37 = *(v31 - 3);
        v36 = *(v31 - 2);
        v38 = *(v31 - 1);
        v39 = *v31;
        v40 = *a3;
        swift_bridgeObjectRetain(v36);
        swift_bridgeObjectRetain(v39);
        v41 = sub_10002ADBC(v37, v36);
        v43 = *(_QWORD *)(v40 + 16);
        v44 = (v42 & 1) == 0;
        v29 = __OFADD__(v43, v44);
        v45 = v43 + v44;
        if (v29)
          goto LABEL_25;
        v46 = v42;
        if (*(_QWORD *)(v40 + 24) < v45)
        {
          sub_10002BBA0(v45, 1);
          v41 = sub_10002ADBC(v37, v36);
          if ((v46 & 1) != (v47 & 1))
            goto LABEL_27;
        }
        v48 = (_QWORD *)*a3;
        v49 = 16 * v41;
        if ((v46 & 1) != 0)
        {
          v32 = (uint64_t *)(v48[7] + v49);
          v34 = *v32;
          v33 = v32[1];
          swift_bridgeObjectRetain(v33);
          swift_bridgeObjectRelease(v36);
          swift_bridgeObjectRelease(v39);
          v35 = (_QWORD *)(v48[7] + v49);
          swift_bridgeObjectRelease(v35[1]);
          *v35 = v34;
          v35[1] = v33;
          a3 = v56;
        }
        else
        {
          v48[(v41 >> 6) + 8] |= 1 << v41;
          v50 = (uint64_t *)(v48[6] + v49);
          *v50 = v37;
          v50[1] = v36;
          v51 = (_QWORD *)(v48[7] + v49);
          *v51 = v38;
          v51[1] = v39;
          v52 = v48[2];
          v29 = __OFADD__(v52, 1);
          v53 = v52 + 1;
          a3 = v56;
          if (v29)
            goto LABEL_26;
          v48[2] = v53;
        }
        v31 += 4;
        if (!--v25)
          return swift_bridgeObjectRelease(v55);
      }
    }
    if ((a2 & 1) != 0)
    {
      v19 = (_QWORD *)*a3;
      if ((v11 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_10002B5C8();
      v19 = (_QWORD *)*a3;
      if ((v16 & 1) != 0)
        goto LABEL_9;
    }
LABEL_12:
    v19[(v12 >> 6) + 8] |= 1 << v12;
    v26 = (uint64_t *)(v19[6] + 16 * v12);
    *v26 = v8;
    v26[1] = v7;
    v27 = (_QWORD *)(v19[7] + 16 * v12);
    *v27 = v54;
    v27[1] = v9;
    v28 = v19[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v19[2] = v30;
    v25 = v3 - 1;
    if (v3 == 1)
      return swift_bridgeObjectRelease(v55);
    goto LABEL_16;
  }
  return result;
}

void sub_10000971C()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;

  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v1 = type metadata accessor for Logger(0);
  sub_100007D98(v1, (uint64_t)qword_10004AD30);
  v9 = v0;
  v2 = Logger.logObject.getter();
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(12, -1);
    v5 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v4 = 138412290;
    v6 = *(void **)&v9[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey];
    v10 = v6;
    v7 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v4 + 4, v4 + 12);
    *v5 = v6;

    _os_log_impl((void *)&_mh_execute_header, v2, v3, "[%@] Remote alert did activate", v4, 0xCu);
    v8 = sub_1000051F0(&qword_1000483E8);
    swift_arrayDestroy(v5, 1, v8);
    swift_slowDealloc(v5, -1, -1);
    swift_slowDealloc(v4, -1, -1);

  }
  else
  {

  }
}

void sub_1000098D4()
{
  void *v0;
  uint64_t v1;
  char *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v1 = type metadata accessor for Logger(0);
  sub_100007D98(v1, (uint64_t)qword_10004AD30);
  v2 = v0;
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v5 = 138412290;
    v7 = *(void **)&v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey];
    v13 = v7;
    v8 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v5 + 4, v5 + 12);
    *v6 = v7;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@] Remote alert did deactivate", v5, 0xCu);
    v9 = sub_1000051F0(&qword_1000483E8);
    swift_arrayDestroy(v6, 1, v9);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
  v10 = OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_remoteHandle;
  v11 = *(void **)&v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_remoteHandle];
  if (v11)
  {
    objc_msgSend(v11, "unregisterObserver:", v2);
    v11 = *(void **)&v2[v10];
  }
  objc_msgSend(v11, "invalidate");
  v12 = *(void **)&v2[v10];
  *(_QWORD *)&v2[v10] = 0;

}

void sub_100009AA8(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *oslog;
  _QWORD v28[3];
  char v29[8];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v3 = OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_remoteHandle;
  v4 = *(void **)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_remoteHandle];
  if (v4)
  {
    objc_msgSend(v4, "unregisterObserver:", v1);
    v4 = *(void **)&v1[v3];
  }
  objc_msgSend(v4, "invalidate");
  v5 = *(void **)&v1[v3];
  *(_QWORD *)&v1[v3] = 0;

  if (a1)
  {
    swift_errorRetain(a1);
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v6 = type metadata accessor for Logger(0);
    sub_100007D98(v6, (uint64_t)qword_10004AD30);
    swift_errorRetain(a1);
    v7 = v1;
    swift_errorRetain(a1);
    v8 = v7;
    oslog = Logger.logObject.getter();
    v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v9))
    {
      v10 = swift_slowAlloc(22, -1);
      v11 = (_QWORD *)swift_slowAlloc(8, -1);
      v12 = swift_slowAlloc(32, -1);
      v31 = v12;
      *(_DWORD *)v10 = 138412546;
      v13 = *(void **)&v8[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey];
      v30 = (uint64_t)v13;
      v14 = v13;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v10 + 4, v10 + 12);
      *v11 = v13;

      *(_WORD *)(v10 + 12) = 2082;
      swift_getErrorValue(a1, v29, v28);
      v15 = Error.localizedDescription.getter(v28[1], v28[2]);
      v17 = v16;
      v30 = sub_100030804(v15, v16, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v10 + 14, v10 + 22);
      swift_bridgeObjectRelease(v17);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, oslog, v9, "[%@] Remote alert did invalidate with error: %{public}s", (uint8_t *)v10, 0x16u);
      v18 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v11, 1, v18);
      swift_slowDealloc(v11, -1, -1);
      swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v12, -1, -1);
      swift_slowDealloc(v10, -1, -1);

      swift_errorRelease(a1);
      return;
    }
    swift_errorRelease(a1);

    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }
  else
  {
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v19 = type metadata accessor for Logger(0);
    sub_100007D98(v19, (uint64_t)qword_10004AD30);
    oslog = v1;
    v20 = Logger.logObject.getter();
    v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(12, -1);
      v23 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v22 = 138412290;
      v24 = *(Class *)((char *)&oslog->isa + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey);
      v31 = (uint64_t)v24;
      v25 = v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v22 + 4, v22 + 12);
      *v23 = v24;

      _os_log_impl((void *)&_mh_execute_header, v20, v21, "[%@] Remote alert did invalidate", v22, 0xCu);
      v26 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v23, 1, v26);
      swift_slowDealloc(v23, -1, -1);
      swift_slowDealloc(v22, -1, -1);

      return;
    }

  }
}

void sub_100009EE4(uint64_t a1)
{
  uint64_t v1;

  sub_100008340(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_100009EEC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100009F10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_1000051F0(&qword_1000483F8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_release(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_100009F88(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_1000051F0(&qword_1000483F8) - 8) + 80);
  sub_1000089D0(a1, *(_QWORD *)(v1 + 16), v1 + ((v3 + 24) & ~v3));
}

uint64_t sub_100009FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100009FDC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100009FE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100049230;
  if (!qword_100049230)
  {
    v1 = objc_opt_self(BSAction);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100049230);
  }
  return result;
}

uint64_t sub_10000A020(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000A064(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000A0A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000051F0(&qword_100048430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A0F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000051F0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000A130()
{
  uint64_t v0;
  id v1;
  objc_class *v2;
  char *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t result;
  _QWORD v10[4];
  _QWORD aBlock[5];
  uint64_t v12;
  objc_super v13;

  v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LaunchAngelService()), "init");
  v2 = (objc_class *)type metadata accessor for LaunchAngelServiceDelegate();
  v3 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel26LaunchAngelServiceDelegate_service] = v1;
  v13.receiver = v3;
  v13.super_class = v2;
  v4 = objc_msgSendSuper2(&v13, "init");
  v10[2] = v4;
  v5 = swift_allocObject(&unk_100041AE8, 32, 7);
  *(_QWORD *)(v5 + 16) = sub_10000A3D4;
  *(_QWORD *)(v5 + 24) = v10;
  aBlock[4] = sub_10000A3EC;
  v12 = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000A34C;
  aBlock[3] = &unk_100041B00;
  v6 = _Block_copy(aBlock);
  v7 = (void *)objc_opt_self(BSServiceConnectionListener);
  swift_retain(v5);
  v8 = objc_msgSend(v7, "listenerWithConfigurator:", v6);
  _Block_release(v6);
  swift_release(v12);
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation(v5, "", 0, 0, 0, 1);
  result = swift_release(v5);
  if ((v6 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v0 + 16) = v8;
    *(_QWORD *)(v0 + 24) = v4;
    return v0;
  }
  return result;
}

id sub_10000A2A0(void *a1, uint64_t a2)
{
  NSString v4;
  NSString v5;

  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "setDomain:", v4);

  v5 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "setService:", v5);

  return objc_msgSend(a1, "setDelegate:", a2);
}

uint64_t sub_10000A34C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain(a2);
  v3(a2);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_10000A388()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for LaunchAngelXPCServer()
{
  return objc_opt_self(_TtC26AppDistributionLaunchAngel20LaunchAngelXPCServer);
}

id sub_10000A3D4(void *a1)
{
  uint64_t v1;

  return sub_10000A2A0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10000A3DC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A3EC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000A40C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000A41C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id sub_10000A6AC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC26AppDistributionLaunchAngel11AppDelegate);
}

id sub_10000A920()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  NSString v6;
  NSString v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  v2 = sub_1000051F0(&qword_100048980);
  __chkstk_darwin(v2);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window] = 0;
  v5 = v0;
  v6 = String._bridgeToObjectiveC()();
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend((id)objc_opt_self(AMSBag), "bagForProfile:profileVersion:", v6, v7);

  *(_QWORD *)&v5[OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_bag] = v8;
  v9 = v8;
  swift_unknownObjectRetain(v9);
  URL.init(string:)(0xD00000000000004ELL, 0x8000000100035570);
  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v4, 1, v10);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v13 = type metadata accessor for LocalizationJetPack(0);
    v14 = swift_allocObject(v13, *(unsigned int *)(v13 + 48), *(unsigned __int16 *)(v13 + 52));
    swift_defaultActor_initialize();
    *(_QWORD *)(v14 + 112) = 0;
    v15 = v14 + OBJC_IVAR____TtC26AppDistributionLaunchAngel19LocalizationJetPack_lastFailedLoadAttempt;
    v16 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v14 + OBJC_IVAR____TtC26AppDistributionLaunchAngel19LocalizationJetPack_url, v4, v10);
    *(_QWORD *)(v14 + 120) = v9;

    *(_QWORD *)&v5[OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_localizer] = v14;
    v17.receiver = v5;
    v17.super_class = ObjectType;
    return objc_msgSendSuper2(&v17, "init");
  }
  return result;
}

void sub_10000AB38(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint8_t *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  char **v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  id v60;
  char *v61;
  id v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  char **v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  char *v91;
  id v92;
  uint64_t v93;
  void *v94;
  id v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  void *v99;
  id v100;
  Class isa;
  id v102;
  char *v103;
  char *v104;
  uint64_t v105;
  char *v106;
  id v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  char *v120;
  char *v121;
  void (*v122)(char *, char *, uint64_t);
  void *v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  char *v127;
  char *v128;
  uint64_t v129;
  unint64_t v130;
  char *v131;
  _BYTE v132[32];
  __int128 v133;
  __int128 v134;

  v4 = sub_1000051F0(&qword_100048300);
  __chkstk_darwin(v4);
  v6 = (char *)&v117 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000051F0(&qword_1000486A0);
  __chkstk_darwin(v7);
  v128 = (char *)&v117 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for InstallSheetContext(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v120 = (char *)&v117 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v121 = (char *)&v117 - v13;
  v15 = type metadata accessor for MainActor(0, v14);
  v16 = static MainActor.shared.getter(v15);
  v17 = dispatch thunk of Actor.unownedExecutor.getter(v15, &protocol witness table for MainActor);
  v19 = v18;
  if ((swift_task_isCurrentExecutor(v17) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 92, v17, v19);
  v126 = objc_msgSend(a1, "configurationContext");
  if (v126)
  {
    v118 = v6;
    v124 = v16;
    v125 = v15;
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v20 = type metadata accessor for Logger(0);
    v21 = sub_100007D98(v20, (uint64_t)qword_10004AD30);
    v22 = a2;
    v122 = (void (*)(char *, char *, uint64_t))v21;
    v23 = Logger.logObject.getter();
    v24 = static os_log_type_t.default.getter();
    v25 = os_log_type_enabled(v23, v24);
    v123 = a1;
    if (v25)
    {
      v119 = v10;
      v117 = v9;
      v26 = (uint8_t *)swift_slowAlloc(12, -1);
      v27 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v26 = 138412290;
      v28 = v125;
      v29 = static MainActor.shared.getter(v27);
      v30 = dispatch thunk of Actor.unownedExecutor.getter(v28, &protocol witness table for MainActor);
      v32 = v31;
      if ((swift_task_isCurrentExecutor(v30) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 98, v30, v32);
      swift_release(v29);
      v131 = v22;
      v33 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v131, v132, v26 + 4, v26 + 12);
      *v27 = v22;

      _os_log_impl((void *)&_mh_execute_header, v23, v24, "[%@] Handling install confirmation sheet request", v26, 0xCu);
      v34 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v27, 1, v34);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v26, -1, -1);

      a1 = v123;
      v9 = v117;
      v10 = v119;
    }
    else
    {

    }
    v47 = v126;
    v46 = v127;
    v48 = objc_msgSend(objc_allocWithZone((Class)UIWindow), "initWithWindowScene:", a1);
    v49 = *(void **)&v46[OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window];
    *(_QWORD *)&v46[OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window] = v48;

    v50 = objc_msgSend(v47, "userInfo");
    if (v50)
    {
      v51 = v50;
      v52 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v50, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

      v129 = 0x44747865746E6F63;
      v130 = 0xEB00000000617461;
      AnyHashable.init<A>(_:)(&v131, &v129, &type metadata for String, &protocol witness table for String);
      if (*(_QWORD *)(v52 + 16) && (v53 = sub_10002AE20((uint64_t)&v131), (v54 & 1) != 0))
      {
        sub_10000F65C(*(_QWORD *)(v52 + 56) + 32 * v53, (uint64_t)&v133);
      }
      else
      {
        v133 = 0u;
        v134 = 0u;
      }
      swift_bridgeObjectRelease(v52);
      sub_10000F4A4((uint64_t)&v131);
      if (*((_QWORD *)&v134 + 1))
      {
        if ((swift_dynamicCast(&v129, &v133, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) != 0)
        {
          v55 = (id)v130;
          v127 = (char *)v129;
          v56 = type metadata accessor for PropertyListDecoder(0);
          swift_allocObject(v56, *(unsigned int *)(v56 + 48), *(unsigned __int16 *)(v56 + 52));
          v57 = PropertyListDecoder.init()();
          v58 = sub_100005954(&qword_1000486B8, (uint64_t (*)(uint64_t))&type metadata accessor for InstallSheetContext, (uint64_t)&protocol conformance descriptor for InstallSheetContext);
          v126 = v55;
          dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v9, v127, v55, v9, v58);
          swift_release(v57);
          v103 = v128;
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v128, 0, 1, v9);
          v122 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
          v104 = v121;
          v122(v121, v103, v9);
          v105 = type metadata accessor for TaskPriority(0);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v105 - 8) + 56))(v118, 1, 1, v105);
          v106 = v120;
          (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v120, v104, v9);
          v128 = v46;
          v107 = v47;
          v108 = a1;
          v109 = static MainActor.shared.getter(v108);
          v110 = *(unsigned __int8 *)(v10 + 80);
          v111 = (v110 + 32) & ~v110;
          v119 = v10;
          v112 = (v11 + v111 + 7) & 0xFFFFFFFFFFFFFFF8;
          v113 = (v112 + 15) & 0xFFFFFFFFFFFFFFF8;
          v114 = (v113 + 15) & 0xFFFFFFFFFFFFFFF8;
          v115 = swift_allocObject(&unk_100041B38, v114 + 8, v110 | 7);
          *(_QWORD *)(v115 + 16) = v109;
          *(_QWORD *)(v115 + 24) = &protocol witness table for MainActor;
          v122((char *)(v115 + v111), v106, v9);
          *(_QWORD *)(v115 + v112) = v128;
          *(_QWORD *)(v115 + v113) = v107;
          *(_QWORD *)(v115 + v114) = v108;
          v116 = sub_1000162E8((uint64_t)v118, (uint64_t)&unk_1000486C8, v115);
          sub_10000A064((uint64_t)v127, (unint64_t)v126);

          swift_release(v116);
          (*(void (**)(char *, uint64_t))(v119 + 8))(v121, v9);
          swift_release(v124);
          return;
        }
      }
      else
      {
        sub_10000A0F0((uint64_t)&v133, &qword_100048430);
      }
    }
    v59 = v22;
    v60 = v47;
    v61 = v59;
    v62 = v60;
    v63 = Logger.logObject.getter();
    v64 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v63, v64))
    {
      v65 = swift_slowAlloc(22, -1);
      v66 = (char **)swift_slowAlloc(8, -1);
      v67 = (char *)swift_slowAlloc(32, -1);
      v128 = v67;
      v131 = v67;
      *(_DWORD *)v65 = 138412546;
      v68 = v125;
      v69 = static MainActor.shared.getter(v67);
      v70 = dispatch thunk of Actor.unownedExecutor.getter(v68, &protocol witness table for MainActor);
      v72 = v71;
      if ((swift_task_isCurrentExecutor(v70) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 104, v70, v72);
      swift_release(v69);
      *(_QWORD *)&v133 = v61;
      v73 = v61;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v133, (char *)&v133 + 8, v65 + 4, v65 + 12);
      *v66 = v61;

      *(_WORD *)(v65 + 12) = 2082;
      v74 = v125;
      v76 = static MainActor.shared.getter(v75);
      v77 = dispatch thunk of Actor.unownedExecutor.getter(v74, &protocol witness table for MainActor);
      v79 = v78;
      if ((swift_task_isCurrentExecutor(v77) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 104, v77, v79);
      v80 = objc_msgSend(v62, "userInfo");
      if (v80)
      {
        v81 = v80;
        v82 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v80, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
        swift_release(v76);

      }
      else
      {
        v83 = static MainActor.shared.getter(0);
        v84 = dispatch thunk of Actor.unownedExecutor.getter(v74, &protocol witness table for MainActor);
        v86 = v85;
        if ((swift_task_isCurrentExecutor(v84) & 1) == 0)
          swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 104, v84, v86);
        v82 = sub_10002918C((uint64_t)&_swiftEmptyArrayStorage);
        swift_release(v76);
        swift_release(v83);
      }
      v87 = Dictionary.description.getter(v82, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
      v89 = v88;
      swift_bridgeObjectRelease(v82);
      *(_QWORD *)&v133 = sub_100030804(v87, v89, (uint64_t *)&v131);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v133, (char *)&v133 + 8, v65 + 14, v65 + 22);

      swift_bridgeObjectRelease(v89);
      _os_log_impl((void *)&_mh_execute_header, v63, v64, "[%@] Invalid context: %{public}s", (uint8_t *)v65, 0x16u);
      v90 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v66, 1, v90);
      swift_slowDealloc(v66, -1, -1);
      v91 = v128;
      swift_arrayDestroy(v128, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v91, -1, -1);
      swift_slowDealloc(v65, -1, -1);

      a1 = v123;
    }
    else
    {

    }
    v92 = objc_msgSend(a1, "activationContext");
    v93 = v124;
    if (!v92)
      goto LABEL_43;
    v94 = v92;
    v95 = objc_msgSend(v92, "actions");

    v96 = sub_10000F82C(0, (unint64_t *)&qword_100049230, BSAction_ptr);
    v97 = sub_10000F44C();
    v98 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v95, v96, v97);

    v99 = (void *)sub_10000D7F4(v98);
    swift_bridgeObjectRelease(v98);
    if (v99)
    {
      if ((objc_msgSend(v99, "canSendResponse") & 1) != 0)
      {
        v100 = objc_msgSend(objc_allocWithZone((Class)BSMutableSettings), "init");
        sub_10000F82C(0, (unint64_t *)&unk_1000486A8, NSNumber_ptr);
        isa = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
        objc_msgSend(v100, "setObject:forSetting:", isa, 1);

        v102 = objc_msgSend((id)objc_opt_self(BSActionResponse), "responseWithInfo:", v100);
        objc_msgSend(v99, "sendResponse:", v102);
        swift_release(v93);

      }
      else
      {
        swift_release(v93);

      }
    }
    else
    {
LABEL_43:
      swift_release(v93);
    }

  }
  else
  {
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v35 = type metadata accessor for Logger(0);
    sub_100007D98(v35, (uint64_t)qword_10004AD30);
    v128 = a2;
    v36 = Logger.logObject.getter();
    v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc(12, -1);
      v39 = (char **)swift_slowAlloc(8, -1);
      *(_DWORD *)v38 = 138412290;
      v40 = static MainActor.shared.getter(v39);
      v41 = dispatch thunk of Actor.unownedExecutor.getter(v15, &protocol witness table for MainActor);
      v43 = v42;
      if ((swift_task_isCurrentExecutor(v41) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 94, v41, v43);
      swift_release(v40);
      v131 = v128;
      v44 = v128;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v131, v132, v38 + 4, v38 + 12);
      *v39 = v128;

      _os_log_impl((void *)&_mh_execute_header, v36, v37, "[%@] No configuration context provided.", v38, 0xCu);
      v45 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v39, 1, v45);
      swift_slowDealloc(v39, -1, -1);
      swift_slowDealloc(v38, -1, -1);
      swift_release(v16);

    }
    else
    {
      swift_release(v16);

    }
  }
}

void sub_10000B8A8(void *a1, void *a2)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint8_t *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  id v60;
  _QWORD *v61;
  id v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  void *v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  id v90;
  void *v91;
  id v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  void *v96;
  id v97;
  Class isa;
  id v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  id v103;
  char *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char isCurrentExecutor;
  void (**v113)();
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  unint64_t v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  char *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  _QWORD *v130;
  uint64_t v131;
  unint64_t v132;
  _QWORD *v133;
  _BYTE v134[32];
  __int128 v135;
  __int128 v136;

  v3 = v2;
  v6 = sub_1000051F0(&qword_1000486D8);
  __chkstk_darwin(v6);
  v129 = (uint64_t)&v121 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LicenseResolutionContext(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v124 = (char *)&v121 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v121 - v12;
  v15 = type metadata accessor for MainActor(0, v14);
  v16 = static MainActor.shared.getter(v15);
  v17 = dispatch thunk of Actor.unownedExecutor.getter(v15, &protocol witness table for MainActor);
  v19 = v18;
  if ((swift_task_isCurrentExecutor(v17) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 138, v17, v19);
  v130 = objc_msgSend(a1, "configurationContext");
  if (v130)
  {
    v127 = v3;
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v123 = v13;
    v20 = type metadata accessor for Logger(0);
    v21 = sub_100007D98(v20, (uint64_t)qword_10004AD30);
    v22 = a2;
    v125 = v21;
    v23 = Logger.logObject.getter();
    v24 = static os_log_type_t.default.getter();
    v25 = os_log_type_enabled(v23, v24);
    v128 = v16;
    v126 = a1;
    if (v25)
    {
      v121 = v9;
      v122 = v8;
      v26 = (uint8_t *)swift_slowAlloc(12, -1);
      v27 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v26 = 138412290;
      v28 = static MainActor.shared.getter(v27);
      v29 = dispatch thunk of Actor.unownedExecutor.getter(v15, &protocol witness table for MainActor);
      v31 = v30;
      if ((swift_task_isCurrentExecutor(v29) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 144, v29, v31);
      swift_release(v28);
      v133 = v22;
      v32 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v133, v134, v26 + 4, v26 + 12);
      *v27 = v22;

      _os_log_impl((void *)&_mh_execute_header, v23, v24, "[%@] Handling license resolution sheet request", v26, 0xCu);
      v33 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v27, 1, v33);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v26, -1, -1);

      v16 = v128;
      a1 = v126;
      v8 = v122;
      v9 = v121;
    }
    else
    {

    }
    v45 = objc_msgSend(objc_allocWithZone((Class)UIWindow), "initWithWindowScene:", a1);
    v46 = OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window;
    v47 = *(void **)(v127 + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window);
    *(_QWORD *)(v127 + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window) = v45;

    v48 = v130;
    v49 = objc_msgSend(v130, "userInfo");
    if (v49)
    {
      v50 = v49;
      v51 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v49, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

      v131 = 0x44747865746E6F63;
      v132 = 0xEB00000000617461;
      AnyHashable.init<A>(_:)(&v133, &v131, &type metadata for String, &protocol witness table for String);
      if (*(_QWORD *)(v51 + 16))
      {
        v52 = sub_10002AE20((uint64_t)&v133);
        v53 = v129;
        if ((v54 & 1) != 0)
        {
          sub_10000F65C(*(_QWORD *)(v51 + 56) + 32 * v52, (uint64_t)&v135);
        }
        else
        {
          v135 = 0u;
          v136 = 0u;
        }
      }
      else
      {
        v135 = 0u;
        v136 = 0u;
        v53 = v129;
      }
      swift_bridgeObjectRelease(v51);
      sub_10000F4A4((uint64_t)&v133);
      if (*((_QWORD *)&v136 + 1))
      {
        if ((swift_dynamicCast(&v131, &v135, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) != 0)
        {
          v55 = v131;
          v56 = v132;
          v57 = type metadata accessor for JSONDecoder(0);
          swift_allocObject(v57, *(unsigned int *)(v57 + 48), *(unsigned __int16 *)(v57 + 52));
          v58 = JSONDecoder.init()();
          sub_100005954(&qword_1000486E0, (uint64_t (*)(uint64_t))&type metadata accessor for LicenseResolutionContext, (uint64_t)&protocol conformance descriptor for LicenseResolutionContext);
          v129 = v55;
          v122 = v56;
          dispatch thunk of JSONDecoder.decode<A>(_:from:)(v8);
          swift_release(v58);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(v53, 0, 1, v8);
          v100 = v53;
          v101 = v123;
          (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v123, v100, v8);
          v102 = (uint64_t)v124;
          (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v124, v101, v8);
          v103 = objc_allocWithZone((Class)type metadata accessor for LicenseResolutionViewController(0));
          v104 = (char *)sub_1000077F8(v102);
          v105 = swift_allocObject(&unk_100041B60, 24, 7);
          v106 = a1;
          swift_unknownObjectWeakInit(v105 + 16, a1);
          v107 = swift_retain(v105);
          v108 = static MainActor.shared.getter(v107);
          v109 = dispatch thunk of Actor.unownedExecutor.getter(v15, &protocol witness table for MainActor);
          v111 = v110;
          isCurrentExecutor = swift_task_isCurrentExecutor(v109);
          if ((isCurrentExecutor & 1) == 0)
            swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 13, v109, v111);
          v113 = (void (**)())&v104[OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction];
          v114 = *(_QWORD *)&v104[OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction];
          v115 = *(_QWORD *)&v104[OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction
                                + 8];
          *v113 = sub_10000F7F4;
          v113[1] = (void (*)())v105;
          sub_100007E04(v114, v115);
          swift_release(v105);
          swift_release(v108);
          v116 = v127;
          v117 = v128;
          v118 = *(void **)(v127 + v46);
          v119 = v122;
          if (v118)
          {
            objc_msgSend(v118, "setRootViewController:", v104);
            v120 = *(void **)(v116 + v46);
            if (v120)
              objc_msgSend(v120, "makeKeyAndVisible");
          }
          objc_msgSend(v106, "setDesiredHardwareButtonEvents:", 16);
          objc_msgSend(v106, "setAllowsMenuButtonDismissal:", 0);
          objc_msgSend(v106, "setAllowsAlertStacking:", 1);
          objc_msgSend(v106, "setDismissalAnimationStyle:", 2);
          objc_msgSend(v106, "setReachabilityDisabled:", 1);
          sub_10000A064(v129, v119);

          (*(void (**)(char *, uint64_t))(v9 + 8))(v123, v8);
          swift_release(v117);
          return;
        }
      }
      else
      {
        sub_10000A0F0((uint64_t)&v135, &qword_100048430);
      }
    }
    v59 = v22;
    v60 = v48;
    v61 = v59;
    v62 = v60;
    v63 = Logger.logObject.getter();
    v64 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v63, v64))
    {
      v65 = swift_slowAlloc(22, -1);
      v130 = (_QWORD *)swift_slowAlloc(8, -1);
      v66 = swift_slowAlloc(32, -1);
      v129 = v66;
      v133 = (_QWORD *)v66;
      *(_DWORD *)v65 = 138412546;
      v67 = static MainActor.shared.getter(v66);
      v68 = dispatch thunk of Actor.unownedExecutor.getter(v15, &protocol witness table for MainActor);
      v70 = v69;
      if ((swift_task_isCurrentExecutor(v68) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 151, v68, v70);
      swift_release(v67);
      *(_QWORD *)&v135 = v61;
      v71 = v61;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v135, (char *)&v135 + 8, v65 + 4, v65 + 12);
      *v130 = v61;

      *(_WORD *)(v65 + 12) = 2082;
      v73 = static MainActor.shared.getter(v72);
      v74 = dispatch thunk of Actor.unownedExecutor.getter(v15, &protocol witness table for MainActor);
      v76 = v75;
      if ((swift_task_isCurrentExecutor(v74) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 151, v74, v76);
      v77 = objc_msgSend(v62, "userInfo");
      v16 = v128;
      if (v77)
      {
        v78 = v77;
        v79 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v77, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
        swift_release(v73);

      }
      else
      {
        v80 = static MainActor.shared.getter(0);
        v81 = dispatch thunk of Actor.unownedExecutor.getter(v15, &protocol witness table for MainActor);
        v83 = v82;
        if ((swift_task_isCurrentExecutor(v81) & 1) == 0)
          swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 151, v81, v83);
        v79 = sub_10002918C((uint64_t)&_swiftEmptyArrayStorage);
        swift_release(v73);
        swift_release(v80);
      }
      v84 = Dictionary.description.getter(v79, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
      v86 = v85;
      swift_bridgeObjectRelease(v79);
      *(_QWORD *)&v135 = sub_100030804(v84, v86, (uint64_t *)&v133);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v135, (char *)&v135 + 8, v65 + 14, v65 + 22);

      swift_bridgeObjectRelease(v86);
      _os_log_impl((void *)&_mh_execute_header, v63, v64, "[%@] Invalid context: %{public}s", (uint8_t *)v65, 0x16u);
      v87 = sub_1000051F0(&qword_1000483E8);
      v88 = v130;
      swift_arrayDestroy(v130, 1, v87);
      swift_slowDealloc(v88, -1, -1);
      v89 = v129;
      swift_arrayDestroy(v129, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v89, -1, -1);
      swift_slowDealloc(v65, -1, -1);

      a1 = v126;
    }
    else
    {

    }
    v90 = objc_msgSend(a1, "activationContext");
    if (!v90)
      goto LABEL_44;
    v91 = v90;
    v92 = objc_msgSend(v90, "actions");

    v93 = sub_10000F82C(0, (unint64_t *)&qword_100049230, BSAction_ptr);
    v94 = sub_10000F44C();
    v95 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v92, v93, v94);

    v96 = (void *)sub_10000D7F4(v95);
    swift_bridgeObjectRelease(v95);
    if (v96)
    {
      if ((objc_msgSend(v96, "canSendResponse") & 1) != 0)
      {
        v97 = objc_msgSend(objc_allocWithZone((Class)BSMutableSettings), "init");
        sub_10000F82C(0, (unint64_t *)&unk_1000486A8, NSNumber_ptr);
        isa = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
        objc_msgSend(v97, "setObject:forSetting:", isa, 1);

        v99 = objc_msgSend((id)objc_opt_self(BSActionResponse), "responseWithInfo:", v97);
        objc_msgSend(v96, "sendResponse:", v99);
        swift_release(v16);

      }
      else
      {
        swift_release(v16);

      }
    }
    else
    {
LABEL_44:
      swift_release(v16);
    }

  }
  else
  {
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v34 = type metadata accessor for Logger(0);
    sub_100007D98(v34, (uint64_t)qword_10004AD30);
    v130 = a2;
    v35 = Logger.logObject.getter();
    v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc(12, -1);
      v38 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v37 = 138412290;
      v39 = static MainActor.shared.getter(v38);
      v40 = dispatch thunk of Actor.unownedExecutor.getter(v15, &protocol witness table for MainActor);
      v42 = v41;
      if ((swift_task_isCurrentExecutor(v40) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 140, v40, v42);
      swift_release(v39);
      v133 = v130;
      v43 = v130;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v133, v134, v37 + 4, v37 + 12);
      *v38 = v130;

      _os_log_impl((void *)&_mh_execute_header, v35, v36, "[%@] No configuration context provided.", v37, 0xCu);
      v44 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v38, 1, v44);
      swift_slowDealloc(v38, -1, -1);
      swift_slowDealloc(v37, -1, -1);
      swift_release(v16);

    }
    else
    {
      swift_release(v16);

    }
  }
}

void sub_10000C670(void *a1, void *a2)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  uint8_t *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  _QWORD *v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  id v62;
  _QWORD *v63;
  id v64;
  NSObject *v65;
  os_log_type_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  void *v95;
  id v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  void *v100;
  id v101;
  Class isa;
  id v103;
  void *v104;
  uint64_t v105;
  char *v106;
  void (*v107)(char *, char *, uint64_t);
  objc_class *v108;
  char *v109;
  char *v110;
  uint64_t v111;
  char *v112;
  id v113;
  id v114;
  void *v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  char *v121;
  uint64_t v122;
  char *v123;
  void (*v124)(char *, uint64_t);
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void (**v132)();
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  unint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  _QWORD *v153;
  objc_super v154;
  uint64_t v155;
  unint64_t v156;
  _QWORD *v157;
  _BYTE v158[32];
  __int128 v159;
  __int128 v160;

  v3 = v2;
  v6 = sub_1000051F0(&qword_1000486E8);
  __chkstk_darwin(v6);
  v153 = (uint64_t *)((char *)&v140 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = type metadata accessor for OAuthAuthorizationContext(0, v8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v149 = (char *)&v140 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v14 = (char *)&v140 - v13;
  v16 = type metadata accessor for MainActor(0, v15);
  v17 = static MainActor.shared.getter(v16);
  v18 = dispatch thunk of Actor.unownedExecutor.getter(v16, &protocol witness table for MainActor);
  v20 = v19;
  if ((swift_task_isCurrentExecutor(v18) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 174, v18, v20);
  v21 = objc_msgSend(a1, "configurationContext");
  if (v21)
  {
    v22 = v21;
    v145 = v14;
    v152 = v17;
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v148 = v10;
    v23 = type metadata accessor for Logger(0);
    v24 = sub_100007D98(v23, (uint64_t)qword_10004AD30);
    v25 = a2;
    v150 = v24;
    v26 = Logger.logObject.getter();
    v27 = static os_log_type_t.default.getter();
    v28 = os_log_type_enabled(v26, v27);
    v151 = a1;
    if (v28)
    {
      v144 = v3;
      v147 = v9;
      v29 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v29 = 138412290;
      v31 = static MainActor.shared.getter(v30);
      v146 = v16;
      v32 = dispatch thunk of Actor.unownedExecutor.getter(v16, &protocol witness table for MainActor);
      v34 = v33;
      if ((swift_task_isCurrentExecutor(v32) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 180, v32, v34);
      swift_release(v31);
      v157 = v25;
      v35 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v157, v158, v29 + 4, v29 + 12);
      *v30 = v25;

      _os_log_impl((void *)&_mh_execute_header, v26, v27, "[%@] Handling OAuth authentication sheet request", v29, 0xCu);
      v36 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v30, 1, v36);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v29, -1, -1);

      a1 = v151;
      v16 = v146;
      v9 = v147;
      v3 = v144;
    }
    else
    {

    }
    v48 = objc_msgSend(objc_allocWithZone((Class)UIWindow), "initWithWindowScene:", a1);
    v49 = OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window;
    v50 = *(void **)(v3 + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window);
    *(_QWORD *)(v3 + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window) = v48;

    v51 = objc_msgSend(v22, "userInfo");
    v52 = v153;
    if (v51)
    {
      v53 = v51;
      v54 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v51, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

      v155 = 0x44747865746E6F63;
      v156 = 0xEB00000000617461;
      AnyHashable.init<A>(_:)(&v157, &v155, &type metadata for String, &protocol witness table for String);
      if (*(_QWORD *)(v54 + 16) && (v55 = sub_10002AE20((uint64_t)&v157), (v56 & 1) != 0))
      {
        sub_10000F65C(*(_QWORD *)(v54 + 56) + 32 * v55, (uint64_t)&v159);
      }
      else
      {
        v159 = 0u;
        v160 = 0u;
      }
      swift_bridgeObjectRelease(v54);
      sub_10000F4A4((uint64_t)&v157);
      if (*((_QWORD *)&v160 + 1))
      {
        if ((swift_dynamicCast(&v155, &v159, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) != 0)
        {
          v141 = v49;
          v57 = v155;
          v58 = v156;
          v59 = type metadata accessor for JSONDecoder(0);
          swift_allocObject(v59, *(unsigned int *)(v59 + 48), *(unsigned __int16 *)(v59 + 52));
          v60 = JSONDecoder.init()();
          sub_100005954((unint64_t *)&unk_1000486F0, (uint64_t (*)(uint64_t))&type metadata accessor for OAuthAuthorizationContext, (uint64_t)&protocol conformance descriptor for OAuthAuthorizationContext);
          v143 = v57;
          v142 = v58;
          dispatch thunk of JSONDecoder.decode<A>(_:from:)(v9);
          v144 = v3;
          v146 = v16;
          v104 = a1;
          swift_release(v60);
          v105 = v148;
          (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v148 + 56))(v52, 0, 1, v9);
          v106 = v145;
          (*(void (**)(char *, _QWORD *, uint64_t))(v105 + 32))(v145, v52, v9);
          v107 = *(void (**)(char *, char *, uint64_t))(v105 + 16);
          v147 = v9;
          v107(v149, v106, v9);
          v108 = (objc_class *)type metadata accessor for OAuthAuthorizationViewController(0);
          v109 = (char *)objc_allocWithZone(v108);
          v110 = &v109[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_dismissAction];
          *(_QWORD *)v110 = 0;
          *((_QWORD *)v110 + 1) = 0;
          v111 = OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_responseAction;
          *(_QWORD *)&v109[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_responseAction] = 0;
          v112 = v109;
          v113 = v22;
          v114 = objc_msgSend(v113, "actions");
          v115 = v114;
          if (v114)
          {
            v116 = sub_10000F82C(0, (unint64_t *)&qword_100049230, BSAction_ptr);
            v117 = sub_10000F44C();
            v118 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v115, v116, v117);

            v115 = (void *)sub_10000D7F4(v118);
            swift_bridgeObjectRelease(v118);
          }
          v119 = v141;
          v120 = *(void **)&v109[v111];
          *(_QWORD *)&v109[v111] = v115;

          v121 = v149;
          v122 = v147;
          v107(&v112[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_sheetContext], v149, v147);

          v154.receiver = v112;
          v154.super_class = v108;
          v123 = (char *)objc_msgSendSuper2(&v154, "initWithNibName:bundle:", 0, 0);

          v124 = *(void (**)(char *, uint64_t))(v148 + 8);
          v124(v121, v122);
          v125 = swift_allocObject(&unk_100041B60, 24, 7);
          swift_unknownObjectWeakInit(v125 + 16, v104);
          v126 = swift_retain(v125);
          v127 = v146;
          v128 = static MainActor.shared.getter(v126);
          v129 = dispatch thunk of Actor.unownedExecutor.getter(v127, &protocol witness table for MainActor);
          v131 = v130;
          if ((swift_task_isCurrentExecutor(v129) & 1) == 0)
            swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 13, v129, v131);
          v132 = (void (**)())&v123[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_dismissAction];
          v133 = *(_QWORD *)&v123[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_dismissAction];
          v134 = *(_QWORD *)&v123[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_dismissAction
                                + 8];
          *v132 = sub_10000F810;
          v132[1] = (void (*)())v125;
          sub_100007E04(v133, v134);
          swift_release(v125);
          swift_release(v128);
          v135 = v144;
          v136 = *(void **)(v144 + v119);
          v137 = v143;
          v138 = v142;
          if (v136)
          {
            objc_msgSend(v136, "setRootViewController:", v123);
            v139 = *(void **)(v135 + v119);
            if (v139)
              objc_msgSend(v139, "makeKeyAndVisible");
          }
          objc_msgSend(v104, "setDesiredHardwareButtonEvents:", 16);
          objc_msgSend(v104, "setAllowsMenuButtonDismissal:", 0);
          objc_msgSend(v104, "setAllowsAlertStacking:", 1);
          objc_msgSend(v104, "setDismissalAnimationStyle:", 2);
          objc_msgSend(v104, "setReachabilityDisabled:", 1);
          sub_10000A064(v137, v138);

          v124(v145, v147);
          swift_release(v152);
          return;
        }
      }
      else
      {
        sub_10000A0F0((uint64_t)&v159, &qword_100048430);
      }
    }
    v61 = v25;
    v62 = v22;
    v63 = v61;
    v64 = v62;
    v65 = Logger.logObject.getter();
    v66 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v65, v66))
    {
      v67 = swift_slowAlloc(22, -1);
      v153 = (_QWORD *)swift_slowAlloc(8, -1);
      v68 = swift_slowAlloc(32, -1);
      v150 = v68;
      v157 = (_QWORD *)v68;
      *(_DWORD *)v67 = 138412546;
      v69 = static MainActor.shared.getter(v68);
      v70 = v16;
      v71 = dispatch thunk of Actor.unownedExecutor.getter(v16, &protocol witness table for MainActor);
      v73 = v72;
      if ((swift_task_isCurrentExecutor(v71) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 187, v71, v73);
      swift_release(v69);
      *(_QWORD *)&v159 = v63;
      v74 = v63;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v159, (char *)&v159 + 8, v67 + 4, v67 + 12);
      *v153 = v63;

      *(_WORD *)(v67 + 12) = 2082;
      v76 = static MainActor.shared.getter(v75);
      v77 = dispatch thunk of Actor.unownedExecutor.getter(v70, &protocol witness table for MainActor);
      v79 = v78;
      if ((swift_task_isCurrentExecutor(v77) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 187, v77, v79);
      v80 = objc_msgSend(v64, "userInfo");
      if (v80)
      {
        v81 = v80;
        v82 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v80, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
        swift_release(v76);

      }
      else
      {
        v83 = static MainActor.shared.getter(0);
        v84 = dispatch thunk of Actor.unownedExecutor.getter(v70, &protocol witness table for MainActor);
        v86 = v85;
        if ((swift_task_isCurrentExecutor(v84) & 1) == 0)
          swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 187, v84, v86);
        v82 = sub_10002918C((uint64_t)&_swiftEmptyArrayStorage);
        swift_release(v76);
        swift_release(v83);
      }
      v87 = Dictionary.description.getter(v82, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
      v89 = v88;
      swift_bridgeObjectRelease(v82);
      *(_QWORD *)&v159 = sub_100030804(v87, v89, (uint64_t *)&v157);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v159, (char *)&v159 + 8, v67 + 14, v67 + 22);

      swift_bridgeObjectRelease(v89);
      _os_log_impl((void *)&_mh_execute_header, v65, v66, "[%@] Invalid context: %{public}s", (uint8_t *)v67, 0x16u);
      v90 = sub_1000051F0(&qword_1000483E8);
      v91 = v153;
      swift_arrayDestroy(v153, 1, v90);
      swift_slowDealloc(v91, -1, -1);
      v92 = v150;
      swift_arrayDestroy(v150, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v92, -1, -1);
      swift_slowDealloc(v67, -1, -1);

      a1 = v151;
    }
    else
    {

    }
    v93 = objc_msgSend(a1, "activationContext");
    v94 = v152;
    if (!v93)
      goto LABEL_43;
    v95 = v93;
    v96 = objc_msgSend(v93, "actions");

    v97 = sub_10000F82C(0, (unint64_t *)&qword_100049230, BSAction_ptr);
    v98 = sub_10000F44C();
    v99 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v96, v97, v98);

    v100 = (void *)sub_10000D7F4(v99);
    swift_bridgeObjectRelease(v99);
    if (v100)
    {
      if ((objc_msgSend(v100, "canSendResponse") & 1) != 0)
      {
        v101 = objc_msgSend(objc_allocWithZone((Class)BSMutableSettings), "init");
        sub_10000F82C(0, (unint64_t *)&unk_1000486A8, NSNumber_ptr);
        isa = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
        objc_msgSend(v101, "setObject:forSetting:", isa, 1);

        v103 = objc_msgSend((id)objc_opt_self(BSActionResponse), "responseWithInfo:", v101);
        objc_msgSend(v100, "sendResponse:", v103);
        swift_release(v94);

      }
      else
      {
        swift_release(v94);

      }
    }
    else
    {
LABEL_43:
      swift_release(v94);
    }

  }
  else
  {
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v37 = type metadata accessor for Logger(0);
    sub_100007D98(v37, (uint64_t)qword_10004AD30);
    v153 = a2;
    v38 = Logger.logObject.getter();
    v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc(12, -1);
      v41 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v40 = 138412290;
      v42 = static MainActor.shared.getter(v41);
      v43 = dispatch thunk of Actor.unownedExecutor.getter(v16, &protocol witness table for MainActor);
      v45 = v44;
      if ((swift_task_isCurrentExecutor(v43) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 176, v43, v45);
      swift_release(v42);
      v157 = v153;
      v46 = v153;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v157, v158, v40 + 4, v40 + 12);
      *v41 = v153;

      _os_log_impl((void *)&_mh_execute_header, v38, v39, "[%@] No configuration context provided.", v40, 0xCu);
      v47 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v41, 1, v47);
      swift_slowDealloc(v41, -1, -1);
      swift_slowDealloc(v40, -1, -1);
      swift_release(v17);

    }
    else
    {
      swift_release(v17);

    }
  }
}

uint64_t sub_10000D680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = type metadata accessor for MainActor(0, a2);
  v8 = static MainActor.shared.getter(v7);
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v11 = v10;
  if ((swift_task_isCurrentExecutor(v9) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, a4, v9, v11);
  sub_10000F1AC(a4, a5);
  return swift_release(v8);
}

uint64_t sub_10000D7F4(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v3 = a1;
    else
      v3 = a1 & 0xFFFFFFFFFFFFFF8;
    v4 = __CocoaSet.startIndex.getter(v3);
    v6 = v5;
    v7 = __CocoaSet.endIndex.getter(v3);
    v9 = static __CocoaSet.Index.== infix(_:_:)(v4, v6, v7, v8);
    swift_bridgeObjectRelease(v7);
    if ((v9 & 1) != 0)
      goto LABEL_6;
    goto LABEL_10;
  }
  result = sub_10000E2C4(a1);
  if ((v13 & 1) == 0)
  {
    v6 = v12;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v12)
    {
      v4 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
      {
LABEL_6:
        sub_10000F7E8(v4, v6, v2 != 0);
        return 0;
      }
LABEL_10:
      sub_10000E05C(v4, v6, v2 != 0, a1);
      v10 = v14;
      sub_10000F7E8(v4, v6, v2 != 0);
      return v10;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000D900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  v8 = type metadata accessor for Bag(0);
  v7[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for InstallSheetContext.Source(0);
  v7[7] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v7[8] = v10;
  v7[9] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext(0);
  v7[10] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v7[11] = v12;
  v13 = (*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7[12] = swift_task_alloc(v13);
  v7[13] = swift_task_alloc(v13);
  v14 = (*(_QWORD *)(*(_QWORD *)(sub_1000051F0(&qword_1000486D0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7[14] = swift_task_alloc(v14);
  v7[15] = swift_task_alloc(v14);
  v15 = type metadata accessor for InstallSheetContext(0);
  v7[16] = v15;
  v16 = *(_QWORD *)(v15 - 8);
  v7[17] = v16;
  v7[18] = swift_task_alloc((*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for LocalizedInstallSheetContent(0);
  v7[19] = v17;
  v18 = (*(_QWORD *)(*(_QWORD *)(v17 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7[20] = swift_task_alloc(v18);
  v7[21] = swift_task_alloc(v18);
  v20 = type metadata accessor for MainActor(0, v19);
  v7[22] = v20;
  v7[23] = static MainActor.shared.getter(v20);
  v21 = dispatch thunk of Actor.unownedExecutor.getter(v20, &protocol witness table for MainActor);
  v7[24] = v21;
  v7[25] = v22;
  return swift_task_switch(sub_10000DA84, v21, v22);
}

uint64_t sub_10000DA84()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[3];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[17] + 16))(v0[18], v0[2], v0[16]);
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_localizer);
  v3 = dword_10004933C;
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[26] = v4;
  *v4 = v0;
  v4[1] = sub_10000DB04;
  return sub_10002639C(v0[21], v0[18], v2);
}

uint64_t sub_10000DB04()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 208));
  return swift_task_switch(sub_10000DB50, *(_QWORD *)(v1 + 192), *(_QWORD *)(v1 + 200));
}

uint64_t sub_10000DB50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
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
  void *v22;
  id v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (**v32)();
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v47;
  uint64_t v48;

  v2 = *(_QWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = swift_release(*(_QWORD *)(v0 + 184));
  InstallSheetContext.source.getter(v4);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  v6 = *(_QWORD *)(v0 + 120);
  if (v5 == enum case for InstallSheetContext.Source.appStoreWithContext(_:))
  {
    v8 = *(_QWORD *)(v0 + 104);
    v7 = *(_QWORD *)(v0 + 112);
    v10 = *(_QWORD *)(v0 + 88);
    v9 = *(_QWORD *)(v0 + 96);
    v12 = *(_QWORD *)(v0 + 72);
    v11 = *(_QWORD *)(v0 + 80);
    v13 = *(_QWORD *)(v0 + 48);
    v14 = *(_QWORD *)(v0 + 24);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 64) + 96))(v12, *(_QWORD *)(v0 + 56));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v8, v12, v11);
    Bag.init(from:)(objc_retain(*(id *)(v14
                                      + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_bag)));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v8, v11);
    sub_10002958C(v13, v9, v7);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v11);
    v15 = type metadata accessor for InstallConfirmationAppStoreMetrics(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v7, 0, 1, v15);
    sub_10000F7A0(v7, v6);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
    v16 = type metadata accessor for InstallConfirmationAppStoreMetrics(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  v17 = *(_QWORD *)(v0 + 176);
  v18 = *(_QWORD *)(v0 + 160);
  v20 = *(_QWORD *)(v0 + 112);
  v19 = *(_QWORD *)(v0 + 120);
  v22 = *(void **)(v0 + 32);
  v21 = *(_QWORD *)(v0 + 40);
  sub_10000F698(*(_QWORD *)(v0 + 168), v18);
  sub_10000F6DC(v19, v20);
  v23 = objc_allocWithZone((Class)type metadata accessor for InstallConfirmationViewController(0));
  v24 = sub_10002D65C(v22, v18, v20);
  v25 = swift_allocObject(&unk_100041B60, 24, 7);
  swift_unknownObjectWeakInit(v25 + 16, v21);
  v26 = swift_retain(v25);
  v27 = static MainActor.shared.getter(v26);
  v28 = dispatch thunk of Actor.unownedExecutor.getter(v17, &protocol witness table for MainActor);
  v30 = v29;
  if ((swift_task_isCurrentExecutor(v28) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 26, v28, v30);
  v31 = *(_QWORD *)(v0 + 24);
  v32 = (void (**)())&v24[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_dismissAction];
  v33 = *(_QWORD *)&v24[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_dismissAction];
  v34 = *(_QWORD *)&v24[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_dismissAction
                      + 8];
  *v32 = sub_10000F748;
  v32[1] = (void (*)())v25;
  sub_100007E04(v33, v34);
  swift_release(v27);
  swift_release(v25);
  v35 = OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window;
  v36 = *(void **)(v31 + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window);
  if (v36)
  {
    objc_msgSend(v36, "setRootViewController:", v24);
    v37 = *(void **)(v31 + v35);
    if (v37)
      objc_msgSend(v37, "makeKeyAndVisible");
  }
  v39 = *(_QWORD *)(v0 + 160);
  v38 = *(_QWORD *)(v0 + 168);
  v40 = *(_QWORD *)(v0 + 144);
  v41 = *(_QWORD *)(v0 + 112);
  v42 = *(_QWORD *)(v0 + 120);
  v43 = *(_QWORD *)(v0 + 96);
  v44 = *(_QWORD *)(v0 + 104);
  v45 = *(void **)(v0 + 40);
  v47 = *(_QWORD *)(v0 + 72);
  v48 = *(_QWORD *)(v0 + 48);
  objc_msgSend(v45, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v45, "setAllowsMenuButtonDismissal:", 0);
  objc_msgSend(v45, "setAllowsAlertStacking:", 1);
  objc_msgSend(v45, "setDismissalAnimationStyle:", 2);
  objc_msgSend(v45, "setReachabilityDisabled:", 1);

  sub_10000A0F0(v42, &qword_1000486D0);
  sub_10000F764(v38);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v42);
  swift_task_dealloc(v41);
  swift_task_dealloc(v44);
  swift_task_dealloc(v43);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10000DEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *Strong;
  void *v10;
  _BYTE v11[24];

  v3 = a1 + 16;
  v4 = type metadata accessor for MainActor(0, a2);
  v5 = static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, a2, v6, v8);
  swift_beginAccess(v3, v11, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v10 = Strong;
    objc_msgSend(Strong, "invalidate");
    swift_release(v5);

  }
  else
  {
    swift_release(v5);
  }
}

id sub_10000DFC0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AppDistributionRemoteAlertSceneDelegate()
{
  return objc_opt_self(_TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate);
}

void sub_10000E05C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char v19;
  id v20;
  uint64_t v21;
  void *v22;

  v7 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (__CocoaSet.Index.age.getter(a1, a2) == *(_DWORD *)(a4 + 36))
      {
        v11 = __CocoaSet.Index.element.getter(v7, a2);
        v21 = v11;
        v12 = sub_10000F82C(0, (unint64_t *)&qword_100049230, BSAction_ptr);
        swift_unknownObjectRetain(v11);
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v12, 7);
        v4 = v22;
        swift_unknownObjectRelease(v11);
        v13 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a4 + 40));
        v14 = -1 << *(_BYTE *)(a4 + 32);
        v7 = v13 & ~v14;
        if (((*(_QWORD *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
        {
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
          v16 = static NSObject.== infix(_:_:)(v15);

          if ((v16 & 1) == 0)
          {
            v17 = ~v14;
            do
            {
              v7 = (v7 + 1) & v17;
              if (((*(_QWORD *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
                goto LABEL_24;
              v18 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
              v19 = static NSObject.== infix(_:_:)(v18);

            }
            while ((v19 & 1) == 0);
          }

LABEL_20:
          v20 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v8 = a4;
  else
    v8 = a4 & 0xFFFFFFFFFFFFFF8;
  v9 = __CocoaSet.element(at:)(a1, a2, v8);
  v21 = v9;
  v10 = sub_10000F82C(0, (unint64_t *)&qword_100049230, BSAction_ptr);
  swift_unknownObjectRetain(v9);
  swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
  swift_unknownObjectRelease(v9);
}

uint64_t sub_10000E2C4(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
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

id sub_10000E34C(void *a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  os_log_type_t v45;
  NSObject *log;
  uint64_t v47;
  id v48;
  uint64_t v49;

  v6 = type metadata accessor for MainActor(0, a2);
  v7 = static MainActor.shared.getter(v6);
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  v10 = v9;
  if ((swift_task_isCurrentExecutor(v8) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 18, v8, v10);
  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v11 = type metadata accessor for Logger(0);
  sub_100007D98(v11, (uint64_t)qword_10004AD30);
  v12 = a1;
  v13 = a2;
  v14 = a3;
  v15 = v12;
  v16 = v13;
  v17 = v14;
  v18 = Logger.logObject.getter();
  v19 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v45 = v19;
    log = v18;
    v47 = v7;
    v20 = swift_slowAlloc(32, -1);
    v21 = (_QWORD *)swift_slowAlloc(24, -1);
    *(_DWORD *)v20 = 138412802;
    v22 = static MainActor.shared.getter(v21);
    v23 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
    v25 = v24;
    if ((swift_task_isCurrentExecutor(v23) & 1) == 0)
      swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 19, v23, v25);
    swift_release(v22);
    v48 = v15;
    v26 = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49, v20 + 4, v20 + 12);
    *v21 = v15;

    *(_WORD *)(v20 + 12) = 2112;
    v28 = static MainActor.shared.getter(v27);
    v29 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
    v31 = v30;
    if ((swift_task_isCurrentExecutor(v29) & 1) == 0)
      swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 19, v29, v31);
    swift_release(v28);
    v48 = v16;
    v32 = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49, v20 + 14, v20 + 22);
    v21[1] = v16;

    *(_WORD *)(v20 + 22) = 2112;
    v34 = static MainActor.shared.getter(v33);
    v35 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
    v37 = v36;
    if ((swift_task_isCurrentExecutor(v35) & 1) == 0)
      swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 19, v35, v37);
    swift_release(v34);
    v48 = v17;
    v38 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49, v20 + 24, v20 + 32);
    v21[2] = v17;

    _os_log_impl((void *)&_mh_execute_header, log, v45, "Application: %@, configuration for connecting scene session: %@, options: %@", (uint8_t *)v20, 0x20u);
    v39 = sub_1000051F0(&qword_1000483E8);
    swift_arrayDestroy(v21, 3, v39);
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v20, -1, -1);

    v7 = v47;
  }
  else
  {

  }
  v40 = objc_msgSend(v16, "role");
  v41 = objc_msgSend(objc_allocWithZone((Class)UISceneConfiguration), "initWithName:sessionRole:", 0, v40);

  v42 = sub_10000F82C(0, (unint64_t *)&unk_100048700, SBSUIRemoteAlertScene_ptr);
  objc_msgSend(v41, "setSceneClass:", swift_getObjCClassFromMetadata(v42));
  v43 = type metadata accessor for AppDistributionRemoteAlertSceneDelegate();
  objc_msgSend(v41, "setDelegateClass:", swift_getObjCClassFromMetadata(v43));
  swift_release(v7);
  return v41;
}

void sub_10000E79C(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  Swift::String v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
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
  id v39;
  id v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  os_log_type_t v85;
  uint64_t v86;
  NSObject *log;
  uint64_t v88;
  _QWORD *v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;

  v3 = type metadata accessor for MainActor(0, a2);
  v4 = static MainActor.shared.getter(v3);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v7 = v6;
  if ((swift_task_isCurrentExecutor(v5) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 40, v5, v7);
  v8 = objc_allocWithZone((Class)type metadata accessor for LogKey());
  v9 = sub_100028844();
  v10 = objc_opt_self(SBSUIRemoteAlertScene);
  v11 = swift_dynamicCastObjCClass(a1, v10);
  if (v11)
  {
    v12 = (void *)v11;
    v13 = a1;
    v14 = objc_msgSend(v12, "configurationIdentifier");
    if (v14)
    {
      v15 = v14;
      v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
      v18 = v17;

      swift_bridgeObjectRetain(v18);
      v19._countAndFlagsBits = v16;
      v19._object = v18;
      v20 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100041458, v19);
      swift_bridgeObjectRelease(v18);
      if (v20 < 3)
      {
        v94 = v13;
        if (qword_100047FB0 != -1)
          swift_once(&qword_100047FB0, sub_10002865C);
        v21 = type metadata accessor for Logger(0);
        sub_100007D98(v21, (uint64_t)qword_10004AD30);
        v22 = v9;
        swift_bridgeObjectRetain(v18);
        v23 = v22;
        v24 = Logger.logObject.getter();
        v25 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v24, v25))
        {
          v85 = v25;
          log = v24;
          v91 = v4;
          v26 = swift_slowAlloc(22, -1);
          v89 = (_QWORD *)swift_slowAlloc(8, -1);
          v86 = swift_slowAlloc(32, -1);
          v96 = v86;
          *(_DWORD *)v26 = 138412546;
          v27 = static MainActor.shared.getter(v86);
          v28 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
          v30 = v29;
          if ((swift_task_isCurrentExecutor(v28) & 1) == 0)
            swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 52, v28, v30);
          swift_release(v27);
          v98 = (uint64_t)v23;
          v31 = v23;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &v99, v26 + 4, v26 + 12);
          *v89 = v23;

          *(_WORD *)(v26 + 12) = 2082;
          v33 = static MainActor.shared.getter(v32);
          v34 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
          v36 = v35;
          if ((swift_task_isCurrentExecutor(v34) & 1) == 0)
            swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 52, v34, v36);
          swift_bridgeObjectRetain(v18);
          swift_release(v33);
          v98 = sub_100030804(v16, (unint64_t)v18, &v96);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &v99, v26 + 14, v26 + 22);
          swift_bridgeObjectRelease_n(v18, 3);
          _os_log_impl((void *)&_mh_execute_header, log, v85, "[%@] Scene requested with identifier %{public}s", (uint8_t *)v26, 0x16u);
          v37 = sub_1000051F0(&qword_1000483E8);
          swift_arrayDestroy(v89, 1, v37);
          swift_slowDealloc(v89, -1, -1);
          swift_arrayDestroy(v86, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v86, -1, -1);
          swift_slowDealloc(v26, -1, -1);

          v4 = v91;
        }
        else
        {

          swift_bridgeObjectRelease_n(v18, 2);
        }
        if ((_BYTE)v20)
        {
          if (v20 == 1)
            sub_10000B8A8(v12, v23);
          else
            sub_10000C670(v12, v23);
        }
        else
        {
          sub_10000AB38(v12, v23);
        }
        swift_release(v4);

        return;
      }
      swift_bridgeObjectRelease(v18);
    }
    v93 = v4;
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v58 = type metadata accessor for Logger(0);
    sub_100007D98(v58, (uint64_t)qword_10004AD30);
    v59 = v13;
    v60 = v9;
    v61 = v59;
    v95 = v60;
    v62 = Logger.logObject.getter();
    v63 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = swift_slowAlloc(22, -1);
      v90 = (_QWORD *)swift_slowAlloc(8, -1);
      v88 = swift_slowAlloc(32, -1);
      v98 = v88;
      *(_DWORD *)v64 = 138412546;
      v65 = static MainActor.shared.getter(v88);
      v66 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
      v68 = v67;
      if ((swift_task_isCurrentExecutor(v66) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 48, v66, v68);
      swift_release(v65);
      v96 = (uint64_t)v95;
      v69 = v95;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97, v64 + 4, v64 + 12);
      *v90 = v95;

      *(_WORD *)(v64 + 12) = 2082;
      v71 = static MainActor.shared.getter(v70);
      v72 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
      v74 = v73;
      if ((swift_task_isCurrentExecutor(v72) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 48, v72, v74);
      v75 = objc_msgSend(v12, "configurationIdentifier");
      if (v75)
      {
        v76 = v75;
        v77 = static String._unconditionallyBridgeFromObjectiveC(_:)(v75);
        v79 = v78;

      }
      else
      {
        v77 = 0;
        v79 = 0;
      }
      v96 = v77;
      v97 = v79;
      v80 = sub_1000051F0((uint64_t *)&unk_100048690);
      v81 = String.init<A>(describing:)(&v96, v80);
      v83 = v82;
      swift_release(v71);
      v96 = sub_100030804(v81, v83, &v98);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97, v64 + 14, v64 + 22);

      swift_bridgeObjectRelease(v83);
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "[%@] Invalid configuration identifier %{public}s", (uint8_t *)v64, 0x16u);
      v84 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v90, 1, v84);
      swift_slowDealloc(v90, -1, -1);
      swift_arrayDestroy(v88, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v88, -1, -1);
      swift_slowDealloc(v64, -1, -1);
      swift_release(v93);

      return;
    }
    swift_release(v93);

LABEL_34:
    return;
  }
  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v38 = type metadata accessor for Logger(0);
  sub_100007D98(v38, (uint64_t)qword_10004AD30);
  v39 = a1;
  v40 = v9;
  v41 = v39;
  v95 = v40;
  v42 = Logger.logObject.getter();
  v43 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v42, v43))
  {
    swift_release(v4);

    goto LABEL_34;
  }
  v92 = v4;
  v44 = swift_slowAlloc(22, -1);
  v45 = (_QWORD *)swift_slowAlloc(16, -1);
  *(_DWORD *)v44 = 138412546;
  v46 = static MainActor.shared.getter(v45);
  v47 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v49 = v48;
  if ((swift_task_isCurrentExecutor(v47) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 43, v47, v49);
  swift_release(v46);
  v96 = (uint64_t)v95;
  v50 = v95;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97, v44 + 4, v44 + 12);
  *v45 = v95;

  *(_WORD *)(v44 + 12) = 2112;
  v52 = static MainActor.shared.getter(v51);
  v53 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v55 = v54;
  if ((swift_task_isCurrentExecutor(v53) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 43, v53, v55);
  swift_release(v52);
  v96 = (uint64_t)v41;
  v56 = v41;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97, v44 + 14, v44 + 22);
  v45[1] = v41;

  _os_log_impl((void *)&_mh_execute_header, v42, v43, "[%@] Expected scene to be SBSUIRemoteAlertScene but got %@", (uint8_t *)v44, 0x16u);
  v57 = sub_1000051F0(&qword_1000483E8);
  swift_arrayDestroy(v45, 2, v57);
  swift_slowDealloc(v45, -1, -1);
  swift_slowDealloc(v44, -1, -1);
  swift_release(v92);

}

void sub_10000F1AC(uint64_t a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  NSObject *oslog;

  v4 = type metadata accessor for MainActor(0, a2);
  v5 = static MainActor.shared.getter(v4);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor(v6) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, a1, v6, v8);
  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v9 = type metadata accessor for Logger(0);
  sub_100007D98(v9, (uint64_t)qword_10004AD30);
  oslog = Logger.logObject.getter();
  v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v10, a2, v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }
  swift_release(v5);

}

void sub_10000F2F0(uint64_t a1, uint64_t a2)
{
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
  id v13;

  v3 = v2;
  v4 = type metadata accessor for MainActor(0, a2);
  v5 = static MainActor.shared.getter(v4);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor(v6) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/AppDelegate.swift", 44, 1, 80, v6, v8);
  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v9 = type metadata accessor for Logger(0);
  sub_100007D98(v9, (uint64_t)qword_10004AD30);
  v10 = Logger.logObject.getter();
  v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Remote alert scene sceneDidDisconnect", v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

  v13 = *(id *)(v3 + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window) = 0;
  swift_release(v5);

}

unint64_t sub_10000F44C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100048410;
  if (!qword_100048410)
  {
    v1 = sub_10000F82C(255, (unint64_t *)&qword_100049230, BSAction_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100048410);
  }
  return result;
}

uint64_t sub_10000F4A4(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_10000F4D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v1 = type metadata accessor for InstallSheetContext(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, v8 + 8, v5);
}

uint64_t sub_10000F590(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v4 = *(_QWORD *)(type metadata accessor for InstallSheetContext(0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = *(_QWORD *)(v1 + 16);
  v9 = *(_QWORD *)(v1 + 24);
  v10 = v1 + v5;
  v11 = *(_QWORD *)(v1 + v6);
  v12 = *(_QWORD *)(v1 + v7);
  v13 = *(_QWORD *)(v1 + ((v7 + 15) & 0xFFFFFFFFFFFFF8));
  v14 = (_QWORD *)swift_task_alloc(dword_1000486C4);
  *(_QWORD *)(v2 + 16) = v14;
  *v14 = v2;
  v14[1] = sub_100007C7C;
  return sub_10000D900(a1, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_10000F65C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000F698(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LocalizedInstallSheetContent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F6DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000051F0(&qword_1000486D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F724()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000F748()
{
  uint64_t v0;

  sub_10000DEE8(v0, 124);
}

uint64_t sub_10000F764(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LocalizedInstallSheetContent(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000F7A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000051F0(&qword_1000486D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F7E8(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

void sub_10000F7F4()
{
  uint64_t v0;

  sub_10000DEE8(v0, 161);
}

void sub_10000F810()
{
  uint64_t v0;

  sub_10000DEE8(v0, 197);
}

uint64_t sub_10000F82C(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

void sub_10000F864(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSString v8;
  int v9;
  char **v10;
  uint64_t v11;
  objc_class *ObjCClassFromMetadata;
  NSString *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = type metadata accessor for MainActor(0, a2);
  v3 = static MainActor.shared.getter(v2);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  v6 = v5;
  if ((swift_task_isCurrentExecutor(v4) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LaunchAngel.swift", 44, 1, 24, v4, v6);
  v7 = (void *)objc_opt_self(BSServicesConfiguration);
  v8 = String._bridgeToObjectiveC()();
  swift_unknownObjectRelease(objc_msgSend(v7, "activateManualDomain:", v8));

  v9 = static CommandLine.argc.getter();
  v10 = (char **)static CommandLine.unsafeArgv.getter();
  v11 = type metadata accessor for AppDelegate();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v11);
  v13 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v13)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v15 = v14;
    v13 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v15);
  }
  UIApplicationMain(v9, v10, 0, v13);
  swift_release(v3);

}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t isCurrentExecutor;
  uint64_t v9;

  v3 = type metadata accessor for MainActor(0, argv);
  v4 = static MainActor.shared.getter(v3);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v7 = v6;
  isCurrentExecutor = swift_task_isCurrentExecutor(v5);
  if ((isCurrentExecutor & 1) == 0)
    isCurrentExecutor = swift_task_reportUnexpectedExecutor("", 0, 1, 0, v5, v7);
  sub_10000FA30(isCurrentExecutor, v9);
  swift_release(v4);
  return 0;
}

uint64_t sub_10000FA30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v20[32];

  v2 = type metadata accessor for MainActor(0, a2);
  v3 = static MainActor.shared.getter(v2);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  v6 = v5;
  if ((swift_task_isCurrentExecutor(v4) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LaunchAngel.swift", 44, 1, 15, v4, v6);
  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_100007D98(v7, (uint64_t)qword_10004AD30);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Angel startup", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  v12 = type metadata accessor for LaunchAngelXPCServer();
  swift_initStackObject(v12, v20);
  v13 = sub_10000A130();
  v14 = Logger.logObject.getter(objc_msgSend(*(id *)(v13 + 16), "activate"));
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Configured XPC listeners", v16, 2u);
    swift_slowDealloc(v16, -1, -1);
  }

  sub_10000F864(v17, v18);
  swift_release(v3);
  return swift_release(v13);
}

id sub_10000FC20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v7;
  uint64_t v8;
  void *v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  NSString v14;
  NSString v15;
  id v16;
  objc_super v18;

  v7 = &v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_delegate];
  *((_QWORD *)v7 + 1) = 0;
  swift_unknownObjectWeakInit(v7, 0);
  v8 = OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_isIPad;
  v9 = (void *)objc_opt_self(UIDevice);
  v10 = v3;
  v11 = objc_msgSend(v9, "currentDevice");
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v3[v8] = v12 == (id)1;
  v13 = OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_confirmButton;
  *(_QWORD *)&v10[v13] = objc_msgSend((id)objc_opt_self(OBBoldTrayButton), "boldButton");
  *((_QWORD *)v7 + 1) = a3;
  swift_unknownObjectWeakAssign(v7, a2);
  sub_10000F698(a1, (uint64_t)&v10[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_localizedContent]);

  v14 = String._bridgeToObjectiveC()();
  v15 = String._bridgeToObjectiveC()();
  v18.receiver = v10;
  v18.super_class = (Class)type metadata accessor for InstallSheetViewController(0);
  v16 = objc_msgSendSuper2(&v18, "initWithTitle:detailText:symbolName:contentLayout:", v14, v15, 0, 3);

  swift_unknownObjectRelease(a2);
  sub_10000F764(a1);
  return v16;
}

void sub_10000FDA0()
{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  _QWORD *v2;
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
  objc_class *v27;
  double v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  char *v51;
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
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  NSString v76;
  id v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  NSString v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  void (*v95)(char *, uint64_t, id);
  id v96;
  objc_class *v97;
  char *v98;
  unsigned __int8 *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  NSString v104;
  id v105;
  char *v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  double v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  uint64_t v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  _QWORD *v155;
  unsigned __int8 *v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  char *v161;
  char *v162;
  uint64_t v163;
  id v164;
  objc_super v165;
  objc_super v166;

  v1 = v0;
  v2 = (_QWORD *)type metadata accessor for InstallSheetContext(0);
  v163 = *(v2 - 1);
  v164 = v2;
  __chkstk_darwin(v2);
  v162 = (char *)&v149 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v155 = (_QWORD *)type metadata accessor for AttributedString.MarkdownParsingOptions.FailurePolicy(0);
  v153 = *(v155 - 1);
  __chkstk_darwin(v155);
  v154 = (char *)&v149 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for AttributedString.MarkdownParsingOptions.InterpretedSyntax(0);
  v151 = *(_QWORD *)(v5 - 8);
  v152 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v149 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AttributedString.MarkdownParsingOptions(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v149 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000051F0(&qword_100048980);
  __chkstk_darwin(v11);
  v13 = (char *)&v149 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v158 = type metadata accessor for LocalizedInstallSheetContent(0);
  v14 = __chkstk_darwin(v158);
  v159 = (uint64_t)&v149 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v14);
  v157 = (char *)&v149 - v17;
  v18 = __chkstk_darwin(v16);
  v161 = (char *)&v149 - v19;
  __chkstk_darwin(v18);
  v21 = (char *)&v149 - v20;
  v23 = type metadata accessor for MainActor(0, v22);
  v150 = static MainActor.shared.getter(v23);
  v24 = dispatch thunk of Actor.unownedExecutor.getter(v23, &protocol witness table for MainActor);
  v26 = v25;
  if ((swift_task_isCurrentExecutor(v24) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 26, v24, v26);
  v27 = (objc_class *)type metadata accessor for InstallSheetViewController(0);
  v166.receiver = v1;
  v166.super_class = v27;
  objc_msgSendSuper2(&v166, "viewDidLoad");
  objc_msgSend(v1, "setModalInPresentation:", 1);
  objc_msgSend(v1, "setDefinesPresentationContext:", 1);
  v160 = v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_isIPad];
  if (v160)
    v28 = 88.0;
  else
    v28 = 24.0;
  v29 = objc_msgSend(v1, "contentView");
  objc_msgSend(v29, "setDirectionalLayoutMargins:", 0.0, v28, 0.0, v28);

  v30 = objc_msgSend(v1, "headerView");
  v31 = objc_msgSend(v30, "bottomAnchor");

  v32 = objc_msgSend(v1, "contentView");
  v33 = objc_msgSend(v32, "topAnchor");

  v34 = objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33, -4.0);
  objc_msgSend(v34, "setActive:", 1);

  v35 = type metadata accessor for NonHighlightableTextView();
  v36 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v35)), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v36, "setEditable:", 0);
  v37 = v36;
  v38 = static MainActor.shared.getter(v37);
  v39 = dispatch thunk of Actor.unownedExecutor.getter(v23, &protocol witness table for MainActor);
  v41 = v40;
  if ((swift_task_isCurrentExecutor(v39) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 14, v39, v41);
  sub_1000145DC();
  v156 = &v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_localizedContent];
  sub_10000F698((uint64_t)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_localizedContent], (uint64_t)v21);
  swift_release(v38);
  v42 = *((_QWORD *)v21 + 2);
  v43 = *((_QWORD *)v21 + 3);
  swift_bridgeObjectRetain(v43);
  sub_10000F764((uint64_t)v21);
  v44 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v13, 1, 1, v44);
  (*(void (**)(char *, _QWORD, uint64_t))(v151 + 104))(v7, enum case for AttributedString.MarkdownParsingOptions.InterpretedSyntax.full(_:), v152);
  v45 = v154;
  (*(void (**)(char *, _QWORD, _QWORD *))(v153 + 104))(v154, enum case for AttributedString.MarkdownParsingOptions.FailurePolicy.throwError(_:), v155);
  AttributedString.MarkdownParsingOptions.init(allowsExtendedAttributes:interpretedSyntax:failurePolicy:languageCode:)(0, v7, v45, 0, 0);
  v46 = (void *)NSAttributedString.init(markdown:options:baseURL:)(v42, v43, v10, v13);
  objc_msgSend(v37, "setAttributedText:", v46);

  objc_msgSend(v37, "setTextAlignment:", 1);
  v47 = (void *)objc_opt_self(UIFont);
  v48 = v37;
  v49 = objc_msgSend(v47, "preferredFontForTextStyle:", UIFontTextStyleBody);
  objc_msgSend(v48, "setFont:", v49);

  objc_msgSend(v48, "setScrollEnabled:", 0);
  objc_msgSend(v48, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v50 = (void *)objc_opt_self(UIColor);
  v51 = (char *)v48;
  v52 = objc_msgSend(v50, "labelColor");
  objc_msgSend(v51, "setTextColor:", v52);

  objc_msgSend(v51, "setDelegate:", v1);
  v53 = objc_msgSend(v1, "contentView");
  objc_msgSend(v53, "addSubview:", v51);

  v54 = objc_msgSend(v1, "contentView");
  v55 = objc_msgSend(v54, "leadingAnchor");

  v56 = objc_msgSend(v51, "leadingAnchor");
  v57 = objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, -v28);

  objc_msgSend(v57, "setActive:", 1);
  v58 = objc_msgSend(v1, "contentView");
  v59 = objc_msgSend(v58, "trailingAnchor");

  v60 = objc_msgSend(v51, "trailingAnchor");
  v61 = objc_msgSend(v59, "constraintEqualToAnchor:constant:", v60, v28);

  objc_msgSend(v61, "setActive:", 1);
  v62 = objc_msgSend(v1, "contentView");
  v63 = objc_msgSend(v62, "topAnchor");

  v64 = objc_msgSend(v51, "topAnchor");
  v65 = objc_msgSend(v63, "constraintEqualToAnchor:", v64);

  objc_msgSend(v65, "setActive:", 1);
  v66 = *(void **)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_confirmButton];
  objc_msgSend(v66, "setEnabled:", 0);
  v67 = objc_msgSend(v50, "systemBlueColor");
  objc_msgSend(v66, "setTintColor:", v67);

  v69 = static MainActor.shared.getter(v68);
  v70 = dispatch thunk of Actor.unownedExecutor.getter(v23, &protocol witness table for MainActor);
  v72 = v71;
  if ((swift_task_isCurrentExecutor(v70) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 14, v70, v72);
  v73 = (uint64_t)v156;
  v74 = v161;
  sub_10000F698((uint64_t)v156, (uint64_t)v161);
  swift_release(v69);
  v75 = v74[5];
  swift_bridgeObjectRetain(v75);
  sub_10000F764((uint64_t)v74);
  v76 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v75);
  objc_msgSend(v66, "setTitle:forState:", v76, 0);

  objc_msgSend(v66, "addTarget:action:forControlEvents:", v1, "confirmPressed", 64);
  v77 = objc_msgSend(v1, "buttonTray");
  v155 = v66;
  objc_msgSend(v77, "addButton:", v66);

  v78 = (char *)objc_msgSend((id)objc_opt_self(OBLinkTrayButton), "linkButton");
  v79 = static MainActor.shared.getter(v78);
  v80 = dispatch thunk of Actor.unownedExecutor.getter(v23, &protocol witness table for MainActor);
  v82 = v81;
  if ((swift_task_isCurrentExecutor(v80) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 14, v80, v82);
  v161 = v51;
  v83 = v157;
  sub_10000F698(v73, (uint64_t)v157);
  swift_release(v79);
  v84 = v83[7];
  swift_bridgeObjectRetain(v84);
  sub_10000F764((uint64_t)v83);
  v85 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v84);
  objc_msgSend(v78, "setTitle:forState:", v85, 0);

  objc_msgSend(v78, "addTarget:action:forControlEvents:", v1, "cancelPressed", 64);
  v86 = objc_msgSend(v1, "buttonTray");
  v157 = v78;
  objc_msgSend(v86, "addButton:", v78);

  v88 = static MainActor.shared.getter(v87);
  v89 = dispatch thunk of Actor.unownedExecutor.getter(v23, &protocol witness table for MainActor);
  v91 = v90;
  if ((swift_task_isCurrentExecutor(v89) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 14, v89, v91);
  v92 = v159;
  sub_10000F698(v73, v159);
  swift_release(v88);
  v93 = v162;
  v94 = v163;
  v95 = *(void (**)(char *, uint64_t, id))(v163 + 16);
  v96 = v164;
  v95(v162, v92 + *(int *)(v158 + 60), v164);
  sub_10000F764(v92);
  v97 = (objc_class *)type metadata accessor for MiniProductPageView(0);
  v98 = (char *)objc_allocWithZone(v97);
  v95(&v98[OBJC_IVAR____TtC26AppDistributionLaunchAngel19MiniProductPageView_context], (uint64_t)v93, v96);
  v99 = v1;
  v100 = v98;
  InstallSheetContext.logKey.getter();
  v102 = v101;
  v103 = objc_allocWithZone((Class)AppStoreComponentsWrapper);
  v104 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v102);
  v105 = objc_msgSend(v103, "initWithLogKey:", v104);

  *(_QWORD *)&v100[OBJC_IVAR____TtC26AppDistributionLaunchAngel19MiniProductPageView_appStoreComponentsWrapper] = v105;
  v165.receiver = v100;
  v165.super_class = v97;
  v106 = (char *)objc_msgSendSuper2(&v165, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_10001326C((uint64_t)v99, v106);
  (*(void (**)(char *, id))(v94 + 8))(v93, v96);

  objc_msgSend(v106, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v107 = objc_msgSend(v99, "contentView");
  objc_msgSend(v107, "addSubview:", v106);

  v108 = v161;
  v109 = objc_msgSend(v161, "bottomAnchor");
  v110 = objc_msgSend(v106, "topAnchor");
  v111 = objc_msgSend(v109, "constraintEqualToAnchor:constant:", v110, -24.0);

  objc_msgSend(v111, "setActive:", 1);
  v112 = objc_msgSend(v99, "contentView");
  v113 = objc_msgSend(v112, "leadingAnchor");

  v114 = objc_msgSend(v106, "leadingAnchor");
  if (v160)
  {
    v115 = objc_msgSend(v113, "constraintGreaterThanOrEqualToAnchor:constant:", v114, -v28);

    LODWORD(v116) = 1140457472;
    v164 = v115;
    objc_msgSend(v115, "setPriority:", v116);
    objc_msgSend(v115, "setActive:", 1);
    v117 = objc_msgSend(v99, "contentView");
    v118 = objc_msgSend(v117, "centerXAnchor");

    v119 = objc_msgSend(v106, "centerXAnchor");
    v120 = objc_msgSend(v118, "constraintEqualToAnchor:", v119);

    objc_msgSend(v120, "setActive:", 1);
    v121 = objc_msgSend(v106, "widthAnchor");
    v122 = objc_msgSend(v121, "constraintLessThanOrEqualToConstant:", 360.0);

    objc_msgSend(v122, "setActive:", 1);
    v123 = objc_msgSend(v99, "buttonTray");
    v124 = objc_msgSend(v123, "widthAnchor");

    v125 = objc_msgSend(v124, "constraintLessThanOrEqualToConstant:", 360.0);
    objc_msgSend(v125, "setActive:", 1);

    v126 = v157;
    v127 = objc_msgSend(v157, "bottomAnchor");
    v128 = objc_msgSend(v99, "buttonTray");
    v129 = objc_msgSend(v128, "bottomAnchor");

    v130 = objc_msgSend(v127, "constraintEqualToAnchor:constant:", v129, -24.0);
    objc_msgSend(v130, "setActive:", 1);

    v131 = v150;
  }
  else
  {
    v132 = objc_msgSend(v113, "constraintEqualToAnchor:constant:", v114, -v28);

    objc_msgSend(v132, "setActive:", 1);
    v133 = objc_msgSend(v99, "contentView");
    v134 = objc_msgSend(v133, "trailingAnchor");

    v135 = objc_msgSend(v106, "trailingAnchor");
    v136 = objc_msgSend(v134, "constraintEqualToAnchor:constant:", v135, 24.0);

    objc_msgSend(v136, "setActive:", 1);
    v137 = objc_msgSend(v99, "buttonTray");
    v138 = objc_msgSend(v137, "leadingAnchor");

    v139 = v155;
    v140 = objc_msgSend(v155, "leadingAnchor");
    v141 = objc_msgSend(v138, "constraintEqualToAnchor:constant:", v140, -v28);

    objc_msgSend(v141, "setActive:", 1);
    v142 = objc_msgSend(v99, "buttonTray");
    v143 = objc_msgSend(v142, "trailingAnchor");

    v144 = objc_msgSend(v139, "trailingAnchor");
    v130 = objc_msgSend(v143, "constraintEqualToAnchor:constant:", v144, 24.0);

    objc_msgSend(v130, "setActive:", 1);
    v131 = v150;
    v126 = v157;
  }

  v145 = objc_msgSend(v99, "contentView");
  v146 = objc_msgSend(v145, "bottomAnchor");

  v147 = objc_msgSend(v106, "bottomAnchor");
  v148 = objc_msgSend(v146, "constraintEqualToAnchor:", v147);

  objc_msgSend(v148, "setActive:", 1);
  swift_release(v131);

}

uint64_t sub_100010FC4(char a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  objc_super v20;

  v2 = v1;
  v4 = sub_1000051F0(&qword_100048300);
  __chkstk_darwin(v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MainActor(0, v7);
  v9 = static MainActor.shared.getter(v8);
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  v12 = v11;
  if ((swift_task_isCurrentExecutor(v10) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 96, v10, v12);
  v13 = (objc_class *)type metadata accessor for InstallSheetViewController(0);
  v20.receiver = v2;
  v20.super_class = v13;
  objc_msgSendSuper2(&v20, "viewDidAppear:", a1 & 1);
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v6, 1, 1, v14);
  v15 = v2;
  v16 = static MainActor.shared.getter(v15);
  v17 = (_QWORD *)swift_allocObject(&unk_100041D40, 40, 7);
  v17[2] = v16;
  v17[3] = &protocol witness table for MainActor;
  v17[4] = v15;
  v18 = sub_100016434((uint64_t)v6, (uint64_t)&unk_100048978, (uint64_t)v17);
  swift_release(v9);
  return swift_release(v18);
}

uint64_t sub_100011138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[2] = a1;
  v4[3] = a4;
  v5 = type metadata accessor for MainActor(0, a2);
  v4[4] = v5;
  v4[5] = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v4[6] = v6;
  v4[7] = v7;
  return swift_task_switch(sub_1000111A8, v6, v7);
}

uint64_t sub_1000111A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t Strong;
  _QWORD *v8;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = static MainActor.shared.getter(a1);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  v6 = v5;
  if ((swift_task_isCurrentExecutor(v4) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 15, v4, v6);
  Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v1 + 24) + OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_delegate);
  *(_QWORD *)(v1 + 64) = Strong;
  swift_release(v3);
  if (Strong)
  {
    v8 = (_QWORD *)swift_task_alloc(dword_10004967C);
    *(_QWORD *)(v1 + 72) = v8;
    *v8 = v1;
    v8[1] = sub_1000112A4;
    return sub_10002EE50();
  }
  else
  {
    swift_release(*(_QWORD *)(v1 + 40));
    **(_BYTE **)(v1 + 16) = *(_QWORD *)(v1 + 64) == 0;
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000112A4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 64);
  swift_task_dealloc(*(_QWORD *)(*v0 + 72));
  swift_unknownObjectRelease(v2);
  return swift_task_switch(sub_100014654, *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_1000115A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v4 + 16) = a4;
  v5 = type metadata accessor for MainActor(0, a2);
  *(_QWORD *)(v4 + 24) = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001160C, v6, v7);
}

uint64_t sub_10001160C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 24));
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_confirmButton), "setEnabled:", 1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100011674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[2] = a1;
  v4[3] = a4;
  v5 = type metadata accessor for MainActor(0, a2);
  v4[4] = v5;
  v4[5] = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v4[6] = v6;
  v4[7] = v7;
  return swift_task_switch(sub_1000116E4, v6, v7);
}

uint64_t sub_1000116E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t Strong;
  _QWORD *v8;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = static MainActor.shared.getter(a1);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  v6 = v5;
  if ((swift_task_isCurrentExecutor(v4) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 15, v4, v6);
  Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v1 + 24) + OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_delegate);
  *(_QWORD *)(v1 + 64) = Strong;
  swift_release(v3);
  if (Strong)
  {
    v8 = (_QWORD *)swift_task_alloc(dword_100049674);
    *(_QWORD *)(v1 + 72) = v8;
    *v8 = v1;
    v8[1] = sub_1000112A4;
    return sub_10002EBE0();
  }
  else
  {
    swift_release(*(_QWORD *)(v1 + 40));
    **(_BYTE **)(v1 + 16) = *(_QWORD *)(v1 + 64) == 0;
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000117FC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *, uint64_t, _QWORD *))
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;

  v9 = sub_1000051F0(&qword_100048300);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  type metadata accessor for MainActor(0, v13);
  v14 = a1;
  v15 = static MainActor.shared.getter(v14);
  v16 = (_QWORD *)swift_allocObject(a3, 40, 7);
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v14;
  v17 = a5(v11, a4, v16);

  return swift_release(v17);
}

uint64_t sub_100011900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  v6 = type metadata accessor for MainActor(0, a2);
  v5[5] = v6;
  v5[6] = static MainActor.shared.getter(v6);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  v5[7] = v7;
  v5[8] = v8;
  return swift_task_switch(sub_100011974, v7, v8);
}

uint64_t sub_100011974(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t Strong;
  _QWORD *v8;

  v2 = *(_QWORD *)(v1 + 40);
  v3 = static MainActor.shared.getter(a1);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  v6 = v5;
  if ((swift_task_isCurrentExecutor(v4) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 15, v4, v6);
  Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v1 + 24) + OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_delegate);
  *(_QWORD *)(v1 + 72) = Strong;
  swift_release(v3);
  if (Strong)
  {
    v8 = (_QWORD *)swift_task_alloc(dword_10004966C);
    *(_QWORD *)(v1 + 80) = v8;
    *v8 = v1;
    v8[1] = sub_100011A78;
    return sub_10002E8A8(*(_QWORD *)(v1 + 32));
  }
  else
  {
    swift_release(*(_QWORD *)(v1 + 48));
    **(_BYTE **)(v1 + 16) = *(_QWORD *)(v1 + 72) == 0;
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100011A78()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 72);
  swift_task_dealloc(*(_QWORD *)(*v0 + 80));
  swift_unknownObjectRelease(v2);
  return swift_task_switch(sub_100011ACC, *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64));
}

uint64_t sub_100011ACC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 48));
  **(_BYTE **)(v0 + 16) = *(_QWORD *)(v0 + 72) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_100011BFC()
{
  uint64_t v0;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  _QWORD *v49;
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
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSString v65;
  NSString v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  NSString v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  NSString v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  char *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void **aBlock;
  uint64_t v105;
  void (*v106)(uint64_t, void *);
  void *v107;
  uint64_t (*v108)(uint64_t);
  uint64_t v109;

  v0 = sub_1000051F0(&qword_100048300);
  __chkstk_darwin(v0);
  v99 = (char *)&v94 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InstallSheetContext.InstallType(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v94 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v94 - v7;
  v100 = type metadata accessor for LocalizedInstallSheetContent(0);
  v9 = __chkstk_darwin(v100);
  v97 = (uint64_t)&v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v96 = (uint64_t)&v94 - v12;
  v13 = __chkstk_darwin(v11);
  v95 = (uint64_t)&v94 - v14;
  v15 = __chkstk_darwin(v13);
  v94 = (uint64_t)&v94 - v16;
  __chkstk_darwin(v15);
  v18 = (char *)&v94 - v17;
  v19 = type metadata accessor for FeatureFlag(0);
  v20 = *(_QWORD *)(v19 - 8);
  __chkstk_darwin(v19);
  v22 = (char *)&v94 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for MainActor(0, v23);
  v102 = static MainActor.shared.getter(v24);
  v103 = v24;
  v25 = dispatch thunk of Actor.unownedExecutor.getter(v24, &protocol witness table for MainActor);
  v27 = v26;
  if ((swift_task_isCurrentExecutor(v25) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 151, v25, v27);
  (*(void (**)(char *, _QWORD, uint64_t))(v20 + 104))(v22, enum case for FeatureFlag.webDistribution(_:), v19);
  v98 = isFeatureEnabled(_:)(v22);
  v28 = (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  v29 = v103;
  v30 = static MainActor.shared.getter(v28);
  v31 = dispatch thunk of Actor.unownedExecutor.getter(v29, &protocol witness table for MainActor);
  v33 = v32;
  if ((swift_task_isCurrentExecutor(v31) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 14, v31, v33);
  v34 = v101;
  v35 = (uint64_t)v101 + OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_localizedContent;
  sub_10000F698((uint64_t)v101 + OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_localizedContent, (uint64_t)v18);
  v36 = swift_release(v30);
  InstallSheetContext.type.getter(v36);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, enum case for InstallSheetContext.InstallType.marketplace(_:), v2);
  v37 = static InstallSheetContext.InstallType.== infix(_:_:)(v8, v6);
  v38 = *(void (**)(char *, uint64_t))(v3 + 8);
  v38(v6, v2);
  v38(v8, v2);
  v39 = sub_10000F764((uint64_t)v18);
  if ((v37 & 1) == 0)
    goto LABEL_9;
  v40 = static MainActor.shared.getter(v39);
  v41 = dispatch thunk of Actor.unownedExecutor.getter(v29, &protocol witness table for MainActor);
  v43 = v42;
  if ((swift_task_isCurrentExecutor(v41) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 153, v41, v43);
  v44 = swift_release(v40);
  if ((v98 & 1) == 0)
  {
    v51 = static MainActor.shared.getter(v44);
    v52 = dispatch thunk of Actor.unownedExecutor.getter(v29, &protocol witness table for MainActor);
    v54 = v53;
    if ((swift_task_isCurrentExecutor(v52) & 1) == 0)
      swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 14, v52, v54);
    v55 = v94;
    sub_10000F698(v35, v94);
    swift_release(v51);
    v56 = *(_QWORD *)(v55 + 72);
    swift_bridgeObjectRetain(v56);
    v57 = sub_10000F764(v55);
    v58 = static MainActor.shared.getter(v57);
    v59 = dispatch thunk of Actor.unownedExecutor.getter(v29, &protocol witness table for MainActor);
    v61 = v60;
    if ((swift_task_isCurrentExecutor(v59) & 1) == 0)
      swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 14, v59, v61);
    v62 = v35;
    v63 = v95;
    sub_10000F698(v35, v95);
    swift_release(v58);
    v64 = *(_QWORD *)(v63 + 88);
    swift_bridgeObjectRetain(v64);
    sub_10000F764(v63);
    v65 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v56);
    v66 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v64);
    v67 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v65, v66, 1);

    v69 = static MainActor.shared.getter(v68);
    v70 = dispatch thunk of Actor.unownedExecutor.getter(v29, &protocol witness table for MainActor);
    v72 = v71;
    if ((swift_task_isCurrentExecutor(v70) & 1) == 0)
      swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 14, v70, v72);
    v73 = v96;
    sub_10000F698(v62, v96);
    swift_release(v69);
    v74 = *(_QWORD *)(v73 + 56);
    swift_bridgeObjectRetain(v74);
    sub_10000F764(v73);
    v75 = swift_allocObject(&unk_100041BB0, 24, 7);
    *(_QWORD *)(v75 + 16) = v34;
    v76 = v34;
    v77 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v74);
    v108 = sub_100014190;
    v109 = v75;
    aBlock = _NSConcreteStackBlock;
    v105 = 1107296256;
    v106 = sub_1000125C0;
    v107 = &unk_100041BC8;
    v78 = _Block_copy(&aBlock);
    swift_release(v109);
    v79 = (void *)objc_opt_self(UIAlertAction);
    v80 = objc_msgSend(v79, "actionWithTitle:style:handler:", v77, 1, v78);
    _Block_release(v78);

    objc_msgSend(v67, "addAction:", v80);
    v81 = v103;
    v83 = static MainActor.shared.getter(v82);
    v84 = dispatch thunk of Actor.unownedExecutor.getter(v81, &protocol witness table for MainActor);
    v86 = v85;
    if ((swift_task_isCurrentExecutor(v84) & 1) == 0)
      swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 14, v84, v86);
    v87 = v97;
    sub_10000F698(v62, v97);
    swift_release(v83);
    v88 = *(_QWORD *)(v87 + 104);
    swift_bridgeObjectRetain(v88);
    sub_10000F764(v87);
    v89 = swift_allocObject(&unk_100041C00, 24, 7);
    *(_QWORD *)(v89 + 16) = v76;
    v90 = v76;
    v91 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v88);
    v108 = sub_1000141D4;
    v109 = v89;
    aBlock = _NSConcreteStackBlock;
    v105 = 1107296256;
    v106 = sub_1000125C0;
    v107 = &unk_100041C18;
    v92 = _Block_copy(&aBlock);
    swift_release(v109);
    v93 = objc_msgSend(v79, "actionWithTitle:style:handler:", v91, 0, v92);
    _Block_release(v92);

    objc_msgSend(v67, "addAction:", v93);
    objc_msgSend(v67, "setPreferredAction:", v93);
    objc_msgSend(v90, "presentViewController:animated:completion:", v67, 1, 0);
    swift_release(v102);

  }
  else
  {
LABEL_9:
    v45 = type metadata accessor for TaskPriority(0);
    v46 = (uint64_t)v99;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v99, 1, 1, v45);
    v47 = v34;
    v48 = static MainActor.shared.getter(v47);
    v49 = (_QWORD *)swift_allocObject(&unk_100041B88, 40, 7);
    v49[2] = v48;
    v49[3] = &protocol witness table for MainActor;
    v49[4] = v47;
    v50 = sub_100016434(v46, (uint64_t)&unk_100048908, (uint64_t)v49);
    swift_release(v102);
    swift_release(v50);
  }
}

uint64_t sub_100012450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[2] = a1;
  v4[3] = a4;
  v5 = type metadata accessor for MainActor(0, a2);
  v4[4] = v5;
  v4[5] = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v4[6] = v6;
  v4[7] = v7;
  return swift_task_switch(sub_1000124C0, v6, v7);
}

uint64_t sub_1000124C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t Strong;
  _QWORD *v8;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = static MainActor.shared.getter(a1);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  v6 = v5;
  if ((swift_task_isCurrentExecutor(v4) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 15, v4, v6);
  Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v1 + 24) + OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_delegate);
  *(_QWORD *)(v1 + 64) = Strong;
  swift_release(v3);
  if (Strong)
  {
    v8 = (_QWORD *)swift_task_alloc(dword_100049664);
    *(_QWORD *)(v1 + 72) = v8;
    *v8 = v1;
    v8[1] = sub_1000112A4;
    return sub_10002DD74(0);
  }
  else
  {
    swift_release(*(_QWORD *)(v1 + 40));
    **(_BYTE **)(v1 + 16) = *(_QWORD *)(v1 + 64) == 0;
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_1000125C0(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

uint64_t sub_100012610(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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
  id v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v24;

  v9 = sub_1000051F0(&qword_100048300);
  __chkstk_darwin(v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for MainActor(0, v12);
  v14 = static MainActor.shared.getter(v13);
  v15 = dispatch thunk of Actor.unownedExecutor.getter(v13, &protocol witness table for MainActor);
  v17 = v16;
  if ((swift_task_isCurrentExecutor(v15) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, a3, v15, v17);
  v18 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v11, 1, 1, v18);
  v19 = a2;
  v20 = static MainActor.shared.getter(v19);
  v21 = (_QWORD *)swift_allocObject(a4, 40, 7);
  v21[2] = v20;
  v21[3] = &protocol witness table for MainActor;
  v21[4] = v19;
  v22 = sub_100016434((uint64_t)v11, a5, (uint64_t)v21);
  swift_release(v14);
  return swift_release(v22);
}

uint64_t sub_100012768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[2] = a1;
  v4[3] = a4;
  v5 = type metadata accessor for MainActor(0, a2);
  v4[4] = v5;
  v4[5] = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v4[6] = v6;
  v4[7] = v7;
  return swift_task_switch(sub_1000127D8, v6, v7);
}

uint64_t sub_1000127D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t Strong;
  _QWORD *v8;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = static MainActor.shared.getter(a1);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  v6 = v5;
  if ((swift_task_isCurrentExecutor(v4) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 15, v4, v6);
  Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v1 + 24) + OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_delegate);
  *(_QWORD *)(v1 + 64) = Strong;
  swift_release(v3);
  if (Strong)
  {
    v8 = (_QWORD *)swift_task_alloc(dword_100049664);
    *(_QWORD *)(v1 + 72) = v8;
    *v8 = v1;
    v8[1] = sub_1000112A4;
    return sub_10002DD74(1);
  }
  else
  {
    swift_release(*(_QWORD *)(v1 + 40));
    **(_BYTE **)(v1 + 16) = *(_QWORD *)(v1 + 64) == 0;
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_1000128E8(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v7 = type metadata accessor for MainActor(0, a2);
  v8 = static MainActor.shared.getter();
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v11 = v10;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, a3, v9, v11);
  v12 = a1;
  a4();
  swift_release(v8);

}

uint64_t sub_10001299C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[2] = a1;
  v4[3] = a4;
  v5 = type metadata accessor for MainActor(0, a2);
  v4[4] = v5;
  v4[5] = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v4[6] = v6;
  v4[7] = v7;
  return swift_task_switch(sub_100012A0C, v6, v7);
}

uint64_t sub_100012A0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t Strong;
  _QWORD *v8;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = static MainActor.shared.getter(a1);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  v6 = v5;
  if ((swift_task_isCurrentExecutor(v4) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 15, v4, v6);
  Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v1 + 24) + OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_delegate);
  *(_QWORD *)(v1 + 64) = Strong;
  swift_release(v3);
  if (Strong)
  {
    v8 = (_QWORD *)swift_task_alloc(dword_100049664);
    *(_QWORD *)(v1 + 72) = v8;
    *v8 = v1;
    v8[1] = sub_100012B0C;
    return sub_10002DD74(0);
  }
  else
  {
    swift_release(*(_QWORD *)(v1 + 40));
    **(_BYTE **)(v1 + 16) = *(_QWORD *)(v1 + 64) == 0;
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100012B0C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 64);
  swift_task_dealloc(*(_QWORD *)(*v0 + 72));
  swift_unknownObjectRelease(v2);
  return swift_task_switch(sub_100012B60, *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_100012B60()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 40));
  **(_BYTE **)(v0 + 16) = *(_QWORD *)(v0 + 64) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_100012E70()
{
  return sub_10001321C(0, (uint64_t (*)(void))type metadata accessor for InstallSheetViewController);
}

uint64_t sub_100012EC8()
{
  return type metadata accessor for InstallSheetViewController(0);
}

uint64_t type metadata accessor for InstallSheetViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_1000488C8;
  if (!qword_1000488C8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for InstallSheetViewController);
  return result;
}

uint64_t sub_100012F0C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[4];

  result = type metadata accessor for LocalizedInstallSheetContent(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = &unk_1000338A0;
    v4[2] = &unk_1000338B8;
    v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
    result = swift_updateClassMetadata2(a1, 256, 4, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

id sub_100013210(uint64_t a1)
{
  return sub_10001321C(a1, type metadata accessor for NonHighlightableTextView);
}

id sub_10001321C(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for NonHighlightableTextView()
{
  return objc_opt_self(_TtC26AppDistributionLaunchAngel24NonHighlightableTextView);
}

void sub_10001326C(uint64_t a1, char *a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t isCurrentExecutor;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSString v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSString v29;
  NSString v30;
  uint64_t v31;
  char v32;
  id v33;
  id v34;
  void *v35;
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
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  void **aBlock;
  uint64_t v65;
  id (*v66)(uint64_t, void *);
  void *v67;
  id (*v68)(void *);
  uint64_t v69;

  v4 = type metadata accessor for InstallSheetContext.Source(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v60 - v9;
  v12 = type metadata accessor for MainActor(0, v11);
  v13 = static MainActor.shared.getter(v12);
  v14 = dispatch thunk of Actor.unownedExecutor.getter(v12, &protocol witness table for MainActor);
  v16 = v15;
  isCurrentExecutor = swift_task_isCurrentExecutor(v14);
  if ((isCurrentExecutor & 1) == 0)
    isCurrentExecutor = swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/MiniProductPageView.swift", 52, 1, 35, v14, v16);
  InstallSheetContext.source.getter(isCurrentExecutor);
  v18 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v10, v4);
  v61 = a1;
  v62 = v13;
  if (v18 == enum case for InstallSheetContext.Source.distributor(_:))
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v10, v4);
    v20 = *((_QWORD *)v10 + 3);
    v19 = swift_bridgeObjectRelease(*((_QWORD *)v10 + 1));
  }
  else
  {
    v19 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    v20 = 0;
  }
  v63 = a2;
  v21 = *(void **)&a2[OBJC_IVAR____TtC26AppDistributionLaunchAngel19MiniProductPageView_appStoreComponentsWrapper];
  InstallSheetContext.itemID.getter(v19);
  v23 = v22;
  v24 = String._bridgeToObjectiveC()();
  v25 = swift_bridgeObjectRelease(v23);
  v26 = InstallSheetContext.versionID.getter(v25);
  if (!v27)
  {
    v29 = 0;
    if (v20)
      goto LABEL_8;
LABEL_10:
    v30 = 0;
    goto LABEL_11;
  }
  v28 = v27;
  v29 = String._bridgeToObjectiveC()();
  v26 = swift_bridgeObjectRelease(v28);
  if (!v20)
    goto LABEL_10;
LABEL_8:
  v30 = String._bridgeToObjectiveC()();
  v26 = swift_bridgeObjectRelease(v20);
LABEL_11:
  v31 = InstallSheetContext.source.getter(v26);
  v32 = InstallSheetContext.Source.isAppStore.getter(v31);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v33 = objc_msgSend(v21, "lockupWithItemID:versionID:distributorID:isForAppStore:delegate:", v24, v29, v30, v32 & 1, v61);

  v34 = objc_allocWithZone((Class)UIColor);
  v68 = sub_1000313E8;
  v69 = 0;
  aBlock = _NSConcreteStackBlock;
  v65 = 1107296256;
  v66 = sub_10001FE98;
  v67 = &unk_100041D58;
  v35 = _Block_copy(&aBlock);
  v36 = objc_msgSend(v34, "initWithDynamicProvider:", v35);
  _Block_release(v35);
  swift_release(v69);
  objc_msgSend(v33, "setBackgroundColor:", v36);

  v37 = v63;
  objc_msgSend(v63, "addSubview:", v33);
  objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v38 = objc_msgSend(v37, "leadingAnchor");
  v39 = objc_msgSend(v33, "leadingAnchor");
  v40 = objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, -16.0);

  objc_msgSend(v40, "setActive:", 1);
  v41 = objc_msgSend(v37, "trailingAnchor");
  v42 = objc_msgSend(v33, "trailingAnchor");
  v43 = objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, 16.0);

  objc_msgSend(v43, "setActive:", 1);
  v44 = objc_msgSend(v37, "topAnchor");
  v45 = objc_msgSend(v33, "topAnchor");
  v46 = objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, -16.0);

  objc_msgSend(v46, "setActive:", 1);
  v47 = objc_msgSend(v37, "bottomAnchor");
  v48 = objc_msgSend(v33, "bottomAnchor");
  v49 = objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, 16.0);

  objc_msgSend(v49, "setActive:", 1);
  v50 = objc_msgSend(v37, "layer");
  objc_msgSend(v50, "setCornerRadius:", 20.0);

  v51 = objc_msgSend(v37, "layer");
  v52 = objc_allocWithZone((Class)UIColor);
  v68 = sub_10003140C;
  v69 = 0;
  aBlock = _NSConcreteStackBlock;
  v65 = 1107296256;
  v66 = sub_10001FE98;
  v67 = &unk_100041D80;
  v53 = _Block_copy(&aBlock);
  v54 = objc_msgSend(v52, "initWithDynamicProvider:", v53);
  _Block_release(v53);
  swift_release(v69);
  v55 = objc_msgSend(v54, "CGColor");

  objc_msgSend(v51, "setBorderColor:", v55);
  v56 = objc_msgSend(v37, "layer");
  objc_msgSend(v56, "setBorderWidth:", 1.0);

  v57 = objc_allocWithZone((Class)UIColor);
  v68 = sub_1000313E8;
  v69 = 0;
  aBlock = _NSConcreteStackBlock;
  v65 = 1107296256;
  v66 = sub_10001FE98;
  v67 = &unk_100041DA8;
  v58 = _Block_copy(&aBlock);
  v59 = objc_msgSend(v57, "initWithDynamicProvider:", v58);
  _Block_release(v58);
  swift_release(v69);
  objc_msgSend(v37, "setBackgroundColor:", v59);
  swift_release(v62);

}

uint64_t sub_1000138C8(uint64_t a1, uint64_t a2)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t isCurrentExecutor;
  uint64_t v22;
  id v23;
  NSObject *v24;
  int v25;
  _BOOL4 v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _DWORD *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(char *, char *, uint64_t);
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  id v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v76 = a2;
  v2 = sub_1000051F0(&qword_100048300);
  __chkstk_darwin(v2);
  v72 = (char *)&v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = type metadata accessor for InstallSheetContext(0);
  v66 = *(_QWORD *)(v68 - 8);
  __chkstk_darwin(v68);
  v67 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedInstallSheetContent(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = type metadata accessor for URL(0);
  v75 = *(_QWORD *)(v73 - 8);
  v8 = __chkstk_darwin(v73);
  v70 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = v9;
  __chkstk_darwin(v8);
  v74 = (char *)&v61 - v10;
  v11 = type metadata accessor for UITextItem.Content(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for MainActor(0, v15);
  v17 = static MainActor.shared.getter(v16);
  v18 = dispatch thunk of Actor.unownedExecutor.getter(v16, &protocol witness table for MainActor);
  v20 = v19;
  isCurrentExecutor = swift_task_isCurrentExecutor(v18);
  if ((isCurrentExecutor & 1) == 0)
    isCurrentExecutor = swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 134, v18, v20);
  UITextItem.content.getter(isCurrentExecutor);
  if ((*(unsigned int (**)(char *, uint64_t))(v12 + 88))(v14, v11) == enum case for UITextItem.Content.link(_:))
  {
    (*(void (**)(char *, uint64_t))(v12 + 96))(v14, v11);
    v64 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
    v64(v74, v14, v73);
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v22 = type metadata accessor for Logger(0);
    sub_100007D98(v22, (uint64_t)qword_10004AD30);
    v23 = v69;
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.default.getter();
    v26 = os_log_type_enabled(v24, (os_log_type_t)v25);
    v65 = v17;
    if (v26)
    {
      LODWORD(v69) = v25;
      v27 = (uint8_t *)swift_slowAlloc(12, -1);
      v28 = swift_slowAlloc(32, -1);
      v63 = v28;
      v78 = v28;
      *(_DWORD *)v27 = 136446210;
      v62 = static MainActor.shared.getter(v28);
      v29 = dispatch thunk of Actor.unownedExecutor.getter(v16, &protocol witness table for MainActor);
      v31 = v30;
      v32 = swift_task_isCurrentExecutor(v29);
      if ((v32 & 1) == 0)
        v32 = swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 137, v29, v31);
      v33 = static MainActor.shared.getter(v32);
      v34 = dispatch thunk of Actor.unownedExecutor.getter(v16, &protocol witness table for MainActor);
      v36 = v35;
      if ((swift_task_isCurrentExecutor(v34) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 14, v34, v36);
      v37 = v27 + 4;
      sub_10000F698((uint64_t)v23 + OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_localizedContent, (uint64_t)v7);
      swift_release(v33);
      v38 = &v7[*(int *)(v5 + 60)];
      v39 = v66;
      v40 = v67;
      v41 = v27;
      v42 = v68;
      (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v67, v38, v68);
      v43 = sub_10000F764((uint64_t)v7);
      v44 = InstallSheetContext.logKey.getter(v43);
      v46 = v45;
      (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v42);
      swift_release(v62);
      v77 = sub_100030804(v44, v46, &v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, &v78, v37, v41 + 12);

      swift_bridgeObjectRelease(v46);
      _os_log_impl((void *)&_mh_execute_header, v24, (os_log_type_t)v69, "[%{public}s] User tapped learn more link", v41, 0xCu);
      v47 = v63;
      swift_arrayDestroy(v63, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1, -1);
      swift_slowDealloc(v41, -1, -1);

    }
    else
    {

    }
    v48 = type metadata accessor for TaskPriority(0);
    v49 = (uint64_t)v72;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v72, 1, 1, v48);
    v50 = v74;
    v51 = v75;
    v52 = v70;
    v53 = v73;
    (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v70, v74, v73);
    v54 = v23;
    v55 = static MainActor.shared.getter(v54);
    v56 = *(unsigned __int8 *)(v51 + 80);
    v57 = (v56 + 40) & ~v56;
    v58 = (char *)swift_allocObject(&unk_100041CC8, v57 + v71, v56 | 7);
    *((_QWORD *)v58 + 2) = v55;
    *((_QWORD *)v58 + 3) = &protocol witness table for MainActor;
    *((_QWORD *)v58 + 4) = v54;
    v64(&v58[v57], v52, v53);
    v59 = sub_100016434(v49, (uint64_t)&unk_100048948, (uint64_t)v58);
    swift_release(v59);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v53);
    v17 = v65;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  swift_release(v17);
  return v76;
}

id sub_100013E74(double a1, double a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id result;
  void *v21;
  id v22;
  _BOOL8 v23;
  _OWORD v24[2];

  v5 = v4;
  v8 = type metadata accessor for MainActor(0, a4);
  v9 = static MainActor.shared.getter(v8);
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  v12 = v11;
  if ((swift_task_isCurrentExecutor(v10) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 186, v10, v12);
  v13 = objc_msgSend(v5, "closestPositionToPoint:", a1, a2);
  if (!v13)
  {
    swift_release(v9);
    return 0;
  }
  v14 = v13;
  v15 = objc_msgSend(v5, "tokenizer");
  v16 = objc_msgSend(v15, "rangeEnclosingPosition:withGranularity:inDirection:", v14, 0, static UITextDirection.layout(_:)(3));
  swift_unknownObjectRelease(v15);
  if (!v16)
  {
    swift_release(v9);

    return 0;
  }
  v17 = objc_msgSend(v5, "beginningOfDocument");
  v18 = objc_msgSend(v16, "start");
  v19 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v17, v18);

  result = objc_msgSend(v5, "attributedText");
  if (result)
  {
    v21 = result;
    v22 = objc_msgSend(result, "attribute:atIndex:effectiveRange:", NSLinkAttributeName, v19, 0);

    v23 = v22 != 0;
    if (v22)
    {
      _bridgeAnyObjectToAny(_:)(v24, v22);

      swift_unknownObjectRelease(v22);
    }
    else
    {

      memset(v24, 0, sizeof(v24));
    }
    sub_1000140BC((uint64_t)v24);
    swift_release(v9);
    return (id)v23;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000140BC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000051F0(&qword_100048430);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100014100(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_100048904);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10001463C;
  return sub_100012768(a1, v4, v5, v6);
}

uint64_t sub_10001416C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100014190(uint64_t a1)
{
  uint64_t v1;

  return sub_100012610(a1, *(void **)(v1 + 16), 155, (uint64_t)&unk_100041C78, (uint64_t)&unk_100048928);
}

uint64_t sub_1000141BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000141CC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000141D4(uint64_t a1)
{
  uint64_t v1;

  return sub_100012610(a1, *(void **)(v1 + 16), 160, (uint64_t)&unk_100041C50, (uint64_t)&unk_100048918);
}

uint64_t sub_100014204(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_100048914);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10001463C;
  return sub_100012768(a1, v4, v5, v6);
}

uint64_t sub_100014274(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_100048924);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10001463C;
  return sub_100012450(a1, v4, v5, v6);
}

uint64_t sub_1000142E4(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_100048934);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10001463C;
  return sub_10001299C(a1, v4, v5, v6);
}

uint64_t sub_100014350()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000143CC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for URL(0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc(dword_100048944);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_100007C7C;
  return sub_100011900(a1, v5, v6, v7, v8);
}

uint64_t sub_100014464(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_100048954);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10001463C;
  return sub_100011674(a1, v4, v5, v6);
}

uint64_t sub_1000144D4(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_100048964);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10001463C;
  return sub_1000115A0(a1, v4, v5, v6);
}

uint64_t sub_100014544()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100014570(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_100048974);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10001463C;
  return sub_100011138(a1, v4, v5, v6);
}

unint64_t sub_1000145DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100048988;
  if (!qword_100048988)
  {
    v1 = objc_opt_self(NSAttributedString);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100048988);
  }
  return result;
}

uint64_t sub_100014618(uint64_t a1)
{
  swift_unknownObjectWeakDestroy(a1);
  return a1;
}

uint64_t sub_100014668()
{
  uint64_t v0;
  uint64_t result;
  _QWORD v2[3];

  v2[1] = 0;
  v2[2] = 0;
  v2[0] = 1;
  v0 = sub_1000051F0((uint64_t *)&unk_100048AA0);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  result = TaskLocal.init(wrappedValue:)(v2);
  qword_1000489F0 = result;
  return result;
}

uint64_t sub_1000146C0()
{
  uint64_t v0;
  os_activity_scope_state_s v2;

  v2 = *(os_activity_scope_state_s *)(v0 + 16);
  os_activity_scope_leave(&v2);
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for LogActivity()
{
  return objc_opt_self(_TtC26AppDistributionLaunchAngel11LogActivity);
}

uint64_t sub_100014744()
{
  qword_1000489F8 = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "_os_activity_current");
  return swift_unknownObjectRetain(qword_1000489F8);
}

os_activity_t sub_10001476C(os_activity_t description, char a2, void *dso)
{
  const char *v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  char descriptiona[8];

  v4 = (const char *)description;
  if ((a2 & 1) == 0)
  {
    if (description)
    {
      if (qword_100047FA8 == -1)
        return _os_activity_create(dso, v4, (os_activity_t)qword_1000489F8, OS_ACTIVITY_FLAG_DEFAULT);
LABEL_15:
      swift_once(&qword_100047FA8, sub_100014744);
      return _os_activity_create(dso, v4, (os_activity_t)qword_1000489F8, OS_ACTIVITY_FLAG_DEFAULT);
    }
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((unint64_t)description >> 32)
    goto LABEL_14;
  if (description >> 11 != 27)
  {
    if (description >> 16 > 0x10)
    {
      __break(1u);
    }
    else if ((description & 0xFFFFFF80) == 0)
    {
      if (description > 0xFF)
      {
        __break(1u);
        goto LABEL_24;
      }
      v5 = ((_BYTE)description + 1);
LABEL_11:
      *(_QWORD *)descriptiona = (v5 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << ((32 - (__clz(v5) & 0x38)) & 0x38));
      if (qword_100047FA8 == -1)
        return _os_activity_create(dso, descriptiona, (os_activity_t)qword_1000489F8, OS_ACTIVITY_FLAG_DEFAULT);
LABEL_24:
      swift_once(&qword_100047FA8, sub_100014744);
      return _os_activity_create(dso, descriptiona, (os_activity_t)qword_1000489F8, OS_ACTIVITY_FLAG_DEFAULT);
    }
    v6 = (description & 0x3F) << 8;
    v7 = (v6 | (description >> 6)) + 33217;
    v8 = (v6 | (description >> 6) & 0x3F) << 8;
    v9 = (((v8 | (description >> 12) & 0x3F) << 8) | (description >> 18)) - 2122219023;
    v10 = (v8 | (description >> 12)) + 8487393;
    if (description >> 16)
      v5 = v9;
    else
      v5 = v10;
    if (description < 0x800)
      v5 = v7;
    goto LABEL_11;
  }
  __break(1u);
  return description;
}

uint64_t sub_100014908()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 88) = v0;
  return swift_task_switch(sub_100014920, 0, 0);
}

uint64_t sub_100014920()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  void **v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  char *v9;
  uint8_t *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  NSString v20;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  char *v25;
  uint8_t *v26;
  void *v27;
  id v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  id *v32;

  v1 = v0;
  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v2 = (_QWORD *)(v0 + 80);
  v4 = (void **)(v0 + 88);
  v3 = *(void **)(v1 + 88);
  v5 = type metadata accessor for Logger(0);
  sub_100007D98(v5, (uint64_t)qword_10004AD30);
  v6 = Logger.logObject.getter(v3);
  v7 = static os_log_type_t.default.getter();
  v8 = os_log_type_enabled(v6, v7);
  v9 = (char *)*v4;
  v31 = (_QWORD *)(v1 + 80);
  v32 = (id *)(v1 + 88);
  if (v8)
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 138412290;
    v12 = v2;
    v13 = *(void **)&v9[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey];
    *v12 = v13;
    v14 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v12, v4, v10 + 4, v10 + 12);
    *v11 = v13;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Running install confirmation task", v10, 0xCu);
    v15 = sub_1000051F0(&qword_1000483E8);
    swift_arrayDestroy(v11, 1, v15);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }
  else
  {

  }
  v16 = objc_msgSend((id)objc_opt_self(RBSProcessIdentity), "identityOfCurrentProcess");
  *(_QWORD *)(v1 + 96) = v16;
  if (v16)
  {
    v17 = v16;
    v18 = objc_allocWithZone((Class)SBSRemoteAlertDefinition);
    v19 = v17;
    v20 = String._bridgeToObjectiveC()();
    *(_QWORD *)(v1 + 104) = objc_msgSend(v18, "initWithSceneProvidingProcess:configurationIdentifier:", v19, v20);

    return swift_task_switch(sub_100014CB8, 0, 0);
  }
  else
  {
    v22 = Logger.logObject.getter(*v32);
    v23 = static os_log_type_t.error.getter();
    v24 = os_log_type_enabled(v22, v23);
    v25 = (char *)*v32;
    if (v24)
    {
      v26 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v26 = 138412290;
      v27 = *(void **)&v25[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey];
      *v31 = v27;
      v28 = v27;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v31, v32, v26 + 4, v26 + 12);
      *v30 = v27;

      _os_log_impl((void *)&_mh_execute_header, v22, v23, "[%@] No identity", v26, 0xCu);
      v29 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v30, 1, v29);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v26, -1, -1);
    }
    else
    {

    }
    return (*(uint64_t (**)(_QWORD))(v1 + 8))(0);
  }
}

uint64_t sub_100014CB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[13];
  v2 = v0[11];
  v0[7] = v0 + 10;
  v0[2] = v0;
  v0[3] = sub_100014D20;
  v3 = swift_continuation_init(v0 + 2, 0);
  sub_100014DA8(v3, v2, v1);
  return swift_continuation_await(v0 + 2);
}

uint64_t sub_100014D20()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)v0 + 112) = *(_BYTE *)(*(_QWORD *)v0 + 80);
  return swift_task_switch(sub_100014D70, 0, 0);
}

uint64_t sub_100014D70()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 104);

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 112));
}

void sub_100014DA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t inited;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  Class isa;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  Class v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  _BYTE v42[112];
  _BYTE v43[40];
  uint64_t aBlock;
  unint64_t v45;
  void (*v46)(uint64_t, void *);
  void *v47;
  void (*v48)(void *);
  uint64_t v49;

  v6 = objc_msgSend(objc_allocWithZone((Class)SBSRemoteAlertConfigurationContext), "init");
  v7 = swift_allocObject(&unk_100041DE0, 24, 7);
  swift_unknownObjectWeakInit(v7 + 16, a2);
  v8 = swift_allocObject(&unk_100041E08, 32, 7);
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = a1;
  v48 = sub_1000162C8;
  v49 = v8;
  aBlock = (uint64_t)_NSConcreteStackBlock;
  v45 = 1107296256;
  v46 = sub_1000125C0;
  v47 = &unk_100041E20;
  v9 = _Block_copy(&aBlock);
  v10 = (void *)objc_opt_self(BSActionResponder);
  swift_retain(v7);
  v11 = objc_msgSend(v10, "responderWithHandler:", v9);
  _Block_release(v9);
  swift_release(v49);
  swift_release(v7);
  v41 = v11;
  v12 = objc_msgSend(objc_allocWithZone((Class)BSAction), "initWithInfo:responder:", 0, v11);
  v13 = sub_1000051F0((uint64_t *)&unk_100048400);
  inited = swift_initStackObject(v13, v43);
  *(_OWORD *)(inited + 16) = xmmword_1000337A0;
  *(_QWORD *)(inited + 32) = v12;
  aBlock = inited;
  specialized Array._endMutation()();
  v15 = aBlock;
  if ((unint64_t)aBlock >> 62)
  {
    if (aBlock < 0)
      v20 = aBlock;
    else
      v20 = aBlock & 0xFFFFFFFFFFFFFF8;
    v21 = v12;
    swift_bridgeObjectRetain(v15);
    v22 = _CocoaArrayWrapper.endIndex.getter(v20);
    swift_bridgeObjectRelease(v15);
    if (v22)
      goto LABEL_3;
LABEL_8:
    v19 = &_swiftEmptySetSingleton;
    goto LABEL_9;
  }
  v16 = *(_QWORD *)((aBlock & 0xFFFFFFFFFFFFF8) + 0x10);
  v17 = v12;
  if (!v16)
    goto LABEL_8;
LABEL_3:
  sub_100024BEC(v15);
  v19 = v18;
LABEL_9:
  swift_bridgeObjectRelease(v15);
  sub_100009FE4();
  sub_100005954((unint64_t *)&qword_100048410, (uint64_t (*)(uint64_t))sub_100009FE4, (uint64_t)&protocol conformance descriptor for NSObject);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v19);
  objc_msgSend(v6, "setActions:", isa);

  v24 = type metadata accessor for PropertyListEncoder(0);
  swift_allocObject(v24, *(unsigned int *)(v24 + 48), *(unsigned __int16 *)(v24 + 52));
  v25 = v6;
  v26 = PropertyListEncoder.init()();
  v27 = a2 + OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_context;
  v28 = type metadata accessor for InstallSheetContext(0);
  v29 = sub_100005954(&qword_100048B08, (uint64_t (*)(uint64_t))&type metadata accessor for InstallSheetContext, (uint64_t)&protocol conformance descriptor for InstallSheetContext);
  v30 = dispatch thunk of PropertyListEncoder.encode<A>(_:)(v27, v28, v29);
  v32 = v31;
  swift_release(v26);
  v33 = sub_1000051F0(&qword_100048420);
  v34 = swift_initStackObject(v33, v42);
  *(_OWORD *)(v34 + 16) = xmmword_1000336A0;
  aBlock = 0x44747865746E6F63;
  v45 = 0xEB00000000617461;
  AnyHashable.init<A>(_:)((_QWORD *)(v34 + 32), &aBlock, &type metadata for String, &protocol witness table for String);
  *(_QWORD *)(v34 + 96) = &type metadata for Data;
  *(_QWORD *)(v34 + 72) = v30;
  *(_QWORD *)(v34 + 80) = v32;
  sub_10000A020(v30, v32);
  v35 = sub_10002918C(v34);
  v36 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v35);
  objc_msgSend(v25, "setUserInfo:", v36);

  v37 = objc_msgSend((id)objc_opt_self(SBSRemoteAlertHandle), "newHandleWithDefinition:configurationContext:", a3, v25);
  v38 = *(void **)(a2 + OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle);
  *(_QWORD *)(a2 + OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle) = v37;
  v39 = v37;

  objc_msgSend(v39, "registerObserver:", a2);
  v40 = objc_msgSend(objc_allocWithZone((Class)SBSRemoteAlertActivationContext), "init");
  objc_msgSend(v39, "activateWithContext:", v40);

  sub_10000A064(v30, v32);
}

void sub_100015380(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t Strong;
  void *v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  _QWORD *v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  _QWORD *v32;
  NSObject *log;
  uint64_t v34;
  void *v35;
  _OWORD v36[2];
  __int128 v37;
  __int128 v38;
  _BYTE v39[24];

  v5 = a2 + 16;
  swift_beginAccess(a2 + 16, v39, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = (void *)Strong;
    v8 = objc_msgSend(a1, "info");
    if (v8)
    {
      v9 = v8;
      v10 = objc_msgSend(v8, "objectForSetting:", 1);

      if (v10)
      {
        _bridgeAnyObjectToAny(_:)(v36, v10);
        swift_unknownObjectRelease(v10);
      }
      else
      {
        memset(v36, 0, sizeof(v36));
      }
      sub_10000A0A8((uint64_t)v36, (uint64_t)&v37);
      if (*((_QWORD *)&v38 + 1))
      {
        if ((swift_dynamicCast(v36, &v37, (char *)&type metadata for Any + 8, &type metadata for Bool, 6) & 1) != 0)
        {
          v11 = LOBYTE(v36[0]);
          if (qword_100047FB0 != -1)
            swift_once(&qword_100047FB0, sub_10002865C);
          v12 = type metadata accessor for Logger(0);
          sub_100007D98(v12, (uint64_t)qword_10004AD30);
          v13 = v7;
          v14 = Logger.logObject.getter(v13);
          v15 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v14, v15))
          {
            v16 = swift_slowAlloc(22, -1);
            v32 = (_QWORD *)swift_slowAlloc(8, -1);
            v34 = swift_slowAlloc(32, -1);
            *(_QWORD *)&v37 = v34;
            *(_DWORD *)v16 = 138412546;
            log = v14;
            v17 = *(void **)&v13[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey];
            *(_QWORD *)&v36[0] = v17;
            v18 = v17;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v36, (char *)v36 + 8, v16 + 4, v16 + 12);
            *v32 = v17;

            *(_WORD *)(v16 + 12) = 2080;
            if (v11)
              v19 = 0x656D7269666E6F63;
            else
              v19 = 0x64656C65636E6163;
            if (v11)
              v20 = 0xE900000000000064;
            else
              v20 = 0xE800000000000000;
            *(_QWORD *)&v36[0] = sub_100030804(v19, v20, (uint64_t *)&v37);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v36, (char *)v36 + 8, v16 + 14, v16 + 22);
            swift_bridgeObjectRelease(v20);
            _os_log_impl((void *)&_mh_execute_header, log, v15, "[%@] Install %s", (uint8_t *)v16, 0x16u);
            v21 = sub_1000051F0(&qword_1000483E8);
            swift_arrayDestroy(v32, 1, v21);
            swift_slowDealloc(v32, -1, -1);
            swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v34, -1, -1);
            swift_slowDealloc(v16, -1, -1);

          }
          else
          {

          }
LABEL_26:
          **(_BYTE **)(*(_QWORD *)(a3 + 64) + 40) = v11;
          swift_continuation_resume(a3);

          return;
        }
LABEL_20:
        if (qword_100047FB0 != -1)
          swift_once(&qword_100047FB0, sub_10002865C);
        v22 = type metadata accessor for Logger(0);
        sub_100007D98(v22, (uint64_t)qword_10004AD30);
        v23 = v7;
        v24 = Logger.logObject.getter(v23);
        v25 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v24, v25))
        {
          v26 = (uint8_t *)swift_slowAlloc(12, -1);
          v27 = (_QWORD *)swift_slowAlloc(8, -1);
          *(_DWORD *)v26 = 138412290;
          v35 = v7;
          v28 = a3;
          v29 = *(void **)&v23[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey];
          *(_QWORD *)&v37 = v29;
          v30 = v29;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, (char *)&v37 + 8, v26 + 4, v26 + 12);
          *v27 = v29;
          a3 = v28;
          v7 = v35;

          _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%@] No response provided, defaulting to cancel.", v26, 0xCu);
          v31 = sub_1000051F0(&qword_1000483E8);
          swift_arrayDestroy(v27, 1, v31);
          swift_slowDealloc(v27, -1, -1);
          swift_slowDealloc(v26, -1, -1);

        }
        else
        {

        }
        LOBYTE(v11) = 0;
        goto LABEL_26;
      }
    }
    else
    {
      v37 = 0u;
      v38 = 0u;
    }
    sub_1000140BC((uint64_t)&v37);
    goto LABEL_20;
  }
}

id sub_100015868()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InstallConfirmationTask(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000158FC()
{
  return type metadata accessor for InstallConfirmationTask(0);
}

uint64_t type metadata accessor for InstallConfirmationTask(uint64_t a1)
{
  uint64_t result;

  result = qword_100048AF0;
  if (!qword_100048AF0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for InstallConfirmationTask);
  return result;
}

uint64_t sub_100015940(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = type metadata accessor for InstallSheetContext(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[2] = "\b";
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

void sub_100015AB8()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;

  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v1 = type metadata accessor for Logger(0);
  sub_100007D98(v1, (uint64_t)qword_10004AD30);
  v9 = v0;
  v2 = Logger.logObject.getter(v9);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(12, -1);
    v5 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v4 = 138412290;
    v6 = *(void **)&v9[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey];
    v10 = v6;
    v7 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v4 + 4, v4 + 12);
    *v5 = v6;

    _os_log_impl((void *)&_mh_execute_header, v2, v3, "[%@] Remote alert did activate", v4, 0xCu);
    v8 = sub_1000051F0(&qword_1000483E8);
    swift_arrayDestroy(v5, 1, v8);
    swift_slowDealloc(v5, -1, -1);
    swift_slowDealloc(v4, -1, -1);

  }
  else
  {

  }
}

void sub_100015C70()
{
  void *v0;
  uint64_t v1;
  char *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v1 = type metadata accessor for Logger(0);
  sub_100007D98(v1, (uint64_t)qword_10004AD30);
  v2 = v0;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v5 = 138412290;
    v7 = *(void **)&v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey];
    v13 = v7;
    v8 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v5 + 4, v5 + 12);
    *v6 = v7;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@] Remote alert did deactivate", v5, 0xCu);
    v9 = sub_1000051F0(&qword_1000483E8);
    swift_arrayDestroy(v6, 1, v9);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
  v10 = OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle;
  v11 = *(void **)&v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle];
  if (v11)
  {
    objc_msgSend(v11, "unregisterObserver:", v2);
    v11 = *(void **)&v2[v10];
  }
  objc_msgSend(v11, "invalidate");
  v12 = *(void **)&v2[v10];
  *(_QWORD *)&v2[v10] = 0;

}

void sub_100015E44(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *oslog;
  _QWORD v28[3];
  char v29[8];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v3 = OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle;
  v4 = *(void **)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle];
  if (v4)
  {
    objc_msgSend(v4, "unregisterObserver:", v1);
    v4 = *(void **)&v1[v3];
  }
  objc_msgSend(v4, "invalidate");
  v5 = *(void **)&v1[v3];
  *(_QWORD *)&v1[v3] = 0;

  if (a1)
  {
    swift_errorRetain(a1);
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v6 = type metadata accessor for Logger(0);
    sub_100007D98(v6, (uint64_t)qword_10004AD30);
    swift_errorRetain(a1);
    v7 = v1;
    swift_errorRetain(a1);
    v8 = v7;
    oslog = Logger.logObject.getter(v8);
    v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v9))
    {
      v10 = swift_slowAlloc(22, -1);
      v11 = (_QWORD *)swift_slowAlloc(8, -1);
      v12 = swift_slowAlloc(32, -1);
      v31 = v12;
      *(_DWORD *)v10 = 138412546;
      v13 = *(void **)&v8[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey];
      v30 = (uint64_t)v13;
      v14 = v13;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v10 + 4, v10 + 12);
      *v11 = v13;

      *(_WORD *)(v10 + 12) = 2082;
      swift_getErrorValue(a1, v29, v28);
      v15 = Error.localizedDescription.getter(v28[1], v28[2]);
      v17 = v16;
      v30 = sub_100030804(v15, v16, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v10 + 14, v10 + 22);
      swift_bridgeObjectRelease(v17);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, oslog, v9, "[%@] Remote alert did invalidate with error: %{public}s", (uint8_t *)v10, 0x16u);
      v18 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v11, 1, v18);
      swift_slowDealloc(v11, -1, -1);
      swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v12, -1, -1);
      swift_slowDealloc(v10, -1, -1);

      swift_errorRelease(a1);
      return;
    }
    swift_errorRelease(a1);

    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }
  else
  {
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v19 = type metadata accessor for Logger(0);
    sub_100007D98(v19, (uint64_t)qword_10004AD30);
    oslog = v1;
    v20 = Logger.logObject.getter(oslog);
    v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(12, -1);
      v23 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v22 = 138412290;
      v24 = *(Class *)((char *)&oslog->isa + OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey);
      v31 = (uint64_t)v24;
      v25 = v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v22 + 4, v22 + 12);
      *v23 = v24;

      _os_log_impl((void *)&_mh_execute_header, v20, v21, "[%@] Remote alert did invalidate", v22, 0xCu);
      v26 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v23, 1, v26);
      swift_slowDealloc(v23, -1, -1);
      swift_slowDealloc(v22, -1, -1);

      return;
    }

  }
}

uint64_t sub_100016280()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000162A4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

void sub_1000162C8(void *a1)
{
  uint64_t v1;

  sub_100015380(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1000162D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000162E0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000162E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6);
  if ((_DWORD)v8 == 1)
  {
    sub_10000A0F0(a1, &qword_100048300);
    v9 = 7168;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      v11 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v10);
      swift_unknownObjectRetain(v10);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      v15 = v14;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter(v8);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v9 = v16 | 0x1C00;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_100041ED0, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v9, v18, (char *)&type metadata for () + 8, &unk_100048318, v17);
}

uint64_t sub_100016434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD v21[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6);
  if ((_DWORD)v8 == 1)
  {
    sub_10000A0F0(a1, &qword_100048300);
    v9 = 7168;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      v11 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v10);
      swift_unknownObjectRetain(v10);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      v15 = v14;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter(v8);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v9 = v16 | 0x1C00;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_100041F48, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  v18 = sub_1000051F0(qword_100048BF8);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    v19 = v21;
    v21[2] = v13;
    v21[3] = v15;
  }
  else
  {
    v19 = 0;
  }
  return swift_task_create(v9, v19, v18, &unk_100048BF0, v17);
}

uint64_t sub_100016588(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v8 + 96) = v14;
  *(_QWORD *)(v8 + 104) = v15;
  *(_QWORD *)(v8 + 80) = a7;
  *(_QWORD *)(v8 + 88) = a8;
  *(_BYTE *)(v8 + 202) = a6;
  *(_BYTE *)(v8 + 201) = a5;
  *(_BYTE *)(v8 + 200) = a4;
  *(_QWORD *)(v8 + 64) = a2;
  *(_QWORD *)(v8 + 72) = a3;
  *(_QWORD *)(v8 + 56) = a1;
  v9 = type metadata accessor for Logger(0);
  *(_QWORD *)(v8 + 112) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 120) = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v8 + 128) = swift_task_alloc(v11);
  *(_QWORD *)(v8 + 136) = swift_task_alloc(v11);
  v12 = sub_1000051F0(&qword_100048B60);
  *(_QWORD *)(v8 + 144) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v12 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100016664, 0, 0);
}

uint64_t sub_100016664()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  char v3;
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
  _BYTE *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;

  if (*(_BYTE *)(v0 + 201) == 1)
  {
    v1 = *(void **)(v0 + 104);
    v2 = *(NSObject **)(v0 + 64);
    v3 = *(_BYTE *)(v0 + 200);
    v4 = type metadata accessor for LogActivity();
    v5 = swift_allocObject(v4, 32, 7);
    v6 = sub_10001476C(v2, v3, v1);
    *(_QWORD *)(v0 + 40) = 0;
    *(_QWORD *)(v0 + 48) = 0;
    os_activity_scope_enter(v6, (os_activity_scope_state_t)(v0 + 40));
    swift_unknownObjectRelease(v6);
    *(_OWORD *)(v5 + 16) = *(_OWORD *)(v0 + 40);
  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)(v0 + 152) = v5;
  if (*(_BYTE *)(v0 + 202) == 1)
  {
    v8 = *(_QWORD *)(v0 + 64);
    v7 = *(_QWORD *)(v0 + 72);
    v9 = *(unsigned __int8 *)(v0 + 200);
    v10 = type metadata accessor for Transaction();
    swift_allocObject(v10, 24, 7);
    v11 = sub_10001AF8C(v8, v7, v9);
  }
  else
  {
    v11 = 0;
  }
  *(_QWORD *)(v0 + 160) = v11;
  v12 = *(_QWORD *)(v0 + 144);
  v13 = *(_QWORD *)(v0 + 112);
  v14 = *(_QWORD *)(v0 + 120);
  sub_10001C244(*(_QWORD *)(v0 + 80), v12, &qword_100048B60);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    v15 = 0;
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 136);
    v18 = *(_QWORD *)(v0 + 120);
    v17 = *(_QWORD *)(v0 + 128);
    v19 = *(_QWORD *)(v0 + 112);
    v21 = *(_BYTE **)(v0 + 64);
    v20 = *(_QWORD *)(v0 + 72);
    v22 = *(unsigned __int8 *)(v0 + 200);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 32))(v16, *(_QWORD *)(v0 + 144), v19);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v16, v19);
    v23 = type metadata accessor for SignpostInterval(0);
    swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
    v15 = sub_100005D0C(v21, v20, v22, v17);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v19);
  }
  *(_QWORD *)(v0 + 168) = v15;
  if (qword_100047FA0 != -1)
    swift_once(&qword_100047FA0, sub_100014668);
  *(_QWORD *)(v0 + 16) = v5;
  *(_QWORD *)(v0 + 24) = v11;
  *(_QWORD *)(v0 + 32) = v15;
  v24 = swift_task_alloc(32);
  *(_QWORD *)(v0 + 176) = v24;
  *(_OWORD *)(v24 + 16) = *(_OWORD *)(v0 + 88);
  v25 = async function pointer to TaskLocal.withValue<A>(_:operation:isolation:file:line:)[1];
  swift_retain(v5);
  swift_retain(v11);
  swift_retain(v15);
  v26 = (_QWORD *)swift_task_alloc(v25);
  *(_QWORD *)(v0 + 184) = v26;
  *v26 = v0;
  v26[1] = sub_100016934;
  return TaskLocal.withValue<A>(_:operation:isolation:file:line:)(*(_QWORD *)(v0 + 56), v0 + 16, &unk_100048B88, v24, 0, 0, 0xD000000000000037, 0x8000000100035A50);
}

uint64_t sub_100016934()
{
  uint64_t v0;
  uint64_t **v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v2 = *v1;
  v4 = (*v1)[22];
  v3 = (*v1)[23];
  (*v1)[24] = v0;
  swift_task_dealloc(v3);
  sub_10001BE9C(v2[2], v2[3], v2[4]);
  swift_task_dealloc(v4);
  if (v0)
    v5 = sub_100016A98;
  else
    v5 = sub_1000169F8;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_1000169F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 136);
  swift_release(*(_QWORD *)(v0 + 168));
  swift_release(v1);
  swift_release(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100016A98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 136);
  swift_release(*(_QWORD *)(v0 + 168));
  swift_release(v1);
  swift_release(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100016B38(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100007C7C;
  return v6(a1);
}

BOOL sub_100016B9C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_100016BAC(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

uint64_t sub_100016BD0(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  char v7;

  if (a1 == 0x73736563637573 && a2 == 0xE700000000000000)
  {
    v5 = 0xE700000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x73736563637573, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6572756C696166 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease(0xE700000000000000);
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6572756C696166, 0xE700000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

Swift::Int sub_100016CC0(char a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

uint64_t sub_100016D04(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6572756C696166;
  else
    return 0x73736563637573;
}

BOOL sub_100016D34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100016B9C(*a1, *a2);
}

Swift::Int sub_100016D4C()
{
  char *v0;

  return sub_100016CC0(*v0);
}

void sub_100016D60(uint64_t a1)
{
  char *v1;

  sub_100016BAC(a1, *v1);
}

Swift::Int sub_100016D74(uint64_t a1)
{
  char *v1;
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, a1);
  sub_100016BAC((uint64_t)v3, *v1);
  return Hasher._finalize()();
}

uint64_t sub_100016DBC()
{
  char *v0;

  return sub_100016D04(*v0);
}

uint64_t sub_100016DD0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100016BD0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100016E00()
{
  return 0;
}

uint64_t sub_100016E0C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_10001B9B8();
  *a1 = result;
  return result;
}

uint64_t sub_100016E3C(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100033E30, a1);
  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_100016E70(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100033E30, a1);
  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t sub_100016EA4(uint64_t a1, uint64_t a2)
{
  char v4;
  char v5;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease(0xE200000000000000);
    v5 = 0;
  }
  else
  {
    v4 = _stringCompareWithSmolCheck(_:_:expecting:)(12383, 0xE200000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    v5 = v4 ^ 1;
  }
  return v5 & 1;
}

uint64_t sub_100016F10(_QWORD *a1, _QWORD *a2)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
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
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t WitnessTable;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char v54;

  v4 = a2[2];
  v5 = a2[3];
  v6 = a2[4];
  v7 = type metadata accessor for AppDistributionLaunchAngelServiceResult.FailureCodingKeys(255, v4, v5, v6);
  WitnessTable = swift_getWitnessTable(&unk_100033ED0, v7);
  v44 = v7;
  v8 = type metadata accessor for KeyedEncodingContainer(0, v7);
  v46 = *(_QWORD *)(v8 - 8);
  v47 = v8;
  __chkstk_darwin(v8);
  v45 = (char *)&v36 - v9;
  v10 = type metadata accessor for AppDistributionLaunchAngelServiceResult.SuccessCodingKeys(255, v4, v5, v6);
  v36 = swift_getWitnessTable(&unk_100033E80, v10);
  v37 = v10;
  v42 = type metadata accessor for KeyedEncodingContainer(0, v10);
  v40 = *(_QWORD *)(v42 - 8);
  v11 = __chkstk_darwin(v42);
  v38 = (char *)&v36 - v12;
  v41 = *(_QWORD *)(v4 - 8);
  v13 = __chkstk_darwin(v11);
  v39 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(a2 - 1);
  __chkstk_darwin(v13);
  v17 = (uint64_t *)((char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v48 = v6;
  v49 = v4;
  v18 = type metadata accessor for AppDistributionLaunchAngelServiceResult.CodingKeys(255, v4, v5, v6);
  v19 = swift_getWitnessTable(&unk_100033E30, v18);
  v20 = type metadata accessor for KeyedEncodingContainer(0, v18);
  v50 = *(_QWORD *)(v20 - 8);
  v51 = v20;
  __chkstk_darwin(v20);
  v22 = (char *)&v36 - v21;
  v24 = a1[3];
  v23 = a1[4];
  sub_10001C118(a1, v24);
  dispatch thunk of Encoder.container<A>(keyedBy:)(v18, v18, v19, v24, v23);
  (*(void (**)(uint64_t *, uint64_t, _QWORD *))(v15 + 16))(v17, v52, a2);
  if (swift_getEnumCaseMultiPayload(v17, a2) == 1)
  {
    v25 = *v17;
    v26 = v17[1];
    v54 = 1;
    v27 = v45;
    v28 = v51;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(v44, &v54, v51, v44, WitnessTable);
    v29 = v47;
    KeyedEncodingContainer.encode(_:forKey:)(v25, v26);
    swift_bridgeObjectRelease(v26);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v27, v29);
  }
  else
  {
    v30 = v41;
    v31 = v39;
    v32 = v49;
    (*(void (**)(char *, uint64_t *, uint64_t))(v41 + 32))(v39, v17, v49);
    v53 = 0;
    v33 = v38;
    v28 = v51;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(v37, &v53, v51, v37, v36);
    v34 = v42;
    KeyedEncodingContainer.encode<A>(_:forKey:)(v31);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v33, v34);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v32);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v22, v28);
}

uint64_t sub_100017278@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t *, uint64_t);
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  __int128 v66;
  uint64_t *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t WitnessTable;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  _OWORD v88[2];
  __int128 v89;
  __int128 v90;
  _QWORD *v91;

  v81 = a5;
  v9 = type metadata accessor for AppDistributionLaunchAngelServiceResult.FailureCodingKeys(255, a2, a3, a4);
  WitnessTable = swift_getWitnessTable(&unk_100033ED0, v9);
  v79 = v9;
  v71 = type metadata accessor for KeyedDecodingContainer(0, v9);
  v74 = *(_QWORD *)(v71 - 8);
  __chkstk_darwin(v71);
  v80 = (char *)&v66 - v10;
  v11 = type metadata accessor for AppDistributionLaunchAngelServiceResult.SuccessCodingKeys(255, a2, a3, a4);
  v12 = swift_getWitnessTable(&unk_100033E80, v11);
  v76 = v11;
  v75 = v12;
  v70 = type metadata accessor for KeyedDecodingContainer(0, v11);
  v73 = *(_QWORD *)(v70 - 8);
  __chkstk_darwin(v70);
  v77 = (char *)&v66 - v13;
  v14 = type metadata accessor for AppDistributionLaunchAngelServiceResult.CodingKeys(255, a2, a3, a4);
  v87 = swift_getWitnessTable(&unk_100033E30, v14);
  v84 = type metadata accessor for KeyedDecodingContainer(0, v14);
  v82 = *(_QWORD *)(v84 - 8);
  __chkstk_darwin(v84);
  v16 = (char *)&v66 - v15;
  v72 = a2;
  v86 = a3;
  v83 = type metadata accessor for AppDistributionLaunchAngelServiceResult(0, a2, a3, a4);
  v69 = *(_QWORD *)(v83 - 8);
  v17 = __chkstk_darwin(v83);
  v19 = (uint64_t *)((char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v20 = __chkstk_darwin(v17);
  v22 = (char *)&v66 - v21;
  __chkstk_darwin(v20);
  v24 = (char *)&v66 - v23;
  v25 = a1;
  v26 = a1[3];
  v27 = v25[4];
  sub_10001C118(v25, v26);
  v85 = v16;
  v28 = v91;
  dispatch thunk of Decoder.container<A>(keyedBy:)(v14, v14, v87, v26, v27);
  if (v28)
    goto LABEL_7;
  v87 = (uint64_t)v22;
  v67 = v19;
  v68 = v24;
  v29 = v83;
  v91 = v25;
  v30 = v84;
  v31 = v85;
  *(_QWORD *)&v88[0] = KeyedDecodingContainer.allKeys.getter();
  v32 = type metadata accessor for Array(0, v14);
  v33 = swift_getWitnessTable(&protocol conformance descriptor for [A], v32);
  *(_QWORD *)&v89 = ArraySlice.init<A>(_:)(v88, v14, v32, v33);
  *((_QWORD *)&v89 + 1) = v34;
  *(_QWORD *)&v90 = v35;
  *((_QWORD *)&v90 + 1) = v36;
  v37 = type metadata accessor for ArraySlice(0, v14);
  v38 = swift_getWitnessTable(&protocol conformance descriptor for ArraySlice<A>, v37);
  Collection<>.popFirst()(v88, v37, v38);
  v39 = v88[0];
  if (LOBYTE(v88[0]) == 2 || (v66 = v89, v88[0] = v89, v88[1] = v90, (Collection.isEmpty.getter(v37, v38) & 1) == 0))
  {
    v43 = type metadata accessor for DecodingError(0);
    swift_allocError(v43, &protocol witness table for DecodingError, 0, 0);
    v45 = v44;
    sub_1000051F0(qword_100048C88);
    *v45 = v29;
    v46 = KeyedDecodingContainer.codingPath.getter(v30);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)(v46, 0xD00000000000002BLL, 0x8000000100035AF0, 0);
    v47 = (*(uint64_t (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v43 - 8) + 104))(v45, enum case for DecodingError.typeMismatch(_:), v43);
    swift_willThrow(v47);
    swift_unknownObjectRelease(v89);
    (*(void (**)(char *, uint64_t))(v82 + 8))(v31, v30);
    v25 = v91;
LABEL_7:
    v48 = v25;
    return sub_10001C164(v48);
  }
  if ((v39 & 1) != 0)
  {
    LOBYTE(v88[0]) = 1;
    v50 = v80;
    v51 = v31;
    v52 = v30;
    v53 = KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(v79, v88, v30, v79, WitnessTable);
    v61 = v81;
    v55 = v51;
    v56 = v71;
    v62 = KeyedDecodingContainer.decode(_:forKey:)(v53, v71);
    v64 = v63;
    (*(void (**)(char *, uint64_t))(v74 + 8))(v50, v56);
    swift_unknownObjectRelease(v89);
    (*(void (**)(char *, uint64_t))(v82 + 8))(v55, v52);
    v65 = v67;
    *v67 = v62;
    v65[1] = v64;
    v58 = v29;
    swift_storeEnumTagMultiPayload(v65, v29, 1);
    v59 = *(void (**)(char *, uint64_t *, uint64_t))(v69 + 32);
    v60 = v68;
    v59(v68, v65, v29);
  }
  else
  {
    LOBYTE(v88[0]) = 0;
    v40 = v77;
    v41 = v30;
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(v76, v88, v30, v76, v75);
    v42 = v82;
    v54 = v70;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v40, v54);
    swift_unknownObjectRelease(v89);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v31, v41);
    v57 = v87;
    v58 = v29;
    swift_storeEnumTagMultiPayload(v87, v29, 0);
    v59 = *(void (**)(char *, uint64_t *, uint64_t))(v69 + 32);
    v60 = v68;
    v59(v68, (uint64_t *)v57, v29);
    v61 = v81;
  }
  v59(v61, (uint64_t *)v60, v58);
  v48 = v91;
  return sub_10001C164(v48);
}

uint64_t sub_100017908()
{
  return 1;
}

void sub_100017914()
{
  Hasher._combine(_:)(0);
}

uint64_t sub_10001793C()
{
  return 12383;
}

uint64_t sub_10001794C@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_1000179F4(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD))sub_100017908, a2);
}

uint64_t sub_100017958(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100033ED0, a1);
  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_10001798C(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100033ED0, a1);
  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t sub_1000179C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100016EA4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1000179F4@<X0>(_QWORD *a1@<X1>, uint64_t (*a2)(_QWORD, _QWORD, _QWORD)@<X3>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = a2(a1[2], a1[3], a1[4]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100017A28(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100033E80, a1);
  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_100017A5C(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100033E80, a1);
  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t sub_100017A90@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, char *a3@<X8>)
{
  return sub_100017278(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_100017AB0(_QWORD *a1, _QWORD *a2)
{
  return sub_100016F10(a1, a2);
}

Swift::Int sub_100017AC4()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

Swift::Int sub_100017B04(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_100017B4C()
{
  return 0x6874756120746F4ELL;
}

uint64_t sub_100017B70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3[34] = a2;
  v3[35] = a3;
  v3[33] = a1;
  v4 = type metadata accessor for LicenseResolutionContext(0);
  v3[36] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[37] = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[38] = swift_task_alloc(v6);
  v3[39] = swift_task_alloc(v6);
  v3[40] = swift_task_alloc(v6);
  v8 = type metadata accessor for OAuthAuthorizationContext(0, v7);
  v3[41] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v3[42] = v9;
  v10 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[43] = swift_task_alloc(v10);
  v3[44] = swift_task_alloc(v10);
  v11 = type metadata accessor for InstallSheetContext(0);
  v3[45] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v3[46] = v12;
  v13 = (*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[47] = swift_task_alloc(v13);
  v3[48] = swift_task_alloc(v13);
  v3[49] = swift_task_alloc(v13);
  v14 = type metadata accessor for LaunchAngelXPCResponse.ResponseType(0);
  v3[50] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v3[51] = v15;
  v3[52] = swift_task_alloc((*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for LaunchAngelXPCRequest.RequestType(0);
  v3[53] = v16;
  v17 = *(_QWORD *)(v16 - 8);
  v3[54] = v17;
  v3[55] = swift_task_alloc((*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for LaunchAngelXPCResponse(0);
  v3[56] = v18;
  v19 = *(_QWORD *)(v18 - 8);
  v3[57] = v19;
  v3[58] = swift_task_alloc((*(_QWORD *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for LaunchAngelXPCRequest(0);
  v3[59] = v20;
  v21 = *(_QWORD *)(v20 - 8);
  v3[60] = v21;
  v3[61] = swift_task_alloc((*(_QWORD *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100017D0C, 0, 0);
}

uint64_t sub_100017D0C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  unint64_t v67;
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
  uint64_t (*v78)(uint64_t, uint64_t, uint64_t);
  uint64_t v79;
  NSObject *v80;
  os_log_type_t v81;
  _BOOL4 v82;
  uint64_t v83;
  objc_super *v84;
  uint64_t v85;
  uint8_t *v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  void (*v91)(uint64_t, Class);
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  NSObject *v100;
  os_log_type_t v101;
  NSObject **v102;
  uint8_t *v103;
  NSObject *v104;
  NSObject **v105;
  uint64_t v106;
  Class super_class;
  Class v108;
  objc_class *v109;
  char *v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t *v116;
  objc_super **v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t (*v127)(uint64_t, uint64_t, uint64_t);
  uint64_t v128;
  NSObject *v129;
  os_log_type_t v130;
  _BOOL4 v131;
  uint64_t v132;
  uint64_t v133;
  uint8_t *v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  unint64_t v138;
  void (*v139)(uint64_t, uint64_t);
  uint8_t *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void (*v145)(uint64_t, uint64_t, uint64_t);
  objc_class *v146;
  char *v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  uint64_t *v153;
  void (*v154)(uint64_t, uint64_t);
  _QWORD *v155;
  uint64_t v156;
  uint64_t v157;
  objc_class *v158;
  char *v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  uint64_t *v165;
  _QWORD *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  _QWORD *v170;
  _QWORD *v171;
  _QWORD *type;
  uint64_t v173;
  NSObject *log;
  os_log_t v175;
  uint64_t v176;
  os_log_type_t v177;
  uint64_t v178;
  os_log_type_t v179[8];
  os_log_type_t v180[8];
  unsigned int v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t (*v184)(uint64_t, uint64_t, uint64_t);
  uint64_t v185;
  uint64_t v186;
  _QWORD *v187;
  uint64_t (*v188)(uint64_t, uint64_t, uint64_t);
  NSObject **v189;
  uint64_t *v190;
  uint64_t v191;
  uint64_t (*v192)(uint64_t, unint64_t, NSObject *, uint64_t, uint64_t);
  uint64_t v193;
  uint64_t (*v194)(uint64_t, unint64_t, uint64_t, unint64_t);
  objc_super *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198[2];

  v1 = *(_QWORD *)(v0 + 488);
  v3 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 280);
  v4 = (objc_class *)type metadata accessor for LogKey();
  v5 = objc_allocWithZone(v4);
  v6 = sub_100028844();
  *(_QWORD *)(v0 + 48) = v3;
  v7 = v0 + 48;
  *(_QWORD *)(v0 + 240) = v1;
  v8 = v0 + 240;
  *(_QWORD *)(v0 + 496) = v6;
  v9 = v0 + 160;
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)(v0 + 160) = v0 + 48;
  sub_10000A020(v3, v2);
  sub_100019C18((_QWORD *)(v0 + 240));
  v191 = v0 + 224;
  v11 = *(_QWORD *)(v0 + 432);
  v10 = *(_QWORD *)(v0 + 440);
  v12 = *(_QWORD *)(v0 + 424);
  v13 = sub_10000A064(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  LaunchAngelXPCRequest.requestType.getter(v13);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 88))(v10, v12);
  if (v14 == enum case for LaunchAngelXPCRequest.RequestType.displayProductPage(_:))
  {
    v15 = *(_QWORD *)(v0 + 440);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 432) + 96))(v15, *(_QWORD *)(v0 + 424));
    v16 = *(NSObject **)v15;
    v185 = *(_QWORD *)(v15 + 8);
    v181 = *(unsigned __int8 *)(v15 + 16);
    v17 = *(_QWORD *)(v15 + 32);
    v176 = *(_QWORD *)(v15 + 24);
    v18 = v0;
    *(_QWORD *)(v0 + 504) = v17;
    if (qword_100047FC8 != -1)
      swift_once(&qword_100047FC8, sub_1000286C4);
    v19 = type metadata accessor for Logger(0);
    sub_100007D98(v19, (uint64_t)qword_10004AD78);
    v20 = v6;
    swift_bridgeObjectRetain_n(v17, 2);
    v21 = v20;
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      log = v22;
      v175 = v16;
      v24 = v7 + 184;
      v169 = v7 + 200;
      v167 = v7 + 80;
      v168 = v7 + 208;
      v25 = swift_slowAlloc(42, -1);
      v170 = (_QWORD *)swift_slowAlloc(8, -1);
      v173 = swift_slowAlloc(64, -1);
      v198[0] = v173;
      *(_DWORD *)v25 = 138413058;
      v26 = v18;
      *(_QWORD *)(v18 + 224) = v21;
      v27 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v191, v24, v25 + 4, v25 + 12);
      *v170 = v21;
      v28 = v26;

      *(_WORD *)(v25 + 12) = 2050;
      *(_QWORD *)(v26 + 232) = v175;
      v29 = v24;
      v16 = v175;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v29, v8, v25 + 14, v25 + 22);
      *(_WORD *)(v25 + 22) = 2082;
      v30 = v185;
      *(_QWORD *)(v26 + 128) = v185;
      v31 = v181;
      *(_BYTE *)(v28 + 136) = v181;
      v32 = sub_1000051F0(&qword_100048BB0);
      v33 = String.init<A>(describing:)(v167, v32);
      v35 = v34;
      *(_QWORD *)(v28 + 248) = sub_100030804(v33, v34, v198);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v169, v168, v25 + 24, v25 + 32);
      swift_bridgeObjectRelease(v35);
      *(_WORD *)(v25 + 32) = 2082;
      swift_bridgeObjectRetain(v17);
      v36 = v176;
      *(_QWORD *)(v28 + 256) = sub_100030804(v176, v17, v198);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v168, v28 + 264, v25 + 34, v25 + 42);
      swift_bridgeObjectRelease_n(v17, 3);
      _os_log_impl((void *)&_mh_execute_header, log, v23, "[%@] Asked to display product page %{public}llu - %{public}s by %{public}s", (uint8_t *)v25, 0x2Au);
      v37 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v170, 1, v37);
      swift_slowDealloc(v170, -1, -1);
      swift_arrayDestroy(v173, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v173, -1, -1);
      swift_slowDealloc(v25, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v17, 2);
      v28 = v18;
      v30 = v185;
      v31 = v181;
      v36 = v176;
    }
    v192 = (uint64_t (*)(uint64_t, unint64_t, NSObject *, uint64_t, uint64_t))((char *)&dword_100049170
                                                                                           + dword_100049170);
    v51 = (_QWORD *)swift_task_alloc(unk_100049174);
    *(_QWORD *)(v28 + 512) = v51;
    *v51 = v28;
    v51[1] = sub_10001912C;
    return v192(v36, v17, v16, v30, v31);
  }
  if (v14 == enum case for LaunchAngelXPCRequest.RequestType.displaySearchResults(_:))
  {
    v38 = *(uint64_t **)(v0 + 440);
    (*(void (**)(uint64_t *, _QWORD))(*(_QWORD *)(v0 + 432) + 96))(v38, *(_QWORD *)(v0 + 424));
    v40 = *v38;
    v39 = v38[1];
    *(_QWORD *)(v0 + 528) = v39;
    v41 = v38[3];
    v186 = v38[2];
    *(_QWORD *)(v0 + 536) = v41;
    if (qword_100047FC8 != -1)
      swift_once(&qword_100047FC8, sub_1000286C4);
    v42 = type metadata accessor for Logger(0);
    sub_100007D98(v42, (uint64_t)qword_10004AD78);
    v43 = v6;
    swift_bridgeObjectRetain_n(v39, 2);
    swift_bridgeObjectRetain_n(v41, 2);
    v44 = v43;
    v45 = Logger.logObject.getter(v44);
    v46 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v45, v46))
    {
      v177 = v46;
      v47 = swift_slowAlloc(32, -1);
      type = (_QWORD *)swift_slowAlloc(8, -1);
      v182 = swift_slowAlloc(64, -1);
      v198[0] = v182;
      *(_DWORD *)v47 = 138412802;
      *(_QWORD *)(v0 + 200) = v44;
      v48 = v44;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v0 + 208, v47 + 4, v47 + 12);
      *type = v44;

      *(_WORD *)(v47 + 12) = 2082;
      swift_bridgeObjectRetain(v39);
      *(_QWORD *)(v0 + 208) = sub_100030804(v40, v39, v198);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 208, v0 + 216, v47 + 14, v47 + 22);
      swift_bridgeObjectRelease_n(v39, 3);
      *(_WORD *)(v47 + 22) = 2082;
      swift_bridgeObjectRetain(v41);
      v49 = v186;
      *(_QWORD *)(v0 + 216) = sub_100030804(v186, v41, v198);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 216, v191, v47 + 24, v47 + 32);
      swift_bridgeObjectRelease_n(v41, 3);
      _os_log_impl((void *)&_mh_execute_header, v45, v177, "[%@] Asked to display search results %{public}s by %{public}s", (uint8_t *)v47, 0x20u);
      v50 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(type, 1, v50);
      swift_slowDealloc(type, -1, -1);
      swift_arrayDestroy(v182, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v182, -1, -1);
      swift_slowDealloc(v47, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v39, 2);
      swift_bridgeObjectRelease_n(v41, 2);

      v49 = v186;
    }
    v194 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, unint64_t))((char *)&dword_1000491A8
                                                                                        + dword_1000491A8);
    v65 = (_QWORD *)swift_task_alloc(unk_1000491AC);
    *(_QWORD *)(v0 + 544) = v65;
    *v65 = v0;
    v65[1] = sub_1000193D8;
    v66 = v49;
    v67 = v41;
    v68 = v40;
    return v194(v66, v67, v68, v39);
  }
  if (v14 == enum case for LaunchAngelXPCRequest.RequestType.displayAuthorization(_:))
  {
    v187 = (_QWORD *)(v0 + 176);
    v53 = *(uint64_t **)(v0 + 440);
    (*(void (**)(uint64_t *, _QWORD))(*(_QWORD *)(v0 + 432) + 96))(v53, *(_QWORD *)(v0 + 424));
    v39 = v53[1];
    v193 = *v53;
    *(_QWORD *)(v0 + 560) = v39;
    v55 = v53[2];
    v54 = v53[3];
    *(_QWORD *)(v0 + 568) = v54;
    if (qword_100047FC8 != -1)
      swift_once(&qword_100047FC8, sub_1000286C4);
    v56 = type metadata accessor for Logger(0);
    sub_100007D98(v56, (uint64_t)qword_10004AD78);
    v57 = v6;
    swift_bridgeObjectRetain_n(v39, 2);
    swift_bridgeObjectRetain_n(v54, 2);
    v58 = v57;
    v59 = Logger.logObject.getter(v58);
    v60 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = swift_slowAlloc(32, -1);
      v171 = (_QWORD *)swift_slowAlloc(8, -1);
      v178 = swift_slowAlloc(64, -1);
      v198[0] = v178;
      *(_DWORD *)v61 = 138412802;
      *v187 = v58;
      v62 = v58;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v187, v0 + 184, v61 + 4, v61 + 12);
      *v171 = v58;

      *(_WORD *)(v61 + 12) = 2082;
      swift_bridgeObjectRetain(v39);
      v63 = v193;
      *(_QWORD *)(v0 + 184) = sub_100030804(v193, v39, v198);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 184, v0 + 192, v61 + 14, v61 + 22);
      swift_bridgeObjectRelease_n(v39, 3);
      *(_WORD *)(v61 + 22) = 2082;
      swift_bridgeObjectRetain(v54);
      *(_QWORD *)(v0 + 192) = sub_100030804(v55, v54, v198);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 192, v0 + 200, v61 + 24, v61 + 32);
      swift_bridgeObjectRelease_n(v54, 3);
      _os_log_impl((void *)&_mh_execute_header, v59, v60, "[%@] Asked to display authorization for %{public}s by %{public}s", (uint8_t *)v61, 0x20u);
      v64 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v171, 1, v64);
      swift_slowDealloc(v171, -1, -1);
      swift_arrayDestroy(v178, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v178, -1, -1);
      swift_slowDealloc(v61, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v39, 2);
      swift_bridgeObjectRelease_n(v54, 2);

      v63 = v193;
    }
    v194 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, unint64_t))((char *)&dword_1000491B0
                                                                                        + dword_1000491B0);
    v92 = (_QWORD *)swift_task_alloc(unk_1000491B4);
    *(_QWORD *)(v0 + 576) = v92;
    *v92 = v0;
    v92[1] = sub_10001955C;
    v66 = v55;
    v67 = v54;
    v68 = v63;
    return v194(v66, v67, v68, v39);
  }
  if (v14 == enum case for LaunchAngelXPCRequest.RequestType.getInstallConfirmation(_:))
  {
    v69 = *(_QWORD *)(v0 + 440);
    v70 = *(_QWORD *)(v0 + 392);
    v71 = *(_QWORD *)(v0 + 360);
    v72 = *(_QWORD *)(v0 + 368);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 432) + 96))(v69, *(_QWORD *)(v0 + 424));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 32))(v70, v69, v71);
    if (qword_100047FC8 != -1)
      swift_once(&qword_100047FC8, sub_1000286C4);
    v74 = *(_QWORD *)(v0 + 384);
    v73 = *(_QWORD *)(v0 + 392);
    v75 = *(_QWORD *)(v0 + 360);
    v76 = *(_QWORD *)(v0 + 368);
    v77 = type metadata accessor for Logger(0);
    sub_100007D98(v77, (uint64_t)qword_10004AD78);
    v78 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v76 + 16);
    v79 = v78(v74, v73, v75);
    v80 = Logger.logObject.getter(v79);
    v81 = static os_log_type_t.default.getter();
    v82 = os_log_type_enabled(v80, v81);
    v83 = *(_QWORD *)(v0 + 384);
    v84 = (objc_super *)v0;
    v85 = *(_QWORD *)(v0 + 368);
    v195 = v84;
    if (v82)
    {
      v188 = v78;
      *(_QWORD *)v179 = v84[22].super_class;
      v86 = (uint8_t *)swift_slowAlloc(12, -1);
      v183 = swift_slowAlloc(32, -1);
      v198[0] = v183;
      *(_DWORD *)v86 = 136446210;
      v87 = InstallSheetContext.logKey.getter(v183);
      v89 = v88;
      *(_QWORD *)(v7 + 120) = sub_100030804(v87, v88, v198);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v7 + 120, v7 + 128, v86 + 4, v86 + 12);
      v90 = v89;
      v78 = v188;
      swift_bridgeObjectRelease(v90);
      v91 = *(void (**)(uint64_t, Class))(v85 + 8);
      v91(v83, *(Class *)v179);
      _os_log_impl((void *)&_mh_execute_header, v80, v81, "[%{public}s]: Asked to confirm install", v86, 0xCu);
      swift_arrayDestroy(v183, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v183, -1, -1);
      swift_slowDealloc(v86, -1, -1);
    }
    else
    {
      v91 = *(void (**)(uint64_t, Class))(v85 + 8);
      v91(v83, v84[22].super_class);
    }

    v195[37].receiver = v91;
    super_class = v195[23].super_class;
    v108 = v195[22].super_class;
    v78((uint64_t)super_class, (uint64_t)v195[24].super_class, (uint64_t)v108);
    v109 = (objc_class *)type metadata accessor for InstallConfirmationTask(0);
    v110 = (char *)objc_allocWithZone(v109);
    *(_QWORD *)&v110[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle] = 0;
    v78((uint64_t)&v110[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_context], (uint64_t)super_class, (uint64_t)v108);
    v111 = v110;
    v112 = InstallSheetContext.logKey.getter(v111);
    v114 = v113;
    v115 = (char *)objc_allocWithZone(v4);
    v116 = (uint64_t *)&v115[OBJC_IVAR____TtC26AppDistributionLaunchAngel6LogKey_stringValue];
    *v116 = v112;
    v116[1] = v114;
    v195[6].receiver = v115;
    v195[6].super_class = v4;
    *(_QWORD *)&v111[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey] = objc_msgSendSuper2(v195 + 6, "init");

    v195[2].receiver = v111;
    v195[2].super_class = v109;
    v195[37].super_class = (Class)objc_msgSendSuper2(v195 + 2, "init");
    v91((uint64_t)super_class, v108);
    v117 = (objc_super **)swift_task_alloc(dword_100048B04);
    v195[38].receiver = v117;
    *v117 = v195;
    v117[1] = (objc_super *)sub_1000196E0;
    return sub_100014908();
  }
  else
  {
    v93 = v0 + 152;
    if (v14 == enum case for LaunchAngelXPCRequest.RequestType.oauthAuthorization(_:))
    {
      v94 = *(_QWORD *)(v0 + 440);
      v95 = *(_QWORD *)(v0 + 352);
      v97 = *(_QWORD *)(v0 + 328);
      v96 = *(_QWORD *)(v0 + 336);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 432) + 96))(v94, *(_QWORD *)(v0 + 424));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v96 + 32))(v95, v94, v97);
      if (qword_100047FC8 != -1)
        swift_once(&qword_100047FC8, sub_1000286C4);
      v98 = type metadata accessor for Logger(0);
      sub_100007D98(v98, (uint64_t)qword_10004AD78);
      v99 = v6;
      v100 = Logger.logObject.getter(v99);
      v101 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v100, v101))
      {
        v196 = v0;
        v102 = (NSObject **)(v0 + 144);
        v103 = (uint8_t *)swift_slowAlloc(12, -1);
        v189 = (NSObject **)swift_slowAlloc(8, -1);
        *(_DWORD *)v103 = 138412290;
        *v102 = v99;
        v104 = v99;
        v105 = v102;
        v0 = v196;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v105, v93, v103 + 4, v103 + 12);
        *v189 = v99;

        _os_log_impl((void *)&_mh_execute_header, v100, v101, "[%@] Asked to display OAuth web authentication", v103, 0xCu);
        v106 = sub_1000051F0(&qword_1000483E8);
        swift_arrayDestroy(v189, 1, v106);
        swift_slowDealloc(v189, -1, -1);
        swift_slowDealloc(v103, -1, -1);
      }
      else
      {

        v100 = v99;
      }
      v141 = *(_QWORD *)(v0 + 344);
      v142 = *(_QWORD *)(v0 + 352);
      v143 = *(_QWORD *)(v0 + 328);
      v144 = *(_QWORD *)(v0 + 336);

      v145 = *(void (**)(uint64_t, uint64_t, uint64_t))(v144 + 16);
      v145(v141, v142, v143);
      v146 = (objc_class *)type metadata accessor for OAuthAuthorizationTask(0);
      v147 = (char *)objc_allocWithZone(v146);
      *(_QWORD *)&v147[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_remoteHandle] = 0;
      v145((uint64_t)&v147[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_context], v141, v143);
      v148 = v147;
      v149 = OAuthAuthorizationContext.logKey.getter();
      v151 = v150;
      v152 = (char *)objc_allocWithZone(v4);
      v153 = (uint64_t *)&v152[OBJC_IVAR____TtC26AppDistributionLaunchAngel6LogKey_stringValue];
      *v153 = v149;
      v153[1] = v151;
      *(_QWORD *)(v0 + 112) = v152;
      *(_QWORD *)(v0 + 120) = v4;
      *(_QWORD *)&v148[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey] = objc_msgSendSuper2((objc_super *)(v0 + 112), "init");

      *(_QWORD *)(v0 + 80) = v148;
      *(_QWORD *)(v0 + 88) = v146;
      *(_QWORD *)(v0 + 616) = objc_msgSendSuper2((objc_super *)(v0 + 80), "init");
      v154 = *(void (**)(uint64_t, uint64_t))(v144 + 8);
      *(_QWORD *)(v0 + 624) = v154;
      v154(v141, v143);
      v155 = (_QWORD *)swift_task_alloc(dword_100048384);
      *(_QWORD *)(v0 + 632) = v155;
      *v155 = v0;
      v155[1] = sub_1000198A0;
      return sub_100007E98();
    }
    else if (v14 == enum case for LaunchAngelXPCRequest.RequestType.handleLicenseResolution(_:))
    {
      v190 = (uint64_t *)(v0 + 152);
      v118 = *(_QWORD *)(v0 + 440);
      v119 = *(_QWORD *)(v0 + 320);
      v120 = *(_QWORD *)(v0 + 288);
      v121 = *(_QWORD *)(v0 + 296);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 432) + 96))(v118, *(_QWORD *)(v0 + 424));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v121 + 32))(v119, v118, v120);
      if (qword_100047FC8 != -1)
        swift_once(&qword_100047FC8, sub_1000286C4);
      v123 = *(_QWORD *)(v0 + 312);
      v122 = *(_QWORD *)(v0 + 320);
      v124 = *(_QWORD *)(v0 + 288);
      v125 = *(_QWORD *)(v0 + 296);
      v126 = type metadata accessor for Logger(0);
      sub_100007D98(v126, (uint64_t)qword_10004AD78);
      v127 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v125 + 16);
      v128 = v127(v123, v122, v124);
      v129 = Logger.logObject.getter(v128);
      v130 = static os_log_type_t.default.getter();
      v131 = os_log_type_enabled(v129, v130);
      v132 = *(_QWORD *)(v0 + 312);
      v133 = *(_QWORD *)(v0 + 296);
      if (v131)
      {
        *(_QWORD *)v180 = *(_QWORD *)(v0 + 288);
        v197 = v0;
        v184 = v127;
        v134 = (uint8_t *)swift_slowAlloc(12, -1);
        v135 = swift_slowAlloc(32, -1);
        v198[0] = v135;
        *(_DWORD *)v134 = 136446210;
        v136 = LicenseResolutionContext.logKey.getter(v135);
        v138 = v137;
        *v190 = sub_100030804(v136, v137, v198);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v190, v9, v134 + 4, v134 + 12);
        swift_bridgeObjectRelease(v138);
        v139 = *(void (**)(uint64_t, uint64_t))(v133 + 8);
        v139(v132, *(_QWORD *)v180);
        _os_log_impl((void *)&_mh_execute_header, v129, v130, "[%{public}s] Handling license resolution request", v134, 0xCu);
        swift_arrayDestroy(v135, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v135, -1, -1);
        v140 = v134;
        v127 = v184;
        v0 = v197;
        swift_slowDealloc(v140, -1, -1);
      }
      else
      {
        v139 = *(void (**)(uint64_t, uint64_t))(v133 + 8);
        v139(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 288));
      }

      *(_QWORD *)(v0 + 648) = v139;
      v156 = *(_QWORD *)(v0 + 304);
      v157 = *(_QWORD *)(v0 + 288);
      v127(v156, *(_QWORD *)(v0 + 320), v157);
      v158 = (objc_class *)type metadata accessor for LicenseResolutionTask(0);
      v159 = (char *)objc_allocWithZone(v158);
      *(_QWORD *)&v159[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_remoteHandle] = 0;
      v127((uint64_t)&v159[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_context], v156, v157);
      v160 = v159;
      v161 = LicenseResolutionContext.logKey.getter(v160);
      v163 = v162;
      v164 = (char *)objc_allocWithZone(v4);
      v165 = (uint64_t *)&v164[OBJC_IVAR____TtC26AppDistributionLaunchAngel6LogKey_stringValue];
      *v165 = v161;
      v165[1] = v163;
      *(_QWORD *)(v0 + 64) = v164;
      *(_QWORD *)(v0 + 72) = v4;
      *(_QWORD *)&v160[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey] = objc_msgSendSuper2((objc_super *)(v0 + 64), "init");

      *(_QWORD *)(v0 + 16) = v160;
      *(_QWORD *)(v0 + 24) = v158;
      *(_QWORD *)(v0 + 656) = objc_msgSendSuper2((objc_super *)(v0 + 16), "init");
      v139(v156, v157);
      v166 = (_QWORD *)swift_task_alloc(dword_100049214);
      *(_QWORD *)(v0 + 664) = v166;
      *v166 = v0;
      v166[1] = sub_100019A64;
      return sub_100023CEC();
    }
    else
    {
      return _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000018, 0x8000000100035AD0, "AppDistributionLaunchAngel/LaunchAngelService.swift", 51, 2, 71, 0);
    }
  }
}

uint64_t sub_10001912C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 512);
  *(_QWORD *)(*v1 + 520) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_1000192D8;
  }
  else
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v2 + 504));
    v4 = sub_100019198;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_100019198()
{
  uint64_t v0;
  void *v1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(void **)(v0 + 496);
  v2 = *(_QWORD *)(v0 + 416);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 408) + 104))(v2, enum case for LaunchAngelXPCResponse.ResponseType.ignored(_:), *(_QWORD *)(v0 + 400));
  LaunchAngelXPCResponse.init(responseType:)(v2);

  v4 = *(_QWORD *)(v0 + 480);
  v3 = *(_QWORD *)(v0 + 488);
  v6 = *(_QWORD *)(v0 + 464);
  v5 = *(_QWORD *)(v0 + 472);
  v7 = *(_QWORD *)(v0 + 440);
  v8 = *(_QWORD *)(v0 + 416);
  v10 = *(_QWORD *)(v0 + 384);
  v9 = *(_QWORD *)(v0 + 392);
  v11 = *(_QWORD *)(v0 + 376);
  v13 = *(_QWORD *)(v0 + 352);
  v14 = *(_QWORD *)(v0 + 344);
  v15 = *(_QWORD *)(v0 + 320);
  v16 = *(_QWORD *)(v0 + 312);
  v17 = *(_QWORD *)(v0 + 304);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 456) + 32))(*(_QWORD *)(v0 + 264), v6, *(_QWORD *)(v0 + 448));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc(v3);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000192D8()
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
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 504);
  v3 = *(_QWORD *)(v0 + 480);
  v2 = *(_QWORD *)(v0 + 488);
  v4 = *(_QWORD *)(v0 + 472);

  swift_bridgeObjectRelease(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v5 = *(_QWORD *)(v0 + 464);
  v6 = *(_QWORD *)(v0 + 440);
  v7 = *(_QWORD *)(v0 + 416);
  v9 = *(_QWORD *)(v0 + 384);
  v8 = *(_QWORD *)(v0 + 392);
  v10 = *(_QWORD *)(v0 + 376);
  v12 = *(_QWORD *)(v0 + 344);
  v11 = *(_QWORD *)(v0 + 352);
  v13 = *(_QWORD *)(v0 + 320);
  v15 = *(_QWORD *)(v0 + 312);
  v16 = *(_QWORD *)(v0 + 304);
  swift_task_dealloc(*(_QWORD *)(v0 + 488));
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000193D8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v5;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 544);
  *(_QWORD *)(*v1 + 552) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_100019450;
  }
  else
  {
    v5 = *(_QWORD *)(v2 + 536);
    swift_bridgeObjectRelease(*(_QWORD *)(v2 + 528));
    swift_bridgeObjectRelease(v5);
    v4 = sub_10001D25C;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_100019450()
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
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 536);
  v2 = *(_QWORD *)(v0 + 528);
  v3 = *(_QWORD *)(v0 + 488);
  v4 = *(_QWORD *)(v0 + 472);
  v5 = *(_QWORD *)(v0 + 480);

  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(v2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  v6 = *(_QWORD *)(v0 + 464);
  v7 = *(_QWORD *)(v0 + 440);
  v8 = *(_QWORD *)(v0 + 416);
  v10 = *(_QWORD *)(v0 + 384);
  v9 = *(_QWORD *)(v0 + 392);
  v11 = *(_QWORD *)(v0 + 376);
  v13 = *(_QWORD *)(v0 + 344);
  v12 = *(_QWORD *)(v0 + 352);
  v14 = *(_QWORD *)(v0 + 320);
  v16 = *(_QWORD *)(v0 + 312);
  v17 = *(_QWORD *)(v0 + 304);
  swift_task_dealloc(*(_QWORD *)(v0 + 488));
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001955C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v5;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 576);
  *(_QWORD *)(*v1 + 584) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_1000195D4;
  }
  else
  {
    v5 = *(_QWORD *)(v2 + 568);
    swift_bridgeObjectRelease(*(_QWORD *)(v2 + 560));
    swift_bridgeObjectRelease(v5);
    v4 = sub_10001D25C;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000195D4()
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
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 568);
  v2 = *(_QWORD *)(v0 + 560);
  v3 = *(_QWORD *)(v0 + 488);
  v4 = *(_QWORD *)(v0 + 472);
  v5 = *(_QWORD *)(v0 + 480);

  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(v2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  v6 = *(_QWORD *)(v0 + 464);
  v7 = *(_QWORD *)(v0 + 440);
  v8 = *(_QWORD *)(v0 + 416);
  v10 = *(_QWORD *)(v0 + 384);
  v9 = *(_QWORD *)(v0 + 392);
  v11 = *(_QWORD *)(v0 + 376);
  v13 = *(_QWORD *)(v0 + 344);
  v12 = *(_QWORD *)(v0 + 352);
  v14 = *(_QWORD *)(v0 + 320);
  v16 = *(_QWORD *)(v0 + 312);
  v17 = *(_QWORD *)(v0 + 304);
  swift_task_dealloc(*(_QWORD *)(v0 + 488));
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000196E0(char a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 608);
  *(_BYTE *)(*(_QWORD *)v1 + 137) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10001973C, 0, 0);
}

uint64_t sub_10001973C()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  void *v3;
  uint64_t v4;
  _BYTE *v5;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = *(void **)(v0 + 600);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 592);
  v3 = *(void **)(v0 + 496);
  v4 = *(_QWORD *)(v0 + 408);
  v5 = *(_BYTE **)(v0 + 416);
  v7 = *(_QWORD *)(v0 + 392);
  v6 = *(_QWORD *)(v0 + 400);
  v8 = *(_QWORD *)(v0 + 360);
  *v5 = *(_BYTE *)(v0 + 137);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v5, enum case for LaunchAngelXPCResponse.ResponseType.installSheetConfirmation(_:), v6);
  LaunchAngelXPCResponse.init(responseType:)(v5);

  v2(v7, v8);
  v10 = *(_QWORD *)(v0 + 480);
  v9 = *(_QWORD *)(v0 + 488);
  v12 = *(_QWORD *)(v0 + 464);
  v11 = *(_QWORD *)(v0 + 472);
  v13 = *(_QWORD *)(v0 + 440);
  v14 = *(_QWORD *)(v0 + 416);
  v16 = *(_QWORD *)(v0 + 384);
  v15 = *(_QWORD *)(v0 + 392);
  v17 = *(_QWORD *)(v0 + 376);
  v19 = *(_QWORD *)(v0 + 352);
  v20 = *(_QWORD *)(v0 + 344);
  v21 = *(_QWORD *)(v0 + 320);
  v22 = *(_QWORD *)(v0 + 312);
  v23 = *(_QWORD *)(v0 + 304);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 456) + 32))(*(_QWORD *)(v0 + 264), v12, *(_QWORD *)(v0 + 448));
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  swift_task_dealloc(v9);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000198A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 632);
  *(_QWORD *)(*(_QWORD *)v1 + 640) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_1000198FC, 0, 0);
}

uint64_t sub_1000198FC()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 624);
  v2 = *(void **)(v0 + 616);
  v3 = *(void **)(v0 + 496);
  v4 = *(_QWORD *)(v0 + 408);
  v5 = *(_QWORD **)(v0 + 416);
  v6 = *(_QWORD *)(v0 + 400);
  v7 = *(_QWORD *)(v0 + 352);
  v8 = *(_QWORD *)(v0 + 328);
  *v5 = *(_QWORD *)(v0 + 640);
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v4 + 104))(v5, enum case for LaunchAngelXPCResponse.ResponseType.oauthAuthorization(_:), v6);
  LaunchAngelXPCResponse.init(responseType:)(v5);

  v1(v7, v8);
  v10 = *(_QWORD *)(v0 + 480);
  v9 = *(_QWORD *)(v0 + 488);
  v12 = *(_QWORD *)(v0 + 464);
  v11 = *(_QWORD *)(v0 + 472);
  v13 = *(_QWORD *)(v0 + 440);
  v14 = *(_QWORD *)(v0 + 416);
  v16 = *(_QWORD *)(v0 + 384);
  v15 = *(_QWORD *)(v0 + 392);
  v17 = *(_QWORD *)(v0 + 376);
  v19 = *(_QWORD *)(v0 + 352);
  v20 = *(_QWORD *)(v0 + 344);
  v21 = *(_QWORD *)(v0 + 320);
  v22 = *(_QWORD *)(v0 + 312);
  v23 = *(_QWORD *)(v0 + 304);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 456) + 32))(*(_QWORD *)(v0 + 264), v12, *(_QWORD *)(v0 + 448));
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  swift_task_dealloc(v9);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100019A64()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 664));
  return swift_task_switch(sub_100019AB8, 0, 0);
}

uint64_t sub_100019AB8()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  void *v3;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = *(void **)(v0 + 656);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 648);
  v3 = *(void **)(v0 + 496);
  v4 = *(_QWORD *)(v0 + 416);
  v5 = *(_QWORD *)(v0 + 320);
  v6 = *(_QWORD *)(v0 + 288);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 408) + 104))(v4, enum case for LaunchAngelXPCResponse.ResponseType.ignored(_:), *(_QWORD *)(v0 + 400));
  LaunchAngelXPCResponse.init(responseType:)(v4);

  v2(v5, v6);
  v8 = *(_QWORD *)(v0 + 480);
  v7 = *(_QWORD *)(v0 + 488);
  v10 = *(_QWORD *)(v0 + 464);
  v9 = *(_QWORD *)(v0 + 472);
  v11 = *(_QWORD *)(v0 + 440);
  v12 = *(_QWORD *)(v0 + 416);
  v14 = *(_QWORD *)(v0 + 384);
  v13 = *(_QWORD *)(v0 + 392);
  v15 = *(_QWORD *)(v0 + 376);
  v17 = *(_QWORD *)(v0 + 352);
  v18 = *(_QWORD *)(v0 + 344);
  v19 = *(_QWORD *)(v0 + 320);
  v20 = *(_QWORD *)(v0 + 312);
  v21 = *(_QWORD *)(v0 + 304);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 456) + 32))(*(_QWORD *)(v0 + 264), v10, *(_QWORD *)(v0 + 448));
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  swift_task_dealloc(v7);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100019C18@<X0>(_QWORD *a1@<X8>)
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
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  void (*v15)(_BYTE *, _QWORD);
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[32];
  _QWORD v33[6];

  v29 = a1;
  v1 = sub_1000051F0(&qword_100048BB8);
  __chkstk_darwin(v1);
  v31 = (uint64_t)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1000051F0(&qword_100048BC0);
  __chkstk_darwin(v3);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = swift_allocBox(v1);
  v8 = v7;
  v9 = type metadata accessor for LaunchAngelXPCRequest(0);
  v30 = *(_QWORD *)(v9 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(v8, 1, 1, v9);
  v10 = type metadata accessor for PropertyListDecoder(0);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  v11 = PropertyListDecoder.init()();
  CodingUserInfoKey.init(rawValue:)(0x7265646F636564, 0xE700000000000000);
  v12 = type metadata accessor for CodingUserInfoKey(0);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v5, 1, v12);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v14 = swift_allocObject(&unk_100041F20, 32, 7);
    *(_QWORD *)(v14 + 16) = sub_10001C184;
    *(_QWORD *)(v14 + 24) = v6;
    v33[3] = sub_1000051F0(&qword_100048BC8);
    v33[0] = sub_10001C19C;
    v33[1] = v14;
    swift_retain(v6);
    v15 = (void (*)(_BYTE *, _QWORD))dispatch thunk of PropertyListDecoder.userInfo.modify(v32);
    sub_10001B178((uint64_t)v33, (uint64_t)v5);
    v15(v32, 0);
    v16 = sub_10001C1BC();
    __chkstk_darwin(v16);
    v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v18);
    v20 = Data.init<A>(_:)(v18, &type metadata for Data, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v16 + 8) + 8) + 8) + 8));
    v22 = v21;
    v23 = sub_10001C200();
    v24 = v33[5];
    dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(&type metadata for XPCDecoder, v20, v22, &type metadata for XPCDecoder, v23);
    if (v24)
    {
      swift_release(v11);
      sub_10000A064(v20, v22);
      v25 = v6;
      return swift_release(v25);
    }
    sub_10000A064(v20, v22);
    swift_beginAccess(v8, v32, 0, 0);
    v26 = v31;
    sub_10001C244(v8, v31, &qword_100048BB8);
    v27 = v30;
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v26, 1, v9);
    if ((_DWORD)result != 1)
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v27 + 32))(*v29, v26, v9);
      swift_release(v6);
      v25 = v11;
      return swift_release(v25);
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100019FF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(v8 + 72) = v12;
  *(_QWORD *)(v8 + 80) = v13;
  *(_OWORD *)(v8 + 56) = v11;
  *(_QWORD *)(v8 + 40) = a7;
  *(_QWORD *)(v8 + 48) = a8;
  *(_BYTE *)(v8 + 112) = a6;
  *(_QWORD *)(v8 + 24) = a4;
  *(_QWORD *)(v8 + 32) = a5;
  *(_QWORD *)(v8 + 16) = a1;
  v9 = sub_1000051F0(&qword_100048B60);
  *(_QWORD *)(v8 + 88) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10001A068, 0, 0);
}

void sub_10001A068()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  __int128 v10;
  __int128 v11;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v5 = *(_BYTE *)(v0 + 112);
  v6 = *(_QWORD *)(v0 + 24);
  v7 = type metadata accessor for Logger(0);
  v10 = *(_OWORD *)(v0 + 48);
  v11 = *(_OWORD *)(v0 + 72);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v1, 1, 1, v7);
  v8 = swift_task_alloc(96);
  *(_QWORD *)(v0 + 96) = v8;
  *(_QWORD *)(v8 + 16) = v3;
  *(_OWORD *)(v8 + 24) = v10;
  *(_QWORD *)(v8 + 40) = v2;
  *(_QWORD *)(v8 + 48) = v6;
  *(_QWORD *)(v8 + 56) = v4;
  *(_BYTE *)(v8 + 64) = v5;
  *(_OWORD *)(v8 + 72) = v11;
  *(_QWORD *)&v11 = (char *)&dword_100048B78 + dword_100048B78;
  v9 = (_QWORD *)swift_task_alloc(unk_100048B7C);
  *(_QWORD *)(v0 + 104) = v9;
  *v9 = v0;
  v9[1] = sub_10001A17C;
  __asm { BR              X8; sub_100016588 }
}

uint64_t sub_10001A17C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v1 = *(_QWORD *)(*v0 + 96);
  v2 = *(_QWORD *)(*v0 + 88);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 104));
  swift_task_dealloc(v1);
  sub_10000A0F0(v2, &qword_100048B60);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_10001A1E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v8 + 128) = v14;
  *(_QWORD *)(v8 + 136) = v15;
  *(_BYTE *)(v8 + 216) = a8;
  *(_QWORD *)(v8 + 112) = a6;
  *(_QWORD *)(v8 + 120) = a7;
  *(_QWORD *)(v8 + 96) = a4;
  *(_QWORD *)(v8 + 104) = a5;
  *(_QWORD *)(v8 + 80) = a2;
  *(_QWORD *)(v8 + 88) = a3;
  v9 = sub_1000051F0(&qword_100048B90);
  *(_QWORD *)(v8 + 144) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 152) = v10;
  v11 = *(_QWORD *)(v10 + 64);
  *(_QWORD *)(v8 + 160) = v11;
  v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v8 + 168) = swift_task_alloc(v12);
  *(_QWORD *)(v8 + 176) = swift_task_alloc(v12);
  *(_QWORD *)(v8 + 184) = swift_task_alloc(v12);
  *(_QWORD *)(v8 + 192) = swift_task_alloc(v12);
  return swift_task_switch(sub_10001A28C, 0, 0);
}

uint64_t sub_10001A28C()
{
  uint64_t v0;
  NSString v1;
  void *v2;
  int64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  id v10;
  unint64_t v11;
  unsigned __int8 v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, unint64_t, _QWORD);
  int *v57;
  _QWORD *v58;
  uint64_t *v59;
  uint64_t v60;
  int64_t v61;
  int64_t v62;
  int64_t v63;
  uint64_t (*v64)(_QWORD);
  uint64_t v65;

  v3 = v0 + 80;
  v2 = *(void **)(v0 + 80);
  if (!v2)
  {
    v11 = sub_10001BED8();
    v1 = (NSString)swift_allocError(&type metadata for AppDistributionLaunchAngelError, v11, 0, 0);
    swift_willThrow(v1);
LABEL_21:
    v5 = v3 - 64;
    v9 = v3 - 40;
    v63 = v3 - 24;
    if (qword_100047FC8 != -1)
      goto LABEL_29;
    goto LABEL_22;
  }
  v63 = v0 + 80;
  v4 = *(_QWORD *)(v0 + 88);
  v5 = v4 + 56;
  v6 = -1;
  v7 = -1 << *(_BYTE *)(v4 + 32);
  if (-v7 < 64)
    v6 = ~(-1 << -(char)v7);
  v8 = v6 & *(_QWORD *)(v4 + 56);
  v9 = (unint64_t)(63 - v7) >> 6;
  v10 = v2;
  swift_bridgeObjectRetain(v4);
  v3 = 0;
  while (1)
  {
    if (!v8)
    {
      v13 = v3 + 1;
      if (__OFADD__(v3, 1))
      {
        __break(1u);
        goto LABEL_28;
      }
      if (v13 >= v9)
        goto LABEL_26;
      v8 = *(_QWORD *)(v5 + 8 * v13);
      ++v3;
      if (!v8)
      {
        v3 = v13 + 1;
        if (v13 + 1 >= v9)
          goto LABEL_26;
        v8 = *(_QWORD *)(v5 + 8 * v3);
        if (!v8)
          break;
      }
    }
LABEL_7:
    v8 &= v8 - 1;
    v1 = String._bridgeToObjectiveC()();
    v12 = objc_msgSend(v10, "hasEntitlement:", v1);

    if ((v12 & 1) == 0)
    {
      v15 = *(_QWORD *)(v0 + 88);
      v16 = sub_10001BED8();
      v1 = (NSString)swift_allocError(&type metadata for AppDistributionLaunchAngelError, v16, 0, 0);
      swift_willThrow(v1);

      swift_release(v15);
      v3 = v0 + 80;
      goto LABEL_21;
    }
  }
  v14 = v13 + 2;
  if (v14 >= v9)
  {
LABEL_26:
    swift_release(*(_QWORD *)(v0 + 88));
    v57 = *(int **)(v0 + 96);
    v64 = (uint64_t (*)(_QWORD))((char *)v57 + *v57);
    v58 = (_QWORD *)swift_task_alloc(v57[1]);
    *(_QWORD *)(v0 + 200) = v58;
    *v58 = v0;
    v58[1] = sub_10001A870;
    return v64(*(_QWORD *)(v0 + 184));
  }
  v8 = *(_QWORD *)(v5 + 8 * v14);
  if (v8)
  {
    v3 = v14;
    goto LABEL_7;
  }
  while (1)
  {
    v3 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v3 >= v9)
      goto LABEL_26;
    v8 = *(_QWORD *)(v5 + 8 * v3);
    ++v14;
    if (v8)
      goto LABEL_7;
  }
LABEL_28:
  __break(1u);
LABEL_29:
  swift_once(&qword_100047FC8, sub_1000286C4);
LABEL_22:
  v17 = type metadata accessor for Logger(0);
  sub_100007D98(v17, (uint64_t)qword_10004AD78);
  swift_errorRetain(v1);
  v18 = swift_errorRetain(v1);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v61 = v5;
    v21 = *(_QWORD *)(v0 + 112);
    v22 = *(_QWORD *)(v0 + 120);
    v23 = *(unsigned __int8 *)(v0 + 216);
    v62 = v9;
    v24 = swift_slowAlloc(22, -1);
    v59 = (uint64_t *)swift_slowAlloc(8, -1);
    v60 = swift_slowAlloc(32, -1);
    v65 = v60;
    *(_DWORD *)v24 = 136315394;
    v25 = v22;
    v5 = v61;
    v26 = StaticString.description.getter(v21, v25, v23);
    v28 = v27;
    *(_QWORD *)(v0 + 64) = sub_100030804(v26, v27, &v65);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v3 - 16, v3 - 8, v24 + 4, v24 + 12);
    swift_bridgeObjectRelease(v28);
    *(_WORD *)(v24 + 12) = 2114;
    swift_errorRetain(v1);
    v29 = _swift_stdlib_bridgeErrorToNSError(v1);
    *(_QWORD *)(v0 + 72) = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v3 - 8, v3, v24 + 14, v24 + 22);
    *v59 = v29;
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Error in %s: %{public}@", (uint8_t *)v24, 0x16u);
    v30 = sub_1000051F0(&qword_1000483E8);
    swift_arrayDestroy(v59, 1, v30);
    swift_slowDealloc(v59, -1, -1);
    swift_arrayDestroy(v60, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v60, -1, -1);
    v31 = v24;
    v9 = v62;
    swift_slowDealloc(v31, -1, -1);
  }
  else
  {
    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }

  v32 = *(_QWORD *)(v0 + 192);
  v33 = *(uint64_t **)(v0 + 176);
  v34 = *(_QWORD *)(v0 + 144);
  swift_getErrorValue(v1, v63, v5);
  v35 = Error.localizedDescription.getter(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  v37 = v36;
  swift_errorRelease(v1);
  *v33 = v35;
  v33[1] = v37;
  swift_storeEnumTagMultiPayload(v33, v34, 1);
  sub_10001BF1C((uint64_t)v33, v32);
  v38 = *(_QWORD *)(v0 + 168);
  v39 = *(_QWORD *)(v0 + 176);
  v41 = *(_QWORD *)(v0 + 152);
  v40 = *(_QWORD *)(v0 + 160);
  sub_10001C244(*(_QWORD *)(v0 + 192), v38, &qword_100048B90);
  sub_10001C244(v38, v39, &qword_100048B90);
  v42 = *(unsigned __int8 *)(v41 + 80);
  v43 = (v42 + 16) & ~v42;
  v44 = swift_allocObject(&unk_100041EF8, v43 + v40, v42 | 7);
  sub_10001BF1C(v39, v44 + v43);
  v45 = type metadata accessor for PropertyListEncoder(0);
  swift_allocObject(v45, *(unsigned int *)(v45 + 48), *(unsigned __int16 *)(v45 + 52));
  v46 = PropertyListEncoder.init()();
  *(_QWORD *)(v0 + 40) = sub_10001BFF8;
  *(_QWORD *)(v0 + 48) = v44;
  v47 = sub_10001C044();
  v48 = dispatch thunk of PropertyListEncoder.encode<A>(_:)(v9, &type metadata for XPCEncoder, v47);
  v50 = v49;
  swift_release(v46);
  swift_release(v44);
  v52 = *(_QWORD *)(v0 + 184);
  v51 = *(_QWORD *)(v0 + 192);
  v54 = *(_QWORD *)(v0 + 168);
  v53 = *(_QWORD *)(v0 + 176);
  v55 = *(void (**)(uint64_t, unint64_t, _QWORD))(v0 + 128);
  sub_10000A0F0(v54, &qword_100048B90);
  v55(v48, v50, 0);
  sub_10000A064(v48, v50);
  sub_10000A0F0(v51, &qword_100048B90);
  swift_task_dealloc(v51);
  swift_task_dealloc(v52);
  swift_task_dealloc(v53);
  swift_task_dealloc(v54);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001A870()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 200);
  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_10001AA8C;
  else
    v3 = sub_10001A8D4;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_10001A8D4()
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
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, unint64_t, _QWORD);

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 144);

  swift_storeEnumTagMultiPayload(v1, v3, 0);
  sub_10001BF1C(v1, v2);
  v4 = *(_QWORD *)(v0 + 208);
  v5 = *(_QWORD *)(v0 + 168);
  v6 = *(_QWORD *)(v0 + 176);
  v8 = *(_QWORD *)(v0 + 152);
  v7 = *(_QWORD *)(v0 + 160);
  sub_10001C244(*(_QWORD *)(v0 + 192), v5, &qword_100048B90);
  sub_10001C244(v5, v6, &qword_100048B90);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v9 + 16) & ~v9;
  v11 = swift_allocObject(&unk_100041EF8, v10 + v7, v9 | 7);
  sub_10001BF1C(v6, v11 + v10);
  v12 = type metadata accessor for PropertyListEncoder(0);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  v13 = PropertyListEncoder.init()();
  *(_QWORD *)(v0 + 40) = sub_10001BFF8;
  *(_QWORD *)(v0 + 48) = v11;
  v14 = sub_10001C044();
  v15 = dispatch thunk of PropertyListEncoder.encode<A>(_:)(v0 + 40, &type metadata for XPCEncoder, v14);
  v17 = v16;
  swift_release(v13);
  swift_release(v11);
  if (v4)
  {
    swift_errorRelease(v4);
    v15 = 0;
    v17 = 0xC000000000000000;
  }
  v19 = *(_QWORD *)(v0 + 184);
  v18 = *(_QWORD *)(v0 + 192);
  v21 = *(_QWORD *)(v0 + 168);
  v20 = *(_QWORD *)(v0 + 176);
  v22 = *(void (**)(uint64_t, unint64_t, _QWORD))(v0 + 128);
  sub_10000A0F0(v21, &qword_100048B90);
  v22(v15, v17, 0);
  sub_10000A064(v15, v17);
  sub_10000A0F0(v18, &qword_100048B90);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001AA8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
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
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, unint64_t, _QWORD);
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;

  v1 = v0 + 16;
  v2 = v0 + 40;

  v3 = *(_QWORD *)(v0 + 208);
  if (qword_100047FC8 != -1)
    swift_once(&qword_100047FC8, sub_1000286C4);
  v4 = type metadata accessor for Logger(0);
  sub_100007D98(v4, (uint64_t)qword_10004AD78);
  swift_errorRetain(v3);
  v5 = swift_errorRetain(v3);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(_QWORD *)(v0 + 112);
    v9 = *(_QWORD *)(v0 + 120);
    v10 = *(unsigned __int8 *)(v0 + 216);
    v11 = swift_slowAlloc(22, -1);
    v44 = (uint64_t *)swift_slowAlloc(8, -1);
    v45 = swift_slowAlloc(32, -1);
    v46 = v45;
    *(_DWORD *)v11 = 136315394;
    v12 = v10;
    v1 = v0 + 16;
    v13 = StaticString.description.getter(v8, v9, v12);
    v15 = v14;
    *(_QWORD *)(v0 + 64) = sub_100030804(v13, v14, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease(v15);
    *(_WORD *)(v11 + 12) = 2114;
    swift_errorRetain(v3);
    v16 = _swift_stdlib_bridgeErrorToNSError(v3);
    *(_QWORD *)(v0 + 72) = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 72, v0 + 80, v11 + 14, v11 + 22);
    *v44 = v16;
    swift_errorRelease(v3);
    swift_errorRelease(v3);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Error in %s: %{public}@", (uint8_t *)v11, 0x16u);
    v17 = sub_1000051F0(&qword_1000483E8);
    swift_arrayDestroy(v44, 1, v17);
    swift_slowDealloc(v44, -1, -1);
    swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v45, -1, -1);
    v18 = v11;
    v2 = v0 + 40;
    swift_slowDealloc(v18, -1, -1);
  }
  else
  {
    swift_errorRelease(v3);
    swift_errorRelease(v3);
  }

  v19 = *(_QWORD *)(v0 + 192);
  v20 = *(uint64_t **)(v0 + 176);
  v21 = *(_QWORD *)(v0 + 144);
  swift_getErrorValue(v3, v0 + 56, v1);
  v22 = Error.localizedDescription.getter(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  v24 = v23;
  swift_errorRelease(v3);
  *v20 = v22;
  v20[1] = v24;
  swift_storeEnumTagMultiPayload(v20, v21, 1);
  sub_10001BF1C((uint64_t)v20, v19);
  v25 = *(_QWORD *)(v0 + 168);
  v26 = *(_QWORD *)(v0 + 176);
  v28 = *(_QWORD *)(v0 + 152);
  v27 = *(_QWORD *)(v0 + 160);
  sub_10001C244(*(_QWORD *)(v0 + 192), v25, &qword_100048B90);
  sub_10001C244(v25, v26, &qword_100048B90);
  v29 = *(unsigned __int8 *)(v28 + 80);
  v30 = (v29 + 16) & ~v29;
  v31 = swift_allocObject(&unk_100041EF8, v30 + v27, v29 | 7);
  sub_10001BF1C(v26, v31 + v30);
  v32 = type metadata accessor for PropertyListEncoder(0);
  swift_allocObject(v32, *(unsigned int *)(v32 + 48), *(unsigned __int16 *)(v32 + 52));
  v33 = PropertyListEncoder.init()();
  *(_QWORD *)(v0 + 40) = sub_10001BFF8;
  *(_QWORD *)(v0 + 48) = v31;
  v34 = sub_10001C044();
  v35 = dispatch thunk of PropertyListEncoder.encode<A>(_:)(v2, &type metadata for XPCEncoder, v34);
  v37 = v36;
  swift_release(v33);
  swift_release(v31);
  v39 = *(_QWORD *)(v0 + 184);
  v38 = *(_QWORD *)(v0 + 192);
  v41 = *(_QWORD *)(v0 + 168);
  v40 = *(_QWORD *)(v0 + 176);
  v42 = *(void (**)(uint64_t, unint64_t, _QWORD))(v0 + 128);
  sub_10000A0F0(v41, &qword_100048B90);
  v42(v35, v37, 0);
  sub_10000A064(v35, v37);
  sub_10000A0F0(v38, &qword_100048B90);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_10001AED0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchAngelService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LaunchAngelService()
{
  return objc_opt_self(_TtC26AppDistributionLaunchAngel18LaunchAngelService);
}

uint64_t sub_10001AF20()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10001AF44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  Class isa;

  v5 = *(_QWORD *)(v3 + 16);
  isa = Data._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class, uint64_t))(v5 + 16))(v5, isa, a3);

}

uint64_t sub_10001AF8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  __int16 timestamp;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = v3;
  v8 = ((uint64_t (*)(void))StaticString.description.getter)();
  v10 = v9;
  v11 = String.utf8CString.getter(v8);
  swift_bridgeObjectRelease(v10);
  v12 = os_transaction_create(v11 + 32);
  result = swift_release(v11);
  if (v12)
  {
    *(_QWORD *)(v4 + 16) = v12;
    timestamp = os_transaction_get_timestamp(v12);
    if (qword_100047FB8 != -1)
      swift_once(&qword_100047FB8, sub_100028684);
    v15 = type metadata accessor for Logger(0);
    v16 = sub_100007D98(v15, (uint64_t)qword_10004AD48);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = swift_slowAlloc(16, -1);
      v20 = swift_slowAlloc(32, -1);
      v25 = v20;
      *(_DWORD *)v19 = 33554946;
      LOWORD(v24) = timestamp;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, (char *)&v24 + 2, v19 + 4, v19 + 6);
      *(_WORD *)(v19 + 6) = 2080;
      v21 = StaticString.description.getter(a1, a2, a3);
      v23 = v22;
      v24 = sub_100030804(v21, v22, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v19 + 8, v19 + 16);
      swift_bridgeObjectRelease(v23);
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[TXN%hx] 🐏 Beginning transaction (%s)", (uint8_t *)v19, 0x10u);
      swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1, -1);
      swift_slowDealloc(v19, -1, -1);
    }

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001B178(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _OWORD v10[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_10001C288((_OWORD *)a1, v10);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
    v9 = *v2;
    *v2 = 0x8000000000000000;
    sub_10002C934(v10, a2, isUniquelyReferenced_nonNull_native);
    v5 = *v2;
    *v2 = v9;
    swift_bridgeObjectRelease(v5);
    v6 = type metadata accessor for CodingUserInfoKey(0);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a2, v6);
  }
  else
  {
    sub_10000A0F0(a1, &qword_100048430);
    sub_10001B580(a2, v10);
    v8 = type metadata accessor for CodingUserInfoKey(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a2, v8);
    return sub_10000A0F0((uint64_t)v10, &qword_100048430);
  }
}

uint64_t sub_10001B25C(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  v4 = sub_1000051F0(&qword_100048B90);
  v5 = sub_10001C088();
  v6 = a1[3];
  v7 = a1[4];
  sub_10001C118(a1, v6);
  v8 = dispatch thunk of Encoder.unkeyedContainer()(v16, v6, v7);
  v9 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v4);
  v12 = v17;
  v13 = v18;
  sub_10001C13C((uint64_t)v16, v17);
  dispatch thunk of UnkeyedEncodingContainer.encode<A>(_:)(v11, v4, v5, v12, v13);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v4);
  return sub_10001C164(v16);
}

_QWORD *sub_10001B37C(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *result;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[24];
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v5 = sub_1000051F0(&qword_100048BB8);
  __chkstk_darwin(v5);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = swift_projectBox(a2);
  v9 = a1[3];
  v10 = a1[4];
  sub_10001C118(a1, v9);
  result = dispatch thunk of Decoder.unkeyedContainer()(v17, v9, v10);
  if (!v2)
  {
    v12 = type metadata accessor for LaunchAngelXPCRequest(0);
    v13 = sub_10001C298();
    v14 = v18;
    v15 = v19;
    sub_10001C13C((uint64_t)v17, v18);
    dispatch thunk of UnkeyedDecodingContainer.decode<A>(_:)(v12, v12, v13, v14, v15);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 0, 1, v12);
    swift_beginAccess(v8, v16, 1, 0);
    sub_10001C2E0((uint64_t)v7, v8);
    return (_QWORD *)sub_10001C164(v17);
  }
  return result;
}

uint64_t sub_10001B4D0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10001B534;
  return v6(a1);
}

uint64_t sub_10001B534()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

double sub_10001B580@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double result;
  uint64_t v15;

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  v7 = sub_10002AEB4(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v10 = *v3;
    v15 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10002B964();
      v10 = v15;
    }
    v11 = *(_QWORD *)(v10 + 48);
    v12 = type metadata accessor for CodingUserInfoKey(0);
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11 + *(_QWORD *)(*(_QWORD *)(v12 - 8) + 72) * v7, v12);
    sub_10001C288((_OWORD *)(*(_QWORD *)(v10 + 56) + 32 * v7), a2);
    sub_10001B67C(v7, v10);
    v13 = *v3;
    *v3 = v10;
    swift_bridgeObjectRelease(v13);
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

unint64_t sub_10001B67C(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  _OWORD *v26;
  __int128 v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, unint64_t, uint64_t);
  unint64_t v36;
  uint64_t v37;

  v4 = type metadata accessor for CodingUserInfoKey(0);
  v37 = *(_QWORD *)(v4 - 8);
  result = __chkstk_darwin(v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = _HashTable.previousHole(before:)(a1, a2 + 64, ~v9);
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v36 = (result + 1) & v11;
      v12 = *(_QWORD *)(v37 + 72);
      v35 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v35(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        v18 = dispatch thunk of Hashable._rawHashValue(seed:)(*(_QWORD *)(a2 + 40), v4, &protocol witness table for CodingUserInfoKey);
        result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v36)
        {
          if (v19 >= v36 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v22 = *(_QWORD *)(a2 + 48);
            result = v22 + v15 * a1;
            v23 = v22 + v16;
            v8 = v14;
            if (v15 * a1 < v16 || (v12 = v15, result >= v23 + v15))
            {
              result = swift_arrayInitWithTakeFrontToBack(result, v23, 1, v4);
LABEL_21:
              v12 = v15;
              v13 = v17;
            }
            else if (v15 * a1 != v16)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v24 = *(_QWORD *)(a2 + 56);
            v25 = (_OWORD *)(v24 + 32 * a1);
            v26 = (_OWORD *)(v24 + 32 * v10);
            if (a1 != v10 || (a1 = v10, v25 >= v26 + 2))
            {
              v27 = v26[1];
              *v25 = *v26;
              v25[1] = v27;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v36 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
        v12 = v15;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v28;
    v30 = (-1 << a1) - 1;
  }
  else
  {
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v30 = *v28;
    v29 = (-1 << a1) - 1;
  }
  *v28 = v30 & v29;
  v31 = *(_QWORD *)(a2 + 16);
  v32 = __OFSUB__(v31, 1);
  v33 = v31 - 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v33;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10001B900(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_10001B968;
  return v5(v2 + 32);
}

uint64_t sub_10001B968()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 24));
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_10001B9B8()
{
  return 2;
}

uint64_t sub_10001B9C0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  Swift::Int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;

  v8 = sub_1000051F0(&qword_100048300);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v24 - v12;
  swift_retain(a4);
  v14 = sub_1000251AC((uint64_t)&off_100041500);
  v15 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v13, 1, 1, v15);
  v16 = swift_allocObject(&unk_100041E80, 32, 7);
  *(_QWORD *)(v16 + 16) = a1;
  *(_QWORD *)(v16 + 24) = a2;
  v17 = (void *)objc_opt_self(BSServiceConnection);
  sub_10000A020(a1, a2);
  v18 = objc_msgSend(v17, "currentContext");
  if (v18)
  {
    v19 = v18;
    v20 = objc_msgSend(v18, "remoteToken");

  }
  else
  {
    v20 = 0;
  }
  sub_10001C244((uint64_t)v13, (uint64_t)v11, &qword_100048300);
  v21 = swift_allocObject(&unk_100041EA8, 104, 7);
  *(_QWORD *)(v21 + 16) = 0;
  *(_QWORD *)(v21 + 24) = 0;
  *(_QWORD *)(v21 + 32) = "handleXPCRequest";
  *(_QWORD *)(v21 + 40) = 16;
  *(_BYTE *)(v21 + 48) = 2;
  *(_QWORD *)(v21 + 56) = v20;
  *(_QWORD *)(v21 + 64) = v14;
  *(_QWORD *)(v21 + 72) = &unk_100048B40;
  *(_QWORD *)(v21 + 80) = v16;
  *(_QWORD *)(v21 + 88) = a3;
  *(_QWORD *)(v21 + 96) = a4;
  swift_bridgeObjectRetain(v14);
  swift_retain(v16);
  v22 = sub_1000162E8((uint64_t)v11, (uint64_t)&unk_100048B50, v21);
  swift_bridgeObjectRelease(v14);
  swift_release(v16);
  swift_release(v22);
  return sub_10000A0F0((uint64_t)v13, &qword_100048300);
}

uint64_t sub_10001BBC4()
{
  uint64_t v0;

  sub_10000A064(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001BBE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc(dword_100048B3C);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10001463C;
  return sub_100017B70(a1, v5, v4);
}

uint64_t sub_10001BC4C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));
  swift_release(*(_QWORD *)(v0 + 80));
  swift_release(*(_QWORD *)(v0 + 96));
  return swift_deallocObject(v0, 104, 7);
}

uint64_t sub_10001BC90(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _QWORD *v10;
  uint64_t v12;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 64);
  v12 = *(_QWORD *)(v1 + 56);
  v9 = *(_BYTE *)(v1 + 48);
  v10 = (_QWORD *)swift_task_alloc(dword_100048B4C);
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_100007C7C;
  return sub_100019FF0(a1, v4, v5, v6, v7, v9, v12, v8);
}

uint64_t sub_10001BD48()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001BD6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _QWORD *v10;
  uint64_t v12;

  v4 = *(_QWORD *)(v1 + 24);
  v12 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 32);
  v6 = *(_QWORD *)(v1 + 40);
  v7 = *(_QWORD *)(v1 + 48);
  v8 = *(_QWORD *)(v1 + 56);
  v9 = *(_BYTE *)(v1 + 64);
  v10 = (_QWORD *)swift_task_alloc(dword_100048B6C);
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_100007C7C;
  return sub_10001A1E8(a1, v12, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_10001BE14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100048B84);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10001463C;
  v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v6 = (_QWORD *)swift_task_alloc(v4[1]);
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_100007C7C;
  return v8(a1);
}

uint64_t sub_10001BE9C(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result != 1)
  {
    swift_release(result);
    swift_release(a2);
    return swift_release(a3);
  }
  return result;
}

unint64_t sub_10001BED8()
{
  unint64_t result;

  result = qword_100048B98;
  if (!qword_100048B98)
  {
    result = swift_getWitnessTable(&unk_100033B50, &type metadata for AppDistributionLaunchAngelError);
    atomic_store(result, (unint64_t *)&qword_100048B98);
  }
  return result;
}

uint64_t sub_10001BF1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000051F0(&qword_100048B90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001BF64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_1000051F0(&qword_100048B90);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v1) == 1)
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + v4 + 8));
  }
  else
  {
    v6 = type metadata accessor for LaunchAngelXPCResponse(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v0 + v4, v6);
  }
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10001BFF8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_1000051F0(&qword_100048B90) - 8) + 80);
  return sub_10001B25C(a1, v1 + ((v3 + 16) & ~v3));
}

unint64_t sub_10001C044()
{
  unint64_t result;

  result = qword_100048BA0;
  if (!qword_100048BA0)
  {
    result = swift_getWitnessTable(&unk_1000343FC, &type metadata for XPCEncoder);
    atomic_store(result, (unint64_t *)&qword_100048BA0);
  }
  return result;
}

unint64_t sub_10001C088()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100048BA8;
  if (!qword_100048BA8)
  {
    v1 = sub_10001C0D4(&qword_100048B90);
    result = swift_getWitnessTable(&unk_100033B28, v1);
    atomic_store(result, (unint64_t *)&qword_100048BA8);
  }
  return result;
}

uint64_t sub_10001C0D4(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *sub_10001C118(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10001C13C(uint64_t a1, uint64_t a2)
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

uint64_t sub_10001C164(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *sub_10001C184(_QWORD *a1)
{
  uint64_t v1;

  return sub_10001B37C(a1, v1);
}

uint64_t sub_10001C19C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_10001C1BC()
{
  unint64_t result;

  result = qword_100048BD0;
  if (!qword_100048BD0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_100048BD0);
  }
  return result;
}

unint64_t sub_10001C200()
{
  unint64_t result;

  result = qword_100048BD8;
  if (!qword_100048BD8)
  {
    result = swift_getWitnessTable(&unk_1000343D4, &type metadata for XPCDecoder);
    atomic_store(result, (unint64_t *)&qword_100048BD8);
  }
  return result;
}

uint64_t sub_10001C244(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000051F0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_10001C288(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_10001C298()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100048BE0;
  if (!qword_100048BE0)
  {
    v1 = type metadata accessor for LaunchAngelXPCRequest(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAngelXPCRequest, v1);
    atomic_store(result, (unint64_t *)&qword_100048BE0);
  }
  return result;
}

uint64_t sub_10001C2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000051F0(&qword_100048BB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001C328(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100048BEC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10001463C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100048BE8 + dword_100048BE8))(a1, v4);
}

uint64_t sub_10001C3A4()
{
  return 0;
}

ValueMetadata *type metadata accessor for AppDistributionLaunchAngelError()
{
  return &type metadata for AppDistributionLaunchAngelError;
}

uint64_t sub_10001C3BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_10001C3C4(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = swift_checkMetadataState(319, *(_QWORD *)(a1 + 16));
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = &unk_100033A48;
    swift_initEnumMetadataMultiPayload(a1, 0, 2, v4);
    return 0;
  }
  return result;
}

uint64_t *sub_10001C434(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x10uLL)
    v5 = 16;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
    swift_retain(v8);
  }
  else
  {
    v9 = *((unsigned __int8 *)a2 + v5);
    if (v9 >= 2)
    {
      if (v5 <= 3)
        v10 = v5;
      else
        v10 = 4;
      __asm { BR              X13 }
    }
    if (v9 == 1)
    {
      v11 = a2[1];
      *v3 = *a2;
      v3[1] = v11;
      *((_BYTE *)v3 + v5) = 1;
      swift_bridgeObjectRetain(v11);
    }
    else
    {
      (*(void (**)(uint64_t *))(v4 + 16))(a1);
      *((_BYTE *)v3 + v5) = 0;
    }
  }
  return v3;
}

uint64_t sub_10001C54C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 0x10)
    v3 = 16;
  v4 = *(unsigned __int8 *)(a1 + v3);
  if (v4 < 2)
  {
    if (v4 == 1)
      return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
    else
      return (*(uint64_t (**)(void))(v2 + 8))();
  }
  else
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    return ((uint64_t (*)(void))((char *)&loc_10001C594 + 4 * byte_100033995[v5]))();
  }
}

_QWORD *sub_10001C5EC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x10uLL)
    v5 = 16;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    swift_bridgeObjectRetain(v8);
    v9 = 1;
  }
  else
  {
    (*(void (**)(_QWORD *))(v4 + 16))(a1);
    v9 = 0;
  }
  *((_BYTE *)a1 + v5) = v9;
  return a1;
}

_QWORD *sub_10001C6C4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x10uLL)
      v7 = 16;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      swift_bridgeObjectRelease(a1[1]);
    else
      (*(void (**)(_QWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    v10 = *((unsigned __int8 *)a2 + v7);
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      *a1 = *a2;
      v12 = a2[1];
      a1[1] = v12;
      *((_BYTE *)a1 + v7) = 1;
      swift_bridgeObjectRetain(v12);
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
      *((_BYTE *)a1 + v7) = 0;
    }
  }
  return a1;
}

_OWORD *sub_10001C85C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x10uLL)
    v5 = 16;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    *a1 = *a2;
    v8 = 1;
  }
  else
  {
    (*(void (**)(_OWORD *))(v4 + 32))(a1);
    v8 = 0;
  }
  *((_BYTE *)a1 + v5) = v8;
  return a1;
}

uint64_t sub_10001C930(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char v12;

  if ((_OWORD *)a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x10uLL)
      v7 = 16;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(a1 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
    else
      (*(void (**)(uint64_t, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    v10 = *((unsigned __int8 *)a2 + v7);
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      *(_OWORD *)a1 = *a2;
      v12 = 1;
    }
    else
    {
      (*(void (**)(uint64_t, _OWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      v12 = 0;
    }
    *(_BYTE *)(a1 + v7) = v12;
  }
  return a1;
}

uint64_t sub_10001CABC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = 16;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) > 0x10uLL)
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_21;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 254) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_21:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 2)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_21;
LABEL_14:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 255);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_10001CB80 + 4 * byte_1000339B8[(v4 - 1)]))();
}

void sub_10001CBCC(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x10)
    v5 = 16;
  v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = &dword_100000004;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = &_mh_execute_header.magic + 1;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v8 = a2 - 255;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_10001CD74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 16;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 0x10uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_10001CDBC + 4 * byte_1000339C6[v3]))();
}

void sub_10001CE04(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 0x10uLL)
    v4 = 16;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 1)
  {
    v5 = a2 - 2;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t type metadata accessor for AppDistributionLaunchAngelServiceResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001CF44(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AppDistributionLaunchAngelServiceResult);
}

unint64_t sub_10001CEDC()
{
  unint64_t result;

  result = qword_100048C80;
  if (!qword_100048C80)
  {
    result = swift_getWitnessTable(&unk_100033B00, &type metadata for AppDistributionLaunchAngelError);
    atomic_store(result, (unint64_t *)&qword_100048C80);
  }
  return result;
}

uint64_t type metadata accessor for AppDistributionLaunchAngelServiceResult.FailureCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001CF44(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AppDistributionLaunchAngelServiceResult.FailureCodingKeys);
}

uint64_t type metadata accessor for AppDistributionLaunchAngelServiceResult.SuccessCodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001CF44(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AppDistributionLaunchAngelServiceResult.SuccessCodingKeys);
}

uint64_t type metadata accessor for AppDistributionLaunchAngelServiceResult.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001CF44(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AppDistributionLaunchAngelServiceResult.CodingKeys);
}

uint64_t sub_10001CF44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t sub_10001CF70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

_BYTE *sub_10001CF78(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_10001CF84(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_10001D014(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001D060 + 4 * byte_1000339D0[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10001D094 + 4 * byte_1000339CB[v4]))();
}

uint64_t sub_10001D094(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001D09C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001D0A4);
  return result;
}

uint64_t sub_10001D0B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001D0B8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10001D0BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001D0C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001D0D0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10001D0D8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

uint64_t getEnumTagSinglePayload for LaunchAngelEntitlements(unsigned int *a1, int a2)
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

uint64_t _s26AppDistributionLaunchAngel31AppDistributionLaunchAngelErrorOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10001D174 + 4 * byte_1000339D5[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10001D194 + 4 * byte_1000339DA[v4]))();
}

_BYTE *sub_10001D174(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10001D194(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10001D19C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10001D1A4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10001D1AC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10001D1B4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_10001D1C0(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100033C98, a1);
}

uint64_t sub_10001D1D0(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100033D50, a1);
}

uint64_t sub_10001D1E0(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100033E08, a1);
}

uint64_t sub_10001D1F0(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100033D78, a1);
}

uint64_t sub_10001D200(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100033DA0, a1);
}

uint64_t sub_10001D210(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100033CC0, a1);
}

uint64_t sub_10001D220(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100033CE8, a1);
}

uint64_t sub_10001D230(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100033C08, a1);
}

uint64_t sub_10001D240(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100033C30, a1);
}

void sub_10001D578(char a1)
{
  void *v1;
  void *v2;
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
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __n128 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __n128 v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __n128 v44;
  char *v45;
  void *v46;
  NSString v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  NSURL *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t aBlock[5];
  uint64_t v66;
  objc_super v67;

  v2 = v1;
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v62 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v9 = (char *)&v57 - v8;
  v11 = type metadata accessor for MainActor(0, v10);
  v12 = static MainActor.shared.getter(v11);
  v13 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
  v15 = v14;
  if ((swift_task_isCurrentExecutor(v13) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 37, v13, v15);
  v63 = v5;
  v16 = (objc_class *)type metadata accessor for OAuthAuthorizationViewController(0);
  v67.receiver = v2;
  v67.super_class = v16;
  objc_msgSendSuper2(&v67, "viewDidAppear:", a1 & 1);
  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v17 = type metadata accessor for Logger(0);
  sub_100007D98(v17, (uint64_t)qword_10004AD30);
  v18 = v2;
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, (os_log_type_t)v20))
  {
    v59 = v20;
    v60 = v4;
    v61 = v12;
    v21 = swift_slowAlloc(22, -1);
    v22 = swift_slowAlloc(64, -1);
    v58 = v22;
    aBlock[0] = v22;
    *(_DWORD *)v21 = 136315395;
    v23 = static MainActor.shared.getter(v22);
    v24 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
    v26 = v25;
    if ((swift_task_isCurrentExecutor(v24) & 1) == 0)
      v27 = swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 40, v24, v26);
    v28 = OAuthAuthorizationContext.logKey.getter(v27);
    v30 = v29;
    swift_release(v23);
    v64 = sub_100030804(v28, v30, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, aBlock, v21 + 4, v21 + 12);

    v31 = swift_bridgeObjectRelease(v30);
    *(_WORD *)(v21 + 12) = 2085;
    v32 = static MainActor.shared.getter(v31);
    v33 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
    v35 = v34;
    if ((swift_task_isCurrentExecutor(v33) & 1) == 0)
      v36 = swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 40, v33, v35);
    OAuthAuthorizationContext.requestURL.getter(v36);
    swift_release(v32);
    v37 = sub_100007E48();
    v4 = v60;
    v38 = dispatch thunk of CustomStringConvertible.description.getter(v60, v37);
    v40 = v39;
    v41 = v63;
    (*(void (**)(char *, uint64_t))(v63 + 8))(v9, v4);
    v64 = sub_100030804(v38, v40, aBlock);
    v42 = v41;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, aBlock, v21 + 14, v21 + 22);

    swift_bridgeObjectRelease(v40);
    _os_log_impl((void *)&_mh_execute_header, v19, (os_log_type_t)v59, "[%s] Activating web authentication request: %{sensitive}s", (uint8_t *)v21, 0x16u);
    v43 = v58;
    swift_arrayDestroy(v58, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v43, -1, -1);
    swift_slowDealloc(v21, -1, -1);

    v12 = v61;
  }
  else
  {

    v42 = v63;
  }
  v45 = v62;
  OAuthAuthorizationContext.requestURL.getter(v44);
  v46 = (void *)objc_opt_self(ASWebAuthenticationSessionCallback);
  v47 = String._bridgeToObjectiveC()();
  v48 = objc_msgSend(v46, "callbackWithCustomScheme:", v47);

  v49 = swift_allocObject(&unk_100042338, 24, 7);
  *(_QWORD *)(v49 + 16) = v18;
  v50 = objc_allocWithZone((Class)ASWebAuthenticationSession);
  v51 = v18;
  URL._bridgeToObjectiveC()(v52);
  v54 = v53;
  aBlock[4] = (uint64_t)sub_10001F12C;
  v66 = v49;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10001ED88;
  aBlock[3] = (uint64_t)&unk_100042350;
  v55 = _Block_copy(aBlock);
  v56 = objc_msgSend(v50, "initWithURL:callback:completionHandler:", v54, v48, v55);
  _Block_release(v55);

  (*(void (**)(char *, uint64_t))(v42 + 8))(v45, v4);
  swift_release(v66);
  objc_msgSend(v56, "setPrefersEphemeralWebBrowserSession:", 1);
  objc_msgSend(v56, "setPresentationContextProvider:", v51);
  objc_msgSend(v56, "start");
  swift_release(v12);

}

void sub_10001DAE8(uint64_t a1, uint64_t a2, void *a3)
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
  id v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __n128 v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  void *v46;
  char *v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __n128 v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  void (*v72)(char *, uint64_t);
  os_log_t v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  NSString v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  os_log_t v85;
  id v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;

  v6 = sub_1000051F0(&qword_100048980);
  __chkstk_darwin(v6);
  v8 = (char *)&v83 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v87 = (char *)&v83 - v14;
  v16 = type metadata accessor for MainActor(0, v15);
  v88 = static MainActor.shared.getter(v16);
  v17 = dispatch thunk of Actor.unownedExecutor.getter(v16, &protocol witness table for MainActor);
  v19 = v18;
  if ((swift_task_isCurrentExecutor(v17) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 42, v17, v19);
  sub_10001F174(a1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10001F134((uint64_t)v8);
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v20 = type metadata accessor for Logger(0);
    sub_100007D98(v20, (uint64_t)qword_10004AD30);
    v21 = a3;
    swift_errorRetain(a2);
    v22 = v21;
    v23 = swift_errorRetain(a2);
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = swift_slowAlloc(22, -1);
      v27 = swift_slowAlloc(64, -1);
      v87 = (char *)v27;
      v90 = v27;
      *(_DWORD *)v26 = 136446466;
      v28 = static MainActor.shared.getter(v27);
      v29 = dispatch thunk of Actor.unownedExecutor.getter(v16, &protocol witness table for MainActor);
      v31 = v30;
      if ((swift_task_isCurrentExecutor(v29) & 1) == 0)
        v32 = swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 52, v29, v31);
      v33 = OAuthAuthorizationContext.logKey.getter(v32);
      v35 = v34;
      swift_release(v28);
      v89 = sub_100030804(v33, v35, &v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v89, &v90, v26 + 4, v26 + 12);

      v36 = swift_bridgeObjectRelease(v35);
      *(_WORD *)(v26 + 12) = 2082;
      v37 = static MainActor.shared.getter(v36);
      v38 = dispatch thunk of Actor.unownedExecutor.getter(v16, &protocol witness table for MainActor);
      v40 = v39;
      if ((swift_task_isCurrentExecutor(v38) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 52, v38, v40);
      v89 = a2;
      swift_errorRetain(a2);
      v41 = sub_1000051F0((uint64_t *)&unk_100048EC0);
      v42 = String.init<A>(describing:)(&v89, v41);
      v44 = v43;
      swift_release(v37);
      v89 = sub_100030804(v42, v44, &v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v89, &v90, v26 + 14, v26 + 22);
      swift_bridgeObjectRelease(v44);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%{public}s] Authentication failed: %{public}s", (uint8_t *)v26, 0x16u);
      v45 = v87;
      swift_arrayDestroy(v87, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v45, -1, -1);
      swift_slowDealloc(v26, -1, -1);

      if (a2)
        goto LABEL_12;
    }
    else
    {

      swift_errorRelease(a2);
      swift_errorRelease(a2);

      if (a2)
      {
LABEL_12:
        swift_errorRetain(a2);
        v46 = (void *)_convertErrorToNSError(_:)(a2);
        swift_errorRelease(a2);
LABEL_23:
        v75 = objc_msgSend((id)objc_opt_self(BSActionResponse), "responseForError:", v46);

        sub_10001E5A4((uint64_t)v75, v76);
        swift_release(v88);

        return;
      }
    }
    v46 = 0;
    goto LABEL_23;
  }
  v47 = v87;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v87, v8, v9);
  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v48 = type metadata accessor for Logger(0);
  sub_100007D98(v48, (uint64_t)qword_10004AD30);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v47, v9);
  v49 = a3;
  v50 = Logger.logObject.getter(v49);
  v51 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v50, (os_log_type_t)v51))
  {
    v84 = v51;
    v85 = v50;
    v86 = v49;
    v52 = swift_slowAlloc(22, -1);
    v53 = swift_slowAlloc(64, -1);
    v83 = v53;
    v90 = v53;
    *(_DWORD *)v52 = 136446467;
    v54 = static MainActor.shared.getter(v53);
    v55 = dispatch thunk of Actor.unownedExecutor.getter(v16, &protocol witness table for MainActor);
    v57 = v56;
    if ((swift_task_isCurrentExecutor(v55) & 1) == 0)
      v58 = swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 44, v55, v57);
    v59 = v86;
    v60 = OAuthAuthorizationContext.logKey.getter(v58);
    v62 = v61;
    swift_release(v54);
    v89 = sub_100030804(v60, v62, &v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v89, &v90, v52 + 4, v52 + 12);

    v63 = swift_bridgeObjectRelease(v62);
    *(_WORD *)(v52 + 12) = 2085;
    v64 = static MainActor.shared.getter(v63);
    v65 = dispatch thunk of Actor.unownedExecutor.getter(v16, &protocol witness table for MainActor);
    v67 = v66;
    if ((swift_task_isCurrentExecutor(v65) & 1) == 0)
      swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 44, v65, v67);
    swift_release(v64);
    v68 = sub_100007E48();
    v69 = dispatch thunk of CustomStringConvertible.description.getter(v9, v68);
    v71 = v70;
    v89 = sub_100030804(v69, v70, &v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v89, &v90, v52 + 14, v52 + 22);
    swift_bridgeObjectRelease(v71);
    v72 = *(void (**)(char *, uint64_t))(v10 + 8);
    v72(v13, v9);
    v73 = v85;
    _os_log_impl((void *)&_mh_execute_header, v85, (os_log_type_t)v84, "[%{public}s] Received authorization %{sensitive}s", (uint8_t *)v52, 0x16u);
    v74 = v83;
    swift_arrayDestroy(v83, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v74, -1, -1);
    swift_slowDealloc(v52, -1, -1);

    v47 = v87;
  }
  else
  {

    v72 = *(void (**)(char *, uint64_t))(v10 + 8);
    v72(v13, v9);

  }
  v77 = objc_msgSend(objc_allocWithZone((Class)BSMutableSettings), "init");
  URL.absoluteString.getter();
  v79 = v78;
  v80 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v79);
  objc_msgSend(v77, "setObject:forSetting:", v80, 2);

  v81 = objc_msgSend((id)objc_opt_self(BSActionResponse), "responseWithInfo:", v77);
  sub_10001E5A4((uint64_t)v81, v82);

  v72(v47, v9);
  swift_release(v88);
}

uint64_t sub_10001E394(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v17[5];
  uint64_t v18;

  v3 = v2;
  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor(v7) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 66, v7, v9);
  v10 = (void *)objc_opt_self(UIView);
  v11 = swift_allocObject(&unk_1000422E8, 32, 7);
  *(_QWORD *)(v11 + 16) = v3;
  *(_QWORD *)(v11 + 24) = a1;
  v17[4] = sub_10001F124;
  v18 = v11;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_10002D630;
  v17[3] = &unk_100042300;
  v12 = _Block_copy(v17);
  v13 = v18;
  v14 = v3;
  v15 = a1;
  swift_release(v13);
  objc_msgSend(v10, "animateWithDuration:animations:", v12, 0.3);
  _Block_release(v12);
  return swift_release(v6);
}

void sub_10001E4D4(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = type metadata accessor for MainActor(0, a2);
  v5 = static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 67, v6, v8);
  v9 = objc_msgSend(a1, "view");
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "setBackgroundColor:", a2);
    swift_release(v5);

  }
  else
  {
    __break(1u);
  }
}

void sub_10001E5A4(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __n128 v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t aBlock[5];
  uint64_t v48;

  v3 = v2;
  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor(v7) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 72, v7, v9);
  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v10 = type metadata accessor for Logger(0);
  sub_100007D98(v10, (uint64_t)qword_10004AD30);
  v11 = v3;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v44 = a1;
    v45 = v6;
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v15 = swift_slowAlloc(32, -1);
    aBlock[0] = v15;
    *(_DWORD *)v14 = 136446210;
    v16 = static MainActor.shared.getter(v15);
    v17 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
    v19 = v18;
    if ((swift_task_isCurrentExecutor(v17) & 1) == 0)
      v20 = swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 75, v17, v19);
    v21 = OAuthAuthorizationContext.logKey.getter(v20);
    v23 = v22;
    swift_release(v16);
    v46 = sub_100030804(v21, v23, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, aBlock, v14 + 4, v14 + 12);

    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%{public}s] Completing web authentication request", v14, 0xCu);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    a1 = v44;
    v6 = v45;
  }
  else
  {

  }
  v25 = static MainActor.shared.getter(v24);
  v26 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v28 = v27;
  if ((swift_task_isCurrentExecutor(v26) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 15, v26, v28);
  v29 = OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_responseAction;
  v30 = *(void **)&v11[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_responseAction];
  v31 = v30;
  swift_release(v25);
  if (v30)
  {
    if (objc_msgSend(v31, "canSendResponse"))
      objc_msgSend(v31, "sendResponse:", a1);

  }
  v32 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
  sub_10001E394(v32, v33);

  v34 = swift_allocObject(&unk_100042298, 24, 7);
  *(_QWORD *)(v34 + 16) = v11;
  aBlock[4] = (uint64_t)sub_10001F0D8;
  v48 = v34;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10002D630;
  aBlock[3] = (uint64_t)&unk_1000422B0;
  v35 = _Block_copy(aBlock);
  v36 = v48;
  v37 = v11;
  swift_release(v36);
  objc_msgSend(v37, "dismissViewControllerAnimated:completion:", 1, v35);
  _Block_release(v35);
  v39 = static MainActor.shared.getter(v38);
  v40 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v42 = v41;
  if ((swift_task_isCurrentExecutor(v40) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 15, v40, v42);
  v43 = *(void **)&v11[v29];
  *(_QWORD *)&v11[v29] = 0;
  swift_release(v6);
  swift_release(v39);

}

uint64_t sub_10001E9CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t isCurrentExecutor;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;

  v3 = type metadata accessor for MainActor(0, a2);
  v4 = static MainActor.shared.getter(v3);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v7 = v6;
  isCurrentExecutor = swift_task_isCurrentExecutor(v5);
  if ((isCurrentExecutor & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 83, v5, v7);
  v9 = static MainActor.shared.getter(isCurrentExecutor);
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v12 = v11;
  if ((swift_task_isCurrentExecutor(v10) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 13, v10, v12);
  v13 = a1 + OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_dismissAction;
  v14 = *(void (**)(uint64_t))(a1
                                       + OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_dismissAction);
  v15 = *(_QWORD *)(v13 + 8);
  sub_100007DF4((uint64_t)v14, v15);
  v16 = swift_release(v9);
  if (v14)
  {
    v14(v16);
    sub_100007E04((uint64_t)v14, v15);
  }
  return swift_release(v4);
}

id sub_10001EB74()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OAuthAuthorizationViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001EC0C()
{
  return type metadata accessor for OAuthAuthorizationViewController(0);
}

uint64_t type metadata accessor for OAuthAuthorizationViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100048E50;
  if (!qword_100048E50)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for OAuthAuthorizationViewController);
  return result;
}

uint64_t sub_10001EC50(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  _QWORD v5[3];

  v5[0] = &unk_100033F78;
  v5[1] = &unk_100033F90;
  result = type metadata accessor for OAuthAuthorizationContext(319, a2);
  if (v4 <= 0x3F)
  {
    v5[2] = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 3, v5, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_10001ED88(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, void *);
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  v6 = sub_1000051F0(&qword_100048980);
  __chkstk_darwin(v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void (**)(char *, void *))(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a2);
    v11 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v8, 1, 1, v12);
  }
  swift_retain(v9);
  v13 = a3;
  v10(v8, a3);
  swift_release(v9);

  return sub_10001F134((uint64_t)v8);
}

uint64_t sub_10001EE80()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v1 = &v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_dismissAction];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_responseAction] = 0;

  v3 = type metadata accessor for MainActor(0, v2);
  v4 = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v7 = v6;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 25, v5, v7);
  swift_release(v4);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000350F0, "AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 2, 25, 0);
  __break(1u);
  return result;
}

void sub_10001EF60(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v3 = v2;
  v4 = type metadata accessor for MainActor(0, a2);
  v5 = static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 90, v6, v8);
  v9 = objc_msgSend(v3, "view");
  if (!v9)
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = v9;
  v11 = objc_msgSend(v9, "window");

  if (!v11)
  {
LABEL_7:
    v13 = objc_msgSend(v3, "view");
    if (v13)
    {
      v14 = v13;
      v15 = objc_msgSend(v13, "window");

      if (v15)
      {
        swift_release(v5);
        return;
      }
      goto LABEL_12;
    }
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v12 = objc_msgSend(v11, "_rootSheetPresentationController");

  if (v12)
  {
    objc_msgSend(v12, "_setShouldScaleDownBehindDescendantSheets:", 0);

    goto LABEL_7;
  }
LABEL_13:
  __break(1u);
}

uint64_t sub_10001F0B4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001F0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10001E9CC(*(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_10001F0E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001F0F0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001F0F8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_10001F124()
{
  uint64_t v0;

  sub_10001E4D4(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_10001F12C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10001DAE8(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_10001F134(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000051F0(&qword_100048980);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001F174(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000051F0(&qword_100048980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_10001F1D0(void *a1, uint64_t a2)
{
  id v4;
  NSString v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[6];

  v4 = objc_msgSend((id)objc_opt_self(BSServiceQuality), "userInteractive");
  objc_msgSend(a1, "setServiceQuality:", v4);

  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend((id)objc_opt_self(BSMutableServiceInterface), "interfaceWithIdentifier:", v5);

  v7 = objc_msgSend((id)objc_opt_self(BSObjCProtocol), "protocolForProtocol:", &OBJC_PROTOCOL____TtP14MarketplaceKit35AppDistributionLaunchAngelInterface_);
  objc_msgSend(v6, "setServer:", v7);

  objc_msgSend(v6, "setClientMessagingExpectation:", 1);
  objc_msgSend(a1, "setInterface:", v6);

  objc_msgSend(a1, "setInterfaceTarget:", *(_QWORD *)(a2 + OBJC_IVAR____TtC26AppDistributionLaunchAngel26LaunchAngelServiceDelegate_service));
  v9[4] = sub_10001F378;
  v9[5] = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1000125C0;
  v9[3] = &unk_1000423F0;
  v8 = _Block_copy(v9);
  objc_msgSend(a1, "setInvalidationHandler:", v8);
  _Block_release(v8);
}

void sub_10001F378()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  if (qword_100047FC8 != -1)
    swift_once(&qword_100047FC8, sub_1000286C4);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100007D98(v0, (uint64_t)qword_10004AD78);
  oslog = Logger.logObject.getter(v1);
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v2, "Connection invalidated", v3, 2u);
    swift_slowDealloc(v3, -1, -1);
  }

}

uint64_t type metadata accessor for LaunchAngelServiceDelegate()
{
  return objc_opt_self(_TtC26AppDistributionLaunchAngel26LaunchAngelServiceDelegate);
}

id sub_10001F520(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  NSString v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  char isEscapingClosureAtFileLocation;
  id result;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t aBlock[5];
  uint64_t v31;

  v2 = v1;
  if (qword_100047FC8 != -1)
    swift_once(&qword_100047FC8, sub_1000286C4);
  v4 = type metadata accessor for Logger(0);
  sub_100007D98(v4, (uint64_t)qword_10004AD78);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    aBlock[0] = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = objc_msgSend(v5, "remoteToken");
    v11 = objc_msgSend(v10, "bundleID");

    if (v11)
    {
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      v14 = v13;

    }
    else
    {
      v14 = 0xE700000000000000;
      v12 = 0x6E776F6E6B6E75;
    }
    v29 = sub_100030804(v12, v14, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, aBlock, v8 + 4, v8 + 12);

    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Received connection from %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  v15 = objc_msgSend(v5, "remoteProcess");
  v16 = String._bridgeToObjectiveC()();
  v17 = objc_msgSend(v15, "hasEntitlement:", v16);

  if (v17)
  {
    v19 = swift_allocObject(&unk_100042388, 24, 7);
    *(_QWORD *)(v19 + 16) = v2;
    v20 = swift_allocObject(&unk_1000423B0, 32, 7);
    *(_QWORD *)(v20 + 16) = sub_10001F924;
    *(_QWORD *)(v20 + 24) = v19;
    aBlock[4] = (uint64_t)sub_10000A3EC;
    v31 = v20;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10000A34C;
    aBlock[3] = (uint64_t)&unk_1000423C8;
    v21 = _Block_copy(aBlock);
    v22 = v31;
    v23 = v2;
    swift_retain(v20);
    swift_release(v22);
    objc_msgSend(v5, "configureConnection:", v21);
    _Block_release(v21);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v20, "", 168, 38, 40, 1);
    result = (id)swift_release(v20);
    if ((isEscapingClosureAtFileLocation & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      objc_msgSend(v5, "activate");
      return (id)swift_release(v19);
    }
  }
  else
  {
    v26 = Logger.logObject.getter(v18);
    v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Process not entitled, failing", v28, 2u);
      swift_slowDealloc(v28, -1, -1);
    }

    return objc_msgSend(v5, "invalidate");
  }
  return result;
}

uint64_t sub_10001F900()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10001F924(void *a1)
{
  uint64_t v1;

  sub_10001F1D0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10001F92C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001F93C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001F94C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001FA70(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[5];
  uint64_t v17;
  objc_super v18;

  v3 = v2;
  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor(v7) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/MiniProductPageView.swift", 52, 1, 27, v7, v9);
  v18.receiver = v3;
  v18.super_class = (Class)type metadata accessor for MiniProductPageView(0);
  objc_msgSendSuper2(&v18, "traitCollectionDidChange:", a1);
  v10 = objc_msgSend(v3, "layer");
  v11 = objc_allocWithZone((Class)UIColor);
  v16[4] = sub_10003140C;
  v17 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_10001FE98;
  v16[3] = &unk_100042418;
  v12 = _Block_copy(v16);
  v13 = objc_msgSend(v11, "initWithDynamicProvider:", v12);
  _Block_release(v12);
  swift_release(v17);
  v14 = objc_msgSend(v13, "CGColor");

  objc_msgSend(v10, "setBorderColor:", v14);
  objc_msgSend(v3, "setNeedsDisplay");
  return swift_release(v6);
}

id sub_10001FD58()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MiniProductPageView(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001FDDC()
{
  return type metadata accessor for MiniProductPageView(0);
}

uint64_t type metadata accessor for MiniProductPageView(uint64_t a1)
{
  uint64_t result;

  result = qword_100048FF8;
  if (!qword_100048FF8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MiniProductPageView);
  return result;
}

uint64_t sub_10001FE20(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for InstallSheetContext(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    result = swift_updateClassMetadata2(a1, 256, 2, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

id sub_10001FE98(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t (*v4)(void);
  id v5;
  void *v6;

  v4 = *(uint64_t (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v6 = (void *)v4();
  swift_release(v3);

  return v6;
}

uint64_t sub_10001FEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001FEF8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001FF00()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
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
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;

  v1[40] = v0;
  v2 = type metadata accessor for BagLanguageSource(0);
  v1[41] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[42] = v3;
  v1[43] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Bag(0);
  v1[44] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v1[45] = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[46] = swift_task_alloc(v6);
  v1[47] = swift_task_alloc(v6);
  v7 = type metadata accessor for JetPackPath(0);
  v1[48] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LocalizedStringsBundle(0);
  v1[49] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v1[50] = v9;
  v1[51] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for InMemoryJetPackResourceBundle(0);
  v1[52] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v1[53] = v11;
  v12 = (*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[54] = swift_task_alloc(v12);
  v1[55] = swift_task_alloc(v12);
  v13 = type metadata accessor for JetPackSigningPolicy(0);
  v1[56] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v1[57] = v14;
  v1[58] = swift_task_alloc((*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for InMemoryJetPackLoader(0);
  v1[59] = v15;
  v16 = *(_QWORD *)(v15 - 8);
  v1[60] = v16;
  v1[61] = swift_task_alloc((*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for JetPackAssetRequestSourcePolicy(0);
  v1[62] = v17;
  v18 = *(_QWORD *)(v17 - 8);
  v1[63] = v18;
  v1[64] = swift_task_alloc((*(_QWORD *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for URL(0);
  v1[65] = v19;
  v20 = *(_QWORD *)(v19 - 8);
  v1[66] = v20;
  v1[67] = swift_task_alloc((*(_QWORD *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for URLJetPackAssetRequest(0);
  v1[68] = v21;
  v22 = *(_QWORD *)(v21 - 8);
  v1[69] = v22;
  v1[70] = swift_task_alloc((*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for JetPackAsset(0);
  v1[71] = v23;
  v24 = *(_QWORD *)(v23 - 8);
  v1[72] = v24;
  v1[73] = swift_task_alloc((*(_QWORD *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for URLJetPackAssetFetcher(0);
  v1[74] = v25;
  v26 = *(_QWORD *)(v25 - 8);
  v1[75] = v26;
  v1[76] = swift_task_alloc((*(_QWORD *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for JetPackAssetSession.Configuration(0);
  v1[77] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v27 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = (*(_QWORD *)(*(_QWORD *)(sub_1000051F0(&qword_100049160) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[78] = swift_task_alloc(v28);
  v1[79] = swift_task_alloc(v28);
  v1[80] = swift_task_alloc(v28);
  v29 = type metadata accessor for Date(0);
  v1[81] = v29;
  v30 = *(_QWORD *)(v29 - 8);
  v1[82] = v30;
  v31 = (*(_QWORD *)(v30 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[83] = swift_task_alloc(v31);
  v1[84] = swift_task_alloc(v31);
  return swift_task_switch(sub_1000201C8, v0, 0);
}

uint64_t sub_1000201C8()
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
  double v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
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
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67[6];

  v1 = *(_QWORD *)(v0 + 320);
  if (*(_QWORD *)(v1 + 112))
    goto LABEL_13;
  v2 = *(_QWORD *)(v0 + 656);
  v3 = *(_QWORD *)(v0 + 648);
  v4 = *(_QWORD *)(v0 + 640);
  v5 = OBJC_IVAR____TtC26AppDistributionLaunchAngel19LocalizationJetPack_lastFailedLoadAttempt;
  *(_QWORD *)(v0 + 680) = OBJC_IVAR____TtC26AppDistributionLaunchAngel19LocalizationJetPack_lastFailedLoadAttempt;
  v6 = v1 + v5;
  swift_beginAccess(v1 + v5, v0 + 216, 0, 0);
  sub_100022800(v6, v4);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v4, 1, v3) != 1)
  {
    v7 = *(_QWORD *)(v0 + 672);
    v8 = *(_QWORD *)(v0 + 664);
    v9 = *(_QWORD *)(v0 + 656);
    v10 = *(_QWORD *)(v0 + 648);
    v11 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v9 + 32))(v7, *(_QWORD *)(v0 + 640), v10);
    Date.init()(v11);
    v12 = Date.timeIntervalSince(_:)(v7);
    v13 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v13(v8, v10);
    v13(v7, v10);
    if (v12 >= 3600.0)
      goto LABEL_5;
LABEL_13:
    v45 = *(_QWORD *)(v0 + 664);
    v46 = *(_QWORD *)(v0 + 640);
    v47 = *(_QWORD *)(v0 + 632);
    v48 = *(_QWORD *)(v0 + 624);
    v49 = *(_QWORD *)(v0 + 616);
    v50 = *(_QWORD *)(v0 + 608);
    v51 = *(_QWORD *)(v0 + 584);
    v52 = *(_QWORD *)(v0 + 560);
    v53 = *(_QWORD *)(v0 + 536);
    v54 = *(_QWORD *)(v0 + 512);
    v55 = *(_QWORD *)(v0 + 488);
    v56 = *(_QWORD *)(v0 + 464);
    v57 = *(_QWORD *)(v0 + 440);
    v58 = *(_QWORD *)(v0 + 432);
    v59 = *(_QWORD *)(v0 + 408);
    v61 = *(_QWORD *)(v0 + 384);
    v63 = *(_QWORD *)(v0 + 376);
    v65 = *(_QWORD *)(v0 + 368);
    v66 = *(_QWORD *)(v0 + 344);
    swift_task_dealloc(*(_QWORD *)(v0 + 672));
    swift_task_dealloc(v45);
    swift_task_dealloc(v46);
    swift_task_dealloc(v47);
    swift_task_dealloc(v48);
    swift_task_dealloc(v49);
    swift_task_dealloc(v50);
    swift_task_dealloc(v51);
    swift_task_dealloc(v52);
    swift_task_dealloc(v53);
    swift_task_dealloc(v54);
    swift_task_dealloc(v55);
    swift_task_dealloc(v56);
    swift_task_dealloc(v57);
    swift_task_dealloc(v58);
    swift_task_dealloc(v59);
    swift_task_dealloc(v61);
    swift_task_dealloc(v63);
    swift_task_dealloc(v65);
    swift_task_dealloc(v66);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  sub_100022848(*(_QWORD *)(v0 + 640));
LABEL_5:
  if (qword_100047FB8 != -1)
    swift_once(&qword_100047FB8, sub_100028684);
  v14 = *(_QWORD *)(v0 + 320);
  v15 = type metadata accessor for Logger(0);
  *(_QWORD *)(v0 + 688) = sub_100007D98(v15, (uint64_t)qword_10004AD48);
  v16 = swift_retain_n(v14, 2);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  v19 = os_log_type_enabled(v17, v18);
  v20 = *(_QWORD *)(v0 + 320);
  if (v19)
  {
    v21 = (uint8_t *)swift_slowAlloc(12, -1);
    v22 = swift_slowAlloc(32, -1);
    v67[0] = v22;
    *(_DWORD *)v21 = 136315138;
    if ((swift_task_isCurrentExecutor(v20) & 1) == 0)
      swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LaunchAngelLocalizationJetPack.swift", 63, 1, 38, *(_QWORD *)(v0 + 320), 0);
    v23 = *(_QWORD *)(v0 + 520);
    v24 = *(_QWORD *)(v0 + 320);
    v25 = sub_100005954((unint64_t *)&qword_100048320, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v26 = dispatch thunk of CustomStringConvertible.description.getter(v23, v25);
    v28 = v27;
    *(_QWORD *)(v0 + 312) = sub_100030804(v26, v27, v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 312, v0 + 320, v21 + 4, v21 + 12);
    swift_bridgeObjectRelease(v28);
    swift_release_n(v24, 2);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Loading localization resource bundle from %s", v21, 0xCu);
    swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v21, -1, -1);
  }
  else
  {
    swift_release_n(*(_QWORD *)(v0 + 320), 2);
  }

  v29 = type metadata accessor for JetPackAssetDiskCache(0);
  v30 = JetPackAssetDiskCache.__allocating_init()();
  *(_QWORD *)(v0 + 696) = v30;
  v31 = *(_QWORD *)(v0 + 616);
  v32 = *(_QWORD *)(v0 + 536);
  v33 = *(_QWORD *)(v0 + 528);
  v34 = *(_QWORD *)(v0 + 512);
  v60 = *(_QWORD *)(v0 + 520);
  v62 = *(_QWORD *)(v0 + 504);
  v64 = *(_QWORD *)(v0 + 496);
  v35 = *(_QWORD *)(v0 + 320);
  v67[3] = v29;
  v67[4] = (uint64_t)&protocol witness table for JetPackAssetDiskCache;
  v67[0] = v30;
  swift_retain(v30);
  JetPackAssetSession.Configuration.init(cache:)(v67);
  v36 = type metadata accessor for JetPackAssetSession(0);
  swift_allocObject(v36, *(unsigned int *)(v36 + 48), *(unsigned __int16 *)(v36 + 52));
  *(_QWORD *)(v0 + 704) = JetPackAssetSession.init(configuration:)(v31);
  v37 = *(_QWORD *)(v35 + 120);
  *(_QWORD *)(v0 + 712) = v37;
  v38 = (void *)objc_opt_self(NSURLSessionConfiguration);
  v39 = (void *)objc_opt_self(AMSProcessInfo);
  swift_unknownObjectRetain(v37);
  v40 = objc_msgSend(v39, "currentProcess");
  v41 = objc_msgSend(v38, "ams_configurationWithProcessInfo:bag:", v40, v37);

  URLJetPackAssetFetcher.init(bag:urlSessionConfiguration:requestEncoder:)(v37, v41, 0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v32, v35 + OBJC_IVAR____TtC26AppDistributionLaunchAngel19LocalizationJetPack_url, v60);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v62 + 104))(v34, enum case for JetPackAssetRequestSourcePolicy.standard(_:), v64);
  URLJetPackAssetRequest.init(url:sourcePolicy:)(v32, v34);
  v42 = (_QWORD *)swift_task_alloc(async function pointer to JetPackAssetSession.jetPack<A>(for:fetcher:)[1]);
  *(_QWORD *)(v0 + 720) = v42;
  v43 = sub_100005954(&qword_100049168, (uint64_t (*)(uint64_t))&type metadata accessor for URLJetPackAssetFetcher, (uint64_t)&protocol conformance descriptor for URLJetPackAssetFetcher);
  *v42 = v0;
  v42[1] = sub_1000209B4;
  return JetPackAssetSession.jetPack<A>(for:fetcher:)(*(_QWORD *)(v0 + 584), *(_QWORD *)(v0 + 560), *(_QWORD *)(v0 + 608), *(_QWORD *)(v0 + 592), v43);
}

uint64_t sub_1000209B4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 720);
  *(_QWORD *)(*(_QWORD *)v1 + 728) = v0;
  swift_task_dealloc(v3);
  v4 = v2[70];
  v5 = v2[69];
  v6 = v2[68];
  v7 = v2[40];
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (v0)
    v8 = sub_100021568;
  else
    v8 = sub_100020A30;
  return swift_task_switch(v8, v7, 0);
}

uint64_t sub_100020A30()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[58];
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0[57] + 104))(v1, enum case for JetPackSigningPolicy.required(_:), v0[56]);
  v0[25] = type metadata accessor for JetPackManagedKeyProvider(0);
  v0[26] = &protocol witness table for JetPackManagedKeyProvider;
  sub_100022918(v0 + 22);
  JetPackManagedKeyProvider.init()();
  v2 = InMemoryJetPackLoader.init(signingPolicy:keyProvider:)(v1, v0 + 22);
  JetPackAsset.streamSource.getter(v2);
  v3 = (_QWORD *)swift_task_alloc(async function pointer to InMemoryJetPackLoader.bundle(from:)[1]);
  v0[92] = v3;
  *v3 = v0;
  v3[1] = sub_100020B04;
  return InMemoryJetPackLoader.bundle(from:)(v0[55], v0 + 2);
}

uint64_t sub_100020B04()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *v1;
  v3 = (_QWORD *)(*v1 + 16);
  v4 = *(_QWORD *)(*v1 + 736);
  *(_QWORD *)(*v1 + 744) = v0;
  swift_task_dealloc(v4);
  v5 = *(_QWORD *)(v2 + 320);
  sub_10001C164(v3);
  if (v0)
    v6 = sub_1000218F0;
  else
    v6 = sub_100020B80;
  return swift_task_switch(v6, v5, 0);
}

uint64_t sub_100020B80()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v2)(_QWORD, _QWORD, _QWORD);
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
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
  uint64_t (*v83)(_QWORD, _QWORD, _QWORD);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90[2];

  v1 = (_QWORD *)(v0 + 136);
  v2 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 424) + 16);
  v3 = v2(*(_QWORD *)(v0 + 432), *(_QWORD *)(v0 + 440), *(_QWORD *)(v0 + 416));
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v0 + 432);
    v79 = *(_QWORD *)(v0 + 424);
    v83 = v2;
    v7 = *(_QWORD *)(v0 + 416);
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v90[0] = swift_slowAlloc(32, -1);
    v9 = v90[0];
    *(_DWORD *)v8 = 136315138;
    v10 = JetPackResourceBundle.version.getter(v7, &protocol witness table for InMemoryJetPackResourceBundle);
    if (v11)
    {
      v12 = v11;
    }
    else
    {
      v10 = 48;
      v12 = 0xE100000000000000;
    }
    *(_QWORD *)(v0 + 304) = sub_100030804(v10, v12, v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 304, v0 + 312, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v12);
    v13 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
    v14 = v7;
    v2 = v83;
    v13(v6, v14);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Loaded resource bundle version %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    v15 = v9;
    v1 = (_QWORD *)(v0 + 136);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }
  else
  {
    v13 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 424) + 8);
    v13(*(_QWORD *)(v0 + 432), *(_QWORD *)(v0 + 416));
  }

  *(_QWORD *)(v0 + 752) = v13;
  v16 = *(_QWORD *)(v0 + 744);
  v17 = *(_QWORD *)(v0 + 440);
  v18 = *(_QWORD *)(v0 + 416);
  v19 = *(_QWORD *)(v0 + 384);
  *(_QWORD *)(v0 + 160) = v18;
  *(_QWORD *)(v0 + 168) = &protocol witness table for InMemoryJetPackResourceBundle;
  v20 = sub_100022918(v1);
  v2(v20, v17, v18);
  JetPackPath.init(_:)(0x736A2E7865646E69, 0xEA00000000006E6FLL);
  LocalizedStringsBundle.init(resourceBundle:indexPath:)(v1, v19);
  if (v16)
  {
    v21 = *(_QWORD *)(v0 + 696);
    v84 = *(_QWORD *)(v0 + 592);
    v87 = *(_QWORD *)(v0 + 608);
    v77 = *(_QWORD *)(v0 + 584);
    v80 = *(_QWORD *)(v0 + 600);
    v22 = v16;
    v23 = *(_QWORD *)(v0 + 576);
    v75 = *(_QWORD *)(v0 + 568);
    v24 = *(_QWORD *)(v0 + 480);
    v25 = *(_QWORD *)(v0 + 488);
    v26 = *(_QWORD *)(v0 + 472);
    v27 = *(_QWORD *)(v0 + 440);
    v28 = *(_QWORD *)(v0 + 416);
    swift_release(*(_QWORD *)(v0 + 704));
    swift_release(v21);
    v13(v27, v28);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v26);
    v29 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v30 = v22;
    v29(v77, v75);
    (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v87, v84);
    swift_errorRetain(v22);
    v31 = swift_errorRetain(v22);
    v32 = Logger.logObject.getter(v31);
    v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc(12, -1);
      v88 = swift_slowAlloc(32, -1);
      v90[0] = v88;
      *(_DWORD *)v34 = 136446210;
      swift_getErrorValue(v22, v0 + 296, v0 + 240);
      v36 = *(_QWORD *)(v0 + 240);
      v35 = *(_QWORD *)(v0 + 248);
      v37 = *(_QWORD *)(v35 - 8);
      v38 = swift_task_alloc((*(_QWORD *)(v37 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v38, v36, v35);
      v39 = String.init<A>(describing:)(v38, v35);
      v41 = v40;
      swift_task_dealloc(v38);
      *(_QWORD *)(v0 + 288) = sub_100030804(v39, v41, v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 288, v0 + 296, v34 + 4, v34 + 12);
      swift_bridgeObjectRelease(v41);
      swift_errorRelease(v30);
      swift_errorRelease(v30);
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Failed to load localization jetpack: %{public}s", v34, 0xCu);
      swift_arrayDestroy(v88, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v88, -1, -1);
      swift_slowDealloc(v34, -1, -1);
    }
    else
    {
      swift_errorRelease(v22);
      swift_errorRelease(v22);
    }

    v56 = *(_QWORD *)(v0 + 656);
    v57 = *(_QWORD *)(v0 + 648);
    v58 = *(_QWORD *)(v0 + 632);
    v59 = *(_QWORD *)(v0 + 624);
    v60 = *(_QWORD *)(v0 + 320) + *(_QWORD *)(v0 + 680);
    Date.init()();
    swift_errorRelease(v30);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v56 + 56))(v58, 0, 1, v57);
    sub_100022888(v58, v59);
    swift_beginAccess(v60, v0 + 264, 33, 0);
    sub_1000228D0(v59, v60);
    swift_endAccess(v0 + 264);
    v61 = *(_QWORD *)(v0 + 664);
    v62 = *(_QWORD *)(v0 + 640);
    v63 = *(_QWORD *)(v0 + 632);
    v64 = *(_QWORD *)(v0 + 624);
    v65 = *(_QWORD *)(v0 + 616);
    v66 = *(_QWORD *)(v0 + 608);
    v67 = *(_QWORD *)(v0 + 584);
    v68 = *(_QWORD *)(v0 + 560);
    v69 = *(_QWORD *)(v0 + 536);
    v70 = *(_QWORD *)(v0 + 512);
    v71 = *(_QWORD *)(v0 + 488);
    v72 = *(_QWORD *)(v0 + 464);
    v73 = *(_QWORD *)(v0 + 440);
    v74 = *(_QWORD *)(v0 + 432);
    v76 = *(_QWORD *)(v0 + 408);
    v78 = *(_QWORD *)(v0 + 384);
    v82 = *(_QWORD *)(v0 + 376);
    v86 = *(_QWORD *)(v0 + 368);
    v89 = *(_QWORD *)(v0 + 344);
    swift_task_dealloc(*(_QWORD *)(v0 + 672));
    swift_task_dealloc(v61);
    swift_task_dealloc(v62);
    swift_task_dealloc(v63);
    swift_task_dealloc(v64);
    swift_task_dealloc(v65);
    swift_task_dealloc(v66);
    swift_task_dealloc(v67);
    swift_task_dealloc(v68);
    swift_task_dealloc(v69);
    swift_task_dealloc(v70);
    swift_task_dealloc(v71);
    swift_task_dealloc(v72);
    swift_task_dealloc(v73);
    swift_task_dealloc(v74);
    swift_task_dealloc(v76);
    swift_task_dealloc(v78);
    swift_task_dealloc(v82);
    swift_task_dealloc(v86);
    swift_task_dealloc(v89);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v42 = *(_QWORD *)(v0 + 400);
    v81 = *(_QWORD *)(v0 + 408);
    v43 = *(_QWORD *)(v0 + 392);
    v45 = *(_QWORD *)(v0 + 368);
    v44 = *(_QWORD *)(v0 + 376);
    v47 = *(_QWORD *)(v0 + 352);
    v46 = *(_QWORD *)(v0 + 360);
    v48 = *(_QWORD *)(v0 + 344);
    v85 = *(_QWORD *)(v0 + 336);
    v49 = *(_QWORD *)(v0 + 328);
    v50 = swift_unknownObjectRetain(*(_QWORD *)(v0 + 712));
    Bag.init(from:)(v50);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v45, v44, v47);
    BagLanguageSource.init(bag:)(v45);
    type metadata accessor for AppleServicesLocalizer(0);
    *(_QWORD *)(v0 + 120) = v43;
    *(_QWORD *)(v0 + 128) = &protocol witness table for LocalizedStringsBundle;
    v51 = sub_100022918((_QWORD *)(v0 + 96));
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(v42 + 16))(v51, v81, v43);
    *(_QWORD *)(v0 + 80) = v49;
    *(_QWORD *)(v0 + 88) = &protocol witness table for BagLanguageSource;
    v52 = sub_100022918((_QWORD *)(v0 + 56));
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(v85 + 16))(v52, v48, v49);
    type metadata accessor for BaseObjectGraph(0);
    v53 = BaseObjectGraph.__allocating_init(name:_:)(0xD000000000000017, 0x8000000100035ED0, &_swiftEmptyArrayStorage);
    *(_QWORD *)(v0 + 760) = v53;
    v54 = (_QWORD *)swift_task_alloc(async function pointer to static AppleServicesLocalizer.fetch(contentsOf:for:asPartOf:)[1]);
    *(_QWORD *)(v0 + 768) = v54;
    *v54 = v0;
    v54[1] = sub_100021270;
    return static AppleServicesLocalizer.fetch(contentsOf:for:asPartOf:)(v0 + 96, v0 + 56, v53);
  }
}

uint64_t sub_100021270(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 768);
  *(_QWORD *)(*(_QWORD *)v2 + 776) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = v4[40];
    swift_release(v4[95]);
    v7 = sub_100021CB0;
    v8 = v6;
  }
  else
  {
    v9 = v4[40];
    swift_release(v4[95]);
    v4[98] = a1;
    sub_10001C164(v4 + 7);
    sub_10001C164(v4 + 12);
    v7 = sub_100021320;
    v8 = v9;
  }
  return swift_task_switch(v7, v8, 0);
}

uint64_t sub_100021320()
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
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
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
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v44 = *(_QWORD *)(v0 + 784);
  v30 = *(void (**)(uint64_t, uint64_t))(v0 + 752);
  v1 = *(_QWORD *)(v0 + 696);
  v42 = *(_QWORD *)(v0 + 608);
  v38 = *(_QWORD *)(v0 + 600);
  v40 = *(_QWORD *)(v0 + 592);
  v32 = *(_QWORD *)(v0 + 576);
  v34 = *(_QWORD *)(v0 + 568);
  v36 = *(_QWORD *)(v0 + 584);
  v26 = *(_QWORD *)(v0 + 472);
  v28 = *(_QWORD *)(v0 + 488);
  v24 = *(_QWORD *)(v0 + 440);
  v25 = *(_QWORD *)(v0 + 480);
  v2 = *(_QWORD *)(v0 + 400);
  v22 = *(_QWORD *)(v0 + 408);
  v23 = *(_QWORD *)(v0 + 416);
  v21 = *(_QWORD *)(v0 + 392);
  v3 = *(_QWORD *)(v0 + 376);
  v4 = *(_QWORD *)(v0 + 352);
  v5 = *(_QWORD *)(v0 + 360);
  v6 = *(_QWORD *)(v0 + 336);
  v7 = *(_QWORD *)(v0 + 344);
  v8 = *(_QWORD *)(v0 + 320);
  v9 = *(_QWORD *)(v0 + 328);
  swift_release(*(_QWORD *)(v0 + 704));
  swift_release(v1);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v22, v21);
  v30(v24, v23);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v28, v26);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v36, v34);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v42, v40);
  v10 = *(_QWORD *)(v8 + 112);
  *(_QWORD *)(v8 + 112) = v44;
  swift_release(v10);
  v11 = *(_QWORD *)(v0 + 664);
  v12 = *(_QWORD *)(v0 + 640);
  v13 = *(_QWORD *)(v0 + 632);
  v14 = *(_QWORD *)(v0 + 624);
  v15 = *(_QWORD *)(v0 + 616);
  v16 = *(_QWORD *)(v0 + 608);
  v17 = *(_QWORD *)(v0 + 584);
  v18 = *(_QWORD *)(v0 + 560);
  v19 = *(_QWORD *)(v0 + 536);
  v27 = *(_QWORD *)(v0 + 512);
  v29 = *(_QWORD *)(v0 + 488);
  v31 = *(_QWORD *)(v0 + 464);
  v33 = *(_QWORD *)(v0 + 440);
  v35 = *(_QWORD *)(v0 + 432);
  v37 = *(_QWORD *)(v0 + 408);
  v39 = *(_QWORD *)(v0 + 384);
  v41 = *(_QWORD *)(v0 + 376);
  v43 = *(_QWORD *)(v0 + 368);
  v45 = *(_QWORD *)(v0 + 344);
  swift_task_dealloc(*(_QWORD *)(v0 + 672));
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v27);
  swift_task_dealloc(v29);
  swift_task_dealloc(v31);
  swift_task_dealloc(v33);
  swift_task_dealloc(v35);
  swift_task_dealloc(v37);
  swift_task_dealloc(v39);
  swift_task_dealloc(v41);
  swift_task_dealloc(v43);
  swift_task_dealloc(v45);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100021568()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
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
  uint64_t v43;

  v1 = *(_QWORD *)(v0 + 696);
  v2 = *(_QWORD *)(v0 + 608);
  v3 = *(_QWORD *)(v0 + 600);
  v4 = *(_QWORD *)(v0 + 592);
  swift_release(*(_QWORD *)(v0 + 704));
  swift_release(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v5 = *(_QWORD *)(v0 + 728);
  swift_errorRetain(v5);
  v6 = swift_errorRetain(v5);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v41 = swift_slowAlloc(32, -1);
    v43 = v41;
    *(_DWORD *)v9 = 136446210;
    swift_getErrorValue(v5, v0 + 296, v0 + 240);
    v11 = *(_QWORD *)(v0 + 240);
    v10 = *(_QWORD *)(v0 + 248);
    v12 = *(_QWORD *)(v10 - 8);
    v13 = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v13, v11, v10);
    v14 = String.init<A>(describing:)(v13, v10);
    v16 = v15;
    swift_task_dealloc(v13);
    *(_QWORD *)(v0 + 288) = sub_100030804(v14, v16, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 288, v0 + 296, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(v16);
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Failed to load localization jetpack: %{public}s", v9, 0xCu);
    swift_arrayDestroy(v41, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v41, -1, -1);
    swift_slowDealloc(v9, -1, -1);
  }
  else
  {
    swift_errorRelease(v5);
    swift_errorRelease(v5);
  }

  v17 = *(_QWORD *)(v0 + 656);
  v18 = *(_QWORD *)(v0 + 648);
  v19 = *(_QWORD *)(v0 + 632);
  v20 = *(_QWORD *)(v0 + 624);
  v21 = *(_QWORD *)(v0 + 320) + *(_QWORD *)(v0 + 680);
  Date.init()();
  swift_errorRelease(v5);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v17 + 56))(v19, 0, 1, v18);
  sub_100022888(v19, v20);
  swift_beginAccess(v21, v0 + 264, 33, 0);
  sub_1000228D0(v20, v21);
  swift_endAccess(v0 + 264);
  v22 = *(_QWORD *)(v0 + 664);
  v23 = *(_QWORD *)(v0 + 640);
  v24 = *(_QWORD *)(v0 + 632);
  v25 = *(_QWORD *)(v0 + 624);
  v26 = *(_QWORD *)(v0 + 616);
  v27 = *(_QWORD *)(v0 + 608);
  v28 = *(_QWORD *)(v0 + 584);
  v29 = *(_QWORD *)(v0 + 560);
  v30 = *(_QWORD *)(v0 + 536);
  v32 = *(_QWORD *)(v0 + 512);
  v33 = *(_QWORD *)(v0 + 488);
  v34 = *(_QWORD *)(v0 + 464);
  v35 = *(_QWORD *)(v0 + 440);
  v36 = *(_QWORD *)(v0 + 432);
  v37 = *(_QWORD *)(v0 + 408);
  v38 = *(_QWORD *)(v0 + 384);
  v39 = *(_QWORD *)(v0 + 376);
  v40 = *(_QWORD *)(v0 + 368);
  v42 = *(_QWORD *)(v0 + 344);
  swift_task_dealloc(*(_QWORD *)(v0 + 672));
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v42);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000218F0()
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
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
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
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
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

  v1 = *(_QWORD *)(v0 + 696);
  v46 = *(_QWORD *)(v0 + 608);
  v2 = *(_QWORD *)(v0 + 600);
  v3 = *(_QWORD *)(v0 + 592);
  v4 = *(_QWORD *)(v0 + 584);
  v5 = *(_QWORD *)(v0 + 576);
  v6 = *(_QWORD *)(v0 + 568);
  v7 = *(_QWORD *)(v0 + 480);
  v8 = *(_QWORD *)(v0 + 488);
  v9 = *(_QWORD *)(v0 + 472);
  swift_release(*(_QWORD *)(v0 + 704));
  swift_release(v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v46, v3);
  v10 = *(_QWORD *)(v0 + 744);
  swift_errorRetain(v10);
  v11 = swift_errorRetain(v10);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v47 = swift_slowAlloc(32, -1);
    v49 = v47;
    *(_DWORD *)v14 = 136446210;
    swift_getErrorValue(v10, v0 + 296, v0 + 240);
    v16 = *(_QWORD *)(v0 + 240);
    v15 = *(_QWORD *)(v0 + 248);
    v17 = *(_QWORD *)(v15 - 8);
    v18 = swift_task_alloc((*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v18, v16, v15);
    v19 = String.init<A>(describing:)(v18, v15);
    v21 = v20;
    swift_task_dealloc(v18);
    *(_QWORD *)(v0 + 288) = sub_100030804(v19, v21, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 288, v0 + 296, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease(v21);
    swift_errorRelease(v10);
    swift_errorRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Failed to load localization jetpack: %{public}s", v14, 0xCu);
    swift_arrayDestroy(v47, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v47, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }
  else
  {
    swift_errorRelease(v10);
    swift_errorRelease(v10);
  }

  v22 = *(_QWORD *)(v0 + 656);
  v23 = *(_QWORD *)(v0 + 648);
  v24 = *(_QWORD *)(v0 + 632);
  v25 = *(_QWORD *)(v0 + 624);
  v26 = *(_QWORD *)(v0 + 320) + *(_QWORD *)(v0 + 680);
  Date.init()();
  swift_errorRelease(v10);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v22 + 56))(v24, 0, 1, v23);
  sub_100022888(v24, v25);
  swift_beginAccess(v26, v0 + 264, 33, 0);
  sub_1000228D0(v25, v26);
  swift_endAccess(v0 + 264);
  v27 = *(_QWORD *)(v0 + 664);
  v28 = *(_QWORD *)(v0 + 640);
  v29 = *(_QWORD *)(v0 + 632);
  v30 = *(_QWORD *)(v0 + 624);
  v31 = *(_QWORD *)(v0 + 616);
  v32 = *(_QWORD *)(v0 + 608);
  v33 = *(_QWORD *)(v0 + 584);
  v34 = *(_QWORD *)(v0 + 560);
  v35 = *(_QWORD *)(v0 + 536);
  v37 = *(_QWORD *)(v0 + 512);
  v38 = *(_QWORD *)(v0 + 488);
  v39 = *(_QWORD *)(v0 + 464);
  v40 = *(_QWORD *)(v0 + 440);
  v41 = *(_QWORD *)(v0 + 432);
  v42 = *(_QWORD *)(v0 + 408);
  v43 = *(_QWORD *)(v0 + 384);
  v44 = *(_QWORD *)(v0 + 376);
  v45 = *(_QWORD *)(v0 + 368);
  v48 = *(_QWORD *)(v0 + 344);
  swift_task_dealloc(*(_QWORD *)(v0 + 672));
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  swift_task_dealloc(v48);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100021CB0()
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
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
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
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
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
  uint64_t v60;
  uint64_t v61;

  v44 = *(void (**)(uint64_t, uint64_t))(v0 + 752);
  v1 = *(_QWORD *)(v0 + 696);
  v54 = *(_QWORD *)(v0 + 592);
  v56 = *(_QWORD *)(v0 + 608);
  v50 = *(_QWORD *)(v0 + 584);
  v52 = *(_QWORD *)(v0 + 600);
  v46 = *(_QWORD *)(v0 + 576);
  v48 = *(_QWORD *)(v0 + 568);
  v41 = *(_QWORD *)(v0 + 472);
  v42 = *(_QWORD *)(v0 + 488);
  v39 = *(_QWORD *)(v0 + 440);
  v40 = *(_QWORD *)(v0 + 480);
  v2 = *(_QWORD *)(v0 + 400);
  v37 = *(_QWORD *)(v0 + 408);
  v38 = *(_QWORD *)(v0 + 416);
  v3 = *(_QWORD *)(v0 + 392);
  v4 = *(_QWORD *)(v0 + 376);
  v6 = *(_QWORD *)(v0 + 352);
  v5 = *(_QWORD *)(v0 + 360);
  v7 = *(_QWORD *)(v0 + 336);
  v8 = *(_QWORD *)(v0 + 344);
  v9 = *(_QWORD *)(v0 + 328);
  swift_release(*(_QWORD *)(v0 + 704));
  swift_release(v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v37, v3);
  v44(v39, v38);
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v42, v41);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v50, v48);
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v56, v54);
  sub_10001C164((_QWORD *)(v0 + 56));
  sub_10001C164((_QWORD *)(v0 + 96));
  v10 = *(_QWORD *)(v0 + 776);
  swift_errorRetain(v10);
  v11 = swift_errorRetain(v10);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v59 = swift_slowAlloc(32, -1);
    v61 = v59;
    *(_DWORD *)v14 = 136446210;
    swift_getErrorValue(v10, v0 + 296, v0 + 240);
    v16 = *(_QWORD *)(v0 + 240);
    v15 = *(_QWORD *)(v0 + 248);
    v17 = *(_QWORD *)(v15 - 8);
    v18 = swift_task_alloc((*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v18, v16, v15);
    v19 = String.init<A>(describing:)(v18, v15);
    v21 = v20;
    swift_task_dealloc(v18);
    *(_QWORD *)(v0 + 288) = sub_100030804(v19, v21, &v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 288, v0 + 296, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease(v21);
    swift_errorRelease(v10);
    swift_errorRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Failed to load localization jetpack: %{public}s", v14, 0xCu);
    swift_arrayDestroy(v59, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v59, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }
  else
  {
    swift_errorRelease(v10);
    swift_errorRelease(v10);
  }

  v22 = *(_QWORD *)(v0 + 656);
  v23 = *(_QWORD *)(v0 + 648);
  v24 = *(_QWORD *)(v0 + 632);
  v25 = *(_QWORD *)(v0 + 624);
  v26 = *(_QWORD *)(v0 + 320) + *(_QWORD *)(v0 + 680);
  Date.init()();
  swift_errorRelease(v10);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v22 + 56))(v24, 0, 1, v23);
  sub_100022888(v24, v25);
  swift_beginAccess(v26, v0 + 264, 33, 0);
  sub_1000228D0(v25, v26);
  swift_endAccess(v0 + 264);
  v27 = *(_QWORD *)(v0 + 664);
  v28 = *(_QWORD *)(v0 + 640);
  v29 = *(_QWORD *)(v0 + 632);
  v30 = *(_QWORD *)(v0 + 624);
  v31 = *(_QWORD *)(v0 + 616);
  v32 = *(_QWORD *)(v0 + 608);
  v33 = *(_QWORD *)(v0 + 584);
  v34 = *(_QWORD *)(v0 + 560);
  v35 = *(_QWORD *)(v0 + 536);
  v43 = *(_QWORD *)(v0 + 512);
  v45 = *(_QWORD *)(v0 + 488);
  v47 = *(_QWORD *)(v0 + 464);
  v49 = *(_QWORD *)(v0 + 440);
  v51 = *(_QWORD *)(v0 + 432);
  v53 = *(_QWORD *)(v0 + 408);
  v55 = *(_QWORD *)(v0 + 384);
  v57 = *(_QWORD *)(v0 + 376);
  v58 = *(_QWORD *)(v0 + 368);
  v60 = *(_QWORD *)(v0 + 344);
  swift_task_dealloc(*(_QWORD *)(v0 + 672));
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v43);
  swift_task_dealloc(v45);
  swift_task_dealloc(v47);
  swift_task_dealloc(v49);
  swift_task_dealloc(v51);
  swift_task_dealloc(v53);
  swift_task_dealloc(v55);
  swift_task_dealloc(v57);
  swift_task_dealloc(v58);
  swift_task_dealloc(v60);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100022108(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[4] = a1;
  v2[5] = v1;
  v3 = type metadata accessor for LocalizerLookupStrategy(0);
  v2[6] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[7] = v4;
  v2[8] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100022168, v1, 0);
}

uint64_t sub_100022168()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  sub_100004AB0();
  v0[2] = v1;
  v0[3] = v2;
  v0[9] = v2;
  v0[10] = sub_100004D20();
  sub_1000047A8();
  v0[11] = v3;
  v0[12] = v4;
  v5 = (_QWORD *)swift_task_alloc(dword_10004905C);
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_1000221D0;
  return sub_10001FF00();
}

uint64_t sub_1000221D0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 40);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 104));
  return swift_task_switch(sub_100022228, v1, 0);
}

uint64_t sub_100022228()
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
  void *v9;
  void *v10;
  Swift::String v11;
  Swift::Bool v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 112);
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 72);
    v2 = *(_QWORD *)(v0 + 80);
    v4 = *(_QWORD *)(v0 + 16);
    v6 = *(_QWORD *)(v0 + 56);
    v5 = *(_QWORD *)(v0 + 64);
    v7 = *(_QWORD *)(v0 + 48);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v5, enum case for LocalizerLookupStrategy.default(_:), v7);
    swift_retain(v1);
    v8 = AppleServicesLocalizer.string(forKey:with:using:)(v4, v3, v2, v5);
    v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    v11._countAndFlagsBits = v8;
    v11._object = v10;
    v12 = AppleServicesLocalizer.isLocalizedString(_:)(v11);
    v13 = *(_QWORD *)(v0 + 96);
    if (v12)
    {
      v15 = *(_QWORD *)(v0 + 72);
      v14 = *(_QWORD *)(v0 + 80);
      swift_release(v1);
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease(v14);
      goto LABEL_8;
    }
    v18 = *(_QWORD *)(v0 + 80);
    v17 = *(_QWORD *)(v0 + 88);
    swift_bridgeObjectRelease(v10);
    v8 = sub_10002254C(v17, v13, v18);
    v10 = v19;
    swift_release(v1);
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 96);
    v8 = sub_10002254C(*(_QWORD *)(v0 + 88), v13, *(_QWORD *)(v0 + 80));
    v10 = v16;
  }
  swift_bridgeObjectRelease(v13);
  v20 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 72));
  swift_bridgeObjectRelease(v20);
  if (!v10)
  {
    sub_1000047A8();
    v8 = v21;
    v10 = v22;
  }
LABEL_8:
  swift_task_dealloc(*(_QWORD *)(v0 + 64));
  return (*(uint64_t (**)(uint64_t, void *))(v0 + 8))(v8, v10);
}

uint64_t sub_100022394()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 112));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 120));
  v1 = v0 + OBJC_IVAR____TtC26AppDistributionLaunchAngel19LocalizationJetPack_url;
  v2 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_100022848(v0 + OBJC_IVAR____TtC26AppDistributionLaunchAngel19LocalizationJetPack_lastFailedLoadAttempt);
  swift_defaultActor_destroy(v0);
  return swift_defaultActor_deallocate(v0);
}

uint64_t sub_100022400()
{
  return type metadata accessor for LocalizationJetPack(0);
}

uint64_t type metadata accessor for LocalizationJetPack(uint64_t a1)
{
  uint64_t result;

  result = qword_100049048;
  if (!qword_100049048)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LocalizationJetPack);
  return result;
}

void sub_100022444(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[5];

  v6[1] = &unk_100034040;
  v6[2] = &unk_100034058;
  v2 = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v6[3] = *(_QWORD *)(v2 - 8) + 64;
    sub_1000224EC(319);
    if (v5 <= 0x3F)
    {
      v6[4] = *(_QWORD *)(v4 - 8) + 64;
      swift_updateClassMetadata2(a1, 256, 5, v6, a1 + 80);
    }
  }
}

void sub_1000224EC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100049068)
  {
    v2 = type metadata accessor for Date(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100049068);
  }
}

uint64_t sub_100022540()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10002254C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  int64_t v30;
  _QWORD v31[2];
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v3 = a2;
  if (!a3 || !a2)
  {
    swift_bridgeObjectRetain(a2);
    return a1;
  }
  v29 = a3 + 64;
  v6 = 1 << *(_BYTE *)(a3 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a3 + 64);
  v30 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain(a3);
  result = swift_bridgeObjectRetain(v3);
  v10 = 0;
  while (1)
  {
    if (v8)
    {
      v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_7;
    }
    v26 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v30)
      goto LABEL_24;
    v27 = *(_QWORD *)(v29 + 8 * v26);
    ++v10;
    if (!v27)
    {
      v10 = v26 + 1;
      if (v26 + 1 >= v30)
        goto LABEL_24;
      v27 = *(_QWORD *)(v29 + 8 * v10);
      if (!v27)
      {
        v10 = v26 + 2;
        if (v26 + 2 >= v30)
          goto LABEL_24;
        v27 = *(_QWORD *)(v29 + 8 * v10);
        if (!v27)
          break;
      }
    }
LABEL_22:
    v8 = (v27 - 1) & v27;
    v12 = __clz(__rbit64(v27)) + (v10 << 6);
LABEL_7:
    v13 = 16 * v12;
    v14 = (uint64_t *)(*(_QWORD *)(a3 + 48) + v13);
    v15 = *v14;
    v16 = (void *)v14[1];
    v17 = (uint64_t *)(*(_QWORD *)(a3 + 56) + v13);
    v19 = *v17;
    v18 = v17[1];
    v34 = a1;
    v35 = v3;
    v32 = 16448;
    v33 = 0xE200000000000000;
    swift_bridgeObjectRetain(v16);
    swift_bridgeObjectRetain(v18);
    v20._countAndFlagsBits = v15;
    v20._object = v16;
    String.append(_:)(v20);
    swift_bridgeObjectRelease(v16);
    v21._countAndFlagsBits = 16448;
    v21._object = (void *)0xE200000000000000;
    String.append(_:)(v21);
    v22 = v33;
    v31[0] = v19;
    v31[1] = v18;
    v23 = sub_1000227BC();
    a1 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)(&v32, v31, 0, 0, 0, 1, &type metadata for String, &type metadata for String, &type metadata for String, v23, v23, v23);
    v25 = v24;
    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(v3);
    result = swift_bridgeObjectRelease(v22);
    v3 = v25;
  }
  v28 = v26 + 3;
  if (v28 >= v30)
  {
LABEL_24:
    swift_release(a3);
    return a1;
  }
  v27 = *(_QWORD *)(v29 + 8 * v28);
  if (v27)
  {
    v10 = v28;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v10 >= v30)
      goto LABEL_24;
    v27 = *(_QWORD *)(v29 + 8 * v10);
    ++v28;
    if (v27)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_1000227BC()
{
  unint64_t result;

  result = qword_100049158;
  if (!qword_100049158)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100049158);
  }
  return result;
}

uint64_t sub_100022800(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000051F0(&qword_100049160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100022848(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000051F0(&qword_100049160);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100022888(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000051F0(&qword_100049160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000228D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000051F0(&qword_100049160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

_QWORD *sub_100022918(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

void sub_100022954(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;

  sub_10001C118((_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  if (a3)
  {
    v9 = a3;
    v5 = a3;
    v6 = sub_1000051F0(&qword_100049190);
    CheckedContinuation.resume(throwing:)(&v9, v6);

  }
  else if (a2)
  {
    v9 = a2;
    v7 = a2;
    v8 = sub_1000051F0(&qword_100049190);
    CheckedContinuation.resume(returning:)(&v9, v8);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000229F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[20] = a2;
  v3[21] = a3;
  v3[19] = a1;
  v4 = sub_1000051F0(&qword_100049190);
  v3[22] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[23] = v5;
  v3[24] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100022A5C, 0, 0);
}

id sub_100022A5C()
{
  _QWORD *v0;
  id result;
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;

  result = (id)SBSCreateOpenApplicationService();
  v0[25] = result;
  if (result)
  {
    v2 = result;
    v3 = v0 + 2;
    v4 = v0[23];
    v5 = v0[24];
    v6 = v0[22];
    v13 = v0[21];
    v7 = String._bridgeToObjectiveC()();
    v0[26] = v7;
    v0[7] = v0 + 18;
    v0[2] = v0;
    v0[3] = sub_100022BBC;
    v8 = swift_continuation_init(v0 + 2, 1);
    v0[17] = v6;
    v9 = sub_100022918(v0 + 14);
    v10 = sub_1000232D8();
    v11 = sub_1000051F0(&qword_1000491A0);
    CheckedContinuation.init(continuation:function:)(v8, 0xD000000000000026, 0x8000000100035F70, v10, v11, &protocol self-conformance witness table for Error);
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(v4 + 32))(v9, v5, v6);
    v0[10] = _NSConcreteStackBlock;
    v12 = v0 + 10;
    v12[1] = 1107296256;
    v12[2] = sub_100022954;
    v12[3] = &unk_100042458;
    objc_msgSend(v2, "openApplication:withOptions:completion:", v7, v13, v12);
    return (id)swift_continuation_await(v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100022BBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 216) = v1;
  if (v1)
    v2 = sub_100022C68;
  else
    v2 = sub_100022C1C;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_100022C1C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 192);

  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100022C68()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = *(void **)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(void **)(v0 + 200);
  swift_willThrow();

  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100022CC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)(v5 + 264) = a5;
  *(_QWORD *)(v5 + 160) = a3;
  *(_QWORD *)(v5 + 168) = a4;
  *(_QWORD *)(v5 + 144) = a1;
  *(_QWORD *)(v5 + 152) = a2;
  v6 = type metadata accessor for MarketplaceDisplayOption(0);
  *(_QWORD *)(v5 + 176) = v6;
  v7 = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 184) = v7;
  *(_QWORD *)(v5 + 192) = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000051F0(&qword_100048980);
  *(_QWORD *)(v5 + 200) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URL(0);
  *(_QWORD *)(v5 + 208) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v5 + 216) = v10;
  *(_QWORD *)(v5 + 224) = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100022D74, 0, 0);
}

id sub_100022D74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::String v7;
  void *object;
  Swift::String v9;
  id result;
  NSURL *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t inited;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  Class isa;
  id v36;
  _QWORD *v37;
  uint64_t v38;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 152);
  if (v1 == 0xD000000000000012 && v2 == 0x8000000100035F30
    || (_stringCompareWithSmolCheck(_:_:expecting:)(v1, v2, 0xD000000000000012, 0x8000000100035F30, 0) & 1) != 0)
  {
    v3 = *(_QWORD *)(v0 + 208);
    v4 = *(_QWORD *)(v0 + 216);
    v5 = *(_QWORD *)(v0 + 200);
    v6 = *(_QWORD *)(v0 + 160);
    _StringGuts.grow(_:)(36);
    swift_bridgeObjectRelease(0xE000000000000000);
    *(_QWORD *)(v0 + 136) = v6;
    v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt64, &protocol witness table for UInt64);
    object = v7._object;
    String.append(_:)(v7);
    swift_bridgeObjectRelease(object);
    v9._countAndFlagsBits = 0x383D746D3FLL;
    v9._object = (void *)0xE500000000000000;
    String.append(_:)(v9);
    URL.init(string:)(0xD00000000000001DLL, 0x8000000100035F50);
    swift_bridgeObjectRelease(0x8000000100035F50);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      sub_10001F134(*(_QWORD *)(v0 + 200));
LABEL_8:
      v18 = *(_QWORD *)(v0 + 192);
      v19 = *(_QWORD *)(v0 + 200);
      swift_task_dealloc(*(_QWORD *)(v0 + 224));
      swift_task_dealloc(v19);
      swift_task_dealloc(v18);
      return (id)(*(uint64_t (**)(void))(v0 + 8))();
    }
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 216) + 32))(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 208));
    result = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
    if (result)
    {
      v12 = result;
      v14 = *(_QWORD *)(v0 + 216);
      v13 = *(_QWORD *)(v0 + 224);
      v15 = *(_QWORD *)(v0 + 208);
      URL._bridgeToObjectiveC()(v11);
      v17 = v16;
      objc_msgSend(v12, "openSensitiveURL:withOptions:", v16, 0);

      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
      goto LABEL_8;
    }
    __break(1u);
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 184);
    v21 = *(_QWORD *)(v0 + 192);
    v22 = *(_QWORD *)(v0 + 176);
    v23 = *(_BYTE *)(v0 + 264);
    *(_OWORD *)v21 = *(_OWORD *)(v0 + 160);
    *(_BYTE *)(v21 + 16) = v23 & 1;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v20 + 104))(v21, enum case for MarketplaceDisplayOption.productPage(_:), v22);
    v24 = type metadata accessor for MarketplaceSceneConnectionOptionDefinition(0);
    v25 = sub_100023290();
    v26 = static UISceneConnectionOptionDefinition.createAction(payload:responder:)(v21, 0, v24, v25);
    *(_QWORD *)(v0 + 232) = v26;
    v27 = (void *)v26;
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 184) + 8))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 176));
    v28 = sub_1000051F0(&qword_100048420);
    inited = swift_initStackObject(v28, v0 + 16);
    *(_OWORD *)(inited + 16) = xmmword_1000336A0;
    *(_QWORD *)(v0 + 120) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyActions);
    *(_QWORD *)(v0 + 128) = v30;
    AnyHashable.init<A>(_:)((_QWORD *)(inited + 32), v0 + 120, &type metadata for String, &protocol witness table for String);
    v31 = sub_1000051F0((uint64_t *)&unk_100048400);
    v32 = swift_allocObject(v31, 40, 7);
    *(_OWORD *)(v32 + 16) = xmmword_1000337A0;
    *(_QWORD *)(v32 + 32) = v27;
    v38 = v32;
    specialized Array._endMutation()();
    *(_QWORD *)(inited + 96) = sub_1000051F0(&qword_100049180);
    *(_QWORD *)(inited + 72) = v38;
    v33 = v27;
    v34 = sub_10002918C(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v34);
    v36 = objc_msgSend((id)objc_opt_self(FBSOpenApplicationOptions), "optionsWithDictionary:", isa);
    *(_QWORD *)(v0 + 240) = v36;

    v37 = (_QWORD *)swift_task_alloc(dword_10004918C);
    *(_QWORD *)(v0 + 248) = v37;
    *v37 = v0;
    v37[1] = sub_10002317C;
    return (id)sub_1000229F4(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 152), (uint64_t)v36);
  }
  return result;
}

uint64_t sub_10002317C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 248);
  *(_QWORD *)(*(_QWORD *)v1 + 256) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_100023234;
  else
    v3 = sub_1000231E0;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000231E0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 232);

  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 200);
  swift_task_dealloc(*(_QWORD *)(v0 + 224));
  swift_task_dealloc(v3);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100023234()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 232);

  v3 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 200);
  swift_task_dealloc(*(_QWORD *)(v0 + 224));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_100023290()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100049178;
  if (!qword_100049178)
  {
    v1 = type metadata accessor for MarketplaceSceneConnectionOptionDefinition(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for MarketplaceSceneConnectionOptionDefinition, v1);
    atomic_store(result, (unint64_t *)&qword_100049178);
  }
  return result;
}

unint64_t sub_1000232D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100049198;
  if (!qword_100049198)
  {
    v1 = objc_opt_self(BSProcessHandle);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100049198);
  }
  return result;
}

uint64_t sub_100023314(uint64_t a1, uint64_t a2)
{
  return sub_10000F65C(a2 + 32, a1 + 32);
}

uint64_t sub_100023324(uint64_t a1)
{
  return sub_10001C164((_QWORD *)(a1 + 32));
}

uint64_t sub_10002332C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4[21] = a3;
  v4[22] = a4;
  v4[19] = a1;
  v4[20] = a2;
  v5 = type metadata accessor for MarketplaceDisplayOption(0);
  v4[23] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[24] = v6;
  v4[25] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000051F0(&qword_100048980);
  v4[26] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URL(0);
  v4[27] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v4[28] = v9;
  v4[29] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for CharacterSet(0);
  v4[30] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v4[31] = v11;
  v4[32] = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100023404, 0, 0);
}

id sub_100023404()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  NSURL *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t inited;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  unint64_t v39;
  Class isa;
  id v41;
  _QWORD *v42;
  id result;
  uint64_t v44;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 160);
  if ((v1 != 0xD000000000000012 || v2 != 0x8000000100035F30)
    && (_stringCompareWithSmolCheck(_:_:expecting:)(v1, v2, 0xD000000000000012, 0x8000000100035F30, 0) & 1) == 0)
  {
    v15 = *(_QWORD *)(v0 + 192);
    v16 = *(_QWORD **)(v0 + 200);
    v18 = *(_QWORD *)(v0 + 176);
    v17 = *(_QWORD *)(v0 + 184);
    *v16 = *(_QWORD *)(v0 + 168);
    v16[1] = v18;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v15 + 104))(v16, enum case for MarketplaceDisplayOption.searchResults(_:), v17);
    v19 = type metadata accessor for MarketplaceSceneConnectionOptionDefinition(0);
    v20 = sub_100023290();
    swift_bridgeObjectRetain(v18);
    v21 = static UISceneConnectionOptionDefinition.createAction(payload:responder:)(v16, 0, v19, v20);
    *(_QWORD *)(v0 + 264) = v21;
    v32 = (void *)v21;
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 184));
    v33 = sub_1000051F0(&qword_100048420);
    inited = swift_initStackObject(v33, v0 + 16);
    *(_OWORD *)(inited + 16) = xmmword_1000336A0;
    *(_QWORD *)(v0 + 120) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyActions);
    *(_QWORD *)(v0 + 128) = v35;
    AnyHashable.init<A>(_:)((_QWORD *)(inited + 32), v0 + 120, &type metadata for String, &protocol witness table for String);
    v36 = sub_1000051F0((uint64_t *)&unk_100048400);
    v37 = swift_allocObject(v36, 40, 7);
    *(_OWORD *)(v37 + 16) = xmmword_1000337A0;
    *(_QWORD *)(v37 + 32) = v32;
    v44 = v37;
    specialized Array._endMutation()();
    *(_QWORD *)(inited + 96) = sub_1000051F0(&qword_100049180);
    *(_QWORD *)(inited + 72) = v44;
    v38 = v32;
    v39 = sub_10002918C(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v39);
    v41 = objc_msgSend((id)objc_opt_self(FBSOpenApplicationOptions), "optionsWithDictionary:", isa);
    *(_QWORD *)(v0 + 272) = v41;

    v42 = (_QWORD *)swift_task_alloc(dword_10004918C);
    *(_QWORD *)(v0 + 280) = v42;
    *v42 = v0;
    v42[1] = sub_10002383C;
    return (id)sub_1000229F4(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 160), (uint64_t)v41);
  }
  v4 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 256);
  v5 = *(_QWORD *)(v0 + 240);
  v6 = *(_QWORD *)(v0 + 176);
  *(_QWORD *)(v0 + 136) = *(_QWORD *)(v0 + 168);
  *(_QWORD *)(v0 + 144) = v6;
  static CharacterSet.urlQueryAllowed.getter();
  v7 = sub_1000227BC();
  v8 = StringProtocol.addingPercentEncoding(withAllowedCharacters:)(v3, &type metadata for String, v7);
  v10 = v9;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (!v10)
    goto LABEL_10;
  v11 = *(_QWORD *)(v0 + 216);
  v12 = *(_QWORD *)(v0 + 224);
  v13 = *(_QWORD *)(v0 + 208);
  _StringGuts.grow(_:)(34);
  swift_bridgeObjectRelease(0xE000000000000000);
  v14._countAndFlagsBits = v8;
  v14._object = v10;
  String.append(_:)(v14);
  swift_bridgeObjectRelease(v10);
  URL.init(string:)(0xD000000000000020, 0x8000000100035FD0);
  swift_bridgeObjectRelease(0x8000000100035FD0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v13, 1, v11) == 1)
  {
    sub_10001F134(*(_QWORD *)(v0 + 208));
LABEL_10:
    v29 = *(_QWORD *)(v0 + 232);
    v31 = *(_QWORD *)(v0 + 200);
    v30 = *(_QWORD *)(v0 + 208);
    swift_task_dealloc(*(_QWORD *)(v0 + 256));
    swift_task_dealloc(v29);
    swift_task_dealloc(v30);
    swift_task_dealloc(v31);
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 32))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 216));
  result = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  if (result)
  {
    v23 = result;
    v25 = *(_QWORD *)(v0 + 224);
    v24 = *(_QWORD *)(v0 + 232);
    v26 = *(_QWORD *)(v0 + 216);
    URL._bridgeToObjectiveC()(v22);
    v28 = v27;
    objc_msgSend(v23, "openSensitiveURL:withOptions:", v27, 0);

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002383C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 280);
  *(_QWORD *)(*(_QWORD *)v1 + 288) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_100023908;
  else
    v3 = sub_1000238A0;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000238A0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 264);

  v2 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 208);
  swift_task_dealloc(*(_QWORD *)(v0 + 256));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100023908()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 264);

  v2 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 208);
  swift_task_dealloc(*(_QWORD *)(v0 + 256));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100023970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[19] = a3;
  v4[20] = a4;
  v4[17] = a1;
  v4[18] = a2;
  v5 = type metadata accessor for MarketplaceDisplayOption(0);
  v4[21] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[22] = v6;
  v4[23] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000239D4, 0, 0);
}

uint64_t sub_1000239D4()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  Class isa;
  id v17;
  _QWORD *v18;
  uint64_t v20;

  v1 = v0[22];
  v2 = (_QWORD *)v0[23];
  v4 = v0[20];
  v3 = v0[21];
  *v2 = v0[19];
  v2[1] = v4;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v1 + 104))(v2, enum case for MarketplaceDisplayOption.authentication(_:), v3);
  v5 = type metadata accessor for MarketplaceSceneConnectionOptionDefinition(0);
  v6 = sub_100023290();
  swift_bridgeObjectRetain(v4);
  v7 = static UISceneConnectionOptionDefinition.createAction(payload:responder:)(v2, 0, v5, v6);
  v0[24] = v7;
  v8 = (void *)v7;
  (*(void (**)(_QWORD, _QWORD))(v0[22] + 8))(v0[23], v0[21]);
  v9 = sub_1000051F0(&qword_100048420);
  inited = swift_initStackObject(v9, v0 + 2);
  *(_OWORD *)(inited + 16) = xmmword_1000336A0;
  v0[15] = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyActions);
  v0[16] = v11;
  AnyHashable.init<A>(_:)((_QWORD *)(inited + 32), v0 + 15, &type metadata for String, &protocol witness table for String);
  v12 = sub_1000051F0((uint64_t *)&unk_100048400);
  v13 = swift_allocObject(v12, 40, 7);
  *(_OWORD *)(v13 + 16) = xmmword_1000337A0;
  *(_QWORD *)(v13 + 32) = v8;
  v20 = v13;
  specialized Array._endMutation()();
  *(_QWORD *)(inited + 96) = sub_1000051F0(&qword_100049180);
  *(_QWORD *)(inited + 72) = v20;
  v14 = v8;
  v15 = sub_10002918C(inited);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v15);
  v17 = objc_msgSend((id)objc_opt_self(FBSOpenApplicationOptions), "optionsWithDictionary:", isa);
  v0[25] = v17;

  v18 = (_QWORD *)swift_task_alloc(dword_10004918C);
  v0[26] = v18;
  *v18 = v0;
  v18[1] = sub_100023C04;
  return sub_1000229F4(v0[17], v0[18], (uint64_t)v17);
}

uint64_t sub_100023C04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 208);
  *(_QWORD *)(*(_QWORD *)v1 + 216) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_100023CAC;
  else
    v3 = sub_100023C68;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_100023C68()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 184);

  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100023CAC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 192);

  swift_task_dealloc(*(_QWORD *)(v0 + 184));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100023CEC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = v0;
  return swift_task_switch(sub_100023D04, 0, 0);
}

uint64_t sub_100023D04()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  void **v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  char *v9;
  uint8_t *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSString v19;
  id v20;
  uint64_t v21;
  _QWORD *v22;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  char *v27;
  uint8_t *v28;
  _QWORD *v29;
  void *v30;
  id v31;
  uint64_t v32;
  _QWORD *v33;

  v1 = v0;
  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v2 = (_QWORD *)(v0 + 24);
  v4 = (void **)(v0 + 32);
  v3 = *(void **)(v1 + 32);
  v5 = type metadata accessor for Logger(0);
  sub_100007D98(v5, (uint64_t)qword_10004AD30);
  v6 = Logger.logObject.getter(v3);
  v7 = static os_log_type_t.default.getter();
  v8 = os_log_type_enabled(v6, v7);
  v9 = (char *)*v4;
  if (v8)
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v33 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 138412290;
    v11 = *(void **)&v9[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey];
    *v2 = v11;
    v12 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 24, v1 + 32, v10 + 4, v10 + 12);
    *v33 = v11;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Running license resolution task", v10, 0xCu);
    v13 = sub_1000051F0(&qword_1000483E8);
    swift_arrayDestroy(v33, 1, v13);
    swift_slowDealloc(v33, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }
  else
  {

  }
  v14 = objc_msgSend((id)objc_opt_self(RBSProcessIdentity), "identityOfCurrentProcess");
  *(_QWORD *)(v1 + 40) = v14;
  v15 = *(void **)(v1 + 32);
  if (v14)
  {
    v16 = v14;
    v17 = objc_allocWithZone((Class)SBSRemoteAlertDefinition);
    v18 = v16;
    v19 = String._bridgeToObjectiveC()();
    v20 = objc_msgSend(v17, "initWithSceneProvidingProcess:configurationIdentifier:", v18, v19);
    *(_QWORD *)(v1 + 48) = v20;

    v21 = swift_task_alloc(32);
    *(_QWORD *)(v1 + 56) = v21;
    *(_QWORD *)(v21 + 16) = v15;
    *(_QWORD *)(v21 + 24) = v20;
    v22 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
    *(_QWORD *)(v1 + 64) = v22;
    *v22 = v1;
    v22[1] = sub_1000240E4;
    return withCheckedContinuation<A>(isolation:function:_:)(v22, 0, 0, 0x29286E7572, 0xE500000000000000, sub_100025A6C, v21, (char *)&type metadata for () + 8);
  }
  else
  {
    v24 = Logger.logObject.getter(v15);
    v25 = static os_log_type_t.error.getter();
    v26 = os_log_type_enabled(v24, v25);
    v27 = (char *)*v4;
    if (v26)
    {
      v28 = (uint8_t *)swift_slowAlloc(12, -1);
      v29 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v28 = 138412290;
      v30 = *(void **)&v27[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey];
      *(_QWORD *)(v1 + 16) = v30;
      v31 = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, v28 + 4, v28 + 12);
      *v29 = v30;

      _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%@] No identity", v28, 0xCu);
      v32 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v29, 1, v32);
      swift_slowDealloc(v29, -1, -1);
      swift_slowDealloc(v28, -1, -1);
    }
    else
    {

    }
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000240E4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 64));
  swift_task_dealloc(v1);
  return swift_task_switch(sub_100024140, 0, 0);
}

uint64_t sub_100024140()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 48);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_100024174(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, char *, uint64_t);
  void *v13;
  void *v14;
  char *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t inited;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  Class isa;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  Class v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  char v50[112];
  char v51[40];
  uint64_t aBlock;
  unint64_t v53;
  void (*v54)(uint64_t, void *);
  void *v55;
  uint64_t (*v56)(uint64_t);
  uint64_t v57;

  v47 = a3;
  v5 = sub_1000051F0((uint64_t *)&unk_100049220);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  __chkstk_darwin(v5);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = objc_msgSend(objc_allocWithZone((Class)SBSRemoteAlertConfigurationContext), "init");
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v9 + 24) & ~v9;
  v11 = swift_allocObject(&unk_100042490, v10 + v7, v9 | 7);
  *(_QWORD *)(v11 + 16) = a2;
  v12 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 32);
  v48 = v5;
  v12(v11 + v10, v8, v5);
  v56 = sub_100025AEC;
  v57 = v11;
  aBlock = (uint64_t)_NSConcreteStackBlock;
  v53 = 1107296256;
  v54 = sub_1000125C0;
  v55 = &unk_1000424A8;
  v13 = _Block_copy(&aBlock);
  v14 = (void *)objc_opt_self(BSActionResponder);
  v15 = a2;
  v16 = objc_msgSend(v14, "responderWithHandler:", v13);
  _Block_release(v13);
  swift_release(v57);
  v17 = objc_msgSend(objc_allocWithZone((Class)BSAction), "initWithInfo:responder:", 0, v16);
  v18 = sub_1000051F0((uint64_t *)&unk_100048400);
  inited = swift_initStackObject(v18, v51);
  *(_OWORD *)(inited + 16) = xmmword_1000337A0;
  *(_QWORD *)(inited + 32) = v17;
  aBlock = inited;
  specialized Array._endMutation()();
  v20 = aBlock;
  if ((unint64_t)aBlock >> 62)
  {
    if (aBlock < 0)
      v44 = aBlock;
    else
      v44 = aBlock & 0xFFFFFFFFFFFFFF8;
    v45 = v17;
    swift_bridgeObjectRetain(v20);
    v21 = _CocoaArrayWrapper.endIndex.getter(v44);
    swift_bridgeObjectRelease(v20);
  }
  else
  {
    v21 = *(_QWORD *)((aBlock & 0xFFFFFFFFFFFFF8) + 0x10);
    v22 = v17;
  }
  v23 = v49;
  if (v21)
  {
    sub_100024BEC(v20);
    v25 = v24;
  }
  else
  {
    v25 = &_swiftEmptySetSingleton;
  }
  swift_bridgeObjectRelease(v20);
  sub_100009FE4();
  sub_100005954((unint64_t *)&qword_100048410, (uint64_t (*)(uint64_t))sub_100009FE4, (uint64_t)&protocol conformance descriptor for NSObject);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v25);
  objc_msgSend(v23, "setActions:", isa);

  v27 = type metadata accessor for JSONEncoder(0);
  swift_allocObject(v27, *(unsigned int *)(v27 + 48), *(unsigned __int16 *)(v27 + 52));
  v28 = JSONEncoder.init()();
  v29 = &v15[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_context];
  v30 = type metadata accessor for LicenseResolutionContext(0);
  v31 = sub_100005954((unint64_t *)&unk_100049240, (uint64_t (*)(uint64_t))&type metadata accessor for LicenseResolutionContext, (uint64_t)&protocol conformance descriptor for LicenseResolutionContext);
  v32 = dispatch thunk of JSONEncoder.encode<A>(_:)(v29, v30, v31);
  v34 = v33;
  swift_release(v28);
  v35 = sub_1000051F0(&qword_100048420);
  v36 = swift_initStackObject(v35, v50);
  *(_OWORD *)(v36 + 16) = xmmword_1000336A0;
  aBlock = 0x44747865746E6F63;
  v53 = 0xEB00000000617461;
  AnyHashable.init<A>(_:)((_QWORD *)(v36 + 32), &aBlock, &type metadata for String, &protocol witness table for String);
  *(_QWORD *)(v36 + 96) = &type metadata for Data;
  *(_QWORD *)(v36 + 72) = v32;
  *(_QWORD *)(v36 + 80) = v34;
  sub_10000A020(v32, v34);
  v37 = sub_10002918C(v36);
  v38 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v37);
  objc_msgSend(v23, "setUserInfo:", v38);

  v39 = (void *)objc_opt_self(SBSRemoteAlertHandle);
  v40 = objc_msgSend(v39, "newHandleWithDefinition:configurationContext:", v47, v23);
  v41 = *(void **)&v15[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_remoteHandle];
  *(_QWORD *)&v15[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_remoteHandle] = v40;
  v42 = v40;

  objc_msgSend(v42, "registerObserver:", v15);
  v43 = objc_msgSend(objc_allocWithZone((Class)SBSRemoteAlertActivationContext), "init");
  objc_msgSend(v42, "activateWithContext:", v43);

  sub_10000A064(v32, v34);
}

uint64_t sub_1000247B8(uint64_t a1, void *a2)
{
  uint64_t v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;

  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v3 = type metadata accessor for Logger(0);
  sub_100007D98(v3, (uint64_t)qword_10004AD30);
  v4 = a2;
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v7 = 138412290;
    v9 = *(void **)&v4[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey];
    v14 = v9;
    v10 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v7 + 4, v7 + 12);
    *v8 = v9;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[%@] Dismissing license resolution sheet", v7, 0xCu);
    v11 = sub_1000051F0(&qword_1000483E8);
    swift_arrayDestroy(v8, 1, v11);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {

  }
  v12 = sub_1000051F0((uint64_t *)&unk_100049220);
  return CheckedContinuation.resume(returning:)(v12, v12);
}

id sub_10002499C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LicenseResolutionTask(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100024A30()
{
  return type metadata accessor for LicenseResolutionTask(0);
}

uint64_t type metadata accessor for LicenseResolutionTask(uint64_t a1)
{
  uint64_t result;

  result = qword_100049200;
  if (!qword_100049200)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LicenseResolutionTask);
  return result;
}

uint64_t sub_100024A74(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = type metadata accessor for LicenseResolutionContext(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[2] = "\b";
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

void sub_100024BEC(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  Swift::Int v27;
  id v28;
  Swift::Int v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  id v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v1 = a1;
  v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v6 = a1;
    else
      v6 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_1000051F0(&qword_100049250);
      v4 = (_QWORD *)static _SetStorage.allocate(capacity:)(v3);
      if (!v2)
        goto LABEL_4;
LABEL_11:
      if (v1 < 0)
        v7 = v1;
      else
        v7 = v1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v1);
      v5 = _CocoaArrayWrapper.endIndex.getter(v7);
      swift_bridgeObjectRelease(v1);
      if (!v5)
        return;
      goto LABEL_15;
    }
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
  }
  v4 = &_swiftEmptySetSingleton;
  if (v2)
    goto LABEL_11;
LABEL_4:
  v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v5)
    return;
LABEL_15:
  v8 = (char *)(v4 + 7);
  v44 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v9 = 0;
    v42 = v1;
    while (1)
    {
      v10 = specialized _ArrayBuffer._getElementSlowPath(_:)(v9, v1);
      v11 = __OFADD__(v9++, 1);
      if (v11)
      {
        __break(1u);
        goto LABEL_43;
      }
      v12 = v10;
      v13 = NSObject._rawHashValue(seed:)(v4[5]);
      v14 = -1 << *((_BYTE *)v4 + 32);
      v15 = v13 & ~v14;
      v16 = v15 >> 6;
      v17 = *(_QWORD *)&v8[8 * (v15 >> 6)];
      v18 = 1 << v15;
      if (((1 << v15) & v17) != 0)
      {
        sub_100009FE4();
        v19 = *(id *)(v4[6] + 8 * v15);
        v20 = static NSObject.== infix(_:_:)(v19);

        if ((v20 & 1) != 0)
        {
LABEL_17:
          swift_unknownObjectRelease(v12);
          v1 = v42;
          goto LABEL_18;
        }
        v21 = ~v14;
        while (1)
        {
          v15 = (v15 + 1) & v21;
          v16 = v15 >> 6;
          v17 = *(_QWORD *)&v8[8 * (v15 >> 6)];
          v18 = 1 << v15;
          if ((v17 & (1 << v15)) == 0)
            break;
          v22 = *(id *)(v4[6] + 8 * v15);
          v23 = static NSObject.== infix(_:_:)(v22);

          if ((v23 & 1) != 0)
            goto LABEL_17;
        }
        v1 = v42;
      }
      *(_QWORD *)&v8[8 * v16] = v18 | v17;
      *(_QWORD *)(v4[6] + 8 * v15) = v12;
      v24 = v4[2];
      v11 = __OFADD__(v24, 1);
      v25 = v24 + 1;
      if (v11)
        goto LABEL_44;
      v4[2] = v25;
LABEL_18:
      if (v9 == v44)
        return;
    }
  }
  v26 = 0;
  v43 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v26 != v43)
  {
    v27 = v4[5];
    v28 = *(id *)(v1 + 32 + 8 * v26);
    v29 = NSObject._rawHashValue(seed:)(v27);
    v30 = -1 << *((_BYTE *)v4 + 32);
    v31 = v29 & ~v30;
    v32 = v31 >> 6;
    v33 = *(_QWORD *)&v8[8 * (v31 >> 6)];
    v34 = 1 << v31;
    if (((1 << v31) & v33) != 0)
    {
      sub_100009FE4();
      v35 = *(id *)(v4[6] + 8 * v31);
      v36 = static NSObject.== infix(_:_:)(v35);

      if ((v36 & 1) != 0)
        goto LABEL_30;
      v37 = ~v30;
      v31 = (v31 + 1) & v37;
      v32 = v31 >> 6;
      v33 = *(_QWORD *)&v8[8 * (v31 >> 6)];
      v34 = 1 << v31;
      if ((v33 & (1 << v31)) != 0)
      {
        while (1)
        {
          v38 = *(id *)(v4[6] + 8 * v31);
          v39 = static NSObject.== infix(_:_:)(v38);

          if ((v39 & 1) != 0)
            break;
          v31 = (v31 + 1) & v37;
          v32 = v31 >> 6;
          v33 = *(_QWORD *)&v8[8 * (v31 >> 6)];
          v34 = 1 << v31;
          if ((v33 & (1 << v31)) == 0)
            goto LABEL_38;
        }
LABEL_30:

        v5 = v44;
        goto LABEL_31;
      }
LABEL_38:
      v5 = v44;
    }
    *(_QWORD *)&v8[8 * v32] = v34 | v33;
    *(_QWORD *)(v4[6] + 8 * v31) = v28;
    v40 = v4[2];
    v11 = __OFADD__(v40, 1);
    v41 = v40 + 1;
    if (v11)
      goto LABEL_45;
    v4[2] = v41;
LABEL_31:
    if (++v26 == v5)
      return;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
}

void *sub_100024F44(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  void *result;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;

  v2 = type metadata accessor for MetricsFieldInclusionRequest(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v30 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    sub_1000051F0(&qword_100049260);
    v10 = static _SetStorage.allocate(capacity:)(v9);
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v31 = v9;
    v32 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v34 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v35 = v10 + 56;
    while (1)
    {
      v33 = v11;
      v34(v8, v32 + v13 * v11, v2);
      v14 = *(_QWORD *)(v10 + 40);
      v15 = sub_100005954(&qword_100049268, (uint64_t (*)(uint64_t))&type metadata accessor for MetricsFieldInclusionRequest, (uint64_t)&protocol conformance descriptor for MetricsFieldInclusionRequest);
      v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v2, v15);
      v17 = ~(-1 << *(_BYTE *)(v10 + 32));
      v18 = v16 & v17;
      v19 = (v16 & (unint64_t)v17) >> 6;
      v20 = *(_QWORD *)(v35 + 8 * v19);
      v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        do
        {
          v34(v6, *(_QWORD *)(v10 + 48) + v18 * v13, v2);
          v22 = sub_100005954((unint64_t *)&unk_100049270, (uint64_t (*)(uint64_t))&type metadata accessor for MetricsFieldInclusionRequest, (uint64_t)&protocol conformance descriptor for MetricsFieldInclusionRequest);
          v23 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v8, v2, v22);
          v24 = v3;
          v25 = *(void (**)(char *, uint64_t))(v3 + 8);
          v25(v6, v2);
          if ((v23 & 1) != 0)
          {
            v25(v8, v2);
            v3 = v24;
            v9 = v31;
            goto LABEL_4;
          }
          v18 = (v18 + 1) & v17;
          v19 = v18 >> 6;
          v20 = *(_QWORD *)(v35 + 8 * (v18 >> 6));
          v21 = 1 << v18;
          v3 = v24;
        }
        while ((v20 & (1 << v18)) != 0);
        v9 = v31;
      }
      *(_QWORD *)(v35 + 8 * v19) = v21 | v20;
      result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v18 * v13, v8, v2);
      v27 = *(_QWORD *)(v10 + 16);
      v28 = __OFADD__(v27, 1);
      v29 = v27 + 1;
      if (v28)
        break;
      *(_QWORD *)(v10 + 16) = v29;
LABEL_4:
      v11 = v33 + 1;
      if (v33 + 1 == v9)
        return (void *)v10;
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptySetSingleton;
  }
  return result;
}

Swift::Int sub_1000251AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Swift::Int result;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  _QWORD v12[9];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_1000051F0(&qword_100049258);
    v2 = static _SetStorage.allocate(capacity:)(v1);
    v3 = v2 + 56;
    while (1)
    {
      Hasher.init(_seed:)(v12, *(_QWORD *)(v2 + 40));
      String.hash(into:)(v12, 0xD000000000000022, 0x8000000100034540);
      result = Hasher._finalize()();
      v5 = result & ~(-1 << *(_BYTE *)(v2 + 32));
      v6 = v5 >> 6;
      v7 = *(_QWORD *)(v3 + 8 * (v5 >> 6));
      v8 = 1 << v5;
      if ((v8 & v7) == 0)
      {
        *(_QWORD *)(v3 + 8 * v6) = v8 | v7;
        v9 = *(_QWORD *)(v2 + 16);
        v10 = __OFADD__(v9, 1);
        v11 = v9 + 1;
        if (v10)
        {
          __break(1u);
          return result;
        }
        *(_QWORD *)(v2 + 16) = v11;
      }
      if (!--v1)
        return v2;
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

void sub_1000252A4()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;

  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v1 = type metadata accessor for Logger(0);
  sub_100007D98(v1, (uint64_t)qword_10004AD30);
  v9 = v0;
  v2 = Logger.logObject.getter(v9);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(12, -1);
    v5 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v4 = 138412290;
    v6 = *(void **)&v9[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey];
    v10 = v6;
    v7 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v4 + 4, v4 + 12);
    *v5 = v6;

    _os_log_impl((void *)&_mh_execute_header, v2, v3, "[%@] Remote alert did activate", v4, 0xCu);
    v8 = sub_1000051F0(&qword_1000483E8);
    swift_arrayDestroy(v5, 1, v8);
    swift_slowDealloc(v5, -1, -1);
    swift_slowDealloc(v4, -1, -1);

  }
  else
  {

  }
}

void sub_10002545C()
{
  void *v0;
  uint64_t v1;
  char *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v1 = type metadata accessor for Logger(0);
  sub_100007D98(v1, (uint64_t)qword_10004AD30);
  v2 = v0;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v5 = 138412290;
    v7 = *(void **)&v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey];
    v13 = v7;
    v8 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v5 + 4, v5 + 12);
    *v6 = v7;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@] Remote alert did deactivate", v5, 0xCu);
    v9 = sub_1000051F0(&qword_1000483E8);
    swift_arrayDestroy(v6, 1, v9);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
  v10 = OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_remoteHandle;
  v11 = *(void **)&v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_remoteHandle];
  if (v11)
  {
    objc_msgSend(v11, "unregisterObserver:", v2);
    v11 = *(void **)&v2[v10];
  }
  objc_msgSend(v11, "invalidate");
  v12 = *(void **)&v2[v10];
  *(_QWORD *)&v2[v10] = 0;

}

void sub_100025630(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *oslog;
  _QWORD v28[3];
  char v29[8];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v3 = OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_remoteHandle;
  v4 = *(void **)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_remoteHandle];
  if (v4)
  {
    objc_msgSend(v4, "unregisterObserver:", v1);
    v4 = *(void **)&v1[v3];
  }
  objc_msgSend(v4, "invalidate");
  v5 = *(void **)&v1[v3];
  *(_QWORD *)&v1[v3] = 0;

  if (a1)
  {
    swift_errorRetain(a1);
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v6 = type metadata accessor for Logger(0);
    sub_100007D98(v6, (uint64_t)qword_10004AD30);
    swift_errorRetain(a1);
    v7 = v1;
    swift_errorRetain(a1);
    v8 = v7;
    oslog = Logger.logObject.getter(v8);
    v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v9))
    {
      v10 = swift_slowAlloc(22, -1);
      v11 = (_QWORD *)swift_slowAlloc(8, -1);
      v12 = swift_slowAlloc(32, -1);
      v31 = v12;
      *(_DWORD *)v10 = 138412546;
      v13 = *(void **)&v8[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey];
      v30 = (uint64_t)v13;
      v14 = v13;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v10 + 4, v10 + 12);
      *v11 = v13;

      *(_WORD *)(v10 + 12) = 2082;
      swift_getErrorValue(a1, v29, v28);
      v15 = Error.localizedDescription.getter(v28[1], v28[2]);
      v17 = v16;
      v30 = sub_100030804(v15, v16, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v10 + 14, v10 + 22);
      swift_bridgeObjectRelease(v17);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, oslog, v9, "[%@] Remote alert did invalidate with error: %{public}s", (uint8_t *)v10, 0x16u);
      v18 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v11, 1, v18);
      swift_slowDealloc(v11, -1, -1);
      swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v12, -1, -1);
      swift_slowDealloc(v10, -1, -1);

      swift_errorRelease(a1);
      return;
    }
    swift_errorRelease(a1);

    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }
  else
  {
    if (qword_100047FB0 != -1)
      swift_once(&qword_100047FB0, sub_10002865C);
    v19 = type metadata accessor for Logger(0);
    sub_100007D98(v19, (uint64_t)qword_10004AD30);
    oslog = v1;
    v20 = Logger.logObject.getter(oslog);
    v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(12, -1);
      v23 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v22 = 138412290;
      v24 = *(Class *)((char *)&oslog->isa + OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey);
      v31 = (uint64_t)v24;
      v25 = v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v22 + 4, v22 + 12);
      *v23 = v24;

      _os_log_impl((void *)&_mh_execute_header, v20, v21, "[%@] Remote alert did invalidate", v22, 0xCu);
      v26 = sub_1000051F0(&qword_1000483E8);
      swift_arrayDestroy(v23, 1, v26);
      swift_slowDealloc(v23, -1, -1);
      swift_slowDealloc(v22, -1, -1);

      return;
    }

  }
}

void sub_100025A6C(uint64_t a1)
{
  uint64_t v1;

  sub_100024174(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_100025A74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_1000051F0((uint64_t *)&unk_100049220);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100025AEC(uint64_t a1)
{
  uint64_t v1;

  sub_1000051F0((uint64_t *)&unk_100049220);
  return sub_1000247B8(a1, *(void **)(v1 + 16));
}

uint64_t sub_100025B30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100025B40(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t *sub_100025B48(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
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
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v15 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v15);
  }
  else
  {
    v20 = a2[1];
    *a1 = *a2;
    a1[1] = v20;
    v5 = a2[3];
    a1[2] = a2[2];
    a1[3] = v5;
    v6 = a2[5];
    a1[4] = a2[4];
    a1[5] = v6;
    v7 = a2[7];
    a1[6] = a2[6];
    a1[7] = v7;
    v8 = a2[9];
    a1[8] = a2[8];
    a1[9] = v8;
    v9 = a2[11];
    a1[10] = a2[10];
    a1[11] = v9;
    v10 = a2[13];
    a1[12] = a2[12];
    a1[13] = v10;
    v11 = a2[15];
    a1[14] = a2[14];
    a1[15] = v11;
    v12 = a2[17];
    a1[16] = a2[16];
    a1[17] = v12;
    v19 = a2[19];
    a1[18] = a2[18];
    a1[19] = v19;
    v17 = a2[21];
    v13 = *(int *)(a3 + 60);
    v21 = (char *)a1 + v13;
    v22 = (char *)a2 + v13;
    a1[20] = a2[20];
    a1[21] = v17;
    v14 = type metadata accessor for InstallSheetContext(0);
    v18 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain(v20);
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v19);
    swift_bridgeObjectRetain(v17);
    v18(v21, v22, v14);
  }
  return v3;
}

uint64_t sub_100025CB0(_QWORD *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(a1[9]);
  swift_bridgeObjectRelease(a1[11]);
  swift_bridgeObjectRelease(a1[13]);
  swift_bridgeObjectRelease(a1[15]);
  swift_bridgeObjectRelease(a1[17]);
  swift_bridgeObjectRelease(a1[19]);
  swift_bridgeObjectRelease(a1[21]);
  v4 = (char *)a1 + *(int *)(a2 + 60);
  v5 = type metadata accessor for InstallSheetContext(0);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_100025D48(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;

  v18 = a2[1];
  *a1 = *a2;
  a1[1] = v18;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  v9 = a2[13];
  a1[12] = a2[12];
  a1[13] = v9;
  v10 = a2[15];
  a1[14] = a2[14];
  a1[15] = v10;
  v11 = a2[17];
  a1[16] = a2[16];
  a1[17] = v11;
  v17 = a2[19];
  a1[18] = a2[18];
  a1[19] = v17;
  v15 = a2[21];
  v12 = *(int *)(a3 + 60);
  v19 = (char *)a1 + v12;
  v20 = (char *)a2 + v12;
  a1[20] = a2[20];
  a1[21] = v15;
  v13 = type metadata accessor for InstallSheetContext(0);
  v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v15);
  v16(v19, v20, v13);
  return a1;
}

_QWORD *sub_100025E84(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  char *v29;
  char *v30;
  uint64_t v31;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[2] = a2[2];
  v8 = a2[3];
  v9 = a1[3];
  a1[3] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[4] = a2[4];
  v10 = a2[5];
  v11 = a1[5];
  a1[5] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  a1[6] = a2[6];
  v12 = a2[7];
  v13 = a1[7];
  a1[7] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  a1[8] = a2[8];
  v14 = a2[9];
  v15 = a1[9];
  a1[9] = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  a1[10] = a2[10];
  v16 = a2[11];
  v17 = a1[11];
  a1[11] = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  a1[12] = a2[12];
  v18 = a2[13];
  v19 = a1[13];
  a1[13] = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  a1[14] = a2[14];
  v20 = a2[15];
  v21 = a1[15];
  a1[15] = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  a1[16] = a2[16];
  v22 = a2[17];
  v23 = a1[17];
  a1[17] = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v23);
  a1[18] = a2[18];
  v24 = a2[19];
  v25 = a1[19];
  a1[19] = v24;
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRelease(v25);
  a1[20] = a2[20];
  v26 = a2[21];
  v27 = a1[21];
  a1[21] = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v27);
  v28 = *(int *)(a3 + 60);
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  v31 = type metadata accessor for InstallSheetContext(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 24))(v29, v30, v31);
  return a1;
}

_OWORD *sub_100026040(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  v9 = *(int *)(a3 + 60);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  a1[10] = a2[10];
  v12 = type metadata accessor for InstallSheetContext(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

_QWORD *sub_1000260C4(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  char *v29;
  char *v30;
  uint64_t v31;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = a2[3];
  v9 = a1[3];
  a1[2] = a2[2];
  a1[3] = v8;
  swift_bridgeObjectRelease(v9);
  v10 = a2[5];
  v11 = a1[5];
  a1[4] = a2[4];
  a1[5] = v10;
  swift_bridgeObjectRelease(v11);
  v12 = a2[7];
  v13 = a1[7];
  a1[6] = a2[6];
  a1[7] = v12;
  swift_bridgeObjectRelease(v13);
  v14 = a2[9];
  v15 = a1[9];
  a1[8] = a2[8];
  a1[9] = v14;
  swift_bridgeObjectRelease(v15);
  v16 = a2[11];
  v17 = a1[11];
  a1[10] = a2[10];
  a1[11] = v16;
  swift_bridgeObjectRelease(v17);
  v18 = a2[13];
  v19 = a1[13];
  a1[12] = a2[12];
  a1[13] = v18;
  swift_bridgeObjectRelease(v19);
  v20 = a2[15];
  v21 = a1[15];
  a1[14] = a2[14];
  a1[15] = v20;
  swift_bridgeObjectRelease(v21);
  v22 = a2[17];
  v23 = a1[17];
  a1[16] = a2[16];
  a1[17] = v22;
  swift_bridgeObjectRelease(v23);
  v24 = a2[19];
  v25 = a1[19];
  a1[18] = a2[18];
  a1[19] = v24;
  swift_bridgeObjectRelease(v25);
  v26 = a2[21];
  v27 = a1[21];
  a1[20] = a2[20];
  a1[21] = v26;
  swift_bridgeObjectRelease(v27);
  v28 = *(int *)(a3 + 60);
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  v31 = type metadata accessor for InstallSheetContext(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 40))(v29, v30, v31);
  return a1;
}

uint64_t sub_1000261D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000261DC);
}

uint64_t sub_1000261DC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for InstallSheetContext(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 60), a2, v8);
  }
}

uint64_t sub_100026258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100026264);
}

uint64_t sub_100026264(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for InstallSheetContext(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 60), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for LocalizedInstallSheetContent(uint64_t a1)
{
  uint64_t result;

  result = qword_1000492D8;
  if (!qword_1000492D8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LocalizedInstallSheetContent);
  return result;
}

uint64_t sub_100026314(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[12];

  v4[0] = &unk_100034110;
  v4[1] = &unk_100034110;
  v4[2] = &unk_100034110;
  v4[3] = &unk_100034110;
  v4[4] = &unk_100034110;
  v4[5] = &unk_100034110;
  v4[6] = &unk_100034110;
  v4[7] = &unk_100034110;
  v4[8] = &unk_100034110;
  v4[9] = &unk_100034110;
  v4[10] = &unk_100034110;
  result = type metadata accessor for InstallSheetContext(319);
  if (v3 <= 0x3F)
  {
    v4[11] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 12, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_10002639C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3[121] = a3;
  v3[120] = a2;
  v3[119] = a1;
  v4 = type metadata accessor for InstallSheetContext.InstallType(0);
  v3[122] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[123] = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[124] = swift_task_alloc(v6);
  v3[125] = swift_task_alloc(v6);
  v3[126] = swift_task_alloc(v6);
  v7 = type metadata accessor for InstallSheetContext.Source(0);
  v3[127] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[128] = v8;
  v3[129] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100026448, 0, 0);
}

uint64_t sub_100026448()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 960);
  v2 = *(_QWORD *)(v0 + 952);
  v3 = v2 + *(int *)(type metadata accessor for LocalizedInstallSheetContent(0) + 60);
  v4 = type metadata accessor for InstallSheetContext(0);
  *(_QWORD *)(v0 + 1040) = v4;
  v5 = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v0 + 1048) = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v1, v4);
  *(_QWORD *)(v0 + 16) = 2;
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 24) = 0;
  *(_BYTE *)(v0 + 48) = 7;
  v6 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1056) = v6;
  *v6 = v0;
  v6[1] = sub_1000264F0;
  return sub_100022108(v0 + 16);
}

uint64_t sub_1000264F0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1056);
  *(_QWORD *)(v3 + 1064) = a1;
  *(_QWORD *)(v3 + 1072) = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_100026550, 0, 0);
}

uint64_t sub_100026550()
{
  uint64_t v0;
  void *v1;
  Swift::String v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  Swift::String v7;
  void *object;
  Swift::String v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;

  v1 = *(void **)(v0 + 1072);
  v2._countAndFlagsBits = *(_QWORD *)(v0 + 1064);
  v3 = *(_QWORD *)(v0 + 1032);
  v4 = *(_QWORD *)(v0 + 1024);
  v5 = *(_QWORD *)(v0 + 1016);
  v2._object = v1;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(v1);
  v6._countAndFlagsBits = 10333;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  v7._countAndFlagsBits = InstallSheetContext.learnMoreURL.getter();
  object = v7._object;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(object);
  v9._countAndFlagsBits = 41;
  v9._object = (void *)0xE100000000000000;
  String.append(_:)(v9);
  *(_QWORD *)(v0 + 1080) = 91;
  *(_QWORD *)(v0 + 1088) = 0xE100000000000000;
  InstallSheetContext.source.getter(v10);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 88))(v3, v5);
  if (v11 == enum case for InstallSheetContext.Source.appStoreWithContext(_:))
  {
    v12 = *(_QWORD *)(v0 + 1032);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 1024) + 96))(v12, *(_QWORD *)(v0 + 1016));
    v13 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
LABEL_3:
    v14 = v0 + 416;
    *(_QWORD *)(v0 + 416) = 3;
    *(_QWORD *)(v0 + 424) = 0;
    *(_QWORD *)(v0 + 432) = 0;
    *(_QWORD *)(v0 + 440) = 0;
    *(_BYTE *)(v0 + 448) = 7;
    v15 = (_QWORD *)swift_task_alloc(dword_100049064);
    *(_QWORD *)(v0 + 1096) = v15;
    v16 = sub_1000268BC;
LABEL_4:
    *v15 = v0;
    v15[1] = v16;
    return sub_100022108(v14);
  }
  if (v11 == enum case for InstallSheetContext.Source.distributor(_:))
  {
    v18 = *(uint64_t **)(v0 + 1032);
    (*(void (**)(uint64_t *, _QWORD))(*(_QWORD *)(v0 + 1024) + 96))(v18, *(_QWORD *)(v0 + 1016));
    v19 = *v18;
    *(_QWORD *)(v0 + 1152) = *v18;
    v20 = v18[1];
    *(_QWORD *)(v0 + 1160) = v20;
    swift_bridgeObjectRelease(v18[3]);
    *(_QWORD *)(v0 + 296) = v19;
    *(_QWORD *)(v0 + 304) = v20;
    *(_QWORD *)(v0 + 312) = 0;
    *(_QWORD *)(v0 + 320) = 0;
    *(_BYTE *)(v0 + 328) = 1;
    v21 = dword_100049064;
    swift_bridgeObjectRetain(v20);
    v22 = (_QWORD *)swift_task_alloc(v21);
    *(_QWORD *)(v0 + 1168) = v22;
    *v22 = v0;
    v22[1] = sub_100026B44;
    return sub_100022108(v0 + 296);
  }
  else
  {
    if (v11 == enum case for InstallSheetContext.Source.web(_:))
    {
      v23 = *(uint64_t **)(v0 + 1032);
      v24 = *(_QWORD *)(v0 + 1008);
      v25 = *(_QWORD *)(v0 + 984);
      v26 = *(_QWORD *)(v0 + 976);
      v27 = (*(uint64_t (**)(uint64_t *, _QWORD))(*(_QWORD *)(v0 + 1024) + 96))(v23, *(_QWORD *)(v0 + 1016));
      v29 = *v23;
      v28 = v23[1];
      *(_QWORD *)(v0 + 1224) = v28;
      *(_QWORD *)(v0 + 1232) = v23[2];
      *(_QWORD *)(v0 + 1240) = v23[3];
      InstallSheetContext.type.getter(v27);
      v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 88))(v24, v26);
      if (v30 == enum case for InstallSheetContext.InstallType.app(_:))
      {
        *(_QWORD *)(v0 + 176) = v29;
        v14 = v0 + 176;
        *(_QWORD *)(v0 + 192) = 0;
        *(_QWORD *)(v0 + 200) = 0;
        *(_QWORD *)(v0 + 184) = v28;
        *(_BYTE *)(v0 + 208) = 5;
        v15 = (_QWORD *)swift_task_alloc(dword_100049064);
        *(_QWORD *)(v0 + 1248) = v15;
        v16 = sub_100026DE8;
        goto LABEL_4;
      }
      if (v30 == enum case for InstallSheetContext.InstallType.marketplace(_:))
      {
        *(_QWORD *)(v0 + 56) = v29;
        v14 = v0 + 56;
        *(_QWORD *)(v0 + 72) = 0;
        *(_QWORD *)(v0 + 80) = 0;
        *(_QWORD *)(v0 + 64) = v28;
        *(_BYTE *)(v0 + 88) = 3;
        v15 = (_QWORD *)swift_task_alloc(dword_100049064);
        *(_QWORD *)(v0 + 1304) = v15;
        v16 = sub_10002708C;
        goto LABEL_4;
      }
      v31 = 78;
    }
    else
    {
      if (v11 == enum case for InstallSheetContext.Source.appStore(_:))
        goto LABEL_3;
      v31 = 81;
    }
    return _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000018, 0x8000000100036100, "AppDistributionLaunchAngel/LocalizedInstallSheetContent.swift", 61, 2, v31, 0);
  }
}

uint64_t sub_1000268BC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1096);
  *(_QWORD *)(v3 + 1104) = a1;
  *(_QWORD *)(v3 + 1112) = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_10002691C, 0, 0);
}

uint64_t sub_10002691C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 1112);
  v2 = *(_QWORD *)(v0 + 1088);
  v3 = *(_QWORD *)(v0 + 1080);
  v4 = *(_QWORD **)(v0 + 952);
  *v4 = *(_QWORD *)(v0 + 1104);
  v4[1] = v1;
  *(_QWORD *)(v0 + 456) = v3;
  *(_QWORD *)(v0 + 464) = v2;
  *(_QWORD *)(v0 + 472) = 0;
  *(_QWORD *)(v0 + 480) = 0;
  *(_BYTE *)(v0 + 488) = 0;
  v5 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1120) = v5;
  *v5 = v0;
  v5[1] = sub_100026990;
  return sub_100022108(v0 + 456);
}

uint64_t sub_100026990(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1120);
  v5 = *(_QWORD *)(*v2 + 1088);
  *(_QWORD *)(v3 + 1128) = a1;
  *(_QWORD *)(v3 + 1136) = a2;
  swift_task_dealloc(v4);
  swift_bridgeObjectRelease(v5);
  return swift_task_switch(sub_1000269FC, 0, 0);
}

uint64_t sub_1000269FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 1136);
  v2 = *(_QWORD *)(v0 + 952);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v0 + 1128);
  *(_QWORD *)(v2 + 24) = v1;
  *(_QWORD *)(v0 + 496) = 4;
  *(_QWORD *)(v0 + 504) = 0;
  *(_QWORD *)(v0 + 520) = 0;
  *(_QWORD *)(v0 + 512) = 0;
  *(_BYTE *)(v0 + 528) = 7;
  v3 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1144) = v3;
  *v3 = v0;
  v3[1] = sub_100026A74;
  return sub_100022108(v0 + 496);
}

uint64_t sub_100026A74(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[107] = v2;
  v3[108] = a1;
  v3[109] = a2;
  swift_task_dealloc(v3[143]);
  return swift_task_switch(sub_100026AD4, 0, 0);
}

uint64_t sub_100026AD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 872);
  v2 = *(_QWORD *)(v0 + 952);
  *(_QWORD *)(v2 + 32) = *(_QWORD *)(v0 + 864);
  *(_QWORD *)(v2 + 40) = v1;
  *(_OWORD *)(v0 + 536) = 0u;
  *(_OWORD *)(v0 + 552) = 0u;
  *(_BYTE *)(v0 + 568) = 7;
  v3 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1360) = v3;
  *v3 = v0;
  v3[1] = sub_100027334;
  return sub_100022108(v0 + 536);
}

uint64_t sub_100026B44(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1168);
  v5 = *(_QWORD *)(*v2 + 1160);
  *(_QWORD *)(v3 + 1176) = a1;
  *(_QWORD *)(v3 + 1184) = a2;
  swift_task_dealloc(v4);
  swift_bridgeObjectRelease(v5);
  return swift_task_switch(sub_100026BB0, 0, 0);
}

uint64_t sub_100026BB0()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 1184);
  v2 = *(_OWORD *)(v0 + 1152);
  v3 = *(_QWORD *)(v0 + 1088);
  v4 = *(_QWORD *)(v0 + 1080);
  v5 = *(_QWORD **)(v0 + 952);
  *v5 = *(_QWORD *)(v0 + 1176);
  v5[1] = v1;
  *(_OWORD *)(v0 + 336) = v2;
  *(_QWORD *)(v0 + 352) = v4;
  *(_QWORD *)(v0 + 360) = v3;
  *(_BYTE *)(v0 + 368) = 2;
  v6 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1192) = v6;
  *v6 = v0;
  v6[1] = sub_100026C2C;
  return sub_100022108(v0 + 336);
}

uint64_t sub_100026C2C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1192);
  v5 = *(_QWORD *)(*v2 + 1160);
  v6 = *(_QWORD *)(*v2 + 1088);
  *(_QWORD *)(v3 + 1200) = a1;
  *(_QWORD *)(v3 + 1208) = a2;
  swift_task_dealloc(v4);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v6);
  return swift_task_switch(sub_100026CA4, 0, 0);
}

uint64_t sub_100026CA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 1208);
  v2 = *(_QWORD *)(v0 + 952);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v0 + 1200);
  *(_QWORD *)(v2 + 24) = v1;
  *(_QWORD *)(v0 + 376) = 4;
  *(_QWORD *)(v0 + 384) = 0;
  *(_QWORD *)(v0 + 392) = 0;
  *(_QWORD *)(v0 + 400) = 0;
  *(_BYTE *)(v0 + 408) = 7;
  v3 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1216) = v3;
  *v3 = v0;
  v3[1] = sub_100026D18;
  return sub_100022108(v0 + 376);
}

uint64_t sub_100026D18(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[110] = v2;
  v3[111] = a1;
  v3[112] = a2;
  swift_task_dealloc(v3[152]);
  return swift_task_switch(sub_100026D78, 0, 0);
}

uint64_t sub_100026D78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 896);
  v2 = *(_QWORD *)(v0 + 952);
  *(_QWORD *)(v2 + 32) = *(_QWORD *)(v0 + 888);
  *(_QWORD *)(v2 + 40) = v1;
  *(_OWORD *)(v0 + 536) = 0u;
  *(_OWORD *)(v0 + 552) = 0u;
  *(_BYTE *)(v0 + 568) = 7;
  v3 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1360) = v3;
  *v3 = v0;
  v3[1] = sub_100027334;
  return sub_100022108(v0 + 536);
}

uint64_t sub_100026DE8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1248);
  v5 = *(_QWORD *)(*v2 + 1224);
  *(_QWORD *)(v3 + 1256) = a1;
  *(_QWORD *)(v3 + 1264) = a2;
  swift_task_dealloc(v4);
  swift_bridgeObjectRelease(v5);
  return swift_task_switch(sub_100026E54, 0, 0);
}

uint64_t sub_100026E54()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 1264);
  v2 = *(_OWORD *)(v0 + 1232);
  v3 = *(_QWORD *)(v0 + 1088);
  v4 = *(_QWORD *)(v0 + 1080);
  v5 = *(_QWORD **)(v0 + 952);
  *v5 = *(_QWORD *)(v0 + 1256);
  v5[1] = v1;
  *(_OWORD *)(v0 + 216) = v2;
  *(_QWORD *)(v0 + 232) = v4;
  *(_QWORD *)(v0 + 240) = v3;
  *(_BYTE *)(v0 + 248) = 6;
  v6 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1272) = v6;
  *v6 = v0;
  v6[1] = sub_100026ED0;
  return sub_100022108(v0 + 216);
}

uint64_t sub_100026ED0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1272);
  v5 = *(_QWORD *)(*v2 + 1240);
  v6 = *(_QWORD *)(*v2 + 1088);
  *(_QWORD *)(v3 + 1280) = a1;
  *(_QWORD *)(v3 + 1288) = a2;
  swift_task_dealloc(v4);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v6);
  return swift_task_switch(sub_100026F48, 0, 0);
}

uint64_t sub_100026F48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 1288);
  v2 = *(_QWORD *)(v0 + 952);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v0 + 1280);
  *(_QWORD *)(v2 + 24) = v1;
  *(_QWORD *)(v0 + 256) = 4;
  *(_QWORD *)(v0 + 264) = 0;
  *(_QWORD *)(v0 + 272) = 0;
  *(_QWORD *)(v0 + 280) = 0;
  *(_BYTE *)(v0 + 288) = 7;
  v3 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1296) = v3;
  *v3 = v0;
  v3[1] = sub_100026FBC;
  return sub_100022108(v0 + 256);
}

uint64_t sub_100026FBC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[113] = v2;
  v3[114] = a1;
  v3[115] = a2;
  swift_task_dealloc(v3[162]);
  return swift_task_switch(sub_10002701C, 0, 0);
}

uint64_t sub_10002701C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 920);
  v2 = *(_QWORD *)(v0 + 952);
  *(_QWORD *)(v2 + 32) = *(_QWORD *)(v0 + 912);
  *(_QWORD *)(v2 + 40) = v1;
  *(_OWORD *)(v0 + 536) = 0u;
  *(_OWORD *)(v0 + 552) = 0u;
  *(_BYTE *)(v0 + 568) = 7;
  v3 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1360) = v3;
  *v3 = v0;
  v3[1] = sub_100027334;
  return sub_100022108(v0 + 536);
}

uint64_t sub_10002708C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1304);
  v5 = *(_QWORD *)(*v2 + 1224);
  *(_QWORD *)(v3 + 1312) = a1;
  *(_QWORD *)(v3 + 1320) = a2;
  swift_task_dealloc(v4);
  swift_bridgeObjectRelease(v5);
  return swift_task_switch(sub_1000270F8, 0, 0);
}

uint64_t sub_1000270F8()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 1320);
  v2 = *(_OWORD *)(v0 + 1232);
  v3 = *(_QWORD *)(v0 + 1088);
  v4 = *(_QWORD *)(v0 + 1080);
  v5 = *(_QWORD **)(v0 + 952);
  *v5 = *(_QWORD *)(v0 + 1312);
  v5[1] = v1;
  *(_OWORD *)(v0 + 96) = v2;
  *(_QWORD *)(v0 + 112) = v4;
  *(_QWORD *)(v0 + 120) = v3;
  *(_BYTE *)(v0 + 128) = 4;
  v6 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1328) = v6;
  *v6 = v0;
  v6[1] = sub_100027174;
  return sub_100022108(v0 + 96);
}

uint64_t sub_100027174(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1328);
  v5 = *(_QWORD *)(*v2 + 1240);
  v6 = *(_QWORD *)(*v2 + 1088);
  *(_QWORD *)(v3 + 1336) = a1;
  *(_QWORD *)(v3 + 1344) = a2;
  swift_task_dealloc(v4);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v6);
  return swift_task_switch(sub_1000271EC, 0, 0);
}

uint64_t sub_1000271EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 1344);
  v2 = *(_QWORD *)(v0 + 952);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v0 + 1336);
  *(_QWORD *)(v2 + 24) = v1;
  *(_QWORD *)(v0 + 136) = 5;
  *(_QWORD *)(v0 + 152) = 0;
  *(_QWORD *)(v0 + 160) = 0;
  *(_QWORD *)(v0 + 144) = 0;
  *(_BYTE *)(v0 + 168) = 7;
  v3 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1352) = v3;
  *v3 = v0;
  v3[1] = sub_100027264;
  return sub_100022108(v0 + 136);
}

uint64_t sub_100027264(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[116] = v2;
  v3[117] = a1;
  v3[118] = a2;
  swift_task_dealloc(v3[169]);
  return swift_task_switch(sub_1000272C4, 0, 0);
}

uint64_t sub_1000272C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 944);
  v2 = *(_QWORD *)(v0 + 952);
  *(_QWORD *)(v2 + 32) = *(_QWORD *)(v0 + 936);
  *(_QWORD *)(v2 + 40) = v1;
  *(_OWORD *)(v0 + 536) = 0u;
  *(_OWORD *)(v0 + 552) = 0u;
  *(_BYTE *)(v0 + 568) = 7;
  v3 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1360) = v3;
  *v3 = v0;
  v3[1] = sub_100027334;
  return sub_100022108(v0 + 536);
}

uint64_t sub_100027334(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1360);
  *(_QWORD *)(v3 + 1368) = a1;
  *(_QWORD *)(v3 + 1376) = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_100027394, 0, 0);
}

uint64_t sub_100027394()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 1376);
  v2 = *(_QWORD *)(v0 + 952);
  *(_QWORD *)(v2 + 48) = *(_QWORD *)(v0 + 1368);
  *(_QWORD *)(v2 + 56) = v1;
  *(_QWORD *)(v0 + 576) = 6;
  *(_QWORD *)(v0 + 584) = 0;
  *(_QWORD *)(v0 + 600) = 0;
  *(_QWORD *)(v0 + 592) = 0;
  *(_BYTE *)(v0 + 608) = 7;
  v3 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1384) = v3;
  *v3 = v0;
  v3[1] = sub_100027410;
  return sub_100022108(v0 + 576);
}

uint64_t sub_100027410(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1384);
  *(_QWORD *)(v3 + 1392) = a1;
  *(_QWORD *)(v3 + 1400) = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_100027470, 0, 0);
}

uint64_t sub_100027470()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 1400);
  v2 = *(_QWORD *)(v0 + 952);
  *(_QWORD *)(v2 + 64) = *(_QWORD *)(v0 + 1392);
  *(_QWORD *)(v2 + 72) = v1;
  *(_QWORD *)(v0 + 616) = 7;
  *(_QWORD *)(v0 + 624) = 0;
  *(_QWORD *)(v0 + 640) = 0;
  *(_QWORD *)(v0 + 632) = 0;
  *(_BYTE *)(v0 + 648) = 7;
  v3 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1408) = v3;
  *v3 = v0;
  v3[1] = sub_1000274E8;
  return sub_100022108(v0 + 616);
}

uint64_t sub_1000274E8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1408);
  *(_QWORD *)(v3 + 1416) = a1;
  *(_QWORD *)(v3 + 1424) = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_100027548, 0, 0);
}

uint64_t sub_100027548()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 1424);
  v2 = *(_QWORD *)(v0 + 952);
  *(_QWORD *)(v2 + 80) = *(_QWORD *)(v0 + 1416);
  *(_QWORD *)(v2 + 88) = v1;
  *(_QWORD *)(v0 + 656) = 1;
  *(_QWORD *)(v0 + 664) = 0;
  *(_QWORD *)(v0 + 680) = 0;
  *(_QWORD *)(v0 + 672) = 0;
  *(_BYTE *)(v0 + 688) = 7;
  v3 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1432) = v3;
  *v3 = v0;
  v3[1] = sub_1000275C4;
  return sub_100022108(v0 + 656);
}

uint64_t sub_1000275C4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1432);
  *(_QWORD *)(v3 + 1440) = a1;
  *(_QWORD *)(v3 + 1448) = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_100027624, 0, 0);
}

uint64_t sub_100027624()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 1448);
  v2 = *(_QWORD *)(v0 + 952);
  *(_QWORD *)(v2 + 96) = *(_QWORD *)(v0 + 1440);
  *(_QWORD *)(v2 + 104) = v1;
  *(_QWORD *)(v0 + 696) = 8;
  *(_QWORD *)(v0 + 704) = 0;
  *(_QWORD *)(v0 + 720) = 0;
  *(_QWORD *)(v0 + 712) = 0;
  *(_BYTE *)(v0 + 728) = 7;
  v3 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1456) = v3;
  *v3 = v0;
  v3[1] = sub_1000276A0;
  return sub_100022108(v0 + 696);
}

uint64_t sub_1000276A0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1456);
  *(_QWORD *)(v3 + 1464) = a1;
  *(_QWORD *)(v3 + 1472) = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_100027700, 0, 0);
}

uint64_t sub_100027700()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  char v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  _QWORD *v11;

  v1 = *(_QWORD *)(v0 + 1472);
  v2 = *(_QWORD *)(v0 + 1000);
  v3 = *(_QWORD *)(v0 + 992);
  v4 = *(_QWORD *)(v0 + 984);
  v5 = *(_QWORD *)(v0 + 976);
  v6 = *(_QWORD *)(v0 + 952);
  *(_QWORD *)(v6 + 112) = *(_QWORD *)(v0 + 1464);
  *(_QWORD *)(v6 + 120) = v1;
  InstallSheetContext.type.getter();
  *(_DWORD *)(v0 + 52) = enum case for InstallSheetContext.InstallType.marketplace(_:);
  v7 = *(void (**)(uint64_t))(v4 + 104);
  *(_QWORD *)(v0 + 1480) = v7;
  v7(v3);
  v8 = static InstallSheetContext.InstallType.== infix(_:_:)(v2, v3);
  *(_BYTE *)(v0 + 49) = v8 & 1;
  v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  *(_QWORD *)(v0 + 1488) = v9;
  if ((v8 & 1) != 0)
    v10 = 10;
  else
    v10 = 9;
  v9(v3, v5);
  v9(v2, v5);
  *(_QWORD *)(v0 + 736) = v10;
  *(_QWORD *)(v0 + 744) = 0;
  *(_QWORD *)(v0 + 760) = 0;
  *(_QWORD *)(v0 + 752) = 0;
  *(_BYTE *)(v0 + 768) = 7;
  v11 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1496) = v11;
  *v11 = v0;
  v11[1] = sub_100027804;
  return sub_100022108(v0 + 736);
}

uint64_t sub_100027804(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1496);
  if (*(_BYTE *)(*v2 + 49))
    v5 = 10;
  else
    v5 = 9;
  *(_QWORD *)(v3 + 1504) = a1;
  *(_QWORD *)(v3 + 1512) = a2;
  swift_task_dealloc(v4);
  sub_1000053A8(v5, 0, 0, 0, 7u);
  return swift_task_switch(sub_10002788C, 0, 0);
}

uint64_t sub_10002788C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 1512);
  v2 = *(_QWORD *)(v0 + 952);
  *(_QWORD *)(v2 + 128) = *(_QWORD *)(v0 + 1504);
  *(_QWORD *)(v2 + 136) = v1;
  *(_QWORD *)(v0 + 776) = 11;
  *(_QWORD *)(v0 + 784) = 0;
  *(_QWORD *)(v0 + 800) = 0;
  *(_QWORD *)(v0 + 792) = 0;
  *(_BYTE *)(v0 + 808) = 7;
  v3 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1520) = v3;
  *v3 = v0;
  v3[1] = sub_100027908;
  return sub_100022108(v0 + 776);
}

uint64_t sub_100027908(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1520);
  *(_QWORD *)(v3 + 1528) = a1;
  *(_QWORD *)(v3 + 1536) = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_100027968, 0, 0);
}

uint64_t sub_100027968()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;

  v1 = *(_QWORD *)(v0 + 1536);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 1488);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1480);
  v4 = *(unsigned int *)(v0 + 52);
  v5 = *(_QWORD *)(v0 + 1000);
  v6 = *(_QWORD *)(v0 + 992);
  v7 = *(_QWORD *)(v0 + 976);
  v8 = *(_QWORD *)(v0 + 952);
  *(_QWORD *)(v8 + 144) = *(_QWORD *)(v0 + 1528);
  *(_QWORD *)(v8 + 152) = v1;
  InstallSheetContext.type.getter();
  v3(v6, v4, v7);
  v9 = static InstallSheetContext.InstallType.== infix(_:_:)(v5, v6);
  *(_BYTE *)(v0 + 50) = v9 & 1;
  if ((v9 & 1) != 0)
    v10 = 13;
  else
    v10 = 12;
  v2(v6, v7);
  v2(v5, v7);
  *(_QWORD *)(v0 + 816) = v10;
  *(_QWORD *)(v0 + 824) = 0;
  *(_QWORD *)(v0 + 840) = 0;
  *(_QWORD *)(v0 + 832) = 0;
  *(_BYTE *)(v0 + 848) = 7;
  v11 = (_QWORD *)swift_task_alloc(dword_100049064);
  *(_QWORD *)(v0 + 1544) = v11;
  *v11 = v0;
  v11[1] = sub_100027A60;
  return sub_100022108(v0 + 816);
}

uint64_t sub_100027A60(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 1544);
  if (*(_BYTE *)(*v2 + 50))
    v5 = 13;
  else
    v5 = 12;
  *(_QWORD *)(v3 + 1552) = a1;
  *(_QWORD *)(v3 + 1560) = a2;
  swift_task_dealloc(v4);
  sub_1000053A8(v5, 0, 0, 0, 7u);
  return swift_task_switch(sub_100027AE8, 0, 0);
}

uint64_t sub_100027AE8()
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
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 1560);
  v2 = *(_QWORD *)(v0 + 1552);
  v3 = *(_QWORD *)(v0 + 1048);
  v4 = *(_QWORD *)(v0 + 1040);
  v5 = *(_QWORD *)(v0 + 1032);
  v6 = *(_QWORD *)(v0 + 1008);
  v7 = *(_QWORD *)(v0 + 1000);
  v11 = *(_QWORD *)(v0 + 992);
  v8 = *(_QWORD *)(v0 + 960);
  v9 = *(_QWORD *)(v0 + 952);
  swift_release(*(_QWORD *)(v0 + 968));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v8, v4);
  *(_QWORD *)(v9 + 160) = v2;
  *(_QWORD *)(v9 + 168) = v1;
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100027B98()
{
  _QWORD *v0;
  uint64_t result;

  result = os_transaction_get_description(*v0);
  if (result)
    return String.init(cString:)();
  return result;
}

uint64_t sub_100027BC4()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  __uint64_t v16;
  double v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t description;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void (*v30)(char *, uint64_t);
  id v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  os_log_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v43;
  int v44;
  os_log_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  unint64_t timestamp;
  uint64_t v51;
  uint64_t v52;

  v1 = v0;
  v2 = sub_1000051F0(&qword_100048300);
  __chkstk_darwin(v2);
  v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000051F0(&qword_100049448);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v43 - v11;
  __chkstk_darwin(v10);
  v14 = (char *)&v43 - v13;
  v15 = *(_QWORD *)(v0 + 16);
  v16 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW_APPROX);
  timestamp = os_transaction_get_timestamp(v15);
  if (v16 < timestamp)
  {
    __break(1u);
  }
  else
  {
    v49 = v9;
    v17 = (double)(v16 - timestamp);
    v9 = (char *)objc_opt_self(NSUnitDuration);
    v18 = objc_msgSend(v9, "nanoseconds");
    v19 = sub_10002857C();
    Measurement.init(value:unit:)(v18, v19, v17);
    if (qword_100047FB8 == -1)
      goto LABEL_3;
  }
  swift_once(&qword_100047FB8, sub_100028684);
LABEL_3:
  v20 = type metadata accessor for Logger(0);
  sub_100007D98(v20, (uint64_t)qword_10004AD48);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v12, v14, v5);
  v21 = swift_unknownObjectRetain_n(v15, 2);
  v22 = Logger.logObject.getter(v21);
  v23 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v22, (os_log_type_t)v23))
  {
    v44 = v23;
    v45 = v22;
    v46 = v14;
    v24 = swift_slowAlloc(26, -1);
    v43 = swift_slowAlloc(64, -1);
    v52 = v43;
    *(_DWORD *)v24 = 33555202;
    LOWORD(v51) = timestamp;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, (char *)&v51 + 2, v24 + 4, v24 + 6);
    *(_WORD *)(v24 + 6) = 2080;
    v25 = swift_unknownObjectRetain(v15);
    description = os_transaction_get_description(v25);
    v47 = v4;
    v48 = v1;
    if (description)
    {
      v27 = String.init(cString:)();
      v29 = v28;
      swift_unknownObjectRelease(v15);
    }
    else
    {
      swift_unknownObjectRelease(v15);
      v27 = 0;
      v29 = 0xE000000000000000;
    }
    v51 = sub_100030804(v27, v29, &v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v24 + 8, v24 + 16);
    swift_unknownObjectRelease_n(v15, 2);
    swift_bridgeObjectRelease(v29);
    *(_WORD *)(v24 + 16) = 2080;
    v31 = objc_msgSend(v9, "milliseconds");
    v32 = v49;
    Measurement<>.converted(to:)();

    v33 = Measurement<>.formatted()(v5);
    v35 = v34;
    v30 = *(void (**)(char *, uint64_t))(v6 + 8);
    v30(v32, v5);
    v51 = sub_100030804(v33, v35, &v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v24 + 18, v24 + 26);
    swift_bridgeObjectRelease(v35);
    v30(v12, v5);
    v36 = v45;
    _os_log_impl((void *)&_mh_execute_header, v45, (os_log_type_t)v44, "[TXN%hx] 🐏 Ending transaction (%s) (%s)", (uint8_t *)v24, 0x1Au);
    v37 = v43;
    swift_arrayDestroy(v43, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1, -1);
    swift_slowDealloc(v24, -1, -1);

    v4 = v47;
    v1 = v48;
    v14 = v46;
  }
  else
  {
    swift_unknownObjectRelease_n(v15, 2);
    v30 = *(void (**)(char *, uint64_t))(v6 + 8);
    v30(v12, v5);

  }
  v38 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v4, 1, 1, v38);
  v39 = (_QWORD *)swift_allocObject(&unk_100042508, 48, 7);
  v39[2] = 0;
  v39[3] = 0;
  v40 = timestamp;
  v39[4] = v15;
  v39[5] = v40;
  swift_unknownObjectRetain(v15);
  v41 = sub_100028400((uint64_t)v4, (uint64_t)&unk_100049460, (uint64_t)v39);
  swift_release(v41);
  v30(v14, v5);
  swift_unknownObjectRelease(*(_QWORD *)(v1 + 16));
  return v1;
}

uint64_t sub_10002804C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[3] = a4;
  v5[4] = a5;
  v6 = type metadata accessor for ContinuousClock(0);
  v5[5] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[6] = v7;
  v5[7] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000280AC, 0, 0);
}

uint64_t sub_1000280AC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  ContinuousClock.init()();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_1000496A0 + dword_1000496A0);
  v1 = (_QWORD *)swift_task_alloc(unk_1000496A4);
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_10002812C;
  return v3(0xB469471F80140000, 0, 0, 0, 1);
}

uint64_t sub_10002812C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc(v2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  if (v0)
    v6 = sub_1000281AC;
  else
    v6 = sub_1000281E0;
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_1000281AC()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(v0 + 56));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000281E0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t description;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v19;
  uint64_t v20;

  if (qword_100047FB8 != -1)
    swift_once(&qword_100047FB8, sub_100028684);
  v1 = (_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = type metadata accessor for Logger(0);
  sub_100007D98(v3, (uint64_t)qword_10004AD48);
  v4 = swift_unknownObjectRetain_n(v2, 2);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v19 = (uint64_t *)(v0 + 16);
    v8 = *(_QWORD *)(v0 + 24);
    v7 = *(_QWORD *)(v0 + 32);
    v9 = swift_slowAlloc(16, -1);
    v10 = swift_slowAlloc(32, -1);
    v20 = v10;
    *(_DWORD *)v9 = 33554946;
    *(_WORD *)(v0 + 80) = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 82, v9 + 4, v9 + 6);
    *(_WORD *)(v9 + 6) = 2080;
    v11 = swift_unknownObjectRetain(v8);
    description = os_transaction_get_description(v11);
    v13 = *(_QWORD *)(v0 + 24);
    if (description)
    {
      v14 = String.init(cString:)();
      v16 = v15;
      swift_unknownObjectRelease(v13);
    }
    else
    {
      swift_unknownObjectRelease(*(_QWORD *)(v0 + 24));
      v14 = 0;
      v16 = 0xE000000000000000;
    }
    v17 = *v1;
    *v19 = sub_100030804(v14, v16, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v19, v0 + 24, v9 + 8, v9 + 16);
    swift_bridgeObjectRelease(v16);
    swift_unknownObjectRelease_n(v17, 2);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[TXN%hx] 🐏 Releasing transaction (%s)", (uint8_t *)v9, 0x10u);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n(*v1, 2);
  }

  swift_task_dealloc(*(_QWORD *)(v0 + 56));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100028400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unsigned __int8 v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6);
  if ((_DWORD)v8 == 1)
  {
    sub_100007CC4(a1);
    v9 = 7168;
    v10 = *(_QWORD *)(a3 + 16);
    if (!v10)
    {
LABEL_6:
      v16 = 0;
      return swift_task_create(v9, v16, (char *)&type metadata for () + 8, a2, a3);
    }
  }
  else
  {
    v17 = TaskPriority.rawValue.getter(v8);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v9 = v17 | 0x1C00;
    v10 = *(_QWORD *)(a3 + 16);
    if (!v10)
      goto LABEL_6;
  }
  v11 = *(_QWORD *)(a3 + 24);
  ObjectType = swift_getObjectType(v10);
  swift_unknownObjectRetain(v10);
  v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
  v15 = v14;
  swift_unknownObjectRelease(v10);
  if (!(v15 | v13))
    goto LABEL_6;
  v19[0] = 0;
  v19[1] = 0;
  v16 = v19;
  v19[2] = v13;
  v19[3] = v15;
  return swift_task_create(v9, v16, (char *)&type metadata for () + 8, a2, a3);
}

uint64_t sub_10002852C()
{
  uint64_t v0;

  sub_100027BC4();
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for Transaction()
{
  return objc_opt_self(_TtC26AppDistributionLaunchAngel11Transaction);
}

ValueMetadata *type metadata accessor for Transaction.SendableTransaction()
{
  return &type metadata for Transaction.SendableTransaction;
}

unint64_t sub_10002857C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100049450;
  if (!qword_100049450)
  {
    v1 = objc_opt_self(NSUnitDuration);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, &qword_100049450);
  }
  return result;
}

uint64_t sub_1000285B8()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000285E4(uint64_t a1)
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
  v8 = (_QWORD *)swift_task_alloc(dword_10004945C);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_100007C7C;
  return sub_10002804C(a1, v4, v5, v7, v6);
}

uint64_t sub_10002865C(uint64_t a1)
{
  return sub_1000286DC(a1, qword_10004AD30, 0x6E4168636E75614CLL, 0xEB000000006C6567);
}

uint64_t sub_100028684(uint64_t a1)
{
  return sub_1000286DC(a1, qword_10004AD48, 0x6C6172656E6547, 0xE700000000000000);
}

uint64_t sub_1000286A4(uint64_t a1)
{
  return sub_1000286DC(a1, qword_10004AD60, 0x7363697274654DLL, 0xE700000000000000);
}

uint64_t sub_1000286C4(uint64_t a1)
{
  return sub_1000286DC(a1, qword_10004AD78, 4411480, 0xE300000000000000);
}

uint64_t sub_1000286DC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for Logger(0);
  sub_100028804(v7, a2);
  sub_100007D98(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD000000000000024, 0x8000000100035320, a3, a4);
}

uint64_t type metadata accessor for LogKey()
{
  return objc_opt_self(_TtC26AppDistributionLaunchAngel6LogKey);
}

uint64_t *sub_100028804(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

id sub_100028844()
{
  void *v0;
  objc_class *ObjectType;
  char *v2;
  int v3;
  unint64_t v4;
  Swift::String v5;
  void *object;
  unint64_t v7;
  uint64_t *v8;
  objc_super v10;
  int v11;
  uint64_t v12;
  unint64_t v13;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  v12 = 0;
  v2 = v0;
  swift_stdlib_random(&v12, 8);
  v3 = v12;
  v12 = 5129543;
  v13 = 0xE300000000000000;
  v11 = v3;
  v4 = sub_100028908();
  v5._countAndFlagsBits = String.init<A>(_:radix:uppercase:)(&v11, 16, 1, &type metadata for UInt32, v4);
  object = v5._object;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(object);
  v7 = v13;
  v8 = (uint64_t *)&v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel6LogKey_stringValue];
  *v8 = v12;
  v8[1] = v7;

  v10.receiver = v2;
  v10.super_class = ObjectType;
  return objc_msgSendSuper2(&v10, "init");
}

unint64_t sub_100028908()
{
  unint64_t result;

  result = qword_1000494A0;
  if (!qword_1000494A0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(result, (unint64_t *)&qword_1000494A0);
  }
  return result;
}

uint64_t *sub_10002894C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v18);
  }
  else
  {
    v7 = type metadata accessor for MetricsPipeline(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for MetricsData.Configuration(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    v16 = a3[7];
    v17 = *(uint64_t *)((char *)a2 + v16);
    *(uint64_t *)((char *)a1 + v16) = v17;
    swift_bridgeObjectRetain(v17);
  }
  return a1;
}

uint64_t sub_100028A38(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = type metadata accessor for MetricsPipeline(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = type metadata accessor for MetricsData.Configuration(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + a2[6];
  v8 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[7]));
}

uint64_t sub_100028ACC(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = type metadata accessor for MetricsPipeline(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for MetricsData.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  v15 = a3[7];
  v16 = *(_QWORD *)(a2 + v15);
  *(_QWORD *)(a1 + v15) = v16;
  swift_bridgeObjectRetain(v16);
  return a1;
}

uint64_t sub_100028B8C(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = type metadata accessor for MetricsPipeline(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for MetricsData.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = a3[7];
  v16 = *(_QWORD *)(a2 + v15);
  v17 = *(_QWORD *)(a1 + v15);
  *(_QWORD *)(a1 + v15) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  return a1;
}

uint64_t sub_100028C58(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = type metadata accessor for MetricsPipeline(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for MetricsData.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_100028D14(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = type metadata accessor for MetricsPipeline(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for MetricsData.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  v15 = a3[7];
  v16 = *(_QWORD *)(a1 + v15);
  *(_QWORD *)(a1 + v15) = *(_QWORD *)(a2 + v15);
  swift_bridgeObjectRelease(v16);
  return a1;
}

uint64_t sub_100028DD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100028DE4);
}

uint64_t sub_100028DE4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;

  v6 = type metadata accessor for MetricsPipeline(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = type metadata accessor for MetricsData.Configuration(0);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_7:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext(0);
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[6];
    goto LABEL_7;
  }
  v16 = *(_QWORD *)(a1 + a3[7]);
  if (v16 >= 0xFFFFFFFF)
    LODWORD(v16) = -1;
  return (v16 + 1);
}

uint64_t sub_100028EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100028EBC);
}

uint64_t sub_100028EBC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  v8 = type metadata accessor for MetricsPipeline(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  v13 = type metadata accessor for MetricsData.Configuration(0);
  v14 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v13;
    v15 = a4[5];
LABEL_7:
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  result = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext(0);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v15 = a4[6];
    goto LABEL_7;
  }
  *(_QWORD *)(a1 + a4[7]) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for InstallConfirmationAppStoreMetrics(uint64_t a1)
{
  uint64_t result;

  result = qword_100049500;
  if (!qword_100049500)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for InstallConfirmationAppStoreMetrics);
  return result;
}

uint64_t sub_100028FC0(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD v6[4];

  result = type metadata accessor for MetricsPipeline(319);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for MetricsData.Configuration(319);
    if (v4 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(result - 8) + 64;
      result = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext(319);
      if (v5 <= 0x3F)
      {
        v6[2] = *(_QWORD *)(result - 8) + 64;
        v6[3] = (char *)&value witness table for Builtin.BridgeObject + 64;
        swift_initStructMetadata(a1, 256, 4, v6, a1 + 16);
        return 0;
      }
    }
  }
  return result;
}

unint64_t sub_10002906C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000051F0(&qword_100048438);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v7 = *(v6 - 3);
    v8 = *(v6 - 2);
    v10 = *(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    result = sub_10002ADBC(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    v14 = (_QWORD *)(v4[7] + 16 * result);
    *v14 = v10;
    v14[1] = v9;
    v15 = v4[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v6 += 4;
    v4[2] = v17;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10002918C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000051F0(&qword_100049558);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10001C244(v7, (uint64_t)v16, &qword_100049560);
    result = sub_10002AE20((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_10001C288(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 72;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000292CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000051F0(&qword_100049568);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10001C244(v7, (uint64_t)&v16, &qword_100049580);
    v8 = v16;
    v9 = v17;
    result = sub_10002ADBC(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_10001C288(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 48;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100029400(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t result;
  char v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = sub_1000051F0(a2);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a1 + 16);
  if (!v10)
  {
    v12 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v27 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v27);
    return (unint64_t)v12;
  }
  sub_1000051F0(a3);
  v11 = static _DictionaryStorage.allocate(capacity:)(v10);
  v12 = (_QWORD *)v11;
  v13 = *(_QWORD *)(a1 + 16);
  if (!v13)
    goto LABEL_9;
  v14 = *(int *)(v6 + 48);
  v15 = v11 + 64;
  v16 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v29 = a1;
  v17 = a1 + v16;
  v18 = *(_QWORD *)(v7 + 72);
  swift_retain(v11);
  while (1)
  {
    sub_10001C244(v17, (uint64_t)v9, a2);
    result = sub_10002AE50((uint64_t)v9);
    if ((v20 & 1) != 0)
      break;
    v21 = result;
    *(_QWORD *)(v15 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v22 = v12[6];
    v23 = type metadata accessor for MetricsEventType(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v22 + *(_QWORD *)(*(_QWORD *)(v23 - 8) + 72) * v21, v9, v23);
    *(_QWORD *)(v12[7] + 8 * v21) = *(_QWORD *)&v9[v14];
    v24 = v12[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_12;
    v12[2] = v26;
    v17 += v18;
    if (!--v13)
    {
      swift_release(v12);
      v27 = v29;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_10002958C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  Class isa;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
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
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  unint64_t v98;
  unint64_t v99;
  char *v100;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  id v130[2];
  ValueMetadata *v131;
  void *v132;

  v6 = type metadata accessor for MetricsData.Configuration(0);
  v121 = *(_QWORD *)(v6 - 8);
  v122 = v6;
  __chkstk_darwin(v6);
  v119 = (char *)&v102 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MetricsPipeline.Configuration(0);
  v125 = *(_QWORD *)(v8 - 8);
  v126 = v8;
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v102 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v102 - v12;
  v14 = type metadata accessor for Bag(0);
  v127 = *(_QWORD *)(v14 - 8);
  v128 = v14;
  __chkstk_darwin(v14);
  v16 = (char *)&v102 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for InstallConfirmationAppStoreMetrics(0);
  v18 = a3 + *(int *)(v17 + 24);
  v19 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext(0);
  v117 = *(_QWORD *)(v19 - 8);
  v118 = v19;
  v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v117 + 16))(v18, a2);
  v120 = a2;
  v21 = InstallSheetContext.Source.AppStoreSheetContext.metricsFieldData.getter(v20);
  v123 = a1;
  if (v22 >> 60 == 15)
    goto LABEL_7;
  v23 = v21;
  v24 = v22;
  v25 = (void *)objc_opt_self(NSJSONSerialization);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v130[0] = 0;
  v27 = objc_msgSend(v25, "JSONObjectWithData:options:error:", isa, 0, v130);

  v28 = v130[0];
  if (!v27)
  {
    v35 = v130[0];
    v36 = _convertNSErrorToError(_:)(v28);

    swift_willThrow(v37);
    sub_10002D3B8(v23, v24);
    v38 = v36;
    a1 = v123;
    swift_errorRelease(v38);
LABEL_7:
    v33 = sub_1000292CC((uint64_t)&_swiftEmptyArrayStorage);
    goto LABEL_8;
  }
  v29 = v130[0];
  _bridgeAnyObjectToAny(_:)(v130, v27);
  swift_unknownObjectRelease(v27);
  v30 = sub_1000051F0(&qword_1000495B8);
  if ((swift_dynamicCast(&v129, v130, (char *)&type metadata for Any + 8, v30, 6) & 1) == 0)
  {
    sub_10002D3B8(v23, v24);
    goto LABEL_7;
  }
  v31 = a3;
  v32 = v129;
  v33 = sub_10002D204(v129, &off_1000414C0);
  v34 = v32;
  a3 = v31;
  a1 = v123;
  swift_bridgeObjectRelease(v34);
  sub_10002D3B8(v23, v24);
  swift_arrayDestroy(&unk_1000414E0, 2, &type metadata for String);
LABEL_8:
  v114 = a3;
  v116 = v17;
  *(_QWORD *)(a3 + *(int *)(v17 + 28)) = v33;
  v39 = type metadata accessor for AMSMetricsEventRecorder(0);
  v40 = v128;
  v41 = *(void (**)(char *, uint64_t, uint64_t))(v127 + 16);
  v41(v16, a1, v128);
  v42 = (void *)AMSMetricsEventRecorder.__allocating_init(bag:defaultTopic:)(v16, 0x615F706D615F7078, 0xEF65726F74737070);
  v41(v16, a1, v40);
  v131 = &type metadata for InstallConfirmationAppStoreMetrics.Linter;
  v132 = (void *)sub_10002CE98();
  MetricsPipeline.Configuration.init(bag:linter:anonymousTopics:)(v16, v130);
  v131 = (ValueMetadata *)v39;
  v132 = &protocol witness table for AMSMetricsEventRecorder;
  v115 = v42;
  v130[0] = v42;
  swift_retain(v42);
  MetricsPipeline.Configuration.withRecorder(_:)(v130);
  (*(void (**)(char *, uint64_t))(v125 + 8))(v11, v126);
  sub_10001C164(v130);
  MetricsPipeline.init(from:)(v13);
  v43 = sub_1000051F0(&qword_1000495A0);
  v44 = sub_1000051F0(&qword_1000495A8);
  v45 = *(_QWORD *)(v44 - 8);
  v46 = *(_QWORD *)(v45 + 72);
  v47 = *(unsigned __int8 *)(v45 + 80);
  v48 = (v47 + 32) & ~v47;
  v49 = v46;
  v107 = v46;
  v50 = swift_allocObject(v43, v48 + 6 * v46, v47 | 7);
  v113 = v50;
  *(_OWORD *)(v50 + 16) = xmmword_1000341C0;
  v51 = v50 + v48;
  v52 = *(int *)(v44 + 48);
  v53 = static MetricsEventType.click.getter();
  *(_QWORD *)(v51 + v52) = &_swiftEmptySetSingleton;
  v54 = v51 + v49;
  v55 = v51;
  v105 = v51;
  v111 = *(int *)(v44 + 48);
  static MetricsEventType.page.getter(v53);
  v56 = sub_1000051F0(&qword_1000495B0);
  v125 = v56;
  v57 = type metadata accessor for MetricsFieldInclusionRequest(0);
  v58 = *(_QWORD *)(v57 - 8);
  v126 = v57;
  v59 = *(_QWORD *)(v58 + 72);
  v60 = *(unsigned __int8 *)(v58 + 80);
  v61 = (v60 + 32) & ~v60;
  v110 = 2 * v59;
  v112 = v61 + 3 * v59;
  v124 = v60 | 7;
  v62 = swift_allocObject(v56, v112, v60 | 7);
  v109 = xmmword_1000341D0;
  *(_OWORD *)(v62 + 16) = xmmword_1000341D0;
  v63 = ((uint64_t (*)(void))static MetricsFieldInclusionRequest.pageFields.getter)();
  v64 = static MetricsFieldInclusionRequest.pageReferrer.getter(v63);
  static MetricsFieldInclusionRequest.crossfireReferral.getter(v64);
  v65 = sub_100024F44(v62);
  swift_setDeallocating(v62);
  swift_arrayDestroy(v62 + v61, 3, v57);
  v66 = swift_deallocClassInstance(v62, 32, 7);
  *(_QWORD *)(v54 + v111) = v65;
  v67 = v107;
  v68 = v55 + 2 * v107;
  v106 = v44;
  v104 = *(int *)(v44 + 48);
  static MetricsEventType.search.getter(v66);
  v103 = v61;
  v111 = v61 + v59;
  v69 = v124;
  v70 = v125;
  v71 = swift_allocObject(v125, v61 + v59, v124);
  v108 = xmmword_1000336A0;
  *(_OWORD *)(v71 + 16) = xmmword_1000336A0;
  v72 = v71 + v61;
  static MetricsFieldInclusionRequest.pageReferrer.getter(v71);
  v73 = sub_100024F44(v71);
  swift_setDeallocating(v71);
  swift_arrayDestroy(v72, 1, v126);
  v74 = swift_deallocClassInstance(v71, 32, 7);
  *(_QWORD *)(v68 + v104) = v73;
  v75 = v67;
  v76 = 3 * v67;
  v77 = v105;
  v78 = v105 + v76;
  v79 = *(int *)(v44 + 48);
  static MetricsEventType.impressions.getter(v74);
  v80 = swift_allocObject(v70, v112, v69);
  *(_OWORD *)(v80 + 16) = v109;
  v81 = v103;
  v82 = v80 + v103;
  v83 = static MetricsFieldInclusionRequest.impressions.getter();
  v84 = static MetricsFieldInclusionRequest.pageFields.getter(v83);
  static MetricsFieldInclusionRequest.pageReferrer.getter(v84);
  v85 = sub_100024F44(v80);
  swift_setDeallocating(v80);
  v86 = v126;
  swift_arrayDestroy(v82, 3, v126);
  v87 = swift_deallocClassInstance(v80, 32, 7);
  *(_QWORD *)(v78 + v79) = v85;
  v88 = v75;
  v89 = 4 * v75;
  v90 = v77 + 4 * v75;
  v91 = v106;
  v92 = *(int *)(v106 + 48);
  v93 = static MetricsEventType.media.getter(v87);
  *(_QWORD *)(v90 + v92) = &_swiftEmptySetSingleton;
  v94 = v77 + v89 + v88;
  v95 = *(int *)(v91 + 48);
  static MetricsEventType.pageRender.getter(v93);
  v96 = swift_allocObject(v125, v111, v124);
  *(_OWORD *)(v96 + 16) = v108;
  static MetricsFieldInclusionRequest.pageFields.getter(v96);
  v97 = sub_100024F44(v96);
  swift_setDeallocating(v96);
  swift_arrayDestroy(v96 + v81, 1, v86);
  swift_deallocClassInstance(v96, 32, 7);
  *(_QWORD *)(v94 + v95) = v97;
  v98 = sub_100029400(v113, &qword_1000495A8, &qword_1000495E0);
  v99 = sub_100029400((uint64_t)&_swiftEmptyArrayStorage, &qword_1000495C0, &qword_1000495C8);
  v100 = v119;
  MetricsData.Configuration.init(defaultTopic:defaultIncludingFields:defaultExcludingFields:shouldFlush:)(0x615F706D615F7078, 0xEF65726F74737070, v98, v99, sub_100029DBC, 0);
  swift_release(v115);
  (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v120, v118);
  (*(void (**)(uint64_t, uint64_t))(v127 + 8))(v123, v128);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v121 + 32))(v114 + *(int *)(v116 + 20), v100, v122);
}

uint64_t sub_100029DBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = type metadata accessor for MainActor(0, a2);
  v3 = static MainActor.shared.getter(v2);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  v6 = v5;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationAppStoreMetrics.swift", 67, 1, 55, v4, v6);
  swift_release(v3);
  return 1;
}

uint64_t sub_100029E40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
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
  uint64_t v21;

  v9[43] = v21;
  v9[44] = v8;
  v9[41] = a7;
  v9[42] = a8;
  v9[39] = a5;
  v9[40] = a6;
  v9[37] = a3;
  v9[38] = a4;
  v9[35] = a1;
  v9[36] = a2;
  v10 = ((uint64_t (*)(_QWORD))type metadata accessor for MetricsFieldsContext)(0);
  v9[45] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v9[46] = v11;
  v9[47] = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = ((uint64_t (*)(_QWORD))type metadata accessor for LintedMetricsEvent)(0);
  v9[48] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v9[49] = v13;
  v9[50] = swift_task_alloc((*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = ((uint64_t (*)(_QWORD))type metadata accessor for MetricsData)(0);
  v9[51] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v9[52] = v15;
  v9[53] = swift_task_alloc((*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for MainActor(0, v16);
  v9[54] = v17;
  v9[55] = static MainActor.shared.getter(v17);
  v18 = dispatch thunk of Actor.unownedExecutor.getter(v17, &protocol witness table for MainActor);
  v9[56] = v18;
  v9[57] = v19;
  return swift_task_switch(sub_100029F40, v18, v19);
}

uint64_t sub_100029F40()
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
  char isUniquelyReferenced_nonNull_native;
  char v11;
  char v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = *(_QWORD *)(v0 + 344);
  v2 = *(_QWORD *)(v0 + 352);
  v3 = *(_QWORD *)(v0 + 320);
  v20 = *(_QWORD *)(v0 + 328);
  v21 = *(_QWORD *)(v0 + 336);
  v5 = *(_QWORD *)(v0 + 304);
  v4 = *(_QWORD *)(v0 + 312);
  v6 = *(_QWORD *)(v0 + 296);
  v18 = *(_QWORD *)(v0 + 280);
  v19 = *(_QWORD *)(v0 + 288);
  v17 = type metadata accessor for InstallConfirmationAppStoreMetrics(0);
  v7 = *(_QWORD *)(v2 + *(int *)(v17 + 28));
  swift_bridgeObjectRetain(v1);
  v8 = swift_bridgeObjectRetain(v7);
  v9 = sub_10002A554(v8, v1);
  *(_QWORD *)(v0 + 40) = &type metadata for String;
  *(_QWORD *)(v0 + 16) = v4;
  *(_QWORD *)(v0 + 24) = v3;
  sub_10001C288((_OWORD *)(v0 + 16), (_OWORD *)(v0 + 48));
  swift_bridgeObjectRetain(v3);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v9);
  sub_10002C804((_OWORD *)(v0 + 48), 0x79546E6F69746361, 0xEA00000000006570, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease(0x8000000000000000);
  *(_QWORD *)(v0 + 104) = &type metadata for String;
  *(_QWORD *)(v0 + 80) = v6;
  *(_QWORD *)(v0 + 88) = v5;
  sub_10001C288((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 112));
  swift_bridgeObjectRetain(v5);
  v11 = swift_isUniquelyReferenced_nonNull_native(v9);
  sub_10002C804((_OWORD *)(v0 + 112), 0x444965676170, 0xE600000000000000, v11);
  swift_bridgeObjectRelease(0x8000000000000000);
  *(_QWORD *)(v0 + 168) = &type metadata for String;
  *(_QWORD *)(v0 + 144) = 0x6C61646F4DLL;
  *(_QWORD *)(v0 + 152) = 0xE500000000000000;
  sub_10001C288((_OWORD *)(v0 + 144), (_OWORD *)(v0 + 176));
  v12 = swift_isUniquelyReferenced_nonNull_native(v9);
  sub_10002C804((_OWORD *)(v0 + 176), 0x7073694465676170, 0xEF6570795479616CLL, v12);
  swift_bridgeObjectRelease(0x8000000000000000);
  *(_QWORD *)(v0 + 232) = &type metadata for String;
  *(_QWORD *)(v0 + 208) = 0x6174736E49707041;
  *(_QWORD *)(v0 + 216) = 0xEA00000000006C6CLL;
  sub_10001C288((_OWORD *)(v0 + 208), (_OWORD *)(v0 + 240));
  v13 = swift_isUniquelyReferenced_nonNull_native(v9);
  sub_10002C804((_OWORD *)(v0 + 240), 0x6570795465676170, 0xE800000000000000, v13);
  swift_bridgeObjectRelease(0x8000000000000000);
  static MetricsData.makeMetricsClickData(targetID:targetType:fields:configuration:)(v18, v19, v20, v21, v9, v2 + *(int *)(v17 + 20));
  v14 = swift_bridgeObjectRelease(v9);
  MetricsFieldsContext.init()(v14);
  v15 = (_QWORD *)swift_task_alloc(async function pointer to MetricsPipeline.process(_:using:)[1]);
  *(_QWORD *)(v0 + 464) = v15;
  *v15 = v0;
  v15[1] = sub_10002A204;
  return MetricsPipeline.process(_:using:)(*(_QWORD *)(v0 + 400), *(_QWORD *)(v0 + 424), *(_QWORD *)(v0 + 376));
}

uint64_t sub_10002A204()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 464);
  *(_QWORD *)(*(_QWORD *)v1 + 472) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2[46] + 8))(v2[47], v2[45]);
    v4 = v2[56];
    v5 = v2[57];
    v6 = sub_10002A30C;
  }
  else
  {
    v8 = v2[49];
    v7 = v2[50];
    v9 = v2[48];
    (*(void (**)(_QWORD, _QWORD))(v2[46] + 8))(v2[47], v2[45]);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    v4 = v2[56];
    v5 = v2[57];
    v6 = sub_10002A2A4;
  }
  return swift_task_switch(v6, v4, v5);
}

uint64_t sub_10002A2A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_release(*(_QWORD *)(v0 + 440));
  v1 = *(_QWORD *)(v0 + 424);
  v2 = *(_QWORD *)(v0 + 400);
  v3 = *(_QWORD *)(v0 + 376);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 416) + 8))(v1, *(_QWORD *)(v0 + 408));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002A30C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t *v8;
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

  swift_release(*(_QWORD *)(v0 + 440));
  if (qword_100047FC0 != -1)
    swift_once(&qword_100047FC0, sub_1000286A4);
  v1 = *(_QWORD *)(v0 + 472);
  v2 = type metadata accessor for Logger(0);
  sub_100007D98(v2, (uint64_t)qword_10004AD60);
  swift_errorRetain(v1);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v0 + 432);
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v7 = 138543362;
    v9 = static MainActor.shared.getter(v8);
    v10 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
    v12 = v11;
    if ((swift_task_isCurrentExecutor(v10) & 1) == 0)
      swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationAppStoreMetrics.swift", 67, 1, 73, v10, v12);
    v13 = *(_QWORD *)(v0 + 472);
    swift_errorRetain(v13);
    swift_release(v9);
    v14 = _swift_stdlib_bridgeErrorToNSError(v13);
    *(_QWORD *)(v0 + 272) = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 272, v0 + 280, v7 + 4, v7 + 12);
    *v8 = v14;
    swift_errorRelease(v13);
    swift_errorRelease(v13);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Error recording button click: %{public}@", v7, 0xCu);
    v15 = sub_1000051F0(&qword_1000483E8);
    swift_arrayDestroy(v8, 1, v15);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {
    v16 = *(_QWORD *)(v0 + 472);

    swift_errorRelease(v16);
    swift_errorRelease(v16);
  }
  swift_errorRelease(*(_QWORD *)(v0 + 472));
  v17 = *(_QWORD *)(v0 + 424);
  v18 = *(_QWORD *)(v0 + 400);
  v19 = *(_QWORD *)(v0 + 376);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 416) + 8))(v17, *(_QWORD *)(v0 + 408));
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002A554(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(a2);
  v8 = a2;
  sub_10002B308(a1, (uint64_t)sub_10002CBB8, 0, isUniquelyReferenced_nonNull_native, &v8, 61);
  v6 = v8;
  swift_bridgeObjectRelease(0x8000000000000000);
  if (v2)
    swift_bridgeObjectRelease(v6);
  return v6;
}

uint64_t sub_10002A5D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
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

  v5[28] = a4;
  v5[29] = v4;
  v5[26] = a2;
  v5[27] = a3;
  v5[25] = a1;
  v6 = type metadata accessor for MetricsFieldsContext(0);
  v5[30] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[31] = v7;
  v5[32] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LintedMetricsEvent(0);
  v5[33] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v5[34] = v9;
  v5[35] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for JSONContext(0);
  v5[36] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for JSONObject(0);
  v5[37] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v11 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for JSNetworkPerformanceMetrics(0);
  v5[38] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v5[39] = v13;
  v5[40] = swift_task_alloc((*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for MetricsData(0);
  v5[41] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v5[42] = v15;
  v5[43] = swift_task_alloc((*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for MainActor(0, v16);
  v5[44] = v17;
  v5[45] = static MainActor.shared.getter(v17);
  v18 = dispatch thunk of Actor.unownedExecutor.getter(v17, &protocol witness table for MainActor);
  v5[46] = v18;
  v5[47] = v19;
  return swift_task_switch(sub_10002A72C, v18, v19);
}

uint64_t sub_10002A72C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24[5];

  v1 = v0[28];
  v2 = v0[29];
  v3 = v0[26];
  v4 = v0[27];
  v5 = v0[25];
  v6 = sub_1000051F0(&qword_100049548);
  inited = swift_initStackObject(v6, v0 + 2);
  *(_OWORD *)(inited + 16) = xmmword_1000341D0;
  *(_QWORD *)(inited + 32) = 0x644965676170;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 48) = v5;
  *(_QWORD *)(inited + 56) = v3;
  *(_QWORD *)(inited + 72) = &type metadata for String;
  *(_QWORD *)(inited + 80) = 0x6570795465676170;
  *(_QWORD *)(inited + 88) = 0xE800000000000000;
  *(_QWORD *)(inited + 96) = v4;
  *(_QWORD *)(inited + 104) = v1;
  *(_QWORD *)(inited + 120) = &type metadata for String;
  *(_QWORD *)(inited + 128) = 0x7073694465676170;
  *(_QWORD *)(inited + 168) = &type metadata for String;
  *(_QWORD *)(inited + 136) = 0xEF6570795479616CLL;
  *(_QWORD *)(inited + 144) = 0x6C61646F4DLL;
  *(_QWORD *)(inited + 152) = 0xE500000000000000;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v1);
  v8 = sub_1000292CC(inited);
  v9 = type metadata accessor for InstallConfirmationAppStoreMetrics(0);
  v10 = *(_QWORD *)(v2 + *(int *)(v9 + 28));
  swift_bridgeObjectRetain(v10);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v8);
  v24[0] = v8;
  sub_10002B308(v10, (uint64_t)sub_10002CBB8, 0, isUniquelyReferenced_nonNull_native, v24, 79);
  v13 = v0[39];
  v12 = v0[40];
  v14 = v0[37];
  v15 = v0[36];
  v23 = v0[38];
  v16 = v0[29];
  v17 = v24[0];
  swift_bridgeObjectRelease(0x8000000000000000);
  v18 = sub_10002918C((uint64_t)&_swiftEmptyArrayStorage);
  v24[3] = sub_1000051F0(&qword_100049550);
  v24[0] = v18;
  v19 = JSONObject.init(wrapping:)(v24);
  JSONContext.init()(v19);
  JSNetworkPerformanceMetrics.init(deserializing:using:)(v14, v15);
  static MetricsData.makeMetricsPageData(fields:timingMetrics:configuration:)(v17, v12, v16 + *(int *)(v9 + 20));
  swift_bridgeObjectRelease(v17);
  v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v12, v23);
  MetricsFieldsContext.init()(v20);
  v21 = (_QWORD *)swift_task_alloc(async function pointer to MetricsPipeline.process(_:using:)[1]);
  v0[48] = v21;
  *v21 = v0;
  v21[1] = sub_10002A994;
  return MetricsPipeline.process(_:using:)(v0[35], v0[43], v0[32]);
}

uint64_t sub_10002A994()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 384);
  *(_QWORD *)(*(_QWORD *)v1 + 392) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2[31] + 8))(v2[32], v2[30]);
    v4 = v2[46];
    v5 = v2[47];
    v6 = sub_10002AAC4;
  }
  else
  {
    v8 = v2[34];
    v7 = v2[35];
    v9 = v2[33];
    (*(void (**)(_QWORD, _QWORD))(v2[31] + 8))(v2[32], v2[30]);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    v4 = v2[46];
    v5 = v2[47];
    v6 = sub_10002AA34;
  }
  return swift_task_switch(v6, v4, v5);
}

uint64_t sub_10002AA34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release(*(_QWORD *)(v0 + 360));
  v1 = *(_QWORD *)(v0 + 344);
  v2 = *(_QWORD *)(v0 + 320);
  v4 = *(_QWORD *)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 296);
  v5 = *(_QWORD *)(v0 + 280);
  v6 = *(_QWORD *)(v0 + 256);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 336) + 8))(v1, *(_QWORD *)(v0 + 328));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002AAC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t *v8;
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

  swift_release(*(_QWORD *)(v0 + 360));
  if (qword_100047FC0 != -1)
    swift_once(&qword_100047FC0, sub_1000286A4);
  v1 = *(_QWORD *)(v0 + 392);
  v2 = type metadata accessor for Logger(0);
  sub_100007D98(v2, (uint64_t)qword_10004AD60);
  swift_errorRetain(v1);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v0 + 352);
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v7 = 138543362;
    v9 = static MainActor.shared.getter(v8);
    v10 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
    v12 = v11;
    if ((swift_task_isCurrentExecutor(v10) & 1) == 0)
      swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationAppStoreMetrics.swift", 67, 1, 87, v10, v12);
    v13 = *(_QWORD *)(v0 + 392);
    swift_errorRetain(v13);
    swift_release(v9);
    v14 = _swift_stdlib_bridgeErrorToNSError(v13);
    *(_QWORD *)(v0 + 192) = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 192, v0 + 200, v7 + 4, v7 + 12);
    *v8 = v14;
    swift_errorRelease(v13);
    swift_errorRelease(v13);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Error recording page event: %{public}@", v7, 0xCu);
    v15 = sub_1000051F0(&qword_1000483E8);
    swift_arrayDestroy(v8, 1, v15);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {
    v16 = *(_QWORD *)(v0 + 392);

    swift_errorRelease(v16);
    swift_errorRelease(v16);
  }
  swift_errorRelease(*(_QWORD *)(v0 + 392));
  v17 = *(_QWORD *)(v0 + 344);
  v18 = *(_QWORD *)(v0 + 320);
  v20 = *(_QWORD *)(v0 + 288);
  v19 = *(_QWORD *)(v0 + 296);
  v21 = *(_QWORD *)(v0 + 280);
  v22 = *(_QWORD *)(v0 + 256);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 336) + 8))(v17, *(_QWORD *)(v0 + 328));
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002AD2C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = type metadata accessor for LintedMetricsEvent(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000051F0(&qword_1000495E8);
  v5 = swift_bridgeObjectRetain(a1);
  LintedMetricsEvent.init(fields:issues:)(v5, &_swiftEmptyArrayStorage);
  return Promise.__allocating_init(value:)(v4);
}

unint64_t sub_10002ADBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10002AF04(a1, a2, v5);
}

unint64_t sub_10002AE20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10002AFE4(a1, v4);
}

unint64_t sub_10002AE50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  v5 = type metadata accessor for MetricsEventType(0);
  v6 = sub_10002D3CC(&qword_1000495D0, (uint64_t)&protocol conformance descriptor for MetricsEventType);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_10002B0A8(a1, v7);
}

unint64_t sub_10002AEB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  v5 = type metadata accessor for CodingUserInfoKey(0);
  v6 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, &protocol witness table for CodingUserInfoKey);
  return sub_10002B1E0(a1, v6);
}

unint64_t sub_10002AF04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10002AFE4(uint64_t a1, uint64_t a2)
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
      sub_10002CBF8(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10000F4A4((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_10002B0A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  char v15;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v18 = a1;
  v5 = type metadata accessor for MetricsEventType(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      v14 = sub_10002D3CC(&qword_1000495D8, (uint64_t)&protocol conformance descriptor for MetricsEventType);
      v15 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v18, v5, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v15 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_10002B1E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  v17 = a1;
  v5 = type metadata accessor for CodingUserInfoKey(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      v14 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v17, v5, &protocol witness table for CodingUserInfoKey);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_10002B308(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t result;
  _QWORD v39[4];
  _OWORD v40[2];
  _OWORD v41[2];
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v51 = a6;
  v9 = -1 << *(_BYTE *)(a1 + 32);
  v10 = ~v9;
  v11 = *(_QWORD *)(a1 + 64);
  v12 = -v9;
  v44 = a1;
  v45 = a1 + 64;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  else
    v13 = -1;
  v46 = v10;
  v47 = 0;
  v48 = v13 & v11;
  v49 = a2;
  v50 = a3;
  swift_bridgeObjectRetain(a1);
  swift_retain(a3);
  sub_10002CC34(&v42);
  v14 = *((_QWORD *)&v42 + 1);
  if (!*((_QWORD *)&v42 + 1))
  {
LABEL_20:
    swift_release(a3);
    swift_bridgeObjectRelease(a1);
    sub_10002CE08(v44);
    return swift_release(v50);
  }
  while (1)
  {
    v16 = v42;
    sub_10001C288(&v43, v41);
    v17 = *a5;
    v19 = sub_10002ADBC(v16, v14);
    v20 = *(_QWORD *)(v17 + 16);
    v21 = (v18 & 1) == 0;
    v22 = v20 + v21;
    if (__OFADD__(v20, v21))
      break;
    v23 = v18;
    if (*(_QWORD *)(v17 + 24) >= v22)
    {
      if ((a4 & 1) != 0)
      {
        if ((v18 & 1) != 0)
          goto LABEL_15;
      }
      else
      {
        sub_10002B780();
        if ((v23 & 1) != 0)
          goto LABEL_15;
      }
    }
    else
    {
      sub_10002BEC4(v22, a4 & 1);
      v24 = sub_10002ADBC(v16, v14);
      if ((v23 & 1) != (v25 & 1))
        goto LABEL_23;
      v19 = v24;
      if ((v23 & 1) != 0)
      {
LABEL_15:
        sub_10000F65C(*(_QWORD *)(*a5 + 56) + 32 * v19, (uint64_t)v39);
        v27 = type metadata accessor for MainActor(0, v26);
        v28 = static MainActor.shared.getter(v27);
        v29 = dispatch thunk of Actor.unownedExecutor.getter(v27, &protocol witness table for MainActor);
        v31 = v30;
        if ((swift_task_isCurrentExecutor(v29) & 1) == 0)
          swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationAppStoreMetrics.swift", 67, 1, v51, v29, v31);
        sub_10000F65C((uint64_t)v39, (uint64_t)v40);
        swift_release(v28);
        sub_10001C164(v39);
        sub_10001C164(v41);
        swift_bridgeObjectRelease(v14);
        v15 = (_QWORD *)(*(_QWORD *)(*a5 + 56) + 32 * v19);
        sub_10001C164(v15);
        sub_10001C288(v40, v15);
        goto LABEL_7;
      }
    }
    v32 = (_QWORD *)*a5;
    *(_QWORD *)(*a5 + 8 * (v19 >> 6) + 64) |= 1 << v19;
    v33 = (uint64_t *)(v32[6] + 16 * v19);
    *v33 = v16;
    v33[1] = v14;
    sub_10001C288(v41, (_OWORD *)(v32[7] + 32 * v19));
    v34 = v32[2];
    v35 = __OFADD__(v34, 1);
    v36 = v34 + 1;
    if (v35)
      goto LABEL_22;
    v32[2] = v36;
LABEL_7:
    sub_10002CC34(&v42);
    v14 = *((_QWORD *)&v42 + 1);
    a4 = 1;
    if (!*((_QWORD *)&v42 + 1))
      goto LABEL_20;
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

void *sub_10002B5C8()
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
  sub_1000051F0(&qword_100048438);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
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
    swift_bridgeObjectRetain(v18);
    result = (void *)swift_bridgeObjectRetain(v22);
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

void *sub_10002B780()
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
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  sub_1000051F0(&qword_100049568);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release(v2);
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
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
      goto LABEL_30;
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
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_10000F65C(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_10001C288(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain(v18);
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release(v2);
    v1 = v25;
    goto LABEL_28;
  }
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
LABEL_30:
  __break(1u);
  return result;
}

void *sub_10002B964()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t *v24;
  uint64_t v25;
  _OWORD v26[2];

  v1 = v0;
  v2 = type metadata accessor for CodingUserInfoKey(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000051F0(&qword_100049590);
  v6 = *v0;
  v7 = static _DictionaryStorage.copy(original:)(*v0);
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release(v6);
LABEL_28:
    *v1 = v8;
    return result;
  }
  v24 = v1;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v25 = v6 + 64;
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v21 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v16)
      goto LABEL_26;
    v22 = *(_QWORD *)(v25 + 8 * v21);
    ++v12;
    if (!v22)
    {
      v12 = v21 + 1;
      if (v21 + 1 >= v16)
        goto LABEL_26;
      v22 = *(_QWORD *)(v25 + 8 * v12);
      if (!v22)
        break;
    }
LABEL_25:
    v15 = (v22 - 1) & v22;
    v18 = __clz(__rbit64(v22)) + (v12 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v3 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v19, v2);
    v20 = 32 * v18;
    sub_10000F65C(*(_QWORD *)(v6 + 56) + v20, (uint64_t)v26);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v19, v5, v2);
    result = sub_10001C288(v26, (_OWORD *)(*(_QWORD *)(v8 + 56) + v20));
  }
  v23 = v21 + 2;
  if (v23 >= v16)
  {
LABEL_26:
    result = (void *)swift_release(v6);
    v1 = v24;
    goto LABEL_28;
  }
  v22 = *(_QWORD *)(v25 + 8 * v23);
  if (v22)
  {
    v12 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v22 = *(_QWORD *)(v25 + 8 * v12);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_10002BBA0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  uint64_t v42;
  char v43;
  _QWORD v44[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000051F0(&qword_100048438);
  v43 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v42 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v40 = v3;
  v41 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v22 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v23 = v22 | (v14 << 6);
      goto LABEL_34;
    }
    v24 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v24 >= v41)
      break;
    v25 = (_QWORD *)(v5 + 64);
    v26 = *(_QWORD *)(v42 + 8 * v24);
    ++v14;
    if (!v26)
    {
      v14 = v24 + 1;
      if (v24 + 1 >= v41)
        goto LABEL_36;
      v26 = *(_QWORD *)(v42 + 8 * v14);
      if (!v26)
      {
        v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_36:
          swift_release(v5);
          v3 = v40;
          if ((v43 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v26 = *(_QWORD *)(v42 + 8 * v27);
        if (!v26)
        {
          while (1)
          {
            v14 = v27 + 1;
            if (__OFADD__(v27, 1))
              goto LABEL_45;
            if (v14 >= v41)
              goto LABEL_36;
            v26 = *(_QWORD *)(v42 + 8 * v14);
            ++v27;
            if (v26)
              goto LABEL_33;
          }
        }
        v14 = v27;
      }
    }
LABEL_33:
    v11 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v14 << 6);
LABEL_34:
    v32 = 16 * v23;
    v33 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v32);
    v35 = *v33;
    v34 = v33[1];
    v36 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v32);
    v37 = *v36;
    v38 = v36[1];
    if ((v43 & 1) == 0)
    {
      swift_bridgeObjectRetain(v33[1]);
      swift_bridgeObjectRetain(v38);
    }
    Hasher.init(_seed:)(v44, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v44, v35, v34);
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v30 = v17 == v29;
        if (v17 == v29)
          v17 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v31 == -1);
      v18 = __clz(__rbit64(~v31)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 16 * v18;
    v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
    *v20 = v35;
    v20[1] = v34;
    v21 = (_QWORD *)(*(_QWORD *)(v8 + 56) + v19);
    *v21 = v37;
    v21[1] = v38;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v40;
  v25 = (_QWORD *)(v5 + 64);
  if ((v43 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v39 = 1 << *(_BYTE *)(v5 + 32);
  if (v39 >= 64)
    bzero(v25, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v25 = -1 << v39;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_10002BEC4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  _QWORD *v36;
  _QWORD v37[9];
  _OWORD v38[2];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000051F0(&qword_100049568);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v34 = v3;
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain(v5);
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v18 = v17 | (v14 << 6);
      }
      else
      {
        v19 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }
        if (v19 >= v35)
          goto LABEL_37;
        v20 = v36[v19];
        ++v14;
        if (!v20)
        {
          v14 = v19 + 1;
          if (v19 + 1 >= v35)
            goto LABEL_37;
          v20 = v36[v14];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v35)
            {
LABEL_37:
              swift_release(v5);
              v3 = v34;
              if ((a2 & 1) != 0)
              {
                v33 = 1 << *(_BYTE *)(v5 + 32);
                if (v33 >= 64)
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v20 = v36[v21];
            if (!v20)
            {
              while (1)
              {
                v14 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_44;
                if (v14 >= v35)
                  goto LABEL_37;
                v20 = v36[v14];
                ++v21;
                if (v20)
                  goto LABEL_24;
              }
            }
            v14 = v21;
          }
        }
LABEL_24:
        v11 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }
      v22 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v18);
      v24 = *v22;
      v23 = v22[1];
      v25 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v18);
      if ((a2 & 1) != 0)
      {
        sub_10001C288(v25, v38);
      }
      else
      {
        sub_10000F65C((uint64_t)v25, (uint64_t)v38);
        swift_bridgeObjectRetain(v23);
      }
      Hasher.init(_seed:)(v37, *(_QWORD *)(v8 + 40));
      String.hash(into:)(v37, v24, v23);
      result = Hasher._finalize()();
      v26 = -1 << *(_BYTE *)(v8 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v12 + 8 * v28);
        }
        while (v32 == -1);
        v15 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v15);
      *v16 = v24;
      v16[1] = v23;
      result = (uint64_t)sub_10001C288(v38, (_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v15));
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_10002C1C0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  _QWORD *v39;
  int v40;
  _OWORD v41[2];

  v3 = v2;
  v6 = type metadata accessor for CodingUserInfoKey(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  if (*(_QWORD *)(*v3 + 24) > a1)
    a1 = *(_QWORD *)(*v3 + 24);
  sub_1000051F0(&qword_100049590);
  v40 = a2;
  v11 = static _DictionaryStorage.resize(original:capacity:move:)(v10, a1, a2);
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_43;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v39 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v37 = v3;
  v38 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  result = swift_retain(v10);
  v19 = 0;
  while (1)
  {
    if (v16)
    {
      v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v22 = v21 | (v19 << 6);
      goto LABEL_24;
    }
    v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v38)
      break;
    v24 = v39;
    v25 = v39[v23];
    ++v19;
    if (!v25)
    {
      v19 = v23 + 1;
      if (v23 + 1 >= v38)
        goto LABEL_36;
      v25 = v39[v19];
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v38)
        {
LABEL_36:
          swift_release(v10);
          v3 = v37;
          if ((v40 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = v39[v26];
        if (!v25)
        {
          while (1)
          {
            v19 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v19 >= v38)
              goto LABEL_36;
            v25 = v39[v19];
            ++v26;
            if (v25)
              goto LABEL_23;
          }
        }
        v19 = v26;
      }
    }
LABEL_23:
    v16 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_24:
    v27 = *(_QWORD *)(v7 + 72);
    v28 = *(_QWORD *)(v10 + 48) + v27 * v22;
    if ((v40 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 32))(v9, v28, v6);
      sub_10001C288((_OWORD *)(*(_QWORD *)(v10 + 56) + 32 * v22), v41);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v9, v28, v6);
      sub_10000F65C(*(_QWORD *)(v10 + 56) + 32 * v22, (uint64_t)v41);
    }
    result = dispatch thunk of Hashable._rawHashValue(seed:)(*(_QWORD *)(v12 + 40), v6, &protocol witness table for CodingUserInfoKey);
    v29 = -1 << *(_BYTE *)(v12 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v17 + 8 * (v30 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v17 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v17 + 8 * v31);
      }
      while (v35 == -1);
      v20 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(*(_QWORD *)(v12 + 48) + v27 * v20, v9, v6);
    result = (uint64_t)sub_10001C288(v41, (_OWORD *)(*(_QWORD *)(v12 + 56) + 32 * v20));
    ++*(_QWORD *)(v12 + 16);
  }
  swift_release(v10);
  v3 = v37;
  v24 = v39;
  if ((v40 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v36 = 1 << *(_BYTE *)(v10 + 32);
  if (v36 >= 64)
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v36;
  *(_QWORD *)(v10 + 16) = 0;
LABEL_43:
  result = swift_release(v10);
  *v3 = v12;
  return result;
}

uint64_t sub_10002C544(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;
  _QWORD v32[9];
  _OWORD v33[2];
  _OWORD v34[2];

  if (!a3)
    return (uint64_t)&_swiftEmptyDictionarySingleton;
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain(a4);
    return v4;
  }
  sub_1000051F0(&qword_100049568);
  result = static _DictionaryStorage.allocate(capacity:)(v5);
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v30)
        return v8;
      v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        v10 = v14 + 1;
        if (v14 + 1 >= v30)
          return v8;
        v15 = a1[v10];
        if (!v15)
        {
          v10 = v14 + 2;
          if (v14 + 2 >= v30)
            return v8;
          v15 = a1[v10];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v30)
              return v8;
            v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                v10 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_41;
                if (v10 >= v30)
                  return v8;
                v15 = a1[v10];
                ++v16;
                if (v15)
                  goto LABEL_24;
              }
            }
            v10 = v16;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v19 = *v17;
    v18 = v17[1];
    sub_10000F65C(*(_QWORD *)(v4 + 56) + 32 * v13, (uint64_t)v34);
    sub_10001C288(v34, v33);
    Hasher.init(_seed:)(v32, *(_QWORD *)(v8 + 40));
    swift_bridgeObjectRetain(v18);
    String.hash(into:)(v32, v19, v18);
    result = Hasher._finalize()();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v19;
    v28[1] = v18;
    result = (uint64_t)sub_10001C288(v33, (_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v23));
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      return v8;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

_OWORD *sub_10002C804(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_10002ADBC(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_QWORD *)(v18[7] + 32 * v12);
        sub_10001C164(v19);
        return sub_10001C288(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10002B780();
      goto LABEL_7;
    }
    sub_10002BEC4(v15, a4 & 1);
    v21 = sub_10002ADBC(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_10002CAB0(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain(a3);
    }
  }
  result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

_OWORD *sub_10002C934(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _OWORD *result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for CodingUserInfoKey(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_10002AEB4(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      v20 = *v4;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = (_QWORD *)(v20[7] + 32 * v14);
        sub_10001C164(v21);
        return sub_10001C288(a1, v21);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_10002B964();
      goto LABEL_7;
    }
    sub_10002C1C0(v17, a3 & 1);
    v23 = sub_10002AEB4(a2);
    if ((v18 & 1) == (v24 & 1))
    {
      v14 = v23;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_10002CB18(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v8);
  __break(1u);
  return result;
}

_OWORD *sub_10002CAB0(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_10001C288(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

_OWORD *sub_10002CB18(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  _OWORD *result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for CodingUserInfoKey(0);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  result = sub_10001C288(a3, (_OWORD *)(a4[7] + 32 * a1));
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_10002CBB8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v4 = *a1;
  v3 = a1[1];
  sub_10000F65C((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain(v3);
}

uint64_t sub_10002CBF8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_10002CC34@<X0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  void (*v19)(_OWORD *);
  uint64_t result;
  _OWORD v21[3];
  _OWORD v22[3];
  __int128 v23;
  _OWORD v24[2];

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  v7 = v5;
  v8 = v1[4];
  if (v8)
  {
    v9 = (v8 - 1) & v8;
    v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    v11 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v13 = *v11;
    v12 = v11[1];
    sub_10000F65C(*(_QWORD *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(_QWORD *)&v23 = v13;
    *((_QWORD *)&v23 + 1) = v12;
    swift_bridgeObjectRetain(v12);
    goto LABEL_23;
  }
  v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    v16 = *(_QWORD *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      v9 = (v16 - 1) & v16;
      v10 = __clz(__rbit64(v16)) + (v14 << 6);
      v7 = v14;
      goto LABEL_3;
    }
    v17 = v5 + 2;
    v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      v16 = *(_QWORD *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        v14 = v17;
        goto LABEL_7;
      }
      v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        v16 = *(_QWORD *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          v14 = v5 + 3;
          goto LABEL_7;
        }
        v17 = v5 + 4;
        v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          v16 = *(_QWORD *)(v4 + 8 * v17);
          if (v16)
            goto LABEL_10;
          v14 = v5 + 5;
          v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            v16 = *(_QWORD *)(v4 + 8 * v14);
            if (v16)
              goto LABEL_7;
            v7 = v15 - 1;
            v18 = v5 + 6;
            while (v15 != v18)
            {
              v16 = *(_QWORD *)(v4 + 8 * v18++);
              if (v16)
              {
                v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  v9 = 0;
  memset(v24, 0, sizeof(v24));
  v23 = 0u;
LABEL_23:
  *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  v19 = (void (*)(_OWORD *))v1[5];
  result = sub_10002CE10((uint64_t)&v23, (uint64_t)v22);
  if (*((_QWORD *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_10002CE58((uint64_t)v21);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_10002CE08(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10002CE10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000051F0(&qword_100049570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002CE58(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000051F0(&qword_100049578);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10002CE98()
{
  unint64_t result;

  result = qword_100049598;
  if (!qword_100049598)
  {
    result = swift_getWitnessTable(&unk_10003420C, &type metadata for InstallConfirmationAppStoreMetrics.Linter);
    atomic_store(result, (unint64_t *)&qword_100049598);
  }
  return result;
}

uint64_t sub_10002CEDC(uint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
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
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v34;
  unint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  _QWORD v43[2];
  uint64_t v44;
  _QWORD v45[5];
  int64_t v46;

  v36 = (unint64_t *)result;
  v4 = 0;
  v38 = 0;
  v39 = a3 + 64;
  v5 = 1 << *(_BYTE *)(a3 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a3 + 64);
  v40 = (unint64_t)(v5 + 63) >> 6;
  v37 = a4 + 7;
  while (1)
  {
    while (1)
    {
      if (v7)
      {
        v8 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v46 = v4;
        v9 = v8 | (v4 << 6);
      }
      else
      {
        v10 = v4 + 1;
        if (__OFADD__(v4, 1))
          goto LABEL_44;
        if (v10 >= v40)
          return sub_10002C544(v36, a2, v38, a3);
        v11 = *(_QWORD *)(v39 + 8 * v10);
        v12 = v4 + 1;
        if (!v11)
        {
          v12 = v4 + 2;
          if (v4 + 2 >= v40)
            return sub_10002C544(v36, a2, v38, a3);
          v11 = *(_QWORD *)(v39 + 8 * v12);
          if (!v11)
          {
            v12 = v4 + 3;
            if (v4 + 3 >= v40)
              return sub_10002C544(v36, a2, v38, a3);
            v11 = *(_QWORD *)(v39 + 8 * v12);
            if (!v11)
            {
              v13 = v4 + 4;
              if (v4 + 4 >= v40)
                return sub_10002C544(v36, a2, v38, a3);
              v11 = *(_QWORD *)(v39 + 8 * v13);
              if (!v11)
              {
                while (1)
                {
                  v12 = v13 + 1;
                  if (__OFADD__(v13, 1))
                    goto LABEL_45;
                  if (v12 >= v40)
                    return sub_10002C544(v36, a2, v38, a3);
                  v11 = *(_QWORD *)(v39 + 8 * v12);
                  ++v13;
                  if (v11)
                    goto LABEL_20;
                }
              }
              v12 = v4 + 4;
            }
          }
        }
LABEL_20:
        v7 = (v11 - 1) & v11;
        v46 = v12;
        v9 = __clz(__rbit64(v11)) + (v12 << 6);
      }
      v14 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v9);
      v15 = *v14;
      v16 = v14[1];
      sub_10000F65C(*(_QWORD *)(a3 + 56) + 32 * v9, (uint64_t)v45);
      v43[0] = v15;
      v43[1] = v16;
      sub_10000F65C((uint64_t)v45, (uint64_t)&v44);
      v18 = type metadata accessor for MainActor(0, v17);
      v19 = swift_bridgeObjectRetain_n(v16, 2);
      v20 = static MainActor.shared.getter(v19);
      v21 = dispatch thunk of Actor.unownedExecutor.getter(v18, &protocol witness table for MainActor);
      v23 = v22;
      if ((swift_task_isCurrentExecutor(v21) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationAppStoreMetrics.swift", 67, 1, 26, v21, v23);
      v24 = a4[2];
      if (v24)
        break;
LABEL_4:
      sub_10002CE58((uint64_t)v43);
      swift_release(v20);
      sub_10001C164(v45);
      result = swift_bridgeObjectRelease(v16);
      v4 = v46;
    }
    v25 = a4[4];
    v26 = a4[5];
    if (v25 != v15 || v26 != v16)
    {
      result = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v26, v15, v16, 0);
      if ((result & 1) == 0)
        break;
    }
LABEL_39:
    sub_10002CE58((uint64_t)v43);
    swift_release(v20);
    sub_10001C164(v45);
    result = swift_bridgeObjectRelease(v16);
    *(unint64_t *)((char *)v36 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v34 = __OFADD__(v38++, 1);
    v4 = v46;
    if (v34)
    {
      __break(1u);
      return sub_10002C544(v36, a2, v38, a3);
    }
  }
  if (v24 == 1)
    goto LABEL_4;
  v28 = v37;
  v29 = 1;
  while (1)
  {
    v30 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    v31 = *(v28 - 1);
    v32 = *v28;
    if (v31 == v15 && v32 == v16)
      goto LABEL_39;
    result = _stringCompareWithSmolCheck(_:_:expecting:)(v31, v32, v15, v16, 0);
    if ((result & 1) != 0)
      goto LABEL_39;
    v28 += 2;
    ++v29;
    if (v30 == v24)
      goto LABEL_4;
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_10002D204(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  char v5;
  unsigned int v6;
  unint64_t v7;
  size_t v8;
  uint64_t isStackAllocationSafe;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  v8 = 8 * v7;
  isStackAllocationSafe = swift_bridgeObjectRetain_n(a2, 2);
  if (v6 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(v8, 8), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v14 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain(a2);
    v10 = sub_10002CEDC((uint64_t)&v14 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a1, a2);
    v11 = swift_bridgeObjectRelease(a2);
    if (v2)
      swift_willThrow(v11);
    swift_bridgeObjectRelease_n(a2, 2);
  }
  else
  {
    v12 = (void *)swift_slowAlloc(v8, -1);
    bzero(v12, v8);
    swift_bridgeObjectRetain(a2);
    v10 = sub_10002CEDC((uint64_t)v12, v7, a1, a2);
    swift_bridgeObjectRelease(a2);
    swift_slowDealloc(v12, -1, -1);
    swift_bridgeObjectRelease_n(a2, 2);
  }
  return v10;
}

uint64_t sub_10002D3B8(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10000A064(result, a2);
  return result;
}

uint64_t sub_10002D3CC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for MetricsEventType(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for InstallConfirmationAppStoreMetrics.Linter()
{
  return &type metadata for InstallConfirmationAppStoreMetrics.Linter;
}

Swift::Int sub_10002D41C()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  String.hash(into:)(v1, 0xD000000000000022, 0x8000000100034540);
  return Hasher._finalize()();
}

uint64_t sub_10002D470(uint64_t a1)
{
  return String.hash(into:)(a1, 0xD000000000000022, 0x8000000100034540);
}

Swift::Int sub_10002D48C(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  String.hash(into:)(v2, 0xD000000000000022, 0x8000000100034540);
  return Hasher._finalize()();
}

uint64_t sub_10002D4DC@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100041528, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_10002D52C(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000022;
  a1[1] = 0x8000000100034540;
}

uint64_t storeEnumTagSinglePayload for LaunchAngelEntitlements(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10002D58C + 4 * byte_100034240[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10002D5AC + 4 * byte_100034245[v4]))();
}

_BYTE *sub_10002D58C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10002D5AC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10002D5B4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10002D5BC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10002D5C4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10002D5CC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LaunchAngelEntitlements()
{
  return &type metadata for LaunchAngelEntitlements;
}

unint64_t sub_10002D5EC()
{
  unint64_t result;

  result = qword_1000495F0;
  if (!qword_1000495F0)
  {
    result = swift_getWitnessTable(&unk_1000342E0, &type metadata for LaunchAngelEntitlements);
    atomic_store(result, (unint64_t *)&qword_1000495F0);
  }
  return result;
}

uint64_t sub_10002D630(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

char *sub_10002D65C(void *a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BYTE *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  id v23;
  char *v24;
  id v25;
  void *v26;
  objc_super v28;

  v7 = type metadata accessor for LocalizedInstallSheetContent(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = &v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_dismissAction];
  *v10 = 0;
  v10[1] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_childViewController] = 0;
  v11 = OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_responseAction;
  *(_QWORD *)&v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_responseAction] = 0;
  v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_response] = 0;
  v12 = OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_isIPad;
  v13 = (void *)objc_opt_self(UIDevice);
  v14 = v3;
  v15 = objc_msgSend(v13, "currentDevice");
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  v3[v12] = v16 == (id)1;
  v17 = objc_msgSend(a1, "actions");
  if (v17)
  {
    v18 = sub_10000F82C(0, (unint64_t *)&qword_100049230, BSAction_ptr);
    v19 = sub_10000F44C();
    v20 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v17, v18, v19);

    v17 = (id)sub_10000D7F4(v20);
    swift_bridgeObjectRelease(v20);
  }
  v21 = *(void **)&v3[v11];
  *(_QWORD *)&v3[v11] = v17;

  sub_10000F698(a2, (uint64_t)&v14[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_localizedContent]);
  sub_10000F6DC(a3, (uint64_t)&v14[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_appStoreMetrics]);

  v22 = (objc_class *)type metadata accessor for InstallConfirmationViewController(0);
  v28.receiver = v14;
  v28.super_class = v22;
  v23 = objc_msgSendSuper2(&v28, "initWithNibName:bundle:", 0, 0);
  sub_10000F698(a2, (uint64_t)v9);
  objc_allocWithZone((Class)type metadata accessor for InstallSheetViewController(0));
  v24 = (char *)v23;
  v25 = sub_10000FC20((uint64_t)v9, (uint64_t)v23, (uint64_t)&off_100042648);

  sub_100030EBC(a3);
  sub_100031084(a2, type metadata accessor for LocalizedInstallSheetContent);
  v26 = *(void **)&v24[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_childViewController];
  *(_QWORD *)&v24[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_childViewController] = v25;

  return v24;
}

void sub_10002D954(char a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  double v23;
  id v24;
  uint64_t v25;
  objc_super v26;

  v3 = v2;
  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor(v7) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 48, v7, v9);
  v26.receiver = v3;
  v26.super_class = (Class)type metadata accessor for InstallConfirmationViewController(0);
  v10 = objc_msgSendSuper2(&v26, "viewDidAppear:", a1 & 1);
  v11 = static MainActor.shared.getter(v10);
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v14 = v13;
  if ((swift_task_isCurrentExecutor(v12) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 28, v12, v14);
  v15 = *(void **)&v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_childViewController];
  v16 = v15;
  swift_release(v11);
  if (!v15)
  {
    swift_release(v6);
    return;
  }
  objc_msgSend(v16, "setModalPresentationStyle:", 2);
  v17 = objc_msgSend(v3, "view");
  if (!v17)
  {
    __break(1u);
    goto LABEL_16;
  }
  v18 = v17;
  v19 = objc_msgSend(v17, "window");

  if (v19)
  {
    v20 = objc_msgSend(v19, "_rootSheetPresentationController");

    if (v20)
    {
      objc_msgSend(v20, "_setShouldScaleDownBehindDescendantSheets:", 0);

      goto LABEL_10;
    }
LABEL_16:
    __break(1u);
    return;
  }
LABEL_10:
  v21 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
  v22 = v21;
  v23 = 0.8;
  if (v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_isIPad])
    v23 = 0.4;
  v24 = objc_msgSend(v21, "colorWithAlphaComponent:", v23);

  sub_10002F52C(v24, v25);
  objc_msgSend(v3, "presentViewController:animated:completion:", v16, 1, 0);
  swift_release(v6);

}

uint64_t sub_10002DD74(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 234) = a1;
  v3 = type metadata accessor for ContinuousClock(0);
  *(_QWORD *)(v2 + 24) = v3;
  v4 = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 40) = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext(0);
  *(_QWORD *)(v2 + 48) = v5;
  v6 = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 56) = v6;
  *(_QWORD *)(v2 + 64) = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for InstallSheetContext.Source(0);
  *(_QWORD *)(v2 + 72) = v7;
  v8 = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v2 + 80) = v8;
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v2 + 88) = swift_task_alloc(v9);
  *(_QWORD *)(v2 + 96) = swift_task_alloc(v9);
  v10 = sub_1000051F0(&qword_1000486D0);
  *(_QWORD *)(v2 + 104) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for InstallConfirmationAppStoreMetrics(0);
  *(_QWORD *)(v2 + 112) = v11;
  v12 = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v2 + 120) = v12;
  *(_QWORD *)(v2 + 128) = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for MainActor(0, v13);
  *(_QWORD *)(v2 + 136) = static MainActor.shared.getter(v14);
  v15 = dispatch thunk of Actor.unownedExecutor.getter(v14, &protocol witness table for MainActor);
  *(_QWORD *)(v2 + 144) = v15;
  *(_QWORD *)(v2 + 152) = v16;
  return swift_task_switch(sub_10002DEB8, v15, v16);
}

uint64_t sub_10002DEB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
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
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  char v47;
  uint64_t v48;
  char v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 104);
  sub_10000F6DC(*(_QWORD *)(v0 + 16)+ OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_appStoreMetrics, v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100030EBC(*(_QWORD *)(v0 + 104));
    v5 = (_QWORD *)(v0 + 96);
    v4 = *(_QWORD *)(v0 + 96);
    v6 = *(_QWORD *)(v0 + 72);
    v7 = *(_QWORD *)(v0 + 80);
    v8 = *(_QWORD *)(v0 + 16)
       + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_localizedContent;
    v9 = type metadata accessor for LocalizedInstallSheetContent(0);
    InstallSheetContext.source.getter(v9);
    v10 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 88);
    v11 = v10(v4, v6);
    v12 = enum case for InstallSheetContext.Source.appStoreWithContext(_:);
    if ((_DWORD)v11 == enum case for InstallSheetContext.Source.appStoreWithContext(_:))
    {
      v13 = *(_QWORD *)(v0 + 96);
      v14 = *(_QWORD *)(v0 + 48);
      v15 = *(_QWORD *)(v0 + 56);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 80) + 96))(v13, *(_QWORD *)(v0 + 72));
      v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    }
    else if ((_DWORD)v11 == enum case for InstallSheetContext.Source.distributor(_:)
           || (_DWORD)v11 == enum case for InstallSheetContext.Source.web(_:)
           || (_DWORD)v11 != enum case for InstallSheetContext.Source.appStore(_:))
    {
      goto LABEL_22;
    }
    v5 = (_QWORD *)(v0 + 88);
    v37 = *(_QWORD *)(v0 + 88);
    v38 = *(_QWORD *)(v0 + 72);
    InstallSheetContext.source.getter(v11);
    v39 = v10(v37, v38);
    if (v39 == v12)
    {
      v40 = *(_QWORD *)(v0 + 88);
      v41 = *(_QWORD *)(v0 + 64);
      v42 = *(_QWORD *)(v0 + 48);
      v43 = *(_QWORD *)(v0 + 56);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 80) + 96))(v40, *(_QWORD *)(v0 + 72));
      v44 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v43 + 32))(v41, v40, v42);
      LOBYTE(v40) = InstallSheetContext.Source.AppStoreSheetContext.showBiometrics.getter(v44);
      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v41, v42);
      if ((v40 & 1) != 0)
        goto LABEL_23;
LABEL_21:
      v47 = *(_BYTE *)(v0 + 234);
      swift_release(*(_QWORD *)(v0 + 136));
      v49 = v47;
LABEL_26:
      sub_10002F0D4(v49, v48);
      v51 = *(_QWORD *)(v0 + 96);
      v52 = *(_QWORD *)(v0 + 104);
      v53 = *(_QWORD *)(v0 + 88);
      v54 = *(_QWORD *)(v0 + 64);
      v55 = *(_QWORD *)(v0 + 40);
      swift_task_dealloc(*(_QWORD *)(v0 + 128));
      swift_task_dealloc(v52);
      swift_task_dealloc(v51);
      swift_task_dealloc(v53);
      swift_task_dealloc(v54);
      swift_task_dealloc(v55);
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    if (v39 == enum case for InstallSheetContext.Source.appStore(_:))
    {
      if ((InstallSheetContext.showBiometricsForAppStoreInstall.getter() & 1) == 0)
        goto LABEL_21;
LABEL_23:
      if (*(_BYTE *)(v0 + 234) == 1)
      {
        v50 = (_QWORD *)swift_task_alloc(dword_100049684);
        *(_QWORD *)(v0 + 216) = v50;
        *v50 = v0;
        v50[1] = sub_10002E60C;
        return sub_10002F73C(v8);
      }
      swift_release(*(_QWORD *)(v0 + 136));
      v49 = 0;
      goto LABEL_26;
    }
LABEL_22:
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*v5, *(_QWORD *)(v0 + 72));
    goto LABEL_23;
  }
  v16 = *(unsigned __int8 *)(v0 + 234);
  sub_100030EFC(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 128));
  v17 = type metadata accessor for LocalizedInstallSheetContent(0);
  v18 = InstallSheetContext.itemID.getter(v17);
  v19 = v18;
  v21 = v20;
  *(_QWORD *)(v0 + 160) = v20;
  if (v16 == 1)
  {
    v22 = InstallSheetContext.itemID.getter(v18);
    v24 = v23;
    *(_QWORD *)(v0 + 168) = v23;
    v25 = InstallSheetContext.Source.AppStoreSheetContext.installType.getter();
    v27 = v26;
    *(_QWORD *)(v0 + 176) = v26;
    *(_QWORD *)(v0 + 184) = sub_1000292CC((uint64_t)&_swiftEmptyArrayStorage);
    v28 = (_QWORD *)swift_task_alloc(dword_10004958C);
    *(_QWORD *)(v0 + 192) = v28;
    *v28 = v0;
    v28[1] = sub_10002E2B8;
    v29 = v19;
    v30 = v21;
    v31 = v22;
    v32 = v24;
    v33 = v25;
    v34 = v27;
  }
  else
  {
    *(_QWORD *)(v0 + 200) = sub_1000292CC((uint64_t)&_swiftEmptyArrayStorage);
    v45 = (_QWORD *)swift_task_alloc(dword_10004958C);
    *(_QWORD *)(v0 + 208) = v45;
    *v45 = v0;
    v45[1] = sub_10002E5A4;
    v29 = 0x6C65636E6143;
    v30 = 0xE600000000000000;
    v31 = v19;
    v32 = v21;
    v33 = 0x7373696D736964;
    v34 = 0xE700000000000000;
  }
  return sub_100029E40(v29, v30, v31, v32, v33, v34, 0x6E6F74747562, 0xE600000000000000);
}

uint64_t sub_10002E2B8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 184);
  v4 = *(_QWORD *)(*v0 + 168);
  v3 = *(_QWORD *)(*v0 + 176);
  v5 = *(_QWORD *)(*v0 + 160);
  swift_task_dealloc(*(_QWORD *)(*v0 + 192));
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  return swift_task_switch(sub_10002E33C, *(_QWORD *)(v1 + 144), *(_QWORD *)(v1 + 152));
}

uint64_t sub_10002E33C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  _QWORD *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_100031084(*(_QWORD *)(v0 + 128), type metadata accessor for InstallConfirmationAppStoreMetrics);
  v2 = (_QWORD *)(v0 + 96);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 16)
     + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_localizedContent;
  v6 = type metadata accessor for LocalizedInstallSheetContent(0);
  InstallSheetContext.source.getter(v6);
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 88);
  v8 = v7(v1, v3);
  v9 = enum case for InstallSheetContext.Source.appStoreWithContext(_:);
  if ((_DWORD)v8 == enum case for InstallSheetContext.Source.appStoreWithContext(_:))
  {
    v10 = *(_QWORD *)(v0 + 96);
    v11 = *(_QWORD *)(v0 + 48);
    v12 = *(_QWORD *)(v0 + 56);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 80) + 96))(v10, *(_QWORD *)(v0 + 72));
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  else if ((_DWORD)v8 == enum case for InstallSheetContext.Source.distributor(_:)
         || (_DWORD)v8 == enum case for InstallSheetContext.Source.web(_:)
         || (_DWORD)v8 != enum case for InstallSheetContext.Source.appStore(_:))
  {
LABEL_17:
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*v2, *(_QWORD *)(v0 + 72));
    goto LABEL_18;
  }
  v2 = (_QWORD *)(v0 + 88);
  v15 = *(_QWORD *)(v0 + 88);
  v16 = *(_QWORD *)(v0 + 72);
  InstallSheetContext.source.getter(v8);
  v17 = v7(v15, v16);
  if (v17 == v9)
  {
    v18 = *(_QWORD *)(v0 + 88);
    v19 = *(_QWORD *)(v0 + 64);
    v20 = *(_QWORD *)(v0 + 48);
    v21 = *(_QWORD *)(v0 + 56);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 80) + 96))(v18, *(_QWORD *)(v0 + 72));
    v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(v19, v18, v20);
    LOBYTE(v18) = InstallSheetContext.Source.AppStoreSheetContext.showBiometrics.getter(v22);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v20);
    if ((v18 & 1) != 0)
      goto LABEL_18;
LABEL_16:
    v23 = *(_BYTE *)(v0 + 234);
    swift_release(*(_QWORD *)(v0 + 136));
    v25 = v23;
    goto LABEL_21;
  }
  if (v17 != enum case for InstallSheetContext.Source.appStore(_:))
    goto LABEL_17;
  if ((InstallSheetContext.showBiometricsForAppStoreInstall.getter() & 1) == 0)
    goto LABEL_16;
LABEL_18:
  if (*(_BYTE *)(v0 + 234) == 1)
  {
    v26 = (_QWORD *)swift_task_alloc(dword_100049684);
    *(_QWORD *)(v0 + 216) = v26;
    *v26 = v0;
    v26[1] = sub_10002E60C;
    return sub_10002F73C(v5);
  }
  swift_release(*(_QWORD *)(v0 + 136));
  v25 = 0;
LABEL_21:
  sub_10002F0D4(v25, v24);
  v28 = *(_QWORD *)(v0 + 96);
  v29 = *(_QWORD *)(v0 + 104);
  v30 = *(_QWORD *)(v0 + 88);
  v31 = *(_QWORD *)(v0 + 64);
  v32 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc(*(_QWORD *)(v0 + 128));
  swift_task_dealloc(v29);
  swift_task_dealloc(v28);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002E5A4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 200);
  v3 = *(_QWORD *)(*v0 + 160);
  swift_task_dealloc(*(_QWORD *)(*v0 + 208));
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  return swift_task_switch(sub_1000310C0, *(_QWORD *)(v1 + 144), *(_QWORD *)(v1 + 152));
}

uint64_t sub_10002E60C(__int16 a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 216);
  *(_WORD *)(*v1 + 232) = a1;
  swift_task_dealloc(v3);
  return swift_task_switch(sub_10002E664, *(_QWORD *)(v2 + 144), *(_QWORD *)(v2 + 152));
}

uint64_t sub_10002E664()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  if ((*(_WORD *)(v0 + 232) & 1) == 0)
  {
    swift_release(*(_QWORD *)(v0 + 136));
LABEL_5:
    v2 = *(_QWORD *)(v0 + 96);
    v3 = *(_QWORD *)(v0 + 104);
    v4 = *(_QWORD *)(v0 + 88);
    v5 = *(_QWORD *)(v0 + 64);
    v6 = *(_QWORD *)(v0 + 40);
    swift_task_dealloc(*(_QWORD *)(v0 + 128));
    swift_task_dealloc(v3);
    swift_task_dealloc(v2);
    swift_task_dealloc(v4);
    swift_task_dealloc(v5);
    swift_task_dealloc(v6);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if ((*(_WORD *)(v0 + 232) & 0x100) == 0)
  {
    swift_release(*(_QWORD *)(v0 + 136));
    sub_10002F0D4(1, v1);
    goto LABEL_5;
  }
  ContinuousClock.init()();
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_1000496A0 + dword_1000496A0);
  v8 = (_QWORD *)swift_task_alloc(unk_1000496A4);
  *(_QWORD *)(v0 + 224) = v8;
  *v8 = v0;
  v8[1] = sub_10002E77C;
  return v9(1000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_10002E77C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();

  v2 = *(_QWORD **)v1;
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v1 + 224));
  v4 = v2[4];
  v3 = v2[5];
  v5 = v2[3];
  if (v0)
  {
    swift_errorRelease(v0);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    v6 = v2[18];
    v7 = v2[19];
    v8 = sub_1000310CC;
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 8))(v2[5], v2[3]);
    v6 = v2[18];
    v7 = v2[19];
    v8 = sub_10002E81C;
  }
  return swift_task_switch(v8, v6, v7);
}

uint64_t sub_10002E81C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release(*(_QWORD *)(v0 + 136));
  sub_10002F0D4(1, v1);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = *(_QWORD *)(v0 + 64);
  v6 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc(*(_QWORD *)(v0 + 128));
  swift_task_dealloc(v3);
  swift_task_dealloc(v2);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002E8A8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2[12] = a1;
  v2[13] = v1;
  v3 = sub_1000051F0(&qword_1000486D0);
  v2[14] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for InstallConfirmationAppStoreMetrics(0);
  v2[15] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[16] = v5;
  v2[17] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MainActor(0, v6);
  v2[18] = static MainActor.shared.getter(v7);
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v2[19] = v8;
  v2[20] = v9;
  return swift_task_switch(sub_10002E960, v8, v9);
}

uint64_t sub_10002E960()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t inited;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 112);
  sub_10000F6DC(*(_QWORD *)(v0 + 104)+ OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_appStoreMetrics, v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v4 = *(_QWORD *)(v0 + 112);
    swift_release(*(_QWORD *)(v0 + 144));
    sub_100030EBC(v4);
    v5 = *(_QWORD *)(v0 + 112);
    swift_task_dealloc(*(_QWORD *)(v0 + 136));
    swift_task_dealloc(v5);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    sub_100030EFC(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 136));
    v7 = type metadata accessor for LocalizedInstallSheetContent(0);
    v8 = InstallSheetContext.itemID.getter(v7);
    v10 = v9;
    *(_QWORD *)(v0 + 168) = v9;
    v11 = sub_1000051F0(&qword_100049548);
    inited = swift_initStackObject(v11, v0 + 16);
    *(_OWORD *)(inited + 16) = xmmword_1000336A0;
    *(_QWORD *)(inited + 32) = 0x72556E6F69746361;
    *(_QWORD *)(inited + 40) = 0xE90000000000006CLL;
    v13 = URL.absoluteString.getter();
    *(_QWORD *)(inited + 72) = &type metadata for String;
    *(_QWORD *)(inited + 48) = v13;
    *(_QWORD *)(inited + 56) = v14;
    *(_QWORD *)(v0 + 176) = sub_1000292CC(inited);
    v15 = (_QWORD *)swift_task_alloc(dword_10004958C);
    *(_QWORD *)(v0 + 184) = v15;
    *v15 = v0;
    v15[1] = sub_10002EB24;
    return sub_100029E40(0x726F4D6E7261654CLL, 0xE900000000000065, v8, v10, 0x657461676976616ELL, 0xE800000000000000, 1802398060, 0xE400000000000000);
  }
}

uint64_t sub_10002EB24()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 176);
  v3 = *(_QWORD *)(*v0 + 168);
  swift_task_dealloc(*(_QWORD *)(*v0 + 184));
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  return swift_task_switch(sub_10002EB8C, *(_QWORD *)(v1 + 152), *(_QWORD *)(v1 + 160));
}

uint64_t sub_10002EB8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 136);
  swift_release(*(_QWORD *)(v0 + 144));
  sub_100031084(v1, type metadata accessor for InstallConfirmationAppStoreMetrics);
  v2 = *(_QWORD *)(v0 + 112);
  swift_task_dealloc(*(_QWORD *)(v0 + 136));
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002EBE0()
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

  v1[2] = v0;
  v2 = sub_1000051F0(&qword_1000486D0);
  v1[3] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for InstallConfirmationAppStoreMetrics(0);
  v1[4] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v1[5] = v4;
  v1[6] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MainActor(0, v5);
  v1[7] = static MainActor.shared.getter(v6);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  v1[8] = v7;
  v1[9] = v8;
  return swift_task_switch(sub_10002EC98, v7, v8);
}

uint64_t sub_10002EC98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);
  sub_10000F6DC(*(_QWORD *)(v0 + 16)+ OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_appStoreMetrics, v3);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  v5 = *(_QWORD *)(v0 + 24);
  if (v4 == 1)
  {
    swift_release(*(_QWORD *)(v0 + 56));
    sub_100030EBC(v5);
    v6 = *(_QWORD *)(v0 + 24);
    swift_task_dealloc(*(_QWORD *)(v0 + 48));
    swift_task_dealloc(v6);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    sub_100030EFC(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 48));
    v8 = type metadata accessor for LocalizedInstallSheetContent(0);
    v9 = InstallSheetContext.itemID.getter(v8);
    v11 = v10;
    *(_QWORD *)(v0 + 80) = v10;
    *(_QWORD *)(v0 + 88) = sub_1000292CC((uint64_t)&_swiftEmptyArrayStorage);
    v12 = (_QWORD *)swift_task_alloc(dword_10004958C);
    *(_QWORD *)(v0 + 96) = v12;
    *v12 = v0;
    v12[1] = sub_10002EDE8;
    return sub_100029E40(1701998413, 0xE400000000000000, v9, v11, 1701998445, 0xE400000000000000, 0x6E6F74747562, 0xE600000000000000);
  }
}

uint64_t sub_10002EDE8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 88);
  v3 = *(_QWORD *)(*v0 + 80);
  swift_task_dealloc(*(_QWORD *)(*v0 + 96));
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  return swift_task_switch(sub_1000310C4, *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72));
}

uint64_t sub_10002EE50()
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

  v1[2] = v0;
  v2 = sub_1000051F0(&qword_1000486D0);
  v1[3] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for InstallConfirmationAppStoreMetrics(0);
  v1[4] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v1[5] = v4;
  v1[6] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MainActor(0, v5);
  v1[7] = static MainActor.shared.getter(v6);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  v1[8] = v7;
  v1[9] = v8;
  return swift_task_switch(sub_10002EF08, v7, v8);
}

uint64_t sub_10002EF08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);
  sub_10000F6DC(*(_QWORD *)(v0 + 16)+ OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_appStoreMetrics, v3);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  v5 = *(_QWORD *)(v0 + 24);
  if (v4 == 1)
  {
    swift_release(*(_QWORD *)(v0 + 56));
    sub_100030EBC(v5);
    v6 = *(_QWORD *)(v0 + 24);
    swift_task_dealloc(*(_QWORD *)(v0 + 48));
    swift_task_dealloc(v6);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    sub_100030EFC(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 48));
    v8 = type metadata accessor for LocalizedInstallSheetContent(0);
    v9 = InstallSheetContext.itemID.getter(v8);
    v11 = v10;
    *(_QWORD *)(v0 + 80) = v10;
    v12 = (_QWORD *)swift_task_alloc(dword_100049544);
    *(_QWORD *)(v0 + 88) = v12;
    *v12 = v0;
    v12[1] = sub_10002F02C;
    return sub_10002A5D4(v9, v11, 0x6174736E49707041, 0xEA00000000006C6CLL);
  }
}

uint64_t sub_10002F02C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 80);
  swift_task_dealloc(*(_QWORD *)(*v0 + 88));
  swift_bridgeObjectRelease(v2);
  return swift_task_switch(sub_10002F080, *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72));
}

uint64_t sub_10002F080()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 48);
  swift_release(*(_QWORD *)(v0 + 56));
  sub_100031084(v1, type metadata accessor for InstallConfirmationAppStoreMetrics);
  v2 = *(_QWORD *)(v0 + 24);
  swift_task_dealloc(*(_QWORD *)(v0 + 48));
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002F0D4(char a1, uint64_t a2)
{
  _BYTE *v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t isCurrentExecutor;
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
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _BYTE *v36;
  _QWORD v38[5];
  uint64_t v39;

  v3 = v2;
  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  isCurrentExecutor = swift_task_isCurrentExecutor(v7);
  if ((isCurrentExecutor & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 113, v7, v9);
  v11 = static MainActor.shared.getter(isCurrentExecutor);
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v14 = v13;
  if ((swift_task_isCurrentExecutor(v12) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 30, v12, v14);
  v15 = OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_response;
  v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_response] = a1 & 1;
  v16 = swift_release(v11);
  v17 = static MainActor.shared.getter(v16);
  v18 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v20 = v19;
  if ((swift_task_isCurrentExecutor(v18) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 29, v18, v20);
  v21 = *(void **)&v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_responseAction];
  v22 = v21;
  swift_release(v17);
  if (v21)
  {
    if (objc_msgSend(v22, "canSendResponse"))
    {
      v23 = objc_msgSend(objc_allocWithZone((Class)BSMutableSettings), "init");
      v24 = static MainActor.shared.getter(v23);
      v25 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
      v27 = v26;
      if ((swift_task_isCurrentExecutor(v25) & 1) == 0)
        swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 30, v25, v27);
      v28 = v3[v15];
      swift_release(v24);
      v29 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", v28);
      objc_msgSend(v23, "setObject:forSetting:", v29, 1);

      v30 = objc_msgSend((id)objc_opt_self(BSActionResponse), "responseWithInfo:", v23);
      objc_msgSend(v22, "sendResponse:", v30);

      v22 = v30;
    }

  }
  v31 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
  sub_10002F52C(v31, v32);

  v33 = swift_allocObject(&unk_1000426F8, 24, 7);
  *(_QWORD *)(v33 + 16) = v3;
  v38[4] = sub_100030EB4;
  v39 = v33;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 1107296256;
  v38[2] = sub_10002D630;
  v38[3] = &unk_100042710;
  v34 = _Block_copy(v38);
  v35 = v39;
  v36 = v3;
  swift_release(v35);
  objc_msgSend(v36, "dismissViewControllerAnimated:completion:", 1, v34);
  _Block_release(v34);
  return swift_release(v6);
}

uint64_t sub_10002F418(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t isCurrentExecutor;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;

  v3 = type metadata accessor for MainActor(0, a2);
  v4 = static MainActor.shared.getter(v3);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v7 = v6;
  isCurrentExecutor = swift_task_isCurrentExecutor(v5);
  if ((isCurrentExecutor & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 122, v5, v7);
  v9 = static MainActor.shared.getter(isCurrentExecutor);
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v12 = v11;
  if ((swift_task_isCurrentExecutor(v10) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 26, v10, v12);
  v13 = a1 + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_dismissAction;
  v14 = *(void (**)(uint64_t))(a1
                                       + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_dismissAction);
  v15 = *(_QWORD *)(v13 + 8);
  sub_100007DF4((uint64_t)v14, v15);
  v16 = swift_release(v9);
  if (v14)
  {
    v14(v16);
    sub_100007E04((uint64_t)v14, v15);
  }
  return swift_release(v4);
}

uint64_t sub_10002F52C(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v17[5];
  uint64_t v18;

  v3 = v2;
  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor(v7) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 127, v7, v9);
  v10 = (void *)objc_opt_self(UIView);
  v11 = swift_allocObject(&unk_1000426A8, 32, 7);
  *(_QWORD *)(v11 + 16) = v3;
  *(_QWORD *)(v11 + 24) = a1;
  v17[4] = sub_100030E70;
  v18 = v11;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_10002D630;
  v17[3] = &unk_1000426C0;
  v12 = _Block_copy(v17);
  v13 = v18;
  v14 = v3;
  v15 = a1;
  swift_release(v13);
  objc_msgSend(v10, "animateWithDuration:animations:", v12, 0.3);
  _Block_release(v12);
  return swift_release(v6);
}

void sub_10002F66C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = type metadata accessor for MainActor(0, a2);
  v5 = static MainActor.shared.getter(v4);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 128, v6, v8);
  v9 = objc_msgSend(a1, "view");
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "setBackgroundColor:", a2);
    swift_release(v5);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10002F73C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[28] = a1;
  v2[29] = v1;
  v3 = sub_1000051F0(&qword_100049690);
  v2[30] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[31] = v4;
  v2[32] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10002F7CC, 0, 0);
}

uint64_t sub_10002F7CC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _UNKNOWN **v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  Class isa;
  id v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  Class v29;
  NSString v30;
  unsigned int v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  char v39;
  uint64_t v40;
  NSString v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  char v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  NSString v51;
  NSString v52;
  SecAccessControlRef v53;
  SecAccessControlRef v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSString v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  _QWORD *v63;
  NSObject *log;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;

  v1 = (uint64_t *)(v0 + 224);
  v2 = v0 + 184;
  type metadata accessor for LocalizedInstallSheetContent(0);
  v3 = InstallSheetContext.authenticationContextData.getter();
  v5 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
  if (v4 >> 60 == 15)
    goto LABEL_2;
  v8 = v3;
  v9 = v4;
  v10 = objc_allocWithZone((Class)LAContext);
  v68 = v8;
  isa = Data._bridgeToObjectiveC()().super.isa;
  v12 = objc_msgSend(v10, "initWithExternalizedContext:", isa);

  v69 = v12;
  v13 = 0x64696C6156;
  if (!v12)
    v13 = 0x64696C61766E49;
  v67 = v13;
  if (v12)
    v14 = 0xE500000000000000;
  else
    v14 = 0xE700000000000000;
  if (qword_100047FB0 != -1)
    swift_once(&qword_100047FB0, sub_10002865C);
  v15 = *(void **)(v0 + 232);
  v16 = type metadata accessor for Logger(0);
  sub_100007D98(v16, (uint64_t)qword_10004AD30);
  v17 = v15;
  v18 = swift_bridgeObjectRetain(v14);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  v21 = os_log_type_enabled(v19, v20);
  v22 = *(void **)(v0 + 232);
  if (v21)
  {
    v23 = swift_slowAlloc(22, -1);
    v66 = swift_slowAlloc(64, -1);
    v71 = v66;
    *(_DWORD *)v23 = 136446466;
    log = v19;
    v24 = InstallSheetContext.logKey.getter(v66);
    v26 = v25;
    *(_QWORD *)(v0 + 208) = sub_100030804(v24, v25, &v71);
    v2 = v0 + 184;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 208, v0 + 216, v23 + 4, v23 + 12);
    swift_bridgeObjectRelease(v26);

    *(_WORD *)(v23 + 12) = 2080;
    swift_bridgeObjectRetain(v14);
    *(_QWORD *)(v0 + 216) = sub_100030804(v67, v14, &v71);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 216, v0 + 224, v23 + 14, v23 + 22);
    swift_bridgeObjectRelease_n(v14, 3);
    _os_log_impl((void *)&_mh_execute_header, log, v20, "[%{public}s] Received authentication context, is valid: %s", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy(v66, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v66, -1, -1);
    v27 = v23;
    v5 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
    swift_slowDealloc(v27, -1, -1);

    sub_10002D3B8(v68, v9);
    v28 = v69;
    if (!v69)
      goto LABEL_2;
  }
  else
  {
    sub_10002D3B8(v68, v9);

    swift_bridgeObjectRelease_n(v14, 2);
    v28 = v69;
    if (!v69)
    {
LABEL_2:
      v6 = objc_msgSend(objc_allocWithZone((Class)v5[449]), "init");
      v7 = 0;
      goto LABEL_15;
    }
  }
  v6 = v28;
  v7 = v6;
LABEL_15:
  *(_QWORD *)(v0 + 264) = v6;
  *(_QWORD *)(v0 + 272) = v7;
  sub_10000F82C(0, (unint64_t *)&unk_1000486A8, NSNumber_ptr);
  v29 = NSNumber.init(integerLiteral:)(60).super.super.isa;
  objc_msgSend(v6, "setOptionMaxCredentialAge:", v29);

  v30 = String._bridgeToObjectiveC()();
  objc_msgSend(v6, "setOptionPasscodeTitle:", v30);

  *(_QWORD *)(v0 + 184) = 0;
  v31 = objc_msgSend(v6, "canEvaluatePolicy:error:", 2, v2);
  v32 = *(void **)(v0 + 184);
  *(_QWORD *)(v0 + 280) = v32;
  if (v31)
  {
    v70 = *(_QWORD *)(*v1 + 136);
    *(_QWORD *)(v0 + 192) = 0;
    swift_bridgeObjectRetain(v70);
    v33 = v32;
    v34 = objc_msgSend(v6, "evaluationMechanismsForPolicy:error:", 2, v0 + 192);
    v35 = *(void **)(v0 + 192);
    if (v34)
    {
      v36 = v34;
      v37 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v34, &type metadata for AnyHashable, &protocol witness table for AnyHashable);
      v38 = v35;

      *(_DWORD *)(v0 + 312) = 1;
      AnyHashable.init<A>(_:)((_QWORD *)(v0 + 144), v0 + 312, &type metadata for Int32, &protocol witness table for Int32);
      v39 = sub_100030164(v0 + 144, v37);
      swift_bridgeObjectRelease(v37);
      sub_10000F4A4(v0 + 144);
      if ((v39 & 1) != 0)
      {
        v40 = *v1;
        swift_bridgeObjectRelease(v70);
        v41 = String._bridgeToObjectiveC()();
        objc_msgSend(v6, "setOptionAuthenticationTitle:", v41);

        v70 = *(_QWORD *)(v40 + 168);
        swift_bridgeObjectRetain(v70);
      }
    }
    else
    {
      v48 = v35;
      v49 = _convertNSErrorToError(_:)(v35);

      swift_willThrow(v50);
      swift_errorRelease(v49);
    }
    v51 = String._bridgeToObjectiveC()();
    objc_msgSend(v6, "setOptionPasscodeTitle:", v51);

    v52 = String._bridgeToObjectiveC()();
    objc_msgSend(v6, "setOptionPasswordAuthenticationReason:", v52);

    v53 = SecAccessControlCreateWithFlags(kCFAllocatorDefault, kSecAttrAccessibleWhenUnlockedThisDeviceOnly, 0x40000001uLL, 0);
    *(_QWORD *)(v0 + 288) = v53;
    if (v53)
    {
      v54 = v53;
      v55 = v0 + 16;
      v57 = *(_QWORD *)(v0 + 248);
      v56 = *(_QWORD *)(v0 + 256);
      v58 = *(_QWORD *)(v0 + 240);
      v59 = String._bridgeToObjectiveC()();
      *(_QWORD *)(v0 + 296) = v59;
      swift_bridgeObjectRelease(v70);
      *(_QWORD *)(v0 + 56) = v0 + 316;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_10002FF6C;
      v60 = swift_continuation_init(v0 + 16, 1);
      *(_QWORD *)(v0 + 136) = v58;
      v61 = sub_100022918((_QWORD *)(v0 + 112));
      v62 = sub_1000051F0(&qword_1000491A0);
      CheckedContinuation.init(continuation:function:)(v60, 0xD000000000000026, 0x8000000100035F70, &type metadata for Bool, v62, &protocol self-conformance witness table for Error);
      (*(void (**)(_QWORD *, uint64_t, uint64_t))(v57 + 32))(v61, v56, v58);
      *(_QWORD *)(v0 + 80) = _NSConcreteStackBlock;
      v63 = (_QWORD *)(v0 + 80);
      v63[1] = 1107296256;
      v63[2] = sub_100030238;
      v63[3] = &unk_100042670;
      objc_msgSend(v6, "evaluateAccessControl:operation:localizedReason:reply:", v54, 3, v59, v63);
      return swift_continuation_await(v55);
    }
    swift_bridgeObjectRelease(v70);

    goto LABEL_27;
  }
  if (!v32)
  {

    goto LABEL_27;
  }
  type metadata accessor for Code(0);
  v43 = v42;
  *(_QWORD *)(v0 + 200) = -5;
  v44 = sub_100005954(&qword_100048090, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_100033490);
  v45 = v32;
  v46 = static _ErrorCodeProtocol.~= infix(_:_:)(v0 + 200, v45, v43, v44);

  if ((v46 & 1) == 0)
  {
LABEL_27:
    v47 = 0;
    goto LABEL_28;
  }
  v47 = 1;
LABEL_28:
  swift_task_dealloc(*(_QWORD *)(v0 + 256));
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v47);
}

uint64_t sub_10002FF6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 304) = v1;
  if (v1)
    v2 = sub_1000300B0;
  else
    v2 = sub_100030010;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_100030010()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  int v7;

  v2 = *(void **)(v0 + 288);
  v1 = *(void **)(v0 + 296);
  v3 = *(void **)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 256);
  v5 = *(void **)(v0 + 264);

  v6 = *(_BYTE *)(v0 + 316);
  swift_task_dealloc(v4);
  if ((v6 & 1) != 0)
    v7 = 256;
  else
    v7 = 0;
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v7 | v6 & 1u);
}

uint64_t sub_1000300B0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(v0 + 296);
  v1 = *(_QWORD *)(v0 + 304);
  v4 = *(void **)(v0 + 280);
  v3 = *(void **)(v0 + 288);
  v6 = *(void **)(v0 + 264);
  v5 = *(void **)(v0 + 272);
  v7 = *(_QWORD *)(v0 + 256);
  swift_willThrow();

  swift_errorRelease(v1);
  swift_task_dealloc(v7);
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_100030164(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  _BYTE v10[40];

  if (*(_QWORD *)(a2 + 16)
    && (v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(a2 + 40)),
        v5 = -1 << *(_BYTE *)(a2 + 32),
        v6 = v4 & ~v5,
        ((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0))
  {
    v7 = ~v5;
    do
    {
      sub_10002CBF8(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v10);
      v8 = static AnyHashable.== infix(_:_:)(v10, a1);
      sub_10000F4A4((uint64_t)v10);
      if ((v8 & 1) != 0)
        break;
      v6 = (v6 + 1) & v7;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

void sub_100030238(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;

  sub_10001C118((_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  if (a3)
  {
    v8 = a3;
    v5 = a3;
    v6 = sub_1000051F0(&qword_100049690);
    CheckedContinuation.resume(throwing:)(&v8, v6);

  }
  else
  {
    v9 = a2;
    v7 = sub_1000051F0(&qword_100049690);
    CheckedContinuation.resume(returning:)(&v9, v7);
  }
}

id sub_100030360()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InstallConfirmationViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100030408()
{
  return type metadata accessor for InstallConfirmationViewController(0);
}

uint64_t type metadata accessor for InstallConfirmationViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100049650;
  if (!qword_100049650)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for InstallConfirmationViewController);
  return result;
}

void sub_10003044C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[7];

  v6[0] = &unk_100034358;
  v6[1] = &unk_100034370;
  v6[2] = &unk_100034370;
  v6[3] = &unk_100034388;
  v2 = type metadata accessor for LocalizedInstallSheetContent(319);
  if (v3 <= 0x3F)
  {
    v6[4] = *(_QWORD *)(v2 - 8) + 64;
    sub_1000304F4(319);
    if (v5 <= 0x3F)
    {
      v6[5] = *(_QWORD *)(v4 - 8) + 64;
      v6[6] = &unk_100034388;
      swift_updateClassMetadata2(a1, 256, 7, v6, a1 + 80);
    }
  }
}

void sub_1000304F4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100049688)
  {
    v2 = type metadata accessor for InstallConfirmationAppStoreMetrics(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100049688);
  }
}

uint64_t sub_100030548(uint64_t a1, uint64_t a2)
{
  return sub_10000F65C(a2 + 32, a1 + 32);
}

uint64_t sub_100030558(uint64_t a1)
{
  return sub_10001C164((_QWORD *)(a1 + 32));
}

uint64_t sub_100030560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = type metadata accessor for ContinuousClock.Instant(0);
  *(_QWORD *)(v6 + 64) = v12;
  v13 = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 72) = v13;
  v14 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v6 + 80) = swift_task_alloc(v14);
  *(_QWORD *)(v6 + 88) = swift_task_alloc(v14);
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch(sub_100030604, 0, 0);
}

uint64_t sub_100030604()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  _QWORD *v8;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  v4 = type metadata accessor for ContinuousClock(0);
  v5 = sub_100005954(&qword_1000496A8, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock, (uint64_t)&protocol conformance descriptor for ContinuousClock);
  dispatch thunk of Clock.now.getter(v4, v5);
  v6 = sub_100005954((unint64_t *)&unk_1000496B0, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant, (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
  dispatch thunk of InstantProtocol.advanced(by:)(v0 + 5, v2, v6);
  v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v7;
  v7(v1, v2);
  v8 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
  v0[13] = v8;
  *v8 = v0;
  v8[1] = sub_10003071C;
  return dispatch thunk of Clock.sleep(until:tolerance:)(v0[11], v0 + 2, v4, v5);
}

uint64_t sub_10003071C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v3 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v2 = *(_QWORD *)(*v1 + 104);
  v4 = *(_QWORD *)(*v1 + 88);
  v5 = *(_QWORD *)(*v1 + 64);
  v6 = *v1;
  *(_QWORD *)(v6 + 112) = v0;
  swift_task_dealloc(v2);
  v3(v4, v5);
  if (v0)
    return swift_task_switch(sub_1000307C8, 0, 0);
  v8 = *(_QWORD *)(v6 + 80);
  swift_task_dealloc(*(_QWORD *)(v6 + 88));
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_1000307C8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 88));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100030804(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000308D4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000F65C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_10000F65C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10001C164(v12);
  return v7;
}

uint64_t sub_1000308D4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_100030A8C(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_100030A8C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100030B20(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100030CF8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100030CF8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100030B20(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100030C94(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100030C94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_1000051F0(&qword_100049698);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100030CF8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_1000051F0(&qword_100049698);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100030E44()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100030E70()
{
  uint64_t v0;

  sub_10002F66C(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_100030E78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100030E88(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100030E90()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100030EB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10002F418(*(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_100030EBC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000051F0(&qword_1000486D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100030EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for InstallConfirmationAppStoreMetrics(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100030F40()
{
  _BYTE *v0;
  _QWORD *v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v1 = &v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_dismissAction];
  *v1 = 0;
  v1[1] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_childViewController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_responseAction] = 0;
  v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_response] = 0;
  v2 = OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_isIPad;
  v3 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v0[v2] = v4 == (id)1;
  v6 = type metadata accessor for MainActor(0, v5);
  v7 = static MainActor.shared.getter(v6);
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  v10 = v9;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 45, v8, v10);
  swift_release(v7);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000350F0, "AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 2, 45, 0);
  __break(1u);
  return result;
}

uint64_t sub_100031084(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

ValueMetadata *type metadata accessor for XPCDecoder()
{
  return &type metadata for XPCDecoder;
}

_QWORD *initializeBufferWithCopyOfBuffer for XPCEncoder(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  return a1;
}

uint64_t destroy for XPCEncoder(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for XPCEncoder(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  swift_release(v4);
  return a1;
}

uint64_t assignWithTake for XPCEncoder(uint64_t a1, _OWORD *a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  swift_release(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCEncoder(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for XPCEncoder(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for XPCEncoder()
{
  return &type metadata for XPCEncoder;
}

uint64_t sub_100031214()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t sub_100031234(_QWORD *a1)
{
  return sub_100031248(a1);
}

uint64_t sub_100031248(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD *);
  _QWORD v16[2];
  __int128 v17;
  __int128 v18;
  _OWORD v19[2];

  v2 = sub_1000051F0(&qword_100048BC0);
  __chkstk_darwin(v2);
  v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = a1[3];
  v6 = a1[4];
  sub_10001C118(a1, v5);
  v7 = dispatch thunk of Decoder.userInfo.getter(v5, v6);
  CodingUserInfoKey.init(rawValue:)(0x7265646F636564, 0xE700000000000000);
  v8 = type metadata accessor for CodingUserInfoKey(0);
  v9 = *(_QWORD *)(v8 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v4, 1, v8);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    if (*(_QWORD *)(v7 + 16) && (v11 = sub_10002AEB4((uint64_t)v4), (v12 & 1) != 0))
    {
      sub_10000F65C(*(_QWORD *)(v7 + 56) + 32 * v11, (uint64_t)&v17);
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
    }
    result = swift_bridgeObjectRelease(v7);
    if (*((_QWORD *)&v18 + 1))
    {
      sub_10001C288(&v17, v19);
      v13 = sub_1000051F0(&qword_100048BC8);
      swift_dynamicCast(v16, v19, (char *)&type metadata for Any + 8, v13, 7);
      v15 = (void (*)(_QWORD *))v16[0];
      v14 = v16[1];
      (*(void (**)(char *, uint64_t))(v9 + 8))(v4, v8);
      v15(a1);
      swift_release(v14);
      return sub_10001C164(a1);
    }
  }
  __break(1u);
  return result;
}

id sub_1000313E8(void *a1)
{
  return sub_100031428(a1, 0.14, 0.15, 0.98, 0.98);
}

id sub_10003140C(void *a1)
{
  return sub_100031428(a1, 0.25, 0.25, 0.87, 0.88);
}

id sub_100031428(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;

  v9 = objc_msgSend(a1, "userInterfaceStyle");
  v10 = objc_allocWithZone((Class)UIColor);
  if (v9 == (id)2)
  {
    v11 = a2;
    v12 = a2;
    v13 = a3;
  }
  else
  {
    v11 = a4;
    v12 = a4;
    v13 = a5;
  }
  return objc_msgSend(v10, "initWithRed:green:blue:alpha:", v11, v12, v13, 1.0);
}

uint64_t sub_1000314AC()
{
  char *v0;
  int v1;
  int v2;
  os_log_t v3;

  v0 = dlerror();
  v1 = abort_report_np("%s", v0);
  return sub_1000314CC(v1, v2, v3);
}

void sub_1000314CC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[%{public}@] Mini product page failed with error: %{public}@", (uint8_t *)&v4, 0x16u);
  sub_100004734();
}

void sub_100031550(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004724((void *)&_mh_execute_header, a2, a3, "[%{public}@] Mini product page content size did invalidate", a5, a6, a7, a8, 2u);
  sub_100004734();
}

void sub_1000315B8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004724((void *)&_mh_execute_header, a2, a3, "[%{public}@] Mini product page did present description", a5, a6, a7, a8, 2u);
  sub_100004734();
}

void sub_100031620()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "ASCMiniProductPageView");
  sub_100031644(v0);
}

void sub_100031644()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "ASCAdamID");
  sub_100031668(v0);
}

void sub_100031668()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "ASCLockupRequest");
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(v0);
}

id objc_msgSend__requestWithID_kind_context_appVersionId_distributorId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestWithID:kind:context:appVersionId:distributorId:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithID_kind_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithID:kind:context:");
}

id objc_msgSend_initWithStringValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStringValue:");
}

id objc_msgSend_miniProductPagePresentingViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "miniProductPagePresentingViewController");
}

id objc_msgSend_miniProductPageRequestDidFinish(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "miniProductPageRequestDidFinish");
}

id objc_msgSend_moreButtonPressed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moreButtonPressed");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequest:");
}

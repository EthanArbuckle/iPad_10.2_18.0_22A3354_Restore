_QWORD *pickKeyAlgorithm(__SecKey *a1, uint64_t a2, _QWORD *a3)
{
  const __CFDictionary *v5;
  const void *Value;
  _QWORD **v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v5 = SecKeyCopyAttributes(a1);
  Value = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x24BDE9050]);
  if (CFEqual(Value, (CFTypeRef)*MEMORY[0x24BDE9058]))
  {
    switch((_DWORD)a2)
    {
      case 5:
        v7 = (_QWORD **)MEMORY[0x24BDE92A8];
        break;
      case 4:
        v7 = (_QWORD **)MEMORY[0x24BDE92A0];
        break;
      case 2:
        v7 = (_QWORD **)MEMORY[0x24BDE9298];
        break;
      default:
LABEL_11:
        if (a3)
        {
          v11[0] = CFSTR("KeyType");
          v11[1] = CFSTR("DigestAlgorithm");
          v12[0] = Value;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v12[1] = v8;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Security"), -4, v9);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

          a3 = 0;
        }
        if (v5)
          goto LABEL_20;
        return a3;
    }
  }
  else
  {
    if (!CFEqual(Value, (CFTypeRef)*MEMORY[0x24BDE9080]))
      goto LABEL_11;
    switch((_DWORD)a2)
    {
      case 5:
        v7 = (_QWORD **)MEMORY[0x24BDE9348];
        break;
      case 4:
        v7 = (_QWORD **)MEMORY[0x24BDE9340];
        break;
      case 2:
        v7 = (_QWORD **)MEMORY[0x24BDE9338];
        break;
      default:
        goto LABEL_11;
    }
  }
  a3 = *v7;
  if (v5)
LABEL_20:
    CFRelease(v5);
  return a3;
}

void sub_23A85B4B0(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    CFRelease(v1);
  _Unwind_Resume(exception_object);
}

uint64_t mapDigestAlgorithm(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE66658]) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE66660]) & 1) != 0)
  {
    v2 = 4;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE66668]))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_23A85B7C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFTypeRef cf, CFTypeRef a12)
{
  const void *v12;

  if (cf)
    CFRelease(cf);
  if (v12)
    CFRelease(v12);
  if (a12)
    CFRelease(a12);
  _Unwind_Resume(exception_object);
}

void sub_23A85BCBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

void sub_23A85C0A0(_Unwind_Exception *a1)
{
  const void *v1;
  const void *v2;

  CFRelease(v2);
  if (v1)
    CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t PackageStaticValidator.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url;
  v4 = sub_23A86A3DC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_23A85C14C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_supportedMeasurementAlgorithms);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A85C1A0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_supportedMeasurementAlgorithms);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A85C208()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A85C250(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_supportedMeasurementAlgorithms);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_23A85C2A0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t PackageStaticValidator.__allocating_init(url:requireTrust:)(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  HIDWORD(v25) = a2;
  v3 = sub_23A86A394();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_23A86A3DC();
  v26 = *(void (***)(_QWORD, _QWORD, _QWORD))(v30 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_supportedMeasurementAlgorithms) = &unk_250BAD530;
  swift_retain();
  if ((sub_23A865B10() & 1) != 0)
  {
    v10 = v26;
    v11 = v30;
    v26[2](v9 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url, a1, v30);
    v27 = 0x727574616E676973;
    v28 = 0xE900000000000065;
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCD7A0], v3);
    sub_23A85C864();
    sub_23A86A3C4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRelease();
    v12 = v24;
    v13 = sub_23A86A3E8();
    if (v12)
    {
      MEMORY[0x23B858E40](v12);
      v13 = 0;
      v14 = 0xF000000000000000;
    }
    v9 = PackageValidator.init(signatureData:requireTrust:)(v13, v14, BYTE4(v25) & 1, v15, v16, v17, v18, v19, v23, v24, SHIDWORD(v24), v25, v26, v27, v28, v29);
    v21 = (void (*)(uint64_t, uint64_t))v10[1];
    v21(a1, v11);
    v21((uint64_t)v8, v11);
  }
  else
  {
    swift_release();
    sub_23A85C820();
    swift_allocError();
    *(_QWORD *)(v20 + 8) = 0;
    *(_QWORD *)(v20 + 16) = 0;
    *(_QWORD *)v20 = 0;
    *(_BYTE *)(v20 + 24) = 5;
    swift_willThrow();
    ((void (*)(uint64_t, uint64_t))v26[1])(a1, v30);
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
  }
  return v9;
}

uint64_t PackageStaticValidator.init(url:requireTrust:)(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
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
  unint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = v2;
  v26 = a2;
  v5 = sub_23A86A394();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_23A86A3DC();
  v9 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_supportedMeasurementAlgorithms) = &unk_250BAD530;
  swift_retain();
  if ((sub_23A865B10() & 1) != 0)
  {
    v12 = v30;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v3 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url, a1, v30);
    v27 = 0x727574616E676973;
    v28 = (id)0xE900000000000065;
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDCD7A0], v5);
    sub_23A85C864();
    sub_23A86A3C4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRelease();
    v13 = v24;
    v14 = sub_23A86A3E8();
    if (v13)
    {
      MEMORY[0x23B858E40](v13);
      v14 = 0;
      v15 = 0xF000000000000000;
    }
    v3 = PackageValidator.init(signatureData:requireTrust:)(v14, v15, v26 & 1, v16, v17, v18, v19, v20, v24, v25, v26, v27, v28, v29, v30, v31);
    v22 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v22(a1, v12);
    v22((uint64_t)v11, v12);
  }
  else
  {
    swift_release();
    sub_23A85C820();
    swift_allocError();
    *(_QWORD *)(v21 + 8) = 0;
    *(_QWORD *)(v21 + 16) = 0;
    *(_QWORD *)v21 = 0;
    *(_BYTE *)(v21 + 24) = 5;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v30);
    swift_bridgeObjectRelease();
    type metadata accessor for PackageStaticValidator();
    swift_deallocPartialClassInstance();
  }
  return v3;
}

unint64_t sub_23A85C820()
{
  unint64_t result;

  result = qword_2569C3DC0;
  if (!qword_2569C3DC0)
  {
    result = MEMORY[0x23B858E94](&protocol conformance descriptor for PackageValidatorError, &type metadata for PackageValidatorError);
    atomic_store(result, (unint64_t *)&qword_2569C3DC0);
  }
  return result;
}

unint64_t sub_23A85C864()
{
  unint64_t result;

  result = qword_2569C3DC8;
  if (!qword_2569C3DC8)
  {
    result = MEMORY[0x23B858E94](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2569C3DC8);
  }
  return result;
}

uint64_t type metadata accessor for PackageStaticValidator()
{
  uint64_t result;

  result = qword_2569C3E00;
  if (!qword_2569C3E00)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t PackageStaticValidator.__allocating_init(url:)(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  void (*v27)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;

  v2 = sub_23A86A394();
  v30 = *(_QWORD *)(v2 - 8);
  v31 = v2;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23A86A3DC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v29 = (uint64_t)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v29 - v9;
  v11 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v36 = a1;
  v11((char *)&v29 - v9, a1, v5);
  type metadata accessor for PackageStaticValidator();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_supportedMeasurementAlgorithms) = &unk_250BAD558;
  swift_retain();
  if ((sub_23A865B10() & 1) != 0)
  {
    v13 = v5;
    v11((char *)(v12 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url), v10, v5);
    v33 = 0x727574616E676973;
    v34 = 0xE900000000000065;
    v15 = v30;
    v14 = v31;
    (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v4, *MEMORY[0x24BDCD7A0], v31);
    sub_23A85C864();
    v16 = v29;
    sub_23A86A3C4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v4, v14);
    swift_bridgeObjectRelease();
    v17 = v32;
    v18 = sub_23A86A3E8();
    if (v17)
    {
      MEMORY[0x23B858E40](v17);
      v18 = 0;
      v19 = 0xF000000000000000;
    }
    v12 = PackageValidator.init(signatureData:requireTrust:)(v18, v19, 1, v20, v21, v22, v23, v24, v29, v30, SHIDWORD(v30), v31, v32, v33, v34, v35);
    v27 = *(void (**)(char *, uint64_t))(v6 + 8);
    v27(v10, v13);
    v27((char *)v16, v13);
    v27(v36, v13);
  }
  else
  {
    swift_release();
    sub_23A85C820();
    swift_allocError();
    *(_QWORD *)(v25 + 8) = 0;
    *(_QWORD *)(v25 + 16) = 0;
    *(_QWORD *)v25 = 0;
    *(_BYTE *)(v25 + 24) = 5;
    swift_willThrow();
    v26 = *(void (**)(char *, uint64_t))(v6 + 8);
    v26(v10, v5);
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
    v26(v36, v5);
  }
  return v12;
}

uint64_t sub_23A85CBD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v5 = sub_23A86A394();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23A86A3DC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = v2;
  v25 = a1;
  v26 = a2;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDCD7A0], v5);
  sub_23A85C864();
  sub_23A86A3C4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v13 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_23A86A3B8();
  v14 = (void *)sub_23A86A49C();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_fileExistsAtPath_, v14);

  if ((v15 & 1) != 0)
  {
    v16 = v27;
    v17 = sub_23A86A3E8();
    if (!v16)
    {
      v19 = v17;
      v20 = v18;
      sub_23A868D00(a1, a2, v17, v18);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      return sub_23A85D734(v19, v20);
    }
  }
  else
  {
    sub_23A85C820();
    swift_allocError();
    *(_QWORD *)v22 = a1;
    *(_QWORD *)(v22 + 8) = a2;
    *(_QWORD *)(v22 + 16) = 0;
    *(_BYTE *)(v22 + 24) = 2;
    swift_bridgeObjectRetain();
    swift_willThrow();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_23A85CE04(char a1)
{
  uint64_t v1;
  uint64_t v2;
  int v4;
  uint64_t result;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  int64_t v42;
  int64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  int64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68[6];
  uint64_t *v69;

  v69 = (uint64_t *)(v1 + 16);
  swift_beginAccess();
  swift_retain();
  v4 = sub_23A865FFC();
  result = swift_release();
  if (v2)
    return result;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C3DD0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A86ACA0;
  *(_DWORD *)(inited + 32) = v4;
  v7 = sub_23A85E0B0(inited);
  swift_setDeallocating();
  type metadata accessor for FileMeasurer();
  swift_initStackObject();
  v8 = FileMeasurer.init(_:)(v7);
  v9 = sub_23A867C0C(v1 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url, v8);
  v59 = a1;
  v10 = *v69;
  swift_beginAccess();
  v11 = *(_QWORD *)(v10 + 24);
  v62 = v11 + 64;
  v12 = 1 << *(_BYTE *)(v11 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v11 + 64);
  v65 = v11;
  swift_bridgeObjectRetain();
  v64 = v9 + 24;
  result = swift_beginAccess();
  v15 = 0;
  v63 = (unint64_t)(v12 + 63) >> 6;
  v60 = MEMORY[0x24BEE4AF8];
  v61 = MEMORY[0x24BEE4AF8];
  while (v14)
  {
    v16 = __clz(__rbit64(v14));
    v14 &= v14 - 1;
    v17 = v16 | (v15 << 6);
LABEL_18:
    v21 = (uint64_t *)(*(_QWORD *)(v65 + 48) + 16 * v17);
    v22 = *v21;
    v23 = v21[1];
    v24 = *(_QWORD *)(*(_QWORD *)(v65 + 56) + 8 * v17);
    v25 = *(_QWORD *)v64;
    v26 = *(_QWORD *)(*(_QWORD *)v64 + 16);
    swift_bridgeObjectRetain();
    if (v26)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v27 = sub_23A85DC40(v22, v23);
      if ((v28 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
      v29 = *(_QWORD *)(*(_QWORD *)(v25 + 56) + 8 * v27);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v68[3] = v29;
      v68[0] = v24;
      v30 = swift_initStackObject();
      *(_OWORD *)(v30 + 16) = xmmword_23A86ACA0;
      *(_DWORD *)(v30 + 32) = v4;
      v31 = FileMeasurement.isSameFile(_:withSupportedAlgorithms:)(v68, v30);
      swift_setDeallocating();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v31 & 1) == 0)
      {
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_23A85DCA4(0, *(_QWORD *)(v60 + 16) + 1, 1, (char *)v60);
          v60 = result;
        }
        v33 = *(_QWORD *)(v60 + 16);
        v36 = *(_QWORD *)(v60 + 24);
        v34 = v33 + 1;
        if (v33 >= v36 >> 1)
        {
          result = (uint64_t)sub_23A85DCA4((char *)(v36 > 1), v33 + 1, 1, (char *)v60);
          v60 = result;
        }
        v35 = v60;
        goto LABEL_37;
      }
      result = swift_bridgeObjectRelease();
    }
    else
    {
LABEL_27:
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_23A85DCA4(0, *(_QWORD *)(v61 + 16) + 1, 1, (char *)v61);
        v61 = result;
      }
      v33 = *(_QWORD *)(v61 + 16);
      v32 = *(_QWORD *)(v61 + 24);
      v34 = v33 + 1;
      if (v33 >= v32 >> 1)
      {
        result = (uint64_t)sub_23A85DCA4((char *)(v32 > 1), v33 + 1, 1, (char *)v61);
        v61 = result;
      }
      v35 = v61;
LABEL_37:
      *(_QWORD *)(v35 + 16) = v34;
      v37 = v35 + 16 * v33;
      *(_QWORD *)(v37 + 32) = v22;
      *(_QWORD *)(v37 + 40) = v23;
    }
  }
  v18 = __OFADD__(v15++, 1);
  if (v18)
  {
    __break(1u);
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  if (v15 >= v63)
    goto LABEL_38;
  v19 = *(_QWORD *)(v62 + 8 * v15);
  if (v19)
  {
LABEL_17:
    v14 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v15 << 6);
    goto LABEL_18;
  }
  v20 = v15 + 1;
  if (v15 + 1 >= v63)
    goto LABEL_38;
  v19 = *(_QWORD *)(v62 + 8 * v20);
  if (v19)
    goto LABEL_16;
  v20 = v15 + 2;
  if (v15 + 2 >= v63)
    goto LABEL_38;
  v19 = *(_QWORD *)(v62 + 8 * v20);
  if (v19)
  {
LABEL_16:
    v15 = v20;
    goto LABEL_17;
  }
  v20 = v15 + 3;
  if (v15 + 3 < v63)
  {
    v19 = *(_QWORD *)(v62 + 8 * v20);
    if (!v19)
    {
      while (1)
      {
        v15 = v20 + 1;
        if (__OFADD__(v20, 1))
          break;
        if (v15 >= v63)
          goto LABEL_38;
        v19 = *(_QWORD *)(v62 + 8 * v15);
        ++v20;
        if (v19)
          goto LABEL_17;
      }
LABEL_76:
      __break(1u);
      goto LABEL_77;
    }
    goto LABEL_16;
  }
LABEL_38:
  swift_release();
  swift_beginAccess();
  v38 = *(_QWORD *)v64;
  v67 = *(_QWORD *)v64 + 64;
  v39 = 1 << *(_BYTE *)(*(_QWORD *)v64 + 32);
  v40 = -1;
  if (v39 < 64)
    v40 = ~(-1 << v39);
  v41 = v40 & *(_QWORD *)(*(_QWORD *)v64 + 64);
  v42 = (unint64_t)(v39 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v43 = 0;
  v66 = MEMORY[0x24BEE4AF8];
  if (!v41)
    goto LABEL_43;
  while (2)
  {
    v44 = __clz(__rbit64(v41));
    v41 &= v41 - 1;
    v45 = v44 | (v43 << 6);
LABEL_54:
    v48 = (uint64_t *)(*(_QWORD *)(v38 + 48) + 16 * v45);
    v50 = *v48;
    v49 = v48[1];
    v51 = *v69;
    swift_beginAccess();
    v52 = *(_QWORD *)(*(_QWORD *)(v51 + 24) + 16);
    swift_bridgeObjectRetain();
    if (v52)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23A85DC40(v50, v49);
      v54 = v53;
      swift_bridgeObjectRelease();
      if ((v54 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_57;
      }
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if (v41)
        continue;
    }
    else
    {
LABEL_57:
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_23A85DCA4(0, *(_QWORD *)(v66 + 16) + 1, 1, (char *)v66);
        v66 = result;
      }
      v56 = *(_QWORD *)(v66 + 16);
      v55 = *(_QWORD *)(v66 + 24);
      if (v56 >= v55 >> 1)
      {
        result = (uint64_t)sub_23A85DCA4((char *)(v55 > 1), v56 + 1, 1, (char *)v66);
        v66 = result;
      }
      *(_QWORD *)(v66 + 16) = v56 + 1;
      v57 = v66 + 16 * v56;
      *(_QWORD *)(v57 + 32) = v50;
      *(_QWORD *)(v57 + 40) = v49;
      if (v41)
        continue;
    }
    break;
  }
LABEL_43:
  v18 = __OFADD__(v43++, 1);
  if (v18)
    goto LABEL_75;
  if (v43 >= v42)
  {
LABEL_67:
    swift_release();
    if (*(_QWORD *)(v66 + 16) || !((*(_QWORD *)(v61 + 16) == 0) | v59 & 1) || *(_QWORD *)(v60 + 16))
    {
      sub_23A85C820();
      swift_allocError();
      *(_QWORD *)v58 = v66;
      *(_QWORD *)(v58 + 8) = v61;
      *(_QWORD *)(v58 + 16) = v60;
      *(_BYTE *)(v58 + 24) = 4;
      swift_bridgeObjectRetain();
      swift_willThrow();
      swift_release();
    }
    else
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    return swift_release();
  }
  v46 = *(_QWORD *)(v67 + 8 * v43);
  if (v46)
  {
LABEL_53:
    v41 = (v46 - 1) & v46;
    v45 = __clz(__rbit64(v46)) + (v43 << 6);
    goto LABEL_54;
  }
  v47 = v43 + 1;
  if (v43 + 1 >= v42)
    goto LABEL_67;
  v46 = *(_QWORD *)(v67 + 8 * v47);
  if (v46)
    goto LABEL_52;
  v47 = v43 + 2;
  if (v43 + 2 >= v42)
    goto LABEL_67;
  v46 = *(_QWORD *)(v67 + 8 * v47);
  if (v46)
    goto LABEL_52;
  v47 = v43 + 3;
  if (v43 + 3 >= v42)
    goto LABEL_67;
  v46 = *(_QWORD *)(v67 + 8 * v47);
  if (v46)
  {
LABEL_52:
    v43 = v47;
    goto LABEL_53;
  }
  while (1)
  {
    v43 = v47 + 1;
    if (__OFADD__(v47, 1))
      break;
    if (v43 >= v42)
      goto LABEL_67;
    v46 = *(_QWORD *)(v67 + 8 * v43);
    ++v47;
    if (v46)
      goto LABEL_53;
  }
LABEL_77:
  __break(1u);
  return result;
}

void PackageStaticValidator.__allocating_init(signatureData:requireTrust:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void PackageStaticValidator.init(signatureData:requireTrust:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_23A85D604()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url;
  v2 = sub_23A86A3DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t PackageStaticValidator.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_bridgeObjectRelease();
  sub_23A85E1F0(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  v1 = v0 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url;
  v2 = sub_23A86A3DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PackageStaticValidator.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_bridgeObjectRelease();
  sub_23A85E1F0(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  v1 = v0 + OBJC_IVAR____TtC11EDPSecurity22PackageStaticValidator_url;
  v2 = sub_23A86A3DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23A85D734(uint64_t a1, unint64_t a2)
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B858E7C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A85D7B8()
{
  sub_23A86A6A0();
  sub_23A86A6B8();
  return sub_23A86A6C4();
}

uint64_t sub_23A85D7FC()
{
  return sub_23A86A6B8();
}

uint64_t sub_23A85D824()
{
  sub_23A86A6A0();
  sub_23A86A6B8();
  return sub_23A86A6C4();
}

_DWORD *sub_23A85D864@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_23A85D874(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_23A85D880(uint64_t a1, uint64_t a2)
{
  return sub_23A85D9C8(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_23A85D88C(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_23A86A4A8();
  *a2 = 0;
  return result;
}

uint64_t sub_23A85D900(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_23A86A4B4();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23A85D97C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23A86A4C0();
  v2 = sub_23A86A49C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23A85D9BC(uint64_t a1, uint64_t a2)
{
  return sub_23A85D9C8(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_23A85D9C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23A86A4C0();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23A85DA04()
{
  sub_23A86A4C0();
  sub_23A86A4D8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A85DA44()
{
  uint64_t v0;

  sub_23A86A4C0();
  sub_23A86A6A0();
  sub_23A86A4D8();
  v0 = sub_23A86A6C4();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_23A85DAB4(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23A85DAC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_23A86A4C0();
  v2 = v1;
  if (v0 == sub_23A86A4C0() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23A86A64C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23A85DB50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23A86A49C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23A85DB94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23A86A4C0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23A85DBBC()
{
  sub_23A85E3E0(&qword_2569C3FA0, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_23A86AED8);
  sub_23A85E3E0(&qword_2569C3FA8, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_23A86AE78);
  return sub_23A86A5EC();
}

unint64_t sub_23A85DC40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23A86A6A0();
  sub_23A86A4D8();
  v4 = sub_23A86A6C4();
  return sub_23A85DDA4(a1, a2, v4);
}

char *sub_23A85DCA4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C3F68);
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
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_23A85DDA4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23A86A64C() & 1) == 0)
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
      while (!v14 && (sub_23A86A64C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23A85DE84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C3F70);
    v3 = sub_23A86A55C();
    v4 = 0;
    v5 = v3 + 56;
    v31 = v1;
    v32 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v32 + 8 * v4);
      sub_23A86A4C0();
      sub_23A86A6A0();
      v7 = v6;
      sub_23A86A4D8();
      v8 = sub_23A86A6C4();
      result = swift_bridgeObjectRelease();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = v8 & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = sub_23A86A4C0();
        v17 = v16;
        if (v15 == sub_23A86A4C0() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        v20 = sub_23A86A64C();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          goto LABEL_4;
        v21 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v21;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v22 = sub_23A86A4C0();
          v24 = v23;
          if (v22 == sub_23A86A4C0() && v24 == v25)
            goto LABEL_3;
          v27 = sub_23A86A64C();
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          if ((v27 & 1) != 0)
            goto LABEL_4;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v7;
      v28 = *(_QWORD *)(v3 + 16);
      v29 = __OFADD__(v28, 1);
      v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_23A85E0B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C3F78);
    v3 = sub_23A86A55C();
    v4 = 0;
    v5 = v3 + 56;
    v6 = a1 + 32;
    while (1)
    {
      v7 = *(_DWORD *)(v6 + 4 * v4);
      sub_23A86A6A0();
      sub_23A86A6B8();
      result = sub_23A86A6C4();
      v9 = -1 << *(_BYTE *)(v3 + 32);
      v10 = result & ~v9;
      v11 = v10 >> 6;
      v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
      v13 = 1 << v10;
      v14 = *(_QWORD *)(v3 + 48);
      if (((1 << v10) & v12) != 0)
      {
        if (*(_DWORD *)(v14 + 4 * v10) == v7)
          goto LABEL_3;
        v15 = ~v9;
        while (1)
        {
          v10 = (v10 + 1) & v15;
          v11 = v10 >> 6;
          v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
          v13 = 1 << v10;
          if ((v12 & (1 << v10)) == 0)
            break;
          if (*(_DWORD *)(v14 + 4 * v10) == v7)
            goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
      *(_DWORD *)(v14 + 4 * v10) = v7;
      v16 = *(_QWORD *)(v3 + 16);
      v17 = __OFADD__(v16, 1);
      v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v18;
LABEL_3:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_23A85E1F0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23A85D734(a1, a2);
  return a1;
}

uint64_t sub_23A85E204()
{
  return type metadata accessor for PackageStaticValidator();
}

uint64_t sub_23A85E20C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A86A3DC();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for PackageStaticValidator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PackageStaticValidator.supportedMeasurementAlgorithms.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of PackageStaticValidator.supportedMeasurementAlgorithms.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of PackageStaticValidator.supportedMeasurementAlgorithms.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of PackageStaticValidator.__allocating_init(url:requireTrust:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of PackageStaticValidator.validateResource(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of PackageStaticValidator.validateAllResources(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

void type metadata accessor for SecCertificate(uint64_t a1)
{
  sub_23A85E370(a1, &qword_2569C3F50);
}

void type metadata accessor for SecCSDigestAlgorithm(uint64_t a1)
{
  sub_23A85E370(a1, &qword_2569C3F58);
}

uint64_t sub_23A85E32C()
{
  return sub_23A85E3E0(&qword_2569C3F60, (uint64_t (*)(uint64_t))type metadata accessor for SecCSDigestAlgorithm, (uint64_t)&unk_23A86AD78);
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
  sub_23A85E370(a1, &qword_2569C3F80);
}

void sub_23A85E370(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23A85E3B4()
{
  return sub_23A85E3E0(&qword_2569C3F88, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_23A86AE3C);
}

uint64_t sub_23A85E3E0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B858E94](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A85E420()
{
  return sub_23A85E3E0(&qword_2569C3F90, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_23A86AE10);
}

uint64_t sub_23A85E44C()
{
  return sub_23A85E3E0(&qword_2569C3F98, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_23A86AEAC);
}

uint64_t FileMeasurement.isSameFile(_:withSupportedAlgorithms:)(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;

  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v5 = *a1;
    v6 = *v2;
    swift_bridgeObjectRetain();
    v7 = 0;
    while (1)
    {
      v8 = *(unsigned int *)(a2 + 4 * v7 + 32);
      if ((_DWORD)v8 == 2)
      {
        v9 = 0x3268736168;
        if (!*(_QWORD *)(v6 + 16))
          goto LABEL_3;
      }
      else
      {
        if ((_DWORD)v8 != 5)
        {
          sub_23A85E688();
          swift_allocError();
          *(_QWORD *)v18 = v8;
          *(_QWORD *)(v18 + 8) = 0;
          *(_BYTE *)(v18 + 16) = 1;
          swift_willThrow();
          swift_bridgeObjectRelease();
          return 0;
        }
        v9 = 0x3568736168;
        if (!*(_QWORD *)(v6 + 16))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
      }
      v10 = sub_23A85DC40(v9, 0xE500000000000000);
      if ((v11 & 1) == 0)
        goto LABEL_3;
      v12 = (uint64_t *)(*(_QWORD *)(v6 + 56) + 16 * v10);
      v14 = *v12;
      v13 = v12[1];
      sub_23A860E50(*v12, v13);
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v5 + 16))
      {
        v15 = sub_23A85DC40(v9, 0xE500000000000000);
        if ((v16 & 1) != 0)
        {
          v20 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v15);
          v21 = *v20;
          v22 = v20[1];
          sub_23A860E50(*v20, v22);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_23A862418(v14, v13);
          v24 = v23;
          sub_23A85D734(v21, v22);
          sub_23A85D734(v14, v13);
          return v24 & 1;
        }
      }
      swift_bridgeObjectRelease();
      sub_23A85D734(v14, v13);
LABEL_4:
      if (v3 == ++v7)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  sub_23A85E688();
  swift_allocError();
  *(_OWORD *)v17 = xmmword_23A86AF70;
  *(_BYTE *)(v17 + 16) = 3;
  swift_willThrow();
  return 0;
}

unint64_t sub_23A85E688()
{
  unint64_t result;

  result = qword_2569C3FB0;
  if (!qword_2569C3FB0)
  {
    result = MEMORY[0x23B858E94](&protocol conformance descriptor for FileMeasurementError, &type metadata for FileMeasurementError);
    atomic_store(result, (unint64_t *)&qword_2569C3FB0);
  }
  return result;
}

uint64_t sub_23A85E6E4(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_23A86A490();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_23A86A478();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_23A86A484();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_23A86A46C();
  MEMORY[0x24BDAC7A8](v7);
  if (a3 == 5)
  {
    sub_23A85E3E0(&qword_2569C4020, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6B38], MEMORY[0x24BDC6B30]);
    sub_23A86A460();
    __asm { BR              X10 }
  }
  if (a3 == 2)
  {
    sub_23A85E3E0(&qword_2569C4030, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8], MEMORY[0x24BDC6AE8]);
    sub_23A86A460();
    __asm { BR              X10 }
  }
  sub_23A85E688();
  swift_allocError();
  *(_QWORD *)v8 = a3;
  *(_QWORD *)(v8 + 8) = 0;
  *(_BYTE *)(v8 + 16) = 1;
  swift_willThrow();
  return a3;
}

uint64_t sub_23A85EE7C(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 0x3568736168;
  else
    v2 = 0x3268736168;
  if ((a2 & 1) != 0)
    v3 = 0x3568736168;
  else
    v3 = 0x3268736168;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_23A86A64C();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_23A85EEF0(char *a1, char *a2)
{
  return sub_23A85EE7C(*a1, *a2);
}

uint64_t sub_23A85EEFC()
{
  sub_23A86A6A0();
  sub_23A86A4D8();
  swift_bridgeObjectRelease();
  return sub_23A86A6C4();
}

uint64_t sub_23A85EF68()
{
  sub_23A86A4D8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A85EFA8()
{
  sub_23A86A6A0();
  sub_23A86A4D8();
  swift_bridgeObjectRelease();
  return sub_23A86A6C4();
}

uint64_t sub_23A85F010@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_23A86A5F8();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_23A85F06C(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;

  v2 = 0x3268736168;
  if (*v1)
    v2 = 0x3568736168;
  *a1 = v2;
  a1[1] = 0xE500000000000000;
}

uint64_t sub_23A85F09C()
{
  _BYTE *v0;

  if (*v0)
    return 0x3568736168;
  else
    return 0x3268736168;
}

uint64_t sub_23A85F0C8@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_23A86A5F8();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_23A85F128()
{
  return 0;
}

void sub_23A85F134(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23A85F140()
{
  sub_23A862894();
  return sub_23A86A6E8();
}

uint64_t sub_23A85F168()
{
  sub_23A862894();
  return sub_23A86A6F4();
}

uint64_t sub_23A85F190@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;

  v3 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  if (!v6)
    goto LABEL_5;
LABEL_4:
  v10 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (i = v10 | (v9 << 6); ; i = __clz(__rbit64(v13)) + (v9 << 6))
  {
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v17 = *v15;
    v16 = v15[1];
    swift_bridgeObjectRetain_n();
    v18 = sub_23A86A5F8();
    swift_bridgeObjectRelease();
    if (v18 > 1)
    {
      sub_23A85E688();
      swift_allocError();
      *(_QWORD *)v19 = v17;
      *(_QWORD *)(v19 + 8) = v16;
      *(_BYTE *)(v19 + 16) = 0;
      swift_bridgeObjectRetain();
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_release();
      return swift_bridgeObjectRelease();
    }
    result = swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_4;
LABEL_5:
    v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v12 >= v7)
      goto LABEL_27;
    v13 = *(_QWORD *)(v3 + 8 * v12);
    ++v9;
    if (!v13)
    {
      v9 = v12 + 1;
      if (v12 + 1 >= v7)
        goto LABEL_27;
      v13 = *(_QWORD *)(v3 + 8 * v9);
      if (!v13)
      {
        v9 = v12 + 2;
        if (v12 + 2 >= v7)
          goto LABEL_27;
        v13 = *(_QWORD *)(v3 + 8 * v9);
        if (!v13)
        {
          v9 = v12 + 3;
          if (v12 + 3 >= v7)
            goto LABEL_27;
          v13 = *(_QWORD *)(v3 + 8 * v9);
          if (!v13)
          {
            v9 = v12 + 4;
            if (v12 + 4 >= v7)
              goto LABEL_27;
            v13 = *(_QWORD *)(v3 + 8 * v9);
            if (!v13)
              break;
          }
        }
      }
    }
LABEL_22:
    v6 = (v13 - 1) & v13;
  }
  v14 = v12 + 5;
  if (v14 >= v7)
  {
LABEL_27:
    result = swift_release();
    *a2 = a1;
    return result;
  }
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
  {
    v9 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v9 >= v7)
      goto LABEL_27;
    v13 = *(_QWORD *)(v3 + 8 * v9);
    ++v14;
    if (v13)
      goto LABEL_22;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t FileMeasurement.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  char v19;
  unint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t result;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C3FB8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A862894();
  sub_23A86A6D0();
  v9 = v2;
  if (v2)
    goto LABEL_26;
  v36 = a2;
  v37 = v6;
  v38 = a1;
  v10 = sub_23A86A61C();
  v42 = *(_QWORD *)(v10 + 16);
  v43 = v10;
  v11 = (_QWORD *)MEMORY[0x24BEE4B00];
  if (!v42)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    if (v11[2])
    {
      (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v5);
      *v36 = v11;
      v32 = (uint64_t)v38;
      return __swift_destroy_boxed_opaque_existential_1(v32);
    }
    swift_bridgeObjectRelease();
    sub_23A85E688();
    swift_allocError();
    *(_QWORD *)v33 = 0;
    *(_QWORD *)(v33 + 8) = 0;
    *(_BYTE *)(v33 + 16) = 3;
    swift_willThrow();
LABEL_25:
    (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v5);
    a1 = v38;
LABEL_26:
    v32 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v32);
  }
  v12 = sub_23A8628F8();
  v40 = v5;
  v41 = v12;
  v13 = 0;
  v39 = v8;
  while (1)
  {
    if (*(_BYTE *)(v43 + v13 + 32))
      v15 = 0x3568736168;
    else
      v15 = 0x3268736168;
    LOBYTE(v47) = *(_BYTE *)(v43 + v13 + 32);
    sub_23A86A610();
    if (v9)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_25;
    }
    v44 = 0;
    v17 = v45;
    v16 = v46;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v47 = v11;
    v20 = sub_23A85DC40(v15, 0xE500000000000000);
    v21 = v11[2];
    v22 = (v19 & 1) == 0;
    v23 = v21 + v22;
    if (__OFADD__(v21, v22))
      break;
    v24 = v19;
    if (v11[3] >= v23)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v11 = v47;
        if ((v19 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_23A8614B4();
        v11 = v47;
        if ((v24 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_23A860E94(v23, isUniquelyReferenced_nonNull_native);
      v25 = sub_23A85DC40(v15, 0xE500000000000000);
      if ((v24 & 1) != (v26 & 1))
        goto LABEL_30;
      v20 = v25;
      v11 = v47;
      if ((v24 & 1) != 0)
      {
LABEL_4:
        v14 = v11[7] + 16 * v20;
        sub_23A85D734(*(_QWORD *)v14, *(_QWORD *)(v14 + 8));
        *(_QWORD *)v14 = v17;
        *(_QWORD *)(v14 + 8) = v16;
        goto LABEL_5;
      }
    }
    v11[(v20 >> 6) + 8] |= 1 << v20;
    v27 = (uint64_t *)(v11[6] + 16 * v20);
    *v27 = v15;
    v27[1] = 0xE500000000000000;
    v28 = (_QWORD *)(v11[7] + 16 * v20);
    *v28 = v17;
    v28[1] = v16;
    v29 = v11[2];
    v30 = __OFADD__(v29, 1);
    v31 = v29 + 1;
    if (v30)
      goto LABEL_29;
    v11[2] = v31;
    swift_bridgeObjectRetain();
LABEL_5:
    ++v13;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v8 = v39;
    v5 = v40;
    v9 = v44;
    if (v42 == v13)
      goto LABEL_21;
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  result = sub_23A86A664();
  __break(1u);
  return result;
}

uint64_t FileMeasurement.init(withHash:ofType:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned int a3@<W2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t inited;
  unint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3 == 2)
  {
    v8 = 0x3268736168;
  }
  else
  {
    if (a3 != 5)
    {
      v12 = a3;
      sub_23A85E688();
      swift_allocError();
      *(_QWORD *)v13 = v12;
      *(_QWORD *)(v13 + 8) = 0;
      *(_BYTE *)(v13 + 16) = 1;
      swift_willThrow();
      return sub_23A85D734(a1, a2);
    }
    v8 = 0x3568736168;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C3FD0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A86ACA0;
  *(_QWORD *)(inited + 32) = v8;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  sub_23A860E50(a1, a2);
  v10 = sub_23A85F840(inited);
  sub_23A85F190(v10, &v14);
  result = sub_23A85D734(a1, a2);
  if (!v4)
    *a4 = v14;
  return result;
}

unint64_t sub_23A85F840(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4018);
  v2 = (_QWORD *)sub_23A86A5E0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v7 = *(v4 - 1);
    v8 = *v4;
    swift_bridgeObjectRetain();
    sub_23A860E50(v7, v8);
    result = sub_23A85DC40(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (uint64_t *)(v2[7] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
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

uint64_t FileMeasurement.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;

  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C3FD8);
  v31 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A862894();
  v34 = v5;
  sub_23A86A6DC();
  v7 = *(_QWORD *)(v6 + 64);
  v32 = v6 + 64;
  v8 = 1 << *(_BYTE *)(v6 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v7;
  v33 = (unint64_t)(v8 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v12 = 0;
  while (1)
  {
    if (v10)
    {
      v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v16 = v15 | (v12 << 6);
    }
    else
    {
      if (__OFADD__(v12++, 1))
      {
        __break(1u);
LABEL_38:
        __break(1u);
        return result;
      }
      if (v12 >= v33)
        goto LABEL_34;
      v18 = *(_QWORD *)(v32 + 8 * v12);
      if (!v18)
      {
        v19 = v12 + 1;
        if (v12 + 1 >= v33)
          goto LABEL_34;
        v18 = *(_QWORD *)(v32 + 8 * v19);
        if (!v18)
        {
          v19 = v12 + 2;
          if (v12 + 2 >= v33)
            goto LABEL_34;
          v18 = *(_QWORD *)(v32 + 8 * v19);
          if (!v18)
          {
            v19 = v12 + 3;
            if (v12 + 3 >= v33)
              goto LABEL_34;
            v18 = *(_QWORD *)(v32 + 8 * v19);
            if (!v18)
            {
              v19 = v12 + 4;
              if (v12 + 4 >= v33)
                goto LABEL_34;
              v18 = *(_QWORD *)(v32 + 8 * v19);
              if (!v18)
              {
                v19 = v12 + 5;
                if (v12 + 5 >= v33)
                {
LABEL_34:
                  v28 = v31;
                  swift_release();
                  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v34, v35);
                }
                v18 = *(_QWORD *)(v32 + 8 * v19);
                if (!v18)
                {
                  while (1)
                  {
                    v12 = v19 + 1;
                    if (__OFADD__(v19, 1))
                      goto LABEL_38;
                    if (v12 >= v33)
                      goto LABEL_34;
                    v18 = *(_QWORD *)(v32 + 8 * v12);
                    ++v19;
                    if (v18)
                      goto LABEL_22;
                  }
                }
              }
            }
          }
        }
        v12 = v19;
      }
LABEL_22:
      v10 = (v18 - 1) & v18;
      v16 = __clz(__rbit64(v18)) + (v12 << 6);
    }
    v20 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v16);
    v21 = *v20;
    v22 = v20[1];
    swift_bridgeObjectRetain_n();
    v23 = sub_23A86A5F8();
    swift_bridgeObjectRelease();
    if (!v23)
    {
      v24 = 0;
      if (!*(_QWORD *)(v6 + 16))
        goto LABEL_4;
      goto LABEL_28;
    }
    if (v23 != 1)
      break;
    v24 = 1;
    if (!*(_QWORD *)(v6 + 16))
      goto LABEL_4;
LABEL_28:
    v25 = sub_23A85DC40(v21, v22);
    if ((v26 & 1) != 0)
    {
      v27 = (uint64_t *)(*(_QWORD *)(v6 + 56) + 16 * v25);
      v13 = *v27;
      v14 = v27[1];
      sub_23A860E50(*v27, v14);
      goto LABEL_5;
    }
LABEL_4:
    v13 = 0;
    v14 = 0xF000000000000000;
LABEL_5:
    swift_bridgeObjectRelease();
    v36 = v13;
    v37 = v14;
    v38 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C3FE0);
    sub_23A86293C();
    sub_23A86A634();
    result = sub_23A85E1F0(v13, v14);
    if (v2)
      goto LABEL_36;
  }
  sub_23A85E688();
  swift_allocError();
  *(_QWORD *)v29 = v21;
  *(_QWORD *)(v29 + 8) = v22;
  *(_BYTE *)(v29 + 16) = 0;
  swift_willThrow();
LABEL_36:
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v34, v35);
}

uint64_t FileMeasurement.hashTypes()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  v1 = *v0;
  v21 = MEMORY[0x24BEE4B08];
  v2 = v1 + 64;
  v3 = 1 << *(_BYTE *)(v1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v10 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v11 = v10 | (v8 << 6);
      goto LABEL_26;
    }
    v12 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v12 >= v6)
      goto LABEL_29;
    v13 = *(_QWORD *)(v2 + 8 * v12);
    ++v8;
    if (!v13)
    {
      v8 = v12 + 1;
      if (v12 + 1 >= v6)
        goto LABEL_29;
      v13 = *(_QWORD *)(v2 + 8 * v8);
      if (!v13)
      {
        v8 = v12 + 2;
        if (v12 + 2 >= v6)
          goto LABEL_29;
        v13 = *(_QWORD *)(v2 + 8 * v8);
        if (!v13)
        {
          v8 = v12 + 3;
          if (v12 + 3 >= v6)
            goto LABEL_29;
          v13 = *(_QWORD *)(v2 + 8 * v8);
          if (!v13)
          {
            v8 = v12 + 4;
            if (v12 + 4 >= v6)
              goto LABEL_29;
            v13 = *(_QWORD *)(v2 + 8 * v8);
            if (!v13)
              break;
          }
        }
      }
    }
LABEL_25:
    v5 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v8 << 6);
LABEL_26:
    v15 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v11);
    v17 = *v15;
    v16 = v15[1];
    swift_bridgeObjectRetain_n();
    v18 = sub_23A86A5F8();
    swift_bridgeObjectRelease();
    if (v18 == 1)
    {
      v9 = 5;
    }
    else
    {
      if (v18)
      {
        sub_23A85E688();
        swift_allocError();
        *(_QWORD *)v19 = v17;
        *(_QWORD *)(v19 + 8) = v16;
        *(_BYTE *)(v19 + 16) = 0;
        swift_willThrow();
        swift_release();
        return swift_bridgeObjectRelease();
      }
      v9 = 2;
    }
    swift_bridgeObjectRelease();
    result = sub_23A8618A0(&v20, v9);
  }
  v14 = v12 + 5;
  if (v14 >= v6)
  {
LABEL_29:
    swift_release();
    return v21;
  }
  v13 = *(_QWORD *)(v2 + 8 * v14);
  if (v13)
  {
    v8 = v14;
    goto LABEL_25;
  }
  while (1)
  {
    v8 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v8 >= v6)
      goto LABEL_29;
    v13 = *(_QWORD *)(v2 + 8 * v8);
    ++v14;
    if (v13)
      goto LABEL_25;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t FileMeasurement.bestHash()()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;

  result = FileMeasurement.hashTypes()();
  if (!v0)
  {
    v2 = result;
    if (sub_23A868F88(5, result))
    {
      swift_bridgeObjectRelease();
      return 5;
    }
    else if (sub_23A868F88(2, v2))
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      sub_23A85E688();
      swift_allocError();
      *(_QWORD *)v3 = 0;
      *(_QWORD *)(v3 + 8) = 0;
      *(_BYTE *)(v3 + 16) = 3;
      swift_willThrow();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t FileMeasurement.hashData(forDigestAlgorithm:)(unsigned int a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *v1;
  if (a1 == 2)
  {
    v4 = 0x3268736168;
    if (!*(_QWORD *)(v3 + 16))
      goto LABEL_8;
  }
  else
  {
    if (a1 != 5)
    {
      v8 = a1;
      sub_23A85E688();
      swift_allocError();
      *(_QWORD *)v9 = a1;
      v10 = 1;
      goto LABEL_10;
    }
    v4 = 0x3568736168;
    if (!*(_QWORD *)(v3 + 16))
    {
LABEL_8:
      swift_bridgeObjectRelease();
      v8 = a1;
      sub_23A85E688();
      swift_allocError();
      *(_QWORD *)v9 = a1;
      v10 = 2;
LABEL_10:
      *(_QWORD *)(v9 + 8) = 0;
      *(_BYTE *)(v9 + 16) = v10;
      swift_willThrow();
      return v8;
    }
  }
  v5 = sub_23A85DC40(v4, 0xE500000000000000);
  if ((v6 & 1) == 0)
    goto LABEL_8;
  v7 = *(_QWORD *)(v3 + 56) + 16 * v5;
  v8 = *(_QWORD *)v7;
  sub_23A860E50(*(_QWORD *)v7, *(_QWORD *)(v7 + 8));
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t static FileMeasurement.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_23A8600E8(*a1, *a2);
}

uint64_t sub_23A8600E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  char v19;
  int64_t v21;

  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
  {
    v3 = *(_QWORD *)(a1 + 64);
    v4 = 1 << *(_BYTE *)(a1 + 32);
    v5 = -1;
    if (v4 < 64)
      v5 = ~(-1 << v4);
    v21 = (unint64_t)(v4 + 63) >> 6;
    if ((v5 & v3) != 0)
    {
      v6 = __clz(__rbit64(v5 & v3));
LABEL_22:
      v10 = 16 * v6;
      v11 = (uint64_t *)(*(_QWORD *)(a1 + 48) + v10);
      v12 = *v11;
      v13 = v11[1];
      v14 = (uint64_t *)(*(_QWORD *)(a1 + 56) + v10);
      v16 = *v14;
      v15 = v14[1];
      swift_bridgeObjectRetain();
      sub_23A860E50(v16, v15);
      v17 = sub_23A85DC40(v12, v13);
      v19 = v18;
      swift_bridgeObjectRelease();
      if ((v19 & 1) != 0)
        __asm { BR              X8 }
      sub_23A85D734(v16, v15);
      return 0;
    }
    if ((unint64_t)(v4 + 63) >> 6 > 1)
    {
      v7 = *(_QWORD *)(a1 + 72);
      v8 = 1;
      if (v7)
        goto LABEL_21;
      v8 = 2;
      if (v21 <= 2)
        return 1;
      v7 = *(_QWORD *)(a1 + 80);
      if (v7)
        goto LABEL_21;
      v8 = 3;
      if (v21 <= 3)
        return 1;
      v7 = *(_QWORD *)(a1 + 88);
      if (v7)
        goto LABEL_21;
      v8 = 4;
      if (v21 <= 4)
        return 1;
      v7 = *(_QWORD *)(a1 + 96);
      if (v7)
      {
LABEL_21:
        v6 = __clz(__rbit64(v7)) + (v8 << 6);
        goto LABEL_22;
      }
      v9 = 5;
      if (v21 > 5)
      {
        v7 = *(_QWORD *)(a1 + 104);
        if (v7)
        {
          v8 = 5;
          goto LABEL_21;
        }
        while (1)
        {
          v8 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            JUMPOUT(0x23A860B00);
          }
          if (v8 >= v21)
            break;
          v7 = *(_QWORD *)(a1 + 64 + 8 * v8);
          ++v9;
          if (v7)
            goto LABEL_21;
        }
      }
    }
    return 1;
  }
  return 0;
}

uint64_t sub_23A860BB4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return FileMeasurement.init(from:)(a1, a2);
}

uint64_t sub_23A860BC8(_QWORD *a1)
{
  return FileMeasurement.encode(to:)(a1);
}

uint64_t sub_23A860BDC(uint64_t *a1, uint64_t *a2)
{
  return sub_23A8600E8(*a1, *a2);
}

void sub_23A860BE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_23A860C48(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x23A860E2CLL);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_23A860E50(uint64_t a1, unint64_t a2)
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

uint64_t sub_23A860E94(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  _QWORD *v36;
  __int128 v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4018);
  v6 = a2;
  v7 = sub_23A86A5D4();
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v22 = v21 | (v14 << 6);
      }
      else
      {
        v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35)
          goto LABEL_33;
        v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          v14 = v23 + 1;
          if (v23 + 1 >= v35)
            goto LABEL_33;
          v24 = v36[v14];
          if (!v24)
          {
            v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v6 & 1) != 0)
              {
                v34 = 1 << *(_BYTE *)(v5 + 32);
                if (v34 >= 64)
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v34;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                v14 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_40;
                if (v14 >= v35)
                  goto LABEL_33;
                v24 = v36[v14];
                ++v25;
                if (v24)
                  goto LABEL_30;
              }
            }
            v14 = v25;
          }
        }
LABEL_30:
        v11 = (v24 - 1) & v24;
        v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      v30 = 16 * v22;
      v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v30);
      v33 = *v31;
      v32 = v31[1];
      v37 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_23A860E50(v37, *((unint64_t *)&v37 + 1));
      }
      sub_23A86A6A0();
      sub_23A86A4D8();
      result = sub_23A86A6C4();
      v15 = -1 << *(_BYTE *)(v8 + 32);
      v16 = result & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v28 = v17 == v27;
          if (v17 == v27)
            v17 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v12 + 8 * v17);
        }
        while (v29 == -1);
        v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }
      *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = 16 * v18;
      v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
      *v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(_QWORD *)(v8 + 56) + v19) = v37;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
  *v3 = v8;
  return result;
}

uint64_t sub_23A8611A0(uint64_t a1, char a2)
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
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4010);
  v36 = a2;
  v6 = sub_23A86A5D4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_23A86A6A0();
    sub_23A86A4D8();
    result = sub_23A86A6C4();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

void *sub_23A8614B4()
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
  _QWORD *v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  __int128 v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4018);
  v2 = *v0;
  v3 = sub_23A86A5C8();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v24 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v16);
    v20 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    result = (void *)sub_23A860E50(v24, *((unint64_t *)&v24 + 1));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23A861678()
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
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4010);
  v2 = *v0;
  v3 = sub_23A86A5C8();
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
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
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

_BYTE *sub_23A86182C@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_23A862ECC(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_23A862F8C((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_23A863004((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_23A8618A0(_DWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v5 = *v2;
  sub_23A86A6A0();
  sub_23A86A6B8();
  v6 = sub_23A86A6C4();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v2;
    *v2 = 0x8000000000000000;
    sub_23A861C64(a2, v8, isUniquelyReferenced_nonNull_native);
    *v2 = v13;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(v5 + 48);
  if (*(_DWORD *)(v9 + 4 * v8) != (_DWORD)a2)
  {
    v10 = ~v7;
    do
    {
      v8 = (v8 + 1) & v10;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_DWORD *)(v9 + 4 * v8) != (_DWORD)a2);
  }
  result = 0;
  LODWORD(a2) = *(_DWORD *)(*(_QWORD *)(*v2 + 48) + 4 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_23A8619BC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C3F78);
  result = sub_23A86A550();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (_QWORD *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v26;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v14);
      sub_23A86A6A0();
      sub_23A86A6B8();
      result = sub_23A86A6C4();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23A861C64(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_23A8619BC();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_23A861DB0();
      goto LABEL_14;
    }
    sub_23A861F44();
  }
  v8 = *v3;
  sub_23A86A6A0();
  sub_23A86A6B8();
  result = sub_23A86A6C4();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_DWORD *)(v10 + 4 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for SecCSDigestAlgorithm(0);
      result = sub_23A86A658();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_DWORD *)(v10 + 4 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_DWORD *)(*(_QWORD *)(v12 + 48) + 4 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

void *sub_23A861DB0()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C3F78);
  v2 = *v0;
  v3 = sub_23A86A544();
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * v15) = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23A861F44()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C3F78);
  result = sub_23A86A550();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v14);
    sub_23A86A6A0();
    sub_23A86A6B8();
    result = sub_23A86A6C4();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23A8621BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), unint64_t *a6, uint64_t a7)
{
  uint64_t result;

  result = sub_23A86A2C8();
  if (!result || (result = sub_23A86A2E0(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_23A86A2D4();
      a5(0);
      sub_23A85E3E0(a6, a5, a7);
      return sub_23A86A448();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23A862290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_23A860BE8((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_23A862364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_23A86A2C8();
  v11 = result;
  if (result)
  {
    result = sub_23A86A2E0();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_23A86A2D4();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_23A860BE8(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_23A862418(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_23A862464()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_23A862498 + *((int *)qword_23A862670 + (v0 >> 62))))();
}

uint64_t sub_23A8624A8@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1)
      __asm { BR              X10 }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

void _s11EDPSecurity20FileMeasurementErrorO2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_23A8626CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  int v5;
  char v7;

  if (v5)
  {
    swift_bridgeObjectRetain();
    sub_23A862A2C(v1, v2, v5);
    sub_23A862A50(v0, v3, v4);
    sub_23A862A50(v1, v2, v5);
    v7 = 0;
  }
  else
  {
    if (v0 == v1 && v3 == v2)
      v7 = 1;
    else
      v7 = sub_23A86A64C();
    sub_23A862A2C(v1, v2, 0);
    sub_23A862A2C(v0, v3, 0);
    sub_23A862A50(v0, v3, 0);
    sub_23A862A50(v1, v2, 0);
  }
  return v7 & 1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23A862894()
{
  unint64_t result;

  result = qword_2569C3FC0;
  if (!qword_2569C3FC0)
  {
    result = MEMORY[0x23B858E94](&unk_23A86B1A8, &type metadata for FileMeasurement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C3FC0);
  }
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

unint64_t sub_23A8628F8()
{
  unint64_t result;

  result = qword_2569C3FC8;
  if (!qword_2569C3FC8)
  {
    result = MEMORY[0x23B858E94](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2569C3FC8);
  }
  return result;
}

unint64_t sub_23A86293C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2569C3FE8;
  if (!qword_2569C3FE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569C3FE0);
    v2 = sub_23A8629E4();
    result = MEMORY[0x23B858E94](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2569C3FE8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B858E88](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23A8629E4()
{
  unint64_t result;

  result = qword_2569C3FF0;
  if (!qword_2569C3FF0)
  {
    result = MEMORY[0x23B858E94](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2569C3FF0);
  }
  return result;
}

uint64_t sub_23A862A2C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for FileMeasurementError(uint64_t a1)
{
  return sub_23A862A50(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_23A862A50(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s11EDPSecurity20FileMeasurementErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23A862A2C(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for FileMeasurementError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23A862A2C(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23A862A50(v6, v7, v8);
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

uint64_t assignWithTake for FileMeasurementError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23A862A50(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FileMeasurementError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FileMeasurementError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A862BE4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_23A862C00(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FileMeasurementError()
{
  return &type metadata for FileMeasurementError;
}

ValueMetadata *type metadata accessor for FileMeasurement()
{
  return &type metadata for FileMeasurement;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FileMeasurement.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FileMeasurement.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A862D24 + 4 * byte_23A86AF89[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A862D58 + 4 * byte_23A86AF84[v4]))();
}

uint64_t sub_23A862D58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A862D60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A862D68);
  return result;
}

uint64_t sub_23A862D74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A862D7CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A862D80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A862D88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A862D94(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A862D9C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FileMeasurement.CodingKeys()
{
  return &type metadata for FileMeasurement.CodingKeys;
}

unint64_t sub_23A862DBC()
{
  unint64_t result;

  result = qword_2569C3FF8;
  if (!qword_2569C3FF8)
  {
    result = MEMORY[0x23B858E94](&unk_23A86B180, &type metadata for FileMeasurement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C3FF8);
  }
  return result;
}

unint64_t sub_23A862E04()
{
  unint64_t result;

  result = qword_2569C4000;
  if (!qword_2569C4000)
  {
    result = MEMORY[0x23B858E94](&unk_23A86B0B8, &type metadata for FileMeasurement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C4000);
  }
  return result;
}

unint64_t sub_23A862E4C()
{
  unint64_t result;

  result = qword_2569C4008;
  if (!qword_2569C4008)
  {
    result = MEMORY[0x23B858E94](&unk_23A86B0E0, &type metadata for FileMeasurement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C4008);
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

uint64_t sub_23A862ECC(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_23A862F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_23A86A2EC();
  swift_allocObject();
  result = sub_23A86A2BC();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_23A86A3F4();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_23A863004(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_23A86A2EC();
  swift_allocObject();
  result = sub_23A86A2BC();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t PackageSigner.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_url;
  v4 = sub_23A86A3DC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t PackageSigner.certificateChain.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A8630D8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A863140()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A863188(uint64_t a1)
{
  return sub_23A8632A4(a1, &OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources, (uint64_t (*)(uint64_t))MEMORY[0x24BEE4BC0]);
}

uint64_t (*sub_23A86319C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23A8631E0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_measurer);
  swift_beginAccess();
  *v3 = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_23A863248()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_23A863290(uint64_t a1)
{
  return sub_23A8632A4(a1, &OBJC_IVAR____TtC11EDPSecurity13PackageSigner_measurer, (uint64_t (*)(uint64_t))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_23A8632A4(uint64_t a1, _QWORD *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v3;
  uint64_t *v6;
  uint64_t v7;

  v6 = (uint64_t *)(v3 + *a2);
  swift_beginAccess();
  v7 = *v6;
  *v6 = a1;
  return a3(v7);
}

uint64_t (*sub_23A8632FC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23A863340@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime;
  swift_beginAccess();
  v4 = sub_23A86A43C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_23A8633A8(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_23A86A43C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = *a2 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_23A86346C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime;
  swift_beginAccess();
  v4 = sub_23A86A43C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_23A8634D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime;
  swift_beginAccess();
  v4 = sub_23A86A43C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_23A86353C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t PackageSigner.__allocating_init(_:_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  PackageSigner.init(_:_:)(a1, a2);
  return v4;
}

uint64_t PackageSigner.init(_:_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v3 = v2;
  v27 = sub_23A86A43C();
  v6 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23A86A3DC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a2 >> 62))
  {
    if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_9:
    swift_bridgeObjectRelease();
    type metadata accessor for PackageSignerError(0);
    sub_23A85E3E0(&qword_2569C4040, type metadata accessor for PackageSignerError, (uint64_t)&protocol conformance descriptor for PackageSignerError);
    swift_allocError();
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  v22 = sub_23A86A5BC();
  swift_bridgeObjectRelease();
  if (!v22)
    goto LABEL_9;
LABEL_3:
  if ((sub_23A865B10() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    type metadata accessor for PackageSignerError(0);
    sub_23A85E3E0(&qword_2569C4040, type metadata accessor for PackageSignerError, (uint64_t)&protocol conformance descriptor for PackageSignerError);
    swift_allocError();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v18, a1, v9);
LABEL_10:
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
    goto LABEL_11;
  }
  sub_23A86A388();
  v13 = v3 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_url;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v3 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_url, v12, v9);
  v14 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v25 = v13;
  sub_23A86A3B8();
  v15 = sub_23A86A49C();
  v26 = a1;
  v16 = (void *)v15;
  swift_bridgeObjectRelease();
  LOBYTE(v13) = objc_msgSend(v14, sel_fileExistsAtPath_, v16);

  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    type metadata accessor for PackageSignerError(0);
    sub_23A85E3E0(&qword_2569C4040, type metadata accessor for PackageSignerError, (uint64_t)&protocol conformance descriptor for PackageSignerError);
    swift_allocError();
    v19 = v25;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v20, v25, v9);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    v21 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v21(v26, v9);
    v21(v19, v9);
LABEL_11:
    type metadata accessor for PackageSigner(0);
    swift_deallocPartialClassInstance();
    return v3;
  }
  *(_QWORD *)(v3 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_certificateChain) = a2;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources) = MEMORY[0x24BEE4B00];
  type metadata accessor for FileMeasurer();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_23A85E0B0((uint64_t)&unk_250BAD710);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_measurer) = v17;
  sub_23A86A430();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v26, v9);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v3 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime, v8, v27);
  return v3;
}

uint64_t type metadata accessor for PackageSignerError(uint64_t a1)
{
  return sub_23A8639D0(a1, qword_2569C40C8);
}

uint64_t type metadata accessor for PackageSigner(uint64_t a1)
{
  return sub_23A8639D0(a1, qword_2569C4128);
}

uint64_t sub_23A8639D0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A863A04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t *v7;
  char v8;
  char v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v6 = *a3;
  v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources);
  swift_beginAccess();
  if (*(_QWORD *)(*v7 + 16)
    && (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_23A85DC40(a1, a2),
        v9 = v8,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v9 & 1) != 0))
  {
    type metadata accessor for ResourceManifestError();
    sub_23A85E3E0((unint64_t *)&qword_2569C4048, (uint64_t (*)(uint64_t))type metadata accessor for ResourceManifestError, (uint64_t)&unk_23A86B4C8);
    swift_allocError();
    *v10 = a1;
    v10[1] = a2;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  else
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v7;
    *v7 = 0x8000000000000000;
    sub_23A8651C0(v6, a1, a2, isUniquelyReferenced_nonNull_native);
    *v7 = v13;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
}

uint64_t sub_23A863B90(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t *v7;
  char v8;
  char v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v12;
  uint64_t v13;

  v6 = *a3;
  v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources);
  swift_beginAccess();
  if (*(_QWORD *)(*v7 + 16)
    && (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_23A85DC40(a1, a2),
        v9 = v8,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v9 & 1) != 0))
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v7;
    *v7 = 0x8000000000000000;
    sub_23A8651C0(v6, a1, a2, isUniquelyReferenced_nonNull_native);
    *v7 = v13;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
  else
  {
    type metadata accessor for PackageSignerError(0);
    sub_23A85E3E0(&qword_2569C4040, type metadata accessor for PackageSignerError, (uint64_t)&protocol conformance descriptor for PackageSignerError);
    swift_allocError();
    *v12 = a1;
    v12[1] = a2;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
}

uint64_t sub_23A863D1C(uint64_t a1, uint64_t a2)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  unint64_t v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v48;
  uint64_t v49;
  char v50;
  unint64_t v51;
  uint64_t v52;
  _BOOL8 v53;
  uint64_t v54;
  char v55;
  unint64_t v56;
  char v57;
  _QWORD *v58;
  uint64_t *v59;
  uint64_t v60;
  BOOL v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t *v66;
  uint64_t v67;
  char *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  unint64_t v89;
  void *v90;
  uint64_t result;
  _QWORD v92[2];
  char *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  _QWORD *v110;
  uint64_t aBlock;
  unint64_t v112;
  id (*v113)(uint64_t, void *, uint64_t);
  void *v114;
  uint64_t (*v115)();
  uint64_t v116;
  _QWORD *v117;
  uint64_t v118;

  v107 = a2;
  v103 = a1;
  v118 = *MEMORY[0x24BDAC8D0];
  v102 = sub_23A86A394();
  v101 = *(_QWORD *)(v102 - 8);
  MEMORY[0x24BDAC7A8](v102);
  v5 = (char *)v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A86A3DC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v92 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23A86A43C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v109 = (char *)v92 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v2 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_url;
  v108 = v2;
  v14 = (uint64_t *)(v2 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_measurer);
  swift_beginAccess();
  v15 = *v14;
  swift_retain();
  v16 = sub_23A867C0C(v13, v15);
  if (!v3)
  {
    v17 = (char *)v16;
    v97 = v11;
    v98 = v10;
    v92[1] = v13;
    v93 = v5;
    v94 = v9;
    v95 = v7;
    v96 = v6;
    v99 = 0;
    swift_release();
    v18 = v108;
    v19 = v108 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources;
    swift_beginAccess();
    v20 = *(_QWORD *)v19;
    v21 = *(_QWORD *)(*(_QWORD *)v19 + 64);
    v104 = *(_QWORD *)v19 + 64;
    v22 = 1 << *(_BYTE *)(v20 + 32);
    v23 = -1;
    if (v22 < 64)
      v23 = ~(-1 << v22);
    v24 = v23 & v21;
    v100 = (uint64_t)v17;
    v106 = v20;
    swift_bridgeObjectRetain();
    v110 = v17 + 24;
    swift_beginAccess();
    v25 = 0;
    v105 = (unint64_t)(v22 + 63) >> 6;
    v26 = v107;
    v27 = v109;
    while (1)
    {
      if (v24)
      {
        v29 = __clz(__rbit64(v24));
        v30 = (char *)((v24 - 1) & v24);
        v31 = v29 | (v25 << 6);
      }
      else
      {
        v32 = v25 + 1;
        if (__OFADD__(v25, 1))
          goto LABEL_45;
        if (v32 >= v105)
        {
LABEL_36:
          swift_release();
          sub_23A86A364();
          swift_allocObject();
          sub_23A86A358();
          sub_23A86A340();
          aBlock = v100;
          type metadata accessor for ResourceManifest();
          sub_23A85E3E0(&qword_2569C4050, (uint64_t (*)(uint64_t))type metadata accessor for ResourceManifest, (uint64_t)&protocol conformance descriptor for ResourceManifest);
          v63 = v99;
          v64 = sub_23A86A34C();
          if (!v63)
          {
            v67 = v64;
            v68 = v65;
            v99 = 0;
            v109 = (char *)objc_opt_self();
            v108 = sub_23A86A400();
            sub_23A8646EC(*(_QWORD *)(v18 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_certificateChain));
            v110 = (_QWORD *)v67;
            v69 = (void *)sub_23A86A514();
            swift_bridgeObjectRelease();
            v70 = v18 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime;
            swift_beginAccess();
            v71 = v97;
            v72 = v70;
            v73 = v98;
            (*(void (**)(char *, uint64_t, uint64_t))(v97 + 16))(v27, v72, v98);
            v74 = (void *)sub_23A86A424();
            (*(void (**)(char *, uint64_t))(v71 + 8))(v27, v73);
            v75 = swift_allocObject();
            *(_QWORD *)(v75 + 16) = v103;
            *(_QWORD *)(v75 + 24) = v26;
            v76 = swift_allocObject();
            *(_QWORD *)(v76 + 16) = sub_23A86532C;
            *(_QWORD *)(v76 + 24) = v75;
            v115 = sub_23A865344;
            v116 = v76;
            aBlock = MEMORY[0x24BDAC760];
            v112 = 1107296256;
            v113 = sub_23A864A08;
            v114 = &block_descriptor;
            v77 = _Block_copy(&aBlock);
            swift_release();
            aBlock = 0;
            v78 = (void *)v108;
            v79 = objc_msgSend(v109, sel_createSignature_withCertChain_withTime_withRemoteHandler_withError_, v108, v69, v74, v77, &aBlock);
            _Block_release(v77);

            v80 = (id)aBlock;
            if (v79)
            {
              v109 = v68;
              v81 = sub_23A86A40C();
              v83 = v82;

              aBlock = 0x727574616E676973;
              v112 = 0xE900000000000065;
              v84 = v101;
              v85 = v93;
              v86 = v102;
              (*(void (**)(char *, _QWORD, uint64_t))(v101 + 104))(v93, *MEMORY[0x24BDCD7A0], v102);
              sub_23A85C864();
              v87 = v94;
              sub_23A86A3D0();
              (*(void (**)(char *, uint64_t))(v84 + 8))(v85, v86);
              swift_bridgeObjectRelease();
              sub_23A86A418();
              (*(void (**)(char *, uint64_t))(v95 + 8))(v87, v96);
              sub_23A85D734((uint64_t)v110, (unint64_t)v109);
              v88 = v81;
              v89 = v83;
            }
            else
            {
              v90 = v80;
              sub_23A86A37C();

              swift_willThrow();
              v88 = (uint64_t)v110;
              v89 = (unint64_t)v68;
            }
            sub_23A85D734(v88, v89);
            swift_release();
          }
          swift_release();
          return swift_release();
        }
        v33 = *(_QWORD *)(v104 + 8 * v32);
        ++v25;
        if (!v33)
        {
          v25 = v32 + 1;
          if (v32 + 1 >= v105)
            goto LABEL_36;
          v33 = *(_QWORD *)(v104 + 8 * v25);
          if (!v33)
          {
            v25 = v32 + 2;
            if (v32 + 2 >= v105)
              goto LABEL_36;
            v33 = *(_QWORD *)(v104 + 8 * v25);
            if (!v33)
            {
              v34 = v32 + 3;
              if (v34 >= v105)
                goto LABEL_36;
              v33 = *(_QWORD *)(v104 + 8 * v34);
              if (!v33)
              {
                while (1)
                {
                  v25 = v34 + 1;
                  if (__OFADD__(v34, 1))
                    goto LABEL_46;
                  if (v25 >= v105)
                    goto LABEL_36;
                  v33 = *(_QWORD *)(v104 + 8 * v25);
                  ++v34;
                  if (v33)
                    goto LABEL_22;
                }
              }
              v25 = v34;
            }
          }
        }
LABEL_22:
        v30 = (char *)((v33 - 1) & v33);
        v31 = __clz(__rbit64(v33)) + (v25 << 6);
      }
      v35 = (uint64_t *)(*(_QWORD *)(v106 + 48) + 16 * v31);
      v36 = *v35;
      v37 = v35[1];
      v38 = *(_QWORD *)(*(_QWORD *)(v106 + 56) + 8 * v31);
      v39 = *(_QWORD *)(*v110 + 16);
      swift_bridgeObjectRetain();
      if (v39)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_23A85DC40(v36, v37);
        v41 = v40;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v41 & 1) != 0)
        {
          type metadata accessor for ResourceManifestError();
          sub_23A85E3E0((unint64_t *)&qword_2569C4048, (uint64_t (*)(uint64_t))type metadata accessor for ResourceManifestError, (uint64_t)&unk_23A86B4C8);
          swift_allocError();
          *v66 = v36;
          v66[1] = v37;
          swift_storeEnumTagMultiPayload();
          swift_bridgeObjectRetain();
          swift_willThrow();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          return swift_release();
        }
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      v109 = v30;
      v42 = v38;
      v43 = v27;
      v44 = v110;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v45 = v36;
      v46 = v42;
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v117 = (_QWORD *)*v44;
      v48 = v117;
      *v44 = 0x8000000000000000;
      v49 = v45;
      v51 = sub_23A85DC40(v45, v37);
      v52 = v48[2];
      v53 = (v50 & 1) == 0;
      v54 = v52 + v53;
      if (__OFADD__(v52, v53))
      {
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
      }
      v55 = v50;
      if (v48[3] >= v54)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_23A861678();
      }
      else
      {
        sub_23A8611A0(v54, isUniquelyReferenced_nonNull_native);
        v56 = sub_23A85DC40(v49, v37);
        if ((v55 & 1) != (v57 & 1))
        {
          result = sub_23A86A664();
          __break(1u);
          return result;
        }
        v51 = v56;
      }
      v27 = v43;
      v58 = v117;
      if ((v55 & 1) != 0)
      {
        v28 = v117[7];
        swift_bridgeObjectRelease();
        *(_QWORD *)(v28 + 8 * v51) = v46;
      }
      else
      {
        v117[(v51 >> 6) + 8] |= 1 << v51;
        v59 = (uint64_t *)(v58[6] + 16 * v51);
        *v59 = v49;
        v59[1] = v37;
        *(_QWORD *)(v58[7] + 8 * v51) = v46;
        v60 = v58[2];
        v61 = __OFADD__(v60, 1);
        v62 = v60 + 1;
        if (v61)
          goto LABEL_44;
        v58[2] = v62;
        swift_bridgeObjectRetain();
      }
      *v110 = v58;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v26 = v107;
      v18 = v108;
      v24 = (unint64_t)v109;
    }
  }
  return swift_release();
}

char *sub_23A8646EC(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_23A86A5BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return (char *)v3;
  v13 = MEMORY[0x24BEE4AF8];
  result = sub_23A8650A0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x23B858948](i, a1);
        type metadata accessor for SecCertificate(0);
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23A8650A0(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_23A8650A0((char *)(v6 > 1), v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_23A865AFC(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      type metadata accessor for SecCertificate(0);
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23A8650A0(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_23A8650A0((char *)(v10 > 1), v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_23A865AFC(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

id sub_23A86491C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;

  v8 = objc_msgSend(objc_allocWithZone((Class)SignatureResponse), sel_init);
  v9 = a4(a1, a2, a3);
  v11 = v10;
  v12 = (void *)sub_23A86A400();
  objc_msgSend(v8, sel_setSignature_, v12);

  sub_23A85D734(v9, v11);
  return v8;
}

id sub_23A864A08(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (*v4)(uint64_t, unint64_t, uint64_t);
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v4 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t))(a1 + 32);
  v5 = a2;
  v6 = sub_23A86A40C();
  v8 = v7;

  v9 = (void *)v4(v6, v8, a3);
  sub_23A85D734(v6, v8);
  return v9;
}

uint64_t static PackageSigner.signPackage(_:_:_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v40;
  char v41;
  _QWORD *v42;
  uint64_t v43;
  char v44;
  unint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v48;
  char v49;
  unint64_t v50;
  char v51;
  _QWORD *v52;
  uint64_t *v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58[3];
  uint64_t v59;
  int64_t v60;
  uint64_t v61;
  int64_t v62;
  _QWORD *v63;
  _QWORD *v64;

  v11 = sub_23A86A3DC();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v14 + 16))(v13, a1);
  type metadata accessor for PackageSigner(0);
  v15 = swift_allocObject();
  swift_bridgeObjectRetain();
  result = PackageSigner.init(_:_:)((uint64_t)v13, a2);
  if (v5)
    return result;
  v58[0] = a5;
  v58[1] = 0;
  v17 = *(_QWORD *)(a3 + 64);
  v58[2] = v15;
  v59 = a3 + 64;
  v18 = 1 << *(_BYTE *)(a3 + 32);
  v19 = -1;
  if (v18 < 64)
    v19 = ~(-1 << v18);
  v20 = v19 & v17;
  v21 = v15 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources;
  swift_bridgeObjectRetain();
  v63 = (_QWORD *)v21;
  swift_beginAccess();
  v22 = 0;
  v60 = (unint64_t)(v18 + 63) >> 6;
  v61 = a4;
  while (1)
  {
    if (v20)
    {
      v24 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      v25 = v24 | (v22 << 6);
    }
    else
    {
      v26 = v22 + 1;
      if (__OFADD__(v22, 1))
        goto LABEL_43;
      if (v26 >= v60)
      {
LABEL_38:
        swift_release();
        sub_23A863D1C(a4, v58[0]);
        return swift_release();
      }
      v27 = *(_QWORD *)(v59 + 8 * v26);
      ++v22;
      if (!v27)
      {
        v22 = v26 + 1;
        if (v26 + 1 >= v60)
          goto LABEL_38;
        v27 = *(_QWORD *)(v59 + 8 * v22);
        if (!v27)
        {
          v22 = v26 + 2;
          if (v26 + 2 >= v60)
            goto LABEL_38;
          v27 = *(_QWORD *)(v59 + 8 * v22);
          if (!v27)
          {
            v28 = v26 + 3;
            if (v28 >= v60)
              goto LABEL_38;
            v27 = *(_QWORD *)(v59 + 8 * v28);
            if (!v27)
            {
              while (1)
              {
                v22 = v28 + 1;
                if (__OFADD__(v28, 1))
                  goto LABEL_44;
                if (v22 >= v60)
                  goto LABEL_38;
                v27 = *(_QWORD *)(v59 + 8 * v22);
                ++v28;
                if (v27)
                  goto LABEL_22;
              }
            }
            v22 = v28;
          }
        }
      }
LABEL_22:
      v20 = (v27 - 1) & v27;
      v25 = __clz(__rbit64(v27)) + (v22 << 6);
    }
    v29 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v25);
    v30 = *v29;
    v31 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 8 * v25);
    v33 = *(_QWORD *)(*v63 + 16);
    swift_bridgeObjectRetain();
    if (v33)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23A85DC40(v30, v31);
      v35 = v34;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v35 & 1) != 0)
      {
        type metadata accessor for ResourceManifestError();
        sub_23A85E3E0((unint64_t *)&qword_2569C4048, (uint64_t (*)(uint64_t))type metadata accessor for ResourceManifestError, (uint64_t)&unk_23A86B4C8);
        swift_allocError();
        *v57 = v30;
        v57[1] = v31;
        swift_storeEnumTagMultiPayload();
        swift_bridgeObjectRetain();
        swift_willThrow();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        return swift_release();
      }
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    v62 = v22;
    v36 = a3;
    v37 = v63;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v38 = v32;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v40 = v30;
    v41 = isUniquelyReferenced_nonNull_native;
    v64 = (_QWORD *)*v37;
    v42 = v64;
    *v37 = 0x8000000000000000;
    v43 = v40;
    v45 = sub_23A85DC40(v40, v31);
    v46 = v42[2];
    v47 = (v44 & 1) == 0;
    v48 = v46 + v47;
    if (__OFADD__(v46, v47))
      break;
    v49 = v44;
    if (v42[3] >= v48)
    {
      if ((v41 & 1) != 0)
      {
        v52 = v64;
        if ((v44 & 1) != 0)
          goto LABEL_5;
      }
      else
      {
        sub_23A861678();
        v52 = v64;
        if ((v49 & 1) != 0)
          goto LABEL_5;
      }
    }
    else
    {
      sub_23A8611A0(v48, v41);
      v50 = sub_23A85DC40(v43, v31);
      if ((v49 & 1) != (v51 & 1))
        goto LABEL_45;
      v45 = v50;
      v52 = v64;
      if ((v49 & 1) != 0)
      {
LABEL_5:
        v23 = v52[7];
        swift_bridgeObjectRelease();
        *(_QWORD *)(v23 + 8 * v45) = v38;
        goto LABEL_6;
      }
    }
    v52[(v45 >> 6) + 8] |= 1 << v45;
    v53 = (uint64_t *)(v52[6] + 16 * v45);
    *v53 = v43;
    v53[1] = v31;
    *(_QWORD *)(v52[7] + 8 * v45) = v38;
    v54 = v52[2];
    v55 = __OFADD__(v54, 1);
    v56 = v54 + 1;
    if (v55)
      goto LABEL_42;
    v52[2] = v56;
    swift_bridgeObjectRetain();
LABEL_6:
    *v63 = v52;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a3 = v36;
    a4 = v61;
    v22 = v62;
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  result = sub_23A86A664();
  __break(1u);
  return result;
}

uint64_t PackageSigner.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_url;
  v2 = sub_23A86A3DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = v0 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime;
  v4 = sub_23A86A43C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t PackageSigner.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_url;
  v2 = sub_23A86A3DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = v0 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_signingTime;
  v4 = sub_23A86A43C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

char *sub_23A8650A0(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_23A8650BC(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_23A8650BC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4230);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_23A8651C0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_23A85DC40(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_23A861678();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_23A8611A0(v15, a4 & 1);
  v21 = sub_23A85DC40(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23A86A664();
  __break(1u);
  return result;
}

uint64_t sub_23A86531C()
{
  return swift_deallocObject();
}

id sub_23A86532C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_23A86491C(a1, a2, a3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
}

uint64_t sub_23A865334()
{
  return swift_deallocObject();
}

uint64_t sub_23A865344()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_23A86537C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_additionalResources);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A8653D4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC11EDPSecurity13PackageSigner_measurer);
  swift_beginAccess();
  *a2 = *v3;
  return swift_retain();
}

uint64_t *initializeBufferWithCopyOfBuffer for PackageSignerError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  unsigned int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v10 = sub_23A86A3DC();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for PackageSignerError(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
  {
    v3 = sub_23A86A3DC();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  else if (result <= 1)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *initializeWithCopy for PackageSignerError(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unsigned int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v8 = sub_23A86A3DC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload > 1)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *assignWithCopy for PackageSignerError(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unsigned int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_23A86576C((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v7 = sub_23A86A3DC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_23A86576C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PackageSignerError(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithTake for PackageSignerError(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v6 = sub_23A86A3DC();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for PackageSignerError(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23A86576C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v6 = sub_23A86A3DC();
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

uint64_t getEnumTagSinglePayload for PackageSignerError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for PackageSignerError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23A8658EC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23A8658FC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A86A3DC();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_23A86596C()
{
  return type metadata accessor for PackageSigner(0);
}

uint64_t sub_23A865974()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23A86A3DC();
  if (v1 <= 0x3F)
  {
    result = sub_23A86A43C();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for PackageSigner()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PackageSigner.additionalResources.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of PackageSigner.additionalResources.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of PackageSigner.additionalResources.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of PackageSigner.measurer.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of PackageSigner.measurer.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of PackageSigner.measurer.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of PackageSigner.signingTime.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of PackageSigner.signingTime.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of PackageSigner.signingTime.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of PackageSigner.__allocating_init(_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of PackageSigner.addResource(_:withMeasurement:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of PackageSigner.updateResource(_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of PackageSigner.sign(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

_OWORD *sub_23A865AFC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23A865B10()
{
  uint64_t v0;
  char *v1;
  uint64_t inited;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4440);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4450);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A86ACA0;
  v3 = (void *)*MEMORY[0x24BDBCC60];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCC60];
  v4 = v3;
  sub_23A85DE84(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_23A86A3A0();
  swift_bridgeObjectRelease();
  v5 = sub_23A86A310();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v1, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v1, 1, v5) == 1)
  {
    sub_23A8685AC((uint64_t)v1, &qword_2569C4440);
  }
  else
  {
    v8 = sub_23A86A304();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v1, v5);
    if (v8 != 2)
      return v8 & 1;
  }
  return 0;
}

uint64_t sub_23A865CBC()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_23A865CEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_23A865D28())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23A865D64(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A865DC0()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A865DF4(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_23A865E38())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t ResourceManifest.__allocating_init()()
{
  uint64_t result;
  uint64_t v1;

  type metadata accessor for ResourceManifest();
  result = swift_allocObject();
  v1 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(result + 16) = 1;
  *(_QWORD *)(result + 24) = v1;
  return result;
}

uint64_t type metadata accessor for ResourceManifest()
{
  return objc_opt_self();
}

unint64_t sub_23A865EC4()
{
  sub_23A86A568();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_23A86A640();
  sub_23A86A4FC();
  swift_bridgeObjectRelease();
  sub_23A86A4FC();
  swift_beginAccess();
  sub_23A86A640();
  sub_23A86A4FC();
  swift_bridgeObjectRelease();
  sub_23A86A4FC();
  return 0xD000000000000014;
}

uint64_t sub_23A865FFC()
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
  int64_t v9;
  uint64_t result;
  int64_t v11;
  uint64_t v12;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;

  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 24);
  v5 = *(_QWORD *)(v2 + 64);
  v4 = v2 + 64;
  v3 = v5;
  v6 = 1 << *(_BYTE *)(*(_QWORD *)(v0 + 24) + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v3;
  v9 = (unint64_t)(v6 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v11 = 0;
  v12 = MEMORY[0x24BEE4B08];
  if (v8)
    goto LABEL_7;
LABEL_8:
  while (2)
  {
    if (__OFADD__(v11++, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    if (v11 >= v9)
      goto LABEL_27;
    v14 = *(_QWORD *)(v4 + 8 * v11);
    if (!v14)
    {
      v15 = v11 + 1;
      if (v11 + 1 >= v9)
        goto LABEL_27;
      v14 = *(_QWORD *)(v4 + 8 * v15);
      if (v14)
        goto LABEL_17;
      v15 = v11 + 2;
      if (v11 + 2 >= v9)
        goto LABEL_27;
      v14 = *(_QWORD *)(v4 + 8 * v15);
      if (v14)
      {
LABEL_17:
        v11 = v15;
        goto LABEL_18;
      }
      v15 = v11 + 3;
      if (v11 + 3 < v9)
      {
        v14 = *(_QWORD *)(v4 + 8 * v15);
        if (v14)
          goto LABEL_17;
        while (1)
        {
          v11 = v15 + 1;
          if (__OFADD__(v15, 1))
            break;
          if (v11 >= v9)
            goto LABEL_27;
          v14 = *(_QWORD *)(v4 + 8 * v11);
          ++v15;
          if (v14)
            goto LABEL_18;
        }
LABEL_37:
        __break(1u);
        return result;
      }
LABEL_27:
      swift_release();
      if (*(_QWORD *)(v12 + 16))
      {
        if (sub_23A868F88(5, v12))
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else if (sub_23A868F88(2, v12))
        {
          swift_bridgeObjectRelease();
          return 2;
        }
        else
        {
          sub_23A85E688();
          swift_allocError();
          *(_QWORD *)v17 = 0;
          *(_QWORD *)(v17 + 8) = 0;
          *(_BYTE *)(v17 + 16) = 3;
          swift_willThrow();
          return swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        type metadata accessor for ResourceManifestError();
        sub_23A866A90();
        swift_allocError();
        swift_storeEnumTagMultiPayload();
        return swift_willThrow();
      }
    }
LABEL_18:
    v8 = (v14 - 1) & v14;
    while (!*(_QWORD *)(v12 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v12 = FileMeasurement.hashTypes()();
      result = swift_bridgeObjectRelease();
      if (v1)
        return swift_release();
      if (!v8)
        goto LABEL_8;
LABEL_7:
      v8 &= v8 - 1;
    }
    swift_bridgeObjectRetain();
    FileMeasurement.hashTypes()();
    if (!v1)
    {
      swift_bridgeObjectRelease();
      v16 = swift_bridgeObjectRetain();
      v12 = sub_23A8668D4(v16, v12);
      result = swift_bridgeObjectRelease_n();
      if (!v8)
        continue;
      goto LABEL_7;
    }
    break;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

BOOL sub_23A8662E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23A8662FC()
{
  sub_23A86A6A0();
  sub_23A86A6AC();
  return sub_23A86A6C4();
}

uint64_t sub_23A866340()
{
  return sub_23A86A6AC();
}

uint64_t sub_23A866368()
{
  sub_23A86A6A0();
  sub_23A86A6AC();
  return sub_23A86A6C4();
}

uint64_t sub_23A8663A8()
{
  _BYTE *v0;

  if (*v0)
    return 0x656372756F736572;
  else
    return 0x6E6F6973726576;
}

uint64_t sub_23A8663E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A868468(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A86640C()
{
  sub_23A866AD8();
  return sub_23A86A6E8();
}

uint64_t sub_23A866434()
{
  sub_23A866AD8();
  return sub_23A86A6F4();
}

uint64_t ResourceManifest.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ResourceManifest.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23A86649C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[8];
  uint64_t v11;
  char v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4238);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A866AD8();
  sub_23A86A6DC();
  swift_beginAccess();
  v12 = 0;
  sub_23A86A628();
  if (!v2)
  {
    swift_beginAccess();
    v11 = *(_QWORD *)(v3 + 24);
    v10[7] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4248);
    sub_23A866B60(&qword_2569C4250, (uint64_t (*)(void))sub_23A866B1C, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
    sub_23A86A634();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t ResourceManifest.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  ResourceManifest.init(from:)(a1);
  return v2;
}

uint64_t ResourceManifest.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;

  v3 = v1;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4260);
  v5 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v1 + 16) = 1;
  v8 = (uint64_t *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A866AD8();
  sub_23A86A6D0();
  if (v2)
  {
    type metadata accessor for ResourceManifest();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v9 = v5;
    v16 = 0;
    v10 = v14;
    v11 = sub_23A86A604();
    swift_beginAccess();
    *v8 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4248);
    v15 = 1;
    sub_23A866B60(&qword_2569C4268, (uint64_t (*)(void))sub_23A866BD4, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
    sub_23A86A610();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v10);
    *(_QWORD *)(v3 + 24) = v17;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t sub_23A866840@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  type metadata accessor for ResourceManifest();
  v5 = swift_allocObject();
  result = ResourceManifest.init(from:)(a1);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t sub_23A866894(_QWORD *a1)
{
  return sub_23A86649C(a1);
}

unint64_t sub_23A8668B4()
{
  return sub_23A865EC4();
}

uint64_t sub_23A8668D4(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    v7 = sub_23A8674EC((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    v7 = sub_23A8674EC((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x23B858F0C](v8, -1, -1);
  }
  return v7;
}

uint64_t type metadata accessor for ResourceManifestError()
{
  uint64_t result;

  result = qword_2569C43F0;
  if (!qword_2569C43F0)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23A866A90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569C4048;
  if (!qword_2569C4048)
  {
    v1 = type metadata accessor for ResourceManifestError();
    result = MEMORY[0x23B858E94](&unk_23A86B4C8, v1);
    atomic_store(result, (unint64_t *)&qword_2569C4048);
  }
  return result;
}

unint64_t sub_23A866AD8()
{
  unint64_t result;

  result = qword_2569C4240;
  if (!qword_2569C4240)
  {
    result = MEMORY[0x23B858E94](&unk_23A86B478, &type metadata for ResourceManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C4240);
  }
  return result;
}

unint64_t sub_23A866B1C()
{
  unint64_t result;

  result = qword_2569C4258;
  if (!qword_2569C4258)
  {
    result = MEMORY[0x23B858E94](&protocol conformance descriptor for FileMeasurement, &type metadata for FileMeasurement);
    atomic_store(result, (unint64_t *)&qword_2569C4258);
  }
  return result;
}

uint64_t sub_23A866B60(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2569C4248);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x23B858E94](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23A866BD4()
{
  unint64_t result;

  result = qword_2569C4270;
  if (!qword_2569C4270)
  {
    result = MEMORY[0x23B858E94](&protocol conformance descriptor for FileMeasurement, &type metadata for FileMeasurement);
    atomic_store(result, (unint64_t *)&qword_2569C4270);
  }
  return result;
}

uint64_t sub_23A866C18@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return result;
}

uint64_t sub_23A866C5C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_QWORD *)(v3 + 16) = v2;
  return result;
}

uint64_t sub_23A866C9C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for ResourceManifest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ResourceManifest.version.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of ResourceManifest.version.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of ResourceManifest.version.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of ResourceManifest.resources.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of ResourceManifest.resources.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of ResourceManifest.resources.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of ResourceManifest.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of ResourceManifest.bestDigestAlgorithm()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of ResourceManifest.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of ResourceManifest.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t storeEnumTagSinglePayload for ResourceManifest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A866DE4 + 4 * byte_23A86B2B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A866E18 + 4 * byte_23A86B2B0[v4]))();
}

uint64_t sub_23A866E18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A866E20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A866E28);
  return result;
}

uint64_t sub_23A866E34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A866E3CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A866E40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A866E48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ResourceManifest.CodingKeys()
{
  return &type metadata for ResourceManifest.CodingKeys;
}

uint64_t *sub_23A866E64(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  unsigned int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = sub_23A86A3DC();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_23A866F78(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
    return swift_bridgeObjectRelease();
  if (result <= 1)
  {
    v3 = sub_23A86A3DC();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

_QWORD *sub_23A866FE0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unsigned int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload > 1)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_23A86A3DC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *sub_23A8670CC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unsigned int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_23A8671D0((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload > 1)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_23A86A3DC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_23A8671D0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ResourceManifestError();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_23A86720C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_23A86A3DC();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_23A8672D0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23A8671D0((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_23A86A3DC();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_23A8673A4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A86A3DC();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_23A867418()
{
  unint64_t result;

  result = qword_2569C4428;
  if (!qword_2569C4428)
  {
    result = MEMORY[0x23B858E94](&unk_23A86B450, &type metadata for ResourceManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C4428);
  }
  return result;
}

unint64_t sub_23A867460()
{
  unint64_t result;

  result = qword_2569C4430;
  if (!qword_2569C4430)
  {
    result = MEMORY[0x23B858E94](&unk_23A86B3C0, &type metadata for ResourceManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C4430);
  }
  return result;
}

unint64_t sub_23A8674A8()
{
  unint64_t result;

  result = qword_2569C4438;
  if (!qword_2569C4438)
  {
    result = MEMORY[0x23B858E94](&unk_23A86B3E8, &type metadata for ResourceManifest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569C4438);
  }
  return result;
}

uint64_t sub_23A8674EC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t i;
  unint64_t v25;
  BOOL v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  int v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t *v43;
  uint64_t v44;
  int64_t v45;
  int64_t v46;

  v43 = (unint64_t *)result;
  v6 = 0;
  if (*(_QWORD *)(a4 + 16) < *(_QWORD *)(a3 + 16))
  {
    v7 = 0;
    v8 = a4 + 56;
    v9 = 1 << *(_BYTE *)(a4 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(a4 + 56);
    v45 = (unint64_t)(v9 + 63) >> 6;
    v12 = a3 + 56;
    while (1)
    {
LABEL_6:
      if (v11)
      {
        v13 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v14 = v13 | (v7 << 6);
      }
      else
      {
        v15 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
          __break(1u);
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
        if (v15 >= v45)
          goto LABEL_60;
        v16 = *(_QWORD *)(v8 + 8 * v15);
        ++v7;
        if (!v16)
        {
          v7 = v15 + 1;
          if (v15 + 1 >= v45)
            goto LABEL_60;
          v16 = *(_QWORD *)(v8 + 8 * v7);
          if (!v16)
          {
            v7 = v15 + 2;
            if (v15 + 2 >= v45)
              goto LABEL_60;
            v16 = *(_QWORD *)(v8 + 8 * v7);
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v45)
              {
LABEL_60:
                swift_retain();
                return sub_23A867908(v43, a2, v6, a3);
              }
              v16 = *(_QWORD *)(v8 + 8 * v17);
              if (!v16)
              {
                while (1)
                {
                  v7 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    break;
                  if (v7 >= v45)
                    goto LABEL_60;
                  v16 = *(_QWORD *)(v8 + 8 * v7);
                  ++v17;
                  if (v16)
                    goto LABEL_21;
                }
LABEL_63:
                __break(1u);
                goto LABEL_64;
              }
              v7 = v17;
            }
          }
        }
LABEL_21:
        v11 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v7 << 6);
      }
      v18 = *(_DWORD *)(*(_QWORD *)(a4 + 48) + 4 * v14);
      sub_23A86A6A0();
      sub_23A86A6B8();
      result = sub_23A86A6C4();
      v19 = -1 << *(_BYTE *)(a3 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      v22 = 1 << v20;
      if (((1 << v20) & *(_QWORD *)(v12 + 8 * (v20 >> 6))) != 0)
      {
        v23 = *(_QWORD *)(a3 + 48);
        if (*(_DWORD *)(v23 + 4 * v20) != v18)
        {
          for (i = v20 + 1; ; i = v25 + 1)
          {
            v25 = i & ~v19;
            if (((*(_QWORD *)(v12 + ((v25 >> 3) & 0xFFFFFFFFFFFFF8)) >> v25) & 1) == 0)
              goto LABEL_6;
            if (*(_DWORD *)(v23 + 4 * v25) == v18)
              break;
          }
          v21 = v25 >> 6;
          v22 = 1 << v25;
        }
        v43[v21] |= v22;
        v26 = __OFADD__(v6++, 1);
        if (v26)
          break;
      }
    }
    __break(1u);
  }
  v27 = 0;
  v44 = a3 + 56;
  v28 = 1 << *(_BYTE *)(a3 + 32);
  if (v28 < 64)
    v29 = ~(-1 << v28);
  else
    v29 = -1;
  v30 = v29 & *(_QWORD *)(a3 + 56);
  v46 = (unint64_t)(v28 + 63) >> 6;
  v31 = a4 + 56;
  while (v30)
  {
    v32 = __clz(__rbit64(v30));
    v30 &= v30 - 1;
    v33 = v32 | (v27 << 6);
LABEL_52:
    v37 = *(_DWORD *)(*(_QWORD *)(a3 + 48) + 4 * v33);
    sub_23A86A6A0();
    sub_23A86A6B8();
    result = sub_23A86A6C4();
    v38 = -1 << *(_BYTE *)(a4 + 32);
    v39 = result & ~v38;
    if (((*(_QWORD *)(v31 + ((v39 >> 3) & 0xFFFFFFFFFFFFF8)) >> v39) & 1) != 0)
    {
      v40 = *(_QWORD *)(a4 + 48);
      if (*(_DWORD *)(v40 + 4 * v39) == v37)
      {
LABEL_57:
        *(unint64_t *)((char *)v43 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
        v26 = __OFADD__(v6++, 1);
        if (v26)
        {
          __break(1u);
          goto LABEL_60;
        }
      }
      else
      {
        v41 = ~v38;
        while (1)
        {
          v39 = (v39 + 1) & v41;
          if (((*(_QWORD *)(v31 + ((v39 >> 3) & 0xFFFFFFFFFFFFF8)) >> v39) & 1) == 0)
            break;
          if (*(_DWORD *)(v40 + 4 * v39) == v37)
            goto LABEL_57;
        }
      }
    }
  }
  v34 = v27 + 1;
  if (__OFADD__(v27, 1))
    goto LABEL_62;
  if (v34 >= v46)
    goto LABEL_60;
  v35 = *(_QWORD *)(v44 + 8 * v34);
  ++v27;
  if (v35)
    goto LABEL_51;
  v27 = v34 + 1;
  if (v34 + 1 >= v46)
    goto LABEL_60;
  v35 = *(_QWORD *)(v44 + 8 * v27);
  if (v35)
    goto LABEL_51;
  v27 = v34 + 2;
  if (v34 + 2 >= v46)
    goto LABEL_60;
  v35 = *(_QWORD *)(v44 + 8 * v27);
  if (v35)
  {
LABEL_51:
    v30 = (v35 - 1) & v35;
    v33 = __clz(__rbit64(v35)) + (v27 << 6);
    goto LABEL_52;
  }
  v36 = v34 + 3;
  if (v36 >= v46)
    goto LABEL_60;
  v35 = *(_QWORD *)(v44 + 8 * v36);
  if (v35)
  {
    v27 = v36;
    goto LABEL_51;
  }
  while (1)
  {
    v27 = v36 + 1;
    if (__OFADD__(v36, 1))
      break;
    if (v27 >= v46)
      goto LABEL_60;
    v35 = *(_QWORD *)(v44 + 8 * v27);
    ++v36;
    if (v35)
      goto LABEL_51;
  }
LABEL_64:
  __break(1u);
  return result;
}

uint64_t sub_23A867908(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t *v28;

  v4 = a4;
  if (!a3)
  {
    v9 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C3F78);
  result = sub_23A86A55C();
  v9 = result;
  v28 = a1;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= a2)
      goto LABEL_36;
    v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= a2)
        goto LABEL_36;
      v16 = v28[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= a2)
          goto LABEL_36;
        v16 = v28[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * v14);
    sub_23A86A6A0();
    sub_23A86A6B8();
    result = sub_23A86A6C4();
    v19 = -1 << *(_BYTE *)(v9 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_DWORD *)(*(_QWORD *)(v9 + 48) + 4 * v22) = v18;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v17 = v15 + 3;
  if (v17 >= a2)
    goto LABEL_36;
  v16 = v28[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= a2)
      goto LABEL_36;
    v16 = v28[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

unint64_t sub_23A867B70(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_23A86A4F0();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_23A86A508();
  }
  __break(1u);
  return result;
}

unint64_t sub_23A867C0C(uint64_t a1, uint64_t a2)
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
  uint64_t v12;
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
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t result;
  void (*v34)(char *, uint64_t);
  int v35;
  uint64_t inited;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  char *v45;
  char *v46;
  char v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char isUniquelyReferenced_nonNull_native;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  id v68;
  __int128 v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  id v74;
  char *v75;
  _OWORD v76[2];
  _QWORD v77[5];
  char *v78;

  v3 = v2;
  v64 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4440);
  MEMORY[0x24BDAC7A8](v5);
  v73 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4448);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23A86A394();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v67 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23A86A3DC();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v72 = (char *)&v61 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v61 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v78 = (char *)&v61 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v75 = (char *)&v61 - v25;
  v66 = a1;
  if ((sub_23A865B10() & 1) == 0)
    goto LABEL_4;
  v65 = v10;
  v71 = v17;
  v26 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4450);
  v27 = swift_allocObject();
  v69 = xmmword_23A86ACA0;
  *(_OWORD *)(v27 + 16) = xmmword_23A86ACA0;
  v28 = (void *)*MEMORY[0x24BDBCC60];
  *(_QWORD *)(v27 + 32) = *MEMORY[0x24BDBCC60];
  v68 = v28;
  v29 = (void *)sub_23A86A52C();

  swift_bridgeObjectRelease();
  v74 = v29;
  if (!v29)
  {
LABEL_4:
    type metadata accessor for ResourceManifestError();
    sub_23A866A90();
    swift_allocError();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v32, v66, v13);
    swift_storeEnumTagMultiPayload();
    return swift_willThrow();
  }
  v77[0] = 0x727574616E676973;
  v77[1] = 0xE900000000000065;
  v30 = v67;
  v31 = v65;
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v67, *MEMORY[0x24BDCD7A0], v65);
  sub_23A85C864();
  sub_23A86A3D0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v30, v31);
  swift_bridgeObjectRelease();
  v63 = MEMORY[0x24BEE4B00];
  v67 = (char *)(MEMORY[0x24BEE4AD8] + 8);
  while (1)
  {
    if (objc_msgSend(v74, sel_nextObject))
    {
      sub_23A86A538();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v76, 0, sizeof(v76));
    }
    sub_23A868564((uint64_t)v76, (uint64_t)v77);
    if (!v77[3])
    {
      sub_23A8685AC((uint64_t)v77, &qword_2569C4458);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v9, 1, 1, v13);
LABEL_27:

      (*(void (**)(char *, uint64_t))(v14 + 8))(v75, v13);
      sub_23A8685AC((uint64_t)v9, &qword_2569C4448);
      type metadata accessor for ResourceManifest();
      result = swift_allocObject();
      *(_QWORD *)(result + 16) = 1;
      *(_QWORD *)(result + 24) = v63;
      return result;
    }
    v35 = swift_dynamicCast();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v9, v35 ^ 1u, 1, v13);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v13) == 1)
      goto LABEL_27;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v78, v9, v13);
    sub_23A86A388();
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = v69;
    v37 = v68;
    *(_QWORD *)(inited + 32) = v68;
    v38 = v37;
    sub_23A85DE84(inited);
    swift_setDeallocating();
    type metadata accessor for URLResourceKey(0);
    swift_arrayDestroy();
    v39 = (uint64_t)v73;
    sub_23A86A3A0();
    if (v3)
    {
      MEMORY[0x23B858E40](v3);
      swift_bridgeObjectRelease();
      v40 = sub_23A86A310();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v39, 1, 1, v40);
      v3 = 0;
LABEL_16:
      sub_23A8685AC(v39, &qword_2569C4440);
      v44 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
LABEL_17:
      v46 = v71;
      v45 = v72;
      v44(v72, v22, v13);
      v44(v46, v75, v13);
      goto LABEL_18;
    }
    swift_bridgeObjectRelease();
    v41 = sub_23A86A310();
    v42 = v39;
    v43 = *(_QWORD *)(v41 - 8);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v43 + 56))(v42, 0, 1, v41);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v42, 1, v41) == 1)
    {
      v39 = v42;
      goto LABEL_16;
    }
    v65 = 0;
    v60 = sub_23A86A304();
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v41);
    v44 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
    if (v60 == 2)
    {
      v3 = v65;
      goto LABEL_17;
    }
    v45 = v72;
    v44(v72, v22, v13);
    v46 = v71;
    v44(v71, v75, v13);
    if ((v60 & 1) != 0)
    {
      v34 = *(void (**)(char *, uint64_t))(v14 + 8);
      v34(v46, v13);
      v34(v45, v13);
      v3 = v65;
      goto LABEL_6;
    }
    v3 = v65;
LABEL_18:
    v47 = MEMORY[0x23B858780](v45, v46);
    v34 = *(void (**)(char *, uint64_t))(v14 + 8);
    v34(v46, v13);
    v34(v45, v13);
    if ((v47 & 1) != 0)
      goto LABEL_6;
    sub_23A869DC4(v77);
    if (v3)
    {

      v34(v22, v13);
      v34(v78, v13);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(char *, uint64_t))v34)(v75, v13);
    }
    v62 = v77[0];
    v65 = sub_23A86A3B8();
    v48 = sub_23A86A3B8();
    v50 = v49;
    v65 = sub_23A86A4E4();
    swift_bridgeObjectRelease();
    result = v65 + 1;
    if (__OFADD__(v65, 1))
      break;
    v51 = sub_23A867B70(result, v48, v50);
    v65 = v52;
    v61 = v53;
    v55 = v54;
    swift_bridgeObjectRelease();
    v65 = MEMORY[0x23B8588A0](v51, v65, v61, v55);
    v57 = v56;
    swift_bridgeObjectRelease();
    v58 = v63;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v77[0] = v58;
    sub_23A8651C0(v62, v65, v57, isUniquelyReferenced_nonNull_native);
    v63 = v77[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    v34(v22, v13);
    v34(v78, v13);
  }
  __break(1u);
  return result;
}

uint64_t sub_23A868468(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_23A86A64C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656372756F736572 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23A86A64C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A868564(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C4458);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A8685AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t PackageValidator.init(signatureData:requireTrust:)(uint64_t a1, unint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, uint64_t a12, id a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  unint64_t v19;
  uint64_t v20;

  *(_QWORD *)(v16 + 40) = a1;
  *(_QWORD *)(v16 + 48) = a2;
  sub_23A868B60(a1, a2);
  sub_23A85E1F0(0, 0xF000000000000000);
  *(_BYTE *)(v16 + 32) = 0;
  v19 = *(_QWORD *)(v16 + 48);
  if (v19 >> 60 != 15)
    __asm { BR              X10 }
  sub_23A85C820();
  swift_allocError();
  *(_QWORD *)(v20 + 8) = 0;
  *(_QWORD *)(v20 + 16) = 0;
  *(_QWORD *)v20 = 1;
  *(_BYTE *)(v20 + 24) = 5;
  swift_willThrow();
  sub_23A85E1F0(a1, a2);
  sub_23A85E1F0(*(_QWORD *)(v16 + 40), *(_QWORD *)(v16 + 48));
  type metadata accessor for PackageValidator();
  swift_deallocPartialClassInstance();
  return v16;
}

uint64_t sub_23A868B60(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23A860E50(a1, a2);
  return a1;
}

uint64_t type metadata accessor for PackageValidator()
{
  return objc_opt_self();
}

unint64_t sub_23A868B94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569C4460;
  if (!qword_2569C4460)
  {
    v1 = type metadata accessor for ResourceManifest();
    result = MEMORY[0x23B858E94](&protocol conformance descriptor for ResourceManifest, v1);
    atomic_store(result, (unint64_t *)&qword_2569C4460);
  }
  return result;
}

uint64_t PackageValidator.deinit()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  sub_23A85E1F0(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  return v0;
}

uint64_t sub_23A868C08()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_23A868C3C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t (*sub_23A868C80())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t (*sub_23A868CBC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23A868CF8()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t sub_23A868D00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;

  swift_beginAccess();
  v10 = *(_QWORD *)(v4 + 16);
  swift_beginAccess();
  if (!*(_QWORD *)(*(_QWORD *)(v10 + 24) + 16))
    goto LABEL_9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A85DC40(a1, a2);
  if ((v11 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_9:
    sub_23A85C820();
    swift_allocError();
    *(_QWORD *)v19 = a1;
    *(_QWORD *)(v19 + 8) = a2;
    *(_QWORD *)(v19 + 16) = 0;
    *(_BYTE *)(v19 + 24) = 3;
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = FileMeasurement.hashTypes()();
  if (v5)
    return swift_bridgeObjectRelease();
  v13 = v12;
  v14 = 5;
  if (sub_23A868F88(5, v12) || (v14 = 2, sub_23A868F88(2, v13)))
  {
    swift_bridgeObjectRelease();
    v15 = sub_23A85E6E4(a3, a4, v14);
    v17 = v16;
    v21 = FileMeasurement.hashData(forDigestAlgorithm:)(v14);
    v23 = v22;
    swift_bridgeObjectRelease();
    sub_23A862418(v15, v17);
    if ((v24 & 1) == 0)
    {
      sub_23A85C820();
      swift_allocError();
      *(_QWORD *)v25 = a1;
      *(_QWORD *)(v25 + 8) = a2;
      *(_QWORD *)(v25 + 16) = 0;
      *(_BYTE *)(v25 + 24) = 1;
      swift_bridgeObjectRetain();
      swift_willThrow();
    }
    sub_23A85D734(v21, v23);
    return sub_23A85D734(v15, v17);
  }
  else
  {
    sub_23A85E688();
    swift_allocError();
    *(_QWORD *)v20 = 0;
    *(_QWORD *)(v20 + 8) = 0;
    *(_BYTE *)(v20 + 16) = 3;
    swift_willThrow();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

BOOL sub_23A868F88(int a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  int v12;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  sub_23A86A6A0();
  sub_23A86A6B8();
  v4 = sub_23A86A6C4();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(_DWORD *)(v8 + 4 * v6) == a1)
    return 1;
  v10 = ~v5;
  v11 = (v6 + 1) & v10;
  if (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
    return 0;
  do
  {
    v12 = *(_DWORD *)(v8 + 4 * v11);
    result = v12 == a1;
    if (v12 == a1)
      break;
    v11 = (v11 + 1) & v10;
  }
  while (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_23A86907C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 16) = v2;
  swift_retain();
  return swift_release();
}

uint64_t PackageValidator.__allocating_init(signatureData:requireTrust:)(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t vars0;

  v6 = swift_allocObject();
  PackageValidator.init(signatureData:requireTrust:)(a1, a2, a3, v7, v8, v9, v10, v11, v13, v14, SHIDWORD(v14), v15, v16, v17, v18, vars0);
  return v6;
}

uint64_t sub_23A86913C(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_23A86A598();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_23A8698C0(i, (uint64_t)v5);
    type metadata accessor for SecCertificate(0);
    if (!swift_dynamicCast())
      break;
    sub_23A86A580();
    sub_23A86A5A4();
    sub_23A86A5B0();
    sub_23A86A58C();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

uint64_t PackageValidator.__allocating_init(signatureData:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 216))(a1, a2, 1);
}

uint64_t PackageValidator.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  sub_23A85E1F0(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  return swift_deallocClassInstance();
}

BOOL _s11EDPSecurity21PackageValidatorErrorO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  id v25;
  id v26;

  v2 = *(void **)a1;
  v3 = *(void **)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(void **)a2;
  v6 = *(void **)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_BYTE *)(a1 + 24);
  v9 = *(_BYTE *)(a2 + 24);
  sub_23A85C820();
  v10 = swift_allocError();
  *(_QWORD *)v11 = v2;
  *(_QWORD *)(v11 + 8) = v3;
  *(_QWORD *)(v11 + 16) = v4;
  *(_BYTE *)(v11 + 24) = v8;
  sub_23A86952C(v2, v3, v4, v8);
  v12 = (void *)sub_23A86A370();
  MEMORY[0x23B858E40](v10);
  v13 = swift_allocError();
  *(_QWORD *)v14 = v5;
  *(_QWORD *)(v14 + 8) = v6;
  *(_QWORD *)(v14 + 16) = v7;
  *(_BYTE *)(v14 + 24) = v9;
  sub_23A86952C(v5, v6, v7, v9);
  v15 = (void *)sub_23A86A370();
  MEMORY[0x23B858E40](v13);
  v16 = objc_msgSend(v12, sel_domain);
  v17 = sub_23A86A4C0();
  v19 = v18;

  v20 = objc_msgSend(v15, sel_domain);
  v21 = sub_23A86A4C0();
  v23 = v22;

  if (v17 == v21 && v19 == v23)
  {
    swift_bridgeObjectRelease_n();
LABEL_5:
    v25 = objc_msgSend(v12, sel_code);
    v26 = objc_msgSend(v15, sel_code);

    return v25 == v26;
  }
  v24 = sub_23A86A64C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v24 & 1) != 0)
    goto LABEL_5;

  return 0;
}

uint64_t sub_23A869464@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return swift_retain();
}

uint64_t sub_23A8694B0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t initializeBufferWithCopyOfBuffer for PackageValidatorError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

id sub_23A86952C(id result, id a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
      result = result;
      break;
    case 1:
    case 2:
    case 3:
      goto LABEL_4;
    case 4:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_4:
      result = (id)swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for PackageValidatorError(uint64_t a1)
{
  return sub_23A8695B8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t sub_23A8695B8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  switch(a4)
  {
    case 0:
      JUMPOUT(0x23B858E40);
    case 1:
    case 2:
    case 3:
      goto LABEL_3;
    case 4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_3:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for PackageValidatorError(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23A86952C(*(id *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for PackageValidatorError(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23A86952C(*(id *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_23A8695B8(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PackageValidatorError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_23A8695B8(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for PackageValidatorError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 5)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PackageValidatorError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 251;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A8697E8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 4u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 5);
}

uint64_t sub_23A869800(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 5;
  if (a2 >= 5)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 5;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PackageValidatorError()
{
  return &type metadata for PackageValidatorError;
}

uint64_t method lookup function for PackageValidator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PackageValidator.manifest.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of PackageValidator.manifest.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of PackageValidator.manifest.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of PackageValidator.certificateChain.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of PackageValidator.certificateChain.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of PackageValidator.certificateChain.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of PackageValidator.isTrustedSignature.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of PackageValidator.__allocating_init(signatureData:requireTrust:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of PackageValidator.validateResource(_:withData:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t sub_23A8698C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t FileMeasurer.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  FileMeasurer.init(_:)(a1);
  return v2;
}

uint64_t FileMeasurer.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_23A85E0B0((uint64_t)&unk_250BAD738);
  return v0;
}

uint64_t sub_23A869988()
{
  uint64_t result;

  result = sub_23A85E0B0((uint64_t)&unk_250BAD5D0);
  qword_2569C4690 = result;
  return result;
}

uint64_t sub_23A8699AC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A869A08()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A869A3C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t FileMeasurer.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = sub_23A85E0B0((uint64_t)&unk_250BAD760);
  return v0;
}

uint64_t FileMeasurer.init(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *(_QWORD *)(v1 + 16) = sub_23A85E0B0((uint64_t)&unk_250BAD5F8);
  v3 = a1 + 56;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
LABEL_5:
  while (v6)
  {
    v10 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v11 = v10 | (v9 << 6);
LABEL_18:
    v15 = *(unsigned int *)(*(_QWORD *)(a1 + 48) + 4 * v11);
    if (qword_2569C3DB8 != -1)
      swift_once();
    v16 = qword_2569C4690;
    if (!*(_QWORD *)(qword_2569C4690 + 16))
      goto LABEL_31;
    sub_23A86A6A0();
    sub_23A86A6B8();
    result = sub_23A86A6C4();
    v17 = -1 << *(_BYTE *)(v16 + 32);
    v18 = result & ~v17;
    if (((*(_QWORD *)(v16 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
      goto LABEL_31;
    v19 = *(_QWORD *)(v16 + 48);
    if (*(_DWORD *)(v19 + 4 * v18) != (_DWORD)v15)
    {
      v20 = ~v17;
      while (1)
      {
        v18 = (v18 + 1) & v20;
        if (((*(_QWORD *)(v16 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
          break;
        if (*(_DWORD *)(v19 + 4 * v18) == (_DWORD)v15)
          goto LABEL_5;
      }
LABEL_31:
      v21 = v1;
      swift_release();
      swift_bridgeObjectRelease();
      sub_23A85E688();
      swift_allocError();
      *(_QWORD *)v22 = v15;
      *(_QWORD *)(v22 + 8) = 0;
      *(_BYTE *)(v22 + 16) = 1;
      swift_willThrow();
      swift_release();
      return v21;
    }
  }
  if (__OFADD__(v9++, 1))
  {
    __break(1u);
    goto LABEL_35;
  }
  if (v9 >= v7)
    goto LABEL_33;
  v13 = *(_QWORD *)(v3 + 8 * v9);
  if (v13)
  {
LABEL_17:
    v6 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v9 << 6);
    goto LABEL_18;
  }
  v14 = v9 + 1;
  if (v9 + 1 >= v7)
    goto LABEL_33;
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
    goto LABEL_16;
  v14 = v9 + 2;
  if (v9 + 2 >= v7)
    goto LABEL_33;
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
    goto LABEL_16;
  v14 = v9 + 3;
  if (v9 + 3 >= v7)
  {
LABEL_33:
    swift_release();
    v21 = v1;
    swift_beginAccess();
    *(_QWORD *)(v1 + 16) = a1;
    swift_bridgeObjectRelease();
    return v21;
  }
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
  {
LABEL_16:
    v9 = v14;
    goto LABEL_17;
  }
  while (1)
  {
    v9 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v9 >= v7)
      goto LABEL_33;
    v13 = *(_QWORD *)(v3 + 8 * v9);
    ++v14;
    if (v13)
      goto LABEL_17;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t static FileMeasurer.measureFile(_:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t inited;

  type metadata accessor for FileMeasurer();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = sub_23A85E0B0((uint64_t)&unk_250BAD788);
  sub_23A869DC4(a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A869DC4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  char isUniquelyReferenced_nonNull_native;
  char v28;
  unint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  char v33;
  unint64_t v34;
  char v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t result;
  uint64_t v41;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;

  v3 = v2;
  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v4 + 56);
  v43 = v4 + 56;
  v6 = 1 << *(_BYTE *)(v4 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v5;
  v44 = (unint64_t)(v6 + 63) >> 6;
  v45 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  v9 = 0;
  v10 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    if (v8)
    {
      v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v13 = v12 | (v9 << 6);
    }
    else
    {
      v14 = __OFADD__(v9++, 1);
      if (v14)
        goto LABEL_42;
      if (v9 >= v44)
      {
LABEL_38:
        swift_release();
        return sub_23A85F190((uint64_t)v10, a1);
      }
      v15 = *(_QWORD *)(v43 + 8 * v9);
      if (!v15)
      {
        v16 = v9 + 1;
        if (v9 + 1 >= v44)
          goto LABEL_38;
        v15 = *(_QWORD *)(v43 + 8 * v16);
        if (!v15)
        {
          v16 = v9 + 2;
          if (v9 + 2 >= v44)
            goto LABEL_38;
          v15 = *(_QWORD *)(v43 + 8 * v16);
          if (!v15)
          {
            v16 = v9 + 3;
            if (v9 + 3 >= v44)
              goto LABEL_38;
            v15 = *(_QWORD *)(v43 + 8 * v16);
            if (!v15)
            {
              while (1)
              {
                v9 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_43;
                if (v9 >= v44)
                  goto LABEL_38;
                v15 = *(_QWORD *)(v43 + 8 * v9);
                ++v16;
                if (v15)
                  goto LABEL_18;
              }
            }
          }
        }
        v9 = v16;
      }
LABEL_18:
      v8 = (v15 - 1) & v15;
      v13 = __clz(__rbit64(v15)) + (v9 << 6);
    }
    v17 = *(unsigned int *)(*(_QWORD *)(v45 + 48) + 4 * v13);
    if ((_DWORD)v17 == 2)
    {
      v18 = 0x3268736168;
    }
    else
    {
      if ((_DWORD)v17 != 5)
      {
        sub_23A85E688();
        swift_allocError();
        *(_QWORD *)v41 = v17;
        *(_QWORD *)(v41 + 8) = 0;
        *(_BYTE *)(v41 + 16) = 1;
        swift_willThrow();
        swift_bridgeObjectRelease();
        return swift_release();
      }
      v18 = 0x3568736168;
    }
    v46 = v18;
    v19 = sub_23A86A3E8();
    if (v3)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    v21 = v19;
    v22 = v20;
    v3 = 0;
    v23 = sub_23A85E6E4(v19, v20, v17);
    v25 = v24;
    v26 = v9;
    sub_23A85D734(v21, v22);
    sub_23A860E50(v23, v25);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v29 = sub_23A85DC40(v46, 0xE500000000000000);
    v30 = v10[2];
    v31 = (v28 & 1) == 0;
    v32 = v30 + v31;
    if (__OFADD__(v30, v31))
      break;
    v33 = v28;
    if (v10[3] >= v32)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_23A8614B4();
    }
    else
    {
      sub_23A860E94(v32, isUniquelyReferenced_nonNull_native);
      v34 = sub_23A85DC40(v46, 0xE500000000000000);
      if ((v33 & 1) != (v35 & 1))
        goto LABEL_44;
      v29 = v34;
    }
    v9 = v26;
    if ((v33 & 1) != 0)
    {
      v11 = v10[7] + 16 * v29;
      sub_23A85D734(*(_QWORD *)v11, *(_QWORD *)(v11 + 8));
      *(_QWORD *)v11 = v23;
      *(_QWORD *)(v11 + 8) = v25;
    }
    else
    {
      v10[(v29 >> 6) + 8] |= 1 << v29;
      v36 = (uint64_t *)(v10[6] + 16 * v29);
      *v36 = v46;
      v36[1] = 0xE500000000000000;
      v37 = (uint64_t *)(v10[7] + 16 * v29);
      *v37 = v23;
      v37[1] = v25;
      v38 = v10[2];
      v14 = __OFADD__(v38, 1);
      v39 = v38 + 1;
      if (v14)
        goto LABEL_41;
      v10[2] = v39;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23A85D734(v23, v25);
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  result = sub_23A86A664();
  __break(1u);
  return result;
}

uint64_t FileMeasurer.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FileMeasurer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FileMeasurer()
{
  return objc_opt_self();
}

uint64_t sub_23A86A204@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for FileMeasurer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FileMeasurer.hashingAlgorithms.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of FileMeasurer.hashingAlgorithms.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of FileMeasurer.hashingAlgorithms.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of FileMeasurer.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FileMeasurer.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of FileMeasurer.measureFile(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t sub_23A86A2BC()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_23A86A2C8()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23A86A2D4()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23A86A2E0()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23A86A2EC()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_23A86A2F8()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_23A86A304()
{
  return MEMORY[0x24BDCC710]();
}

uint64_t sub_23A86A310()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_23A86A31C()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_23A86A328()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_23A86A334()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_23A86A340()
{
  return MEMORY[0x24BDCCA58]();
}

uint64_t sub_23A86A34C()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_23A86A358()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_23A86A364()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_23A86A370()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23A86A37C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23A86A388()
{
  return MEMORY[0x24BDCD730]();
}

uint64_t sub_23A86A394()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_23A86A3A0()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_23A86A3AC()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_23A86A3B8()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_23A86A3C4()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_23A86A3D0()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_23A86A3DC()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23A86A3E8()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_23A86A3F4()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_23A86A400()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23A86A40C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23A86A418()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_23A86A424()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23A86A430()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23A86A43C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23A86A448()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_23A86A454()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t sub_23A86A460()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t sub_23A86A46C()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_23A86A478()
{
  return MEMORY[0x24BDC6348]();
}

uint64_t sub_23A86A484()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_23A86A490()
{
  return MEMORY[0x24BDC6B38]();
}

uint64_t sub_23A86A49C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A86A4A8()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_23A86A4B4()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23A86A4C0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A86A4CC()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_23A86A4D8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A86A4E4()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_23A86A4F0()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_23A86A4FC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A86A508()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23A86A514()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23A86A520()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23A86A52C()
{
  return MEMORY[0x24BDCFF40]();
}

uint64_t sub_23A86A538()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A86A544()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23A86A550()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23A86A55C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23A86A568()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A86A574()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23A86A580()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23A86A58C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23A86A598()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23A86A5A4()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23A86A5B0()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23A86A5BC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23A86A5C8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23A86A5D4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23A86A5E0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23A86A5EC()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23A86A5F8()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23A86A604()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23A86A610()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23A86A61C()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23A86A628()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23A86A634()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23A86A640()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A86A64C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A86A658()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23A86A664()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A86A670()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A86A67C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23A86A688()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A86A694()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A86A6A0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A86A6AC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A86A6B8()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23A86A6C4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23A86A6D0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23A86A6DC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23A86A6E8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23A86A6F4()
{
  return MEMORY[0x24BEE4A10]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x24BDE8A48](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x24BDE8A50](identityRef, privateKeyRef);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x24BDE8A98](key);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8B38](key, algorithm, dataToSign, error);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C28]();
}

uint64_t SecPolicyCreateEDPSigning()
{
  return MEMORY[0x24BDE8C40]();
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x24BDE8D90](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}


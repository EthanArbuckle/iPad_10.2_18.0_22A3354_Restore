uint64_t initializeBufferWithCopyOfBuffer for ASAuthorizationResult(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = v3;
  return a1;
}

void destroy for ASAuthorizationResult(id *a1)
{

}

uint64_t assignWithCopy for ASAuthorizationResult(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for ASAuthorizationResult(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationResult(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFA && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 250);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 6)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 250;
    if (a3 >= 0xFA)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFA)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_226329B14(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_226329B20(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationResult()
{
  return &type metadata for ASAuthorizationResult;
}

void type metadata accessor for ASWebAuthenticationSessionStorageMode(uint64_t a1)
{
  sub_22632AD3C(a1, &qword_255838BF0);
}

void type metadata accessor for ASAuthorizationCustomMethod(uint64_t a1)
{
  sub_22632AD3C(a1, &qword_255838BF8);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_22632AD3C(a1, &qword_255838C00);
}

uint64_t sub_226329B74@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v3 = 0;
LABEL_13:
    *(_QWORD *)a1 = result;
    *(_BYTE *)(a1 + 8) = v3;
    return result;
  }
  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v3 = 1;
    goto LABEL_13;
  }
  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v3 = 2;
    goto LABEL_13;
  }
  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v3 = 3;
    goto LABEL_13;
  }
  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v3 = 4;
    goto LABEL_13;
  }
  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v3 = 5;
    goto LABEL_13;
  }
  sub_226333EF4();
  sub_226333E28();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255838C90);
  sub_226333F18();
  result = sub_226333F24();
  __break(1u);
  return result;
}

uint64_t sub_226329D24(uint64_t a1, uint64_t a2)
{
  return sub_22632A758(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_226329D30(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_226333DF8();
  *a2 = 0;
  return result;
}

uint64_t sub_226329DA4(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_226333E04();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_226329E20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_226333E10();
  v2 = sub_226333DEC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_226329E60(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_226329E68@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_226329E7C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_226329E90@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_226329EA4(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_226329ED4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *sub_226329F00@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *sub_226329F24(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_226329F38(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_226329F4C(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_226329F60@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_226329F74(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_226329F88(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_226329F9C(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_226329FB0()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_226329FC0()
{
  return sub_226333EDC();
}

_QWORD *sub_226329FD8(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_226329FEC()
{
  sub_22632A648(&qword_255838CF8, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationError, (uint64_t)&unk_226334C04);
  return sub_226333F78();
}

uint64_t sub_22632A02C()
{
  sub_22632A648(&qword_255838CF8, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationError, (uint64_t)&unk_226334C04);
  return sub_226333F6C();
}

uint64_t sub_22632A070()
{
  sub_22632A648(&qword_255838D30, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationError, (uint64_t)&unk_226334C48);
  return sub_226333C00();
}

id sub_22632A0B0()
{
  id *v0;

  return *v0;
}

uint64_t sub_22632A0B8@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_22632A0C0()
{
  sub_22632A648(&qword_255838D38, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_226334AD8);
  return sub_226333F78();
}

uint64_t sub_22632A100()
{
  sub_22632A648(&qword_255838D38, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_226334AD8);
  return sub_226333F6C();
}

uint64_t sub_22632A140()
{
  sub_22632A648(&qword_255838D68, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_226334D58);
  return sub_226333C00();
}

uint64_t sub_22632A180@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_22632AE04(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

_QWORD *sub_22632A1BC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_22632A1C8()
{
  return sub_226333E10();
}

uint64_t sub_22632A1D8()
{
  sub_22632A648(&qword_255838D30, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationError, (uint64_t)&unk_226334C48);
  return sub_226333C3C();
}

uint64_t sub_22632A218()
{
  sub_22632A648(&qword_255838D30, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationError, (uint64_t)&unk_226334C48);
  return sub_226333C18();
}

uint64_t sub_22632A258(void *a1)
{
  id v2;

  sub_22632A648(&qword_255838D30, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationError, (uint64_t)&unk_226334C48);
  v2 = a1;
  return sub_226333C0C();
}

uint64_t sub_22632A2BC()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = sub_226333ED0();

  return v2;
}

uint64_t sub_22632A2F0()
{
  sub_22632A648(&qword_255838D30, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationError, (uint64_t)&unk_226334C48);
  return sub_226333C30();
}

_QWORD *sub_22632A344@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_22632A354(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_22632A360()
{
  return sub_226333E10();
}

uint64_t sub_22632A370()
{
  sub_22632A648(&qword_255838D68, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_226334D58);
  return sub_226333C3C();
}

uint64_t sub_22632A3B0()
{
  sub_22632A648(&qword_255838D68, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_226334D58);
  return sub_226333C18();
}

uint64_t sub_22632A3F0(void *a1)
{
  id v2;

  sub_22632A648(&qword_255838D68, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_226334D58);
  v2 = a1;
  return sub_226333C0C();
}

uint64_t sub_22632A454()
{
  sub_22632A648(&qword_255838D68, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_226334D58);
  return sub_226333C30();
}

uint64_t sub_22632A4A4()
{
  sub_226333F90();
  sub_226333DE0();
  return sub_226333FA8();
}

uint64_t sub_22632A500@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_226333DEC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22632A544@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_226333E10();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22632A56C()
{
  sub_22632A648(&qword_255838C20, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationCustomMethod, (uint64_t)&unk_2263346C0);
  sub_22632A648(&qword_255838C28, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationCustomMethod, (uint64_t)&unk_226334660);
  return sub_226333F3C();
}

uint64_t sub_22632A5F0()
{
  return sub_22632A648(&qword_255838C08, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationCustomMethod, (uint64_t)&unk_226334624);
}

uint64_t sub_22632A61C()
{
  return sub_22632A648(&qword_255838C10, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationCustomMethod, (uint64_t)&unk_2263345F8);
}

uint64_t sub_22632A648(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2276959F0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22632A688()
{
  sub_22632A648(&qword_255838D30, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationError, (uint64_t)&unk_226334C48);
  return sub_226333C24();
}

BOOL sub_22632A6E0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22632A6F4()
{
  sub_22632A648(&qword_255838D68, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_226334D58);
  return sub_226333C24();
}

uint64_t sub_22632A74C(uint64_t a1, uint64_t a2)
{
  return sub_22632A758(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_22632A758(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_226333E10();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22632A794()
{
  sub_226333E10();
  sub_226333E1C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22632A7D4()
{
  uint64_t v0;

  sub_226333E10();
  sub_226333F90();
  sub_226333E1C();
  v0 = sub_226333FA8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22632A844()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_226333E10();
  v2 = v1;
  if (v0 == sub_226333E10() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_226333F48();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_22632A8CC()
{
  return sub_22632A648(&qword_255838C18, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationCustomMethod, (uint64_t)&unk_226334694);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2276959D8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void type metadata accessor for ASAuthorizationError(uint64_t a1)
{
  sub_22632AD3C(a1, &qword_255838C98);
}

void type metadata accessor for ASWebAuthenticationSessionError(uint64_t a1)
{
  sub_22632AD3C(a1, &qword_255838CA0);
}

void type metadata accessor for ButtonType(uint64_t a1)
{
  sub_22632AD3C(a1, &qword_255838CA8);
}

void type metadata accessor for RequestOptions(uint64_t a1)
{
  sub_22632AD3C(a1, &qword_255838CB0);
}

uint64_t sub_22632A988()
{
  return sub_22632A648(&qword_255838CB8, (uint64_t (*)(uint64_t))type metadata accessor for RequestOptions, (uint64_t)&unk_226334880);
}

uint64_t sub_22632A9B4()
{
  return sub_22632A648(&qword_255838CC0, (uint64_t (*)(uint64_t))type metadata accessor for RequestOptions, (uint64_t)&unk_22633484C);
}

uint64_t sub_22632A9E0()
{
  return sub_22632A648(&qword_255838CC8, (uint64_t (*)(uint64_t))type metadata accessor for RequestOptions, (uint64_t)&unk_2263348AC);
}

uint64_t sub_22632AA0C()
{
  return sub_22632A648(&qword_255838CD0, (uint64_t (*)(uint64_t))type metadata accessor for RequestOptions, (uint64_t)&unk_2263348E8);
}

uint64_t sub_22632AA38()
{
  return sub_22632A648(&qword_255838CD8, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_2263349F0);
}

uint64_t sub_22632AA64()
{
  return sub_22632A648(&qword_255838CE0, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_226334A1C);
}

uint64_t sub_22632AA90()
{
  return sub_22632A648(&qword_255838CE8, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationError, (uint64_t)&unk_226334B1C);
}

uint64_t sub_22632AABC()
{
  return sub_22632A648(&qword_255838CF0, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationError, (uint64_t)&unk_226334B48);
}

uint64_t sub_22632AAE8()
{
  return sub_22632A648(&qword_255838CF8, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationError, (uint64_t)&unk_226334C04);
}

uint64_t sub_22632AB14()
{
  return sub_22632A648(&qword_255838D00, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationError, (uint64_t)&unk_226334BD0);
}

uint64_t sub_22632AB40()
{
  return sub_22632A648(&qword_255838D08, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationError, (uint64_t)&unk_226334B8C);
}

uint64_t sub_22632AB6C()
{
  return sub_22632A648(&qword_255838D10, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_226334CF0);
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
  sub_22632AD3C(a1, &qword_255838D78);
}

uint64_t sub_22632ABAC()
{
  return sub_22632A648(&qword_255838D18, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_226334CB4);
}

unint64_t sub_22632ABDC()
{
  unint64_t result;

  result = qword_255838D20;
  if (!qword_255838D20)
  {
    result = MEMORY[0x2276959F0](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_255838D20);
  }
  return result;
}

uint64_t sub_22632AC20()
{
  return sub_22632A648(&qword_255838D28, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_226334D2C);
}

uint64_t sub_22632AC4C()
{
  return sub_22632A648(&qword_255838D30, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationError, (uint64_t)&unk_226334C48);
}

uint64_t sub_22632AC78()
{
  return sub_22632A648(&qword_255838D38, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_226334AD8);
}

uint64_t sub_22632ACA4()
{
  return sub_22632A648(&qword_255838D40, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_226334AA4);
}

uint64_t sub_22632ACD0()
{
  return sub_22632A648(&qword_255838D48, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_226334A60);
}

uint64_t sub_22632ACFC()
{
  return sub_22632A648(&qword_255838D50, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_226334E00);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_22632AD3C(a1, &qword_255838D70);
}

void sub_22632AD3C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22632AD80()
{
  return sub_22632A648(&qword_255838D58, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_226334DC4);
}

uint64_t sub_22632ADAC()
{
  return sub_22632A648(&qword_255838D60, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_226334E3C);
}

uint64_t sub_22632ADD8()
{
  return sub_22632A648(&qword_255838D68, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_226334D58);
}

uint64_t sub_22632AE04(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t AuthorizationController.performRequests(_:)(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 + 32) = a1;
  *(_QWORD *)(v3 + 40) = a2;
  *(_OWORD *)(v3 + 48) = *v2;
  *(_QWORD *)(v3 + 64) = sub_226333E88();
  *(_QWORD *)(v3 + 72) = sub_226333E7C();
  *(_QWORD *)(v3 + 80) = sub_226333E58();
  *(_QWORD *)(v3 + 88) = v4;
  return swift_task_switch();
}

uint64_t sub_22632AED0()
{
  _QWORD *v0;
  uint64_t v1;

  swift_bridgeObjectRetain();
  v0[12] = sub_226333E7C();
  v0[13] = sub_226333E58();
  v0[14] = v1;
  return swift_task_switch();
}

uint64_t sub_22632AF38()
{
  objc_super *v0;
  Class super_class;
  Class v2;
  id receiver;
  objc_class *v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_class *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;

  super_class = v0[3].super_class;
  v2 = v0[2].super_class;
  receiver = v0[3].receiver;
  v4 = (objc_class *)type metadata accessor for AuthorizationOperation();
  v5 = (char *)objc_allocWithZone(v4);
  v6 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255839070);
  v9 = swift_allocObject();
  *(_DWORD *)(v9 + 20) = 0;
  *(_BYTE *)(v9 + 16) = 0;
  *(_QWORD *)&v5[v8] = v9;
  *(_QWORD *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider] = 0;
  v10 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_requestContext];
  *(_QWORD *)v10 = v2;
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 0;
  v0[1].receiver = v5;
  v0[1].super_class = v4;
  swift_bridgeObjectRetain();
  v11 = (objc_class *)objc_msgSendSuper2(v0 + 1, sel_init);
  v0[7].super_class = v11;
  v12 = (_QWORD *)((char *)v11
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  v13 = *(_QWORD *)((char *)v11
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  *v12 = receiver;
  v12[1] = super_class;
  swift_retain();
  sub_22632D754(v13);
  v14 = swift_task_alloc();
  v0[8].receiver = (id)v14;
  *(_QWORD *)(v14 + 16) = v11;
  v15 = swift_task_alloc();
  v0[8].super_class = (Class)v15;
  *(_QWORD *)(v15 + 16) = v11;
  v0[9].receiver = (id)sub_226333E7C();
  v16 = (objc_class *)swift_task_alloc();
  v0[9].super_class = v16;
  *(_QWORD *)v16 = v0;
  *((_QWORD *)v16 + 1) = sub_22632B0F0;
  return sub_226333F54();
}

uint64_t sub_22632B0F0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_22632B178()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_22632B1C8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 120);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22632B240()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22632B274(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 24) = a3;
  *(_QWORD *)(v4 + 32) = a4;
  *(_QWORD *)(v4 + 16) = a1;
  *(_OWORD *)(v4 + 40) = *a2;
  *(_QWORD *)(v4 + 56) = sub_226333E88();
  *(_QWORD *)(v4 + 64) = sub_226333E7C();
  *(_QWORD *)(v4 + 72) = sub_226333E58();
  *(_QWORD *)(v4 + 80) = v5;
  return swift_task_switch();
}

uint64_t sub_22632B2F0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v1 = v0[6];
  v2 = v0[4];
  v3 = v0[5];
  v4 = objc_allocWithZone((Class)type metadata accessor for AuthorizationOperation());
  v5 = swift_bridgeObjectRetain();
  v6 = (char *)sub_22632E2BC(v5, v2);
  v0[11] = v6;
  v7 = &v6[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  v8 = *(_QWORD *)&v6[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  *(_QWORD *)v7 = v3;
  *((_QWORD *)v7 + 1) = v1;
  swift_retain();
  sub_22632D754(v8);
  v9 = swift_task_alloc();
  v0[12] = v9;
  *(_QWORD *)(v9 + 16) = v6;
  v10 = swift_task_alloc();
  v0[13] = v10;
  *(_QWORD *)(v10 + 16) = v6;
  v0[14] = sub_226333E7C();
  v11 = (_QWORD *)swift_task_alloc();
  v0[15] = v11;
  *v11 = v0;
  v11[1] = sub_22632B418;
  return sub_226333F54();
}

uint64_t sub_22632B418()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_22632B4A0()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22632B4EC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 88);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22632B560(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 24) = a3;
  *(_QWORD *)(v4 + 32) = a4;
  *(_QWORD *)(v4 + 16) = a1;
  *(_OWORD *)(v4 + 40) = *a2;
  *(_QWORD *)(v4 + 56) = sub_226333E88();
  *(_QWORD *)(v4 + 64) = sub_226333E7C();
  *(_QWORD *)(v4 + 72) = sub_226333E58();
  *(_QWORD *)(v4 + 80) = v5;
  return swift_task_switch();
}

void sub_22632B5DC()
{
  sub_22632C31C();
}

uint64_t sub_22632B608(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v2[11] = a1;
  v5 = (_QWORD *)(a1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  v6 = *(_QWORD *)(a1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  *v5 = v3;
  v5[1] = v1;
  swift_retain();
  sub_22632D754(v6);
  v7 = swift_task_alloc();
  v2[12] = v7;
  *(_QWORD *)(v7 + 16) = a1;
  v8 = swift_task_alloc();
  v2[13] = v8;
  *(_QWORD *)(v8 + 16) = a1;
  v2[14] = sub_226333E7C();
  v9 = (_QWORD *)swift_task_alloc();
  v2[15] = v9;
  *v9 = v2;
  v9[1] = sub_22632B6E0;
  return sub_226333F54();
}

uint64_t sub_22632B6E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_22632B768()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22632B7C4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 88);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AuthorizationController.performRequest(_:)(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 + 32) = a1;
  *(_QWORD *)(v3 + 40) = a2;
  *(_OWORD *)(v3 + 48) = *v2;
  *(_QWORD *)(v3 + 64) = sub_226333E88();
  *(_QWORD *)(v3 + 72) = sub_226333E7C();
  *(_QWORD *)(v3 + 80) = sub_226333E58();
  *(_QWORD *)(v3 + 88) = v4;
  return swift_task_switch();
}

uint64_t sub_22632B8B8()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v6;

  v1 = (void *)v0[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558391C0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_226334EC0;
  *(_QWORD *)(v2 + 32) = v1;
  v6 = v2;
  sub_226333E4C();
  v0[12] = v6;
  v3 = v1;
  v0[13] = sub_226333E7C();
  v0[14] = sub_226333E58();
  v0[15] = v4;
  return swift_task_switch();
}

uint64_t sub_22632B964()
{
  _QWORD *v0;
  uint64_t v1;

  swift_bridgeObjectRetain();
  v0[16] = sub_226333E7C();
  v0[17] = sub_226333E58();
  v0[18] = v1;
  return swift_task_switch();
}

uint64_t sub_22632B9CC()
{
  objc_super *v0;
  id receiver;
  Class super_class;
  id v3;
  objc_class *v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_class *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;

  receiver = v0[6].receiver;
  super_class = v0[3].super_class;
  v3 = v0[3].receiver;
  v4 = (objc_class *)type metadata accessor for AuthorizationOperation();
  v5 = (char *)objc_allocWithZone(v4);
  v6 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255839070);
  v9 = swift_allocObject();
  *(_DWORD *)(v9 + 20) = 0;
  *(_BYTE *)(v9 + 16) = 0;
  *(_QWORD *)&v5[v8] = v9;
  *(_QWORD *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider] = 0;
  v10 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_requestContext];
  *(_QWORD *)v10 = receiver;
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 0;
  v0[1].receiver = v5;
  v0[1].super_class = v4;
  swift_bridgeObjectRetain();
  v11 = (objc_class *)objc_msgSendSuper2(v0 + 1, sel_init);
  v0[9].super_class = v11;
  v12 = (_QWORD *)((char *)v11
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  v13 = *(_QWORD *)((char *)v11
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  *v12 = v3;
  v12[1] = super_class;
  swift_retain();
  sub_22632D754(v13);
  v14 = swift_task_alloc();
  v0[10].receiver = (id)v14;
  *(_QWORD *)(v14 + 16) = v11;
  v15 = swift_task_alloc();
  v0[10].super_class = (Class)v15;
  *(_QWORD *)(v15 + 16) = v11;
  v0[11].receiver = (id)sub_226333E7C();
  v16 = (objc_class *)swift_task_alloc();
  v0[11].super_class = v16;
  *(_QWORD *)v16 = v0;
  *((_QWORD *)v16 + 1) = sub_22632BB88;
  return sub_226333F54();
}

uint64_t sub_22632BB88()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 192) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_22632BC10()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_22632BC60()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_22632BCA0()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22632BCD4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 152);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22632BD4C()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_22632BD84()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AuthorizationController.performRequests(_:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 40) = a2;
  *(_QWORD *)(v4 + 48) = a3;
  *(_QWORD *)(v4 + 32) = a1;
  *(_OWORD *)(v4 + 56) = *v3;
  sub_226333E88();
  *(_QWORD *)(v4 + 72) = sub_226333E7C();
  *(_QWORD *)(v4 + 80) = sub_226333E58();
  *(_QWORD *)(v4 + 88) = v5;
  return swift_task_switch();
}

uint64_t sub_22632BE3C()
{
  uint64_t v0;
  _QWORD *v1;

  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  *v1 = v0;
  v1[1] = sub_22632BEA8;
  return sub_22632B274(*(_QWORD *)(v0 + 32), (_OWORD *)(v0 + 16), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_22632BEA8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22632BF0C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AuthorizationController.performRequest(_:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 40) = a2;
  *(_QWORD *)(v4 + 48) = a3;
  *(_QWORD *)(v4 + 32) = a1;
  *(_OWORD *)(v4 + 56) = *v3;
  *(_QWORD *)(v4 + 72) = sub_226333E88();
  *(_QWORD *)(v4 + 80) = sub_226333E7C();
  *(_QWORD *)(v4 + 88) = sub_226333E58();
  *(_QWORD *)(v4 + 96) = v5;
  return swift_task_switch();
}

uint64_t sub_22632BFBC()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v6;

  v1 = (void *)v0[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558391C0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_226334EC0;
  *(_QWORD *)(v2 + 32) = v1;
  v6 = v2;
  sub_226333E4C();
  v0[13] = v6;
  v3 = v1;
  v0[14] = sub_226333E7C();
  v0[15] = sub_226333E58();
  v0[16] = v4;
  return swift_task_switch();
}

uint64_t sub_22632C068()
{
  uint64_t v0;
  _QWORD *v1;

  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v1;
  *v1 = v0;
  v1[1] = sub_22632C0D8;
  return sub_22632B274(*(_QWORD *)(v0 + 32), (_OWORD *)(v0 + 16), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 48));
}

uint64_t sub_22632C0D8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22632C13C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_22632C17C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22632C1B0()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_22632C1E8()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AuthorizationController.performRequests(_:customMethods:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 40) = a2;
  *(_QWORD *)(v4 + 48) = a3;
  *(_QWORD *)(v4 + 32) = a1;
  *(_OWORD *)(v4 + 56) = *v3;
  sub_226333E88();
  *(_QWORD *)(v4 + 72) = sub_226333E7C();
  *(_QWORD *)(v4 + 80) = sub_226333E58();
  *(_QWORD *)(v4 + 88) = v5;
  return swift_task_switch();
}

uint64_t sub_22632C2A0()
{
  uint64_t v0;
  _QWORD *v1;

  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  *v1 = v0;
  v1[1] = sub_22632BEA8;
  return sub_22632B560(*(_QWORD *)(v0 + 32), (_OWORD *)(v0 + 16), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

void sub_22632C31C()
{
  char *v0;
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;

  v0 = (char *)objc_allocWithZone((Class)type metadata accessor for AuthorizationOperation());
  v1 = &v0[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  v2 = &v0[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  v3 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255839070);
  v4 = swift_allocObject();
  *(_DWORD *)(v4 + 20) = 0;
  *(_BYTE *)(v4 + 16) = 0;
  *(_QWORD *)&v0[v3] = v4;
  *(_QWORD *)&v0[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider] = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  sub_226333F24();
  __break(1u);
}

uint64_t AuthorizationController.performRequest(_:customMethods:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 80) = a2;
  *(_QWORD *)(v4 + 88) = a3;
  *(_QWORD *)(v4 + 72) = a1;
  *(_OWORD *)(v4 + 96) = *v3;
  *(_QWORD *)(v4 + 112) = sub_226333E88();
  *(_QWORD *)(v4 + 120) = sub_226333E7C();
  *(_QWORD *)(v4 + 128) = sub_226333E58();
  *(_QWORD *)(v4 + 136) = v5;
  return swift_task_switch();
}

uint64_t sub_22632C480()
{
  _QWORD *v0;
  void *v1;
  uint64_t inited;
  id v3;
  uint64_t v4;
  uint64_t v6;

  v1 = (void *)v0[10];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558391C0);
  inited = swift_initStackObject();
  v0[18] = inited;
  *(_OWORD *)(inited + 16) = xmmword_226334EC0;
  *(_QWORD *)(inited + 32) = v1;
  v6 = inited;
  sub_226333E4C();
  v0[19] = v6;
  v3 = v1;
  v0[20] = sub_226333E7C();
  v0[21] = sub_226333E58();
  v0[22] = v4;
  return swift_task_switch();
}

uint64_t sub_22632C530()
{
  uint64_t v0;
  _QWORD *v1;

  *(_OWORD *)(v0 + 56) = *(_OWORD *)(v0 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v1;
  *v1 = v0;
  v1[1] = sub_22632C5B4;
  return sub_22632B560(*(_QWORD *)(v0 + 72), (_OWORD *)(v0 + 56), *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 88));
}

uint64_t sub_22632C5B4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 192) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22632C618()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_22632C658()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22632C68C()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_22632C6C4()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AuthorizationController.performAutoFillAssistedRequests(_:)(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 + 32) = a1;
  *(_QWORD *)(v3 + 40) = a2;
  *(_OWORD *)(v3 + 48) = *v2;
  *(_QWORD *)(v3 + 64) = sub_226333E88();
  *(_QWORD *)(v3 + 72) = sub_226333E7C();
  *(_QWORD *)(v3 + 80) = sub_226333E58();
  *(_QWORD *)(v3 + 88) = v4;
  return swift_task_switch();
}

uint64_t sub_22632C77C()
{
  _QWORD *v0;
  uint64_t v1;

  swift_bridgeObjectRetain();
  v0[12] = sub_226333E7C();
  v0[13] = sub_226333E58();
  v0[14] = v1;
  return swift_task_switch();
}

uint64_t sub_22632C7E4()
{
  objc_super *v0;
  Class super_class;
  Class v2;
  id receiver;
  objc_class *v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_class *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;

  super_class = v0[3].super_class;
  v2 = v0[2].super_class;
  receiver = v0[3].receiver;
  v4 = (objc_class *)type metadata accessor for AuthorizationOperation();
  v5 = (char *)objc_allocWithZone(v4);
  v6 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255839070);
  v9 = swift_allocObject();
  *(_DWORD *)(v9 + 20) = 0;
  *(_BYTE *)(v9 + 16) = 0;
  *(_QWORD *)&v5[v8] = v9;
  *(_QWORD *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider] = 0;
  v10 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_requestContext];
  *(_QWORD *)v10 = v2;
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  v0[1].receiver = v5;
  v0[1].super_class = v4;
  swift_bridgeObjectRetain();
  v11 = (objc_class *)objc_msgSendSuper2(v0 + 1, sel_init);
  v0[7].super_class = v11;
  v12 = (_QWORD *)((char *)v11
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  v13 = *(_QWORD *)((char *)v11
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  *v12 = receiver;
  v12[1] = super_class;
  swift_retain();
  sub_22632D754(v13);
  v14 = swift_task_alloc();
  v0[8].receiver = (id)v14;
  *(_QWORD *)(v14 + 16) = v11;
  v15 = swift_task_alloc();
  v0[8].super_class = (Class)v15;
  *(_QWORD *)(v15 + 16) = v11;
  v0[9].receiver = (id)sub_226333E7C();
  v16 = (objc_class *)swift_task_alloc();
  v0[9].super_class = v16;
  *(_QWORD *)v16 = v0;
  *((_QWORD *)v16 + 1) = sub_22632C9A0;
  return sub_226333F54();
}

uint64_t sub_22632C9A0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_22632CA28()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 120);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t AuthorizationController.performAutoFillAssistedRequest(_:)(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 + 32) = a1;
  *(_QWORD *)(v3 + 40) = a2;
  *(_OWORD *)(v3 + 48) = *v2;
  *(_QWORD *)(v3 + 64) = sub_226333E88();
  *(_QWORD *)(v3 + 72) = sub_226333E7C();
  *(_QWORD *)(v3 + 80) = sub_226333E58();
  *(_QWORD *)(v3 + 88) = v4;
  return swift_task_switch();
}

uint64_t sub_22632CB18()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v6;

  v1 = (void *)v0[5];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558391C0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_226334EC0;
  *(_QWORD *)(v2 + 32) = v1;
  v6 = v2;
  sub_226333E4C();
  v0[12] = v6;
  v3 = v1;
  v0[13] = sub_226333E7C();
  v0[14] = sub_226333E58();
  v0[15] = v4;
  return swift_task_switch();
}

uint64_t sub_22632CBC4()
{
  _QWORD *v0;
  uint64_t v1;

  swift_bridgeObjectRetain();
  v0[16] = sub_226333E7C();
  v0[17] = sub_226333E58();
  v0[18] = v1;
  return swift_task_switch();
}

uint64_t sub_22632CC2C()
{
  objc_super *v0;
  id receiver;
  Class super_class;
  id v3;
  objc_class *v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_class *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;

  receiver = v0[6].receiver;
  super_class = v0[3].super_class;
  v3 = v0[3].receiver;
  v4 = (objc_class *)type metadata accessor for AuthorizationOperation();
  v5 = (char *)objc_allocWithZone(v4);
  v6 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255839070);
  v9 = swift_allocObject();
  *(_DWORD *)(v9 + 20) = 0;
  *(_BYTE *)(v9 + 16) = 0;
  *(_QWORD *)&v5[v8] = v9;
  *(_QWORD *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider] = 0;
  v10 = &v5[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_requestContext];
  *(_QWORD *)v10 = receiver;
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  v0[1].receiver = v5;
  v0[1].super_class = v4;
  swift_bridgeObjectRetain();
  v11 = (objc_class *)objc_msgSendSuper2(v0 + 1, sel_init);
  v0[9].super_class = v11;
  v12 = (_QWORD *)((char *)v11
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  v13 = *(_QWORD *)((char *)v11
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  *v12 = v3;
  v12[1] = super_class;
  swift_retain();
  sub_22632D754(v13);
  v14 = swift_task_alloc();
  v0[10].receiver = (id)v14;
  *(_QWORD *)(v14 + 16) = v11;
  v15 = swift_task_alloc();
  v0[10].super_class = (Class)v15;
  *(_QWORD *)(v15 + 16) = v11;
  v0[11].receiver = (id)sub_226333E7C();
  v16 = (objc_class *)swift_task_alloc();
  v0[11].super_class = v16;
  *(_QWORD *)v16 = v0;
  *((_QWORD *)v16 + 1) = sub_22632CDEC;
  return sub_226333F54();
}

uint64_t sub_22632CDEC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 192) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_22632CE74()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_22632CEC4()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_22632CF04()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 152);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22632CF7C()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_22632CFB4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  v2[4] = sub_226333E88();
  v2[5] = sub_226333E7C();
  v2[6] = sub_226333E58();
  v2[7] = v3;
  return swift_task_switch();
}

uint64_t sub_22632D024()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[3];
  v0[8] = sub_226333E7C();
  v2 = swift_task_alloc();
  v0[9] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[10] = v3;
  *v3 = v0;
  v3[1] = sub_22632D0D8;
  return sub_226333F60();
}

uint64_t sub_22632D0D8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_22632D14C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22632D180()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22632D1C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t (**v9)(uint64_t);
  uint64_t v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255838FB0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v9 = (uint64_t (**)(uint64_t))(a2
                                        + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler);
  v10 = *(_QWORD *)(a2
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler);
  *v9 = sub_22632DCB4;
  v9[1] = (uint64_t (*)(uint64_t))v8;
  sub_22632D754(v10);
  return sub_22632DD0C();
}

uint64_t sub_22632D2B4(uint64_t a1)
{
  void *v2;
  id v3;
  id v5;

  v2 = *(void **)a1;
  if ((*(_BYTE *)(a1 + 9) & 1) != 0)
  {
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255838FB0);
    return sub_226333E64();
  }
  else
  {
    v5 = v2;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255838FB0);
    return sub_226333E70();
  }
}

uint64_t sub_22632D334(void *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255838F88);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_226333EA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  sub_226333E88();
  v5 = a1;
  v6 = sub_226333E7C();
  v7 = (_QWORD *)swift_allocObject();
  v8 = MEMORY[0x24BEE6930];
  v7[2] = v6;
  v7[3] = v8;
  v7[4] = v5;
  sub_22632D4B0((uint64_t)v3, (uint64_t)&unk_255838F98, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_22632D410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  sub_226333E88();
  *(_QWORD *)(v4 + 24) = sub_226333E7C();
  sub_226333E58();
  return swift_task_switch();
}

uint64_t sub_22632D47C()
{
  uint64_t v0;

  swift_release();
  sub_22632DF90();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22632D4B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_226333EA0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_226333E94();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_22632DAC4(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_226333E58();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t EnvironmentValues.authorizationController.getter@<X0>(id (**a1)()@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v3 = sub_226333CC0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v1, v3);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v4 + 32))(v7 + v6, (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  *a1 = sub_22632D8C4;
  a1[1] = (id (*)())v7;
  return result;
}

id sub_22632D6BC()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;

  v0 = (void *)sub_226333CA8();
  if (!v0)
    return 0;
  v1 = v0;
  v2 = objc_msgSend(v0, sel_scene);

  if (v2)
  {
    objc_opt_self();
    v3 = (void *)swift_dynamicCastObjCClass();
    if (!v3)

    v2 = objc_msgSend(v3, sel_keyWindow);
  }
  return v2;
}

uint64_t sub_22632D754(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_22632D764(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22632DD00;
  return sub_22632CFB4(a1, v4);
}

uint64_t sub_22632D7BC()
{
  uint64_t v0;

  return sub_22632D334(*(void **)(v0 + 16));
}

uint64_t sub_22632D7C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22632D81C;
  return sub_22632CFB4(a1, v4);
}

uint64_t sub_22632D81C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_22632D864()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_226333CC0();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

id sub_22632D8C4()
{
  sub_226333CC0();
  return sub_22632D6BC();
}

_QWORD *initializeBufferWithCopyOfBuffer for AuthorizationController(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for AuthorizationController()
{
  return swift_release();
}

_QWORD *assignWithCopy for AuthorizationController(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
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

_OWORD *assignWithTake for AuthorizationController(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AuthorizationController(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AuthorizationController(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AuthorizationController()
{
  return &type metadata for AuthorizationController;
}

uint64_t sub_22632DA2C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_22632DA58(uint64_t a1)
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
  v7[1] = sub_22632D81C;
  return sub_22632D410(a1, v4, v5, v6);
}

uint64_t sub_22632DAC4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255838F88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22632DB04(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_22632DB68;
  return v6(a1);
}

uint64_t sub_22632DB68()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_22632DBB4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22632DBD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22632DD00;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255838FA0 + dword_255838FA0))(a1, v4);
}

uint64_t sub_22632DC48(uint64_t a1)
{
  uint64_t v1;

  return sub_22632D1C8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_22632DC50()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255838FB0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_22632DCB4(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255838FB0);
  return sub_22632D2B4(a1);
}

uint64_t sub_22632DD0C()
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
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t aBlock;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  void *v20;
  uint64_t v21;

  v1 = sub_226333DB0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_226333DC8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(v0, sel_isCancelled))
  {
    sub_22632F354(0, (unint64_t *)&qword_255839050);
    v9 = (void *)sub_226333EB8();
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v0;
    v20 = sub_22632F33C;
    v21 = v10;
    aBlock = MEMORY[0x24BDAC760];
    v17 = 1107296256;
    v11 = &block_descriptor_17;
  }
  else
  {
    sub_22632E490(1);
    sub_22632F354(0, (unint64_t *)&qword_255839050);
    v9 = (void *)sub_226333EB8();
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v0;
    v20 = sub_22632F318;
    v21 = v12;
    aBlock = MEMORY[0x24BDAC760];
    v17 = 1107296256;
    v11 = &block_descriptor_11;
  }
  v18 = sub_226330C30;
  v19 = v11;
  v13 = _Block_copy(&aBlock);
  v14 = v0;
  swift_release();
  sub_226333DBC();
  aBlock = MEMORY[0x24BEE4AF8];
  sub_22632A648((unint64_t *)&unk_255839380, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255839060);
  sub_22632F288();
  sub_226333EE8();
  MEMORY[0x227695624](0, v8, v4, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_22632DF90()
{
  void *v0;
  void *v1;
  objc_class *ObjectType;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];
  objc_super v19;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = sub_226333DB0();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v17 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_226333DC8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19.receiver = v1;
  v19.super_class = ObjectType;
  objc_msgSendSuper2(&v19, sel_cancel);
  sub_22632F354(0, (unint64_t *)&qword_255839050);
  v11 = (void *)sub_226333EB8();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v1;
  aBlock[4] = sub_22632F3A0;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_226330C30;
  aBlock[3] = &block_descriptor;
  v13 = _Block_copy(aBlock);
  v14 = v1;
  swift_release();
  sub_226333DBC();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_22632A648((unint64_t *)&unk_255839380, v4, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255839060);
  sub_22632F288();
  sub_226333EE8();
  MEMORY[0x227695624](0, v10, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

BOOL sub_22632E1AC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22632E1C0()
{
  sub_226333F90();
  sub_226333F9C();
  return sub_226333FA8();
}

uint64_t sub_22632E204()
{
  return sub_226333F9C();
}

uint64_t sub_22632E22C()
{
  sub_226333F90();
  sub_226333F9C();
  return sub_226333FA8();
}

id sub_22632E2BC(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_class *ObjectType;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = &v2[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v2[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255839070);
  v9 = swift_allocObject();
  *(_DWORD *)(v9 + 20) = 0;
  *(_BYTE *)(v9 + 16) = 0;
  *(_QWORD *)&v2[v8] = v9;
  *(_QWORD *)&v2[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider] = 0;
  v10 = &v2[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_requestContext];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;
  v10[16] = 0;
  v12.receiver = v2;
  v12.super_class = ObjectType;
  return objc_msgSendSuper2(&v12, sel_init);
}

uint64_t sub_22632E38C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  void (*v4)(void **);
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;
  __int16 v16;

  v2 = v1;
  v3 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler);
  v4 = *(void (**)(void **))(v1
                                      + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler);
  if (v4)
  {
    v15 = a1;
    v16 = 256;
    sub_22632F234((uint64_t)v4);
    v6 = a1;
    v4(&v15);
    sub_22632D754((uint64_t)v4);

    v7 = *v3;
  }
  else
  {
    v7 = 0;
  }
  *v3 = 0;
  v3[1] = 0;
  sub_22632D754(v7);
  v8 = *(void **)(v1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider) = 0;

  v9 = (_QWORD *)(v1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  v10 = *(_QWORD *)(v1
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  *v9 = 0;
  v9[1] = 0;
  sub_22632D754(v10);
  v11 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController;
  v12 = *(void **)(v2 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController);
  if (v12)
  {
    objc_msgSend(v12, sel_cancel);
    v13 = *(void **)(v2 + v11);
  }
  else
  {
    v13 = 0;
  }
  *(_QWORD *)(v2 + v11) = 0;

  return sub_22632E490(2);
}

uint64_t sub_22632E490(char a1)
{
  uint64_t v1;
  uint64_t v3;

  swift_getKeyPath();
  sub_226333C54();
  swift_getKeyPath();
  sub_226333C54();
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 20));
  *(_BYTE *)(v3 + 16) = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 20));
  swift_getKeyPath();
  sub_226333C60();
  swift_getKeyPath();
  return sub_226333C60();
}

uint64_t sub_22632E56C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_class *v7;
  char *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v1 = v0;
  v2 = (uint64_t *)(v0
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  v3 = *(uint64_t (**)(uint64_t))(v0
                                         + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  if (v3)
  {
    v4 = swift_retain();
    v5 = v3(v4);
    sub_22632D754((uint64_t)v3);
    v6 = 0;
    if (v5)
    {
      v7 = (objc_class *)type metadata accessor for AuthorizationOperation.PresentationContextProvider();
      v8 = (char *)objc_allocWithZone(v7);
      *(_QWORD *)&v8[OBJC_IVAR____TtCC31_AuthenticationServices_SwiftUI22AuthorizationOperationP33_BCDE3EDBB9065C8EBFE58D5929093A3327PresentationContextProvider_presentationAnchor] = v5;
      v12.receiver = v8;
      v12.super_class = v7;
      v6 = objc_msgSendSuper2(&v12, sel_init);
    }
  }
  else
  {
    v6 = 0;
  }
  v9 = *(void **)(v1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider) = v6;

  v10 = *v2;
  *v2 = 0;
  v2[1] = 0;
  return sub_22632D754(v10);
}

id sub_22632E634()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id result;

  v1 = v0 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_requestContext;
  v2 = objc_allocWithZone(MEMORY[0x24BDB7088]);
  sub_22632F354(0, (unint64_t *)&qword_255839068);
  swift_bridgeObjectRetain();
  v3 = (void *)sub_226333E40();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithAuthorizationRequests_, v3);

  v5 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController;
  v6 = *(void **)(v0 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController) = v4;

  v7 = *(void **)(v0 + v5);
  if (v7)
  {
    objc_msgSend(v7, sel_setDelegate_, v0);
    v8 = *(void **)(v0 + v5);
    if (v8)
      objc_msgSend(v8, sel_setPresentationContextProvider_, *(_QWORD *)(v0+ OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider));
  }
  result = *(id *)(v0 + v5);
  if (*(_BYTE *)(v1 + 16) == 1)
  {
    if (result)
      return objc_msgSend(result, sel_performAutoFillAssistedRequests);
  }
  else if (result)
  {
    return objc_msgSend(result, sel_performRequestsWithOptions_);
  }
  return result;
}

void sub_22632E7A4()
{
  void *v0;

  type metadata accessor for ASAuthorizationError(0);
  sub_226332708(MEMORY[0x24BEE4AF8]);
  sub_22632A648(&qword_255838D30, (uint64_t (*)(uint64_t))type metadata accessor for ASAuthorizationError, (uint64_t)&unk_226334C48);
  sub_226333C48();
  sub_22632E38C(v0);

}

BOOL sub_22632E8FC()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage);
  v2 = (os_unfair_lock_s *)(v1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 20));
  LODWORD(v1) = *(unsigned __int8 *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  return (_DWORD)v1 == 1;
}

BOOL sub_22632E9C0()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage);
  v2 = (os_unfair_lock_s *)(v1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 20));
  LODWORD(v1) = *(unsigned __int8 *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  return (_DWORD)v1 == 2;
}

_BYTE *sub_22632EA04@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_22632EA10(_QWORD *a1@<X0>, BOOL *a2@<X8>)
{
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  char v6;

  v3 = *(os_unfair_lock_s **)(*a1
                            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage);
  v4 = v3 + 4;
  v5 = v3 + 5;
  os_unfair_lock_lock(v3 + 5);
  sub_22632EA04(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6 == 1;
}

void sub_22632EA88(_QWORD *a1@<X0>, BOOL *a2@<X8>)
{
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  char v6;

  v3 = *(os_unfair_lock_s **)(*a1
                            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_stateStorage);
  v4 = v3 + 4;
  v5 = v3 + 5;
  os_unfair_lock_lock(v3 + 5);
  sub_22632EA04(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6 == 2;
}

uint64_t sub_22632EB00(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  void (*v3)(id *);
  char v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v12;
  char v13;
  char v14;

  v2 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler);
  v3 = *(void (**)(id *))(v1
                                   + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationCompletionHandler);
  if (v3)
  {
    v4 = *(_BYTE *)(a1 + 8);
    v12 = *(id *)a1;
    v13 = v4;
    v14 = 0;
    sub_22632F234((uint64_t)v3);
    v5 = v12;
    v3(&v12);
    sub_22632D754((uint64_t)v3);

    v6 = *v2;
  }
  else
  {
    v6 = 0;
  }
  *v2 = 0;
  v2[1] = 0;
  sub_22632D754(v6);
  v7 = *(void **)(v1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationContextProvider) = 0;

  v8 = (_QWORD *)(v1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  v9 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_presentationAnchorProvider);
  *v8 = 0;
  v8[1] = 0;
  sub_22632D754(v9);
  v10 = *(void **)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI22AuthorizationOperation_authorizationController) = 0;

  return sub_22632E490(2);
}

id sub_22632ED14()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AuthorizationOperation()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for AuthorizationOperation.PresentationContextProvider()
{
  return objc_opt_self();
}

uint64_t destroy for AuthorizationOperation.RequestContext()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s31_AuthenticationServices_SwiftUI22AuthorizationOperationC14RequestContextVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AuthorizationOperation.RequestContext(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
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

uint64_t assignWithTake for AuthorizationOperation.RequestContext(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AuthorizationOperation.RequestContext(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AuthorizationOperation.RequestContext(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationOperation.RequestContext()
{
  return &type metadata for AuthorizationOperation.RequestContext;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AuthorizationOperation.State(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AuthorizationOperation.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22632F15C + 4 * byte_226334F15[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22632F190 + 4 * byte_226334F10[v4]))();
}

uint64_t sub_22632F190(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22632F198(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22632F1A0);
  return result;
}

uint64_t sub_22632F1AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22632F1B4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22632F1B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22632F1C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22632F1CC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22632F1D4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationOperation.State()
{
  return &type metadata for AuthorizationOperation.State;
}

unint64_t sub_22632F1F0()
{
  unint64_t result;

  result = qword_255839048;
  if (!qword_255839048)
  {
    result = MEMORY[0x2276959F0](&unk_226334FE4, &type metadata for AuthorizationOperation.State);
    atomic_store(result, (unint64_t *)&qword_255839048);
  }
  return result;
}

uint64_t sub_22632F234(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_22632F24C()
{
  uint64_t v0;

  return swift_deallocObject();
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

unint64_t sub_22632F288()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255839390;
  if (!qword_255839390)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255839060);
    result = MEMORY[0x2276959F0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255839390);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2276959E4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id sub_22632F318()
{
  sub_22632E56C();
  return sub_22632E634();
}

void sub_22632F33C()
{
  sub_22632E7A4();
}

uint64_t sub_22632F354(uint64_t a1, unint64_t *a2)
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

void static SignInWithAppleButton.Label.signIn.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

unsigned __int8 *SignInWithAppleButton.init(_:onRequest:onCompletion:)@<X0>(unsigned __int8 *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  *a6 = *result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t SignInWithAppleButton.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[4];
  *(_QWORD *)a1 = swift_getKeyPath();
  *(_BYTE *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *((_OWORD *)v1 + 1);
  *(_QWORD *)(a1 + 48) = v5;
  swift_retain();
  return swift_retain();
}

void static SignInWithAppleButton.Label.continue.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

void static SignInWithAppleButton.Label.signUp.getter(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_22632F450@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[4];
  *(_QWORD *)a1 = swift_getKeyPath();
  *(_BYTE *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *((_OWORD *)v1 + 1);
  *(_QWORD *)(a1 + 48) = v5;
  swift_retain();
  return swift_retain();
}

uint64_t View.signInWithAppleButtonStyle(_:)()
{
  swift_getKeyPath();
  sub_226333D98();
  return swift_release();
}

uint64_t sub_22632F524()
{
  sub_226330BB8();
  return sub_226333CCC();
}

uint64_t sub_22632F558@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_226330BB8();
  result = sub_226333CCC();
  *a1 = v3;
  return result;
}

uint64_t sub_22632F5A4()
{
  sub_226330BB8();
  return sub_226333CD8();
}

uint64_t sub_22632F5EC()
{
  return swift_getOpaqueTypeConformance2();
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

ValueMetadata *type metadata accessor for SignInWithAppleButton()
{
  return &type metadata for SignInWithAppleButton;
}

ValueMetadata *type metadata accessor for SignInWithAppleButton.Label()
{
  return &type metadata for SignInWithAppleButton.Label;
}

ValueMetadata *type metadata accessor for SignInWithAppleButton.Style()
{
  return &type metadata for SignInWithAppleButton.Style;
}

void sub_22632F660(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

id sub_22632F66C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  id v4;
  char *v5;
  void *v6;
  id v7;
  char *v8;
  char *v10;

  v1 = *(_QWORD *)v0;
  v2 = *(_BYTE *)(v0 + 8);
  v3 = *(_QWORD *)(v0 + 16);
  sub_22633012C(*(_QWORD *)v0, v2);
  sub_22633043C(v1, v2, &v10);
  sub_22633016C(v1, v2);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB7070]), sel_initWithAuthorizationButtonType_authorizationButtonStyle_, v3, qword_226335390[(char)v10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558391A8);
  sub_226333D68();
  v5 = v10;
  v6 = *(void **)&v10[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_button];
  *(_QWORD *)&v10[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_button] = v4;
  v7 = v4;

  sub_226333D68();
  v8 = v10;
  objc_msgSend(v7, sel_addTarget_action_forControlEvents_, v10, sel_buttonPressed, 64);

  return v7;
}

void sub_22632F784(void *a1)
{
  id v1;
  id v2;
  void *v3;
  char *v4;

  v1 = objc_msgSend(a1, sel_window);
  if (v1)
  {
    v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558391A8);
    sub_226333D68();
    v3 = *(void **)&v4[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_presentationAnchor];
    *(_QWORD *)&v4[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_presentationAnchor] = v2;

  }
}

id sub_22632F7FC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  char *v8;
  id result;
  __int128 v10;
  objc_super v11;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 48);
  v6 = (objc_class *)type metadata accessor for Coordinator();
  v10 = *(_OWORD *)(v1 + 32);
  v7 = (char *)objc_allocWithZone(v6);
  *(_QWORD *)&v7[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_presentationAnchor] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_button] = 0;
  v8 = &v7[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_config];
  *(_QWORD *)v8 = v3;
  *((_QWORD *)v8 + 1) = v4;
  *((_OWORD *)v8 + 1) = v10;
  *((_QWORD *)v8 + 4) = v5;
  v11.receiver = v7;
  v11.super_class = v6;
  swift_retain();
  swift_retain();
  result = objc_msgSendSuper2(&v11, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_22632F8B4()
{
  return sub_226333CFC();
}

uint64_t sub_22632F8F4()
{
  sub_226330A7C();
  return sub_226333D5C();
}

uint64_t sub_22632F944()
{
  sub_226330A7C();
  return sub_226333D08();
}

uint64_t sub_22632F994()
{
  return sub_226333DA4();
}

void sub_22632F9AC()
{
  sub_226330A7C();
  sub_226333D50();
  __break(1u);
}

void sub_22632F9D0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v1 = v0;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB7080]), sel_init);
  v3 = objc_msgSend(v2, sel_createRequest);
  (*(void (**)(void))(v0
                    + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_config
                    + 8))();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558391C0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_226334EC0;
  *(_QWORD *)(v4 + 32) = v3;
  sub_226333E4C();
  v5 = objc_allocWithZone(MEMORY[0x24BDB7088]);
  sub_226330B7C();
  v6 = v3;
  v7 = (void *)sub_226333E40();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v5, sel_initWithAuthorizationRequests_, v7);

  objc_msgSend(v8, sel_setDelegate_, v1);
  objc_msgSend(v8, sel_setPresentationContextProvider_, v1);
  objc_msgSend(v8, sel_performRequests);

}

id sub_22632FB88()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for Coordinator()
{
  return objc_opt_self();
}

unint64_t sub_22632FD70()
{
  unint64_t result;

  result = qword_255839180;
  if (!qword_255839180)
  {
    result = MEMORY[0x2276959F0](&unk_226335244, &type metadata for ViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_255839180);
  }
  return result;
}

uint64_t sub_22632FDB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255839188);
  v2 = sub_226333C9C();
  v4[0] = v1;
  v4[1] = sub_22632FE14();
  return MEMORY[0x2276959F0](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_22632FE14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255839190;
  if (!qword_255839190)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255839188);
    result = MEMORY[0x2276959F0](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_255839190);
  }
  return result;
}

ValueMetadata *type metadata accessor for SignInWithAppleButton.Style.Storage()
{
  return &type metadata for SignInWithAppleButton.Style.Storage;
}

uint64_t _s31_AuthenticationServices_SwiftUI21SignInWithAppleButtonV5LabelV7StorageOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22632FEBC + 4 * byte_226335065[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22632FEF0 + 4 * byte_226335060[v4]))();
}

uint64_t sub_22632FEF0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22632FEF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22632FF00);
  return result;
}

uint64_t sub_22632FF0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22632FF14);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22632FF18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22632FF20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SignInWithAppleButton.Label.Storage()
{
  return &type metadata for SignInWithAppleButton.Label.Storage;
}

uint64_t initializeBufferWithCopyOfBuffer for Configuration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s31_AuthenticationServices_SwiftUI13ConfigurationVwxx_0()
{
  swift_release();
  return swift_release();
}

uint64_t _s31_AuthenticationServices_SwiftUI13ConfigurationVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = v4;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *_s31_AuthenticationServices_SwiftUI13ConfigurationVwca_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = *a2;
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s31_AuthenticationServices_SwiftUI13ConfigurationVwta_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t _s31_AuthenticationServices_SwiftUI13ConfigurationVwet_0(uint64_t a1, int a2)
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

uint64_t sub_2263300D4(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Configuration()
{
  return &type metadata for Configuration;
}

uint64_t sub_22633012C(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t destroy for ViewRepresentable(uint64_t a1)
{
  sub_22633016C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  swift_release();
  return swift_release();
}

uint64_t sub_22633016C(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for ViewRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_22633012C(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = v7;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ViewRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_22633012C(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_22633016C(v6, v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v8;
  swift_retain();
  swift_release();
  v9 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v9;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ViewRepresentable(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_22633016C(v6, v7);
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewRepresentable(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ViewRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ViewRepresentable()
{
  return &type metadata for ViewRepresentable;
}

unint64_t sub_2263303A0()
{
  unint64_t result;

  result = qword_255839198;
  if (!qword_255839198)
  {
    result = MEMORY[0x2276959F0](&unk_2263351B4, &type metadata for SignInWithAppleButton.Label.Storage);
    atomic_store(result, (unint64_t *)&qword_255839198);
  }
  return result;
}

unint64_t sub_2263303E8()
{
  unint64_t result;

  result = qword_2558391A0;
  if (!qword_2558391A0)
  {
    result = MEMORY[0x2276959F0](&unk_22633521C, &type metadata for SignInWithAppleButton.Style.Storage);
    atomic_store(result, (unint64_t *)&qword_2558391A0);
  }
  return result;
}

uint64_t sub_22633042C()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_22633043C@<X0>(uint64_t a1@<X0>, char a2@<W1>, _BYTE *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  os_log_type_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_226333CC0();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    *a3 = a1;
  }
  else
  {
    sub_22633012C(a1, 0);
    v11 = sub_226333EAC();
    v12 = sub_226333D74();
    if (os_log_type_enabled(v12, v11))
    {
      v13 = swift_slowAlloc();
      v14 = swift_slowAlloc();
      v16 = v14;
      *(_DWORD *)v13 = 136315138;
      *(_QWORD *)(v13 + 4) = sub_2263305D8(0x656C797453, 0xE500000000000000, &v16);
      _os_log_impl(&dword_226328000, v12, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x227695A44](v14, -1, -1);
      MEMORY[0x227695A44](v13, -1, -1);
    }

    sub_226333CB4();
    swift_getAtKeyPath();
    sub_22633016C(a1, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

unint64_t sub_2263305D8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2263306A8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2263307C4((uint64_t)v12, *a3);
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
      sub_2263307C4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_2263306A8(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_226330800(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_226333F0C();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
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

uint64_t sub_2263307C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_226330800(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_226330894(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_226330990(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_226330990((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_226330894(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_22633092C(v2, 0);
      result = sub_226333F00();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_226333E34();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_22633092C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558391B0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_226330990(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558391B0);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_226330A7C()
{
  unint64_t result;

  result = qword_2558391B8;
  if (!qword_2558391B8)
  {
    result = MEMORY[0x2276959F0](&unk_226335294, &type metadata for ViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_2558391B8);
  }
  return result;
}

uint64_t sub_226330AC0()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t result;

  v1 = *(void **)(v0
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_presentationAnchor);
  if (v1)
  {
    v2 = *(id *)(v0
               + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_presentationAnchor);
LABEL_6:
    v5 = v1;
    return (uint64_t)v2;
  }
  v3 = *(void **)(v0
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUIP33_A3D59D81812617403D8A44C04D5B775311Coordinator_button);
  if (v3)
  {
    v4 = objc_msgSend(v3, sel_window);
    if (v4)
    {
      v2 = v4;
      v1 = 0;
      goto LABEL_6;
    }
  }
  result = sub_226333F24();
  __break(1u);
  return result;
}

unint64_t sub_226330B7C()
{
  unint64_t result;

  result = qword_255839068;
  if (!qword_255839068)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255839068);
  }
  return result;
}

unint64_t sub_226330BB8()
{
  unint64_t result;

  result = qword_2558391D0;
  if (!qword_2558391D0)
  {
    result = MEMORY[0x2276959F0](&unk_226335350, &type metadata for SignInWithAppleButtonStyleKey);
    atomic_store(result, (unint64_t *)&qword_2558391D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SignInWithAppleButtonStyleKey()
{
  return &type metadata for SignInWithAppleButtonStyleKey;
}

uint64_t sub_226330C30(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_226330CA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  objc_class *ObjectType;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  id v18;
  objc_super v20;

  ObjectType = (objc_class *)swift_getObjectType();
  v10 = &v4[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v11 = &v4[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  v12 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558393C0);
  v13 = swift_allocObject();
  *(_DWORD *)(v13 + 20) = 0;
  *(_QWORD *)&v4[v12] = v13;
  *(_BYTE *)(v13 + 16) = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider] = 0;
  v14 = &v4[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_requestContext];
  v15 = sub_226333C84();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v14, a1, v15);
  v17 = (int *)type metadata accessor for WebAuthenticationOperation.RequestContext(0);
  *(_QWORD *)&v14[v17[5]] = a2;
  *(_QWORD *)&v14[v17[6]] = a3;
  *(_QWORD *)&v14[v17[7]] = a4;
  v20.receiver = v4;
  v20.super_class = ObjectType;
  v18 = objc_msgSendSuper2(&v20, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a1, v15);
  return v18;
}

uint64_t sub_226330DE4()
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
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t aBlock;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  void *v20;
  uint64_t v21;

  v1 = sub_226333DB0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_226333DC8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(v0, sel_isCancelled))
  {
    sub_226332590();
    v9 = (void *)sub_226333EB8();
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v0;
    v20 = sub_226332A20;
    v21 = v10;
    aBlock = MEMORY[0x24BDAC760];
    v17 = 1107296256;
    v11 = &block_descriptor_16;
  }
  else
  {
    sub_22633119C(1);
    sub_226332590();
    v9 = (void *)sub_226333EB8();
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v0;
    v20 = sub_2263329FC;
    v21 = v12;
    aBlock = MEMORY[0x24BDAC760];
    v17 = 1107296256;
    v11 = &block_descriptor_10;
  }
  v18 = sub_226330C30;
  v19 = v11;
  v13 = _Block_copy(&aBlock);
  v14 = v0;
  swift_release();
  sub_226333DBC();
  aBlock = MEMORY[0x24BEE4AF8];
  sub_22632A648((unint64_t *)&unk_255839380, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255839060);
  sub_22632F288();
  sub_226333EE8();
  MEMORY[0x227695624](0, v8, v4, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_226331048(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t *v6;
  void (*v7)(_QWORD *);
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558393A0);
  MEMORY[0x24BDAC7A8]();
  v5 = (uint64_t *)((char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = (uint64_t *)(v2
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler);
  v7 = *(void (**)(_QWORD *))(v2
                                       + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler);
  if (v7)
  {
    *v5 = a1;
    swift_storeEnumTagMultiPayload();
    sub_22632F234((uint64_t)v7);
    v8 = a1;
    v7(v5);
    sub_22632D754((uint64_t)v7);
    sub_226332A64((uint64_t)v5, &qword_2558393A0);
    v9 = *v6;
  }
  else
  {
    v9 = 0;
  }
  *v6 = 0;
  v6[1] = 0;
  sub_22632D754(v9);
  v10 = *(void **)(v2
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider);
  *(_QWORD *)(v2
            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider) = 0;

  v11 = (_QWORD *)(v2
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  v12 = *(_QWORD *)(v2
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  *v11 = 0;
  v11[1] = 0;
  sub_22632D754(v12);
  v13 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession;
  v14 = *(void **)(v2
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession);
  if (v14)
  {
    objc_msgSend(v14, sel_cancel);
    v15 = *(void **)(v2 + v13);
  }
  else
  {
    v15 = 0;
  }
  *(_QWORD *)(v2 + v13) = 0;

  return sub_22633119C(2);
}

uint64_t sub_22633119C(char a1)
{
  uint64_t v1;
  uint64_t v3;

  swift_getKeyPath();
  sub_226333C54();
  swift_getKeyPath();
  sub_226333C54();
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 20));
  *(_BYTE *)(v3 + 16) = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 20));
  swift_getKeyPath();
  sub_226333C60();
  swift_getKeyPath();
  return sub_226333C60();
}

uint64_t sub_226331278()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_class *v7;
  char *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v1 = v0;
  v2 = (uint64_t *)(v0
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  v3 = *(uint64_t (**)(uint64_t))(v0
                                         + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  if (v3)
  {
    v4 = swift_retain();
    v5 = v3(v4);
    sub_22632D754((uint64_t)v3);
    v6 = 0;
    if (v5)
    {
      v7 = (objc_class *)type metadata accessor for WebAuthenticationOperation.PresentationContextProvider();
      v8 = (char *)objc_allocWithZone(v7);
      *(_QWORD *)&v8[OBJC_IVAR____TtCC31_AuthenticationServices_SwiftUI26WebAuthenticationOperationP33_8E8F7254784E6C7F9718057E730AB2A627PresentationContextProvider_presentationAnchor] = v5;
      v12.receiver = v8;
      v12.super_class = v7;
      v6 = objc_msgSendSuper2(&v12, sel_init);
    }
  }
  else
  {
    v6 = 0;
  }
  v9 = *(void **)(v1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider);
  *(_QWORD *)(v1
            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider) = v6;

  v10 = *v2;
  *v2 = 0;
  v2[1] = 0;
  return sub_22632D754(v10);
}

uint64_t sub_226331340()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[6];

  v1 = v0;
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v3 = v0 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_requestContext;
  v4 = (int *)type metadata accessor for WebAuthenticationOperation.RequestContext(0);
  v5 = *(void **)(v3 + v4[5]);
  v6 = objc_allocWithZone(MEMORY[0x24BDB7178]);
  v7 = v5;
  swift_retain();
  v8 = (void *)sub_226333C6C();
  v21[4] = sub_226332A5C;
  v21[5] = v2;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 1107296256;
  v21[2] = sub_226332608;
  v21[3] = &block_descriptor_22;
  v9 = _Block_copy(v21);
  v10 = objc_msgSend(v6, sel_initWithURL_callback_completionHandler_, v8, v7, v9);
  _Block_release(v9);

  swift_release();
  v11 = OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession;
  v12 = *(void **)(v1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession) = v10;

  v13 = *(void **)(v1 + v11);
  if (v13)
  {
    v14 = *(void **)(v3 + v4[7]);
    v15 = v13;
    if (v14)
      v14 = (void *)sub_226333DD4();
    objc_msgSend(v13, sel_setAdditionalHeaderFields_, v14);

    v16 = *(void **)(v1 + v11);
    if (v16)
    {
      objc_msgSend(v16, sel_setStorageMode_, *(_QWORD *)(v3 + v4[6]));
      v17 = *(void **)(v1 + v11);
      if (v17)
      {
        objc_msgSend(v17, sel_setPresentationContextProvider_, *(_QWORD *)(v1+ OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider));
        v18 = *(void **)(v1 + v11);
        if (v18)
        {
          v19 = v18;
          objc_msgSend(v19, sel_start);

        }
      }
    }
  }
  return swift_release();
}

uint64_t sub_22633156C()
{
  void *v0;
  void *v1;
  objc_class *ObjectType;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];
  objc_super v19;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = sub_226333DB0();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v17 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_226333DC8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19.receiver = v1;
  v19.super_class = ObjectType;
  objc_msgSendSuper2(&v19, sel_cancel);
  sub_226332590();
  v11 = (void *)sub_226333EB8();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v1;
  aBlock[4] = sub_226332B38;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_226330C30;
  aBlock[3] = &block_descriptor_0;
  v13 = _Block_copy(aBlock);
  v14 = v1;
  swift_release();
  sub_226333DBC();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_22632A648((unint64_t *)&unk_255839380, v4, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255839060);
  sub_22632F288();
  sub_226333EE8();
  MEMORY[0x227695624](0, v10, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_226331778()
{
  void *v0;

  type metadata accessor for ASWebAuthenticationSessionError(0);
  sub_226332708(MEMORY[0x24BEE4AF8]);
  sub_22632A648(&qword_255838D68, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_226334D58);
  sub_226333C48();
  sub_226331048(v0);

}

BOOL sub_2263318D0()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage);
  v2 = (os_unfair_lock_s *)(v1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 20));
  LODWORD(v1) = *(unsigned __int8 *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  return (_DWORD)v1 == 1;
}

BOOL sub_226331994()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage);
  v2 = (os_unfair_lock_s *)(v1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 20));
  LODWORD(v1) = *(unsigned __int8 *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  return (_DWORD)v1 == 2;
}

void sub_2263319D8(_QWORD *a1@<X0>, BOOL *a2@<X8>)
{
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  char v6;

  v3 = *(os_unfair_lock_s **)(*a1
                            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage);
  v4 = v3 + 4;
  v5 = v3 + 5;
  os_unfair_lock_lock(v3 + 5);
  sub_22632EA04(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6 == 1;
}

void sub_226331A50(_QWORD *a1@<X0>, BOOL *a2@<X8>)
{
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  char v6;

  v3 = *(os_unfair_lock_s **)(*a1
                            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_stateStorage);
  v4 = v3 + 4;
  v5 = v3 + 5;
  os_unfair_lock_lock(v3 + 5);
  sub_22632EA04(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6 == 2;
}

void sub_226331AC8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  void *v19;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2558393B8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_226333C84();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v12 = MEMORY[0x227695AC8](a3 + 16);
  if (v12)
  {
    v13 = (char *)v12;
    sub_226332AA0(a1, (uint64_t)v7, &qword_2558393B8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_226332A64((uint64_t)v7, &qword_2558393B8);
      if (a2)
      {
        v14 = *(void **)&v13[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession];
        *(_QWORD *)&v13[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession] = 0;
        v15 = a2;

        sub_226331048(a2);
      }
      else
      {
        v16 = *(void **)&v13[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession];
        *(_QWORD *)&v13[OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession] = 0;

        type metadata accessor for ASWebAuthenticationSessionError(0);
        v18[1] = 1;
        sub_226332708(MEMORY[0x24BEE4AF8]);
        sub_22632A648(&qword_255838D68, (uint64_t (*)(uint64_t))type metadata accessor for ASWebAuthenticationSessionError, (uint64_t)&unk_226334D58);
        sub_226333C48();
        v17 = v19;
        sub_226331048(v19);

      }
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
      sub_226331CDC((uint64_t)v11);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
  }
}

uint64_t sub_226331CDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t *v5;
  void (*v6)(char *);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2558393A0);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler);
  v6 = *(void (**)(char *))(v1
                                     + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler);
  if (v6)
  {
    v7 = sub_226333C84();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v4, a1, v7);
    swift_storeEnumTagMultiPayload();
    swift_retain();
    v6(v4);
    sub_22632D754((uint64_t)v6);
    sub_226332A64((uint64_t)v4, &qword_2558393A0);
    v8 = *v5;
  }
  else
  {
    v8 = 0;
  }
  *v5 = 0;
  v5[1] = 0;
  sub_22632D754(v8);
  v9 = *(void **)(v1
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider);
  *(_QWORD *)(v1
            + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationContextProvider) = 0;

  v10 = (_QWORD *)(v1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  v11 = *(_QWORD *)(v1
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  *v10 = 0;
  v10[1] = 0;
  sub_22632D754(v11);
  v12 = *(void **)(v1
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationSession) = 0;

  return sub_22633119C(2);
}

uint64_t sub_226331EDC()
{
  return type metadata accessor for WebAuthenticationOperation(0);
}

uint64_t type metadata accessor for WebAuthenticationOperation(uint64_t a1)
{
  return sub_226331F9C(a1, (uint64_t *)&unk_255839238);
}

uint64_t sub_226331EF8()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for WebAuthenticationOperation.RequestContext(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for WebAuthenticationOperation.RequestContext(uint64_t a1)
{
  return sub_226331F9C(a1, qword_255839330);
}

uint64_t sub_226331F9C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata accessor for WebAuthenticationOperation.PresentationContextProvider()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for WebAuthenticationOperation.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22633203C + 4 * byte_2263353B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_226332070 + 4 * byte_2263353B0[v4]))();
}

uint64_t sub_226332070(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_226332078(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x226332080);
  return result;
}

uint64_t sub_22633208C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x226332094);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_226332098(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2263320A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WebAuthenticationOperation.State()
{
  return &type metadata for WebAuthenticationOperation.State;
}

uint64_t *sub_2263320BC(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_226333C84();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    v11 = v10;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_226332164(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_226333C84();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

  return swift_bridgeObjectRelease();
}

uint64_t sub_2263321B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = sub_226333C84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  v10 = v9;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_226332230(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = sub_226333C84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a2 + v7);
  v9 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v10 = v8;

  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2263322C0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_226333C84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_226332330(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v6 = sub_226333C84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  v9 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + v9) = *(_QWORD *)(a2 + v9);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2263323B0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2263323BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_226333C84();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_226332438()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_226332444(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_226333C84();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_2263324BC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_226333C84();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_22633254C()
{
  unint64_t result;

  result = qword_255839370;
  if (!qword_255839370)
  {
    result = MEMORY[0x2276959F0](&unk_226335494, &type metadata for WebAuthenticationOperation.State);
    atomic_store(result, (unint64_t *)&qword_255839370);
  }
  return result;
}

unint64_t sub_226332590()
{
  unint64_t result;

  result = qword_255839050;
  if (!qword_255839050)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255839050);
  }
  return result;
}

uint64_t sub_2263325CC()
{
  uint64_t v0;

  return swift_deallocObject();
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

uint64_t sub_226332608(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  char *v7;
  void (*v8)(char *, void *);
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2558393B8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    sub_226333C78();
    v9 = sub_226333C84();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 0, 1, v9);
  }
  else
  {
    v10 = sub_226333C84();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  }
  swift_retain();
  v11 = a3;
  v8(v7, a3);
  swift_release();

  return sub_226332A64((uint64_t)v7, &qword_2558393B8);
}

unint64_t sub_226332708(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558393A8);
  v2 = sub_226333F30();
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
    sub_226332AA0(v6, (uint64_t)&v15, &qword_2558393B0);
    v7 = v15;
    v8 = v16;
    result = sub_226332844(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_2263328A8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_226332844(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_226333F90();
  sub_226333E1C();
  v4 = sub_226333FA8();
  return sub_2263328B8(a1, a2, v4);
}

_OWORD *sub_2263328A8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_2263328B8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if ((*v10 != a1 || v10[1] != a2) && (sub_226333F48() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_226333F48() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_226333F48() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_2263329FC()
{
  sub_226331278();
  return sub_226331340();
}

void sub_226332A20()
{
  sub_226331778();
}

uint64_t sub_226332A38()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_226332A5C(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_226331AC8(a1, a2, v2);
}

uint64_t sub_226332A64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_226332AA0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_226332AE4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for WebAuthenticationOperation.RequestContext(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void static WebAuthenticationSession.BrowserSession.ephemeral.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static WebAuthenticationSession.BrowserSession.shared.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static WebAuthenticationSession.BrowserSession.standalone.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

uint64_t WebAuthenticationSession.authenticate(using:callbackURLScheme:preferredBrowserSession:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 + 48) = a3;
  *(_QWORD *)(v6 + 56) = a4;
  *(_QWORD *)(v6 + 32) = a1;
  *(_QWORD *)(v6 + 40) = a2;
  *(_QWORD *)(v6 + 64) = *(_QWORD *)a5;
  *(_BYTE *)(v6 + 136) = *(_BYTE *)(a5 + 8);
  *(_OWORD *)(v6 + 72) = *v5;
  sub_226333E88();
  *(_QWORD *)(v6 + 88) = sub_226333E7C();
  *(_QWORD *)(v6 + 96) = sub_226333E58();
  *(_QWORD *)(v6 + 104) = v7;
  return swift_task_switch();
}

uint64_t sub_226332BEC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  __int128 v7;

  v1 = *(_BYTE *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v7 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 72);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v4;
  *(_OWORD *)(v4 + 16) = v7;
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 40) = v2;
  *(_BYTE *)(v4 + 48) = v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v5;
  *v5 = v0;
  v5[1] = sub_226332C90;
  return sub_226332FAC(*(_QWORD *)(v0 + 32), (uint64_t)sub_226332E7C, v4);
}

uint64_t sub_226332C90()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_226332CFC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_226332D30()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_226332D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  id v15;
  uint64_t v17;

  sub_226333C84();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v10 + 16))(v9, a1);
  v11 = (void *)objc_opt_self();
  v12 = (void *)sub_226333DEC();
  v13 = objc_msgSend(v11, sel_callbackWithCustomScheme_, v12);

  if ((a5 & 1) != 0)
    a4 = 0;
  v14 = sub_226332E8C(MEMORY[0x24BEE4AF8]);
  v15 = objc_allocWithZone((Class)type metadata accessor for WebAuthenticationOperation(0));
  return sub_226330CA8((uint64_t)v9, (uint64_t)v13, a4, v14);
}

id sub_226332E7C()
{
  uint64_t v0;

  return sub_226332D70(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 48));
}

unint64_t sub_226332E8C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255839400);
  v2 = (_QWORD *)sub_226333F30();
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
    result = sub_226333AB4(v5, v6);
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

uint64_t sub_226332FAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = a3;
  *(_QWORD *)(v4 + 16) = a1;
  *(_OWORD *)(v4 + 40) = *v3;
  *(_QWORD *)(v4 + 56) = sub_226333E88();
  *(_QWORD *)(v4 + 64) = sub_226333E7C();
  *(_QWORD *)(v4 + 72) = sub_226333E58();
  *(_QWORD *)(v4 + 80) = v5;
  return swift_task_switch();
}

uint64_t sub_226333028()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = (*(uint64_t (**)(void))(v0 + 24))();
  *(_QWORD *)(v0 + 88) = v3;
  v4 = (_QWORD *)(v3
                + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  v5 = *(_QWORD *)(v3
                 + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_presentationAnchorProvider);
  *v4 = v2;
  v4[1] = v1;
  swift_retain();
  sub_22632D754(v5);
  v6 = swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v6;
  *(_QWORD *)(v6 + 16) = v3;
  v7 = swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v7;
  *(_QWORD *)(v7 + 16) = v3;
  *(_QWORD *)(v0 + 112) = sub_226333E7C();
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v8;
  sub_226333C84();
  *v8 = v0;
  v8[1] = sub_226333134;
  return sub_226333F54();
}

uint64_t sub_226333134()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_2263331BC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2263331FC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 88);
  swift_release();

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t WebAuthenticationSession.authenticate(using:callback:preferredBrowserSession:additionalHeaderFields:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 + 48) = a3;
  *(_QWORD *)(v6 + 56) = a5;
  *(_QWORD *)(v6 + 32) = a1;
  *(_QWORD *)(v6 + 40) = a2;
  *(_QWORD *)(v6 + 64) = *(_QWORD *)a4;
  *(_BYTE *)(v6 + 136) = *(_BYTE *)(a4 + 8);
  *(_OWORD *)(v6 + 72) = *v5;
  sub_226333E88();
  *(_QWORD *)(v6 + 88) = sub_226333E7C();
  *(_QWORD *)(v6 + 96) = sub_226333E58();
  *(_QWORD *)(v6 + 104) = v7;
  return swift_task_switch();
}

uint64_t sub_2263332E4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_BYTE *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 72);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v4;
  *(_OWORD *)(v4 + 16) = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v4 + 32) = v2;
  *(_BYTE *)(v4 + 40) = v1;
  *(_QWORD *)(v4 + 48) = v3;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v5;
  *v5 = v0;
  v5[1] = sub_226333384;
  return sub_226332FAC(*(_QWORD *)(v0 + 32), (uint64_t)sub_2263334B4, v4);
}

uint64_t sub_226333384()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

id sub_2263333F0(uint64_t a1, void *a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  sub_226333C84();
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v12 + 16))(v11, a1);
  if ((a4 & 1) != 0)
    v13 = 0;
  else
    v13 = a3;
  objc_allocWithZone((Class)type metadata accessor for WebAuthenticationOperation(0));
  swift_bridgeObjectRetain();
  return sub_226330CA8((uint64_t)v11, (uint64_t)a2, v13, a5);
}

id sub_2263334B4()
{
  uint64_t v0;

  return sub_2263333F0(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_2263334C8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  v2[4] = sub_226333E88();
  v2[5] = sub_226333E7C();
  v2[6] = sub_226333E58();
  v2[7] = v3;
  return swift_task_switch();
}

uint64_t sub_226333538()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[3];
  v0[8] = sub_226333E7C();
  v2 = swift_task_alloc();
  v0[9] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[10] = v3;
  sub_226333C84();
  *v3 = v0;
  v3[1] = sub_22632D0D8;
  return sub_226333F60();
}

uint64_t sub_2263335F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t (**v9)(uint64_t);
  uint64_t v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558393F8);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v9 = (uint64_t (**)(uint64_t))(a2
                                        + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler);
  v10 = *(_QWORD *)(a2
                  + OBJC_IVAR____TtC31_AuthenticationServices_SwiftUI26WebAuthenticationOperation_authenticationCompletionHandler);
  *v9 = sub_226333A2C;
  v9[1] = (uint64_t (*)(uint64_t))v8;
  sub_22632D754(v10);
  return sub_226330DE4();
}

uint64_t sub_2263336DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD v9[2];

  v2 = sub_226333C84();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558393A0);
  MEMORY[0x24BDAC7A8]();
  v7 = (_QWORD *)((char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_226333A6C(a1, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9[1] = *v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558393F8);
    return sub_226333E64();
  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v3 + 32))(v5, v7, v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558393F8);
    return sub_226333E70();
  }
}

uint64_t EnvironmentValues.webAuthenticationSession.getter@<X0>(id (**a1)()@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v3 = sub_226333CC0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v1, v3);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v4 + 32))(v7 + v6, (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  *a1 = sub_22632D8C4;
  a1[1] = (id (*)())v7;
  return result;
}

uint64_t sub_2263338C8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_226333CC0();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

ValueMetadata *type metadata accessor for WebAuthenticationSession()
{
  return &type metadata for WebAuthenticationSession;
}

ValueMetadata *type metadata accessor for WebAuthenticationSession.BrowserSession()
{
  return &type metadata for WebAuthenticationSession.BrowserSession;
}

uint64_t sub_226333948(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22632D81C;
  return sub_2263334C8(a1, v4);
}

uint64_t sub_2263339A0()
{
  return sub_22633156C();
}

uint64_t sub_2263339C0(uint64_t a1)
{
  uint64_t v1;

  return sub_2263335F0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2263339C8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558393F8);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_226333A2C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558393F8);
  return sub_2263336DC(a1);
}

uint64_t sub_226333A6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558393A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_226333AB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_226333F90();
  sub_226333E1C();
  v4 = sub_226333FA8();
  return sub_226333B18(a1, a2, v4);
}

unint64_t sub_226333B18(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_226333F48() & 1) == 0)
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
      while (!v14 && (sub_226333F48() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_226333C00()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_226333C0C()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_226333C18()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_226333C24()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_226333C30()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_226333C3C()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_226333C48()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_226333C54()
{
  return MEMORY[0x24BDCD590]();
}

uint64_t sub_226333C60()
{
  return MEMORY[0x24BDCD598]();
}

uint64_t sub_226333C6C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_226333C78()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_226333C84()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_226333C90()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_226333C9C()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_226333CA8()
{
  return MEMORY[0x24BDEDF80]();
}

uint64_t sub_226333CB4()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_226333CC0()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_226333CCC()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_226333CD8()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_226333CE4()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_226333CF0()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_226333CFC()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_226333D08()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_226333D14()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_226333D20()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_226333D2C()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_226333D38()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_226333D44()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_226333D50()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_226333D5C()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_226333D68()
{
  return MEMORY[0x24BDF0AF0]();
}

uint64_t sub_226333D74()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_226333D80()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_226333D8C()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_226333D98()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_226333DA4()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_226333DB0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_226333DBC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_226333DC8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_226333DD4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_226333DE0()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_226333DEC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_226333DF8()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_226333E04()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_226333E10()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_226333E1C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_226333E28()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_226333E34()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_226333E40()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_226333E4C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_226333E58()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_226333E64()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_226333E70()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_226333E7C()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_226333E88()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_226333E94()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_226333EA0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_226333EAC()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_226333EB8()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_226333EC4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_226333ED0()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_226333EDC()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_226333EE8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_226333EF4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_226333F00()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_226333F0C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_226333F18()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_226333F24()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_226333F30()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_226333F3C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_226333F48()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_226333F54()
{
  return MEMORY[0x24BEE7098]();
}

uint64_t sub_226333F60()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_226333F6C()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_226333F78()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_226333F84()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_226333F90()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_226333F9C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_226333FA8()
{
  return MEMORY[0x24BEE4328]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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


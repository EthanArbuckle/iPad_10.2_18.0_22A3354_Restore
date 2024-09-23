id IMMultiFrameImageLogHandle()
{
  if (IMMultiFrameImageLogHandle_onceToken != -1)
    dispatch_once(&IMMultiFrameImageLogHandle_onceToken, &__block_literal_global);
  return (id)IMMultiFrameImageLogHandle_log;
}

void sub_1BEDBA6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void type metadata accessor for BlastDoorInstanceType(uint64_t a1)
{
  sub_1BEDBAB98(a1, &qword_1EF5781A8);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1BEDBAB3C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1BEDBAB5C(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_1BEDBAB98(a1, &qword_1EF5781B0);
}

void sub_1BEDBAB98(uint64_t a1, unint64_t *a2)
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

BOOL sub_1BEDBABDC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1BEDBABF0()
{
  sub_1BEDE9D58();
  sub_1BEDE9D64();
  return sub_1BEDE9D7C();
}

uint64_t sub_1BEDBAC34()
{
  return sub_1BEDE9D64();
}

uint64_t sub_1BEDBAC5C()
{
  sub_1BEDE9D58();
  sub_1BEDE9D64();
  return sub_1BEDE9D7C();
}

char *sub_1BEDBACAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  _QWORD v18[2];

  v3 = sub_1BEDE98E4();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BEDD69FC(7);
  if (!v0)
  {
    v8 = v6;
    if ((v6 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      if (!v6)
        return 0;
      v2 = sub_1BEDD6774(4);
      if ((v2 & 0x8000000000000000) == 0)
      {
        v9 = sub_1BEDD6564(v8);
        v1 = v9;
        v8 = v10;
        if (!v2)
        {
          sub_1BEDBB398(v9, v10);
          v11 = v1;
          v13 = v8;
          goto LABEL_12;
        }
        if (qword_1EF578198 == -1)
        {
LABEL_8:
          v18[1] = qword_1EF57C1E0;
          swift_bridgeObjectRetain();
          v11 = LiteMessageCompressor.decode(_:codecID:)(v1, v8, v2);
          v13 = v12;
          swift_bridgeObjectRelease();
          if (v13 >> 60 == 15)
          {
            sub_1BEDBB310();
            swift_allocError();
            *v14 = 1;
            swift_willThrow();
            goto LABEL_15;
          }
LABEL_12:
          sub_1BEDE98D8();
          v15 = sub_1BEDE98CC();
          if (v16)
          {
            v5 = (char *)v15;
            sub_1BEDBB354(v11, v13);
            sub_1BEDBB354(v1, v8);
            return v5;
          }
          sub_1BEDBB310();
          swift_allocError();
          *v17 = 0;
          swift_willThrow();
          sub_1BEDBB354(v11, v13);
LABEL_15:
          sub_1BEDBB354(v1, v8);
          return v5;
        }
LABEL_18:
        swift_once();
        goto LABEL_8;
      }
    }
    __break(1u);
    goto LABEL_18;
  }
  return v5;
}

uint64_t sub_1BEDBAED0(uint64_t a1, uint64_t a2)
{
  return sub_1BEDBB178(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1BEDBAEDC(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1BEDE98A8();
  *a2 = 0;
  return result;
}

uint64_t sub_1BEDBAF50(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1BEDE98B4();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1BEDBAFCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1BEDE98C0();
  v2 = sub_1BEDE989C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BEDBB00C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1BEDE989C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BEDBB050@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1BEDE98C0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BEDBB078()
{
  sub_1BEDBB12C(&qword_1EF5781D0, (uint64_t)&unk_1BEDEAA54);
  sub_1BEDBB12C(&qword_1EF5781D8, (uint64_t)&unk_1BEDEA9F4);
  return sub_1BEDE9BA8();
}

uint64_t sub_1BEDBB0E4()
{
  return sub_1BEDBB12C(&qword_1EF5781B8, (uint64_t)&unk_1BEDEA9B8);
}

uint64_t sub_1BEDBB108()
{
  return sub_1BEDBB12C(&qword_1EF5781C0, (uint64_t)&unk_1BEDEA98C);
}

uint64_t sub_1BEDBB12C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for BlastDoorInstanceType(255);
    result = MEMORY[0x1C3B85BE0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BEDBB16C(uint64_t a1, uint64_t a2)
{
  return sub_1BEDBB178(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1BEDBB178(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1BEDE98C0();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1BEDBB1B4()
{
  sub_1BEDE98C0();
  sub_1BEDE98FC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BEDBB1F4()
{
  uint64_t v0;

  sub_1BEDE98C0();
  sub_1BEDE9D58();
  sub_1BEDE98FC();
  v0 = sub_1BEDE9D7C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BEDBB264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1BEDE98C0();
  v2 = v1;
  if (v0 == sub_1BEDE98C0() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1BEDE9CD4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1BEDBB2EC()
{
  return sub_1BEDBB12C(&qword_1EF5781C8, (uint64_t)&unk_1BEDEAA28);
}

unint64_t sub_1BEDBB310()
{
  unint64_t result;

  result = qword_1EF5781E0;
  if (!qword_1EF5781E0)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEAB98, &type metadata for BitIteratorMessageContentError);
    atomic_store(result, (unint64_t *)&qword_1EF5781E0);
  }
  return result;
}

uint64_t sub_1BEDBB354(uint64_t a1, unint64_t a2)
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

uint64_t sub_1BEDBB398(uint64_t a1, unint64_t a2)
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

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BitIteratorMessageContentError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for BitIteratorMessageContentError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BEDBB4C4 + 4 * byte_1BEDEA955[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BEDBB4F8 + 4 * byte_1BEDEA950[v4]))();
}

uint64_t sub_1BEDBB4F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDBB500(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BEDBB508);
  return result;
}

uint64_t sub_1BEDBB514(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BEDBB51CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BEDBB520(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDBB528(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDBB534(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1BEDBB540(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BitIteratorMessageContentError()
{
  return &type metadata for BitIteratorMessageContentError;
}

unint64_t sub_1BEDBB55C()
{
  unint64_t result;

  result = qword_1EF5781E8;
  if (!qword_1EF5781E8)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEAB70, &type metadata for BitIteratorMessageContentError);
    atomic_store(result, (unint64_t *)&qword_1EF5781E8);
  }
  return result;
}

id MessagesBlastDoorInterface.__allocating_init(with:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_1BEDCD2E0(a1);

  return v4;
}

id MessagesBlastDoorInterface.init(with:)(void *a1)
{
  id v2;

  v2 = sub_1BEDCD2E0(a1);

  return v2;
}

void sub_1BEDBB63C(uint64_t a1, void (*a2)(void *, void *), uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v8 = a4(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v16 - v10;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x1E0C80A78]();
  v13 = (uint64_t *)((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BEDD4744(a1, (uint64_t)v13, a5);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = (void *)*v13;
    MEMORY[0x1C3B85B68](*v13);
    a2(0, v14);

  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v9 + 32))(v11, v13, v8);
    v15 = (void *)sub_1BEDE91F4();
    a2(v15, 0);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_1BEDBB794(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  unsigned __int8 v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  unsigned __int8 v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v60 = sub_1BEDE94C4();
  v3 = *(_QWORD *)(v60 - 8);
  MEMORY[0x1E0C80A78]();
  v59 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1BEDE92F0();
  v55 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v58 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1BEDE9464();
  v57 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16)
    || (v10 = sub_1BEDCD0D0(0xD00000000000001DLL, 0x80000001BEDECAE0), (v11 & 1) == 0)
    || (sub_1BEDCD69C(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)&v64),
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702F30),
        (swift_dynamicCast() & 1) == 0))
  {
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v36 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_1BEDEABE0;
    *(_QWORD *)&v64 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702F30);
    v38 = sub_1BEDE9710();
    v40 = v39;
    *(_QWORD *)(v37 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v37 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v37 + 32) = v38;
    *(_QWORD *)(v37 + 40) = v40;
    sub_1BEDE9074();

    swift_bridgeObjectRelease();
LABEL_34:
    sub_1BEDE9B6C();
    __break(1u);
    JUMPOUT(0x1BEDBC13CLL);
  }
  v12 = v63;
  v13 = *(_QWORD *)(v63 + 16);
  v56 = v3;
  if (v13)
  {
    v14 = sub_1BEDCD0D0(17263, 0xE200000000000000);
    if ((v15 & 1) != 0)
    {
      sub_1BEDCD69C(*(_QWORD *)(v12 + 56) + 32 * v14, (uint64_t)&v64);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v16 = v1;
        v17 = v62;
        swift_bridgeObjectRelease();
        goto LABEL_15;
      }
    }
  }
  if (*(_QWORD *)(v12 + 16) && (v18 = sub_1BEDCD0D0(99, 0xE100000000000000), (v19 & 1) != 0))
  {
    sub_1BEDCD69C(*(_QWORD *)(v12 + 56) + 32 * v18, (uint64_t)&v64);
  }
  else
  {
    v64 = 0u;
    v65 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v65 + 1))
  {
    sub_1BEDD4434((uint64_t)&v64, &qword_1ED702FF0);
    goto LABEL_33;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_33:
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v49 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = xmmword_1BEDEABE0;
    *(_QWORD *)&v64 = a1;
    v51 = sub_1BEDE9710();
    v53 = v52;
    *(_QWORD *)(v50 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v50 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v50 + 32) = v51;
    *(_QWORD *)(v50 + 40) = v53;
    sub_1BEDE9074();

    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  v16 = v1;
  v17 = v63;
LABEL_15:
  v20 = sub_1BEDE02E0(v17);
  if ((v20 & 0x100) != 0)
  {
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v41 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_1BEDEABE0;
    LOWORD(v64) = v17;
    v43 = sub_1BEDE9710();
    v45 = v44;
    *(_QWORD *)(v42 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v42 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v42 + 32) = v43;
    *(_QWORD *)(v42 + 40) = v45;
    sub_1BEDE9074();

    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  v21 = v20;
  v22 = (void *)objc_opt_self();
  v23 = (void *)sub_1BEDE9878();
  *(_QWORD *)&v64 = 0;
  v24 = objc_msgSend(v22, sel_dataWithPropertyList_format_options_error_, v23, 200, 0, &v64);

  v25 = (id)v64;
  if (!v24)
  {
    v46 = v25;
    v47 = (void *)sub_1BEDE8F48();

    swift_willThrow();
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v48 = (void *)sub_1BEDE9A4C();
    sub_1BEDE9074();

    goto LABEL_34;
  }
  v26 = sub_1BEDE8FF0();
  v28 = v27;

  v29 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v30 = NSUserDefaults.isMessagesLockdownModeEnabled.getter();

  if ((v30 & 1) != 0)
  {
    switch((char)v21)
    {
      case 'd':
        v31 = *(_QWORD *)(v61 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
        sub_1BEDD47C0(&qword_1EF578200, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02D00], MEMORY[0x1E0D02CF0]);
        v33 = v59;
        v32 = v60;
        sub_1BEDE91D0();
        if (!v16)
        {
          v31 = sub_1BEDE91F4();
          (*(void (**)(char *, uint64_t))(v56 + 8))(v33, v32);
        }
        break;
      case 'e':
      case 'p':
        v31 = *(_QWORD *)(v61 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
        sub_1BEDD47C0(&qword_1ED702F38, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02C78], MEMORY[0x1E0D02C70]);
        sub_1BEDE91D0();
        if (!v16)
        {
          v31 = sub_1BEDE91F4();
          (*(void (**)(char *, uint64_t))(v57 + 8))(v9, v7);
        }
        break;
      case 'f':
        v31 = *(_QWORD *)(v61 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
        sub_1BEDD47C0(&qword_1EF577CE8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02A30], MEMORY[0x1E0D02A28]);
        v34 = v58;
        sub_1BEDE91D0();
        if (!v16)
        {
          v31 = sub_1BEDE91F4();
          (*(void (**)(char *, uint64_t))(v55 + 8))(v34, v5);
        }
        break;
      default:
        *(_QWORD *)&v64 = 0;
        *((_QWORD *)&v64 + 1) = 0xE000000000000000;
        LOBYTE(v63) = v21;
        sub_1BEDE9B54();
        v31 = v64;
        sub_1BEDE9854();
        sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
        swift_allocError();
        sub_1BEDE9848();
        swift_willThrow();
        break;
    }
    sub_1BEDBB354(v26, v28);
  }
  else
  {
    v31 = sub_1BEDBC170(v21, v61, v26, v28);
    sub_1BEDBB354(v26, v28);
  }
  return v31;
}

uint64_t sub_1BEDBC170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t *v34;
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
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v52[14];
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  _BYTE v84[24];

  v80 = a4;
  v78 = a2;
  v79 = a3;
  v77 = sub_1BEDE971C();
  v52[13] = *(_QWORD *)(v77 - 8);
  MEMORY[0x1E0C80A78]();
  v76 = (char *)v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = sub_1BEDE9620();
  v52[12] = *(_QWORD *)(v75 - 8);
  MEMORY[0x1E0C80A78]();
  v74 = (char *)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_1BEDE9698();
  v52[11] = *(_QWORD *)(v73 - 8);
  MEMORY[0x1E0C80A78]();
  v72 = (char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = sub_1BEDE96EC();
  v52[10] = *(_QWORD *)(v71 - 8);
  MEMORY[0x1E0C80A78]();
  v70 = (char *)v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_1BEDE95B4();
  v52[9] = *(_QWORD *)(v69 - 8);
  MEMORY[0x1E0C80A78]();
  v68 = (char *)v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_1BEDE9524();
  v52[8] = *(_QWORD *)(v67 - 8);
  MEMORY[0x1E0C80A78]();
  v66 = (char *)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = sub_1BEDE92FC();
  v52[7] = *(_QWORD *)(v65 - 8);
  MEMORY[0x1E0C80A78]();
  v64 = (char *)v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = sub_1BEDE9584();
  v52[6] = *(_QWORD *)(v63 - 8);
  MEMORY[0x1E0C80A78]();
  v62 = (char *)v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_1BEDE9614();
  v52[5] = *(_QWORD *)(v61 - 8);
  MEMORY[0x1E0C80A78]();
  v60 = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_1BEDE962C();
  v52[4] = *(_QWORD *)(v59 - 8);
  MEMORY[0x1E0C80A78]();
  v58 = (char *)v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_1BEDE9518();
  v52[3] = *(_QWORD *)(v57 - 8);
  MEMORY[0x1E0C80A78]();
  v56 = (char *)v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_1BEDE9428();
  v52[2] = *(_QWORD *)(v55 - 8);
  MEMORY[0x1E0C80A78]();
  v54 = (char *)v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_1BEDE92F0();
  v52[1] = *(_QWORD *)(v53 - 8);
  MEMORY[0x1E0C80A78]();
  v17 = (char *)v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1BEDE94D0();
  v52[0] = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78]();
  v20 = (char *)v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1BEDE9464();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78]();
  v24 = (char *)v52 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_1BEDE9308();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x1E0C80A78]();
  v29 = (char *)v52 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(v27)
  {
    case 100:
      v30 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1EF577CD0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02A50], MEMORY[0x1E0D02A40]);
      v32 = v64;
      v31 = v65;
      v33 = v81;
      sub_1BEDE91D0();
      if (!v33)
      {
        v30 = sub_1BEDE91F4();
        v34 = &v78;
        goto LABEL_33;
      }
      break;
    case 101:
      v30 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1ED702F38, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02C78], MEMORY[0x1E0D02C70]);
      v35 = v81;
      sub_1BEDE91D0();
      if (!v35)
      {
        v30 = sub_1BEDE91F4();
        (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
      }
      break;
    case 102:
      v36 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1EF577CE8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02A30], MEMORY[0x1E0D02A28]);
      v32 = v17;
      v31 = v53;
      v30 = v36;
      v37 = v81;
      sub_1BEDE91D0();
      if (!v37)
      {
        v30 = sub_1BEDE91F4();
        v34 = (uint64_t *)&v72;
        goto LABEL_33;
      }
      break;
    case 105:
      v30 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1EF578250, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02BE0], MEMORY[0x1E0D02BD8]);
      v32 = v54;
      v31 = v55;
      v38 = v81;
      sub_1BEDE91D0();
      if (!v38)
      {
        v30 = sub_1BEDE91F4();
        v34 = &v73;
        goto LABEL_33;
      }
      break;
    case 111:
      v30 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1EF578248, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02D88], MEMORY[0x1E0D02D80]);
      v32 = v56;
      v31 = v57;
      v39 = v81;
      sub_1BEDE91D0();
      if (!v39)
      {
        v30 = sub_1BEDE91F4();
        v34 = (uint64_t *)&v74;
        goto LABEL_33;
      }
      break;
    case 112:
      v30 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1EF578240, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02FB0], MEMORY[0x1E0D02FA8]);
      v32 = v58;
      v31 = v59;
      v40 = v81;
      sub_1BEDE91D0();
      if (!v40)
      {
        v30 = sub_1BEDE91F4();
        v34 = &v75;
        goto LABEL_33;
      }
      break;
    case 113:
      v30 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1EF578238, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02F70], MEMORY[0x1E0D02F68]);
      v32 = v60;
      v31 = v61;
      v41 = v81;
      sub_1BEDE91D0();
      if (!v41)
      {
        v30 = sub_1BEDE91F4();
        v34 = (uint64_t *)&v76;
        goto LABEL_33;
      }
      break;
    case 116:
      v30 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1EF578228, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02DA8], MEMORY[0x1E0D02DA0]);
      v32 = v66;
      v31 = v67;
      v42 = v81;
      sub_1BEDE91D0();
      if (!v42)
      {
        v30 = sub_1BEDE91F4();
        v34 = &v79;
        goto LABEL_33;
      }
      break;
    case 118:
      v30 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1EF578230, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02E18], MEMORY[0x1E0D02E08]);
      v32 = v62;
      v31 = v63;
      v43 = v81;
      sub_1BEDE91D0();
      if (!v43)
      {
        v30 = sub_1BEDE91F4();
        v34 = &v77;
        goto LABEL_33;
      }
      break;
    case 119:
      v30 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1EF578220, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02E88], MEMORY[0x1E0D02E80]);
      v32 = v68;
      v31 = v69;
      v44 = v81;
      sub_1BEDE91D0();
      if (!v44)
      {
        v30 = sub_1BEDE91F4();
        v34 = &v80;
        goto LABEL_33;
      }
      break;
    case 120:
      v30 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1EF578260, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02A70], MEMORY[0x1E0D02A60]);
      v45 = v81;
      sub_1BEDE91D0();
      if (!v45)
      {
        v30 = sub_1BEDE91F4();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v25);
      }
      break;
    case 122:
      v30 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1EF578460, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03070], MEMORY[0x1E0D03068]);
      v32 = v72;
      v31 = v73;
      v46 = v81;
      sub_1BEDE91D0();
      if (!v46)
      {
        v30 = sub_1BEDE91F4();
        v34 = &v82;
        goto LABEL_33;
      }
      break;
    case -122:
      v30 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1EF578210, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02F90], MEMORY[0x1E0D02F80]);
      v32 = v74;
      v31 = v75;
      v47 = v81;
      sub_1BEDE91D0();
      if (!v47)
      {
        v30 = sub_1BEDE91F4();
        v34 = (uint64_t *)&v83;
        goto LABEL_33;
      }
      break;
    case -121:
      v30 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1EF578208, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03168], MEMORY[0x1E0D03158]);
      v32 = v76;
      v31 = v77;
      v48 = v81;
      sub_1BEDE91D0();
      if (!v48)
      {
        v30 = sub_1BEDE91F4();
        v34 = (uint64_t *)v84;
        goto LABEL_33;
      }
      break;
    case -117:
      v30 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1EF578218, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03128], MEMORY[0x1E0D03118]);
      v32 = v70;
      v31 = v71;
      v49 = v81;
      sub_1BEDE91D0();
      if (!v49)
      {
        v30 = sub_1BEDE91F4();
        v34 = &v81;
LABEL_33:
        (*(void (**)(char *, uint64_t))(*(v34 - 32) + 8))(v32, v31);
      }
      break;
    case -86:
      v30 = *(_QWORD *)(v78 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1BEDD47C0(&qword_1EF578258, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02D20], MEMORY[0x1E0D02D18]);
      v50 = v81;
      sub_1BEDE91D0();
      if (!v50)
      {
        v30 = sub_1BEDE91F4();
        (*(void (**)(char *, uint64_t))(v52[0] + 8))(v20, v18);
      }
      break;
    default:
      v82 = 0;
      v83 = 0xE000000000000000;
      v84[23] = v27;
      sub_1BEDE9B54();
      v30 = v83;
      sub_1BEDE9854();
      sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
      swift_allocError();
      sub_1BEDE9848();
      swift_willThrow();
      break;
  }
  return v30;
}

uint64_t sub_1BEDBCEC8(uint64_t a1, void (*a2)(uint64_t, _QWORD, void *), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  unsigned __int8 v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t);
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t result;
  uint64_t v48;
  uint64_t (*v49)(uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t);
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE v93[24];
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v6 = sub_1BEDE9854();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = &v93[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (!*(_QWORD *)(a1 + 16)
    || (v10 = sub_1BEDCD0D0(0xD00000000000001DLL, 0x80000001BEDECAE0), (v11 & 1) == 0)
    || (sub_1BEDCD69C(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)&v95),
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702F30),
        (swift_dynamicCast() & 1) == 0))
  {
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v75 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v76 = swift_allocObject();
    *(_OWORD *)(v76 + 16) = xmmword_1BEDEABE0;
    *(_QWORD *)&v95 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702F30);
    v77 = sub_1BEDE9710();
    v79 = v78;
    *(_QWORD *)(v76 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v76 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v76 + 32) = v77;
    *(_QWORD *)(v76 + 40) = v79;
    sub_1BEDE9074();

    swift_bridgeObjectRelease();
LABEL_41:
    sub_1BEDE9B6C();
    __break(1u);
    JUMPOUT(0x1BEDBDF90);
  }
  v12 = v94;
  if (*(_QWORD *)(v94 + 16))
  {
    v13 = sub_1BEDCD0D0(17263, 0xE200000000000000);
    if ((v14 & 1) != 0)
    {
      sub_1BEDCD69C(*(_QWORD *)(v12 + 56) + 32 * v13, (uint64_t)&v95);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v15 = v93[15];
        swift_bridgeObjectRelease();
        goto LABEL_15;
      }
    }
  }
  if (*(_QWORD *)(v12 + 16) && (v16 = sub_1BEDCD0D0(99, 0xE100000000000000), (v17 & 1) != 0))
  {
    sub_1BEDCD69C(*(_QWORD *)(v12 + 56) + 32 * v16, (uint64_t)&v95);
  }
  else
  {
    v95 = 0u;
    v96 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v96 + 1))
  {
    sub_1BEDD4434((uint64_t)&v95, &qword_1ED702FF0);
    goto LABEL_40;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_40:
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v88 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v89 = swift_allocObject();
    *(_OWORD *)(v89 + 16) = xmmword_1BEDEABE0;
    *(_QWORD *)&v95 = a1;
    v90 = sub_1BEDE9710();
    v92 = v91;
    *(_QWORD *)(v89 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v89 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v89 + 32) = v90;
    *(_QWORD *)(v89 + 40) = v92;
    sub_1BEDE9074();

    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  v15 = v94;
LABEL_15:
  v18 = sub_1BEDE02E0(v15);
  if ((v18 & 0x100) != 0)
  {
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v80 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v81 = swift_allocObject();
    *(_OWORD *)(v81 + 16) = xmmword_1BEDEABE0;
    LOWORD(v95) = v15;
    v82 = sub_1BEDE9710();
    v84 = v83;
    *(_QWORD *)(v81 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v81 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v81 + 32) = v82;
    *(_QWORD *)(v81 + 40) = v84;
    sub_1BEDE9074();

    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  v19 = v18;
  v20 = (void *)objc_opt_self();
  v21 = (void *)sub_1BEDE9878();
  *(_QWORD *)&v95 = 0;
  v22 = objc_msgSend(v20, sel_dataWithPropertyList_format_options_error_, v21, 200, 0, &v95);

  v23 = (id)v95;
  if (!v22)
  {
    v85 = v23;
    v86 = (void *)sub_1BEDE8F48();

    swift_willThrow();
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v87 = (void *)sub_1BEDE9A4C();
    sub_1BEDE9074();

    goto LABEL_41;
  }
  v24 = sub_1BEDE8FF0();
  v26 = v25;

  switch((char)v19)
  {
    case 100:
      v27 = swift_allocObject();
      *(_QWORD *)(v27 + 16) = a2;
      *(_QWORD *)(v27 + 24) = a3;
      *(_BYTE *)(v27 + 32) = 100;
      sub_1BEDE92FC();
      v28 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02A50];
      v29 = swift_allocObject();
      *(_QWORD *)(v29 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v29 + 24) = v27;
      sub_1BEDD47C0(&qword_1EF577CD0, v28, MEMORY[0x1E0D02A40]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 101:
      v51 = swift_allocObject();
      *(_QWORD *)(v51 + 16) = a2;
      *(_QWORD *)(v51 + 24) = a3;
      *(_BYTE *)(v51 + 32) = 101;
      sub_1BEDE9464();
      v52 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02C78];
      v53 = swift_allocObject();
      *(_QWORD *)(v53 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v53 + 24) = v51;
      sub_1BEDD47C0(&qword_1ED702F38, v52, MEMORY[0x1E0D02C70]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 102:
      v36 = swift_allocObject();
      *(_QWORD *)(v36 + 16) = a2;
      *(_QWORD *)(v36 + 24) = a3;
      *(_BYTE *)(v36 + 32) = 102;
      sub_1BEDE92F0();
      v37 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02A30];
      v38 = swift_allocObject();
      *(_QWORD *)(v38 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v38 + 24) = v36;
      sub_1BEDD47C0(&qword_1EF577CE8, v37, MEMORY[0x1E0D02A28]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 105:
      v60 = swift_allocObject();
      *(_QWORD *)(v60 + 16) = a2;
      *(_QWORD *)(v60 + 24) = a3;
      *(_BYTE *)(v60 + 32) = 105;
      sub_1BEDE9428();
      v61 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02BE0];
      v62 = swift_allocObject();
      *(_QWORD *)(v62 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v62 + 24) = v60;
      sub_1BEDD47C0(&qword_1EF578250, v61, MEMORY[0x1E0D02BD8]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 111:
      v63 = swift_allocObject();
      *(_QWORD *)(v63 + 16) = a2;
      *(_QWORD *)(v63 + 24) = a3;
      *(_BYTE *)(v63 + 32) = 111;
      sub_1BEDE9518();
      v64 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02D88];
      v65 = swift_allocObject();
      *(_QWORD *)(v65 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v65 + 24) = v63;
      sub_1BEDD47C0(&qword_1EF578248, v64, MEMORY[0x1E0D02D80]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 112:
      v39 = swift_allocObject();
      *(_QWORD *)(v39 + 16) = a2;
      *(_QWORD *)(v39 + 24) = a3;
      *(_BYTE *)(v39 + 32) = 112;
      sub_1BEDE962C();
      v40 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02FB0];
      v41 = swift_allocObject();
      *(_QWORD *)(v41 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v41 + 24) = v39;
      sub_1BEDD47C0(&qword_1EF578240, v40, MEMORY[0x1E0D02FA8]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 113:
      v54 = swift_allocObject();
      *(_QWORD *)(v54 + 16) = a2;
      *(_QWORD *)(v54 + 24) = a3;
      *(_BYTE *)(v54 + 32) = 113;
      sub_1BEDE9614();
      v55 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02F70];
      v56 = swift_allocObject();
      *(_QWORD *)(v56 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v56 + 24) = v54;
      sub_1BEDD47C0(&qword_1EF578238, v55, MEMORY[0x1E0D02F68]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 116:
      v57 = swift_allocObject();
      *(_QWORD *)(v57 + 16) = a2;
      *(_QWORD *)(v57 + 24) = a3;
      *(_BYTE *)(v57 + 32) = 116;
      sub_1BEDE9524();
      v58 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02DA8];
      v59 = swift_allocObject();
      *(_QWORD *)(v59 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v59 + 24) = v57;
      sub_1BEDD47C0(&qword_1EF578228, v58, MEMORY[0x1E0D02DA0]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 118:
      v72 = swift_allocObject();
      *(_QWORD *)(v72 + 16) = a2;
      *(_QWORD *)(v72 + 24) = a3;
      *(_BYTE *)(v72 + 32) = 118;
      sub_1BEDE9584();
      v73 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02E18];
      v74 = swift_allocObject();
      *(_QWORD *)(v74 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v74 + 24) = v72;
      sub_1BEDD47C0(&qword_1EF578230, v73, MEMORY[0x1E0D02E08]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 119:
      v66 = swift_allocObject();
      *(_QWORD *)(v66 + 16) = a2;
      *(_QWORD *)(v66 + 24) = a3;
      *(_BYTE *)(v66 + 32) = 119;
      sub_1BEDE95B4();
      v67 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02E88];
      v68 = swift_allocObject();
      *(_QWORD *)(v68 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v68 + 24) = v66;
      sub_1BEDD47C0(&qword_1EF578220, v67, MEMORY[0x1E0D02E80]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 120:
      v33 = swift_allocObject();
      *(_QWORD *)(v33 + 16) = a2;
      *(_QWORD *)(v33 + 24) = a3;
      *(_BYTE *)(v33 + 32) = 120;
      sub_1BEDE9308();
      v34 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02A70];
      v35 = swift_allocObject();
      *(_QWORD *)(v35 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v35 + 24) = v33;
      sub_1BEDD47C0(&qword_1EF578260, v34, MEMORY[0x1E0D02A60]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case -122:
      v48 = swift_allocObject();
      *(_QWORD *)(v48 + 16) = a2;
      *(_QWORD *)(v48 + 24) = a3;
      *(_BYTE *)(v48 + 32) = -122;
      sub_1BEDE9620();
      v49 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02F90];
      v50 = swift_allocObject();
      *(_QWORD *)(v50 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v50 + 24) = v48;
      sub_1BEDD47C0(&qword_1EF578210, v49, MEMORY[0x1E0D02F80]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case -121:
      v42 = swift_allocObject();
      *(_QWORD *)(v42 + 16) = a2;
      *(_QWORD *)(v42 + 24) = a3;
      *(_BYTE *)(v42 + 32) = -121;
      sub_1BEDE971C();
      v43 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D03168];
      v44 = swift_allocObject();
      *(_QWORD *)(v44 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v44 + 24) = v42;
      sub_1BEDD47C0(&qword_1EF578208, v43, MEMORY[0x1E0D03158]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case -117:
      v30 = swift_allocObject();
      *(_QWORD *)(v30 + 16) = a2;
      *(_QWORD *)(v30 + 24) = a3;
      *(_BYTE *)(v30 + 32) = -117;
      sub_1BEDE96EC();
      v31 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D03128];
      v32 = swift_allocObject();
      *(_QWORD *)(v32 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v32 + 24) = v30;
      sub_1BEDD47C0(&qword_1EF578218, v31, MEMORY[0x1E0D03118]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case -86:
      v69 = swift_allocObject();
      *(_QWORD *)(v69 + 16) = a2;
      *(_QWORD *)(v69 + 24) = a3;
      *(_BYTE *)(v69 + 32) = -86;
      sub_1BEDE94D0();
      v70 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02D20];
      v71 = swift_allocObject();
      *(_QWORD *)(v71 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v71 + 24) = v69;
      sub_1BEDD47C0(&qword_1EF578258, v70, MEMORY[0x1E0D02D18]);
      swift_retain();
      swift_retain();
LABEL_34:
      sub_1BEDE91C4();
      swift_release();
      sub_1BEDBB354(v24, v26);
      result = swift_release();
      break;
    default:
      *(_QWORD *)&v95 = 0;
      *((_QWORD *)&v95 + 1) = 0xE000000000000000;
      LOBYTE(v94) = v19;
      sub_1BEDE9B54();
      sub_1BEDE9848();
      sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
      v45 = (void *)swift_allocError();
      (*(void (**)(uint64_t, _BYTE *, uint64_t))(v7 + 16))(v46, v9, v6);
      a2(v19, 0, v45);
      sub_1BEDBB354(v24, v26);

      result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
      break;
  }
  return result;
}

void sub_1BEDBE0B8(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;

  if (a3)
    v7 = sub_1BEDE8F3C();
  else
    v7 = 0;
  v8 = (id)v7;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(a4 + 16))(a4, a1, a2);

}

uint64_t sub_1BEDBE120(uint64_t a1, void (*a2)(uint64_t, _QWORD, void *), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  unsigned __int8 v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  uint64_t v35;
  uint64_t result;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE v57[24];
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = sub_1BEDE9854();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = &v57[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (!*(_QWORD *)(a1 + 16)
    || (v10 = sub_1BEDCD0D0(0xD00000000000001DLL, 0x80000001BEDECAE0), (v11 & 1) == 0)
    || (sub_1BEDCD69C(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)&v59),
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702F30),
        (swift_dynamicCast() & 1) == 0))
  {
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v39 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_1BEDEABE0;
    *(_QWORD *)&v59 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702F30);
    v41 = sub_1BEDE9710();
    v43 = v42;
    *(_QWORD *)(v40 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v40 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v40 + 32) = v41;
    *(_QWORD *)(v40 + 40) = v43;
    sub_1BEDE9074();

    swift_bridgeObjectRelease();
LABEL_29:
    sub_1BEDE9B6C();
    __break(1u);
    JUMPOUT(0x1BEDBEA5CLL);
  }
  v12 = v58;
  if (*(_QWORD *)(v58 + 16))
  {
    v13 = sub_1BEDCD0D0(17263, 0xE200000000000000);
    if ((v14 & 1) != 0)
    {
      sub_1BEDCD69C(*(_QWORD *)(v12 + 56) + 32 * v13, (uint64_t)&v59);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v15 = v57[15];
        swift_bridgeObjectRelease();
        goto LABEL_15;
      }
    }
  }
  if (*(_QWORD *)(v12 + 16) && (v16 = sub_1BEDCD0D0(99, 0xE100000000000000), (v17 & 1) != 0))
  {
    sub_1BEDCD69C(*(_QWORD *)(v12 + 56) + 32 * v16, (uint64_t)&v59);
  }
  else
  {
    v59 = 0u;
    v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v60 + 1))
  {
    sub_1BEDD4434((uint64_t)&v59, &qword_1ED702FF0);
    goto LABEL_28;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_28:
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v52 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v53 = swift_allocObject();
    *(_OWORD *)(v53 + 16) = xmmword_1BEDEABE0;
    *(_QWORD *)&v59 = a1;
    v54 = sub_1BEDE9710();
    v56 = v55;
    *(_QWORD *)(v53 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v53 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v53 + 32) = v54;
    *(_QWORD *)(v53 + 40) = v56;
    sub_1BEDE9074();

    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  v15 = v58;
LABEL_15:
  v18 = sub_1BEDE02E0(v15);
  if ((v18 & 0x100) != 0)
  {
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v44 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_1BEDEABE0;
    LOWORD(v59) = v15;
    v46 = sub_1BEDE9710();
    v48 = v47;
    *(_QWORD *)(v45 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v45 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v45 + 32) = v46;
    *(_QWORD *)(v45 + 40) = v48;
    sub_1BEDE9074();

    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  v19 = v18;
  v20 = (void *)objc_opt_self();
  v21 = (void *)sub_1BEDE9878();
  *(_QWORD *)&v59 = 0;
  v22 = objc_msgSend(v20, sel_dataWithPropertyList_format_options_error_, v21, 200, 0, &v59);

  v23 = (id)v59;
  if (!v22)
  {
    v49 = v23;
    v50 = (void *)sub_1BEDE8F48();

    swift_willThrow();
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v51 = (void *)sub_1BEDE9A4C();
    sub_1BEDE9074();

    goto LABEL_29;
  }
  v24 = sub_1BEDE8FF0();
  v26 = v25;

  switch((char)v19)
  {
    case 'd':
      v30 = swift_allocObject();
      *(_QWORD *)(v30 + 16) = a2;
      *(_QWORD *)(v30 + 24) = a3;
      *(_BYTE *)(v30 + 32) = 100;
      sub_1BEDE94C4();
      v31 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02D00];
      v32 = swift_allocObject();
      *(_QWORD *)(v32 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v32 + 24) = v30;
      sub_1BEDD47C0(&qword_1EF578200, v31, MEMORY[0x1E0D02CF0]);
      swift_retain();
      swift_retain();
      goto LABEL_21;
    case 'e':
    case 'p':
      v27 = swift_allocObject();
      *(_QWORD *)(v27 + 16) = a2;
      *(_QWORD *)(v27 + 24) = a3;
      sub_1BEDE9464();
      v28 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02C78];
      v29 = swift_allocObject();
      *(_QWORD *)(v29 + 16) = sub_1BEDCDA24;
      *(_QWORD *)(v29 + 24) = v27;
      sub_1BEDD47C0(&qword_1ED702F38, v28, MEMORY[0x1E0D02C70]);
      swift_retain();
      swift_retain();
      goto LABEL_21;
    case 'f':
      v33 = swift_allocObject();
      *(_QWORD *)(v33 + 16) = a2;
      *(_QWORD *)(v33 + 24) = a3;
      *(_BYTE *)(v33 + 32) = 102;
      sub_1BEDE92F0();
      v34 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02A30];
      v35 = swift_allocObject();
      *(_QWORD *)(v35 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v35 + 24) = v33;
      sub_1BEDD47C0(&qword_1EF577CE8, v34, MEMORY[0x1E0D02A28]);
      swift_retain();
      swift_retain();
LABEL_21:
      sub_1BEDE91C4();
      swift_release();
      sub_1BEDBB354(v24, v26);
      result = swift_release();
      break;
    default:
      *(_QWORD *)&v59 = 0;
      *((_QWORD *)&v59 + 1) = 0xE000000000000000;
      LOBYTE(v58) = v19;
      sub_1BEDE9B54();
      sub_1BEDE9848();
      sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
      v37 = (void *)swift_allocError();
      (*(void (**)(uint64_t, _BYTE *, uint64_t))(v7 + 16))(v38, v9, v6);
      a2(v19, 0, v37);
      sub_1BEDBB354(v24, v26);

      result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
      break;
  }
  return result;
}

uint64_t sub_1BEDBEA9C(void *a1, int a2, int a3, void *aBlock, void (*a5)(uint64_t, id, void *))
{
  void *v7;
  uint64_t v8;
  id v9;

  v7 = _Block_copy(aBlock);
  v8 = sub_1BEDE9884();
  _Block_copy(v7);
  v9 = a1;
  a5(v8, v9, v7);
  _Block_release(v7);
  _Block_release(v7);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BEDBEB34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  void *v15;
  void *v16;
  void *v17;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = sub_1BEDE9278();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void *)objc_opt_self();
  v7 = (void *)sub_1BEDE9878();
  v18[0] = 0;
  v8 = objc_msgSend(v6, sel_dataWithPropertyList_format_options_error_, v7, 200, 0, v18);

  v9 = v18[0];
  if (v8)
  {
    v10 = sub_1BEDE8FF0();
    v12 = v11;

    v13 = *(_QWORD *)(v0 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
    sub_1BEDD47C0(&qword_1EF577CF8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02978], MEMORY[0x1E0D02970]);
    sub_1BEDE91D0();
    if (!v1)
    {
      v13 = sub_1BEDE91F4();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    sub_1BEDBB354(v10, v12);
    return v13;
  }
  else
  {
    v15 = v9;
    v16 = (void *)sub_1BEDE8F48();

    swift_willThrow();
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v17 = (void *)sub_1BEDE9A4C();
    sub_1BEDE9074();

    result = sub_1BEDE9B6C();
    __break(1u);
  }
  return result;
}

uint64_t sub_1BEDBEDDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t result;
  void *v16;
  void *v17;
  void *v18;
  id v19[2];

  v19[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_self();
  v6 = (void *)sub_1BEDE9878();
  v19[0] = 0;
  v7 = objc_msgSend(v5, sel_dataWithPropertyList_format_options_error_, v6, 200, 0, v19);

  v8 = v19[0];
  if (v7)
  {
    v9 = sub_1BEDE8FF0();
    v11 = v10;

    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = a2;
    *(_QWORD *)(v12 + 24) = a3;
    sub_1BEDE9278();
    v13 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02978];
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = sub_1BEDCDA50;
    *(_QWORD *)(v14 + 24) = v12;
    sub_1BEDD47C0(&qword_1EF577CF8, v13, MEMORY[0x1E0D02970]);
    swift_retain();
    swift_retain();
    sub_1BEDE91C4();
    swift_release();
    swift_release();
    return sub_1BEDBB354(v9, v11);
  }
  else
  {
    v16 = v8;
    v17 = (void *)sub_1BEDE8F48();

    swift_willThrow();
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v18 = (void *)sub_1BEDE9A4C();
    sub_1BEDE9074();

    result = sub_1BEDE9B6C();
    __break(1u);
  }
  return result;
}

uint64_t sub_1BEDBF088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v28 = a1;
  v29 = a2;
  v6 = sub_1BEDE9674();
  v25 = *(_QWORD *)(v6 - 8);
  v26 = v6;
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_1BEDE968C();
  v24 = *(_QWORD *)(v30 - 8);
  MEMORY[0x1E0C80A78]();
  v27 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BEDE99E0();
  sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
  v11 = (void *)sub_1BEDE9A4C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1BEDEABE0;
  v31 = a3;
  v32 = a4;
  v13 = MEMORY[0x1E0DEA968];
  v14 = sub_1BEDE9710();
  v16 = v15;
  *(_QWORD *)(v12 + 56) = v13;
  *(_QWORD *)(v12 + 64) = sub_1BEDCD658();
  *(_QWORD *)(v12 + 32) = v14;
  *(_QWORD *)(v12 + 40) = v16;
  sub_1BEDE9074();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v17 = v33;
  sub_1BEDE9668();
  if (!v17)
  {
    v19 = v24;
    v18 = v25;
    v20 = v26;
    sub_1BEDD47C0(&qword_1EF578268, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03038], MEMORY[0x1E0D03030]);
    v21 = v27;
    v22 = v30;
    sub_1BEDE91AC();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v20);
    v10 = sub_1BEDE9680();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v22);
  }
  return v10;
}

uint64_t sub_1BEDBF3D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v24 = a5;
  v25 = a6;
  v21[1] = a1;
  v21[2] = a2;
  v8 = sub_1BEDE9674();
  v22 = *(_QWORD *)(v8 - 8);
  v23 = v8;
  MEMORY[0x1E0C80A78]();
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEDE99E0();
  sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
  v11 = (void *)sub_1BEDE9A4C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1BEDEABE0;
  v26 = a3;
  v27 = a4;
  v13 = MEMORY[0x1E0DEA968];
  v14 = sub_1BEDE9710();
  v16 = v15;
  *(_QWORD *)(v12 + 56) = v13;
  *(_QWORD *)(v12 + 64) = sub_1BEDCD658();
  *(_QWORD *)(v12 + 32) = v14;
  *(_QWORD *)(v12 + 40) = v16;
  sub_1BEDE9074();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1BEDE9668();
  sub_1BEDE968C();
  v17 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D03038];
  v18 = swift_allocObject();
  v19 = v25;
  *(_QWORD *)(v18 + 16) = v24;
  *(_QWORD *)(v18 + 24) = v19;
  sub_1BEDD47C0(&qword_1EF578268, v17, MEMORY[0x1E0D03030]);
  swift_retain();
  sub_1BEDE9194();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v10, v23);
}

uint64_t sub_1BEDBF6DC(uint64_t a1, uint64_t a2, char a3, void (*a4)(_QWORD, void *), uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  void *v19;
  uint64_t v20;
  _BYTE v21[16];
  uint64_t v22;
  unint64_t v23;

  v8 = sub_1BEDE9854();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78]();
  v11 = &v21[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a3 == 1)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = a4;
    *(_QWORD *)(v15 + 24) = a5;
    sub_1BEDE9434();
    v16 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02C20];
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = sub_1BEDD4894;
    *(_QWORD *)(v17 + 24) = v15;
    sub_1BEDD47C0(&qword_1EF578270, v16, MEMORY[0x1E0D02C10]);
    swift_retain();
    swift_retain();
    goto LABEL_5;
  }
  if (!a3)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = a4;
    *(_QWORD *)(v12 + 24) = a5;
    sub_1BEDE95D8();
    v13 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02EE8];
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = sub_1BEDD4894;
    *(_QWORD *)(v14 + 24) = v12;
    sub_1BEDD47C0(&qword_1EF578278, v13, MEMORY[0x1E0D02EE0]);
    swift_retain();
    swift_retain();
LABEL_5:
    sub_1BEDE91C4();
    swift_release();
    return swift_release();
  }
  v22 = 0;
  v23 = 0xE000000000000000;
  v21[15] = a3;
  sub_1BEDE9B54();
  sub_1BEDE9848();
  sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
  v19 = (void *)swift_allocError();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v9 + 16))(v20, v11, v8);
  a4(0, v19);

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1BEDBFAB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = a3;
  v4 = sub_1BEDE9410();
  v25 = *(_QWORD *)(v4 - 8);
  v26 = v4;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1BEDE9770();
  v23 = *(_QWORD *)(v7 - 8);
  v24 = v7;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FC0);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BEDE97C4();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v22 - v17;
  sub_1BEDE8F90();
  sub_1BEDE9794();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  sub_1BEDE9764();
  sub_1BEDE9404();
  sub_1BEDE941C();
  v19 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02BC0];
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a2;
  *(_QWORD *)(v20 + 24) = v27;
  sub_1BEDD47C0(&qword_1EF577D08, v19, MEMORY[0x1E0D02BB8]);
  swift_retain();
  sub_1BEDE91A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v26);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
}

void sub_1BEDBFE48(uint64_t a1, void (*a2)(void *, void *), uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t *a5, uint64_t (*a6)(uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v10 = a4(0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78]();
  v13 = (char *)&v19 - v12;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x1E0C80A78]();
  v15 = (uint64_t *)((char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BEDD4744(a1, (uint64_t)v15, a5);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16 = (void *)*v15;
    MEMORY[0x1C3B85B68](*v15);
    a2(0, v16);

  }
  else
  {
    v17 = (*(uint64_t (**)(char *, _QWORD *, uint64_t))(v11 + 32))(v13, v15, v10);
    v18 = (void *)a6(v17);
    a2(v18, 0);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

void sub_1BEDC0064(uint64_t a1, void (*a2)(_QWORD, void *), uint64_t a3)
{
  sub_1BEDC2894(a1, 1, a2, a3, 0.0, 0.0);
}

uint64_t sub_1BEDC0154(uint64_t a1)
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
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
  char *v91;
  void (*v92)(char *, char *, uint64_t);
  NSObject *v93;
  int v94;
  char v95;
  uint8_t *v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  void (*v104)(char *, char *, uint64_t);
  char *v105;
  uint64_t v106;
  char *v107;
  unint64_t v108;
  char *v109;
  char *v110;
  uint64_t v111;
  char *v112;
  os_signpost_id_t v113;
  uint64_t v114;
  uint8_t *v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  const char *v126;
  void (*v127)(char *, char *, uint64_t);
  char *v128;
  uint64_t v129;
  char *v130;
  NSObject *v131;
  char *v132;
  char v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  int v137;
  uint64_t v138;
  char v139;
  void (*v140)(char *, uint64_t);
  uint64_t v141;
  char *v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  void (*v146)(char *, uint64_t);
  char *v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  os_signpost_id_t v151;
  void (*v152)(char *, uint64_t);
  char *v153;
  char *v154;
  char *v155;
  uint64_t v156;
  NSObject *v157;
  os_signpost_type_t v158;
  uint8_t *v159;
  uint64_t v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  unint64_t v170;
  char *v171;
  os_signpost_id_t v172;
  uint64_t v173;
  char *v174;
  uint64_t v175;
  char *v176;
  NSObject *v177;
  os_signpost_type_t v178;
  char v179;
  uint64_t v180;
  char *v181;
  uint64_t v182;
  const char *v183;
  const char *v184;
  char *v185;
  void (*v186)(char *, uint64_t);
  uint64_t v187;
  void (*v188)(char *, char *, uint64_t);
  char *v189;
  uint64_t v190;
  NSObject *v191;
  char *v192;
  char v193;
  NSObject *v194;
  char *v195;
  uint64_t v196;
  const char *v197;
  char v198;
  char v199;
  char *v200;
  uint8_t *v201;
  os_signpost_id_t v202;
  char *v203;
  ipc_space_t *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  ipc_space_t v208;
  char *v209;
  mach_port_name_t v210;
  uint64_t v211;
  void (*v212)(char *, uint64_t);
  uint64_t result;
  char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  unint64_t v223;
  unint64_t v224;
  uint64_t v225;
  char *v226;
  os_signpost_id_t v227;
  void (*v228)(char *, uint64_t);
  char *v229;
  NSObject *v230;
  os_signpost_type_t v231;
  uint8_t *v232;
  uint64_t v233;
  char *v234;
  char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  unint64_t v240;
  char *v241;
  os_signpost_type_t v242;
  char *v243;
  char *v244;
  unint64_t v245;
  char *v246;
  char *v247;
  os_signpost_id_t v248;
  uint64_t v249;
  char *v250;
  uint64_t v251;
  char *v252;
  NSObject *v253;
  char *v254;
  char v255;
  char *v256;
  uint64_t v257;
  const char *v258;
  char v259;
  char v260;
  char *v261;
  uint64_t v262;
  void (*v263)(char *, uint64_t);
  char *v264;
  void (*v265)(char *, uint64_t);
  char *v266;
  uint64_t v267;
  uint64_t v268;
  char *v269;
  char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  unint64_t v275;
  uint64_t v276;
  char *v277;
  unint64_t v278;
  os_signpost_id_t v279;
  char *v280;
  ipc_space_t *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  ipc_space_t v285;
  char *v286;
  mach_port_name_t v287;
  uint64_t v288;
  void (*v289)(char *, uint64_t);
  char *v290;
  uint64_t v291;
  void (*v292)(char *, uint64_t);
  uint64_t v293;
  void (*v294)(char *);
  char *v295;
  uint64_t v296;
  char *v297;
  void (*v298)(char *, char *, uint64_t);
  char *v299;
  void (*v300)(char *, char *, uint64_t);
  uint64_t v301;
  char *v302;
  char *v303;
  char *v304;
  char *v305;
  uint64_t v306;
  char *v307;
  char *v308;
  char *v309;
  char *v310;
  char *v311;
  char *v312;
  char *v313;
  char *v314;
  char *v315;
  char *v316;
  char *v317;
  char *v318;
  const char *v319;
  char *v320;
  uint64_t v321;
  char *v322;
  char *v323;
  char *v324;
  char *v325;
  const char *v326;
  char *v327;
  char *v328;
  uint64_t v329;
  uint64_t v330;
  char *v331;
  uint64_t v332;
  const char *v333;
  char *v334;
  char *v335;
  char *v336;
  char *v337;
  uint64_t v338;
  char *v339;
  char *v340;
  uint64_t v341;
  char *v342;
  char *v343;
  char *v344;
  uint64_t v345;
  uint64_t v346;
  char *v347;
  char *v348;
  char *v349;
  char *v350;
  void (*v351)(char *, uint64_t);
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  char *v358;
  uint64_t v359;
  uint64_t v360;

  v330 = sub_1BEDE97F4();
  v329 = *(_QWORD *)(v330 - 8);
  MEMORY[0x1E0C80A78](v330);
  v328 = (char *)&v293 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v338 = sub_1BEDE926C();
  v321 = *(_QWORD *)(v338 - 8);
  v4 = MEMORY[0x1E0C80A78](v338);
  v313 = (char *)&v293 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x1E0C80A78](v4);
  v322 = (char *)&v293 - v7;
  v8 = MEMORY[0x1E0C80A78](v6);
  v316 = (char *)&v293 - v9;
  v10 = MEMORY[0x1E0C80A78](v8);
  v324 = (char *)&v293 - v11;
  MEMORY[0x1E0C80A78](v10);
  v339 = (char *)&v293 - v12;
  v333 = (const char *)sub_1BEDE90C8();
  v332 = *((_QWORD *)v333 - 1);
  v13 = MEMORY[0x1E0C80A78](v333);
  v317 = (char *)&v293 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v13);
  v303 = (char *)&v293 - v16;
  v17 = MEMORY[0x1E0C80A78](v15);
  v308 = (char *)&v293 - v18;
  MEMORY[0x1E0C80A78](v17);
  v319 = (char *)&v293 - v19;
  v341 = sub_1BEDE9254();
  v326 = *(const char **)(v341 - 8);
  v20 = MEMORY[0x1E0C80A78](v341);
  v342 = (char *)&v293 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x1E0C80A78](v20);
  v336 = (char *)&v293 - v23;
  v24 = MEMORY[0x1E0C80A78](v22);
  v335 = (char *)&v293 - v25;
  MEMORY[0x1E0C80A78](v24);
  v348 = (char *)&v293 - v26;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FC8);
  v28 = MEMORY[0x1E0C80A78](v27);
  v304 = (char *)&v293 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x1E0C80A78](v28);
  v311 = (char *)&v293 - v31;
  v32 = MEMORY[0x1E0C80A78](v30);
  v309 = (char *)&v293 - v33;
  v34 = MEMORY[0x1E0C80A78](v32);
  v320 = (char *)&v293 - v35;
  MEMORY[0x1E0C80A78](v34);
  v334 = (char *)&v293 - v36;
  v37 = sub_1BEDE9098();
  v351 = *(void (**)(char *, uint64_t))(v37 - 8);
  v352 = v37;
  v38 = MEMORY[0x1E0C80A78](v37);
  v325 = (char *)&v293 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = MEMORY[0x1E0C80A78](v38);
  v305 = (char *)&v293 - v41;
  v42 = MEMORY[0x1E0C80A78](v40);
  v318 = (char *)&v293 - v43;
  v44 = MEMORY[0x1E0C80A78](v42);
  v315 = (char *)&v293 - v45;
  v46 = MEMORY[0x1E0C80A78](v44);
  v331 = (char *)&v293 - v47;
  v48 = MEMORY[0x1E0C80A78](v46);
  v314 = (char *)&v293 - v49;
  v50 = MEMORY[0x1E0C80A78](v48);
  v323 = (char *)&v293 - v51;
  v52 = MEMORY[0x1E0C80A78](v50);
  v327 = (char *)&v293 - v53;
  v54 = MEMORY[0x1E0C80A78](v52);
  v347 = (char *)&v293 - v55;
  v56 = MEMORY[0x1E0C80A78](v54);
  v340 = (char *)&v293 - v57;
  v58 = MEMORY[0x1E0C80A78](v56);
  v349 = (char *)&v293 - v59;
  v60 = MEMORY[0x1E0C80A78](v58);
  v343 = (char *)&v293 - v61;
  MEMORY[0x1E0C80A78](v60);
  v350 = (char *)&v293 - v62;
  v63 = sub_1BEDE90BC();
  v345 = *(_QWORD *)(v63 - 8);
  v346 = v63;
  MEMORY[0x1E0C80A78](v63);
  v358 = (char *)&v293 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = sub_1BEDE941C();
  v66 = *(_QWORD *)(v65 - 8);
  v67 = MEMORY[0x1E0C80A78](v65);
  v302 = (char *)&v293 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = MEMORY[0x1E0C80A78](v67);
  v310 = (char *)&v293 - v70;
  v71 = MEMORY[0x1E0C80A78](v69);
  v307 = (char *)&v293 - v72;
  v73 = MEMORY[0x1E0C80A78](v71);
  v337 = (char *)&v293 - v74;
  v75 = MEMORY[0x1E0C80A78](v73);
  v344 = (char *)&v293 - v76;
  v77 = MEMORY[0x1E0C80A78](v75);
  v79 = (char *)&v293 - v78;
  MEMORY[0x1E0C80A78](v77);
  v81 = (char *)&v293 - v80;
  v82 = sub_1BEDE9410();
  v356 = *(_QWORD *)(v82 - 8);
  v357 = v82;
  MEMORY[0x1E0C80A78](v82);
  v84 = (char *)&v293 - ((v83 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = sub_1BEDE97C4();
  MEMORY[0x1E0C80A78](v85);
  v86 = sub_1BEDE9770();
  v354 = *(_QWORD *)(v86 - 8);
  v355 = v86;
  MEMORY[0x1E0C80A78](v86);
  v88 = (char *)&v293 - ((v87 + 15) & 0xFFFFFFFFFFFFFFF0);
  v306 = a1;
  sub_1BEDE8F90();
  sub_1BEDE9794();
  if (v1)
  {
    swift_unexpectedError();
    __break(1u);
    goto LABEL_63;
  }
  sub_1BEDE9764();
  sub_1BEDE9404();
  v89 = *(_QWORD *)(v353 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
  sub_1BEDD47C0(&qword_1EF577D08, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02BC0], MEMORY[0x1E0D02BB8]);
  sub_1BEDE91B8();
  v90 = v81;
  v296 = v89;
  v353 = 0;
  v299 = v88;
  v297 = v84;
  sub_1BEDE90B0();
  sub_1BEDE90A4();
  v91 = v350;
  sub_1BEDE9080();
  v92 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
  v312 = v90;
  v298 = v92;
  v92(v79, v90, v65);
  v93 = sub_1BEDE90A4();
  v94 = sub_1BEDE9A34();
  v95 = sub_1BEDE9A40();
  v301 = v65;
  v295 = "ize top-level dictionary.";
  if ((v95 & 1) != 0)
  {
    LODWORD(v294) = v94;
    v300 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v351 + 2);
    v300(v343, v91, v352);
    v96 = (uint8_t *)swift_slowAlloc();
    v293 = swift_slowAlloc();
    v360 = v293;
    *(_DWORD *)v96 = 136315138;
    v97 = v334;
    sub_1BEDE93F8();
    v98 = sub_1BEDE93EC();
    v99 = *(_QWORD *)(v98 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v99 + 48))(v97, 1, v98) == 1)
    {
      v100 = (uint64_t)v97;
      v101 = 7104878;
      sub_1BEDD4434(v100, &qword_1ED702FC8);
      v102 = 0xE300000000000000;
    }
    else
    {
      v106 = sub_1BEDE93E0();
      v107 = v97;
      v101 = v106;
      v102 = v108;
      (*(void (**)(char *, uint64_t))(v99 + 8))(v107, v98);
    }
    v109 = v348;
    v359 = sub_1BEDCCA90(v101, v102, &v360);
    sub_1BEDE9A88();
    swift_bridgeObjectRelease();
    v110 = *(char **)(v66 + 8);
    v111 = v301;
    v334 = v110;
    ((void (*)(char *, uint64_t))v110)(v79, v301);
    v112 = v343;
    v113 = sub_1BEDE908C();
    _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v93, (os_signpost_type_t)v294, v113, "LargeImage.Context.init", "largeImageContextualInfo: %s", v96, 0xCu);
    v114 = v293;
    swift_arrayDestroy();
    MEMORY[0x1C3B85C64](v114, -1, -1);
    v115 = v96;
    v65 = v111;
    MEMORY[0x1C3B85C64](v115, -1, -1);

    v103 = v352;
    (*((void (**)(char *, uint64_t))v351 + 1))(v112, v352);
    v91 = v350;
    v104 = v300;
    v105 = v109;
    v300(v349, v350, v103);
  }
  else
  {

    v334 = *(char **)(v66 + 8);
    ((void (*)(char *, uint64_t))v334)(v79, v65);
    v103 = v352;
    v104 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v351 + 2);
    v105 = v348;
    v104(v349, v91, v352);
  }
  v116 = sub_1BEDE90EC();
  swift_allocObject();
  v117 = sub_1BEDE90E0();
  v118 = v312;
  v298(v344, v312, v65);
  v119 = v353;
  sub_1BEDE923C();
  v353 = v119;
  if (v119)
  {
    swift_release();
    (*((void (**)(char *, uint64_t))v351 + 1))(v91, v103);
    (*(void (**)(char *, uint64_t))(v345 + 8))(v358, v346);
    ((void (*)(char *, uint64_t))v334)(v118, v65);
    v121 = v356;
    v120 = v357;
    v122 = v297;
    v124 = v354;
    v123 = v355;
    v125 = v299;
LABEL_35:
    (*(void (**)(char *, uint64_t))(v121 + 8))(v122, v120);
    (*(void (**)(char *, uint64_t))(v124 + 8))(v125, v123);
    return v124;
  }
  v344 = (char *)v116;
  v300 = v104;
  v126 = v326;
  v127 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v326 + 2);
  v128 = v335;
  v129 = v341;
  v127(v335, v105, v341);
  v130 = v336;
  v294 = (void (*)(char *))v127;
  v127(v336, v105, v129);
  v131 = sub_1BEDE90A4();
  v132 = v340;
  sub_1BEDE90D4();
  LODWORD(v293) = sub_1BEDE9A28();
  v133 = sub_1BEDE9A40();
  v343 = (char *)v117;
  if ((v133 & 1) != 0)
  {
    swift_retain();
    v134 = v319;
    sub_1BEDE90F8();
    swift_release();
    v135 = v332;
    v136 = v333;
    v137 = (*(uint64_t (**)(const char *, const char *))(v332 + 88))(v134, v333);
    v138 = v352;
    if (v137 == *MEMORY[0x1E0DF2190])
    {
      v139 = 0;
      v319 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(const char *, const char *))(v135 + 8))(v134, v136);
      v319 = "bufferSize: %ld, vmAddress: %lu";
      v139 = 2;
    }
    v142 = v335;
    v143 = v349;
    v300(v349, v340, v138);
    v144 = swift_slowAlloc();
    *(_BYTE *)v144 = 0;
    *(_BYTE *)(v144 + 1) = v139;
    *(_WORD *)(v144 + 2) = 2048;
    v145 = sub_1BEDE9224();
    v146 = (void (*)(char *, uint64_t))*((_QWORD *)v126 + 1);
    v147 = v142;
    v148 = v341;
    v146(v147, v341);
    v360 = v145;
    sub_1BEDE9A88();
    *(_WORD *)(v144 + 12) = 2048;
    v149 = v336;
    v150 = sub_1BEDE9248();
    v336 = (char *)v146;
    v146(v149, v148);
    v360 = v150;
    v141 = v352;
    sub_1BEDE9A88();
    v151 = sub_1BEDE908C();
    _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v131, (os_signpost_type_t)v293, v151, "LargeImage.Context.init", v319, (uint8_t *)v144, 0x16u);
    MEMORY[0x1C3B85C64](v144, -1, -1);

    v152 = (void (*)(char *, uint64_t))*((_QWORD *)v351 + 1);
    v152(v340, v141);
    v351 = v152;
    v152(v143, v141);
  }
  else
  {
    v140 = (void (*)(char *, uint64_t))*((_QWORD *)v126 + 1);
    v140(v130, v129);
    v336 = (char *)v140;
    v140(v128, v129);

    v141 = v352;
    v351 = (void (*)(char *, uint64_t))*((_QWORD *)v351 + 1);
    v351(v132, v352);
  }
  v153 = v342;
  v294(v342);
  sub_1BEDE90A4();
  v154 = v347;
  sub_1BEDE9080();
  v155 = v337;
  v156 = v301;
  v298(v337, v312, v301);
  v157 = sub_1BEDE90A4();
  v158 = sub_1BEDE9A34();
  if ((sub_1BEDE9A40() & 1) != 0)
  {
    v300(v327, v154, v141);
    v159 = (uint8_t *)swift_slowAlloc();
    v160 = swift_slowAlloc();
    v360 = v160;
    *(_DWORD *)v159 = 136315138;
    v161 = v320;
    sub_1BEDE93F8();
    v162 = sub_1BEDE93EC();
    v163 = *(_QWORD *)(v162 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v163 + 48))(v161, 1, v162) == 1)
    {
      v164 = (uint64_t)v161;
      v165 = 7104878;
      sub_1BEDD4434(v164, &qword_1ED702FC8);
      v166 = 0xE300000000000000;
    }
    else
    {
      v168 = sub_1BEDE93E0();
      v169 = v161;
      v165 = v168;
      v166 = v170;
      (*(void (**)(char *, uint64_t))(v163 + 8))(v169, v162);
    }
    v167 = v338;
    v359 = sub_1BEDCCA90(v165, v166, &v360);
    sub_1BEDE9A88();
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v334)(v337, v301);
    v171 = v327;
    v172 = sub_1BEDE908C();
    _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v157, v158, v172, "Unpack LargeImage", "largeImageContextualInfo: %s", v159, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B85C64](v160, -1, -1);
    MEMORY[0x1C3B85C64](v159, -1, -1);

    v141 = v352;
    v351(v171, v352);
    v153 = v342;
  }
  else
  {

    ((void (*)(char *, uint64_t))v334)(v155, v156);
    v167 = v338;
  }
  v300(v349, v347, v141);
  swift_allocObject();
  v173 = sub_1BEDE90E0();
  sub_1BEDD47C0(&qword_1ED702F88, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02958], MEMORY[0x1E0D02950]);
  v174 = v339;
  v175 = v353;
  sub_1BEDE91B8();
  v353 = v175;
  if (v175)
  {
    v176 = v325;
  }
  else
  {
    v187 = v321;
    v188 = *(void (**)(char *, char *, uint64_t))(v321 + 16);
    v189 = v324;
    v188(v324, v174, v167);
    v190 = v167;
    v191 = sub_1BEDE90A4();
    v192 = v323;
    sub_1BEDE90D4();
    LODWORD(v327) = sub_1BEDE9A28();
    v193 = sub_1BEDE9A40();
    v337 = (char *)v173;
    v335 = (char *)v188;
    if ((v193 & 1) != 0)
    {
      v194 = v191;
      swift_retain();
      v195 = v308;
      sub_1BEDE90F8();
      swift_release();
      v196 = v332;
      v197 = v333;
      if ((*(unsigned int (**)(char *, const char *))(v332 + 88))(v195, v333) == *MEMORY[0x1E0DF2190])
      {
        v198 = 0;
        v199 = 0;
        v326 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, const char *))(v196 + 8))(v195, v197);
        v326 = "result.metadata.largeImageContextualInfo: %s";
        v199 = 2;
        v198 = 1;
      }
      v216 = (uint64_t)v309;
      v300(v314, v323, v352);
      v217 = swift_slowAlloc();
      v218 = swift_slowAlloc();
      v360 = v218;
      *(_BYTE *)v217 = v199;
      *(_BYTE *)(v217 + 1) = v198;
      *(_WORD *)(v217 + 2) = 2080;
      v219 = v307;
      sub_1BEDE9260();
      sub_1BEDE93F8();
      ((void (*)(char *, uint64_t))v334)(v219, v301);
      v220 = sub_1BEDE93EC();
      v221 = *(_QWORD *)(v220 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v221 + 48))(v216, 1, v220) == 1)
      {
        v222 = 7104878;
        sub_1BEDD4434(v216, &qword_1ED702FC8);
        v223 = 0xE300000000000000;
      }
      else
      {
        v222 = sub_1BEDE93E0();
        v223 = v224;
        (*(void (**)(uint64_t, uint64_t))(v221 + 8))(v216, v220);
      }
      v174 = v339;
      v225 = v321;
      v359 = sub_1BEDCCA90(v222, v223, &v360);
      sub_1BEDE9A88();
      swift_bridgeObjectRelease();
      v215 = v338;
      v340 = *(char **)(v225 + 8);
      ((void (*)(char *, uint64_t))v340)(v324, v338);
      v226 = v314;
      v227 = sub_1BEDE908C();
      _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v194, (os_signpost_type_t)v327, v227, "Unpack LargeImage", v326, (uint8_t *)v217, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3B85C64](v218, -1, -1);
      MEMORY[0x1C3B85C64](v217, -1, -1);

      v228 = v351;
      v141 = v352;
      v351(v323, v352);
      v153 = v342;
      v188 = (void (*)(char *, char *, uint64_t))v335;
      v214 = v316;
      v228(v226, v141);
    }
    else
    {
      v340 = *(char **)(v187 + 8);
      ((void (*)(char *, uint64_t))v340)(v189, v190);

      v214 = v316;
      v215 = v190;
      v141 = v352;
      v153 = v342;
      v351(v192, v352);
    }
    sub_1BEDE90A4();
    v229 = v331;
    sub_1BEDE9080();
    v188(v214, v174, v215);
    v230 = sub_1BEDE90A4();
    v231 = sub_1BEDE9A34();
    if ((sub_1BEDE9A40() & 1) != 0)
    {
      v300(v315, v229, v141);
      v232 = (uint8_t *)swift_slowAlloc();
      v233 = swift_slowAlloc();
      v360 = v233;
      *(_DWORD *)v232 = 136315138;
      v234 = v310;
      sub_1BEDE9260();
      v235 = v311;
      sub_1BEDE93F8();
      v236 = (uint64_t)v235;
      ((void (*)(char *, uint64_t))v334)(v234, v301);
      v237 = sub_1BEDE93EC();
      v238 = *(_QWORD *)(v237 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v238 + 48))(v235, 1, v237) == 1)
      {
        v239 = 7104878;
        sub_1BEDD4434(v236, &qword_1ED702FC8);
        v240 = 0xE300000000000000;
      }
      else
      {
        v327 = (char *)v233;
        v242 = v231;
        v243 = v214;
        v244 = v235;
        v239 = sub_1BEDE93E0();
        v240 = v245;
        v246 = v244;
        v214 = v243;
        v231 = v242;
        v233 = (uint64_t)v327;
        (*(void (**)(char *, uint64_t))(v238 + 8))(v246, v237);
      }
      v359 = sub_1BEDCCA90(v239, v240, &v360);
      sub_1BEDE9A88();
      swift_bridgeObjectRelease();
      v215 = v338;
      ((void (*)(char *, uint64_t))v340)(v214, v338);
      v247 = v315;
      v248 = sub_1BEDE908C();
      _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v230, v231, v248, "Copy MachImage", "result.metadata.largeImageContextualInfo: %s", v232, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3B85C64](v233, -1, -1);
      MEMORY[0x1C3B85C64](v232, -1, -1);

      v141 = v352;
      v351(v247, v352);
      v153 = v342;
      v241 = v322;
      v188 = (void (*)(char *, char *, uint64_t))v335;
    }
    else
    {

      ((void (*)(char *, uint64_t))v340)(v214, v215);
      v241 = v322;
    }
    v300(v349, v331, v141);
    swift_allocObject();
    v249 = sub_1BEDE90E0();
    v250 = v339;
    v188(v241, v339, v215);
    sub_1BEDE920C();
    v251 = sub_1BEDE986C();
    swift_release();
    if (v251)
    {
      v349 = (char *)v251;
      v252 = v313;
      v188(v313, v250, v215);
      v253 = sub_1BEDE90A4();
      v254 = v318;
      sub_1BEDE90D4();
      LODWORD(v335) = sub_1BEDE9A28();
      v255 = sub_1BEDE9A40();
      v344 = (char *)v249;
      if ((v255 & 1) != 0)
      {
        swift_retain();
        v256 = v303;
        sub_1BEDE90F8();
        swift_release();
        v257 = v332;
        v258 = v333;
        if ((*(unsigned int (**)(char *, const char *))(v332 + 88))(v256, v333) == *MEMORY[0x1E0DF2190])
        {
          v259 = 0;
          v260 = 0;
          v333 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(char *, const char *))(v257 + 8))(v256, v258);
          v333 = "result.metadata.largeImageContextualInfo: %s";
          v260 = 2;
          v259 = 1;
        }
        v266 = v305;
        v300(v305, v318, v141);
        v267 = swift_slowAlloc();
        v268 = swift_slowAlloc();
        v360 = v268;
        *(_BYTE *)v267 = v260;
        *(_BYTE *)(v267 + 1) = v259;
        *(_WORD *)(v267 + 2) = 2080;
        v269 = v302;
        sub_1BEDE9260();
        v270 = v304;
        sub_1BEDE93F8();
        ((void (*)(char *, uint64_t))v334)(v269, v301);
        v271 = sub_1BEDE93EC();
        v272 = *(_QWORD *)(v271 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v272 + 48))(v270, 1, v271) == 1)
        {
          v273 = (uint64_t)v270;
          v274 = 7104878;
          sub_1BEDD4434(v273, &qword_1ED702FC8);
          v275 = 0xE300000000000000;
        }
        else
        {
          v276 = sub_1BEDE93E0();
          v277 = v270;
          v274 = v276;
          v275 = v278;
          (*(void (**)(char *, uint64_t))(v272 + 8))(v277, v271);
        }
        v359 = sub_1BEDCCA90(v274, v275, &v360);
        sub_1BEDE9A88();
        swift_bridgeObjectRelease();
        ((void (*)(char *, uint64_t))v340)(v252, v338);
        v279 = sub_1BEDE908C();
        _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v253, (os_signpost_type_t)v335, v279, "Copy MachImage", v333, (uint8_t *)v267, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C3B85C64](v268, -1, -1);
        MEMORY[0x1C3B85C64](v267, -1, -1);

        v265 = v351;
        v141 = v352;
        v351(v318, v352);
        v153 = v342;
        v265(v266, v141);
      }
      else
      {
        ((void (*)(char *, uint64_t))v340)(v252, v215);

        v264 = v254;
        v265 = v351;
        v351(v264, v141);
      }
      swift_retain();
      v280 = v322;
      sub_1BEDE9218();
      v281 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
      v282 = *MEMORY[0x1E0C83DA0];
      v283 = sub_1BEDE9248();
      v284 = sub_1BEDE9224();
      if ((v284 & 0x8000000000000000) == 0)
      {
        MEMORY[0x1C3B85CDC](v282, v283, v284);
        v285 = *v281;
        v286 = v328;
        sub_1BEDE9230();
        v287 = sub_1BEDE97E8();
        (*(void (**)(char *, uint64_t))(v329 + 8))(v286, v330);
        mach_port_deallocate(v285, v287);
        v288 = v341;
        v289 = (void (*)(char *, uint64_t))v336;
        ((void (*)(char *, uint64_t))v336)(v153, v341);
        v124 = sub_1BEDE9200();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        v290 = v280;
        v291 = v338;
        v292 = (void (*)(char *, uint64_t))v340;
        ((void (*)(char *, uint64_t))v340)(v290, v338);
        v265(v331, v141);
        v292(v339, v291);
        v265(v347, v141);
        v289(v348, v288);
        v265(v350, v141);
        (*(void (**)(char *, uint64_t))(v345 + 8))(v358, v346);
        ((void (*)(char *, uint64_t))v334)(v312, v301);
        (*(void (**)(char *, uint64_t))(v356 + 8))(v297, v357);
        (*(void (**)(char *, uint64_t))(v354 + 8))(v299, v355);
        return v124;
      }
      goto LABEL_63;
    }
    sub_1BEDE8F9C();
    sub_1BEDD47C0(&qword_1EF578280, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    sub_1BEDE9CC8();
    sub_1BEDE9854();
    v261 = v250;
    sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    v262 = swift_allocError();
    sub_1BEDE9848();
    v353 = v262;
    swift_willThrow();
    swift_release();
    v263 = (void (*)(char *, uint64_t))v340;
    ((void (*)(char *, uint64_t))v340)(v241, v215);
    v351(v331, v141);
    v263(v261, v215);
    v176 = v325;
  }
  v177 = sub_1BEDE90A4();
  sub_1BEDE90D4();
  v178 = sub_1BEDE9A28();
  v179 = sub_1BEDE9A40();
  v180 = v330;
  if ((v179 & 1) != 0)
  {
    swift_retain();
    v181 = v317;
    sub_1BEDE90F8();
    swift_release();
    v182 = v332;
    v183 = v333;
    if ((*(unsigned int (**)(char *, const char *))(v332 + 88))(v181, v333) == *MEMORY[0x1E0DF2190])
    {
      v184 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, const char *))(v182 + 8))(v181, v183);
      v184 = "error unpacking";
    }
    v200 = v349;
    v300(v349, v176, v141);
    v201 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v201 = 0;
    v202 = sub_1BEDE908C();
    _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v177, v178, v202, "Unpack LargeImage", v184, v201, 2u);
    MEMORY[0x1C3B85C64](v201, -1, -1);

    v203 = v176;
    v186 = v351;
    v351(v203, v141);
    v153 = v342;
    v186(v200, v141);
  }
  else
  {

    v185 = v176;
    v186 = v351;
    v351(v185, v141);
  }
  v204 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  v205 = *MEMORY[0x1E0C83DA0];
  v206 = sub_1BEDE9248();
  v207 = sub_1BEDE9224();
  if ((v207 & 0x8000000000000000) == 0)
  {
    MEMORY[0x1C3B85CDC](v205, v206, v207);
    v208 = *v204;
    v209 = v328;
    sub_1BEDE9230();
    v210 = sub_1BEDE97E8();
    (*(void (**)(char *, uint64_t))(v329 + 8))(v209, v180);
    mach_port_deallocate(v208, v210);
    v211 = v341;
    v212 = (void (*)(char *, uint64_t))v336;
    ((void (*)(char *, uint64_t))v336)(v153, v341);
    swift_willThrow();
    swift_release();
    swift_release();
    v186(v347, v141);
    v212(v348, v211);
    v186(v350, v141);
    (*(void (**)(char *, uint64_t))(v345 + 8))(v358, v346);
    ((void (*)(char *, uint64_t))v334)(v312, v301);
    v121 = v356;
    v120 = v357;
    v122 = v297;
    v124 = v354;
    v123 = v355;
    v125 = v299;
    goto LABEL_35;
  }
LABEL_63:
  result = sub_1BEDE9B60();
  __break(1u);
  return result;
}

uint64_t sub_1BEDC22C8(uint64_t a1, float a2, float a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t result;
  _QWORD v26[4];
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  int v34;
  float v35;
  char v36;
  float v37;
  char v38;

  v26[2] = a1;
  v33 = sub_1BEDE9380();
  v26[0] = *(_QWORD *)(v33 - 8);
  MEMORY[0x1E0C80A78](v33);
  v32 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BEDE97C4();
  MEMORY[0x1E0C80A78](v6);
  v26[1] = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_1BEDE9770();
  v29 = *(_QWORD *)(v31 - 8);
  MEMORY[0x1E0C80A78](v31);
  v28 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_1BEDE9368();
  v27 = *(_QWORD *)(v30 - 8);
  MEMORY[0x1E0C80A78](v30);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_1BEDE99E0();
  sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
  v11 = (void *)sub_1BEDE9A4C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1BEDEABF0;
  v37 = a2;
  v38 = 0;
  v13 = sub_1BEDE9710();
  v15 = v14;
  v16 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v12 + 56) = MEMORY[0x1E0DEA968];
  v17 = sub_1BEDCD658();
  *(_QWORD *)(v12 + 64) = v17;
  *(_QWORD *)(v12 + 32) = v13;
  *(_QWORD *)(v12 + 40) = v15;
  v35 = a3;
  v36 = 0;
  v18 = sub_1BEDE9710();
  *(_QWORD *)(v12 + 96) = v16;
  *(_QWORD *)(v12 + 104) = v17;
  *(_QWORD *)(v12 + 72) = v18;
  *(_QWORD *)(v12 + 80) = v19;
  sub_1BEDE9074();

  swift_bridgeObjectRelease();
  if ((~LODWORD(a2) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (a2 <= -9.2234e18)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (a2 >= 9.2234e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_1BEDE935C();
  sub_1BEDE8F90();
  v20 = v26[3];
  sub_1BEDE9794();
  if (!v20)
  {
    v21 = v28;
    sub_1BEDE9764();
    sub_1BEDD47C0(&qword_1ED702F90, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02B08], MEMORY[0x1E0D02B00]);
    v23 = v32;
    v22 = v33;
    sub_1BEDE91B8();
    v24 = sub_1BEDE9374();
    (*(void (**)(char *, uint64_t))(v26[0] + 8))(v23, v22);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v21, v31);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v30);
    return v24;
  }
LABEL_9:
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

void sub_1BEDC279C(uint64_t a1, void (*a2)(_QWORD, void *), uint64_t a3, float a4, float a5)
{
  sub_1BEDC2894(a1, 0, a2, a3, a4, a5);
}

void sub_1BEDC2894(uint64_t a1, int a2, void (*a3)(_QWORD, void *), uint64_t a4, float a5, float a6)
{
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
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  void (**v75)(char *, char *, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void (**v91)(NSObject *, uint64_t);
  uint64_t v92;
  void (**v93)(char *, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  NSObject *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  void (**v112)(char *, uint64_t);
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void (*v122)(char *, char *, uint64_t);
  char v123;
  uint64_t v124;
  unsigned int (*v125)(char *, uint64_t, _QWORD);
  void *v126;
  void (*v127)(char *, char *, _QWORD);
  void *v128;
  uint64_t v129;
  NSString *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  id v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  void (*v143)(char *, char *, uint64_t);
  char *v144;
  id v145;
  void *v146;
  unsigned int v147;
  id v148;
  id v149;
  void *v150;
  char *v151;
  uint64_t v152;
  void (*v153)(char *, char *, uint64_t);
  void *v154;
  uint64_t v155;
  const char *v156;
  char *v157;
  uint64_t v158;
  char *v159;
  char *v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  void (**v164)(char *, uint64_t);
  char *v165;
  char *v166;
  char v167;
  char *v168;
  uint64_t v169;
  void (*v170)(char *, uint64_t);
  uint64_t v171;
  void (*v172)(char *, uint64_t);
  void (*v173)(const char *, void (*)(char *, char *, uint64_t));
  void (*v174)(char *, char *, uint64_t);
  char *v175;
  char *v176;
  char *v177;
  char *v178;
  char *v179;
  uint64_t v180;
  void (*v181)(char *, uint64_t);
  uint64_t v182;
  void (*v183)(char *, uint64_t);
  char v184;
  uint64_t v185;
  char *v186;
  char *v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  unint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void (**v198)(char *, uint64_t);
  char *v199;
  char *v200;
  uint64_t v201;
  char *v202;
  char v203;
  uint8_t *v204;
  void *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  void (**v209)(char *, uint64_t);
  uint64_t v210;
  unint64_t v211;
  char *v212;
  char *v213;
  char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  unint64_t v218;
  os_signpost_type_t v219;
  char *v220;
  os_signpost_id_t v221;
  uint64_t v222;
  char *v223;
  char *v224;
  uint64_t v225;
  uint64_t v226;
  void (*v227)(char *, char *, uint64_t);
  char *v228;
  uint64_t v229;
  char *v230;
  NSObject *v231;
  char *v232;
  char v233;
  char *v234;
  uint64_t v235;
  uint64_t v236;
  char v237;
  void (**v238)(char *, uint64_t);
  void (*v239)(char *, uint64_t);
  char *v240;
  char *v241;
  uint64_t v242;
  uint64_t v243;
  char *v244;
  void *v245;
  void (**v246)(char *, uint64_t);
  char *v247;
  void *v248;
  char *v249;
  os_signpost_id_t v250;
  unint64_t v251;
  char *v252;
  NSObject *v253;
  int v254;
  char *v255;
  void (*v256)(char *, char *, uint64_t);
  uint8_t *v257;
  void *v258;
  uint64_t v259;
  char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  unint64_t v264;
  uint64_t v265;
  uint64_t v266;
  char *v267;
  uint64_t v268;
  unint64_t v269;
  char *v270;
  char *v271;
  os_signpost_id_t v272;
  char *v273;
  uint64_t v274;
  uint64_t v275;
  char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  unint64_t v280;
  unint64_t v281;
  unint64_t v282;
  unint64_t v283;
  uint64_t v284;
  _QWORD *v285;
  uint64_t v286;
  _QWORD *v287;
  char *v288;
  char *v289;
  char *v290;
  uint64_t v291;
  char *v292;
  uint64_t v293;
  char *v294;
  uint64_t v295;
  uint64_t v296;
  char *v297;
  char *v298;
  uint64_t v299;
  uint64_t v300;
  char *v301;
  char *v302;
  uint64_t v303;
  char *v304;
  char *v305;
  char *v306;
  char *v307;
  char *v308;
  char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  char *v313;
  void (**v314)(char *, uint64_t);
  char *v315;
  char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  void (**v320)(char *, char *, uint64_t);
  char *v321;
  char *v322;
  uint64_t v323;
  char *v324;
  char *v325;
  uint64_t v326;
  uint64_t v327;
  char *v328;
  char *v329;
  uint64_t v330;
  uint64_t v331;
  char *v332;
  char *v333;
  char *v334;
  char *v335;
  char *v336;
  uint64_t v337;
  uint64_t v338;
  int v339;
  char *v340;
  uint64_t v341;
  uint64_t v342;
  char *v343;
  char *v344;
  char *v345;
  char *v346;
  uint64_t v347;
  uint64_t v348;
  char *v349;
  char *v350;
  char *v351;
  char *v352;
  uint64_t v353;
  uint64_t v354;
  char *v355;
  char *v356;
  char *v357;
  char *v358;
  char *v359;
  char *v360;
  char *v361;
  char *v362;
  char *v363;
  void (**v364)(char *, uint64_t);
  uint64_t v365;
  char *v366;
  char *v367;
  char *v368;
  uint64_t v369;
  char *v370;
  uint64_t v371;
  uint64_t v372;
  void (*v373)(char *, char *, uint64_t);
  void (*v374)(char *, char *, char *);
  uint64_t v375;
  void (**v376)(char *, uint64_t);
  uint64_t v377;
  void (*v378)(_QWORD, void *);
  uint64_t v379;
  uint64_t v380;
  id v381[2];

  v377 = a4;
  v378 = a3;
  v339 = a2;
  v381[1] = *(id *)MEMORY[0x1E0C80C00];
  v296 = sub_1BEDE90C8();
  v295 = *(_QWORD *)(v296 - 8);
  MEMORY[0x1E0C80A78](v296);
  v294 = (char *)&v293 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v317 = sub_1BEDE9254();
  v310 = *(_QWORD *)(v317 - 8);
  v10 = MEMORY[0x1E0C80A78](v317);
  v301 = (char *)&v293 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v10);
  v309 = (char *)&v293 - v13;
  v14 = MEMORY[0x1E0C80A78](v12);
  v307 = (char *)&v293 - v15;
  v300 = v16;
  MEMORY[0x1E0C80A78](v14);
  v322 = (char *)&v293 - v17;
  v312 = sub_1BEDE93EC();
  v311 = *(_QWORD *)(v312 - 8);
  MEMORY[0x1E0C80A78](v312);
  v298 = (char *)&v293 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FC8);
  v20 = MEMORY[0x1E0C80A78](v19);
  v297 = (char *)&v293 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v306 = (char *)&v293 - v22;
  v338 = sub_1BEDE9098();
  v323 = *(_QWORD *)(v338 - 8);
  v23 = MEMORY[0x1E0C80A78](v338);
  v302 = (char *)&v293 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x1E0C80A78](v23);
  v313 = (char *)&v293 - v26;
  v27 = MEMORY[0x1E0C80A78](v25);
  v308 = (char *)&v293 - v28;
  v29 = MEMORY[0x1E0C80A78](v27);
  v321 = (char *)&v293 - v30;
  v31 = MEMORY[0x1E0C80A78](v29);
  v315 = (char *)&v293 - v32;
  MEMORY[0x1E0C80A78](v31);
  v334 = (char *)&v293 - v33;
  v319 = sub_1BEDE90BC();
  v318 = *(_QWORD *)(v319 - 8);
  v34 = MEMORY[0x1E0C80A78](v319);
  v304 = (char *)&v293 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v303 = v35;
  MEMORY[0x1E0C80A78](v34);
  v333 = (char *)&v293 - v36;
  v337 = sub_1BEDE941C();
  v320 = *(void (***)(char *, char *, uint64_t))(v337 - 8);
  v37 = MEMORY[0x1E0C80A78](v337);
  v305 = (char *)&v293 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = MEMORY[0x1E0C80A78](v37);
  v316 = (char *)&v293 - v40;
  v41 = MEMORY[0x1E0C80A78](v39);
  v314 = (void (**)(char *, uint64_t))((char *)&v293 - v42);
  v43 = MEMORY[0x1E0C80A78](v41);
  v329 = (char *)&v293 - v44;
  MEMORY[0x1E0C80A78](v43);
  v332 = (char *)&v293 - v45;
  v331 = sub_1BEDE9410();
  v330 = *(_QWORD *)(v331 - 8);
  MEMORY[0x1E0C80A78](v331);
  v336 = (char *)&v293 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v327 = sub_1BEDE9368();
  v326 = *(_QWORD *)(v327 - 8);
  MEMORY[0x1E0C80A78](v327);
  v328 = (char *)&v293 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  v342 = sub_1BEDE944C();
  v341 = *(_QWORD *)(v342 - 8);
  MEMORY[0x1E0C80A78](v342);
  v349 = (char *)&v293 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  v348 = sub_1BEDE9320();
  v347 = *(_QWORD *)(v348 - 8);
  MEMORY[0x1E0C80A78](v348);
  v346 = (char *)&v293 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  v354 = sub_1BEDE92D8();
  v353 = *(_QWORD *)(v354 - 8);
  MEMORY[0x1E0C80A78](v354);
  v358 = (char *)&v293 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FB8);
  v52 = MEMORY[0x1E0C80A78](v51);
  v360 = (char *)&v293 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v52);
  v366 = (char *)&v293 - v54;
  v365 = sub_1BEDE9038();
  v364 = *(void (***)(char *, uint64_t))(v365 - 8);
  MEMORY[0x1E0C80A78](v365);
  v363 = (char *)&v293 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = sub_1BEDE8F9C();
  v57 = *(_QWORD *)(v56 - 8);
  v371 = v56;
  v372 = v57;
  v58 = MEMORY[0x1E0C80A78](v56);
  v345 = (char *)&v293 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = MEMORY[0x1E0C80A78](v58);
  v357 = (char *)&v293 - v61;
  v62 = MEMORY[0x1E0C80A78](v60);
  v368 = (char *)&v293 - v63;
  v299 = v64;
  MEMORY[0x1E0C80A78](v62);
  v370 = (char *)&v293 - v65;
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FC0);
  v67 = MEMORY[0x1E0C80A78](v66);
  v350 = (char *)&v293 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = MEMORY[0x1E0C80A78](v67);
  v361 = (char *)&v293 - v70;
  MEMORY[0x1E0C80A78](v69);
  v72 = (char *)&v293 - v71;
  v373 = (void (*)(char *, char *, uint64_t))sub_1BEDE97C4();
  v369 = *((_QWORD *)v373 - 1);
  v73 = MEMORY[0x1E0C80A78](v373);
  v75 = (void (**)(char *, char *, uint64_t))((char *)&v293 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0));
  v76 = MEMORY[0x1E0C80A78](v73);
  v325 = (char *)&v293 - v77;
  v78 = MEMORY[0x1E0C80A78](v76);
  v340 = (char *)&v293 - v79;
  v80 = MEMORY[0x1E0C80A78](v78);
  v344 = (char *)&v293 - v81;
  v82 = MEMORY[0x1E0C80A78](v80);
  v352 = (char *)&v293 - v83;
  v84 = MEMORY[0x1E0C80A78](v82);
  v356 = (char *)&v293 - v85;
  v86 = MEMORY[0x1E0C80A78](v84);
  v362 = (char *)&v293 - v87;
  v88 = MEMORY[0x1E0C80A78](v86);
  v367 = (char *)&v293 - v89;
  MEMORY[0x1E0C80A78](v88);
  v91 = (void (**)(NSObject *, uint64_t))((char *)&v293 - v90);
  v92 = sub_1BEDE9770();
  v93 = *(void (***)(char *, uint64_t))(v92 - 8);
  v375 = v92;
  v376 = v93;
  v94 = MEMORY[0x1E0C80A78](v92);
  v335 = (char *)&v293 - ((v95 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = MEMORY[0x1E0C80A78](v94);
  v324 = (char *)&v293 - v97;
  v98 = MEMORY[0x1E0C80A78](v96);
  v100 = ((char *)&v293 - v99);
  v101 = MEMORY[0x1E0C80A78](v98);
  v343 = (char *)&v293 - v102;
  v103 = MEMORY[0x1E0C80A78](v101);
  v351 = (char *)&v293 - v104;
  v105 = MEMORY[0x1E0C80A78](v103);
  v355 = (char *)&v293 - v106;
  v107 = MEMORY[0x1E0C80A78](v105);
  v359 = (char *)&v293 - v108;
  MEMORY[0x1E0C80A78](v107);
  v110 = (char *)&v293 - v109;
  v111 = sub_1BEDE9500();
  v112 = *(void (***)(char *, uint64_t))(v111 - 8);
  MEMORY[0x1E0C80A78](v111);
  v114 = (char *)&v293 - ((v113 + 15) & 0xFFFFFFFFFFFFFFF0);
  v379 = a1;
  v116 = sub_1BEDE8F54();
  v117 = v115;
  if (v116 == 0x6361666863746177 && v115 == 0xE900000000000065 || (sub_1BEDE9CD4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if ((~LODWORD(a5) & 0x7F800000) != 0)
    {
      if (a5 > -9.2234e18)
      {
        if (a5 < 9.2234e18)
        {
          sub_1BEDE94F4();
          sub_1BEDE950C();
          sub_1BEDE8F90();
          sub_1BEDE9794();
          sub_1BEDE9764();
          v118 = swift_allocObject();
          v119 = v377;
          *(_QWORD *)(v118 + 16) = v378;
          *(_QWORD *)(v118 + 24) = v119;
          sub_1BEDD47C0(&qword_1EF578340, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02D68], MEMORY[0x1E0D02D60]);
          swift_retain();
          sub_1BEDE91A0();
          swift_release();
          v376[1](v110, v375);
          v112[1](v114, v111);
          return;
        }
        goto LABEL_53;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:

    v373 = v75[1];
    ((void (*)(_QWORD, uint64_t))v373)(v112, v116);
    v212 = *(char **)(v323 + 16);
    v213 = v114;
    goto LABEL_57;
  }
  if (v116 == 0x737361706B70 && v117 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v120 = v377;
    v121 = v379;
    v122 = v373;
    goto LABEL_16;
  }
  v123 = sub_1BEDE9CD4();
  v120 = v377;
  v121 = v379;
  v122 = v373;
  if ((v123 & 1) != 0 || v116 == 0x726564726FLL && v117 == 0xE500000000000000 || (sub_1BEDE9CD4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_16:
    (*(void (**)(char *, uint64_t, uint64_t))(v372 + 16))(v370, v121, v371);
    sub_1BEDE97AC();
    v124 = v369;
    v125 = *(unsigned int (**)(char *, uint64_t, _QWORD))(v369 + 48);
    if (v125(v72, 1, v122) == 1)
    {
      sub_1BEDD4434((uint64_t)v72, &qword_1ED702FC0);
      sub_1BEDD47C0(&qword_1EF578280, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
      sub_1BEDE9CC8();
      sub_1BEDE9854();
      sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
      v126 = (void *)swift_allocError();
      sub_1BEDE9848();
      v378(0, v126);

      return;
    }
    v127 = *(void (**)(char *, char *, _QWORD))(v124 + 32);
    v127(v367, v72, v122);
    sub_1BEDE977C();
    v128 = (void *)objc_opt_self();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578328);
    v129 = swift_allocObject();
    *(_OWORD *)(v129 + 16) = xmmword_1BEDEAC00;
    v130 = NSTemporaryDirectory();
    v131 = sub_1BEDE98C0();
    v133 = v132;

    *(_QWORD *)(v129 + 32) = v131;
    *(_QWORD *)(v129 + 40) = v133;
    *(_QWORD *)(v129 + 48) = 0x7665725073736150;
    *(_QWORD *)(v129 + 56) = 0xEB00000000776569;
    v134 = v363;
    sub_1BEDE902C();
    v135 = sub_1BEDE9014();
    v137 = v136;
    v364[1](v134, v365);
    *(_QWORD *)(v129 + 64) = v135;
    *(_QWORD *)(v129 + 72) = v137;
    v138 = (void *)sub_1BEDE998C();
    swift_bridgeObjectRelease();
    v139 = objc_msgSend(v128, sel_fileURLWithPathComponents_, v138);

    if (v139)
    {
      v140 = v370;
      sub_1BEDE8F78();

      v142 = v371;
      v141 = v372;
      v143 = *(void (**)(char *, char *, uint64_t))(v372 + 32);
      v144 = v366;
      v143(v366, v140, v371);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v141 + 56))(v144, 0, 1, v142);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v141 + 48))(v144, 1, v142) != 1)
      {
        v143(v368, v144, v142);
        v145 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
        v146 = (void *)sub_1BEDE8F60();
        v381[0] = 0;
        v147 = objc_msgSend(v145, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v146, 1, 0, v381);

        if (v147)
        {
          v148 = v381[0];
        }
        else
        {
          v149 = v381[0];
          v150 = (void *)sub_1BEDE8F48();

          swift_willThrow();
          MEMORY[0x1C3B85B68](v150);
          v378(0, v150);

        }
        v151 = v368;
        sub_1BEDE8F6C();
        v152 = (uint64_t)v361;
        sub_1BEDE97AC();
        v153 = v373;
        if (v125((char *)v152, 1, v373) == 1)
        {
          sub_1BEDD4434(v152, &qword_1ED702FC0);
          sub_1BEDD47C0(&qword_1EF578280, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
          sub_1BEDE9CC8();
          sub_1BEDE9854();
          sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
          v154 = (void *)swift_allocError();
          sub_1BEDE9848();
          v378(0, v154);

          (*(void (**)(char *, uint64_t))(v372 + 8))(v151, v142);
          (*(void (**)(char *, void (*)(char *, char *, uint64_t)))(v369 + 8))(v367, v153);
          return;
        }
        v155 = v120;
        v156 = v362;
        v127(v362, (char *)v152, v153);
        sub_1BEDE977C();
        v158 = v375;
        v159 = v367;
        v160 = v355;
        (*(void (**)(char *, const char *, _QWORD *))(v369 + 16))(v356, v156, v153);
        v161 = v359;
        sub_1BEDE9764();
        v162 = sub_1BEDE8F54();
        if (v162 == 0x737361706B70 && v163 == 0xE600000000000000)
        {
          swift_bridgeObjectRelease();
          v164 = v376;
          v165 = v358;
          v166 = v357;
        }
        else
        {
          v167 = sub_1BEDE9CD4();
          swift_bridgeObjectRelease();
          v164 = v376;
          v165 = v358;
          v166 = v357;
          if ((v167 & 1) == 0)
          {
            ((void (*)(char *, char *, uint64_t))v376[2])(v160, v161, v158);
            v176 = v346;
            sub_1BEDE9314();
            v177 = v345;
            sub_1BEDE97A0();
            sub_1BEDE932C();
            sub_1BEDE8F90();
            sub_1BEDE9794();
            v178 = v159;
            v179 = v343;
            sub_1BEDE9764();
            v180 = swift_allocObject();
            *(_QWORD *)(v180 + 16) = v378;
            *(_QWORD *)(v180 + 24) = v155;
            sub_1BEDD47C0(&qword_1EF578330, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02AA0], MEMORY[0x1E0D02A98]);
            swift_retain();
            sub_1BEDE91A0();
            swift_release();
            v181 = v376[1];
            v181(v179, v158);
            v182 = v371;
            v183 = *(void (**)(char *, uint64_t))(v372 + 8);
            v183(v177, v371);
            (*(void (**)(char *, uint64_t))(v347 + 8))(v176, v348);
            v181(v359, v158);
            v173 = *(void (**)(const char *, void (*)(char *, char *, uint64_t)))(v369 + 8);
            v174 = v373;
            v173(v362, v373);
            v183(v368, v182);
            v175 = v178;
            goto LABEL_36;
          }
        }
        ((void (*)(char *, char *, uint64_t))v164[2])(v160, v161, v158);
        sub_1BEDE92CC();
        sub_1BEDE97A0();
        sub_1BEDE92E4();
        sub_1BEDE8F90();
        sub_1BEDE9794();
        v168 = v351;
        sub_1BEDE9764();
        v169 = swift_allocObject();
        *(_QWORD *)(v169 + 16) = v378;
        *(_QWORD *)(v169 + 24) = v155;
        sub_1BEDD47C0(&qword_1EF578338, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02A10], MEMORY[0x1E0D02A08]);
        swift_retain();
        sub_1BEDE91A0();
        swift_release();
        v170 = v376[1];
        v170(v168, v158);
        v171 = v371;
        v172 = *(void (**)(char *, uint64_t))(v372 + 8);
        v172(v166, v371);
        (*(void (**)(char *, uint64_t))(v353 + 8))(v165, v354);
        v170(v161, v158);
        v173 = *(void (**)(const char *, void (*)(char *, char *, uint64_t)))(v369 + 8);
        v174 = v373;
        v173(v362, v373);
        v172(v368, v171);
        v175 = v367;
LABEL_36:
        v173(v175, v174);
        return;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v372 + 56))(v366, 1, 1, v371);
    }
    __break(1u);
    swift_unexpectedError();
    __break(1u);
    swift_unexpectedError();
    __break(1u);
    return;
  }
  if (v116 == 0x74756F6B726F77 && v117 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    v91 = (void (**)(NSObject *, uint64_t))v376;
    v157 = v349;
    goto LABEL_38;
  }
  v184 = sub_1BEDE9CD4();
  swift_bridgeObjectRelease();
  v91 = (void (**)(NSObject *, uint64_t))v376;
  v157 = v349;
  if ((v184 & 1) != 0)
  {
LABEL_38:
    if ((~LODWORD(a5) & 0x7F800000) != 0)
    {
      if (a5 > -9.2234e18)
      {
        if (a5 < 9.2234e18)
        {
          sub_1BEDE9440();
          sub_1BEDE9458();
          sub_1BEDE8F90();
          sub_1BEDE9794();
          sub_1BEDE9764();
          v185 = swift_allocObject();
          *(_QWORD *)(v185 + 16) = v378;
          *(_QWORD *)(v185 + 24) = v120;
          sub_1BEDD47C0(&qword_1EF578290, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02C58], MEMORY[0x1E0D02C50]);
          swift_retain();
          sub_1BEDE91A0();
          swift_release();
          v91[1](v100, v375);
          (*(void (**)(char *, uint64_t))(v341 + 8))(v157, v342);
          return;
        }
        goto LABEL_74;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  if ((v339 & 1) == 0)
  {
    sub_1BEDE99E0();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v188 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v189 = swift_allocObject();
    *(_OWORD *)(v189 + 16) = xmmword_1BEDEABF0;
    *(float *)v381 = a5;
    BYTE4(v381[0]) = 0;
    v190 = sub_1BEDE9710();
    v192 = v191;
    v193 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v189 + 56) = MEMORY[0x1E0DEA968];
    v194 = sub_1BEDCD658();
    *(_QWORD *)(v189 + 64) = v194;
    *(_QWORD *)(v189 + 32) = v190;
    *(_QWORD *)(v189 + 40) = v192;
    *(float *)v381 = a6;
    BYTE4(v381[0]) = 0;
    v195 = sub_1BEDE9710();
    *(_QWORD *)(v189 + 96) = v193;
    *(_QWORD *)(v189 + 104) = v194;
    *(_QWORD *)(v189 + 72) = v195;
    *(_QWORD *)(v189 + 80) = v196;
    sub_1BEDE9074();

    swift_bridgeObjectRelease();
    if ((~LODWORD(a5) & 0x7F800000) != 0)
    {
      v197 = v375;
      v198 = v376;
      v199 = v328;
      if (a5 > -9.2234e18)
      {
        if (a5 < 9.2234e18)
        {
          sub_1BEDE935C();
          sub_1BEDE9380();
          sub_1BEDE8F90();
          sub_1BEDE9794();
          v200 = v324;
          sub_1BEDE9764();
          v201 = swift_allocObject();
          *(_QWORD *)(v201 + 16) = v378;
          *(_QWORD *)(v201 + 24) = v120;
          sub_1BEDD47C0(&qword_1ED702F90, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02B08], MEMORY[0x1E0D02B00]);
          swift_retain();
          sub_1BEDE91A0();
          swift_release();
          v198[1](v200, v197);
          (*(void (**)(char *, uint64_t))(v326 + 8))(v199, v327);
          return;
        }
LABEL_77:
        __break(1u);
      }
LABEL_76:
      __break(1u);
      goto LABEL_77;
    }
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  sub_1BEDE8F90();
  v72 = 0;
  sub_1BEDE9794();
  sub_1BEDE9764();
  sub_1BEDE9404();
  v186 = *(char **)((char *)v374 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
  sub_1BEDD47C0(&qword_1EF577D08, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02BC0], MEMORY[0x1E0D02BB8]);
  v187 = v329;
  v116 = v337;
  sub_1BEDE91B8();
  v114 = (char *)v338;
  v110 = v334;
  v367 = v186;
  v75 = v320;
  v202 = v332;
  v320[4](v332, v187, v116);
  sub_1BEDE90B0();
  sub_1BEDE90A4();
  sub_1BEDE9080();
  v112 = v314;
  v368 = (char *)v75[2];
  ((void (*)(void (**)(char *, uint64_t), char *, uint64_t))v368)(v314, v202, v116);
  v100 = sub_1BEDE90A4();
  LODWORD(v373) = sub_1BEDE9A34();
  v203 = sub_1BEDE9A40();
  if ((v203 & 1) == 0)
    goto LABEL_54;
  v374 = *(void (**)(char *, char *, char *))(v323 + 16);
  v374(v315, v110, v114);
  v204 = (uint8_t *)swift_slowAlloc();
  v205 = (void *)swift_slowAlloc();
  v381[0] = v205;
  *(_DWORD *)v204 = 136315138;
  v206 = (uint64_t)v306;
  sub_1BEDE93F8();
  v207 = v311;
  v208 = v312;
  v209 = v112;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v311 + 48))(v206, 1, v312))
  {
    v210 = 7104878;
    sub_1BEDD4434(v206, &qword_1ED702FC8);
    v211 = 0xE300000000000000;
  }
  else
  {
    v214 = v298;
    (*(void (**)(char *, uint64_t, uint64_t))(v207 + 16))(v298, v206, v208);
    sub_1BEDD4434(v206, &qword_1ED702FC8);
    v215 = v207;
    v216 = sub_1BEDE93E0();
    v217 = v208;
    v210 = v216;
    v211 = v218;
    (*(void (**)(char *, uint64_t))(v215 + 8))(v214, v217);
  }
  v219 = v373;
  v380 = sub_1BEDCCA90(v210, v211, (uint64_t *)v381);
  sub_1BEDE9A88();
  swift_bridgeObjectRelease();
  v116 = v337;
  v373 = v320[1];
  ((void (*)(_QWORD, uint64_t))v373)(v209, v337);
  v220 = v315;
  v221 = sub_1BEDE908C();
  _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v100, v219, v221, "LargeImage.Context.init", "largeImageContextualInfo: %s", v204, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1C3B85C64](v205, -1, -1);
  MEMORY[0x1C3B85C64](v204, -1, -1);

  v213 = (char *)v338;
  (*(void (**)(char *, uint64_t))(v323 + 8))(v220, v338);
  v91 = (void (**)(NSObject *, uint64_t))v376;
  v110 = v334;
  v212 = (char *)v374;
LABEL_57:
  v374 = (void (*)(char *, char *, char *))v212;
  ((void (*)(char *, char *, char *))v212)(v321, v110, v213);
  v222 = sub_1BEDE90EC();
  swift_allocObject();
  v369 = sub_1BEDE90E0();
  v223 = v332;
  ((void (*)(char *, char *, uint64_t))v368)(v316, v332, v116);
  v224 = v322;
  sub_1BEDE923C();
  v225 = v375;
  if (v72)
  {
    swift_release();
    (*(void (**)(char *, char *))(v323 + 8))(v110, v213);
    (*(void (**)(char *, uint64_t))(v318 + 8))(v333, v319);
    MEMORY[0x1C3B85B68](v72);
    v378(0, v72);

    ((void (*)(char *, uint64_t))v373)(v223, v116);
    (*(void (**)(char *, uint64_t))(v330 + 8))(v336, v331);
    v91[1](v335, v225);
  }
  else
  {
    v365 = v222;
    v226 = v310;
    v227 = *(void (**)(char *, char *, uint64_t))(v310 + 16);
    v228 = v307;
    v229 = v317;
    v227(v307, v224, v317);
    v230 = v309;
    v227(v309, v224, v229);
    v231 = sub_1BEDE90A4();
    v232 = v308;
    sub_1BEDE90D4();
    LODWORD(v366) = sub_1BEDE9A28();
    v233 = sub_1BEDE9A40();
    v363 = (char *)v227;
    if ((v233 & 1) != 0)
    {
      swift_retain();
      v234 = v294;
      sub_1BEDE90F8();
      swift_release();
      v235 = v295;
      v236 = v296;
      if ((*(unsigned int (**)(char *, uint64_t))(v295 + 88))(v234, v296) == *MEMORY[0x1E0DF2190])
      {
        v237 = 0;
        v362 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v235 + 8))(v234, v236);
        v362 = "bufferSize: %ld, vmAddress: %lu";
        v237 = 2;
      }
      v242 = v338;
      v374(v321, v232, (char *)v338);
      v243 = swift_slowAlloc();
      *(_BYTE *)v243 = 0;
      *(_BYTE *)(v243 + 1) = v237;
      *(_WORD *)(v243 + 2) = 2048;
      v244 = v307;
      v245 = (void *)sub_1BEDE9224();
      v246 = *(void (***)(char *, uint64_t))(v226 + 8);
      ((void (*)(char *, uint64_t))v246)(v244, v229);
      v381[0] = v245;
      sub_1BEDE9A88();
      *(_WORD *)(v243 + 12) = 2048;
      v247 = v309;
      v248 = (void *)sub_1BEDE9248();
      v364 = v246;
      ((void (*)(char *, uint64_t))v246)(v247, v317);
      v381[0] = v248;
      v226 = v310;
      v229 = v317;
      sub_1BEDE9A88();
      v249 = v321;
      v250 = sub_1BEDE908C();
      _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v231, (os_signpost_type_t)v366, v250, "LargeImage.Context.init", v362, (uint8_t *)v243, 0x16u);
      MEMORY[0x1C3B85C64](v243, -1, -1);

      v239 = *(void (**)(char *, uint64_t))(v323 + 8);
      v239(v308, v242);
      v239(v249, v242);
      v116 = v337;
      v241 = v301;
      v240 = v305;
    }
    else
    {
      v238 = *(void (***)(char *, uint64_t))(v226 + 8);
      ((void (*)(char *, uint64_t))v238)(v230, v229);
      v364 = v238;
      ((void (*)(char *, uint64_t))v238)(v228, v229);

      v239 = *(void (**)(char *, uint64_t))(v323 + 8);
      v239(v232, v338);
      v240 = v305;
      v241 = v301;
    }
    v366 = (char *)v239;
    ((void (*)(char *, char *, uint64_t))v363)(v241, v322, v229);
    v251 = (*(unsigned __int8 *)(v226 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v226 + 80);
    v363 = (char *)swift_allocObject();
    (*(void (**)(char *, char *, uint64_t))(v226 + 32))(&v363[v251], v241, v229);
    sub_1BEDE90A4();
    v252 = v313;
    sub_1BEDE9080();
    ((void (*)(char *, char *, uint64_t))v368)(v240, v332, v116);
    v253 = sub_1BEDE90A4();
    v254 = sub_1BEDE9A34();
    if ((sub_1BEDE9A40() & 1) != 0)
    {
      LODWORD(v368) = v254;
      v255 = v240;
      v256 = (void (*)(char *, char *, uint64_t))v374;
      v374(v302, v252, (char *)v338);
      v257 = (uint8_t *)swift_slowAlloc();
      v258 = (void *)swift_slowAlloc();
      v381[0] = v258;
      *(_DWORD *)v257 = 136315138;
      v259 = (uint64_t)v297;
      v260 = v255;
      sub_1BEDE93F8();
      v261 = v311;
      v262 = v312;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v311 + 48))(v259, 1, v312))
      {
        v263 = 7104878;
        sub_1BEDD4434(v259, &qword_1ED702FC8);
        v264 = 0xE300000000000000;
      }
      else
      {
        v267 = v298;
        (*(void (**)(char *, uint64_t, uint64_t))(v261 + 16))(v298, v259, v262);
        sub_1BEDD4434(v259, &qword_1ED702FC8);
        v268 = v261;
        v263 = sub_1BEDE93E0();
        v264 = v269;
        v270 = v267;
        v256 = (void (*)(char *, char *, uint64_t))v374;
        v260 = v305;
        (*(void (**)(char *, uint64_t))(v268 + 8))(v270, v262);
      }
      v380 = sub_1BEDCCA90(v263, v264, (uint64_t *)v381);
      sub_1BEDE9A88();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v373)(v260, v337);
      v271 = v302;
      v272 = sub_1BEDE908C();
      _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v253, (os_signpost_type_t)v368, v272, "Unpack LargeImage", "largeImageContextualInfo: %s", v257, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3B85C64](v258, -1, -1);
      MEMORY[0x1C3B85C64](v257, -1, -1);

      v273 = v271;
      v274 = v338;
      ((void (*)(char *, uint64_t))v366)(v273, v338);
      v266 = v299;
      v265 = v303;
      v256(v321, v252, v274);
    }
    else
    {

      ((void (*)(char *, uint64_t))v373)(v240, v116);
      v265 = v303;
      v266 = v299;
      v374(v321, v252, (char *)v338);
    }
    swift_allocObject();
    v368 = (char *)sub_1BEDE90E0();
    v374 = (void (*)(char *, char *, char *))sub_1BEDE926C();
    v275 = v318;
    v276 = v304;
    v277 = v319;
    (*(void (**)(char *, char *, uint64_t))(v318 + 16))(v304, v333, v319);
    v278 = v372;
    (*(void (**)(char *, uint64_t, uint64_t))(v372 + 16))(v370, v379, v371);
    v279 = v275;
    v280 = (*(unsigned __int8 *)(v275 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v275 + 80);
    v281 = (v265 + v280 + 7) & 0xFFFFFFFFFFFFFFF8;
    v282 = (v281 + 15) & 0xFFFFFFFFFFFFFFF8;
    v283 = (*(unsigned __int8 *)(v278 + 80) + v282 + 16) & ~(unint64_t)*(unsigned __int8 *)(v278 + 80);
    v284 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v279 + 32))(v284 + v280, v276, v277);
    *(_QWORD *)(v284 + v281) = v368;
    v285 = (_QWORD *)(v284 + v282);
    v286 = v377;
    *v285 = v378;
    v285[1] = v286;
    (*(void (**)(unint64_t, char *, uint64_t))(v278 + 32))(v284 + v283, v370, v371);
    v287 = (_QWORD *)(v284 + ((v266 + v283 + 7) & 0xFFFFFFFFFFFFFFF8));
    v288 = v363;
    *v287 = sub_1BEDD4330;
    v287[1] = v288;
    sub_1BEDD47C0(&qword_1ED702F88, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02958], MEMORY[0x1E0D02950]);
    swift_retain();
    swift_retain();
    swift_retain();
    v289 = v335;
    v290 = v322;
    sub_1BEDE91A0();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v291 = v338;
    v292 = v366;
    ((void (*)(char *, uint64_t))v366)(v313, v338);
    ((void (*)(char *, uint64_t))v364)(v290, v317);
    ((void (*)(char *, uint64_t))v292)(v334, v291);
    (*(void (**)(char *, uint64_t))(v318 + 8))(v333, v319);
    ((void (*)(char *, uint64_t))v373)(v332, v337);
    (*(void (**)(char *, uint64_t))(v330 + 8))(v336, v331);
    v376[1](v289, v375);
  }
}

uint64_t sub_1BEDC5264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  ipc_space_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  ipc_space_t v8;
  mach_port_name_t v9;
  uint64_t result;
  uint64_t v11;

  v0 = sub_1BEDE97F4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  v5 = *MEMORY[0x1E0C83DA0];
  v6 = sub_1BEDE9248();
  v7 = sub_1BEDE9224();
  if (v7 < 0)
  {
    result = sub_1BEDE9B60();
    __break(1u);
  }
  else
  {
    MEMORY[0x1C3B85CDC](v5, v6, v7);
    v8 = *v4;
    sub_1BEDE9230();
    v9 = sub_1BEDE97E8();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return mach_port_deallocate(v8, v9);
  }
  return result;
}

void sub_1BEDC5384(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, _QWORD), void (*a4)(_QWORD, void *), uint64_t a5, uint64_t a6, void (*a7)(uint64_t), uint64_t a8)
{
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
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  uint64_t v40;
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
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  void **v59;
  void *v60;
  NSObject *v61;
  int v62;
  char *v63;
  const char *v64;
  uint64_t v65;
  int v66;
  int v67;
  const char *v68;
  NSObject *v69;
  os_signpost_type_t v70;
  char v71;
  char *v72;
  const char *v73;
  uint64_t v74;
  BOOL v75;
  uint64_t v76;
  void (*v77)(_QWORD, void *);
  void (**v78)(char *, char *, uint64_t);
  void (*v79)(char *, char *, uint64_t);
  char *v80;
  uint64_t v81;
  const char *v82;
  void (**v83)(char *, char *, uint64_t);
  char *v84;
  uint64_t v85;
  uint8_t *v86;
  os_signpost_id_t v87;
  void (*v88)(char *, char *, uint64_t);
  char v89;
  char v90;
  uint64_t v91;
  char *v92;
  void (*v93)(char *, char *, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  NSObject *v102;
  const char *v103;
  void (*v104)(_QWORD, _QWORD);
  char *v105;
  os_signpost_id_t v106;
  char *v107;
  char *v108;
  NSObject *v109;
  os_signpost_type_t v110;
  char v111;
  void (*v112)(char *, uint64_t);
  uint8_t *v113;
  uint64_t v114;
  char *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  void (**v122)(char *, char *, uint64_t);
  char *v123;
  char *v124;
  void (*v125)(char *, char *, uint64_t);
  const char *v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  char *v130;
  unint64_t v131;
  const char *v132;
  char *v133;
  os_signpost_id_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  NSObject *v138;
  char *v139;
  int v140;
  char v141;
  char *v142;
  uint64_t v143;
  const char *v144;
  char *v145;
  uint64_t v146;
  const char *v147;
  void *v148;
  void (*v149)(char *, uint64_t);
  void (*v150)(char *, uint64_t);
  void (*v151)(void *, _QWORD);
  void (*v152)(uint64_t);
  void (*v153)(char *, uint64_t);
  uint64_t v154;
  char *v155;
  const char *v156;
  char v157;
  char v158;
  uint64_t v159;
  uint64_t v160;
  char *v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  unint64_t v169;
  char *v170;
  os_signpost_id_t v171;
  char *v172;
  uint64_t v173;
  void *v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  NSObject *v179;
  uint64_t v180;
  char *v181;
  char *v182;
  char *v183;
  uint64_t v184;
  char *v185;
  char *v186;
  char *v187;
  char *v188;
  char *v189;
  char *v190;
  uint64_t v191;
  char *v192;
  char *v193;
  void (*v194)(char *, char *, uint64_t);
  char *v195;
  char *v196;
  char *v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  char *v202;
  char *v203;
  uint64_t v204;
  void (*v205)(uint64_t);
  char *v206;
  uint64_t v207;
  void (*v208)(_QWORD, void *);
  void (*v209)(_QWORD, _QWORD);
  char *v210;
  void (**v211)(char *, char *, uint64_t);
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;

  v204 = a8;
  v205 = a7;
  v184 = a6;
  v207 = a5;
  v208 = a4;
  v209 = a3;
  v212 = a2;
  v9 = sub_1BEDE941C();
  v200 = *(_QWORD *)(v9 - 8);
  v201 = v9;
  v10 = MEMORY[0x1E0C80A78](v9);
  v182 = (char *)&v177 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v10);
  v188 = (char *)&v177 - v13;
  MEMORY[0x1E0C80A78](v12);
  v185 = (char *)&v177 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FC8);
  v16 = MEMORY[0x1E0C80A78](v15);
  v183 = (char *)&v177 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x1E0C80A78](v16);
  v189 = (char *)&v177 - v19;
  MEMORY[0x1E0C80A78](v18);
  v186 = (char *)&v177 - v20;
  v21 = (const char *)sub_1BEDE90C8();
  v198 = *((_QWORD *)v21 - 1);
  v199 = v21;
  v22 = MEMORY[0x1E0C80A78](v21);
  v197 = (char *)&v177 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x1E0C80A78](v22);
  v181 = (char *)&v177 - v25;
  MEMORY[0x1E0C80A78](v24);
  v187 = (char *)&v177 - v26;
  v213 = sub_1BEDE9098();
  v211 = *(void (***)(char *, char *, uint64_t))(v213 - 8);
  v27 = MEMORY[0x1E0C80A78](v213);
  v29 = (char *)&v177 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x1E0C80A78](v27);
  v190 = (char *)&v177 - v31;
  v32 = MEMORY[0x1E0C80A78](v30);
  v193 = (char *)&v177 - v33;
  v34 = MEMORY[0x1E0C80A78](v32);
  v203 = (char *)&v177 - v35;
  v36 = MEMORY[0x1E0C80A78](v34);
  v196 = (char *)&v177 - v37;
  v38 = MEMORY[0x1E0C80A78](v36);
  v210 = (char *)&v177 - v39;
  v40 = MEMORY[0x1E0C80A78](v38);
  v195 = (char *)&v177 - v41;
  MEMORY[0x1E0C80A78](v40);
  v43 = (char *)&v177 - v42;
  v44 = sub_1BEDE926C();
  v45 = *(_QWORD *)(v44 - 8);
  v46 = MEMORY[0x1E0C80A78](v44);
  v192 = (char *)&v177 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = MEMORY[0x1E0C80A78](v46);
  v206 = (char *)&v177 - v49;
  v50 = MEMORY[0x1E0C80A78](v48);
  v202 = (char *)&v177 - v51;
  v52 = MEMORY[0x1E0C80A78](v50);
  v54 = (char *)&v177 - v53;
  MEMORY[0x1E0C80A78](v52);
  v56 = (char *)&v177 - v55;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF577D10);
  MEMORY[0x1E0C80A78](v57);
  v59 = (void **)((char *)&v177 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BEDD4744(a1, (uint64_t)v59, &qword_1EF577D10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v60 = *v59;
    v61 = sub_1BEDE90A4();
    sub_1BEDE90D4();
    v62 = sub_1BEDE9A28();
    if ((sub_1BEDE9A40() & 1) != 0)
    {
      swift_retain();
      v63 = v197;
      sub_1BEDE90F8();
      swift_release();
      v65 = v198;
      v64 = v199;
      v66 = (*(uint64_t (**)(char *, const char *))(v198 + 88))(v63, v199);
      v67 = *MEMORY[0x1E0DF2190];
      LODWORD(v212) = v62;
      if (v66 == v67)
      {
        v68 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, const char *))(v65 + 8))(v63, v64);
        v68 = "error unpacking";
      }
      v210 = (char *)v68;
      v77 = v208;
      v83 = v211;
      v84 = v203;
      v85 = v213;
      v211[2](v203, v29, v213);
      v86 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v86 = 0;
      v87 = sub_1BEDE908C();
      _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v61, (os_signpost_type_t)v212, v87, "Unpack LargeImage", v210, v86, 2u);
      MEMORY[0x1C3B85C64](v86, -1, -1);

      v88 = v83[1];
      ((void (*)(char *, uint64_t))v88)(v29, v85);
      v76 = ((uint64_t (*)(char *, uint64_t))v88)(v84, v85);
    }
    else
    {

      v76 = ((uint64_t (*)(char *, uint64_t))v211[1])(v29, v213);
      v77 = v208;
    }
    v205(v76);
    MEMORY[0x1C3B85B68](v60);
    v77(0, v60);

  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v45 + 32))(v56, v59, v44);
    v194 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
    v194(v54, v56, v44);
    v69 = sub_1BEDE90A4();
    sub_1BEDE90D4();
    v70 = sub_1BEDE9A28();
    v71 = sub_1BEDE9A40();
    v191 = v44;
    v197 = v56;
    if ((v71 & 1) != 0)
    {
      v179 = v69;
      swift_retain();
      v72 = v187;
      sub_1BEDE90F8();
      swift_release();
      v74 = v198;
      v73 = v199;
      v75 = (*(unsigned int (**)(char *, const char *))(v198 + 88))(v72, v199) == *MEMORY[0x1E0DF2190];
      v180 = v45;
      if (v75)
      {
        v90 = 0;
        v89 = 0;
        v178 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, const char *))(v74 + 8))(v72, v73);
        v178 = "result.metadata.largeImageContextualInfo: %s";
        v89 = 2;
        v90 = 1;
      }
      v91 = (uint64_t)v186;
      v92 = v185;
      v93 = v211[2];
      v187 = v43;
      v93(v195, v43, v213);
      v94 = swift_slowAlloc();
      v95 = swift_slowAlloc();
      v215 = v95;
      *(_BYTE *)v94 = v89;
      *(_BYTE *)(v94 + 1) = v90;
      *(_WORD *)(v94 + 2) = 2080;
      v209 = (void (*)(_QWORD, _QWORD))v54;
      sub_1BEDE9260();
      sub_1BEDE93F8();
      (*(void (**)(char *, uint64_t))(v200 + 8))(v92, v201);
      v96 = sub_1BEDE93EC();
      v97 = *(_QWORD *)(v96 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v97 + 48))(v91, 1, v96) == 1)
      {
        v98 = 7104878;
        sub_1BEDD4434(v91, &qword_1ED702FC8);
        v99 = 0xE300000000000000;
      }
      else
      {
        v98 = sub_1BEDE93E0();
        v99 = v100;
        (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v91, v96);
      }
      v101 = v213;
      v102 = v179;
      v103 = v178;
      v214 = sub_1BEDCCA90(v98, v99, &v215);
      sub_1BEDE9A88();
      swift_bridgeObjectRelease();
      v104 = v209;
      v44 = v191;
      v209 = *(void (**)(_QWORD, _QWORD))(v180 + 8);
      v209(v104, v191);
      v105 = v195;
      v106 = sub_1BEDE908C();
      _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v102, v70, v106, "Unpack LargeImage", v103, (uint8_t *)v94, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3B85C64](v95, -1, -1);
      MEMORY[0x1C3B85C64](v94, -1, -1);

      v78 = v211;
      v79 = v211[1];
      ((void (*)(char *, uint64_t))v79)(v187, v101);
      v81 = v101;
      ((void (*)(char *, uint64_t))v79)(v105, v101);
      v82 = v210;
      v56 = v197;
    }
    else
    {
      v209 = *(void (**)(_QWORD, _QWORD))(v45 + 8);
      v209(v54, v44);

      v78 = v211;
      v79 = v211[1];
      v80 = v43;
      v81 = v213;
      ((void (*)(char *))v79)(v80);
      v82 = v210;
    }
    v107 = v202;
    sub_1BEDE90A4();
    sub_1BEDE9080();
    v194(v107, v56, v44);
    v108 = v107;
    v109 = sub_1BEDE90A4();
    v110 = sub_1BEDE9A34();
    v111 = sub_1BEDE9A40();
    v195 = (char *)v79;
    if ((v111 & 1) != 0)
    {
      v112 = (void (*)(char *, uint64_t))v209;
      v211 = (void (**)(char *, char *, uint64_t))v78[2];
      ((void (*)(char *, const char *, uint64_t))v211)(v196, v82, v81);
      v113 = (uint8_t *)swift_slowAlloc();
      v114 = swift_slowAlloc();
      v215 = v114;
      *(_DWORD *)v113 = 136315138;
      v115 = v188;
      sub_1BEDE9260();
      v116 = v189;
      sub_1BEDE93F8();
      (*(void (**)(char *, uint64_t))(v200 + 8))(v115, v201);
      v117 = sub_1BEDE93EC();
      v118 = *(_QWORD *)(v117 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v118 + 48))(v116, 1, v117) == 1)
      {
        v119 = (uint64_t)v116;
        v120 = 7104878;
        sub_1BEDD4434(v119, &qword_1ED702FC8);
        v121 = 0xE300000000000000;
      }
      else
      {
        v129 = sub_1BEDE93E0();
        v130 = v116;
        v120 = v129;
        v121 = v131;
        (*(void (**)(char *, uint64_t))(v118 + 8))(v130, v117);
      }
      v132 = v210;
      v125 = v194;
      v214 = sub_1BEDCCA90(v120, v121, &v215);
      sub_1BEDE9A88();
      swift_bridgeObjectRelease();
      v44 = v191;
      v112(v202, v191);
      v133 = v196;
      v134 = sub_1BEDE908C();
      _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v109, v110, v134, "Copy MachImage", "result.metadata.largeImageContextualInfo: %s", v113, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3B85C64](v114, -1, -1);
      MEMORY[0x1C3B85C64](v113, -1, -1);

      v127 = v213;
      v79 = (void (*)(char *, char *, uint64_t))v195;
      ((void (*)(char *, uint64_t))v195)(v133, v213);
      v123 = v197;
      v124 = v203;
      v126 = v132;
      v128 = v206;
      v122 = v211;
    }
    else
    {

      v209(v108, v44);
      v122 = (void (**)(char *, char *, uint64_t))v78[2];
      v123 = v197;
      v124 = v203;
      v125 = v194;
      v126 = v82;
      v127 = v81;
      v128 = v206;
    }
    v211 = v122;
    ((void (*)(char *, const char *, uint64_t))v122)(v124, v126, v127);
    sub_1BEDE90EC();
    swift_allocObject();
    v135 = sub_1BEDE90E0();
    v125(v128, v123, v44);
    sub_1BEDE920C();
    v136 = sub_1BEDE986C();
    swift_release();
    if (v136)
    {
      v137 = v192;
      v125(v192, v123, v44);
      v138 = sub_1BEDE90A4();
      v139 = v193;
      sub_1BEDE90D4();
      v140 = sub_1BEDE9A28();
      v141 = sub_1BEDE9A40();
      v202 = (char *)v136;
      v203 = (char *)v135;
      if ((v141 & 1) != 0)
      {
        LODWORD(v212) = v140;
        swift_retain();
        v142 = v181;
        sub_1BEDE90F8();
        swift_release();
        v143 = v198;
        v144 = v199;
        v75 = (*(unsigned int (**)(char *, const char *))(v198 + 88))(v142, v199) == *MEMORY[0x1E0DF2190];
        v145 = v190;
        v146 = v213;
        if (v75)
        {
          v158 = 0;
          v157 = 0;
          v156 = "[Error] Interval already ended";
        }
        else
        {
          v155 = v190;
          (*(void (**)(char *, const char *))(v143 + 8))(v142, v144);
          v145 = v155;
          v156 = "result.metadata.largeImageContextualInfo: %s";
          v157 = 2;
          v158 = 1;
        }
        v199 = v156;
        ((void (*)(char *, char *, uint64_t))v211)(v145, v139, v146);
        v159 = swift_slowAlloc();
        v160 = swift_slowAlloc();
        v215 = v160;
        *(_BYTE *)v159 = v157;
        *(_BYTE *)(v159 + 1) = v158;
        *(_WORD *)(v159 + 2) = 2080;
        v161 = v182;
        sub_1BEDE9260();
        v162 = v183;
        sub_1BEDE93F8();
        v163 = (uint64_t)v162;
        (*(void (**)(char *, uint64_t))(v200 + 8))(v161, v201);
        v164 = sub_1BEDE93EC();
        v165 = *(_QWORD *)(v164 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v165 + 48))(v163, 1, v164) == 1)
        {
          v166 = 7104878;
          sub_1BEDD4434(v163, &qword_1ED702FC8);
          v167 = 0xE300000000000000;
        }
        else
        {
          v168 = v163;
          v166 = sub_1BEDE93E0();
          v167 = v169;
          (*(void (**)(uint64_t, uint64_t))(v165 + 8))(v168, v164);
        }
        v150 = (void (*)(char *, uint64_t))v209;
        v214 = sub_1BEDCCA90(v166, v167, &v215);
        sub_1BEDE9A88();
        swift_bridgeObjectRelease();
        v150(v192, v191);
        v170 = v190;
        v171 = sub_1BEDE908C();
        _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v138, (os_signpost_type_t)v212, v171, "Copy MachImage", v199, (uint8_t *)v159, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C3B85C64](v160, -1, -1);
        MEMORY[0x1C3B85C64](v159, -1, -1);

        v154 = v213;
        v153 = (void (*)(char *, uint64_t))v195;
        ((void (*)(char *, uint64_t))v195)(v193, v213);
        v151 = (void (*)(void *, _QWORD))v208;
        v152 = v205;
        v153(v170, v154);
      }
      else
      {
        v150 = (void (*)(char *, uint64_t))v209;
        v209(v137, v44);

        v151 = (void (*)(void *, _QWORD))v208;
        v152 = v205;
        v153 = (void (*)(char *, uint64_t))v195;
        v154 = v213;
        ((void (*)(char *, uint64_t))v195)(v139, v213);
      }
      swift_retain();
      v172 = v206;
      v173 = sub_1BEDE9218();
      v152(v173);
      v174 = (void *)sub_1BEDE9200();
      v151(v174, 0);
      swift_release();
      swift_release();

      v175 = v172;
      v176 = v191;
      v150(v175, v191);
      v153(v210, v154);
      v150(v197, v176);
    }
    else
    {
      sub_1BEDE8F9C();
      sub_1BEDD47C0(&qword_1EF578280, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
      sub_1BEDE9CC8();
      sub_1BEDE9854();
      v147 = v126;
      sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
      v148 = (void *)swift_allocError();
      sub_1BEDE9848();
      v208(0, v148);

      swift_release();
      v149 = (void (*)(char *, uint64_t))v209;
      v209(v128, v44);
      ((void (*)(const char *, uint64_t))v79)(v147, v127);
      v149(v123, v44);
    }
  }
}

uint64_t sub_1BEDC6400(float a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  char *v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = a4;
  v6 = sub_1BEDE9038();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BEDE97C4();
  MEMORY[0x1E0C80A78](v10);
  v11 = sub_1BEDE9770();
  v24 = *(_QWORD *)(v11 - 8);
  v25 = v11;
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1BEDE93A4();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((~LODWORD(a1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.2234e18)
  {
    v22 = v7;
    v23 = v6;
    sub_1BEDE9398();
    sub_1BEDE8F90();
    sub_1BEDE9794();
    sub_1BEDE9764();
    sub_1BEDE93D4();
    v18 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02B50];
    sub_1BEDE902C();
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = a3;
    *(_QWORD *)(v19 + 24) = v26;
    sub_1BEDD47C0(&qword_1EF578288, v18, MEMORY[0x1E0D02B48]);
    swift_retain();
    sub_1BEDE9188();
    swift_release();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v23);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
LABEL_7:
  __break(1u);
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

void sub_1BEDC66C8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void *, void *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v6 = sub_1BEDE93D4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5783D0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (uint64_t *)((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BEDD4744(a1, (uint64_t)v12, &qword_1EF5783D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v13 = (void *)*v12;
    MEMORY[0x1C3B85B68](*v12);
    a4(0, v13);

  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v7 + 32))(v9, v12, v6);
    v14 = (void *)sub_1BEDE93B0();
    a4(v14, 0);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_1BEDC6928(float a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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
  char *v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v25 = a5;
  v7 = sub_1BEDE9038();
  v26 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BEDE97C4();
  MEMORY[0x1E0C80A78](v10);
  v11 = sub_1BEDE9770();
  v23 = *(_QWORD *)(v11 - 8);
  v24 = v11;
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1BEDE93A4();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((~LODWORD(a1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.2234e18)
  {
    v22 = v7;
    sub_1BEDE9398();
    sub_1BEDE8F90();
    sub_1BEDE9794();
    sub_1BEDE9764();
    sub_1BEDE93D4();
    v18 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02B50];
    sub_1BEDE902C();
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = a4;
    *(_QWORD *)(v19 + 24) = v25;
    sub_1BEDD47C0(&qword_1EF578288, v18, MEMORY[0x1E0D02B48]);
    swift_retain();
    sub_1BEDE9188();
    swift_release();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v22);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v24);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
LABEL_7:
  __break(1u);
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

void sub_1BEDC6D1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  id v7;

  if (a2)
    v6 = sub_1BEDE8F3C();
  else
    v6 = 0;
  v7 = (id)v6;
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a1);

}

uint64_t sub_1BEDC6D84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v30;
  int v31;
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

  v39 = a8;
  LODWORD(v34) = a7;
  v32 = a6;
  v33 = a1;
  v31 = a5;
  v30 = a4;
  v9 = sub_1BEDE9038();
  v40 = *(_QWORD *)(v9 - 8);
  v41 = v9;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BEDE97C4();
  MEMORY[0x1E0C80A78](v12);
  v13 = sub_1BEDE9770();
  v37 = *(_QWORD *)(v13 - 8);
  v38 = v13;
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1BEDE93A4();
  v35 = *(_QWORD *)(v16 - 8);
  v36 = v16;
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1BEDE93C8();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v30 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v30 - v24;
  sub_1BEDE93BC();
  v26 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
  v34 = v19;
  v26(v23, v25, v19);
  sub_1BEDE938C();
  sub_1BEDE8F90();
  sub_1BEDE9794();
  sub_1BEDE9764();
  sub_1BEDE93D4();
  v27 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02B50];
  sub_1BEDE902C();
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = v39;
  *(_QWORD *)(v28 + 24) = a9;
  sub_1BEDD47C0(&qword_1EF578288, v27, MEMORY[0x1E0D02B48]);
  swift_retain();
  sub_1BEDE9188();
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v41);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v15, v38);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v18, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v25, v34);
}

void sub_1BEDC7084(uint64_t a1, uint64_t a2, char a3, void (*a4)(void *, void *, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v7 = sub_1BEDE93D4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5783D0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (uint64_t *)((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BEDD4744(a1, (uint64_t)v13, &qword_1EF5783D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = (void *)*v13;
    MEMORY[0x1C3B85B68](*v13);
    a4(0, v14, a3 & 1);

  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v8 + 32))(v10, v13, v7);
    v15 = (void *)sub_1BEDE93B0();
    a4(v15, 0, a3 & 1);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

uint64_t sub_1BEDC730C(float a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t (*v15)(uint64_t);
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v7 = sub_1BEDE97C4();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1BEDE9770();
  v20 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1BEDE944C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((~LODWORD(a1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.2234e18)
  {
    v19 = v8;
    sub_1BEDE9440();
    sub_1BEDE8F90();
    sub_1BEDE9794();
    sub_1BEDE9764();
    sub_1BEDE9458();
    v15 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02C58];
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = a3;
    *(_QWORD *)(v16 + 24) = a4;
    sub_1BEDD47C0(&qword_1EF578290, v15, MEMORY[0x1E0D02C50]);
    swift_retain();
    sub_1BEDE91A0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
LABEL_7:
  __break(1u);
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1BEDC764C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = a3;
  v14 = a2;
  v3 = sub_1BEDE97C4();
  MEMORY[0x1E0C80A78](v3);
  v15 = sub_1BEDE9770();
  v4 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1BEDE9344();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEDE9338();
  sub_1BEDE9350();
  sub_1BEDE8F90();
  sub_1BEDE9794();
  sub_1BEDE9764();
  v11 = swift_allocObject();
  v12 = v16;
  *(_QWORD *)(v11 + 16) = v14;
  *(_QWORD *)(v11 + 24) = v12;
  sub_1BEDD47C0(&qword_1ED702F40, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02AD0], MEMORY[0x1E0D02AC8]);
  swift_retain();
  sub_1BEDE91A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_1BEDC7918(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(_QWORD, void *), uint64_t a7)
{
  sub_1BEDC7CAC(a1, a2, a3, a4, a5, 0, 0xF000000000000000, 0, 0xF000000000000000, 0, 0xF000000000000000, 1u, a6, a7);
}

__n128 sub_1BEDC7A80(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, unint64_t a11, void (*a12)(_QWORD, void *), uint64_t a13)
{
  __n128 result;

  sub_1BEDC7CAC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, 1u, a12, a13);
  return result;
}

void sub_1BEDC7CAC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, unint64_t a11, unsigned __int8 a12, void (*a13)(_QWORD, void *), uint64_t a14)
{
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
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  char *v46;
  void *v47;
  id v48;
  char *v49;
  void *v50;
  id v51;
  char *v52;
  uint64_t (*v53)(uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  unint64_t v75;
  uint64_t v76;
  char *v77;
  void (*v78)(char *, uint64_t);
  uint64_t v79;
  void (*v80)(_QWORD, void *);
  uint64_t v81;
  id v82[3];

  v71 = a8;
  v69 = a6;
  v70 = a7;
  v67 = a4;
  v68 = a5;
  v65 = a2;
  v66 = a3;
  v80 = a13;
  v81 = a14;
  v82[1] = *(id *)MEMORY[0x1E0C80C00];
  v14 = sub_1BEDE9770();
  MEMORY[0x1E0C80A78](v14);
  v64 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1BEDE9830();
  v73 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v72 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1BEDE8F9C();
  v75 = *(_QWORD *)(v18 - 8);
  v76 = v18;
  MEMORY[0x1E0C80A78](v18);
  v74 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1BEDE9038();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v59 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_1BEDE97C4();
  v24 = *(void (**)(char *, uint64_t))(v79 - 8);
  v25 = MEMORY[0x1E0C80A78](v79);
  v27 = (char *)&v59 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x1E0C80A78](v25);
  v30 = (char *)&v59 - v29;
  v31 = MEMORY[0x1E0C80A78](v28);
  v33 = (char *)&v59 - v32;
  MEMORY[0x1E0C80A78](v31);
  v77 = (char *)&v59 - v34;
  v35 = (void *)objc_opt_self();
  v36 = (void *)sub_1BEDE9878();
  v82[0] = 0;
  v37 = objc_msgSend(v35, sel_dataWithPropertyList_format_options_error_, v36, 200, 0, v82);

  v38 = v82[0];
  if (!v37)
  {
    v42 = v38;
    v43 = (void *)sub_1BEDE8F48();

    swift_willThrow();
LABEL_4:
    sub_1BEDE9854();
    sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    v47 = (void *)swift_allocError();
    MEMORY[0x1C3B85B68](v43);
    sub_1BEDE9860();
    v80(0, v47);

    return;
  }
  v78 = v24;
  v62 = v27;
  v63 = v16;
  v39 = sub_1BEDE8FF0();
  v41 = v40;

  sub_1BEDE9788();
  sub_1BEDE97B8();
  v60 = v39;
  v61 = v41;
  v44 = v79;
  v45 = (void (*)(char *, uint64_t))*((_QWORD *)v78 + 1);
  v45(v30, v79);
  sub_1BEDE902C();
  sub_1BEDE9014();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  v46 = v77;
  sub_1BEDE97B8();
  v45(v33, v44);
  swift_bridgeObjectRelease();
  v48 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v49 = v74;
  sub_1BEDE97A0();
  v50 = (void *)sub_1BEDE8F60();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v49, v76);
  v82[0] = 0;
  LODWORD(v49) = objc_msgSend(v48, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v50, 1, 0, v82);

  v51 = v82[0];
  if (!(_DWORD)v49)
  {
    v58 = v51;
    v43 = (void *)sub_1BEDE8F48();

    swift_willThrow();
    sub_1BEDBB354(v60, v61);
    v45(v46, v44);
    goto LABEL_4;
  }
  LODWORD(v76) = a12;
  v74 = (char *)a9;
  v75 = a11;
  (*((void (**)(char *, char *, uint64_t))v78 + 2))(v62, v46, v44);
  sub_1BEDBB398(v65, v66);
  swift_bridgeObjectRetain();
  sub_1BEDD02C4(v69, v70);
  sub_1BEDD02C4(v71, a9);
  sub_1BEDD02C4(a10, v75);
  v78 = v45;
  sub_1BEDE9764();
  v52 = v72;
  sub_1BEDE9824();
  sub_1BEDE983C();
  v53 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D03270];
  v54 = swift_allocObject();
  v55 = v81;
  *(_QWORD *)(v54 + 16) = v80;
  *(_QWORD *)(v54 + 24) = v55;
  sub_1BEDD47C0(&qword_1EF578298, v53, MEMORY[0x1E0D03268]);
  swift_retain();
  v56 = v60;
  v57 = v61;
  sub_1BEDE9194();
  swift_release();
  sub_1BEDBB354(v56, v57);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v52, v63);
  v78(v77, v79);
}

uint64_t sub_1BEDC8578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = a4;
  v15 = a3;
  v4 = sub_1BEDE97C4();
  MEMORY[0x1E0C80A78](v4);
  v16 = sub_1BEDE9770();
  v5 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BEDE959C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEDE9590();
  sub_1BEDE95A8();
  sub_1BEDE8F90();
  sub_1BEDE9794();
  sub_1BEDE9764();
  v12 = swift_allocObject();
  v13 = v17;
  *(_QWORD *)(v12 + 16) = v15;
  *(_QWORD *)(v12 + 24) = v13;
  sub_1BEDD47C0(&qword_1EF5782A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02E48], MEMORY[0x1E0D02E40]);
  swift_retain();
  sub_1BEDE91A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1BEDC878C(float a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;

  v19 = a4;
  v7 = sub_1BEDE97C4();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1BEDE9770();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BEDE9368();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((~LODWORD(a1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.2234e18)
  {
    v18 = v8;
    sub_1BEDE935C();
    sub_1BEDE9380();
    sub_1BEDE8F90();
    sub_1BEDE9794();
    sub_1BEDE9764();
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v19;
    *(_QWORD *)(v16 + 24) = a5;
    sub_1BEDD47C0(&qword_1ED702F90, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02B08], MEMORY[0x1E0D02B00]);
    swift_retain();
    sub_1BEDE91A0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
LABEL_7:
  __break(1u);
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1BEDC8AE0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, float a7, float a8)
{
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, char *, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  void *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  id v71;
  uint64_t result;
  char *v73;
  void (*v74)(char *, uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  int v84;
  uint64_t v85;
  char *v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  float v100;
  char v101;

  v82 = a6;
  v85 = a5;
  v84 = a4;
  v77 = a3;
  v78 = a2;
  v11 = sub_1BEDE8F9C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v80 = v13;
  v94 = (char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5782A8);
  MEMORY[0x1E0C80A78](v14);
  v97 = (uint64_t)&v73 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1BEDE9548();
  v98 = *(_QWORD *)(v16 - 8);
  v99 = v16;
  v17 = MEMORY[0x1E0C80A78](v16);
  v92 = (char *)&v73 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = v18;
  MEMORY[0x1E0C80A78](v17);
  v96 = (char *)&v73 - v19;
  v20 = sub_1BEDE97C4();
  MEMORY[0x1E0C80A78](v20);
  v95 = sub_1BEDE9770();
  v93 = *(_QWORD *)(v95 - 8);
  v21 = MEMORY[0x1E0C80A78](v95);
  v88 = (char *)&v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = v22;
  MEMORY[0x1E0C80A78](v21);
  v24 = (char *)&v73 - v23;
  v25 = sub_1BEDE9164();
  v90 = *(_QWORD *)(v25 - 8);
  v91 = v25;
  v26 = MEMORY[0x1E0C80A78](v25);
  v87 = (char *)&v73 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = v27;
  MEMORY[0x1E0C80A78](v26);
  v29 = (char *)&v73 - v28;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FB8);
  MEMORY[0x1E0C80A78](v30);
  v32 = (char *)&v73 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(v86) = sub_1BEDE99E0();
  sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
  v33 = (void *)sub_1BEDE9A58();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
  v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_1BEDEAC00;
  v74 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v74(v32, a1, v11);
  v81 = v12;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v32, 0, 1, v11);
  v89 = v11;
  v35 = sub_1BEDE9710();
  v37 = v36;
  sub_1BEDD4434((uint64_t)v32, &qword_1ED702FB8);
  v38 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v34 + 56) = MEMORY[0x1E0DEA968];
  v39 = sub_1BEDCD658();
  *(_QWORD *)(v34 + 64) = v39;
  *(_QWORD *)(v34 + 32) = v35;
  *(_QWORD *)(v34 + 40) = v37;
  v100 = a7;
  v101 = 0;
  v40 = sub_1BEDE9710();
  *(_QWORD *)(v34 + 96) = v38;
  *(_QWORD *)(v34 + 104) = v39;
  *(_QWORD *)(v34 + 72) = v40;
  *(_QWORD *)(v34 + 80) = v41;
  v100 = a8;
  v101 = 0;
  v42 = sub_1BEDE9710();
  *(_QWORD *)(v34 + 136) = v38;
  *(_QWORD *)(v34 + 144) = v39;
  *(_QWORD *)(v34 + 112) = v42;
  *(_QWORD *)(v34 + 120) = v43;
  sub_1BEDE9074();

  swift_bridgeObjectRelease();
  sub_1BEDE9158();
  sub_1BEDE8F90();
  sub_1BEDE9794();
  sub_1BEDE9764();
  if ((~LODWORD(a7) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a7 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a7 < 9.2234e18)
  {
    v44 = v24;
    v45 = v96;
    sub_1BEDE953C();
    v46 = sub_1BEDE99B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v97, 1, 1, v46);
    v74(v94, v78, v89);
    v47 = v93;
    (*(void (**)(char *, char *, uint64_t))(v93 + 16))(v88, v24, v95);
    v48 = v98;
    (*(void (**)(char *, char *, uint64_t))(v98 + 16))(v92, v45, v99);
    v49 = *(void (**)(char *, char *, uint64_t))(v90 + 16);
    v50 = v90;
    v73 = v29;
    v49(v87, v29, v91);
    v51 = v81;
    v52 = *(unsigned __int8 *)(v81 + 80);
    v86 = v44;
    v53 = (v52 + 32) & ~v52;
    v54 = (v80 + v53 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    v55 = (v54 + 11) & 0xFFFFFFFFFFFFFFF8;
    v56 = (*(unsigned __int8 *)(v47 + 80) + v55 + 8) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
    v57 = (v76 + *(unsigned __int8 *)(v48 + 80) + v56) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
    v80 = v57 + v79;
    v58 = (v57 + v79) & 0xFFFFFFFFFFFFFFFCLL;
    v59 = (*(unsigned __int8 *)(v50 + 80) + v58 + 8) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
    v60 = v83;
    v79 = (v75 + v59 + 7) & 0xFFFFFFFFFFFFFFF8;
    v61 = swift_allocObject();
    *(_QWORD *)(v61 + 16) = 0;
    *(_QWORD *)(v61 + 24) = 0;
    (*(void (**)(uint64_t, char *, uint64_t))(v51 + 32))(v61 + v53, v94, v89);
    *(float *)(v61 + v54) = a8;
    *(_QWORD *)(v61 + v55) = v60;
    v62 = v61 + v56;
    v63 = v93;
    v64 = v95;
    (*(void (**)(unint64_t, char *, uint64_t))(v93 + 32))(v62, v88, v95);
    v66 = v98;
    v65 = v99;
    (*(void (**)(unint64_t, char *, uint64_t))(v98 + 32))(v61 + v57, v92, v99);
    *(_BYTE *)(v61 + v80) = v84 & 1;
    *(float *)(v58 + v61 + 4) = a7;
    v68 = v90;
    v67 = v91;
    (*(void (**)(unint64_t, char *, uint64_t))(v90 + 32))(v61 + v59, v87, v91);
    v69 = (_QWORD *)(v61 + v79);
    v70 = v82;
    *v69 = v85;
    v69[1] = v70;
    v71 = v60;
    swift_retain();
    sub_1BEDCA260(v97, (uint64_t)&unk_1EF5782B8, v61);
    swift_release();
    (*(void (**)(char *, uint64_t))(v66 + 8))(v96, v65);
    (*(void (**)(char *, uint64_t))(v63 + 8))(v86, v64);
    return (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v73, v67);
  }
LABEL_7:
  __break(1u);
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1BEDC91C0(float a1, float a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  uint64_t v18;

  *(_QWORD *)(v10 + 128) = v18;
  *(_OWORD *)(v10 + 112) = v17;
  *(float *)(v10 + 340) = a2;
  *(_BYTE *)(v10 + 344) = a10;
  *(_QWORD *)(v10 + 96) = a8;
  *(_QWORD *)(v10 + 104) = a9;
  *(float *)(v10 + 336) = a1;
  *(_QWORD *)(v10 + 80) = a6;
  *(_QWORD *)(v10 + 88) = a7;
  v11 = sub_1BEDE9164();
  *(_QWORD *)(v10 + 136) = v11;
  *(_QWORD *)(v10 + 144) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v10 + 152) = swift_task_alloc();
  *(_QWORD *)(v10 + 160) = swift_task_alloc();
  v12 = sub_1BEDE9578();
  *(_QWORD *)(v10 + 168) = v12;
  *(_QWORD *)(v10 + 176) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v10 + 184) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578398);
  *(_QWORD *)(v10 + 192) = swift_task_alloc();
  v13 = sub_1BEDE9038();
  *(_QWORD *)(v10 + 200) = v13;
  *(_QWORD *)(v10 + 208) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v10 + 216) = swift_task_alloc();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5783A0);
  *(_QWORD *)(v10 + 224) = v14;
  *(_QWORD *)(v10 + 232) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v10 + 240) = swift_task_alloc();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5783A8);
  *(_QWORD *)(v10 + 248) = v15;
  *(_QWORD *)(v10 + 256) = *(_QWORD *)(v15 - 8);
  *(_QWORD *)(v10 + 264) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1BEDC9348()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 240);
  v15 = *(_QWORD *)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 224);
  v13 = *(_QWORD *)(v0 + 208);
  v14 = *(_QWORD *)(v0 + 200);
  v4 = *(_DWORD *)(v0 + 336);
  sub_1BEDE99E0();
  *(_QWORD *)(v0 + 272) = sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
  v5 = (void *)sub_1BEDE9A58();
  sub_1BEDE9074();

  v6 = objc_allocWithZone((Class)IMMultiFrameImage);
  v7 = (void *)sub_1BEDE8F60();
  LODWORD(v8) = v4;
  *(_QWORD *)(v0 + 280) = objc_msgSend(v6, sel_initForWritingWithFileURL_scale_, v7, v8);

  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
  *(_QWORD *)(v0 + 288) = *MEMORY[0x1E0C9D820];
  *(_QWORD *)(v0 + 296) = v10;
  *(_QWORD *)(v0 + 16) = v9;
  *(_QWORD *)(v0 + 24) = v10;
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  sub_1BEDE902C();
  sub_1BEDD47C0(&qword_1EF5783B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02DF8], MEMORY[0x1E0D02DF0]);
  sub_1BEDE917C();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v14);
  sub_1BEDE99BC();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v1, v2);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 304) = v11;
  *v11 = v0;
  v11[1] = sub_1BEDC9568;
  return sub_1BEDE99C8();
}

uint64_t sub_1BEDC9568()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 328) = 0;
  else
    *(_QWORD *)(v2 + 312) = 0;
  return swift_task_switch();
}

uint64_t sub_1BEDC961C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, _QWORD, double, double);
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  float v28;
  char v29;
  uint64_t v30;
  float v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  unint64_t v42;
  unint64_t v43;
  BOOL v44;
  unint64_t v45;
  os_log_type_t v46;
  NSObject *v47;
  double v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(_QWORD, _QWORD, _QWORD, void *, double, double);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 176);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v4 = *(void **)(v0 + 280);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 256) + 8))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 248));
    *(_QWORD *)(v0 + 72) = 0;
    v5 = objc_msgSend(v4, sel_finalizeOptimizedBitmapWithError_, v0 + 72);
    v6 = *(void **)(v0 + 72);
    if ((v5 & 1) != 0)
    {
      v7 = v6;
      sub_1BEDE9158();
      v8 = sub_1BEDE914C();
      v9 = sub_1BEDE914C();
      v10 = v8 - v9;
      if (v8 >= v9)
      {
        v11 = *(void **)(v0 + 280);
        v12 = *(_QWORD *)(v0 + 160);
        v13 = *(_QWORD *)(v0 + 136);
        v14 = *(_QWORD *)(v0 + 144);
        v15 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, double, double))(v0 + 120);
        v16 = (double)v10 / 1000000000.0;
        sub_1BEDE99F8();
        v17 = (void *)sub_1BEDE9A58();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
        v18 = swift_allocObject();
        v19 = MEMORY[0x1E0DEB070];
        *(_OWORD *)(v18 + 16) = xmmword_1BEDEABE0;
        v20 = MEMORY[0x1E0DEB100];
        *(_QWORD *)(v18 + 56) = v19;
        *(_QWORD *)(v18 + 64) = v20;
        *(double *)(v18 + 32) = v16;
        sub_1BEDE9074();
        swift_bridgeObjectRelease();

        v21 = *(double *)(v0 + 16);
        v22 = *(double *)(v0 + 24);
        v23 = *(_QWORD *)(v0 + 32);
        v24 = *(_QWORD *)(v0 + 40);
        swift_bridgeObjectRetain();
        v15(1, v23, v24, 0, v21, v22);

        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
        swift_bridgeObjectRelease();
LABEL_13:
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        return (*(uint64_t (**)(void))(v0 + 8))();
      }
      goto LABEL_15;
    }
    v41 = v6;
    v34 = (void *)sub_1BEDE8F48();

    swift_willThrow();
LABEL_8:
    swift_bridgeObjectRelease();
    sub_1BEDE9158();
    v42 = sub_1BEDE914C();
    v43 = sub_1BEDE914C();
    v44 = v42 >= v43;
    v45 = v42 - v43;
    if (v44)
    {
      v46 = sub_1BEDE99EC();
      v47 = sub_1BEDE9A58();
      if (os_log_type_enabled(v47, v46))
      {
        v48 = (double)v45 / 1000000000.0;
        MEMORY[0x1C3B85B68](v34);
        MEMORY[0x1C3B85B68](v34);
        v49 = swift_slowAlloc();
        v50 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v49 = 138412546;
        MEMORY[0x1C3B85B68](v34);
        v51 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v0 + 56) = v51;
        sub_1BEDE9A88();
        *v50 = v51;

        *(_WORD *)(v49 + 12) = 2048;
        *(double *)(v0 + 64) = v48;
        sub_1BEDE9A88();
        _os_log_impl(&dword_1BEDB7000, v47, v46, "Multi-frame image error: %@ (%f ", (uint8_t *)v49, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5783B8);
        swift_arrayDestroy();
        MEMORY[0x1C3B85C64](v50, -1, -1);
        MEMORY[0x1C3B85C64](v49, -1, -1);
      }
      v53 = *(double *)(v0 + 288);
      v52 = *(double *)(v0 + 296);
      v54 = *(void **)(v0 + 280);
      v56 = *(_QWORD *)(v0 + 144);
      v55 = *(_QWORD *)(v0 + 152);
      v57 = *(_QWORD *)(v0 + 136);
      v58 = *(void (**)(_QWORD, _QWORD, _QWORD, void *, double, double))(v0 + 120);

      objc_msgSend(v54, sel_deleteStream);
      MEMORY[0x1C3B85B68](v34);
      v58(0, 0, 0, v34, v53, v52);

      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
      goto LABEL_13;
    }
    __break(1u);
LABEL_15:
    __break(1u);
  }
  v25 = *(void **)(v0 + 312);
  v26 = *(void **)(v0 + 280);
  v27 = *(_QWORD *)(v0 + 184);
  v28 = *(float *)(v0 + 340);
  v29 = *(_BYTE *)(v0 + 344);
  v30 = *(_QWORD *)(v0 + 88);
  v31 = *(float *)(v0 + 336);
  v32 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v27, v1, v2);
  v33 = (void *)MEMORY[0x1C3B85784](v32);
  sub_1BEDC9F30(v28, v31, v27, v30, v29, v26, (double *)(v0 + 16), (uint64_t *)(v0 + 32));
  if (v25)
  {
    v34 = v25;
    v36 = *(_QWORD *)(v0 + 256);
    v35 = *(_QWORD *)(v0 + 264);
    v37 = *(_QWORD *)(v0 + 248);
    v39 = *(_QWORD *)(v0 + 176);
    v38 = *(_QWORD *)(v0 + 184);
    v40 = *(_QWORD *)(v0 + 168);
    objc_autoreleasePoolPop(v33);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
    goto LABEL_8;
  }
  v61 = *(_QWORD *)(v0 + 176);
  v60 = *(_QWORD *)(v0 + 184);
  v62 = *(_QWORD *)(v0 + 168);
  objc_autoreleasePoolPop(v33);
  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v60, v62);
  v63 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 320) = v63;
  *v63 = v0;
  v63[1] = sub_1BEDC9BBC;
  return sub_1BEDE99C8();
}

uint64_t sub_1BEDC9BBC()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
    v2[41] = v2[5];
  else
    v2[39] = 0;
  return swift_task_switch();
}

uint64_t sub_1BEDC9C74()
{
  uint64_t v0;
  void *v1;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  os_log_type_t v6;
  NSObject *v7;
  double v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD, void *, double, double);

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 256) + 8))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 248));
  v1 = *(void **)(v0 + 48);
  swift_bridgeObjectRelease();
  sub_1BEDE9158();
  v2 = sub_1BEDE914C();
  v3 = sub_1BEDE914C();
  v4 = v2 >= v3;
  v5 = v2 - v3;
  if (!v4)
    __break(1u);
  v6 = sub_1BEDE99EC();
  v7 = sub_1BEDE9A58();
  if (os_log_type_enabled(v7, v6))
  {
    v8 = (double)v5 / 1000000000.0;
    MEMORY[0x1C3B85B68](v1);
    MEMORY[0x1C3B85B68](v1);
    v9 = swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412546;
    MEMORY[0x1C3B85B68](v1);
    v11 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 56) = v11;
    sub_1BEDE9A88();
    *v10 = v11;

    *(_WORD *)(v9 + 12) = 2048;
    *(double *)(v0 + 64) = v8;
    sub_1BEDE9A88();
    _os_log_impl(&dword_1BEDB7000, v7, v6, "Multi-frame image error: %@ (%f ", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5783B8);
    swift_arrayDestroy();
    MEMORY[0x1C3B85C64](v10, -1, -1);
    MEMORY[0x1C3B85C64](v9, -1, -1);
  }
  v13 = *(double *)(v0 + 288);
  v12 = *(double *)(v0 + 296);
  v14 = *(void **)(v0 + 280);
  v16 = *(_QWORD *)(v0 + 144);
  v15 = *(_QWORD *)(v0 + 152);
  v17 = *(_QWORD *)(v0 + 136);
  v18 = *(void (**)(_QWORD, _QWORD, _QWORD, void *, double, double))(v0 + 120);

  objc_msgSend(v14, sel_deleteStream);
  MEMORY[0x1C3B85B68](v1);
  v18(0, 0, 0, v1, v13, v12);

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1BEDC9F30(float a1, float a2, uint64_t a3, uint64_t a4, char a5, void *a6, double *a7, uint64_t *a8)
{
  uint64_t v8;
  void *v14;
  void *v15;
  void *v16;
  CGImage *v17;
  double Width;
  int64_t Height;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGImage *v30;
  double v31;
  char v32;
  double v33;
  double v34;
  id v35;
  double v36;
  int64_t v37;
  double v38;
  double v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v47[3];

  v47[2] = *(id *)MEMORY[0x1E0C80C00];
  v14 = (void *)sub_1BEDE956C();
  v15 = (void *)sub_1BEDE9728();

  v16 = (void *)sub_1BEDE9530();
  if (!v16)
  {
    v47[0] = 0;
    v47[1] = (id)0xE000000000000000;
    type metadata accessor for BlastDoorInstanceType(0);
    sub_1BEDE9B54();
    sub_1BEDE9854();
    sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    swift_allocError();
    sub_1BEDE9848();
    swift_willThrow();
    return;
  }
  if ((a5 & 1) != 0)
  {
    v17 = v16;
  }
  else
  {
    Width = (double)(uint64_t)CGImageGetWidth((CGImageRef)v16);
    Height = CGImageGetHeight((CGImageRef)v16);
    v20 = CGSizeMake(Width, (double)Height);
    v22 = v20 / v21;
    v23 = fmin(v22, 1.77777778);
    if (v22 < 0.75)
      v23 = 0.75;
    v24 = a1;
    v25 = a1 / v23;
    v26 = CGRound(v24);
    v27 = CGRound(v25);
    v28 = CGSizeMake(v26, v27);
    sub_1BEDE19EC(v28, v29);
    if (v8)
    {

      return;
    }
  }
  v30 = v17;
  v31 = COERCE_DOUBLE(sub_1BEDE9560());
  if ((v32 & 1) != 0)
    v31 = 0.1;
  v47[0] = 0;
  if (objc_msgSend(a6, sel_writeAsOptimizedBitmapWithImage_duration_error_, v30, v47, v31))
  {
    if (*a7 == *MEMORY[0x1E0C9D820])
    {
      v33 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v34 = a7[1];
      v35 = v47[0];
      if (v34 == v33)
      {
        v36 = (double)(uint64_t)CGImageGetWidth(v30);
        v37 = CGImageGetHeight(v30);
        v38 = CGSizeMake(v36, (double)v37);
        *a7 = CGSizeMake(v38 / a2, v39 / a2);
        *((_QWORD *)a7 + 1) = v40;
      }
    }
    else
    {
      v42 = v47[0];
    }
    v43 = sub_1BEDE9554();
    v45 = v44;

    *a8 = v43;
    a8[1] = v45;
    swift_bridgeObjectRelease();
  }
  else
  {
    v41 = v47[0];
    sub_1BEDE8F48();

    swift_willThrow();
  }
}

uint64_t sub_1BEDCA260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1BEDE99B0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1BEDE99A4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1BEDD4434(a1, &qword_1EF5782A8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1BEDE9998();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_1BEDCA500(char a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v12;
  uint64_t v13;
  id v14;

  if (!a5)
  {
    v12 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = (void *)sub_1BEDE989C();
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v13 = sub_1BEDE8F3C();
LABEL_6:
  v14 = (id)v13;
  (*(void (**)(uint64_t, _QWORD, void *, double, double))(a7 + 16))(a7, a1 & 1, v12, a2, a3);

}

uint64_t sub_1BEDCA5A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = a4;
  v15 = a3;
  v4 = sub_1BEDE97C4();
  MEMORY[0x1E0C80A78](v4);
  v16 = sub_1BEDE9770();
  v5 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BEDE95FC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEDE95F0();
  sub_1BEDE9608();
  sub_1BEDE8F90();
  sub_1BEDE9794();
  sub_1BEDE9764();
  v12 = swift_allocObject();
  v13 = v17;
  *(_QWORD *)(v12 + 16) = v15;
  *(_QWORD *)(v12 + 24) = v13;
  sub_1BEDD47C0(&qword_1EF5782C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02F30], MEMORY[0x1E0D02F28]);
  swift_retain();
  sub_1BEDE91A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1BEDCA7B4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, uint64_t a6, uint64_t a7, void (*a8)(char *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v21;

  v13 = sub_1BEDE8F9C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a5);
  sub_1BEDE8F78();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v17;
  v19 = a1;
  a8(v16, a4, a7, v18);

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_1BEDCA8B0(float a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
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
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = a6;
  v18 = a5;
  v7 = sub_1BEDE97C4();
  MEMORY[0x1E0C80A78](v7);
  v19 = sub_1BEDE9770();
  v8 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1BEDE9368();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((~LODWORD(a1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.2234e18)
  {
    sub_1BEDE935C();
    sub_1BEDE9380();
    sub_1BEDE8F90();
    sub_1BEDE9794();
    sub_1BEDE9764();
    v15 = swift_allocObject();
    v16 = v20;
    *(_QWORD *)(v15 + 16) = v18;
    *(_QWORD *)(v15 + 24) = v16;
    sub_1BEDD47C0(&qword_1ED702F90, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02B08], MEMORY[0x1E0D02B00]);
    swift_retain();
    sub_1BEDE91A0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
LABEL_7:
  __break(1u);
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1BEDCAC08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v6)(uint64_t);
  uint64_t v7;

  sub_1BEDE95CC();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02EC8];
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = a4;
  sub_1BEDD47C0(&qword_1EF5782C8, v6, MEMORY[0x1E0D02EC0]);
  swift_retain();
  sub_1BEDE91C4();
  return swift_release();
}

uint64_t sub_1BEDCAE0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t result;
  void *v15;
  void *v16;
  void *v17;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_self();
  v6 = (void *)sub_1BEDE9878();
  v18[0] = 0;
  v7 = objc_msgSend(v5, sel_dataWithPropertyList_format_options_error_, v6, 200, 0, v18);

  v8 = v18[0];
  if (v7)
  {
    v9 = sub_1BEDE8FF0();
    v11 = v10;

    sub_1BEDE96D4();
    v12 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D030A8];
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = a2;
    *(_QWORD *)(v13 + 24) = a3;
    sub_1BEDD47C0(&qword_1EF5782D0, v12, MEMORY[0x1E0D030A0]);
    swift_retain();
    sub_1BEDE91C4();
    swift_release();
    return sub_1BEDBB354(v9, v11);
  }
  else
  {
    v15 = v8;
    v16 = (void *)sub_1BEDE8F48();

    swift_willThrow();
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v17 = (void *)sub_1BEDE9A4C();
    sub_1BEDE9074();

    result = sub_1BEDE9B6C();
    __break(1u);
  }
  return result;
}

void sub_1BEDCB068(uint64_t a1, void (*a2)(uint64_t, uint64_t, void *), uint64_t a3)
{
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
  void **v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *);

  v19 = a3;
  v20 = a2;
  v4 = sub_1BEDE96B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BEDE96D4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578370);
  MEMORY[0x1E0C80A78](v12);
  v14 = (void **)((char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BEDD4744(a1, (uint64_t)v14, &qword_1EF578370);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = *v14;
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0D03078], v4);
    v16 = sub_1BEDE96A4();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    MEMORY[0x1C3B85B68](v15);
    v20(v16, 0, v15);

  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v9 + 32))(v11, v14, v8);
    sub_1BEDE96C8();
    v17 = sub_1BEDE96A4();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v18 = sub_1BEDE96BC();
    v20(v17, v18, 0);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_1BEDCB280(void *a1, int a2, int a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t))
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v10 = _Block_copy(aBlock);
  v11 = sub_1BEDE9884();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v10;
  v13 = a1;
  a7(v11, a6, v12);

  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_1BEDCB334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  id v9;

  if (!a2)
  {
    v7 = 0;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v7 = (void *)sub_1BEDE998C();
  if (!a3)
    goto LABEL_5;
LABEL_3:
  v8 = sub_1BEDE8F3C();
LABEL_6:
  v9 = (id)v8;
  (*(void (**)(uint64_t, uint64_t, void *))(a4 + 16))(a4, a1, v7);

}

uint64_t sub_1BEDCB3C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v6)(uint64_t);
  uint64_t v7;

  sub_1BEDE965C();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D03008];
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = a4;
  sub_1BEDD47C0(&qword_1EF5782D8, v6, MEMORY[0x1E0D03000]);
  swift_retain();
  sub_1BEDE91C4();
  return swift_release();
}

void sub_1BEDCB5C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_1BEDE8F3C();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_1BEDCB620()
{
  return sub_1BEDCB6D0();
}

uint64_t sub_1BEDCB678()
{
  return sub_1BEDCB6D0();
}

uint64_t sub_1BEDCB6D0()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v8;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_1BEDE9878();
  v9[0] = 0;
  v2 = objc_msgSend(v0, sel_dataWithPropertyList_format_options_error_, v1, 200, 0, v9);

  v3 = v9[0];
  if (v2)
  {
    v4 = sub_1BEDE8FF0();
    v6 = v5;

    sub_1BEDE95E4();
    sub_1BEDD47C0(&qword_1EF5782E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02F00], MEMORY[0x1E0D02EF8]);
    sub_1BEDE91D0();
    return sub_1BEDBB354(v4, v6);
  }
  else
  {
    v8 = v3;
    sub_1BEDE8F48();

    return swift_willThrow();
  }
}

uint64_t sub_1BEDCB850()
{
  sub_1BEDE94B8();
  sub_1BEDD47C0((unint64_t *)&qword_1EF5782E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02CE0], MEMORY[0x1E0D02CD8]);
  return sub_1BEDE91D0();
}

uint64_t sub_1BEDCB8DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v9;

  v2 = sub_1BEDE94B8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(v0 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
  sub_1BEDD47C0((unint64_t *)&qword_1EF5782E8, v7, MEMORY[0x1E0D02CD8]);
  sub_1BEDE91D0();
  if (!v1)
  {
    v6 = sub_1BEDE9488();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v6;
}

uint64_t sub_1BEDCBB3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  void *v15;
  void *v16;
  void *v17;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = sub_1BEDE9650();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void *)objc_opt_self();
  v7 = (void *)sub_1BEDE9878();
  v18[0] = 0;
  v8 = objc_msgSend(v6, sel_dataWithPropertyList_format_options_error_, v7, 200, 0, v18);

  v9 = v18[0];
  if (v8)
  {
    v10 = sub_1BEDE8FF0();
    v12 = v11;

    v13 = *(_QWORD *)(v0 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
    sub_1BEDD47C0(&qword_1EF5782F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02FE8], MEMORY[0x1E0D02FE0]);
    sub_1BEDE91D0();
    if (v1)
    {
      sub_1BEDBB354(v10, v12);
    }
    else
    {
      v13 = sub_1BEDE9638();
      sub_1BEDBB354(v10, v12);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    return v13;
  }
  else
  {
    v15 = v9;
    v16 = (void *)sub_1BEDE8F48();

    swift_willThrow();
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v17 = (void *)sub_1BEDE9A4C();
    sub_1BEDE9074();

    result = sub_1BEDE9B6C();
    __break(1u);
  }
  return result;
}

id sub_1BEDCBDD8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v7;
  id v8;
  void *v9;

  v7 = sub_1BEDE9884();
  v8 = a1;
  v9 = (void *)a5(v7);
  swift_bridgeObjectRelease();

  return v9;
}

uint64_t sub_1BEDCBEA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t result;
  uint64_t v7;

  v1 = sub_1BEDE9290();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEDD47C0(&qword_1EF5782F8, v5, MEMORY[0x1E0D02990]);
  result = sub_1BEDE91DC();
  if (!v0)
  {
    sub_1BEDE9284();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return result;
}

uint64_t sub_1BEDCBF94(uint64_t a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;

  v41 = a1;
  v38 = sub_1BEDE9290();
  v33 = *(_QWORD *)(v38 - 8);
  MEMORY[0x1E0C80A78](v38);
  v40 = (char *)&v31 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_1BEDE9770();
  v3 = *(_QWORD *)(v2 - 8);
  v34 = v2;
  v35 = v3;
  MEMORY[0x1E0C80A78](v2);
  v36 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1BEDE9128();
  v31 = *(_QWORD *)(v5 - 8);
  v32 = v5;
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BEDE8F9C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FC0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1BEDE97C4();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v31 - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v41, v8);
  sub_1BEDE97AC();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_1BEDD4434((uint64_t)v14, &qword_1ED702FC0);
    sub_1BEDD47C0(&qword_1EF578280, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v22 = sub_1BEDE9CC8();
    sub_1BEDE9854();
    sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    swift_allocError();
    sub_1BEDE9848();
    swift_willThrow();
  }
  else
  {
    v23 = v35;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v14, v15);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
    v24 = v36;
    sub_1BEDE9764();
    v22 = *(_QWORD *)(v37 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
    sub_1BEDD47C0(&qword_1EF5782F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02998], MEMORY[0x1E0D02990]);
    v25 = v39;
    v26 = v38;
    sub_1BEDE91DC();
    if (v25)
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v34);
      (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
    }
    else
    {
      v41 = v16;
      v27 = v7;
      sub_1BEDE9284();
      v29 = v21;
      (*(void (**)(char *, uint64_t))(v33 + 8))(v40, v26);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v34);
      sub_1BEDE8EB8();
      swift_allocObject();
      sub_1BEDE8EAC();
      sub_1BEDD47C0(&qword_1EF578300, (uint64_t (*)(uint64_t))MEMORY[0x1E0D44008], MEMORY[0x1E0D44010]);
      v30 = v32;
      v22 = sub_1BEDE8EA0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v27, v30);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v29, v15);
    }
  }
  return v22;
}

uint64_t sub_1BEDCC57C(uint64_t a1, uint64_t a2)
{
  return sub_1BEDCC608(a1, a2, MEMORY[0x1E0D030D0], &qword_1EF578308, MEMORY[0x1E0D030C8], MEMORY[0x1E0D030B8]);
}

uint64_t sub_1BEDCC5D4(uint64_t a1, uint64_t a2)
{
  return sub_1BEDCC608(a1, a2, MEMORY[0x1E0D03058], &qword_1EF578310, MEMORY[0x1E0D03050], MEMORY[0x1E0D03048]);
}

uint64_t sub_1BEDCC608(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5, uint64_t (*a6)(uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;

  v18 = a6;
  v10 = a3(0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v17 - v12;
  sub_1BEDD47C0(a4, a3, a5);
  v14 = v19;
  v15 = sub_1BEDE91D0();
  if (!v14)
  {
    a1 = v18(v15);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  return a1;
}

id sub_1BEDCC72C(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t (*a5)(uint64_t), unint64_t *a6, uint64_t a7, uint64_t (*a8)(uint64_t))
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  uint64_t v26;

  v25 = a8;
  v26 = a4;
  v13 = a5(0);
  v24 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v24 - v14;
  v16 = a3;
  v17 = a1;
  v18 = sub_1BEDE8FF0();
  v20 = v19;

  sub_1BEDD47C0(a6, a5, a7);
  v21 = sub_1BEDE91D0();
  v22 = (void *)v25(v21);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v15, v13);

  sub_1BEDBB354(v18, v20);
  return v22;
}

uint64_t sub_1BEDCC8A8(uint64_t a1, uint64_t a2)
{
  return sub_1BEDCC608(a1, a2, MEMORY[0x1E0D030F0], &qword_1EF578318, MEMORY[0x1E0D030E8], MEMORY[0x1E0D030E0]);
}

id MessagesBlastDoorInterface.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MessagesBlastDoorInterface.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MessagesBlastDoorInterface.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagesBlastDoorInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BEDCC9E0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1BEDCCA44;
  return v6(a1);
}

uint64_t sub_1BEDCCA44()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1BEDCCA90(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1BEDCCB60(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1BEDCD69C((uint64_t)v12, *a3);
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
      sub_1BEDCD69C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1BEDCCB60(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1BEDE9A94();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1BEDCCD18(a5, a6);
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
  v8 = sub_1BEDE9B0C();
  if (!v8)
  {
    sub_1BEDE9B60();
    __break(1u);
LABEL_17:
    result = sub_1BEDE9B9C();
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

uint64_t sub_1BEDCCD18(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1BEDCCDAC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1BEDCCF84(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1BEDCCF84(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1BEDCCDAC(uint64_t a1, unint64_t a2)
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
      v3 = sub_1BEDCCF20(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1BEDE9ADC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1BEDE9B60();
      __break(1u);
LABEL_10:
      v2 = sub_1BEDE9944();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1BEDE9B9C();
    __break(1u);
LABEL_14:
    result = sub_1BEDE9B60();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1BEDCCF20(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5783D8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1BEDCCF84(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5783D8);
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
  result = sub_1BEDE9B9C();
  __break(1u);
  return result;
}

unint64_t sub_1BEDCD0D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BEDE9D58();
  sub_1BEDE98FC();
  v4 = sub_1BEDE9D7C();
  return sub_1BEDCD164(a1, a2, v4);
}

unint64_t sub_1BEDCD134(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1BEDE9D4C();
  return sub_1BEDCD244(a1, v2);
}

unint64_t sub_1BEDCD164(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1BEDE9CD4() & 1) == 0)
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
      while (!v14 && (sub_1BEDE9CD4() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1BEDCD244(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

id sub_1BEDCD2E0(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  objc_class *v11;
  _QWORD v13[2];
  uint64_t v14;
  objc_super v15;
  uint64_t v16;

  v14 = sub_1BEDE9A10();
  v3 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEDE9A04();
  MEMORY[0x1E0C80A78]();
  sub_1BEDE9140();
  MEMORY[0x1E0C80A78]();
  *(_QWORD *)&v1[OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_type] = a1;
  v6 = (void *)objc_opt_self();
  v7 = v1;
  v8 = a1;
  v9 = objc_msgSend(v6, sel_standardUserDefaults);
  NSUserDefaults.isMessagesLockdownModeEnabled.getter();

  v13[1] = sub_1BEDE91E8();
  sub_1BEDD4788(0, &qword_1ED702FD0);
  v10 = v8;
  sub_1BEDE9134();
  v16 = MEMORY[0x1E0DEE9D8];
  sub_1BEDD47C0(&qword_1ED702FD8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810], MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FE0);
  sub_1BEDD4800();
  sub_1BEDE9AB8();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DEF8D0], v14);
  sub_1BEDE9A1C();
  *(_QWORD *)&v7[OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd] = sub_1BEDE9170();

  v11 = (objc_class *)type metadata accessor for MessagesBlastDoorInterface();
  v15.receiver = v7;
  v15.super_class = v11;
  return objc_msgSendSuper2(&v15, sel_init);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3B85BC8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1BEDCD658()
{
  unint64_t result;

  result = qword_1ED702F98;
  if (!qword_1ED702F98)
  {
    result = MEMORY[0x1C3B85BE0](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED702F98);
  }
  return result;
}

uint64_t sub_1BEDCD69C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1BEDCD6D8()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1BEDCD700(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D03168], &qword_1EF578458);
}

void sub_1BEDCD730(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02F90], &qword_1EF578450);
}

void sub_1BEDCD760(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D03128], &qword_1EF578448);
}

void sub_1BEDCD790(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02E88], &qword_1EF578440);
}

void sub_1BEDCD7C0(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02DA8], &qword_1EF578438);
}

void sub_1BEDCD7F0(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02A50], &qword_1EF577CE0);
}

void sub_1BEDCD820(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02E18], &qword_1EF578430);
}

void sub_1BEDCD850(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02F70], &qword_1EF578428);
}

void sub_1BEDCD880(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02FB0], &qword_1EF578420);
}

void sub_1BEDCD8B0(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02D88], &qword_1EF578418);
}

void sub_1BEDCD8E0(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02BE0], &qword_1EF578410);
}

void sub_1BEDCD910(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02A30], &qword_1EF577CF0);
}

void sub_1BEDCD940(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02D20], &qword_1EF578408);
}

void sub_1BEDCD970(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02C78], &qword_1EF577CD8);
}

void sub_1BEDCD9A0(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02A70], &qword_1EF578400);
}

void sub_1BEDCD9D0(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02D00], &qword_1EF5783F8);
}

uint64_t sub_1BEDCDA00()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BEDCDA24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(101, a1, a2);
}

uint64_t sub_1BEDCDA50()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1BEDCDA70(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02978], &qword_1EF577D00);
}

void sub_1BEDCDAA0(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBFE48(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D03038], &qword_1EF5783F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03028]);
}

void sub_1BEDCDAD0(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02C20], &qword_1EF5783E8);
}

void sub_1BEDCDB00(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02EE8], &qword_1EF5783E0);
}

uint64_t sub_1BEDCDB30(uint64_t a1, uint64_t a2, void (**a3)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unsigned __int8 v16;
  unint64_t v17;
  char v18;
  __int16 v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t);
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t);
  uint64_t v76;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _BYTE v96[24];
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v5 = sub_1BEDE9854();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = &v96[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  v10 = *(_QWORD *)(a1 + 16);
  _Block_copy(a3);
  if (!v10
    || (v11 = sub_1BEDCD0D0(0xD00000000000001DLL, 0x80000001BEDECAE0), (v12 & 1) == 0)
    || (sub_1BEDCD69C(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)&v98),
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702F30),
        !swift_dynamicCast()))
  {
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v78 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v79 = swift_allocObject();
    *(_OWORD *)(v79 + 16) = xmmword_1BEDEABE0;
    *(_QWORD *)&v98 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702F30);
    v80 = sub_1BEDE9710();
    v82 = v81;
    *(_QWORD *)(v79 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v79 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v79 + 32) = v80;
    *(_QWORD *)(v79 + 40) = v82;
    sub_1BEDE9074();
    swift_release();

    swift_bridgeObjectRelease();
    _Block_release(a3);
LABEL_41:
    sub_1BEDE9B6C();
    __break(1u);
    JUMPOUT(0x1BEDCECF0);
  }
  v13 = v97;
  if (*(_QWORD *)(v97 + 16))
  {
    v14 = sub_1BEDCD0D0(17263, 0xE200000000000000);
    if ((v15 & 1) != 0)
    {
      sub_1BEDCD69C(*(_QWORD *)(v13 + 56) + 32 * v14, (uint64_t)&v98);
      if (swift_dynamicCast())
      {
        v16 = v96[15];
        swift_bridgeObjectRelease();
        goto LABEL_15;
      }
    }
  }
  if (*(_QWORD *)(v13 + 16) && (v17 = sub_1BEDCD0D0(99, 0xE100000000000000), (v18 & 1) != 0))
  {
    sub_1BEDCD69C(*(_QWORD *)(v13 + 56) + 32 * v17, (uint64_t)&v98);
  }
  else
  {
    v98 = 0u;
    v99 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v99 + 1))
  {
    sub_1BEDD4434((uint64_t)&v98, &qword_1ED702FF0);
    goto LABEL_40;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_40:
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v91 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v92 = swift_allocObject();
    *(_OWORD *)(v92 + 16) = xmmword_1BEDEABE0;
    *(_QWORD *)&v98 = a1;
    v93 = sub_1BEDE9710();
    v95 = v94;
    *(_QWORD *)(v92 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v92 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v92 + 32) = v93;
    *(_QWORD *)(v92 + 40) = v95;
    sub_1BEDE9074();
    swift_release();

    swift_bridgeObjectRelease();
    _Block_release(a3);
    goto LABEL_41;
  }
  v16 = v97;
LABEL_15:
  v19 = sub_1BEDE02E0(v16);
  if ((v19 & 0x100) != 0)
  {
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v83 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v84 = swift_allocObject();
    *(_OWORD *)(v84 + 16) = xmmword_1BEDEABE0;
    LOWORD(v98) = v16;
    v85 = sub_1BEDE9710();
    v87 = v86;
    *(_QWORD *)(v84 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v84 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v84 + 32) = v85;
    *(_QWORD *)(v84 + 40) = v87;
    sub_1BEDE9074();
    swift_release();

    swift_bridgeObjectRelease();
    _Block_release(a3);
    goto LABEL_41;
  }
  v20 = v19;
  v21 = (void *)objc_opt_self();
  v22 = (void *)sub_1BEDE9878();
  *(_QWORD *)&v98 = 0;
  v23 = objc_msgSend(v21, sel_dataWithPropertyList_format_options_error_, v22, 200, 0, &v98);

  v24 = (id)v98;
  if (!v23)
  {
    v88 = v24;
    v89 = (void *)sub_1BEDE8F48();

    swift_willThrow();
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v90 = (void *)sub_1BEDE9A4C();
    sub_1BEDE9074();
    swift_release();

    _Block_release(a3);
    goto LABEL_41;
  }
  v25 = sub_1BEDE8FF0();
  v27 = v26;

  v28 = v20;
  switch(v20)
  {
    case 0x64u:
      v29 = swift_allocObject();
      *(_QWORD *)(v29 + 16) = sub_1BEDD4B20;
      *(_QWORD *)(v29 + 24) = v9;
      *(_BYTE *)(v29 + 32) = 100;
      sub_1BEDE92FC();
      v30 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02A50];
      v31 = swift_allocObject();
      *(_QWORD *)(v31 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v31 + 24) = v29;
      sub_1BEDD47C0(&qword_1EF577CD0, v30, MEMORY[0x1E0D02A40]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x65u:
      v53 = swift_allocObject();
      *(_QWORD *)(v53 + 16) = sub_1BEDD4B20;
      *(_QWORD *)(v53 + 24) = v9;
      *(_BYTE *)(v53 + 32) = 101;
      sub_1BEDE9464();
      v54 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02C78];
      v55 = swift_allocObject();
      *(_QWORD *)(v55 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v55 + 24) = v53;
      sub_1BEDD47C0(&qword_1ED702F38, v54, MEMORY[0x1E0D02C70]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x66u:
      v38 = swift_allocObject();
      *(_QWORD *)(v38 + 16) = sub_1BEDD4B20;
      *(_QWORD *)(v38 + 24) = v9;
      *(_BYTE *)(v38 + 32) = 102;
      sub_1BEDE92F0();
      v39 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02A30];
      v40 = swift_allocObject();
      *(_QWORD *)(v40 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v40 + 24) = v38;
      sub_1BEDD47C0(&qword_1EF577CE8, v39, MEMORY[0x1E0D02A28]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x69u:
      v62 = swift_allocObject();
      *(_QWORD *)(v62 + 16) = sub_1BEDD4B20;
      *(_QWORD *)(v62 + 24) = v9;
      *(_BYTE *)(v62 + 32) = 105;
      sub_1BEDE9428();
      v63 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02BE0];
      v64 = swift_allocObject();
      *(_QWORD *)(v64 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v64 + 24) = v62;
      sub_1BEDD47C0(&qword_1EF578250, v63, MEMORY[0x1E0D02BD8]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x6Fu:
      v65 = swift_allocObject();
      *(_QWORD *)(v65 + 16) = sub_1BEDD4B20;
      *(_QWORD *)(v65 + 24) = v9;
      *(_BYTE *)(v65 + 32) = 111;
      sub_1BEDE9518();
      v66 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02D88];
      v67 = swift_allocObject();
      *(_QWORD *)(v67 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v67 + 24) = v65;
      sub_1BEDD47C0(&qword_1EF578248, v66, MEMORY[0x1E0D02D80]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x70u:
      v41 = swift_allocObject();
      *(_QWORD *)(v41 + 16) = sub_1BEDD4B20;
      *(_QWORD *)(v41 + 24) = v9;
      *(_BYTE *)(v41 + 32) = 112;
      sub_1BEDE962C();
      v42 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02FB0];
      v43 = swift_allocObject();
      *(_QWORD *)(v43 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v43 + 24) = v41;
      sub_1BEDD47C0(&qword_1EF578240, v42, MEMORY[0x1E0D02FA8]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x71u:
      v56 = swift_allocObject();
      *(_QWORD *)(v56 + 16) = sub_1BEDD4B20;
      *(_QWORD *)(v56 + 24) = v9;
      *(_BYTE *)(v56 + 32) = 113;
      sub_1BEDE9614();
      v57 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02F70];
      v58 = swift_allocObject();
      *(_QWORD *)(v58 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v58 + 24) = v56;
      sub_1BEDD47C0(&qword_1EF578238, v57, MEMORY[0x1E0D02F68]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x74u:
      v59 = swift_allocObject();
      *(_QWORD *)(v59 + 16) = sub_1BEDD4B20;
      *(_QWORD *)(v59 + 24) = v9;
      *(_BYTE *)(v59 + 32) = 116;
      sub_1BEDE9524();
      v60 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02DA8];
      v61 = swift_allocObject();
      *(_QWORD *)(v61 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v61 + 24) = v59;
      sub_1BEDD47C0(&qword_1EF578228, v60, MEMORY[0x1E0D02DA0]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x76u:
      v74 = swift_allocObject();
      *(_QWORD *)(v74 + 16) = sub_1BEDD4B20;
      *(_QWORD *)(v74 + 24) = v9;
      *(_BYTE *)(v74 + 32) = 118;
      sub_1BEDE9584();
      v75 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02E18];
      v76 = swift_allocObject();
      *(_QWORD *)(v76 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v76 + 24) = v74;
      sub_1BEDD47C0(&qword_1EF578230, v75, MEMORY[0x1E0D02E08]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x77u:
      v68 = swift_allocObject();
      *(_QWORD *)(v68 + 16) = sub_1BEDD4B20;
      *(_QWORD *)(v68 + 24) = v9;
      *(_BYTE *)(v68 + 32) = 119;
      sub_1BEDE95B4();
      v69 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02E88];
      v70 = swift_allocObject();
      *(_QWORD *)(v70 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v70 + 24) = v68;
      sub_1BEDD47C0(&qword_1EF578220, v69, MEMORY[0x1E0D02E80]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x78u:
      v35 = swift_allocObject();
      *(_QWORD *)(v35 + 16) = sub_1BEDD4B20;
      *(_QWORD *)(v35 + 24) = v9;
      *(_BYTE *)(v35 + 32) = 120;
      sub_1BEDE9308();
      v36 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02A70];
      v37 = swift_allocObject();
      *(_QWORD *)(v37 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v37 + 24) = v35;
      sub_1BEDD47C0(&qword_1EF578260, v36, MEMORY[0x1E0D02A60]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x86u:
      v50 = swift_allocObject();
      *(_QWORD *)(v50 + 16) = sub_1BEDD4B20;
      *(_QWORD *)(v50 + 24) = v9;
      *(_BYTE *)(v50 + 32) = -122;
      sub_1BEDE9620();
      v51 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02F90];
      v52 = swift_allocObject();
      *(_QWORD *)(v52 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v52 + 24) = v50;
      sub_1BEDD47C0(&qword_1EF578210, v51, MEMORY[0x1E0D02F80]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x87u:
      v44 = swift_allocObject();
      *(_QWORD *)(v44 + 16) = sub_1BEDD4B20;
      *(_QWORD *)(v44 + 24) = v9;
      *(_BYTE *)(v44 + 32) = -121;
      sub_1BEDE971C();
      v45 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D03168];
      v46 = swift_allocObject();
      *(_QWORD *)(v46 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v46 + 24) = v44;
      sub_1BEDD47C0(&qword_1EF578208, v45, MEMORY[0x1E0D03158]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x8Bu:
      v32 = swift_allocObject();
      *(_QWORD *)(v32 + 16) = sub_1BEDD4B20;
      *(_QWORD *)(v32 + 24) = v9;
      *(_BYTE *)(v32 + 32) = -117;
      sub_1BEDE96EC();
      v33 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D03128];
      v34 = swift_allocObject();
      *(_QWORD *)(v34 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v34 + 24) = v32;
      sub_1BEDD47C0(&qword_1EF578218, v33, MEMORY[0x1E0D03118]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0xAAu:
      v71 = swift_allocObject();
      *(_QWORD *)(v71 + 16) = sub_1BEDD4B20;
      *(_QWORD *)(v71 + 24) = v9;
      *(_BYTE *)(v71 + 32) = -86;
      sub_1BEDE94D0();
      v72 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02D20];
      v73 = swift_allocObject();
      *(_QWORD *)(v73 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v73 + 24) = v71;
      sub_1BEDD47C0(&qword_1EF578258, v72, MEMORY[0x1E0D02D18]);
      swift_retain();
      swift_retain();
LABEL_34:
      sub_1BEDE91C4();
      swift_release();
      sub_1BEDBB354(v25, v27);
      swift_release();
      break;
    default:
      *(_QWORD *)&v98 = 0;
      *((_QWORD *)&v98 + 1) = 0xE000000000000000;
      LOBYTE(v97) = v20;
      sub_1BEDE9B54();
      sub_1BEDE9848();
      sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
      v47 = (void *)swift_allocError();
      (*(void (**)(uint64_t, _BYTE *, uint64_t))(v6 + 16))(v48, v8, v5);
      v49 = (void *)sub_1BEDE8F3C();
      ((void (**)(_QWORD, uint64_t, _QWORD, void *))a3)[2](a3, v28, 0, v49);

      sub_1BEDBB354(v25, v27);
      (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
      break;
  }
  return swift_release();
}

uint64_t sub_1BEDCEE0C(uint64_t a1, uint64_t a2, void (**a3)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unsigned __int8 v16;
  unint64_t v17;
  char v18;
  __int16 v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  uint64_t v37;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE v60[24];
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = sub_1BEDE9854();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = &v60[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  v10 = *(_QWORD *)(a1 + 16);
  _Block_copy(a3);
  if (!v10
    || (v11 = sub_1BEDCD0D0(0xD00000000000001DLL, 0x80000001BEDECAE0), (v12 & 1) == 0)
    || (sub_1BEDCD69C(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)&v62),
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702F30),
        !swift_dynamicCast()))
  {
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v42 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_1BEDEABE0;
    *(_QWORD *)&v62 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702F30);
    v44 = sub_1BEDE9710();
    v46 = v45;
    *(_QWORD *)(v43 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v43 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v43 + 32) = v44;
    *(_QWORD *)(v43 + 40) = v46;
    sub_1BEDE9074();
    swift_release();

    swift_bridgeObjectRelease();
    _Block_release(a3);
LABEL_29:
    sub_1BEDE9B6C();
    __break(1u);
    JUMPOUT(0x1BEDCF7E0);
  }
  v13 = v61;
  if (*(_QWORD *)(v61 + 16))
  {
    v14 = sub_1BEDCD0D0(17263, 0xE200000000000000);
    if ((v15 & 1) != 0)
    {
      sub_1BEDCD69C(*(_QWORD *)(v13 + 56) + 32 * v14, (uint64_t)&v62);
      if (swift_dynamicCast())
      {
        v16 = v60[15];
        swift_bridgeObjectRelease();
        goto LABEL_15;
      }
    }
  }
  if (*(_QWORD *)(v13 + 16) && (v17 = sub_1BEDCD0D0(99, 0xE100000000000000), (v18 & 1) != 0))
  {
    sub_1BEDCD69C(*(_QWORD *)(v13 + 56) + 32 * v17, (uint64_t)&v62);
  }
  else
  {
    v62 = 0u;
    v63 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v63 + 1))
  {
    sub_1BEDD4434((uint64_t)&v62, &qword_1ED702FF0);
    goto LABEL_28;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_28:
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v55 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v56 = swift_allocObject();
    *(_OWORD *)(v56 + 16) = xmmword_1BEDEABE0;
    *(_QWORD *)&v62 = a1;
    v57 = sub_1BEDE9710();
    v59 = v58;
    *(_QWORD *)(v56 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v56 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v56 + 32) = v57;
    *(_QWORD *)(v56 + 40) = v59;
    sub_1BEDE9074();
    swift_release();

    swift_bridgeObjectRelease();
    _Block_release(a3);
    goto LABEL_29;
  }
  v16 = v61;
LABEL_15:
  v19 = sub_1BEDE02E0(v16);
  if ((v19 & 0x100) != 0)
  {
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v47 = (void *)sub_1BEDE9A4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = xmmword_1BEDEABE0;
    LOWORD(v62) = v16;
    v49 = sub_1BEDE9710();
    v51 = v50;
    *(_QWORD *)(v48 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v48 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v48 + 32) = v49;
    *(_QWORD *)(v48 + 40) = v51;
    sub_1BEDE9074();
    swift_release();

    swift_bridgeObjectRelease();
    _Block_release(a3);
    goto LABEL_29;
  }
  v20 = v19;
  v21 = (void *)objc_opt_self();
  v22 = (void *)sub_1BEDE9878();
  *(_QWORD *)&v62 = 0;
  v23 = objc_msgSend(v21, sel_dataWithPropertyList_format_options_error_, v22, 200, 0, &v62);

  v24 = (id)v62;
  if (!v23)
  {
    v52 = v24;
    v53 = (void *)sub_1BEDE8F48();

    swift_willThrow();
    sub_1BEDE99EC();
    sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
    v54 = (void *)sub_1BEDE9A4C();
    sub_1BEDE9074();
    swift_release();

    _Block_release(a3);
    goto LABEL_29;
  }
  v25 = sub_1BEDE8FF0();
  v27 = v26;

  v28 = v20;
  switch(v20)
  {
    case 'd':
      v32 = swift_allocObject();
      *(_QWORD *)(v32 + 16) = sub_1BEDD43FC;
      *(_QWORD *)(v32 + 24) = v9;
      *(_BYTE *)(v32 + 32) = 100;
      sub_1BEDE94C4();
      v33 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02D00];
      v34 = swift_allocObject();
      *(_QWORD *)(v34 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v34 + 24) = v32;
      sub_1BEDD47C0(&qword_1EF578200, v33, MEMORY[0x1E0D02CF0]);
      swift_retain();
      swift_retain();
      goto LABEL_21;
    case 'e':
    case 'p':
      v29 = swift_allocObject();
      *(_QWORD *)(v29 + 16) = sub_1BEDD43FC;
      *(_QWORD *)(v29 + 24) = v9;
      sub_1BEDE9464();
      v30 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02C78];
      v31 = swift_allocObject();
      *(_QWORD *)(v31 + 16) = sub_1BEDD4898;
      *(_QWORD *)(v31 + 24) = v29;
      sub_1BEDD47C0(&qword_1ED702F38, v30, MEMORY[0x1E0D02C70]);
      swift_retain();
      swift_retain();
      goto LABEL_21;
    case 'f':
      v35 = swift_allocObject();
      *(_QWORD *)(v35 + 16) = sub_1BEDD43FC;
      *(_QWORD *)(v35 + 24) = v9;
      *(_BYTE *)(v35 + 32) = 102;
      sub_1BEDE92F0();
      v36 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02A30];
      v37 = swift_allocObject();
      *(_QWORD *)(v37 + 16) = sub_1BEDCD6FC;
      *(_QWORD *)(v37 + 24) = v35;
      sub_1BEDD47C0(&qword_1EF577CE8, v36, MEMORY[0x1E0D02A28]);
      swift_retain();
      swift_retain();
LABEL_21:
      sub_1BEDE91C4();
      swift_release();
      sub_1BEDBB354(v25, v27);
      swift_release();
      break;
    default:
      *(_QWORD *)&v62 = 0;
      *((_QWORD *)&v62 + 1) = 0xE000000000000000;
      LOBYTE(v61) = v20;
      sub_1BEDE9B54();
      sub_1BEDE9848();
      sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
      v39 = (void *)swift_allocError();
      (*(void (**)(uint64_t, _BYTE *, uint64_t))(v6 + 16))(v40, v8, v5);
      v41 = (void *)sub_1BEDE8F3C();
      ((void (**)(_QWORD, uint64_t, _QWORD, void *))a3)[2](a3, v28, 0, v41);

      sub_1BEDBB354(v25, v27);
      (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
      break;
  }
  return swift_release();
}

uint64_t sub_1BEDCF814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const void *a6)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v25 = a5;
  v22[1] = a1;
  v22[2] = a2;
  v9 = sub_1BEDE9674();
  v23 = *(_QWORD *)(v9 - 8);
  v24 = v9;
  MEMORY[0x1E0C80A78]();
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = a6;
  _Block_copy(a6);
  sub_1BEDE99E0();
  sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
  v12 = (void *)sub_1BEDE9A4C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1BEDEABE0;
  v27 = a3;
  v28 = a4;
  v14 = MEMORY[0x1E0DEA968];
  v15 = sub_1BEDE9710();
  v17 = v16;
  *(_QWORD *)(v13 + 56) = v14;
  *(_QWORD *)(v13 + 64) = sub_1BEDCD658();
  *(_QWORD *)(v13 + 32) = v15;
  *(_QWORD *)(v13 + 40) = v17;
  sub_1BEDE9074();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1BEDE9668();
  sub_1BEDE968C();
  v18 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D03038];
  v19 = swift_allocObject();
  v20 = v26;
  *(_QWORD *)(v19 + 16) = sub_1BEDD4890;
  *(_QWORD *)(v19 + 24) = v20;
  sub_1BEDD47C0(&qword_1EF578268, v18, MEMORY[0x1E0D03030]);
  swift_retain();
  sub_1BEDE9194();
  swift_release();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v24);
  return swift_release();
}

uint64_t sub_1BEDCFA94(uint64_t a1, uint64_t a2, char a3, uint64_t a4, void (**a5)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  void *v19;
  uint64_t v20;
  void *v21;
  _BYTE v22[16];
  uint64_t v23;
  unint64_t v24;

  v7 = sub_1BEDE9854();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78]();
  v10 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a5;
  if (a3 == 1)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_1BEDD4890;
    *(_QWORD *)(v15 + 24) = v11;
    sub_1BEDE9434();
    v16 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02C20];
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = sub_1BEDD4894;
    *(_QWORD *)(v17 + 24) = v15;
    _Block_copy(a5);
    sub_1BEDD47C0(&qword_1EF578270, v16, MEMORY[0x1E0D02C10]);
    swift_retain();
    swift_retain();
    goto LABEL_5;
  }
  if (!a3)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = sub_1BEDD4890;
    *(_QWORD *)(v12 + 24) = v11;
    sub_1BEDE95D8();
    v13 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02EE8];
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = sub_1BEDD4894;
    *(_QWORD *)(v14 + 24) = v12;
    _Block_copy(a5);
    sub_1BEDD47C0(&qword_1EF578278, v13, MEMORY[0x1E0D02EE0]);
    swift_retain();
    swift_retain();
LABEL_5:
    sub_1BEDE91C4();
    swift_release();
    swift_release();
    return swift_release();
  }
  v23 = 0;
  v24 = 0xE000000000000000;
  v22[15] = a3;
  _Block_copy(a5);
  sub_1BEDE9B54();
  sub_1BEDE9848();
  sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
  v19 = (void *)swift_allocError();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v8 + 16))(v20, v10, v7);
  v21 = (void *)sub_1BEDE8F3C();
  ((void (**)(_QWORD, _QWORD, void *))a5)[2](a5, 0, v21);

  (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

uint64_t sub_1BEDCFE04(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v5;
  BOOL v6;
  BOOL v7;
  char v8;
  BOOL v9;
  BOOL v10;
  char v11;
  BOOL v12;
  BOOL v13;

  v2 = a1 == 0x736567617373656DLL && a2 == 0xEE0063697274654DLL;
  if (v2 || (sub_1BEDE9CD4() & 1) != 0 || a1 == 0xD000000000000012 && a2 == 0x80000001BEDED7C0)
    return 1;
  if ((sub_1BEDE9CD4() & 1) != 0 || a1 == 0x697665725070616DLL && a2 == 0xEB00000000737765)
    return 1;
  if ((sub_1BEDE9CD4() & 1) != 0 || a1 == 0x6572506567616D69 && a2 == 0xED00007377656976)
    return 1;
  if ((sub_1BEDE9CD4() & 1) != 0 || a1 == 0xD000000000000011 && a2 == 0x80000001BEDED7E0)
    return 1;
  if ((sub_1BEDE9CD4() & 1) != 0 || a1 == 0xD000000000000021 && a2 == 0x80000001BEDED800)
    return 1;
  if ((sub_1BEDE9CD4() & 1) != 0 || a1 == 0x736472616376 && a2 == 0xE600000000000000)
    return 1;
  v5 = sub_1BEDE9CD4();
  v6 = a1 == 0x6572506F65646976 && a2 == 0xED00007377656976;
  v7 = v6;
  if ((v5 & 1) != 0 || v7)
    return 1;
  v8 = sub_1BEDE9CD4();
  v9 = a1 == 0x6572506F69647561 && a2 == 0xED00007377656976;
  v10 = v9;
  if ((v8 & 1) != 0 || v10)
    return 1;
  v11 = sub_1BEDE9CD4();
  v12 = a1 == 0xD000000000000012 && a2 == 0x80000001BEDED830;
  v13 = v12;
  if ((v11 & 1) != 0
    || v13
    || (sub_1BEDE9CD4() & 1) != 0
    || a1 == 0x656D616E6B63696ELL && a2 == 0xE900000000000073
    || (sub_1BEDE9CD4() & 1) != 0
    || a1 == 0x636174744163616DLL && a2 == 0xEE0073746E656D68)
  {
    return 1;
  }
  else
  {
    return sub_1BEDE9CD4();
  }
}

void sub_1BEDD0214(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBFE48(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02BC0], &qword_1EF577D18, MEMORY[0x1E0D02B80]);
}

void sub_1BEDD0244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1BEDC66C8(a1, a2, a3, *(void (**)(void *, void *))(v3 + 16));
}

void sub_1BEDD024C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  sub_1BEDC7084(a1, a2, a3, *(void (**)(void *, void *, _QWORD))(v3 + 16));
}

void sub_1BEDD0264(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBFE48(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02C58], &qword_1EF578360, MEMORY[0x1E0D02C40]);
}

void sub_1BEDD0294(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02AD0], qword_1ED702F48);
}

uint64_t sub_1BEDD02C4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1BEDBB398(a1, a2);
  return a1;
}

void sub_1BEDD02D8(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBFE48(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D03270], &qword_1EF5783C8, MEMORY[0x1E0D03250]);
}

void sub_1BEDD0308(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02E48], &qword_1EF5783C0);
}

void sub_1BEDD0338(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02B08], &qword_1ED702FB0);
}

uint64_t sub_1BEDD0368()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = sub_1BEDE8F9C();
  v1 = *(_QWORD *)(v17 - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (((*(_QWORD *)(v1 + 64) + ((v2 + 32) & ~v2) + 3) & 0xFFFFFFFFFFFFFFFCLL) + 11) & 0xFFFFFFFFFFFFFFF8;
  v14 = v3;
  v16 = sub_1BEDE9770();
  v4 = *(_QWORD *)(v16 - 8);
  v12 = (*(unsigned __int8 *)(v4 + 80) + v3 + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v5 = *(_QWORD *)(v4 + 64);
  v15 = sub_1BEDE9548();
  v6 = *(_QWORD *)(v15 - 8);
  v7 = (v5 + *(unsigned __int8 *)(v6 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (v7 + *(_QWORD *)(v6 + 64)) & 0xFFFFFFFFFFFFFFFCLL;
  v13 = sub_1BEDE9164();
  v9 = *(_QWORD *)(v13 - 8);
  v10 = (*(unsigned __int8 *)(v9 + 80) + v8 + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + ((v2 + 32) & ~v2), v17);

  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v12, v16);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v15);
  (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v0 + v10, v13);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BEDD04EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  _QWORD *v19;
  uint64_t v21;

  v3 = *(_QWORD *)(sub_1BEDE8F9C() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  v6 = (v5 + 11) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(sub_1BEDE9770() - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + v6 + 8) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(_QWORD *)(sub_1BEDE9548() - 8);
  v11 = (v9 + *(unsigned __int8 *)(v10 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = v11 + *(_QWORD *)(v10 + 64);
  sub_1BEDE9164();
  v13 = *(_QWORD *)(v1 + 16);
  v21 = *(_QWORD *)(v1 + 24);
  v14 = *(float *)(v1 + v5);
  v15 = *(_QWORD *)(v1 + v6);
  v16 = v1 + v8;
  v17 = v1 + v11;
  LOBYTE(v11) = *(_BYTE *)(v1 + v12);
  v18 = *(float *)((v12 & 0xFFFFFFFFFFFFFFFCLL) + v1 + 4);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v19;
  *v19 = v2;
  v19[1] = sub_1BEDD0668;
  return sub_1BEDC91C0(v14, v18, a1, v13, v21, v1 + v4, v15, v16, v17, v11);
}

uint64_t sub_1BEDD0668()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_1BEDD06B0(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02F30], &qword_1EF578380);
}

void sub_1BEDD06E0(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBFE48(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02EC8], &qword_1EF578378, MEMORY[0x1E0D02EB8]);
}

void sub_1BEDD0710(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDCB068(a1, *(void (**)(uint64_t, uint64_t, void *))(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_1BEDD0718(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBFE48(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D03008], &qword_1EF578368, MEMORY[0x1E0D02FF8]);
}

uint64_t type metadata accessor for MessagesBlastDoorInterface()
{
  return objc_opt_self();
}

uint64_t method lookup function for MessagesBlastDoorInterface()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.__allocating_init(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(topLevelDictionary:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(topLevelDictionary:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.decontaminate(topLevelDictionary:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(smsDictionary:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(smsDictionary:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(balloonPluginPayload:with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(balloonPluginPayload:with:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(data:for:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of static MessagesBlastDoorInterface.supports(feature:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generateMetadata(forAttachmentWith:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generatePreview(forAttachmentWith:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generatePreview(forAttachmentWith:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generateImagePreview(for:maxPixelDimension:scale:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generatePreview(forAttachmentWith:maxPixelDimension:scale:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generateMoviePreview(forAttachmentWith:maxPixelDimension:minThumbnailPxSize:scale:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generateMoviePreview(forAttachmentWith:maxPixelDimension:minThumbnailPxSize:scale:frameInterval:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generateMovieFrames(forAttachmentWith:targetPixelWidth:targetPixelHeight:frameLimit:uniformSampling:framesPerSync:appliesPreferredTrackTransform:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generateWorkoutPreview(forAttachmentWith:maxPixelDimension:scale:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generatePreview(forAudioMessageWith:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(nicknameDictionary:with:recordTag:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(nicknameDictionary:with:recordTag:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(nicknameDictionary:with:recordTag:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:processImageFields:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.getMetadata(forEmojiImageWith:maxStrikeCount:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generatePreview(forEmojiImageWith:frameIndex:maxPixelDimension:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generatePreviewForMultiFrameImage(withFileURL:destinationFileURL:maxPixelDimension:scale:maxFrameCount:isSticker:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.getMetadata(forAnimatedImageWith:maxCount:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generatePreview(forAnimatedImageWith:maxPixelDimension:index:maxCount:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(collaborationNoticePayload:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(actionDictionary:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseCollaborationClearNotice(payload:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseVideoMessageMetadata(dictionary:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseLiteTextMessage(payload:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseSatelliteSMSTextMessageDictionary(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseChatBotCSS(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A0))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseRelayGroupMutationPayload(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseRelayReachabilityRequestPayload(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseRelayReachabilityResponsePayload(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C0))();
}

uint64_t sub_1BEDD0CF8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1BEDD0D1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1BEDCB334(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

void sub_1BEDD0D24(char a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  uint64_t v6;

  sub_1BEDCA500(a1, a5, a6, a2, a3, a4, *(_QWORD *)(v6 + 16));
}

uint64_t sub_1BEDD0D2C(uint64_t a1, uint64_t a2, const void *a3)
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v24[1] = a2;
  v4 = sub_1BEDE9410();
  v27 = *(_QWORD *)(v4 - 8);
  v28 = v4;
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1BEDE9770();
  v25 = *(_QWORD *)(v7 - 8);
  v26 = v7;
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FC0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1BEDE97C4();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)v24 - v18;
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = a3;
  _Block_copy(a3);
  sub_1BEDE8F90();
  sub_1BEDE9794();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
  sub_1BEDE9764();
  sub_1BEDE9404();
  sub_1BEDE941C();
  v20 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D02BC0];
  v21 = swift_allocObject();
  v22 = v29;
  *(_QWORD *)(v21 + 16) = sub_1BEDD4890;
  *(_QWORD *)(v21 + 24) = v22;
  sub_1BEDD47C0(&qword_1EF577D08, v20, MEMORY[0x1E0D02BB8]);
  swift_retain();
  sub_1BEDE91A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v28);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v26);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
  return swift_release();
}

uint64_t sub_1BEDD1104(uint64_t a1, int a2, char *a3, void (**a4)(_QWORD, _QWORD, _QWORD), float a5, float a6)
{
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
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
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
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t result;
  uint64_t v119;
  char v120;
  uint64_t v121;
  unsigned int (*v122)(char *, uint64_t, void (*)(char *, uint64_t));
  void (*v123)(char *, uint64_t);
  void *v124;
  void *v125;
  void (*v126)(char *, char *, void (*)(char *, uint64_t));
  void *v127;
  uint64_t v128;
  NSString *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  id v138;
  char *v139;
  uint64_t v140;
  void (*v141)(char *, char *, uint64_t);
  char *v142;
  uint64_t v143;
  id v144;
  void *v145;
  unsigned __int8 v146;
  id v147;
  id v148;
  void *v149;
  void *v150;
  char *v151;
  uint64_t v152;
  void (*v153)(char *, uint64_t);
  void *v154;
  void *v155;
  char *v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  char *v161;
  char *v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  char *v168;
  char v169;
  void (*v170)(char *, char *, uint64_t);
  uint64_t v171;
  uint64_t v172;
  char *v173;
  uint64_t v174;
  void (*v175)(char *, uint64_t);
  void (*v176)(char *, uint64_t);
  uint64_t v177;
  void (*v178)(char *, _QWORD *);
  void (*v179)(char *, uint64_t);
  char *v180;
  void (*v181)(char *, char *, uint64_t);
  uint64_t v182;
  char *v183;
  char *v184;
  uint64_t v185;
  uint64_t v186;
  char *v187;
  char *v188;
  uint64_t v189;
  void (*v190)(char *, uint64_t);
  void (*v191)(char *, uint64_t);
  uint64_t v192;
  char v193;
  uint64_t v194;
  uint64_t v195;
  char *v196;
  char *v197;
  void *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  unint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  char *v210;
  char *v211;
  uint64_t v212;
  char *v213;
  char *v214;
  uint64_t v215;
  char v216;
  char *v217;
  uint8_t *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  unint64_t v223;
  char *v224;
  uint64_t v225;
  char *v226;
  char *v227;
  uint64_t v228;
  unint64_t v229;
  char *v230;
  os_signpost_id_t v231;
  char *v232;
  char *v233;
  void (**v234)(_QWORD, _QWORD, _QWORD);
  uint64_t v235;
  char *v236;
  char *v237;
  void (*v238)(char *, uint64_t);
  void *v239;
  uint64_t v240;
  void (*v241)(char *, char *, uint64_t);
  char *v242;
  uint64_t v243;
  char *v244;
  NSObject *v245;
  char *v246;
  char v247;
  char *v248;
  uint64_t v249;
  uint64_t v250;
  char v251;
  void (*v252)(char *, uint64_t);
  char *v253;
  uint64_t v254;
  char *v255;
  uint64_t v256;
  uint64_t v257;
  char *v258;
  uint64_t v259;
  char *v260;
  void *v261;
  void (*v262)(char *, uint64_t);
  char *v263;
  void *v264;
  os_signpost_id_t v265;
  void (*v266)(char *, uint64_t);
  char *v267;
  char *v268;
  unint64_t v269;
  char *v270;
  NSObject *v271;
  int v272;
  uint64_t v273;
  uint8_t *v274;
  void *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  unint64_t v279;
  uint64_t v280;
  char *v281;
  unint64_t v282;
  char *v283;
  os_signpost_id_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  unint64_t v290;
  unint64_t v291;
  unint64_t v292;
  unint64_t v293;
  uint64_t v294;
  _QWORD *v295;
  uint64_t v296;
  _QWORD *v297;
  uint64_t v298;
  char *v299;
  char *v300;
  uint64_t v301;
  void (*v302)(char *, uint64_t);
  uint64_t v303;
  char *v304;
  uint64_t v305;
  uint64_t v306;
  char *v307;
  char *v308;
  uint64_t v309;
  uint64_t v310;
  char *v311;
  char *v312;
  char *v313;
  uint64_t v314;
  char *v315;
  char *v316;
  char *v317;
  char *v318;
  char *v319;
  uint64_t v320;
  uint64_t v321;
  char *v322;
  char *v323;
  uint64_t v324;
  uint64_t v325;
  char *v326;
  uint64_t v327;
  uint64_t v328;
  char *v329;
  uint64_t v330;
  char *v331;
  char *v332;
  char *v333;
  uint64_t v334;
  uint64_t v335;
  char *v336;
  char *v337;
  uint64_t v338;
  uint64_t v339;
  char *v340;
  char *v341;
  uint64_t v342;
  uint64_t v343;
  char *v344;
  char *v345;
  char *v346;
  char *v347;
  int v348;
  uint64_t v349;
  char *v350;
  uint64_t v351;
  uint64_t v352;
  char *v353;
  char *v354;
  char *v355;
  char *v356;
  uint64_t v357;
  uint64_t v358;
  char *v359;
  char *v360;
  char *v361;
  char *v362;
  uint64_t v363;
  uint64_t v364;
  char *v365;
  char *v366;
  char *v367;
  char *v368;
  char *v369;
  char *v370;
  char *v371;
  char *v372;
  const char *v373;
  uint64_t v374;
  void (*v375)(char *, uint64_t);
  char *v376;
  char *v377;
  void (**v378)(_QWORD, _QWORD, _QWORD);
  void (*v379)(char *, uint64_t);
  uint64_t v380;
  uint64_t v381;
  char *v382;
  uint64_t v383;
  void (*v384)(char *, uint64_t);
  void (*v385)(char *, char *, uint64_t);
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  id v391[2];

  v385 = (void (*)(char *, char *, uint64_t))a3;
  v348 = a2;
  v391[1] = *(id *)MEMORY[0x1E0C80C00];
  v306 = sub_1BEDE90C8();
  v305 = *(_QWORD *)(v306 - 8);
  MEMORY[0x1E0C80A78](v306);
  v304 = (char *)&v303 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v325 = sub_1BEDE9254();
  v321 = *(_QWORD *)(v325 - 8);
  v11 = MEMORY[0x1E0C80A78](v325);
  v311 = (char *)&v303 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v11);
  v308 = (char *)&v303 - v14;
  v15 = MEMORY[0x1E0C80A78](v13);
  v316 = (char *)&v303 - v16;
  v310 = v17;
  MEMORY[0x1E0C80A78](v15);
  v332 = (char *)&v303 - v18;
  v324 = sub_1BEDE93EC();
  v320 = *(_QWORD *)(v324 - 8);
  MEMORY[0x1E0C80A78](v324);
  v307 = (char *)&v303 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FC8);
  v21 = MEMORY[0x1E0C80A78](v20);
  v312 = (char *)&v303 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v315 = (char *)&v303 - v23;
  v335 = sub_1BEDE9098();
  v334 = *(_QWORD *)(v335 - 8);
  v24 = MEMORY[0x1E0C80A78](v335);
  v313 = (char *)&v303 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x1E0C80A78](v24);
  v323 = (char *)&v303 - v27;
  v28 = MEMORY[0x1E0C80A78](v26);
  v317 = (char *)&v303 - v29;
  v30 = MEMORY[0x1E0C80A78](v28);
  v331 = (char *)&v303 - v31;
  v32 = MEMORY[0x1E0C80A78](v30);
  v319 = (char *)&v303 - v33;
  MEMORY[0x1E0C80A78](v32);
  v333 = (char *)&v303 - v34;
  v328 = sub_1BEDE90BC();
  v327 = *(_QWORD *)(v328 - 8);
  v35 = MEMORY[0x1E0C80A78](v328);
  v322 = (char *)&v303 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v314 = v36;
  MEMORY[0x1E0C80A78](v35);
  v345 = (char *)&v303 - v37;
  v349 = sub_1BEDE941C();
  v330 = *(_QWORD *)(v349 - 8);
  v38 = MEMORY[0x1E0C80A78](v349);
  v318 = (char *)&v303 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = MEMORY[0x1E0C80A78](v38);
  v326 = (char *)&v303 - v41;
  v42 = MEMORY[0x1E0C80A78](v40);
  v329 = (char *)&v303 - v43;
  v44 = MEMORY[0x1E0C80A78](v42);
  v341 = (char *)&v303 - v45;
  MEMORY[0x1E0C80A78](v44);
  v344 = (char *)&v303 - v46;
  v343 = sub_1BEDE9410();
  v342 = *(_QWORD *)(v343 - 8);
  MEMORY[0x1E0C80A78](v343);
  v347 = (char *)&v303 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  v339 = sub_1BEDE9368();
  v338 = *(_QWORD *)(v339 - 8);
  MEMORY[0x1E0C80A78](v339);
  v340 = (char *)&v303 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  v352 = sub_1BEDE944C();
  v351 = *(_QWORD *)(v352 - 8);
  MEMORY[0x1E0C80A78](v352);
  v359 = (char *)&v303 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  v358 = sub_1BEDE9320();
  v357 = *(_QWORD *)(v358 - 8);
  MEMORY[0x1E0C80A78](v358);
  v356 = (char *)&v303 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  v364 = sub_1BEDE92D8();
  v363 = *(_QWORD *)(v364 - 8);
  MEMORY[0x1E0C80A78](v364);
  v368 = (char *)&v303 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  v375 = (void (*)(char *, uint64_t))sub_1BEDE9038();
  v374 = *((_QWORD *)v375 - 1);
  MEMORY[0x1E0C80A78](v375);
  v373 = (char *)&v303 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FB8);
  v54 = MEMORY[0x1E0C80A78](v53);
  v376 = (char *)&v303 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v54);
  v369 = (char *)&v303 - v56;
  v381 = sub_1BEDE8F9C();
  v383 = *(_QWORD *)(v381 - 8);
  v57 = MEMORY[0x1E0C80A78](v381);
  v355 = (char *)&v303 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = MEMORY[0x1E0C80A78](v57);
  v367 = (char *)&v303 - v60;
  v61 = MEMORY[0x1E0C80A78](v59);
  v379 = (void (*)(char *, uint64_t))((char *)&v303 - v62);
  v309 = v63;
  MEMORY[0x1E0C80A78](v61);
  v382 = (char *)&v303 - v64;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FC0);
  v66 = MEMORY[0x1E0C80A78](v65);
  v360 = (char *)&v303 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = MEMORY[0x1E0C80A78](v66);
  v370 = (char *)&v303 - v69;
  MEMORY[0x1E0C80A78](v68);
  v71 = (char *)&v303 - v70;
  v384 = (void (*)(char *, uint64_t))sub_1BEDE97C4();
  v380 = *((_QWORD *)v384 - 1);
  v72 = MEMORY[0x1E0C80A78](v384);
  v337 = (char *)&v303 - ((v73 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = MEMORY[0x1E0C80A78](v72);
  v75 = MEMORY[0x1E0C80A78](v74);
  v350 = (char *)&v303 - v76;
  v77 = MEMORY[0x1E0C80A78](v75);
  v354 = (char *)&v303 - v78;
  v79 = MEMORY[0x1E0C80A78](v77);
  v362 = (char *)&v303 - v80;
  v81 = MEMORY[0x1E0C80A78](v79);
  v366 = (char *)&v303 - v82;
  v83 = MEMORY[0x1E0C80A78](v81);
  v372 = (char *)&v303 - v84;
  v85 = MEMORY[0x1E0C80A78](v83);
  v377 = (char *)&v303 - v86;
  MEMORY[0x1E0C80A78](v85);
  v88 = ((char *)&v303 - v87);
  v89 = sub_1BEDE9770();
  v90 = *(_QWORD *)(v89 - 8);
  v386 = v89;
  v387 = v90;
  v91 = MEMORY[0x1E0C80A78](v89);
  v336 = (char *)&v303 - ((v92 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = MEMORY[0x1E0C80A78](v91);
  v346 = (char *)&v303 - v94;
  v95 = MEMORY[0x1E0C80A78](v93);
  v97 = (char *)&v303 - v96;
  v98 = MEMORY[0x1E0C80A78](v95);
  v353 = (char *)&v303 - v99;
  v100 = MEMORY[0x1E0C80A78](v98);
  v361 = (char *)&v303 - v101;
  v102 = MEMORY[0x1E0C80A78](v100);
  v365 = (char *)&v303 - v103;
  v104 = MEMORY[0x1E0C80A78](v102);
  v371 = (char *)&v303 - v105;
  MEMORY[0x1E0C80A78](v104);
  v107 = (char *)&v303 - v106;
  v108 = sub_1BEDE9500();
  v109 = *(_QWORD *)(v108 - 8);
  MEMORY[0x1E0C80A78](v108);
  v111 = (char *)&v303 - ((v110 + 15) & 0xFFFFFFFFFFFFFFF0);
  v389 = swift_allocObject();
  *(_QWORD *)(v389 + 16) = a4;
  v378 = a4;
  _Block_copy(a4);
  v388 = a1;
  v113 = sub_1BEDE8F54();
  v114 = v112;
  if (v113 == 0x6361666863746177 && v112 == 0xE900000000000065 || (sub_1BEDE9CD4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v115 = v389;
    v116 = v386;
    if ((~LODWORD(a5) & 0x7F800000) != 0)
    {
      if (a5 > -9.2234e18)
      {
        if (a5 < 9.2234e18)
        {
          sub_1BEDE94F4();
          sub_1BEDE950C();
          sub_1BEDE8F90();
          sub_1BEDE9794();
          sub_1BEDE9764();
          v117 = swift_allocObject();
          *(_QWORD *)(v117 + 16) = sub_1BEDD4890;
          *(_QWORD *)(v117 + 24) = v115;
          sub_1BEDD47C0(&qword_1EF578340, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02D68], MEMORY[0x1E0D02D60]);
          swift_retain();
          sub_1BEDE91A0();
          swift_release();
          (*(void (**)(char *, uint64_t))(v387 + 8))(v107, v116);
          (*(void (**)(char *, uint64_t))(v109 + 8))(v111, v108);
          return swift_release();
        }
        goto LABEL_56;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  if (v113 == 0x737361706B70 && v114 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v111 = (char *)v388;
    v119 = v381;
    goto LABEL_17;
  }
  v120 = sub_1BEDE9CD4();
  v111 = (char *)v388;
  v119 = v381;
  if ((v120 & 1) == 0 && (v113 != 0x726564726FLL || v114 != 0xE500000000000000) && (sub_1BEDE9CD4() & 1) == 0)
  {
    if (v113 == 0x74756F6B726F77 && v114 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      v157 = v359;
    }
    else
    {
      v193 = sub_1BEDE9CD4();
      swift_bridgeObjectRelease();
      v157 = v359;
      if ((v193 & 1) == 0)
      {
        if ((v348 & 1) != 0)
        {
          sub_1BEDE8F90();
          sub_1BEDE9794();
          sub_1BEDE9764();
          sub_1BEDE9404();
          v196 = *(char **)((char *)v385 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
          sub_1BEDD47C0(&qword_1EF577D08, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02BC0], MEMORY[0x1E0D02BB8]);
          v197 = v341;
          v108 = v349;
          sub_1BEDE91B8();
          v379 = 0;
          v377 = v196;
          v109 = v330;
          v213 = v344;
          (*(void (**)(char *, char *, uint64_t))(v330 + 32))(v344, v197, v108);
          sub_1BEDE90B0();
          sub_1BEDE90A4();
          v214 = v333;
          sub_1BEDE9080();
          v107 = v329;
          v380 = *(_QWORD *)(v109 + 16);
          ((void (*)(char *, char *, uint64_t))v380)(v329, v213, v108);
          v88 = sub_1BEDE90A4();
          v215 = sub_1BEDE9A34();
          v216 = sub_1BEDE9A40();
          if ((v216 & 1) != 0)
          {
            v217 = v319;
            v385 = *(void (**)(char *, char *, uint64_t))(v334 + 16);
            v385(v319, v214, v335);
            v218 = (uint8_t *)swift_slowAlloc();
            v376 = (char *)swift_slowAlloc();
            v391[0] = v376;
            *(_DWORD *)v218 = 136315138;
            v219 = (uint64_t)v315;
            sub_1BEDE93F8();
            v220 = v320;
            v221 = v324;
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v320 + 48))(v219, 1, v324))
            {
              v222 = 7104878;
              sub_1BEDD4434(v219, &qword_1ED702FC8);
              v223 = 0xE300000000000000;
            }
            else
            {
              v227 = v307;
              (*(void (**)(char *, uint64_t, uint64_t))(v220 + 16))(v307, v219, v221);
              sub_1BEDD4434(v219, &qword_1ED702FC8);
              v228 = v221;
              v222 = sub_1BEDE93E0();
              v223 = v229;
              v230 = v227;
              v217 = v319;
              (*(void (**)(char *, uint64_t))(v220 + 8))(v230, v228);
            }
            v226 = v331;
            v390 = sub_1BEDCCA90(v222, v223, (uint64_t *)v391);
            sub_1BEDE9A88();
            swift_bridgeObjectRelease();
            v384 = *(void (**)(char *, uint64_t))(v330 + 8);
            v384(v329, v349);
            v231 = sub_1BEDE908C();
            _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v88, (os_signpost_type_t)v215, v231, "LargeImage.Context.init", "largeImageContextualInfo: %s", v218, 0xCu);
            v232 = v376;
            swift_arrayDestroy();
            MEMORY[0x1C3B85C64](v232, -1, -1);
            MEMORY[0x1C3B85C64](v218, -1, -1);

            v225 = v335;
            (*(void (**)(char *, uint64_t))(v334 + 8))(v217, v335);
            v224 = (char *)v385;
LABEL_60:
            v233 = v333;
            v385 = (void (*)(char *, char *, uint64_t))v224;
            ((void (*)(char *, char *, uint64_t))v224)(v226, v333, v225);
            v234 = (void (**)(_QWORD, _QWORD, _QWORD))sub_1BEDE90EC();
            swift_allocObject();
            v235 = sub_1BEDE90E0();
            v236 = v344;
            ((void (*)(char *, char *, uint64_t))v380)(v326, v344, v349);
            v237 = v332;
            v238 = v379;
            sub_1BEDE923C();
            if (v238)
            {
              swift_release();
              (*(void (**)(char *, uint64_t))(v334 + 8))(v233, v225);
              (*(void (**)(char *, uint64_t))(v327 + 8))(v345, v328);
              MEMORY[0x1C3B85B68](v238);
              v239 = (void *)sub_1BEDE8F3C();
              ((void (**)(_QWORD, _QWORD, void *))v378)[2](v378, 0, v239);

              v384(v236, v349);
              (*(void (**)(char *, uint64_t))(v342 + 8))(v347, v343);
              (*(void (**)(char *, uint64_t))(v387 + 8))(v346, v386);
            }
            else
            {
              v378 = v234;
              v240 = v321;
              v241 = *(void (**)(char *, char *, uint64_t))(v321 + 16);
              v242 = v316;
              v243 = v325;
              v241(v316, v237, v325);
              v244 = v308;
              v374 = (uint64_t)v241;
              v241(v308, v237, v243);
              v245 = sub_1BEDE90A4();
              v246 = v317;
              sub_1BEDE90D4();
              LODWORD(v379) = sub_1BEDE9A28();
              v247 = sub_1BEDE9A40();
              v376 = (char *)v235;
              if ((v247 & 1) != 0)
              {
                swift_retain();
                v248 = v304;
                sub_1BEDE90F8();
                swift_release();
                v249 = v305;
                v250 = v306;
                if ((*(unsigned int (**)(char *, uint64_t))(v305 + 88))(v248, v306) == *MEMORY[0x1E0DF2190])
                {
                  v251 = 0;
                  v373 = "[Error] Interval already ended";
                }
                else
                {
                  (*(void (**)(char *, uint64_t))(v249 + 8))(v248, v250);
                  v373 = "bufferSize: %ld, vmAddress: %lu";
                  v251 = 2;
                }
                v257 = v335;
                v258 = v331;
                v385(v331, v246, v335);
                v259 = swift_slowAlloc();
                *(_BYTE *)v259 = 0;
                *(_BYTE *)(v259 + 1) = v251;
                *(_WORD *)(v259 + 2) = 2048;
                v260 = v316;
                v261 = (void *)sub_1BEDE9224();
                v262 = *(void (**)(char *, uint64_t))(v321 + 8);
                v263 = v260;
                v243 = v325;
                v262(v263, v325);
                v391[0] = v261;
                sub_1BEDE9A88();
                *(_WORD *)(v259 + 12) = 2048;
                v264 = (void *)sub_1BEDE9248();
                v375 = v262;
                v262(v244, v243);
                v391[0] = v264;
                sub_1BEDE9A88();
                v265 = sub_1BEDE908C();
                _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v245, (os_signpost_type_t)v379, v265, "LargeImage.Context.init", v373, (uint8_t *)v259, 0x16u);
                MEMORY[0x1C3B85C64](v259, -1, -1);

                v266 = *(void (**)(char *, uint64_t))(v334 + 8);
                v266(v317, v257);
                v267 = v258;
                v240 = v321;
                v379 = v266;
                v266(v267, v257);
                v111 = (char *)v388;
                v256 = v349;
                v253 = v344;
                v254 = (uint64_t)v312;
                v255 = v318;
              }
              else
              {
                v252 = *(void (**)(char *, uint64_t))(v240 + 8);
                v252(v244, v243);
                v375 = v252;
                v252(v242, v243);

                v379 = *(void (**)(char *, uint64_t))(v334 + 8);
                v379(v246, v335);
                v253 = v344;
                v254 = (uint64_t)v312;
                v255 = v318;
                v256 = v349;
              }
              v268 = v311;
              ((void (*)(char *, char *, uint64_t))v374)(v311, v332, v243);
              v269 = (*(unsigned __int8 *)(v240 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v240 + 80);
              v374 = swift_allocObject();
              (*(void (**)(unint64_t, char *, uint64_t))(v240 + 32))(v374 + v269, v268, v243);
              sub_1BEDE90A4();
              v270 = v323;
              sub_1BEDE9080();
              ((void (*)(char *, char *, uint64_t))v380)(v255, v253, v256);
              v271 = sub_1BEDE90A4();
              v272 = sub_1BEDE9A34();
              if ((sub_1BEDE9A40() & 1) != 0)
              {
                LODWORD(v380) = v272;
                v273 = v335;
                v385(v313, v270, v335);
                v274 = (uint8_t *)swift_slowAlloc();
                v275 = (void *)swift_slowAlloc();
                v391[0] = v275;
                *(_DWORD *)v274 = 136315138;
                sub_1BEDE93F8();
                v276 = v320;
                v277 = v324;
                if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v320 + 48))(v254, 1, v324))
                {
                  v278 = 7104878;
                  sub_1BEDD4434(v254, &qword_1ED702FC8);
                  v279 = 0xE300000000000000;
                }
                else
                {
                  v280 = v254;
                  v281 = v307;
                  (*(void (**)(char *, uint64_t, uint64_t))(v276 + 16))(v307, v280, v277);
                  sub_1BEDD4434(v280, &qword_1ED702FC8);
                  v278 = sub_1BEDE93E0();
                  v279 = v282;
                  (*(void (**)(char *, uint64_t))(v276 + 8))(v281, v324);
                }
                v390 = sub_1BEDCCA90(v278, v279, (uint64_t *)v391);
                sub_1BEDE9A88();
                swift_bridgeObjectRelease();
                v384(v318, v349);
                v283 = v313;
                v284 = sub_1BEDE908C();
                _os_signpost_emit_with_name_impl(&dword_1BEDB7000, v271, (os_signpost_type_t)v380, v284, "Unpack LargeImage", "largeImageContextualInfo: %s", v274, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x1C3B85C64](v275, -1, -1);
                MEMORY[0x1C3B85C64](v274, -1, -1);

                v379(v283, v273);
                v111 = (char *)v388;
              }
              else
              {

                v384(v255, v256);
                v273 = v335;
              }
              v285 = v309;
              v385(v331, v270, v273);
              swift_allocObject();
              v385 = (void (*)(char *, char *, uint64_t))sub_1BEDE90E0();
              v388 = sub_1BEDE926C();
              v286 = v327;
              v287 = v328;
              (*(void (**)(char *, char *, uint64_t))(v327 + 16))(v322, v345, v328);
              v288 = v383;
              v289 = v381;
              (*(void (**)(char *, char *, uint64_t))(v383 + 16))(v382, v111, v381);
              v290 = (*(unsigned __int8 *)(v286 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v286 + 80);
              v291 = (v314 + v290 + 7) & 0xFFFFFFFFFFFFFFF8;
              v292 = (v291 + 15) & 0xFFFFFFFFFFFFFFF8;
              v293 = (*(unsigned __int8 *)(v288 + 80) + v292 + 16) & ~(unint64_t)*(unsigned __int8 *)(v288 + 80);
              v294 = swift_allocObject();
              (*(void (**)(unint64_t, char *, uint64_t))(v286 + 32))(v294 + v290, v322, v287);
              *(_QWORD *)(v294 + v291) = v385;
              v295 = (_QWORD *)(v294 + v292);
              v296 = v389;
              *v295 = sub_1BEDD4890;
              v295[1] = v296;
              (*(void (**)(unint64_t, char *, uint64_t))(v288 + 32))(v294 + v293, v382, v289);
              v297 = (_QWORD *)(v294 + ((v285 + v293 + 7) & 0xFFFFFFFFFFFFFFF8));
              v298 = v374;
              *v297 = sub_1BEDD4330;
              v297[1] = v298;
              sub_1BEDD47C0(&qword_1ED702F88, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02958], MEMORY[0x1E0D02950]);
              swift_retain();
              swift_retain();
              swift_retain();
              v299 = v346;
              v300 = v332;
              sub_1BEDE91A0();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              v301 = v335;
              v302 = v379;
              v379(v323, v335);
              v375(v300, v325);
              v302(v333, v301);
              (*(void (**)(char *, uint64_t))(v327 + 8))(v345, v328);
              v384(v344, v349);
              (*(void (**)(char *, uint64_t))(v342 + 8))(v347, v343);
              (*(void (**)(char *, uint64_t))(v387 + 8))(v299, v386);
            }
            return swift_release();
          }
LABEL_57:

          v384 = *(void (**)(char *, uint64_t))(v109 + 8);
          v384(v107, v108);
          v224 = *(char **)(v334 + 16);
          v225 = v335;
          v226 = v331;
          goto LABEL_60;
        }
        sub_1BEDE99E0();
        sub_1BEDD4788(0, (unint64_t *)&qword_1ED702FA0);
        v198 = (void *)sub_1BEDE9A4C();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
        v199 = swift_allocObject();
        *(_OWORD *)(v199 + 16) = xmmword_1BEDEABF0;
        *(float *)v391 = a5;
        BYTE4(v391[0]) = 0;
        v200 = sub_1BEDE9710();
        v202 = v201;
        v203 = MEMORY[0x1E0DEA968];
        *(_QWORD *)(v199 + 56) = MEMORY[0x1E0DEA968];
        v204 = sub_1BEDCD658();
        *(_QWORD *)(v199 + 64) = v204;
        *(_QWORD *)(v199 + 32) = v200;
        *(_QWORD *)(v199 + 40) = v202;
        *(float *)v391 = a6;
        BYTE4(v391[0]) = 0;
        v205 = sub_1BEDE9710();
        *(_QWORD *)(v199 + 96) = v203;
        *(_QWORD *)(v199 + 104) = v204;
        *(_QWORD *)(v199 + 72) = v205;
        *(_QWORD *)(v199 + 80) = v206;
        sub_1BEDE9074();

        swift_bridgeObjectRelease();
        if ((~LODWORD(a5) & 0x7F800000) != 0)
        {
          v207 = v389;
          v208 = v386;
          v209 = v387;
          v210 = v340;
          if (a5 > -9.2234e18)
          {
            if (a5 < 9.2234e18)
            {
              sub_1BEDE935C();
              sub_1BEDE9380();
              sub_1BEDE8F90();
              sub_1BEDE9794();
              v211 = v336;
              sub_1BEDE9764();
              v212 = swift_allocObject();
              *(_QWORD *)(v212 + 16) = sub_1BEDD4890;
              *(_QWORD *)(v212 + 24) = v207;
              sub_1BEDD47C0(&qword_1ED702F90, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02B08], MEMORY[0x1E0D02B00]);
              swift_retain();
              sub_1BEDE91A0();
              swift_release();
              (*(void (**)(char *, uint64_t))(v209 + 8))(v211, v208);
              (*(void (**)(char *, uint64_t))(v338 + 8))(v210, v339);
              return swift_release();
            }
LABEL_80:
            __break(1u);
          }
LABEL_79:
          __break(1u);
          goto LABEL_80;
        }
LABEL_78:
        __break(1u);
        goto LABEL_79;
      }
    }
    v194 = v389;
    if ((~LODWORD(a5) & 0x7F800000) != 0)
    {
      if (a5 > -9.2234e18)
      {
        if (a5 < 9.2234e18)
        {
          sub_1BEDE9440();
          sub_1BEDE9458();
          sub_1BEDE8F90();
          sub_1BEDE9794();
          sub_1BEDE9764();
          v195 = swift_allocObject();
          *(_QWORD *)(v195 + 16) = sub_1BEDD4890;
          *(_QWORD *)(v195 + 24) = v194;
          sub_1BEDD47C0(&qword_1EF578290, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02C58], MEMORY[0x1E0D02C50]);
          swift_retain();
          sub_1BEDE91A0();
          swift_release();
          (*(void (**)(char *, uint64_t))(v387 + 8))(v97, v386);
          (*(void (**)(char *, uint64_t))(v351 + 8))(v157, v352);
          return swift_release();
        }
        goto LABEL_77;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  swift_bridgeObjectRelease();
LABEL_17:
  (*(void (**)(char *, char *, uint64_t))(v383 + 16))(v382, v111, v119);
  sub_1BEDE97AC();
  v121 = v380;
  v122 = *(unsigned int (**)(char *, uint64_t, void (*)(char *, uint64_t)))(v380 + 48);
  v123 = v384;
  if (v122(v71, 1, v384) == 1)
  {
    sub_1BEDD4434((uint64_t)v71, &qword_1ED702FC0);
    sub_1BEDD47C0(&qword_1EF578280, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    sub_1BEDE9CC8();
    sub_1BEDE9854();
    sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    v124 = (void *)swift_allocError();
    sub_1BEDE9848();
    v125 = (void *)sub_1BEDE8F3C();
    ((void (**)(_QWORD, _QWORD, void *))v378)[2](v378, 0, v125);

    return swift_release();
  }
  v126 = *(void (**)(char *, char *, void (*)(char *, uint64_t)))(v121 + 32);
  v126(v377, v71, v123);
  sub_1BEDE977C();
  v127 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578328);
  v128 = swift_allocObject();
  *(_OWORD *)(v128 + 16) = xmmword_1BEDEAC00;
  v129 = NSTemporaryDirectory();
  v130 = sub_1BEDE98C0();
  v132 = v131;

  *(_QWORD *)(v128 + 32) = v130;
  *(_QWORD *)(v128 + 40) = v132;
  *(_QWORD *)(v128 + 48) = 0x7665725073736150;
  *(_QWORD *)(v128 + 56) = 0xEB00000000776569;
  v133 = v373;
  sub_1BEDE902C();
  v134 = sub_1BEDE9014();
  v136 = v135;
  (*(void (**)(const char *, _QWORD *))(v374 + 8))(v133, v375);
  *(_QWORD *)(v128 + 64) = v134;
  *(_QWORD *)(v128 + 72) = v136;
  v137 = (void *)sub_1BEDE998C();
  swift_bridgeObjectRelease();
  v138 = objc_msgSend(v127, sel_fileURLWithPathComponents_, v137);

  if (!v138)
  {
    _Block_release(v378);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v383 + 56))(v376, 1, 1, v381);
    __break(1u);
    goto LABEL_82;
  }
  v139 = v382;
  sub_1BEDE8F78();

  v140 = v383;
  v141 = *(void (**)(char *, char *, uint64_t))(v383 + 32);
  v142 = v376;
  v143 = v381;
  v141(v376, v139, v381);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v140 + 56))(v142, 0, 1, v143);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v140 + 48))(v142, 1, v143) == 1)
  {
LABEL_82:
    _Block_release(v378);
    __break(1u);
    goto LABEL_83;
  }
  v141((char *)v379, v142, v143);
  v144 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v145 = (void *)sub_1BEDE8F60();
  v391[0] = 0;
  v146 = objc_msgSend(v144, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v145, 1, 0, v391);

  if ((v146 & 1) != 0)
  {
    v147 = v391[0];
  }
  else
  {
    v148 = v391[0];
    v149 = (void *)sub_1BEDE8F48();

    swift_willThrow();
    MEMORY[0x1C3B85B68](v149);
    v150 = (void *)sub_1BEDE8F3C();
    ((void (**)(_QWORD, _QWORD, void *))v378)[2](v378, 0, v150);

  }
  v151 = (char *)v379;
  sub_1BEDE8F6C();
  v152 = (uint64_t)v370;
  sub_1BEDE97AC();
  v153 = v384;
  if (v122((char *)v152, 1, v384) == 1)
  {
    sub_1BEDD4434(v152, &qword_1ED702FC0);
    sub_1BEDD47C0(&qword_1EF578280, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    sub_1BEDE9CC8();
    sub_1BEDE9854();
    sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    v154 = (void *)swift_allocError();
    sub_1BEDE9848();
    v155 = (void *)sub_1BEDE8F3C();
    ((void (**)(_QWORD, _QWORD, void *))v378)[2](v378, 0, v155);

    (*(void (**)(char *, uint64_t))(v383 + 8))(v151, v143);
    (*(void (**)(char *, _QWORD *))(v380 + 8))(v377, v153);
    return swift_release();
  }
  v156 = v372;
  v126(v372, (char *)v152, v153);
  sub_1BEDE977C();
  v388 = 0;
  v158 = v386;
  v159 = v387;
  v160 = v156;
  v161 = v377;
  v162 = v365;
  (*(void (**)(char *, char *, void (*)(char *, uint64_t)))(v380 + 16))(v366, v160, v153);
  v163 = v371;
  sub_1BEDE9764();
  v164 = sub_1BEDE8F54();
  if (v164 == 0x737361706B70 && v165 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v166 = v389;
    v167 = v368;
    v168 = v367;
    goto LABEL_35;
  }
  v169 = sub_1BEDE9CD4();
  swift_bridgeObjectRelease();
  v166 = v389;
  v167 = v368;
  v168 = v367;
  if ((v169 & 1) != 0)
  {
LABEL_35:
    v170 = *(void (**)(char *, char *, uint64_t))(v159 + 16);
    v171 = v158;
    v170(v162, v163, v158);
    sub_1BEDE92CC();
    sub_1BEDE97A0();
    sub_1BEDE92E4();
    sub_1BEDE8F90();
    v172 = v388;
    sub_1BEDE9794();
    if (!v172)
    {
      v173 = v361;
      sub_1BEDE9764();
      v174 = swift_allocObject();
      *(_QWORD *)(v174 + 16) = sub_1BEDD4890;
      *(_QWORD *)(v174 + 24) = v166;
      sub_1BEDD47C0(&qword_1EF578338, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02A10], MEMORY[0x1E0D02A08]);
      swift_retain();
      sub_1BEDE91A0();
      swift_release();
      v175 = *(void (**)(char *, uint64_t))(v387 + 8);
      v175(v173, v171);
      v176 = *(void (**)(char *, uint64_t))(v383 + 8);
      v177 = v381;
      v176(v168, v381);
      (*(void (**)(char *, uint64_t))(v363 + 8))(v167, v364);
      v175(v371, v171);
      v178 = *(void (**)(char *, _QWORD *))(v380 + 8);
      v179 = v384;
      v178(v372, v384);
      v176((char *)v379, v177);
      v180 = v161;
LABEL_39:
      v178(v180, v179);
      return swift_release();
    }
    goto LABEL_83;
  }
  v181 = *(void (**)(char *, char *, uint64_t))(v159 + 16);
  v182 = v158;
  v181(v162, v163, v158);
  v183 = v356;
  sub_1BEDE9314();
  v184 = v355;
  sub_1BEDE97A0();
  sub_1BEDE932C();
  sub_1BEDE8F90();
  v185 = v388;
  sub_1BEDE9794();
  if (!v185)
  {
    v186 = v182;
    v187 = v161;
    v188 = v353;
    sub_1BEDE9764();
    v189 = swift_allocObject();
    *(_QWORD *)(v189 + 16) = sub_1BEDD4890;
    *(_QWORD *)(v189 + 24) = v166;
    sub_1BEDD47C0(&qword_1EF578330, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02AA0], MEMORY[0x1E0D02A98]);
    swift_retain();
    sub_1BEDE91A0();
    swift_release();
    v190 = *(void (**)(char *, uint64_t))(v387 + 8);
    v190(v188, v186);
    v191 = *(void (**)(char *, uint64_t))(v383 + 8);
    v192 = v381;
    v191(v184, v381);
    (*(void (**)(char *, uint64_t))(v357 + 8))(v183, v358);
    v190(v371, v186);
    v178 = *(void (**)(char *, _QWORD *))(v380 + 8);
    v179 = v384;
    v178(v372, v384);
    v191((char *)v379, v192);
    v180 = v187;
    goto LABEL_39;
  }
LABEL_83:
  _Block_release(v378);
  swift_unexpectedError();
  __break(1u);
  _Block_release(v378);
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1BEDD3BE0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, unint64_t a11, unsigned __int8 a12, uint64_t a13, void (**a14)(_QWORD, _QWORD, _QWORD))
{
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  char *v45;
  id v46;
  char *v47;
  void *v48;
  id v49;
  char *v50;
  uint64_t (*v51)(uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v60;
  unint64_t v61;
  void (*v62)(char *, uint64_t);
  char *v63;
  char *v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82[3];

  v70 = a7;
  v71 = a8;
  v68 = a5;
  v69 = a6;
  v66 = a3;
  v67 = a4;
  v65 = a2;
  v82[1] = *(id *)MEMORY[0x1E0C80C00];
  v14 = sub_1BEDE9770();
  MEMORY[0x1E0C80A78](v14);
  v64 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1BEDE9830();
  v73 = *(_QWORD *)(v16 - 8);
  v74 = v16;
  MEMORY[0x1E0C80A78](v16);
  v72 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1BEDE8F9C();
  v76 = *(_QWORD *)(v18 - 8);
  v77 = v18;
  MEMORY[0x1E0C80A78](v18);
  v75 = (char *)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1BEDE9038();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v60 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_1BEDE97C4();
  v79 = *(_QWORD *)(v24 - 8);
  v80 = v24;
  v25 = MEMORY[0x1E0C80A78](v24);
  v27 = (char *)&v60 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x1E0C80A78](v25);
  v30 = (char *)&v60 - v29;
  v31 = MEMORY[0x1E0C80A78](v28);
  v33 = (char *)&v60 - v32;
  MEMORY[0x1E0C80A78](v31);
  v78 = (char *)&v60 - v34;
  v81 = swift_allocObject();
  *(_QWORD *)(v81 + 16) = a14;
  v35 = (void *)objc_opt_self();
  _Block_copy(a14);
  v36 = (void *)sub_1BEDE9878();
  v82[0] = 0;
  v37 = objc_msgSend(v35, sel_dataWithPropertyList_format_options_error_, v36, 200, 0, v82);

  v38 = v82[0];
  if (!v37)
  {
    v42 = v38;
    v43 = (void *)sub_1BEDE8F48();

    swift_willThrow();
LABEL_7:
    sub_1BEDE9854();
    sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    v57 = (void *)swift_allocError();
    MEMORY[0x1C3B85B68](v43);
    sub_1BEDE9860();
    v58 = (void *)sub_1BEDE8F3C();
    ((void (**)(_QWORD, _QWORD, void *))a14)[2](a14, 0, v58);

    return swift_release();
  }
  v63 = v27;
  v39 = sub_1BEDE8FF0();
  v41 = v40;

  sub_1BEDE9788();
  sub_1BEDE97B8();
  v60 = v39;
  v61 = v41;
  v44 = v80;
  v62 = *(void (**)(char *, uint64_t))(v79 + 8);
  v62(v30, v80);
  sub_1BEDE902C();
  sub_1BEDE9014();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  v45 = v78;
  sub_1BEDE97B8();
  v62(v33, v44);
  swift_bridgeObjectRelease();
  v46 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v47 = v75;
  sub_1BEDE97A0();
  v48 = (void *)sub_1BEDE8F60();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v47, v77);
  v82[0] = 0;
  LOBYTE(v47) = objc_msgSend(v46, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v48, 1, 0, v82);

  v49 = v82[0];
  if ((v47 & 1) == 0)
  {
    v56 = v49;
    v43 = (void *)sub_1BEDE8F48();

    swift_willThrow();
    sub_1BEDBB354(v60, v61);
    v62(v45, v44);
    goto LABEL_7;
  }
  v77 = a13;
  LODWORD(v76) = a12;
  v75 = (char *)a9;
  (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v63, v45, v44);
  sub_1BEDBB398(v65, v66);
  swift_bridgeObjectRetain();
  sub_1BEDD02C4(v69, v70);
  sub_1BEDD02C4(v71, a9);
  sub_1BEDD02C4(a10, a11);
  sub_1BEDE9764();
  v50 = v72;
  sub_1BEDE9824();
  sub_1BEDE983C();
  v51 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D03270];
  v52 = swift_allocObject();
  v53 = v81;
  *(_QWORD *)(v52 + 16) = sub_1BEDD430C;
  *(_QWORD *)(v52 + 24) = v53;
  sub_1BEDD47C0(&qword_1EF578298, v51, MEMORY[0x1E0D03268]);
  swift_retain();
  v54 = v60;
  v55 = v61;
  sub_1BEDE9194();
  swift_release();
  sub_1BEDBB354(v54, v55);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v50, v74);
  v62(v78, v80);
  return swift_release();
}

uint64_t sub_1BEDD42F8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1BEDBB354(a1, a2);
  return a1;
}

void sub_1BEDD430C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BEDCB5C8(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_1BEDD4324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1BEDC6D1C(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

void sub_1BEDD433C(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02C58], &qword_1EF578360);
}

void sub_1BEDD436C(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02AA0], &qword_1EF578358);
}

void sub_1BEDD439C(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02A10], &qword_1EF578350);
}

void sub_1BEDD43CC(uint64_t a1)
{
  uint64_t v1;

  sub_1BEDBB63C(a1, *(void (**)(void *, void *))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t (*)(_QWORD))MEMORY[0x1E0D02D68], &qword_1EF578348);
}

void sub_1BEDD43FC(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1BEDBE0B8(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_1BEDD4404(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v2 + 16))(*(unsigned __int8 *)(v2 + 32), a1, a2);
}

uint64_t sub_1BEDD4434(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BEDD4470(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1BEDD0668;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF578388 + dword_1EF578388))(a1, v4);
}

double CGRound(double a1)
{
  return round(a1);
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

uint64_t objectdestroy_246Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1BEDE9254();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1BEDD4570()
{
  sub_1BEDE9254();
  return sub_1BEDC5264();
}

uint64_t objectdestroy_249Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_1BEDE90BC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  v5 = sub_1BEDE8F9C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + v4 + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  swift_release();
  return swift_deallocObject();
}

void sub_1BEDD469C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(sub_1BEDE90BC() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(sub_1BEDE8F9C() - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + v6 + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = v1 + ((*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  sub_1BEDC5384(a1, v1 + v4, *(void (**)(_QWORD, _QWORD))(v1 + v5), *(void (**)(_QWORD, void *))(v1 + v6), *(_QWORD *)(v1 + v6 + 8), v1 + v8, *(void (**)(uint64_t))v9, *(_QWORD *)(v9 + 8));
}

uint64_t sub_1BEDD4744(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BEDD4788(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1BEDD47C0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1C3B85BE0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BEDD4800()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED702FE8;
  if (!qword_1ED702FE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED702FE0);
    result = MEMORY[0x1C3B85BE0](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED702FE8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3B85BD4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t RelayGroupMutationMessageUnpacker.unpack(from:)@<X0>(uint64_t a1@<X8>)
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void (*v47)(_QWORD, _QWORD, _QWORD);
  uint64_t result;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(_QWORD, _QWORD, _QWORD);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t, uint64_t);
  char *v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(_QWORD, _QWORD, _QWORD);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  void (*v82)(_QWORD, _QWORD, _QWORD);
  uint64_t v83;
  uint64_t v84;
  void (*v85)(char *, uint64_t);
  char *v86;
  char *v87;
  char *v88;
  void (*v89)(_QWORD, _QWORD, _QWORD);
  void (*v90)(char *, char *, uint64_t);
  void (*v91)(char *, uint64_t);
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void (*v107)(_QWORD, _QWORD, _QWORD);
  unint64_t v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  void (*v115)(_QWORD, _QWORD, _QWORD);
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  char *v122;
  uint64_t v123;
  char *v124;
  char *v125;
  char *v126;
  char *v127;
  uint64_t v128;
  char *v129;
  char *v130;
  char *v131;
  uint64_t v132;
  char *v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  uint64_t v141;
  void (*v142)(_QWORD, _QWORD, _QWORD);
  uint64_t v143;
  char *v144;
  uint64_t v145;
  char *v146;
  char *v147;
  char *v148;
  char *v149;
  uint64_t v150;
  char *v151;
  uint64_t v152;
  _OWORD v153[4];
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  char v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  char v169;
  void (*v170)(_QWORD, _QWORD, _QWORD);

  v128 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578468);
  MEMORY[0x1E0C80A78](v1);
  v140 = (char *)&v119 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1BEDE9854();
  v141 = *(_QWORD *)(v3 - 8);
  v142 = (void (*)(_QWORD, _QWORD, _QWORD))v3;
  MEMORY[0x1E0C80A78](v3);
  v149 = (char *)&v119 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v139 = sub_1BEDE97DC();
  v145 = *(_QWORD *)(v139 - 8);
  v5 = MEMORY[0x1E0C80A78](v139);
  v127 = (char *)&v119 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v5);
  v130 = (char *)&v119 - v8;
  v9 = MEMORY[0x1E0C80A78](v7);
  v144 = (char *)&v119 - v10;
  MEMORY[0x1E0C80A78](v9);
  v147 = (char *)&v119 - v11;
  v12 = sub_1BEDE9704();
  v13 = *(_QWORD *)(v12 - 8);
  v137 = v12;
  v138 = v13;
  MEMORY[0x1E0C80A78](v12);
  v146 = (char *)&v119 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578470);
  MEMORY[0x1E0C80A78](v15);
  v133 = (char *)&v119 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1BEDE9740();
  v135 = *(_QWORD *)(v17 - 8);
  v136 = v17;
  v18 = MEMORY[0x1E0C80A78](v17);
  v125 = (char *)&v119 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18);
  v129 = (char *)&v119 - v20;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578478);
  v22 = MEMORY[0x1E0C80A78](v21);
  v132 = (uint64_t)&v119 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v22);
  v134 = (char *)&v119 - v24;
  v143 = sub_1BEDE95C0();
  v150 = *(_QWORD *)(v143 - 8);
  v25 = MEMORY[0x1E0C80A78](v143);
  v126 = (char *)&v119 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x1E0C80A78](v25);
  v124 = (char *)&v119 - v28;
  v29 = MEMORY[0x1E0C80A78](v27);
  v131 = (char *)&v119 - v30;
  MEMORY[0x1E0C80A78](v29);
  v151 = (char *)&v119 - v31;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF577D38);
  MEMORY[0x1E0C80A78](v32);
  v148 = (char *)&v119 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v152 = sub_1BEDE9038();
  v34 = *(_QWORD *)(v152 - 8);
  v35 = MEMORY[0x1E0C80A78](v152);
  v37 = (char *)&v119 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v35);
  v39 = (char *)&v119 - v38;
  sub_1BEDE8F30();
  swift_allocObject();
  v40 = sub_1BEDE8F24();
  v41 = (void *)sub_1BEDE8FE4();
  v42 = objc_msgSend(v41, sel__imOptionallyDecompressData);

  v43 = sub_1BEDE8FF0();
  v45 = v44;

  v46 = v40;
  sub_1BEDD5A50();
  v47 = v170;
  sub_1BEDE8F18();
  if (v47)
  {
    swift_release();
    return sub_1BEDBB354(v43, v45);
  }
  v49 = v149;
  v121 = v37;
  v170 = 0;
  v122 = v39;
  v123 = v46;
  sub_1BEDBB354(v43, v45);
  v156 = v166;
  v157 = v167;
  v158 = v168;
  v159 = v169;
  v153[2] = v162;
  v153[3] = v163;
  v154 = v164;
  v155 = v165;
  v153[0] = v160;
  v153[1] = v161;
  v50 = (uint64_t)v148;
  sub_1BEDE9008();
  v51 = v152;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v50, 1, v152) == 1)
  {
    sub_1BEDD5A94((uint64_t)v153);
    sub_1BEDD4434(v50, &qword_1EF577D38);
    v52 = v49;
    sub_1BEDE9848();
    sub_1BEDD5B28();
    v53 = (void *)sub_1BEDE9A64();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v54 = swift_allocObject();
    *(_OWORD *)(v54 + 16) = xmmword_1BEDEABE0;
    v55 = v141;
    v170 = *(void (**)(_QWORD, _QWORD, _QWORD))(v141 + 16);
    v56 = (uint64_t)v140;
    v57 = v142;
    v170(v140, v52, v142);
    (*(void (**)(uint64_t, _QWORD, uint64_t, void (*)(_QWORD, _QWORD, _QWORD)))(v55 + 56))(v56, 0, 1, v57);
    v58 = sub_1BEDE9710();
    v60 = v59;
    sub_1BEDD4434(v56, &qword_1EF578468);
    *(_QWORD *)(v54 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v54 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v54 + 32) = v58;
    *(_QWORD *)(v54 + 40) = v60;
    sub_1BEDE99F8();
    sub_1BEDE9068();

    swift_bridgeObjectRelease();
    sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    swift_allocError();
    v170(v61, v52, v57);
    swift_willThrow();
    swift_release();
    return (*(uint64_t (**)(char *, void (*)(_QWORD, _QWORD, _QWORD)))(v55 + 8))(v52, v57);
  }
  v62 = v34;
  v63 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 32);
  v64 = v122;
  v63(v122, v50, v51);
  v65 = *MEMORY[0x1E0D02EA8];
  v66 = v150;
  v67 = *(void (**)(char *, uint64_t, uint64_t))(v150 + 104);
  v68 = v143;
  v67(v151, v65, v143);
  v120 = v62;
  if (*(_QWORD *)&v153[0] == 1)
  {
    v142 = (void (*)(_QWORD, _QWORD, _QWORD))v67;
    v70 = v144;
    v76 = v145;
    if ((v158 & 1) != 0)
    {
      v77 = (uint64_t)v133;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v135 + 56))(v133, 1, 1, v136);
    }
    else
    {
      v77 = (uint64_t)v133;
      sub_1BEDE9734();
      v84 = v135;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v135 + 48))(v77, 1, v136) != 1)
      {
        v93 = v77;
        v94 = v129;
        v95 = v136;
        (*(void (**)(char *, uint64_t, uint64_t))(v84 + 32))(v129, v93, v136);
        if (*((_QWORD *)&v158 + 1))
        {
          v96 = *(_QWORD *)(*((_QWORD *)&v158 + 1) + 64);
          v148 = (char *)(*((_QWORD *)&v158 + 1) + 64);
          v97 = 1 << *(_BYTE *)(*((_QWORD *)&v158 + 1) + 32);
          v98 = -1;
          if (v97 < 64)
            v98 = ~(-1 << v97);
          v99 = v98 & v96;
          v149 = (char *)((unint64_t)(v97 + 63) >> 6);
          result = swift_bridgeObjectRetain();
          v100 = 0;
          v101 = MEMORY[0x1E0DEE9D8];
          v102 = v95;
          v79 = v147;
          if (!v99)
            goto LABEL_29;
LABEL_28:
          for (v99 &= v99 - 1; ; v99 = (v105 - 1) & v105)
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v107 = v170;
            sub_1BEDE96F8();
            v170 = v107;
            if (v107)
            {
              swift_release();
              sub_1BEDD5A94((uint64_t)v153);
              swift_bridgeObjectRelease();
              swift_release();
              (*(void (**)(char *, uint64_t))(v135 + 8))(v129, v102);
              (*(void (**)(char *, uint64_t))(v150 + 8))(v151, v143);
              return (*(uint64_t (**)(char *, uint64_t))(v120 + 8))(v122, v152);
            }
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v101 = sub_1BEDD5D68(0, *(_QWORD *)(v101 + 16) + 1, 1, v101);
            v109 = *(_QWORD *)(v101 + 16);
            v108 = *(_QWORD *)(v101 + 24);
            v110 = v138;
            if (v109 >= v108 >> 1)
            {
              v111 = sub_1BEDD5D68(v108 > 1, v109 + 1, 1, v101);
              v110 = v138;
              v101 = v111;
            }
            *(_QWORD *)(v101 + 16) = v109 + 1;
            result = (*(uint64_t (**)(unint64_t))(v110 + 32))(v101+ ((*(unsigned __int8 *)(v110 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v110 + 80))+ *(_QWORD *)(v110 + 72) * v109);
            v79 = v147;
            if (v99)
              goto LABEL_28;
LABEL_29:
            if (__OFADD__(v100++, 1))
            {
              __break(1u);
LABEL_58:
              __break(1u);
              return result;
            }
            v68 = v143;
            v70 = v144;
            v104 = v145;
            if (v100 >= (uint64_t)v149)
              goto LABEL_54;
            v105 = *(_QWORD *)&v148[8 * v100];
            if (!v105)
            {
              v106 = v100 + 1;
              if (v100 + 1 >= (uint64_t)v149)
                goto LABEL_54;
              v105 = *(_QWORD *)&v148[8 * v106];
              if (!v105)
              {
                v106 = v100 + 2;
                if (v100 + 2 >= (uint64_t)v149)
                  goto LABEL_54;
                v105 = *(_QWORD *)&v148[8 * v106];
                if (!v105)
                {
                  v106 = v100 + 3;
                  if (v100 + 3 >= (uint64_t)v149)
                  {
LABEL_54:
                    swift_release();
                    v113 = v135;
                    (*(void (**)(char *, char *, uint64_t))(v135 + 16))(v125, v129, v102);
                    v114 = v124;
                    v115 = v170;
                    sub_1BEDE9758();
                    v116 = v152;
                    if (v115)
                    {
                      swift_release();
                      sub_1BEDD5A94((uint64_t)v153);
                      (*(void (**)(char *, uint64_t))(v113 + 8))(v129, v136);
                      (*(void (**)(char *, uint64_t))(v150 + 8))(v151, v68);
                      return (*(uint64_t (**)(char *, uint64_t))(v120 + 8))(v122, v116);
                    }
                    v170 = 0;
                    (*(void (**)(char *, uint64_t))(v113 + 8))(v129, v136);
                    v117 = v150;
                    v118 = v151;
                    (*(void (**)(char *, uint64_t))(v150 + 8))(v151, v68);
                    v142(v114, *MEMORY[0x1E0D02EA0], v68);
                    (*(void (**)(char *, char *, uint64_t))(v117 + 32))(v118, v114, v68);
                    v78 = v139;
                    v69 = v104;
                    v64 = v122;
LABEL_21:
                    swift_bridgeObjectRetain();
                    v89 = v170;
                    sub_1BEDE97D0();
                    if (v89)
                    {
                      swift_release();
                      sub_1BEDD5A94((uint64_t)v153);
                      (*(void (**)(char *, uint64_t))(v150 + 8))(v151, v68);
                      return (*(uint64_t (**)(char *, uint64_t))(v120 + 8))(v64, v152);
                    }
                    else
                    {
                      swift_bridgeObjectRetain();
                      sub_1BEDE97D0();
                      v170 = 0;
                      v90 = *(void (**)(char *, char *, uint64_t))(v69 + 16);
                      v90(v130, v79, v78);
                      v90(v127, v70, v78);
                      (*(void (**)(char *, char *, uint64_t))(v120 + 16))(v121, v64, v152);
                      v148 = (char *)*((_QWORD *)&v155 + 1);
                      v149 = (char *)*((_QWORD *)&v154 + 1);
                      (*(void (**)(char *, char *, uint64_t))(v150 + 16))(v126, v151, v68);
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRetain();
                      sub_1BEDE96E0();
                      swift_release();
                      sub_1BEDD5A94((uint64_t)v153);
                      v91 = *(void (**)(char *, uint64_t))(v145 + 8);
                      v92 = v139;
                      v91(v144, v139);
                      v91(v147, v92);
                      (*(void (**)(char *, uint64_t))(v150 + 8))(v151, v143);
                      return (*(uint64_t (**)(char *, uint64_t))(v120 + 8))(v122, v152);
                    }
                  }
                  v105 = *(_QWORD *)&v148[8 * v106];
                  if (!v105)
                  {
                    while (1)
                    {
                      v100 = v106 + 1;
                      if (__OFADD__(v106, 1))
                        goto LABEL_58;
                      if (v100 >= (uint64_t)v149)
                        goto LABEL_54;
                      v105 = *(_QWORD *)&v148[8 * v100];
                      ++v106;
                      if (v105)
                        goto LABEL_39;
                    }
                  }
                }
              }
              v100 = v106;
            }
LABEL_39:
            ;
          }
        }
        (*(void (**)(char *, uint64_t))(v84 + 8))(v94, v95);
        v86 = v151;
        (*(void (**)(char *, uint64_t))(v150 + 8))(v151, v68);
        v69 = v145;
LABEL_19:
        v79 = v147;
        v142(v86, v65, v68);
        v78 = v139;
        goto LABEL_21;
      }
    }
    v85 = *(void (**)(char *, uint64_t))(v66 + 8);
    v86 = v151;
    v85(v151, v68);
    sub_1BEDD4434(v77, &qword_1EF578470);
    v69 = v76;
    goto LABEL_19;
  }
  v70 = v144;
  v69 = v145;
  if (*(_QWORD *)&v153[0])
  {
    v78 = v139;
    v79 = v147;
    goto LABEL_21;
  }
  if ((_QWORD)v157
    && (swift_bridgeObjectRetain(),
        v71 = sub_1BEDD6298(1024),
        MEMORY[0x1C3B851C0](v71),
        v73 = v72,
        swift_bridgeObjectRelease(),
        v64 = v122,
        swift_bridgeObjectRelease(),
        v73))
  {
    swift_bridgeObjectRetain();
    v74 = (uint64_t)v134;
    v75 = v170;
    sub_1BEDE94DC();
    v170 = v75;
    if (v75)
    {
      sub_1BEDD5A94((uint64_t)v153);
      swift_release();
      (*(void (**)(char *, uint64_t))(v150 + 8))(v151, v68);
      (*(void (**)(char *, uint64_t))(v120 + 8))(v64, v152);
      return swift_bridgeObjectRelease();
    }
    v112 = sub_1BEDE94E8();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v112 - 8) + 56))(v74, 0, 1, v112);
    swift_bridgeObjectRelease();
  }
  else
  {
    v80 = sub_1BEDE94E8();
    v74 = (uint64_t)v134;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v80 - 8) + 56))(v134, 1, 1, v80);
  }
  v79 = v147;
  sub_1BEDD5F70(v74, v132);
  v81 = v131;
  v82 = v170;
  sub_1BEDE974C();
  v78 = v139;
  v83 = v150;
  v170 = v82;
  if (!v82)
  {
    sub_1BEDD4434(v74, &qword_1EF578478);
    v87 = v151;
    (*(void (**)(char *, uint64_t))(v83 + 8))(v151, v68);
    v67(v81, *MEMORY[0x1E0D02E98], v68);
    v88 = v87;
    v70 = v144;
    (*(void (**)(char *, char *, uint64_t))(v83 + 32))(v88, v81, v68);
    v69 = v145;
    goto LABEL_21;
  }
  swift_release();
  sub_1BEDD5A94((uint64_t)v153);
  sub_1BEDD4434(v74, &qword_1EF578478);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v151, v68);
  return (*(uint64_t (**)(char *, uint64_t))(v120 + 8))(v64, v152);
}

uint64_t sub_1BEDD5A3C@<X0>(uint64_t a1@<X8>)
{
  return RelayGroupMutationMessageUnpacker.unpack(from:)(a1);
}

unint64_t sub_1BEDD5A50()
{
  unint64_t result;

  result = qword_1EF578480;
  if (!qword_1EF578480)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for RelayGroupMutationPayload, &type metadata for RelayGroupMutationPayload);
    atomic_store(result, (unint64_t *)&qword_1EF578480);
  }
  return result;
}

uint64_t sub_1BEDD5A94(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_1BEDD5B28()
{
  unint64_t result;

  result = qword_1ED702FA0;
  if (!qword_1ED702FA0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED702FA0);
  }
  return result;
}

char *sub_1BEDD5B64(char *result, int64_t a2, char a3, char *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5783D8);
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
      v10 = (char *)MEMORY[0x1E0DEE9D8];
      v12 = (char *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1BEDD60C4(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1BEDD5C5C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578490);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1BEDD61A8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BEDD5D68(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578488);
  v10 = *(_QWORD *)(sub_1BEDE9704() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_1BEDE9B60();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_1BEDE9704() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1BEDD635C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_1BEDD5F70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578478);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *sub_1BEDD5FB8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578328);
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
    sub_1BEDD6474(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_1BEDD60C4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  result = (char *)sub_1BEDE9B9C();
  __break(1u);
  return result;
}

uint64_t sub_1BEDD61A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1BEDE9B9C();
  __break(1u);
  return result;
}

uint64_t sub_1BEDD6298(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1BEDE9914();
    return sub_1BEDE995C();
  }
  return result;
}

uint64_t sub_1BEDD6320()
{
  return sub_1BEDD47C0(&qword_1EF578308, MEMORY[0x1E0D030D0], MEMORY[0x1E0D030C8]);
}

ValueMetadata *type metadata accessor for RelayGroupMutationMessageUnpacker()
{
  return &type metadata for RelayGroupMutationMessageUnpacker;
}

uint64_t sub_1BEDD635C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_1BEDE9704() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_1BEDE9B9C();
  __break(1u);
  return result;
}

uint64_t sub_1BEDD6474(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_1BEDE9B9C();
  __break(1u);
  return result;
}

uint64_t sub_1BEDD6564(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  if ((a1 & 0x8000000000000000) == 0)
  {
    v2 = (char *)MEMORY[0x1E0DEE9D8];
    v3 = a1;
    if (!a1)
    {
LABEL_11:
      v8 = sub_1BEDE2D88((uint64_t)v2);
      swift_bridgeObjectRelease();
      return v8;
    }
    while (v3)
    {
      v4 = sub_1BEDD6774(8);
      if (v1)
        return swift_bridgeObjectRelease();
      v5 = v4;
      if (v4 > 0xFF)
        goto LABEL_15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v2 = sub_1BEDD5B64(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
      v7 = *((_QWORD *)v2 + 2);
      v6 = *((_QWORD *)v2 + 3);
      if (v7 >= v6 >> 1)
        v2 = sub_1BEDD5B64((char *)(v6 > 1), v7 + 1, 1, v2);
      *((_QWORD *)v2 + 2) = v7 + 1;
      v2[v7 + 32] = v5;
      if (!--v3)
        goto LABEL_11;
    }
    __break(1u);
  }
  __break(1u);
LABEL_15:
  result = sub_1BEDE9B60();
  __break(1u);
  return result;
}

uint64_t sub_1BEDD66CC()
{
  return 1;
}

uint64_t _s24MessagesBlastDoorSupport17LiteTextAttributeO9hashValueSivg_0()
{
  sub_1BEDE9D58();
  sub_1BEDE9D64();
  return sub_1BEDE9D7C();
}

uint64_t sub_1BEDD6714()
{
  return sub_1BEDE9D64();
}

uint64_t sub_1BEDD6738()
{
  sub_1BEDE9D58();
  sub_1BEDE9D64();
  return sub_1BEDE9D7C();
}

uint64_t sub_1BEDD6774(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  uint64_t result;

  v2 = *v1;
  v3 = v1[1];
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 - v3;
  if (__OFSUB__(v4, v3))
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  if ((v5 - 0x1000000000000000) >> 61 != 7)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  v6 = v1[2];
  v7 = 8 * v5;
  v8 = __OFSUB__(v7, v6);
  v9 = v7 - v6;
  if (v8)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (v9 < a1)
  {
    sub_1BEDD6AA0();
    swift_allocError();
    swift_willThrow();
    return v10;
  }
  if (v6 < 1)
  {
    if (a1 <= 7)
    {
      if (a1 <= 0)
        return 0;
      if ((v3 & 0x8000000000000000) != 0)
        goto LABEL_51;
      v15 = 0;
LABEL_39:
      if (v3 < v4)
      {
        v20 = (unint64_t)*(unsigned __int8 *)(v2 + v3 + 32) >> (8 - a1);
        v21 = __CFADD__(v15, v20);
        v10 = v15 + v20;
        if (!v21)
        {
          v1[2] = a1;
          return v10;
        }
        goto LABEL_50;
      }
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
      goto LABEL_52;
    }
    if ((v3 & 0x8000000000000000) != 0)
    {
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    v17 = 0;
LABEL_30:
    v18 = *(_QWORD *)(v2 + 16);
    if (v3 < v18)
    {
      v10 = v17 | *(unsigned __int8 *)(v2 + 32 + v3);
      if ((unint64_t)(a1 - 8) < 8)
      {
        ++v3;
        a1 -= 8;
LABEL_36:
        v1[1] = v3;
LABEL_37:
        if (a1 < 1)
          return v10;
        v15 = v10 << a1;
        v4 = *(_QWORD *)(v2 + 16);
        goto LABEL_39;
      }
      while (1)
      {
        v19 = v3 + 1;
        if (v3 + 1 >= v18)
          break;
        v10 = *(unsigned __int8 *)(v2 + 33 + v3) | (v10 << 8);
        a1 -= 8;
        ++v3;
        if (a1 <= 15)
        {
          a1 -= 8;
          v3 = v19 + 1;
          goto LABEL_36;
        }
      }
    }
    __break(1u);
    goto LABEL_45;
  }
  v11 = v6 + a1;
  if (__OFADD__(v6, a1))
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  if (v11 > 7)
  {
    if (v3 >= v4)
    {
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
      goto LABEL_56;
    }
    v8 = __OFSUB__(a1, 8 - v6);
    a1 -= 8 - v6;
    if (v8)
    {
LABEL_56:
      __break(1u);
      goto LABEL_57;
    }
    if ((unint64_t)v6 >= 0x40)
      LOBYTE(v16) = 0;
    else
      v16 = 0xFFuLL >> v6;
    v10 = v16 & *(_BYTE *)(v2 + v3++ + 32);
    v1[1] = v3;
    v1[2] = 0;
    if (a1 < 8)
      goto LABEL_37;
    v17 = v10 << 8;
    goto LABEL_30;
  }
  if (v3 >= v4)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  v12 = 0xFFuLL >> v6;
  if ((unint64_t)v6 >= 0x40)
    LOBYTE(v12) = 0;
  v13 = 8 - v6;
  v8 = __OFSUB__(v13, a1);
  v14 = v13 - a1;
  if (v8)
    goto LABEL_55;
  if ((v14 & 0x8000000000000000) == 0)
  {
    v10 = (v12 & *(_BYTE *)(v2 + v3 + 32)) >> v14;
    if (v14 >= 0x40)
      v10 = 0;
    v1[2] = v11;
    return v10;
  }
LABEL_57:
  result = sub_1BEDE9B60();
  __break(1u);
  return result;
}

unint64_t sub_1BEDD69FC(uint64_t a1)
{
  uint64_t v1;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v3 = 0;
  v4 = 0;
  v5 = 0;
  while (1)
  {
    v6 = sub_1BEDD6774(1);
    if (v1)
      return v5;
    v7 = v6;
    result = sub_1BEDD6774(a1);
    v9 = result << v4;
    if ((unint64_t)v4 >= 0x40)
      v9 = 0;
    v10 = result >> v3;
    if ((unint64_t)v4 <= 0xFFFFFFFFFFFFFFC0)
      v10 = 0;
    if (v4 < 0)
      v9 = v10;
    v11 = (unint64_t)(v4 - 65) >= 0xFFFFFFFFFFFFFF7FLL ? v9 : 0;
    if (__OFADD__(v4, a1))
      break;
    v5 |= v11;
    v4 += a1;
    v3 -= a1;
    if (!v7)
      return v5;
  }
  __break(1u);
  return result;
}

unint64_t sub_1BEDD6AA0()
{
  unint64_t result;

  result = qword_1EF578498;
  if (!qword_1EF578498)
  {
    result = MEMORY[0x1C3B85BE0]("圬(d4", &type metadata for BitIteratorError);
    atomic_store(result, (unint64_t *)&qword_1EF578498);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BitIteratorError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BitIteratorError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1BEDD6B78 + 4 * asc_1BEDEAD60[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BEDD6B98 + 4 * byte_1BEDEAD65[v4]))();
}

_BYTE *sub_1BEDD6B78(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BEDD6B98(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BEDD6BA0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BEDD6BA8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BEDD6BB0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BEDD6BB8(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1BEDD6BC4()
{
  return 0;
}

ValueMetadata *type metadata accessor for BitIteratorError()
{
  return &type metadata for BitIteratorError;
}

unint64_t sub_1BEDD6BE0()
{
  unint64_t result;

  result = qword_1EF5784A0;
  if (!qword_1EF5784A0)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEADC4, &type metadata for BitIteratorError);
    atomic_store(result, (unint64_t *)&qword_1EF5784A0);
  }
  return result;
}

MessagesBlastDoorSupport::IncomingPushPayload::StorageContext __swiftcall IncomingPushPayload.StorageContext.init(rawValue:)(MessagesBlastDoorSupport::IncomingPushPayload::StorageContext rawValue)
{
  MessagesBlastDoorSupport::IncomingPushPayload::StorageContext *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

uint64_t IncomingPushPayload.StorageContext.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void static IncomingPushPayload.StorageContext.isFromStorage.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static IncomingPushPayload.StorageContext.isLastFromStorage.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

_QWORD *sub_1BEDD6C4C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1BEDD6C58()
{
  sub_1BEDD7CCC();
  return sub_1BEDE9980();
}

uint64_t sub_1BEDD6CB4()
{
  sub_1BEDD7CCC();
  return sub_1BEDE9974();
}

void sub_1BEDD6D00(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_1BEDD6D08@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_1BEDD6D1C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_1BEDD6D30@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1BEDD6D44(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_1BEDD6D74@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *sub_1BEDD6DA0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *sub_1BEDD6DC4(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_1BEDD6DD8(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_1BEDD6DEC(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_1BEDD6E00@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1BEDD6E14(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_1BEDD6E28(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_1BEDD6E3C(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_1BEDD6E50()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_1BEDD6E60()
{
  return sub_1BEDE9AAC();
}

_QWORD *sub_1BEDD6E78(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_1BEDD6E8C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1BEDD6E9C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_1BEDD6EA8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1BEDD6EC0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t IncomingPushPayload.messageGUID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  uint64_t v7;
  uint64_t v9;

  v3 = type metadata accessor for UUIDData();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEDD7ADC(v1, (uint64_t)v5, v6);
  v7 = sub_1BEDE9038();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, v5, v7);
}

uint64_t sub_1BEDD6FA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t (*v7)(_QWORD);
  uint64_t v8;
  uint64_t v10;

  v4 = type metadata accessor for UUIDData();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEDD7ADC(a1, (uint64_t)v6, v7);
  v8 = sub_1BEDE9038();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a2, v6, v8);
}

uint64_t sub_1BEDD7038(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_1BEDE9038();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 40))(a2, v7, v4);
}

uint64_t IncomingPushPayload.messageGUID.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1BEDE9038();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*IncomingPushPayload.messageGUID.modify())()
{
  return CGSizeMake;
}

uint64_t IncomingPushPayload.timestamp.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for IncomingPushPayload() + 20));
}

uint64_t type metadata accessor for IncomingPushPayload()
{
  uint64_t result;

  result = qword_1EF577D80;
  if (!qword_1EF577D80)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t IncomingPushPayload.timestamp.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;

  result = type metadata accessor for IncomingPushPayload();
  v6 = v2 + *(int *)(result + 20);
  *(_QWORD *)v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

double (*IncomingPushPayload.timestamp.modify())(double, double)
{
  type metadata accessor for IncomingPushPayload();
  return CGSizeMake;
}

uint64_t IncomingPushPayload.command.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for IncomingPushPayload() + 24));
}

uint64_t IncomingPushPayload.command.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for IncomingPushPayload();
  *(_BYTE *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

double (*IncomingPushPayload.command.modify())(double, double)
{
  type metadata accessor for IncomingPushPayload();
  return CGSizeMake;
}

uint64_t IncomingPushPayload.wantsDeliveryReceipt.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for IncomingPushPayload() + 28));
}

uint64_t IncomingPushPayload.wantsDeliveryReceipt.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for IncomingPushPayload();
  *(_BYTE *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

double (*IncomingPushPayload.wantsDeliveryReceipt.modify())(double, double)
{
  type metadata accessor for IncomingPushPayload();
  return CGSizeMake;
}

uint64_t IncomingPushPayload.wantsCheckpointing.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for IncomingPushPayload() + 32));
}

uint64_t IncomingPushPayload.wantsCheckpointing.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for IncomingPushPayload();
  *(_BYTE *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

double (*IncomingPushPayload.wantsCheckpointing.modify())(double, double)
{
  type metadata accessor for IncomingPushPayload();
  return CGSizeMake;
}

uint64_t IncomingPushPayload.storageContext.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;

  result = type metadata accessor for IncomingPushPayload();
  v4 = (uint64_t *)(v1 + *(int *)(result + 36));
  v5 = *v4;
  LOBYTE(v4) = *((_BYTE *)v4 + 8);
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = (_BYTE)v4;
  return result;
}

uint64_t IncomingPushPayload.storageContext.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t result;
  uint64_t v5;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  result = type metadata accessor for IncomingPushPayload();
  v5 = v1 + *(int *)(result + 36);
  *(_QWORD *)v5 = v2;
  *(_BYTE *)(v5 + 8) = v3;
  return result;
}

double (*IncomingPushPayload.storageContext.modify())(double, double)
{
  type metadata accessor for IncomingPushPayload();
  return CGSizeMake;
}

uint64_t IncomingPushPayload.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  _BYTE v13[16];
  uint64_t v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784A8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BEDD7630();
  sub_1BEDE9DAC();
  v20 = 0;
  type metadata accessor for UUIDData();
  sub_1BEDD7A14(&qword_1EF5784B0, (uint64_t)&protocol conformance descriptor for UUIDData);
  sub_1BEDE9CB0();
  if (!v2)
  {
    v9 = type metadata accessor for IncomingPushPayload();
    v19 = 1;
    sub_1BEDE9CBC();
    v18 = 2;
    sub_1BEDE9C8C();
    v17 = 3;
    sub_1BEDE9C68();
    v16 = 4;
    sub_1BEDE9C68();
    v10 = (uint64_t *)(v3 + *(int *)(v9 + 36));
    v11 = *v10;
    LOBYTE(v10) = *((_BYTE *)v10 + 8);
    v14 = v11;
    v15 = (char)v10;
    v13[15] = 5;
    sub_1BEDD7674();
    sub_1BEDE9C80();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1BEDD7630()
{
  unint64_t result;

  result = qword_1EF577D58;
  if (!qword_1EF577D58)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for IncomingPushPayload.CodingKeys, &type metadata for IncomingPushPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF577D58);
  }
  return result;
}

unint64_t sub_1BEDD7674()
{
  unint64_t result;

  result = qword_1EF5784B8;
  if (!qword_1EF5784B8)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for IncomingPushPayload.StorageContext, &type metadata for IncomingPushPayload.StorageContext);
    atomic_store(result, (unint64_t *)&qword_1EF5784B8);
  }
  return result;
}

uint64_t IncomingPushPayload.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t *v20;
  char v21;
  char v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;

  v28 = a2;
  v31 = type metadata accessor for UUIDData();
  MEMORY[0x1E0C80A78](v31);
  v32 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(qword_1EF577DB0);
  v30 = *(_QWORD *)(v34 - 8);
  MEMORY[0x1E0C80A78](v34);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for IncomingPushPayload();
  v7 = (int *)MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = &v9[v7[5]];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v29 = v7[7];
  v9[v29] = 2;
  v11 = v7[8];
  v9[v11] = 2;
  v12 = &v9[v7[9]];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  v13 = a1[3];
  v35 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_1BEDD7630();
  v33 = v5;
  v14 = v36;
  sub_1BEDE9D94();
  if (v14)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
  v36 = (uint64_t *)v10;
  v26 = v12;
  v27 = v11;
  v15 = v30;
  v44 = 0;
  sub_1BEDD7A14(&qword_1EF577D90, (uint64_t)&protocol conformance descriptor for UUIDData);
  v16 = (uint64_t)v32;
  v18 = v33;
  v17 = v34;
  sub_1BEDE9C2C();
  sub_1BEDD7A54(v16, (uint64_t)v9);
  v43 = 1;
  v9[*(int *)(v6 + 24)] = sub_1BEDE9C38();
  v42 = 2;
  v19 = sub_1BEDE9C08();
  v20 = v36;
  *v36 = v19;
  *((_BYTE *)v20 + 8) = v21 & 1;
  v41 = 3;
  v9[v29] = sub_1BEDE9BE4();
  v40 = 4;
  v9[v27] = sub_1BEDE9BE4();
  v39 = 5;
  sub_1BEDD7A98();
  sub_1BEDE9BFC();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v17);
  v23 = v38;
  v24 = v26;
  *(_QWORD *)v26 = v37;
  v24[8] = v23;
  sub_1BEDD7ADC((uint64_t)v9, v28, (uint64_t (*)(_QWORD))type metadata accessor for IncomingPushPayload);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
  return sub_1BEDD7B20((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for IncomingPushPayload);
}

uint64_t sub_1BEDD7A14(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for UUIDData();
    result = MEMORY[0x1C3B85BE0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BEDD7A54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UUIDData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1BEDD7A98()
{
  unint64_t result;

  result = qword_1EF577D70;
  if (!qword_1EF577D70)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for IncomingPushPayload.StorageContext, &type metadata for IncomingPushPayload.StorageContext);
    atomic_store(result, (unint64_t *)&qword_1EF577D70);
  }
  return result;
}

uint64_t sub_1BEDD7ADC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BEDD7B20(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BEDD7B5C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return IncomingPushPayload.init(from:)(a1, a2);
}

uint64_t sub_1BEDD7B70(_QWORD *a1)
{
  return IncomingPushPayload.encode(to:)(a1);
}

MessagesBlastDoorSupport::IncomingPushPayload::CodingKeys_optional __swiftcall IncomingPushPayload.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  MessagesBlastDoorSupport::IncomingPushPayload::CodingKeys_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1BEDE9BB4();
  result.value = swift_bridgeObjectRelease();
  v5 = 6;
  if (v3 < 6)
    v5 = v3;
  *v2 = v5;
  return result;
}

MessagesBlastDoorSupport::IncomingPushPayload::CodingKeys_optional __swiftcall IncomingPushPayload.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  _BYTE *v1;
  _BYTE *v2;
  MessagesBlastDoorSupport::IncomingPushPayload::CodingKeys_optional result;
  char v4;

  v2 = v1;
  result.value = IncomingPushPayload.CodingKeys.init(rawValue:)(stringValue).value;
  *v2 = v4;
  return result;
}

MessagesBlastDoorSupport::IncomingPushPayload::CodingKeys_optional __swiftcall IncomingPushPayload.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  _BYTE *v1;

  *v1 = 6;
  return (MessagesBlastDoorSupport::IncomingPushPayload::CodingKeys_optional)intValue;
}

uint64_t IncomingPushPayload.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t IncomingPushPayload.CodingKeys.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BEDD7C4C + 4 * byte_1BEDEAE30[*v0]))(85, 0xE100000000000000);
}

uint64_t sub_1BEDD7C4C()
{
  return 99;
}

uint64_t sub_1BEDD7C54()
{
  return 101;
}

uint64_t sub_1BEDD7C5C()
{
  return 68;
}

uint64_t sub_1BEDD7C64()
{
  return 25453;
}

uint64_t sub_1BEDD7C70()
{
  return 72;
}

uint64_t IncomingPushPayload.CodingKeys.stringValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BEDD7C9C + 4 * byte_1BEDEAE36[*v0]))(85, 0xE100000000000000);
}

uint64_t sub_1BEDD7C9C()
{
  return 99;
}

uint64_t sub_1BEDD7CA4()
{
  return 101;
}

uint64_t sub_1BEDD7CAC()
{
  return 68;
}

uint64_t sub_1BEDD7CB4()
{
  return 25453;
}

uint64_t sub_1BEDD7CC0()
{
  return 72;
}

unint64_t sub_1BEDD7CCC()
{
  unint64_t result;

  result = qword_1EF5784C0;
  if (!qword_1EF5784C0)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for IncomingPushPayload.StorageContext, &type metadata for IncomingPushPayload.StorageContext);
    atomic_store(result, (unint64_t *)&qword_1EF5784C0);
  }
  return result;
}

unint64_t sub_1BEDD7D14()
{
  unint64_t result;

  result = qword_1EF5784C8;
  if (!qword_1EF5784C8)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for IncomingPushPayload.StorageContext, &type metadata for IncomingPushPayload.StorageContext);
    atomic_store(result, (unint64_t *)&qword_1EF5784C8);
  }
  return result;
}

unint64_t sub_1BEDD7D5C()
{
  unint64_t result;

  result = qword_1EF5784D0;
  if (!qword_1EF5784D0)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for IncomingPushPayload.StorageContext, &type metadata for IncomingPushPayload.StorageContext);
    atomic_store(result, (unint64_t *)&qword_1EF5784D0);
  }
  return result;
}

unint64_t sub_1BEDD7DA4()
{
  unint64_t result;

  result = qword_1EF5784D8;
  if (!qword_1EF5784D8)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for IncomingPushPayload.StorageContext, &type metadata for IncomingPushPayload.StorageContext);
    atomic_store(result, (unint64_t *)&qword_1EF5784D8);
  }
  return result;
}

void sub_1BEDD7DE8(char *a1)
{
  sub_1BEDE6E04(*a1);
}

unint64_t sub_1BEDD7DF8()
{
  unint64_t result;

  result = qword_1EF5784E0;
  if (!qword_1EF5784E0)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for IncomingPushPayload.CodingKeys, &type metadata for IncomingPushPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5784E0);
  }
  return result;
}

void sub_1BEDD7E3C()
{
  char *v0;

  sub_1BEDE5C00(*v0);
}

void sub_1BEDD7E44()
{
  __asm { BR              X10 }
}

uint64_t sub_1BEDD7E74()
{
  sub_1BEDE98FC();
  return swift_bridgeObjectRelease();
}

void sub_1BEDD7EB4(uint64_t a1)
{
  char *v1;

  sub_1BEDE5E98(a1, *v1);
}

MessagesBlastDoorSupport::IncomingPushPayload::CodingKeys_optional sub_1BEDD7EBC(Swift::String *a1)
{
  return IncomingPushPayload.CodingKeys.init(rawValue:)(*a1);
}

uint64_t sub_1BEDD7EC8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1BEDD7EEC + 4 * byte_1BEDEAE42[*v0]))();
}

void sub_1BEDD7EEC(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 99;
  a1[1] = v1;
}

void sub_1BEDD7EF8(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 101;
  a1[1] = v1;
}

void sub_1BEDD7F04(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 68;
  a1[1] = v1;
}

void sub_1BEDD7F10(_QWORD *a1@<X8>)
{
  *a1 = 25453;
  a1[1] = 0xE200000000000000;
}

void sub_1BEDD7F20(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 72;
  a1[1] = v1;
}

unint64_t sub_1BEDD7F30()
{
  unint64_t result;

  result = qword_1EF577D68;
  if (!qword_1EF577D68)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for IncomingPushPayload.CodingKeys, &type metadata for IncomingPushPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF577D68);
  }
  return result;
}

unint64_t sub_1BEDD7F78()
{
  unint64_t result;

  result = qword_1EF577D60;
  if (!qword_1EF577D60)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for IncomingPushPayload.CodingKeys, &type metadata for IncomingPushPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF577D60);
  }
  return result;
}

uint64_t sub_1BEDD7FBC()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1BEDD7FE0 + 4 * byte_1BEDEAE48[*v0]))(85, 0xE100000000000000);
}

uint64_t sub_1BEDD7FE0()
{
  return 99;
}

uint64_t sub_1BEDD7FE8()
{
  return 101;
}

uint64_t sub_1BEDD7FF0()
{
  return 68;
}

uint64_t sub_1BEDD7FF8()
{
  return 25453;
}

uint64_t sub_1BEDD8004()
{
  return 72;
}

MessagesBlastDoorSupport::IncomingPushPayload::CodingKeys_optional sub_1BEDD800C@<W0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  MessagesBlastDoorSupport::IncomingPushPayload::CodingKeys_optional result;
  char v5;

  result.value = IncomingPushPayload.CodingKeys.init(rawValue:)(*(Swift::String *)&a1).value;
  *a2 = v5;
  return result;
}

uint64_t sub_1BEDD8040()
{
  return 0;
}

void sub_1BEDD804C(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_1BEDD8058()
{
  sub_1BEDD7630();
  return sub_1BEDE9DB8();
}

uint64_t sub_1BEDD8080()
{
  sub_1BEDD7630();
  return sub_1BEDE9DC4();
}

_QWORD *initializeBufferWithCopyOfBuffer for IncomingPushPayload(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1BEDE9038();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (char *)a1 + v8;
    v11 = (char *)a2 + v8;
    *(_QWORD *)v10 = *(_QWORD *)v11;
    v10[8] = v11[8];
    *((_BYTE *)a1 + v9) = *((_BYTE *)a2 + v9);
    v12 = a3[8];
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *((_BYTE *)a1 + v12) = *((_BYTE *)a2 + v12);
    v13 = a3[9];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    *(_QWORD *)v14 = *(_QWORD *)v15;
    v14[8] = v15[8];
  }
  return a1;
}

uint64_t destroy for UUIDData(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1BEDE9038();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for IncomingPushPayload(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = a1 + v7;
  v10 = a2 + v7;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  v11 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  v12 = a3[9];
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  return a1;
}

uint64_t assignWithCopy for IncomingPushPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  *(_BYTE *)(v8 + 8) = *((_BYTE *)v9 + 8);
  *(_QWORD *)v8 = v10;
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  v11 = a3[9];
  v12 = a1 + v11;
  v13 = a2 + v11;
  LOBYTE(v10) = *(_BYTE *)(v13 + 8);
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = v10;
  return a1;
}

uint64_t initializeWithTake for IncomingPushPayload(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = a1 + v7;
  v10 = a2 + v7;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  v11 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  v12 = a3[9];
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  return a1;
}

uint64_t assignWithTake for IncomingPushPayload(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = a1 + v7;
  v10 = a2 + v7;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  v11 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  v12 = a3[9];
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for IncomingPushPayload()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BEDD8458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;
  int v10;

  v6 = type metadata accessor for UUIDData();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 28));
  if (v9 >= 2)
    v10 = ((v9 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v10 = -2;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for IncomingPushPayload()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BEDD84FC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UUIDData();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 28)) = a2 + 2;
  return result;
}

uint64_t sub_1BEDD8574()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BEDE9038();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for IncomingPushPayload.StorageContext()
{
  return &type metadata for IncomingPushPayload.StorageContext;
}

uint64_t getEnumTagSinglePayload for IncomingPushPayload.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for IncomingPushPayload.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BEDD86EC + 4 * byte_1BEDEAE53[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1BEDD8720 + 4 * byte_1BEDEAE4E[v4]))();
}

uint64_t sub_1BEDD8720(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDD8728(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BEDD8730);
  return result;
}

uint64_t sub_1BEDD873C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BEDD8744);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1BEDD8748(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDD8750(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IncomingPushPayload.CodingKeys()
{
  return &type metadata for IncomingPushPayload.CodingKeys;
}

unint64_t LiteTextMessageUnpacker.unpack(from:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t result;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t);
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  unint64_t v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(char *, char *, uint64_t);
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(char *, uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  char *v92;
  char *v93;
  char *v94;
  char *v95;
  char *v96;
  uint64_t v97;
  char *v98;
  char *v99;
  char *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  _QWORD v116[4];
  _QWORD v117[3];
  uint64_t v118;

  v111 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784E8);
  MEMORY[0x1E0C80A78](v5);
  v100 = (char *)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = sub_1BEDE9038();
  v115 = *(_QWORD *)(v112 - 8);
  MEMORY[0x1E0C80A78](v112);
  v99 = (char *)&v88 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BEDE92C0();
  v109 = *(_QWORD *)(v8 - 8);
  v110 = v8;
  MEMORY[0x1E0C80A78](v8);
  v101 = (char *)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = type metadata accessor for LiteAcknowledgmentMessageContent(0);
  MEMORY[0x1E0C80A78](v97);
  v105 = (char *)&v88 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v103 = type metadata accessor for LiteReplyMessageContent(0);
  MEMORY[0x1E0C80A78](v103);
  v114 = (char *)&v88 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F0);
  v13 = MEMORY[0x1E0C80A78](v12);
  v98 = (char *)&v88 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v13);
  v94 = (char *)&v88 - v16;
  v17 = MEMORY[0x1E0C80A78](v15);
  v104 = (char *)&v88 - v18;
  MEMORY[0x1E0C80A78](v17);
  v108 = (char *)&v88 - v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF577D38);
  v21 = MEMORY[0x1E0C80A78](v20);
  v95 = (char *)&v88 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x1E0C80A78](v21);
  v93 = (char *)&v88 - v24;
  v25 = MEMORY[0x1E0C80A78](v23);
  v102 = (char *)&v88 - v26;
  MEMORY[0x1E0C80A78](v25);
  v107 = (char *)&v88 - v27;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
  v29 = MEMORY[0x1E0C80A78](v28);
  v96 = (char *)&v88 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = MEMORY[0x1E0C80A78](v29);
  v92 = (char *)&v88 - v32;
  v33 = MEMORY[0x1E0C80A78](v31);
  v113 = (char *)&v88 - v34;
  MEMORY[0x1E0C80A78](v33);
  v106 = (uint64_t)&v88 - v35;
  v36 = type metadata accessor for LiteTextMessageContent(0);
  MEMORY[0x1E0C80A78](v36);
  v38 = (uint64_t *)((char *)&v88 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0));
  v39 = sub_1BEDE947C();
  v40 = *(_QWORD *)(v39 - 8);
  v41 = MEMORY[0x1E0C80A78](v39);
  v43 = (char *)&v88 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v41);
  v45 = (char *)&v88 - v44;
  sub_1BEDBB398(a1, a2);
  sub_1BEDD91D8(a1, a2);
  v47 = v46;
  sub_1BEDBB354(a1, a2);
  v117[1] = 0;
  v117[2] = 0;
  v117[0] = v47;
  v48 = v118;
  result = sub_1BEDD69FC(3);
  if (v48)
    return swift_bridgeObjectRelease();
  v88 = v36;
  v50 = (uint64_t)v113;
  v89 = v43;
  v91 = 0;
  v51 = v114;
  v52 = v115;
  v90 = v45;
  v118 = v39;
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v53 = v90;
    sub_1BEDE9470();
    v54 = v40;
    v55 = v89;
    v56 = v118;
    (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v89, v53, v118);
    v57 = (*(uint64_t (**)(char *, uint64_t))(v40 + 88))(v55, v56);
    if (v57 == *MEMORY[0x1E0D02C98])
    {
      v58 = v91;
      sub_1BEDE4858(v38);
      if (!v58)
      {
        swift_bridgeObjectRelease();
        sub_1BEDD9340((uint64_t)v38 + *(int *)(v88 + 20), v106);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v52 + 56))(v107, 1, 1, v112);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v109 + 56))(v108, 1, 1, v110);
        swift_bridgeObjectRetain();
        sub_1BEDE9494();
        v59 = type metadata accessor for LiteTextMessageContent;
        v60 = (uint64_t)v38;
LABEL_16:
        sub_1BEDD7B20(v60, v59);
        return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v53, v118);
      }
LABEL_8:
      (*(void (**)(char *, uint64_t))(v40 + 8))(v53, v56);
      return swift_bridgeObjectRelease();
    }
    if (v57 == *MEMORY[0x1E0D02CA0])
    {
      v61 = v91;
      sub_1BEDE4998(v51);
      if (!v61)
      {
        v69 = v52;
        swift_bridgeObjectRelease();
        v70 = *(int *)(v103 + 24);
        v91 = 0;
        sub_1BEDD9340((uint64_t)&v51[v70], v50);
        v71 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
        v72 = v102;
        v73 = v112;
        v71(v102, v51, v112);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v69 + 56))(v72, 0, 1, v73);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v109 + 56))(v104, 1, 1, v110);
        swift_bridgeObjectRetain();
        sub_1BEDE9494();
        v59 = type metadata accessor for LiteReplyMessageContent;
        v60 = (uint64_t)v51;
        goto LABEL_16;
      }
      goto LABEL_8;
    }
    if (v57 == *MEMORY[0x1E0D02C88])
    {
      v62 = v105;
      v63 = v91;
      sub_1BEDE4C60((uint64_t)v117, v105);
      if (v63)
      {
        (*(void (**)(char *, uint64_t))(v40 + 8))(v90, v56);
        return swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v99, &v62[*(int *)(v97 + 20)], v112);
        v74 = sub_1BEDE92A8();
        v75 = *(_QWORD *)(v74 - 8);
        v76 = v100;
        (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v100, v62, v74);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v75 + 56))(v76, 0, 1, v74);
        swift_bridgeObjectRetain();
        v77 = v101;
        sub_1BEDE92B4();
        v83 = sub_1BEDE94AC();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v83 - 8) + 56))(v92, 1, 1, v83);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v52 + 56))(v93, 1, 1, v112);
        v85 = v109;
        v84 = v110;
        v86 = v94;
        (*(void (**)(char *, char *, uint64_t))(v109 + 16))(v94, v77, v110);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v85 + 56))(v86, 0, 1, v84);
        sub_1BEDE9494();
        v87 = v118;
        (*(void (**)(char *, uint64_t))(v85 + 8))(v77, v84);
        sub_1BEDD7B20((uint64_t)v62, type metadata accessor for LiteAcknowledgmentMessageContent);
        return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v90, v87);
      }
    }
    else
    {
      v64 = v91;
      v65 = sub_1BEDBACAC();
      if (v64)
      {
        v67 = *(void (**)(char *, uint64_t))(v40 + 8);
        v68 = v118;
        v67(v53, v118);
        swift_bridgeObjectRelease();
        return ((uint64_t (*)(char *, uint64_t))v67)(v89, v68);
      }
      else
      {
        v78 = HIBYTE(v66) & 0xF;
        v116[0] = v65;
        v116[1] = v66;
        if ((v66 & 0x2000000000000000) == 0)
          v78 = (unint64_t)v65 & 0xFFFFFFFFFFFFLL;
        v116[2] = 0;
        v116[3] = v78;
        swift_bridgeObjectRetain();
        v79 = sub_1BEDDE1BC((uint64_t)v116);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        Array<A>.spansAsPlainText.getter(v79);
        swift_bridgeObjectRelease();
        v80 = sub_1BEDE94AC();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v80 - 8) + 56))(v96, 1, 1, v80);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v52 + 56))(v95, 1, 1, v112);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v109 + 56))(v98, 1, 1, v110);
        sub_1BEDE9494();
        v81 = *(void (**)(char *, uint64_t))(v40 + 8);
        v82 = v118;
        v81(v90, v118);
        return ((uint64_t (*)(char *, uint64_t))v81)(v89, v82);
      }
    }
  }
  return result;
}

unint64_t sub_1BEDD91C4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return LiteTextMessageUnpacker.unpack(from:)(a1, a2, a3);
}

void sub_1BEDD91D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = sub_1BEDE8FFC();
  MEMORY[0x1E0C80A78](v3);
  __asm { BR              X10 }
}

_QWORD *sub_1BEDD9254()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;

  if (BYTE6(v0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5783D8);
    v4 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v4);
    v4[2] = BYTE6(v0);
    v4[3] = 2 * v6 - 64;
    sub_1BEDBB398(v2, v0);
    v7 = sub_1BEDE8FC0();
    sub_1BEDBB354(v2, v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
    if (v7 != BYTE6(v0))
    {
      __break(1u);
      JUMPOUT(0x1BEDD9328);
    }
  }
  return v4;
}

uint64_t sub_1BEDD9340(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1BEDD938C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF5782E8;
  if (!qword_1EF5782E8)
  {
    v1 = sub_1BEDE94B8();
    result = MEMORY[0x1C3B85BE0](MEMORY[0x1E0D02CD8], v1);
    atomic_store(result, (unint64_t *)&qword_1EF5782E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteTextMessageUnpacker()
{
  return &type metadata for LiteTextMessageUnpacker;
}

uint64_t Data._imOptionallyDecompress()()
{
  void *v0;
  id v1;
  uint64_t v2;

  v0 = (void *)sub_1BEDE8FE4();
  v1 = objc_msgSend(v0, sel__imOptionallyDecompressData);

  v2 = sub_1BEDE8FF0();
  return v2;
}

uint64_t LiteMessageCompressor.decode(_:codecID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t *v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;

  v6 = *v3;
  if (!(v6 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
      goto LABEL_3;
LABEL_21:
    swift_bridgeObjectRelease();
    return v7;
  }
LABEL_20:
  swift_bridgeObjectRetain();
  v7 = sub_1BEDE9B78();
  if (!v7)
    goto LABEL_21;
LABEL_3:
  if ((v6 & 0xC000000000000001) != 0)
    goto LABEL_24;
  if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    JUMPOUT(0x1BEDD9A84);
  }
  swift_retain();
LABEL_6:
  if (cosl_codec_get_id() == a3)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    __asm { BR              X9 }
  }
  swift_release();
  if (v7 != 1)
  {
    v8 = 5;
    do
    {
      v9 = v8 - 4;
      if ((v6 & 0xC000000000000001) != 0)
      {
        MEMORY[0x1C3B853B8](v8 - 4, v6);
        v10 = __OFADD__(v9, 1);
        v11 = v8 - 3;
        if (v10)
          goto LABEL_19;
      }
      else
      {
        if (v9 >= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_24:
          MEMORY[0x1C3B853B8](0, v6);
          goto LABEL_6;
        }
        swift_retain();
        v10 = __OFADD__(v9, 1);
        v11 = v8 - 3;
        if (v10)
        {
LABEL_19:
          __break(1u);
          goto LABEL_20;
        }
      }
      if (cosl_codec_get_id() == a3)
        goto LABEL_7;
      swift_release();
      ++v8;
    }
    while (v11 != v7);
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1BEDD9B14()
{
  uint64_t v0;

  v0 = sub_1BEDE911C();
  __swift_allocate_value_buffer(v0, qword_1EF578500);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF578500);
  return sub_1BEDE9110();
}

uint64_t sub_1BEDD9B94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = cosl_codec_map();
  *a1 = result;
  return result;
}

uint64_t sub_1BEDD9BC0()
{
  cosl_codec_unmap();
  return swift_deallocClassInstance();
}

uint64_t sub_1BEDD9BE4()
{
  uint64_t decoded_size;
  unint64_t v1;
  uint64_t v3;
  unint64_t v4;

  decoded_size = cosl_codec_get_decoded_size();
  v3 = sub_1BEDDC340(decoded_size);
  v4 = v1;
  sub_1BEDDBCA8((uint64_t)&v3);
  swift_retain();
  sub_1BEDDB864((uint64_t)&v3);
  return sub_1BEDBB354(v3, v4);
}

uint64_t sub_1BEDD9C98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X5>, __int128 *a7@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];

  v10 = *(_QWORD *)(a3 + 16);
  if (a1)
    v11 = a2 - a1;
  else
    v11 = 0;
  if (a4)
    v12 = a5 - a4;
  else
    v12 = 0;
  result = a6(v10, a1, v11, a4, v12);
  if (!result)
  {
    v17 = xmmword_1BEDEB2F0;
    goto LABEL_11;
  }
  v14 = result;
  if ((result & 0x8000000000000000) == 0)
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578528);
    v19[3] = v15;
    v19[4] = sub_1BEDDC40C();
    v16 = (_QWORD *)swift_allocObject();
    v19[0] = v16;
    v16[2] = 0;
    v16[3] = v14;
    v16[4] = a1;
    v16[5] = a2;
    __swift_project_boxed_opaque_existential_1(v19, v15);
    sub_1BEDE9D40();
    result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    v17 = v18;
LABEL_11:
    *a7 = v17;
    return result;
  }
  __break(1u);
  return result;
}

void sub_1BEDD9DB8()
{
  off_1EF578518 = &unk_1E78B2B28;
}

MessagesBlastDoorSupport::LiteMessageCompressor __swiftcall LiteMessageCompressor.init()()
{
  _QWORD *v0;
  _QWORD *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  MessagesBlastDoorSupport::LiteMessageCompressor result;
  uint64_t v8[2];
  uint64_t v9;
  uint64_t v10;

  v1 = v0;
  if (qword_1EF578190 != -1)
    result.codecs._rawValue = (void *)swift_once();
  v2 = (char *)off_1EF578518;
  v3 = *((_QWORD *)off_1EF578518 + 2);
  v4 = MEMORY[0x1E0DEE9D8];
  if (v3)
  {
    v10 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1BEDE9B30();
    v5 = (uint64_t *)(v2 + 40);
    do
    {
      v6 = *v5;
      v8[0] = *(v5 - 1);
      v8[1] = v6;
      swift_bridgeObjectRetain();
      sub_1BEDD9EF0(v8, &v9);
      swift_bridgeObjectRelease();
      v5 += 2;
      sub_1BEDE9B18();
      sub_1BEDE9B3C();
      sub_1BEDE9B48();
      sub_1BEDE9B24();
      --v3;
    }
    while (v3);
    v4 = v10;
    result.codecs._rawValue = (void *)swift_bridgeObjectRelease();
  }
  *v1 = v4;
  return result;
}

uint64_t sub_1BEDD9EF0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjCClassFromMetadata;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void (*v21)(char *, char *, uint64_t);
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t result;
  uint64_t v32;
  _QWORD v33[2];
  uint64_t *v34;
  char *v35;
  char *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v34 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FB8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BEDE8F9C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v36 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)v33 - v11;
  MEMORY[0x1E0C80A78](v10);
  v35 = (char *)v33 - v13;
  v14 = *a1;
  v15 = a1[1];
  type metadata accessor for LiteMessageCompressor.Codec();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v17 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v33[0] = v15;
  v33[1] = v14;
  v18 = (void *)sub_1BEDE989C();
  v19 = (void *)sub_1BEDE989C();
  v20 = objc_msgSend(v17, sel_URLForResource_withExtension_, v18, v19);

  if (!v20)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    goto LABEL_14;
  }
  sub_1BEDE8F78();

  v21 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v21(v5, v12, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
LABEL_14:
    sub_1BEDDC478((uint64_t)v5);
    v37 = 0;
    v38 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_1BEDE9AD0();
    swift_bridgeObjectRelease();
    v37 = 0xD000000000000015;
    v38 = 0x80000001BEDEDAB0;
    sub_1BEDE992C();
    result = sub_1BEDE9B6C();
    __break(1u);
    return result;
  }
  v22 = v35;
  v21(v35, v5, v6);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v36, v22, v6);
  v23 = swift_allocObject();
  v24 = sub_1BEDE8F84();
  v26 = v24;
  v27 = v25;
  if ((v25 & 0x1000000000000000) != 0 || !(v25 & 0x2000000000000000 | v24 & 0x1000000000000000))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578538);
    sub_1BEDE9AC4();
    swift_bridgeObjectRelease();
    v28 = v34;
  }
  else
  {
    MEMORY[0x1E0C80A78](v24);
    v28 = v34;
    if ((v27 & 0x2000000000000000) != 0)
    {
      v37 = v26;
      v38 = v27 & 0xFFFFFFFFFFFFFFLL;
      v39 = cosl_codec_map();
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v26 & 0x1000000000000000) != 0)
      {
        ((void (*)(unint64_t *__return_ptr, uint64_t))sub_1BEDD9B94)(&v37, (v27 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else
      {
        v32 = sub_1BEDE9B0C();
        ((void (*)(unint64_t *__return_ptr, uint64_t))sub_1BEDD9B94)(&v37, v32);
      }
      v39 = v37;
      swift_bridgeObjectRelease();
    }
  }
  v29 = v39;
  v30 = *(void (**)(char *, uint64_t))(v7 + 8);
  v30(v36, v6);
  *(_QWORD *)(v23 + 16) = v29;
  result = ((uint64_t (*)(char *, uint64_t))v30)(v35, v6);
  *v28 = v23;
  return result;
}

uint64_t LiteMessageCompressor.encode(_:)(uint64_t a1, uint64_t a2)
{
  unint64_t *v2;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16[4];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = *v2;
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain_n();
    v6 = sub_1BEDE9B78();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      if ((v4 & 0xC000000000000001) != 0)
        MEMORY[0x1C3B853B8](0, v4);
      else
        swift_retain();
      __asm { BR              X8 }
    }
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
      goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  if (qword_1EF578188 != -1)
    swift_once();
  v7 = sub_1BEDE911C();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EF578500);
  v8 = sub_1BEDE9104();
  v9 = sub_1BEDE99E0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v16[0] = v11;
    *(_DWORD *)v10 = 136315138;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v12 = sub_1BEDE9890();
    v14 = v13;
    swift_bridgeObjectRelease();
    sub_1BEDCCA90(v12, v14, v16);
    sub_1BEDE9A88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BEDB7000, v8, v9, "Did not compress data, no results were better than original size (all results: %s)", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B85C64](v11, -1, -1);
    MEMORY[0x1C3B85C64](v10, -1, -1);
  }

  swift_bridgeObjectRelease();
  return 0;
}

MessagesBlastDoorSupport::LiteMessageCompressor sub_1BEDDB858()
{
  return LiteMessageCompressor.init()();
}

void sub_1BEDDB864(uint64_t a1)
{
  __asm { BR              X12 }
}

uint64_t sub_1BEDDB8CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  unsigned int v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;

  v14 = v1;
  LOWORD(v15) = a1;
  BYTE2(v15) = BYTE2(a1);
  HIBYTE(v15) = BYTE3(a1);
  v16 = BYTE4(a1);
  v17 = BYTE5(a1);
  v18 = BYTE6(a1);
  sub_1BEDD9C98((uint64_t)&v14, (uint64_t)&v14 + BYTE6(a1), v2, v6, v5, v3, v7);
  v8 = v14;
  v9 = v15;
  v10 = v16;
  v11 = v17;
  v12 = v18;
  result = swift_release();
  *v4 = v8;
  v4[1] = v9 | (v10 << 32) | (v11 << 40) | (v12 << 48);
  return result;
}

uint64_t sub_1BEDDBB00@<X0>(int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X4>, __int128 *a6@<X8>)
{
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 *v20;
  uint64_t v21;

  result = sub_1BEDE8FB4();
  v14 = *a1;
  v13 = a1[1];
  if ((int)v13 < (int)v14)
  {
    __break(1u);
    goto LABEL_9;
  }
  v20 = a6;
  v21 = a3;
  result = sub_1BEDE8EDC();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v15 = result;
  result = sub_1BEDE8F00();
  v16 = v14 - result;
  if (__OFSUB__(v14, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v17 = v13 - v14;
  v18 = sub_1BEDE8EF4();
  if (v18 >= v17)
    v19 = v17;
  else
    v19 = v18;
  sub_1BEDD9C98(v15 + v16, v15 + v16 + v19, a2, v21, a4, a5, v20);
  return swift_release();
}

uint64_t sub_1BEDDBBE0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_1BEDE8EDC();
  if (!result || (result = sub_1BEDE8F00(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_1BEDE8EF4();
      sub_1BEDD9BE4();
      return swift_release();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_1BEDDBCA8(uint64_t a1)
{
  __asm { BR              X13 }
}

void *sub_1BEDDBD04(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t __b, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  int v27;
  void *result;
  unint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;

  v30 = v25;
  LOWORD(v31) = v24;
  BYTE2(v31) = BYTE2(v24);
  HIBYTE(v31) = BYTE3(v24);
  v32 = BYTE4(v24);
  v33 = BYTE5(v24);
  v34 = BYTE6(v24);
  result = memset(&v30, v27, BYTE6(v24));
  v29 = v31 | ((unint64_t)v32 << 32) | ((unint64_t)v33 << 40) | ((unint64_t)v34 << 48);
  *v26 = v30;
  v26[1] = v29;
  return result;
}

char *sub_1BEDDBE90(int *a1, int a2)
{
  char *result;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  size_t v11;

  result = (char *)sub_1BEDE8FB4();
  v5 = *a1;
  v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  result = (char *)sub_1BEDE8EDC();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v7 = result;
  result = (char *)sub_1BEDE8F00();
  v8 = v5 - (_QWORD)result;
  if (__OFSUB__(v5, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v9 = v6 - v5;
  v10 = sub_1BEDE8EF4();
  if (v10 >= v9)
    v11 = v9;
  else
    v11 = v10;
  return (char *)memset(&v7[v8], a2, v11);
}

uint64_t sub_1BEDDBF10(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  char v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578520);
  result = sub_1BEDE9B90();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v35 = a2;
    v34 = v3;
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v32 = -1 << v10;
    v33 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v18 = v17 | (v8 << 6);
      }
      else
      {
        v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13)
          goto LABEL_31;
        v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          v8 = v19 + 1;
          if (v19 + 1 >= v13)
            goto LABEL_31;
          v20 = v9[v8];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v35 & 1) == 0)
              {
                result = swift_release();
                v3 = v34;
                goto LABEL_38;
              }
              if (v33 >= 64)
                bzero((void *)(v5 + 64), 8 * v13);
              else
                *v9 = v32;
              v3 = v34;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                v8 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_40;
                if (v8 >= v13)
                  goto LABEL_31;
                v20 = v9[v8];
                ++v21;
                if (v20)
                  goto LABEL_21;
              }
            }
            v8 = v21;
          }
        }
LABEL_21:
        v12 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      v22 = 8 * v18;
      v23 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v22);
      v24 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v22);
      result = sub_1BEDE9D4C();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = 8 * v15;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v16) = v23;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v16) = v24;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

void *sub_1BEDDC1B4()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578520);
  v2 = *v0;
  v3 = sub_1BEDE9B84();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v21 = __clz(__rbit64(v19));
    v12 = (v19 - 1) & v19;
    v15 = v21 + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1BEDDC340(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_1BEDE8F0C();
      swift_allocObject();
      sub_1BEDE8EE8();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1BEDE8FD8();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteMessageCompressor()
{
  return &type metadata for LiteMessageCompressor;
}

uint64_t type metadata accessor for LiteMessageCompressor.Codec()
{
  return objc_opt_self();
}

unint64_t sub_1BEDDC40C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1EF578530;
  if (!qword_1EF578530)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF578528);
    v2 = MEMORY[0x1E0CB23F0];
    result = MEMORY[0x1C3B85BE0](MEMORY[0x1E0CB26B0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EF578530);
  }
  return result;
}

uint64_t sub_1BEDDC468()
{
  return swift_deallocObject();
}

uint64_t sub_1BEDDC478(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
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

uint64_t LiteTextParser.parse(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];

  v2 = HIBYTE(a2) & 0xF;
  v5[0] = a1;
  v5[1] = a2;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  v5[2] = 0;
  v5[3] = v2;
  swift_bridgeObjectRetain();
  v3 = sub_1BEDDE1BC((uint64_t)v5);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t Array<A>.spansAsPlainText.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t i;
  unint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  swift_bridgeObjectRetain();
  for (i = 0; i != v1; ++i)
  {
    v4 = *(_QWORD *)(a1 + 8 * i + 32);
    if (v4 >> 62)
    {
      if (v4 >> 62 != 1)
      {
        v5 = *(_QWORD *)(v4 + 16);
        swift_retain();
        Array<A>.spansAsPlainText.getter(v5);
        sub_1BEDE992C();
        swift_release();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_retain();
      sub_1BEDE992C();
      swift_release();
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t static LiteTextMarker.== infix(_:_:)()
{
  return 1;
}

uint64_t static LiteTextAttribute.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_1BEDDC654(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = (unint64_t *)(a1 + 32);
    v4 = (unint64_t *)(a2 + 32);
    do
    {
      v6 = *v3++;
      v5 = v6;
      v8 = *v4++;
      v7 = v8;
      v9 = v8 >> 62;
      if (v5 >> 62)
      {
        if (v5 >> 62 == 1)
        {
          if (v9 != 1)
            return 0;
        }
        else
        {
          if (v9 != 2)
            return 0;
          v10 = *(_QWORD *)(v5 + 16);
          v11 = *(_QWORD *)(v7 + 16);
          swift_retain_n();
          swift_retain_n();
          LOBYTE(v10) = sub_1BEDDC654(v10, v11);
          swift_release_n();
          swift_release_n();
          if ((v10 & 1) == 0)
            return 0;
        }
      }
      else
      {
        if (v9)
          return 0;
        v12 = *(_QWORD *)(v5 + 16) == *(_QWORD *)(v7 + 16) && *(_QWORD *)(v5 + 24) == *(_QWORD *)(v7 + 24);
        if (!v12 && (sub_1BEDE9CD4() & 1) == 0)
          return 0;
      }
      --v2;
    }
    while (v2);
  }
  return 1;
}

BOOL sub_1BEDDC768(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1BEDDC780()
{
  _BYTE *v0;

  if (*v0)
    return 12639;
  else
    return 12383;
}

uint64_t sub_1BEDDC79C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BEDDFEB4(a1, a2);
  *a3 = result;
  return result;
}

void sub_1BEDDC7C0(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1BEDDC7CC()
{
  sub_1BEDDEEC0();
  return sub_1BEDE9DB8();
}

uint64_t sub_1BEDDC7F4()
{
  sub_1BEDDEEC0();
  return sub_1BEDE9DC4();
}

uint64_t sub_1BEDDC81C()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x72656B72616DLL;
  if (*v0 != 1)
    v1 = 0x7475626972747461;
  if (*v0)
    return v1;
  else
    return 0x7865546E69616C70;
}

uint64_t sub_1BEDDC884@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1BEDDFF74(a1, a2);
  *a3 = result;
  return result;
}

void sub_1BEDDC8A8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1BEDDC8B4()
{
  sub_1BEDDEE7C();
  return sub_1BEDE9DB8();
}

uint64_t sub_1BEDDC8DC()
{
  sub_1BEDDEE7C();
  return sub_1BEDE9DC4();
}

uint64_t sub_1BEDDC90C()
{
  return 12383;
}

void sub_1BEDDC91C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1BEDDC928()
{
  sub_1BEDDEF8C();
  return sub_1BEDE9DB8();
}

uint64_t sub_1BEDDC950()
{
  sub_1BEDDEF8C();
  return sub_1BEDE9DC4();
}

uint64_t sub_1BEDDC978@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
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
    v5 = sub_1BEDE9CD4();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1BEDDC9F4()
{
  sub_1BEDDF014();
  return sub_1BEDE9DB8();
}

uint64_t sub_1BEDDCA1C()
{
  sub_1BEDDF014();
  return sub_1BEDE9DC4();
}

uint64_t LiteTextSpan.encode(to:)(_QWORD *a1)
{
  unint64_t *v1;
  unint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  char *v21;
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
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;

  v2 = v1;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578548);
  v25 = *(_QWORD *)(v31 - 8);
  MEMORY[0x1E0C80A78](v31);
  v30 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578550);
  v28 = *(_QWORD *)(v5 - 8);
  v29 = v5;
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578558);
  v26 = *(_QWORD *)(v8 - 8);
  v27 = v8;
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578560);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BEDDEE7C();
  sub_1BEDE9DAC();
  if (!(v15 >> 62))
  {
    v34 = 0;
    sub_1BEDDF014();
    sub_1BEDE9C50();
    v18 = v27;
    sub_1BEDE9C98();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  v16 = v32;
  if (v15 >> 62 == 1)
  {
    v35 = 1;
    sub_1BEDDEF8C();
    sub_1BEDE9C50();
    sub_1BEDDEFD0();
    v17 = v29;
    sub_1BEDE9CB0();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v17);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  v20 = *(_QWORD *)(v15 + 16);
  v38 = 2;
  sub_1BEDDEEC0();
  v21 = v30;
  v22 = v11;
  sub_1BEDE9C50();
  v37 = 0;
  sub_1BEDDEF04();
  v23 = v31;
  sub_1BEDE9CB0();
  if (!v16)
  {
    v33 = v20;
    v36 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578580);
    sub_1BEDDF0C0(&qword_1EF578588, (uint64_t (*)(void))sub_1BEDDEF48, MEMORY[0x1E0DEAF10]);
    sub_1BEDE9CB0();
  }
  (*(void (**)(char *, uint64_t))(v25 + 8))(v21, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v22);
}

uint64_t LiteTextSpan.init(from:)@<X0>(_QWORD *a1@<X0>, unint64_t *a2@<X8>)
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  char v48;
  char v49;
  char v50;
  char v51;
  char v52;

  v39 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5785B0);
  v4 = *(_QWORD *)(v3 - 8);
  v41 = v3;
  v42 = v4;
  MEMORY[0x1E0C80A78](v3);
  v43 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5785B8);
  v40 = *(_QWORD *)(v45 - 8);
  MEMORY[0x1E0C80A78](v45);
  v44 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5785C0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5785C8);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a1[3];
  v46 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_1BEDDEE7C();
  v16 = v47;
  sub_1BEDE9D94();
  if (!v16)
  {
    v38 = v8;
    v18 = v44;
    v17 = v45;
    v47 = v12;
    v19 = sub_1BEDE9C44();
    v20 = v11;
    if (*(_QWORD *)(v19 + 16) == 1)
    {
      if (*(_BYTE *)(v19 + 32))
      {
        if (*(_BYTE *)(v19 + 32) == 1)
        {
          v49 = 1;
          sub_1BEDDEF8C();
          sub_1BEDE9BC0();
          v27 = swift_allocEmptyBox();
          sub_1BEDDF16C();
          sub_1BEDE9C2C();
          (*(void (**)(char *, uint64_t))(v40 + 8))(v18, v17);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v47 + 8))(v14, v11);
          v28 = (uint64_t)v46;
          v29 = v27 | 0x4000000000000000;
LABEL_12:
          *v39 = v29;
          return __swift_destroy_boxed_opaque_existential_0(v28);
        }
        v52 = 2;
        sub_1BEDDEEC0();
        sub_1BEDE9BC0();
        v45 = v11;
        v32 = swift_allocObject();
        v51 = 0;
        sub_1BEDDF07C();
        v33 = v41;
        sub_1BEDE9C2C();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578580);
        v50 = 1;
        sub_1BEDDF0C0(&qword_1EF5785E0, (uint64_t (*)(void))sub_1BEDDF128, MEMORY[0x1E0DEAF40]);
        v36 = v43;
        sub_1BEDE9C2C();
        v37 = v47;
        (*(void (**)(char *, uint64_t))(v42 + 8))(v36, v33);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v37 + 8))(v14, v45);
        v29 = v32 | 0x8000000000000000;
      }
      else
      {
        v48 = 0;
        sub_1BEDDF014();
        v25 = v10;
        v26 = v20;
        sub_1BEDE9BC0();
        v29 = swift_allocObject();
        v30 = sub_1BEDE9C14();
        v31 = v25;
        v35 = v34;
        (*(void (**)(char *, uint64_t))(v38 + 8))(v31, v7);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v47 + 8))(v14, v26);
        *(_QWORD *)(v29 + 16) = v30;
        *(_QWORD *)(v29 + 24) = v35;
      }
      v28 = (uint64_t)v46;
      goto LABEL_12;
    }
    v21 = sub_1BEDE9B00();
    swift_allocError();
    v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5785D0);
    *v23 = &type metadata for LiteTextSpan;
    sub_1BEDE9BCC();
    sub_1BEDE9AF4();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x1E0DEC450], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v14, v11);
  }
  v28 = (uint64_t)v46;
  return __swift_destroy_boxed_opaque_existential_0(v28);
}

uint64_t sub_1BEDDD3DC@<X0>(_QWORD *a1@<X0>, unint64_t *a2@<X8>)
{
  return LiteTextSpan.init(from:)(a1, a2);
}

uint64_t sub_1BEDDD3F0(_QWORD *a1)
{
  return LiteTextSpan.encode(to:)(a1);
}

uint64_t sub_1BEDDD404()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_1BEDDD420()
{
  sub_1BEDDF1D4();
  return sub_1BEDE9DB8();
}

uint64_t sub_1BEDDD448()
{
  sub_1BEDDF1D4();
  return sub_1BEDE9DC4();
}

uint64_t sub_1BEDDD470()
{
  return 0;
}

uint64_t sub_1BEDDD47C()
{
  sub_1BEDDF218();
  return sub_1BEDE9DB8();
}

uint64_t sub_1BEDDD4A4()
{
  sub_1BEDDF218();
  return sub_1BEDE9DC4();
}

uint64_t LiteTextAttribute.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5785F8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578600);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BEDDF1D4();
  sub_1BEDE9DAC();
  sub_1BEDDF218();
  sub_1BEDE9C50();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t LiteTextAttribute.init(from:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578618);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578620);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78](v22);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BEDDF1D4();
  v8 = v23;
  sub_1BEDE9D94();
  if (v8)
    goto LABEL_7;
  v20 = a1;
  v23 = v5;
  v10 = v21;
  v9 = v22;
  if (*(_QWORD *)(sub_1BEDE9C44() + 16) != 1)
  {
    v14 = sub_1BEDE9B00();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5785D0);
    *v16 = &type metadata for LiteTextAttribute;
    sub_1BEDE9BCC();
    sub_1BEDE9AF4();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x1E0DEC450], v14);
    swift_willThrow();
    v17 = v23;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v9);
    a1 = v20;
LABEL_7:
    v13 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_0(v13);
  }
  sub_1BEDDF218();
  v11 = v4;
  sub_1BEDE9BC0();
  v12 = v23;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
  v13 = (uint64_t)v20;
  return __swift_destroy_boxed_opaque_existential_0(v13);
}

uint64_t sub_1BEDDD868(_QWORD *a1)
{
  return LiteTextAttribute.init(from:)(a1);
}

uint64_t sub_1BEDDD87C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5785F8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578600);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BEDDF1D4();
  sub_1BEDE9DAC();
  sub_1BEDDF218();
  sub_1BEDE9C50();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t LiteTextMarker.hash(into:)()
{
  return sub_1BEDE9D64();
}

uint64_t sub_1BEDDD9DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_1BEDE9CD4();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1BEDDDA70()
{
  sub_1BEDDF25C();
  return sub_1BEDE9DB8();
}

uint64_t sub_1BEDDDA98()
{
  sub_1BEDDF25C();
  return sub_1BEDE9DC4();
}

uint64_t sub_1BEDDDAC0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_1BEDDDAEC()
{
  sub_1BEDDF2A0();
  return sub_1BEDE9DB8();
}

uint64_t sub_1BEDDDB14()
{
  sub_1BEDDF2A0();
  return sub_1BEDE9DC4();
}

uint64_t LiteTextMarker.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578628);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578630);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BEDDF25C();
  sub_1BEDE9DAC();
  sub_1BEDDF2A0();
  sub_1BEDE9C50();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t LiteTextMarker.init(from:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578648);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578650);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78](v22);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BEDDF25C();
  v8 = v23;
  sub_1BEDE9D94();
  if (v8)
    goto LABEL_7;
  v20 = a1;
  v23 = v5;
  v10 = v21;
  v9 = v22;
  if (*(_QWORD *)(sub_1BEDE9C44() + 16) != 1)
  {
    v14 = sub_1BEDE9B00();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5785D0);
    *v16 = &type metadata for LiteTextMarker;
    sub_1BEDE9BCC();
    sub_1BEDE9AF4();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x1E0DEC450], v14);
    swift_willThrow();
    v17 = v23;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v9);
    a1 = v20;
LABEL_7:
    v13 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_0(v13);
  }
  sub_1BEDDF2A0();
  v11 = v4;
  sub_1BEDE9BC0();
  v12 = v23;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
  v13 = (uint64_t)v20;
  return __swift_destroy_boxed_opaque_existential_0(v13);
}

uint64_t sub_1BEDDDED8(_QWORD *a1)
{
  return LiteTextMarker.init(from:)(a1);
}

uint64_t sub_1BEDDDEEC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578628);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578630);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BEDDF25C();
  sub_1BEDE9DAC();
  sub_1BEDDF2A0();
  sub_1BEDE9C50();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t static LiteControlCharacters.controlSequenceStart.getter()
{
  return 1;
}

uint64_t static LiteControlCharacters.controlSequenceSpanStart.getter()
{
  return 2;
}

uint64_t static LiteControlCharacters.controlSequenceEnd.getter()
{
  return 3;
}

uint64_t static LiteControlCharacters.messageSeparator.getter()
{
  return 25;
}

void sub_1BEDDE058()
{
  off_1EF578540 = &unk_1E78B29D8;
}

uint64_t static LiteControlCharacters.all.getter()
{
  if (qword_1EF5781A0 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static LiteControlCharacters.all.setter(void *a1)
{
  if (qword_1EF5781A0 != -1)
    swift_once();
  swift_beginAccess();
  off_1EF578540 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static LiteControlCharacters.all.modify())()
{
  if (qword_1EF5781A0 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1BEDDE1BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  __int128 v55;
  _QWORD *v56;
  uint64_t v57;
  unint64_t v58;

  v57 = 0;
  v58 = 0xE000000000000000;
  v56 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  swift_beginAccess();
  v2 = sub_1BEDE9938();
  if (!v3)
  {
LABEL_94:
    v53 = 0xF000000000000007;
    sub_1BEDDE98C((uint64_t *)&v53, &v57, &v56);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    return (uint64_t)v56;
  }
  v4 = v2;
  v5 = v3;
  while (v4 == 1 && v5 == 0xE100000000000000 || (sub_1BEDE9CD4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v8 = *(_QWORD *)(a1 + 8);
    v53 = *(_QWORD *)a1;
    v54 = v8;
    v55 = *(_OWORD *)(a1 + 16);
    swift_bridgeObjectRetain();
    v9 = sub_1BEDE9938();
    v11 = v10;
    swift_bridgeObjectRelease();
    if (v11)
    {
      if (qword_1EF5781A0 != -1)
        swift_once();
      swift_beginAccess();
      v12 = off_1EF578540;
      v13 = *((_QWORD *)off_1EF578540 + 2);
      if (v13)
      {
        v14 = *((_QWORD *)off_1EF578540 + 4) == v9 && v11 == *((_QWORD *)off_1EF578540 + 5);
        if (v14 || (sub_1BEDE9CD4() & 1) != 0)
        {
LABEL_19:
          sub_1BEDE9938();
          swift_bridgeObjectRelease();
          swift_beginAccess();
          MEMORY[0x1C3B851F0](v9, v11);
          swift_endAccess();
          goto LABEL_20;
        }
        if (v13 != 1)
        {
          if (v12[6] == v9 && v11 == v12[7])
            goto LABEL_19;
          result = sub_1BEDE9CD4();
          if ((result & 1) != 0)
            goto LABEL_19;
          if (v13 != 2)
          {
            v25 = v12 + 9;
            v26 = 2;
            while (1)
            {
              v27 = v26 + 1;
              if (__OFADD__(v26, 1))
                break;
              if (*(v25 - 1) == v9 && v11 == *v25)
                goto LABEL_19;
              result = sub_1BEDE9CD4();
              if ((result & 1) != 0)
                goto LABEL_19;
              v25 += 2;
              ++v26;
              if (v27 == v13)
                goto LABEL_3;
            }
            __break(1u);
            goto LABEL_96;
          }
        }
      }
LABEL_3:
      swift_bridgeObjectRelease();
    }
    sub_1BEDDEB80(a1, &v53);
    v6 = v53;
    v52 = v53;
    sub_1BEDDE98C((uint64_t *)&v52, &v57, &v56);
LABEL_5:
    sub_1BEDE00F0(v6);
LABEL_6:
    v4 = sub_1BEDE9938();
    v5 = v7;
    if (!v7)
      goto LABEL_94;
  }
  if (v4 == 2 && v5 == 0xE100000000000000 || (sub_1BEDE9CD4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v15 = sub_1BEDE9938();
    if (v16)
    {
      v17 = v15;
      v18 = v16;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578718);
      v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = xmmword_1BEDEABE0;
      *(_QWORD *)(v19 + 32) = v17;
      *(_QWORD *)(v19 + 40) = v18;
      v53 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578720);
      sub_1BEDE0108();
      v20 = sub_1BEDE9950();
      v22 = HIBYTE(v21) & 0xF;
      v53 = v20;
      v54 = v21;
      if ((v21 & 0x2000000000000000) == 0)
        v22 = v20 & 0xFFFFFFFFFFFFLL;
      *(_QWORD *)&v55 = 0;
      *((_QWORD *)&v55 + 1) = v22;
      swift_bridgeObjectRetain();
      sub_1BEDE9938();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v23 = swift_allocObject();
      *(_QWORD *)(v23 + 16) = sub_1BEDDE1BC(a1);
      v6 = v23 | 0x8000000000000000;
    }
    else
    {
      v6 = 0xF000000000000007;
    }
    v30 = v57;
    v29 = v58;
    v31 = HIBYTE(v58) & 0xF;
    if ((v58 & 0x2000000000000000) == 0)
      v31 = v57 & 0xFFFFFFFFFFFFLL;
    if (v31)
    {
      v32 = swift_allocObject();
      *(_QWORD *)(v32 + 16) = v30;
      *(_QWORD *)(v32 + 24) = v29;
      swift_beginAccess();
      v33 = v56;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v33 = sub_1BEDD5C5C(0, v33[2] + 1, 1, v33);
      v35 = v33[2];
      v34 = v33[3];
      if (v35 >= v34 >> 1)
        v33 = sub_1BEDD5C5C((_QWORD *)(v34 > 1), v35 + 1, 1, v33);
      v33[2] = v35 + 1;
      v33[v35 + 4] = v32;
      v56 = v33;
      swift_endAccess();
      v57 = 0;
      v58 = 0xE000000000000000;
      swift_bridgeObjectRelease();
    }
    if ((~v6 & 0xF000000000000007) == 0)
      goto LABEL_6;
    swift_beginAccess();
    v36 = v56;
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v36 = sub_1BEDD5C5C(0, v36[2] + 1, 1, v36);
    v38 = v36[2];
    v37 = v36[3];
    if (v38 >= v37 >> 1)
      v36 = sub_1BEDD5C5C((_QWORD *)(v37 > 1), v38 + 1, 1, v36);
    v36[2] = v38 + 1;
    v36[v38 + 4] = v6;
    v56 = v36;
    swift_endAccess();
    goto LABEL_5;
  }
  if (v4 == 3 && v5 == 0xE100000000000000 || (sub_1BEDE9CD4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_94;
  }
  if (v4 == 25 && v5 == 0xE100000000000000 || (sub_1BEDE9CD4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_1BEDE992C();
    swift_endAccess();
    v39 = v57;
    v40 = v58;
    v41 = HIBYTE(v58) & 0xF;
    if ((v58 & 0x2000000000000000) == 0)
      v41 = v57 & 0xFFFFFFFFFFFFLL;
    if (!v41)
      goto LABEL_6;
    v42 = swift_allocObject();
    *(_QWORD *)(v42 + 16) = v39;
    *(_QWORD *)(v42 + 24) = v40;
    swift_beginAccess();
    v43 = v56;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v43 = sub_1BEDD5C5C(0, v43[2] + 1, 1, v43);
    v45 = v43[2];
    v44 = v43[3];
    if (v45 >= v44 >> 1)
      v43 = sub_1BEDD5C5C((_QWORD *)(v44 > 1), v45 + 1, 1, v43);
    v43[2] = v45 + 1;
    v43[v45 + 4] = v42;
    v56 = v43;
    swift_endAccess();
    v57 = 0;
    v58 = 0xE000000000000000;
    goto LABEL_20;
  }
  if (qword_1EF5781A0 != -1)
    swift_once();
  swift_beginAccess();
  v46 = off_1EF578540;
  v47 = *((_QWORD *)off_1EF578540 + 2);
  if (!v47)
    goto LABEL_78;
  if (*((_QWORD *)off_1EF578540 + 4) == v4 && v5 == *((_QWORD *)off_1EF578540 + 5) || (sub_1BEDE9CD4() & 1) != 0)
    goto LABEL_20;
  if (v47 == 1)
    goto LABEL_78;
  if (v46[6] == v4 && v5 == v46[7] || (result = sub_1BEDE9CD4(), (result & 1) != 0))
  {
LABEL_20:
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  if (v47 == 2)
  {
LABEL_78:
    swift_beginAccess();
    MEMORY[0x1C3B851F0](v4, v5);
    swift_endAccess();
    goto LABEL_20;
  }
  v48 = v46 + 9;
  v49 = 2;
  while (1)
  {
    v50 = v49 + 1;
    if (__OFADD__(v49, 1))
      break;
    if (*(v48 - 1) == v4 && v5 == *v48)
      goto LABEL_20;
    result = sub_1BEDE9CD4();
    if ((result & 1) != 0)
      goto LABEL_20;
    v48 += 2;
    ++v49;
    if (v50 == v47)
      goto LABEL_78;
  }
LABEL_96:
  __break(1u);
  return result;
}

uint64_t sub_1BEDDE98C(uint64_t *a1, uint64_t *a2, _QWORD **a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  char v16;
  unint64_t v17;
  unint64_t v18;

  v5 = *a1;
  result = swift_beginAccess();
  v7 = *a2;
  v8 = a2[1];
  v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0)
    v9 = *a2 & 0xFFFFFFFFFFFFLL;
  if (v9)
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v7;
    *(_QWORD *)(v10 + 24) = v8;
    swift_beginAccess();
    v11 = *a3;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a3 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = sub_1BEDD5C5C(0, v11[2] + 1, 1, v11);
      *a3 = v11;
    }
    v14 = v11[2];
    v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      v11 = sub_1BEDD5C5C((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
      *a3 = v11;
    }
    v11[2] = v14 + 1;
    v11[v14 + 4] = v10;
    swift_endAccess();
    swift_beginAccess();
    *a2 = 0;
    a2[1] = 0xE000000000000000;
    result = swift_bridgeObjectRelease();
  }
  if ((~v5 & 0xF000000000000007) != 0)
  {
    swift_beginAccess();
    v15 = *a3;
    swift_retain();
    v16 = swift_isUniquelyReferenced_nonNull_native();
    *a3 = v15;
    if ((v16 & 1) == 0)
    {
      v15 = sub_1BEDD5C5C(0, v15[2] + 1, 1, v15);
      *a3 = v15;
    }
    v18 = v15[2];
    v17 = v15[3];
    if (v18 >= v17 >> 1)
    {
      v15 = sub_1BEDD5C5C((_QWORD *)(v17 > 1), v18 + 1, 1, v15);
      *a3 = v15;
    }
    v15[2] = v18 + 1;
    v15[v18 + 4] = v5;
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_1BEDDEB80@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;

  v4 = sub_1BEDE9938();
  if (v5)
  {
    v6 = v4;
    v7 = v5;
    v8 = 0;
    do
    {
      if (v6 == 1 && v7 == 0xE100000000000000 || (sub_1BEDE9CD4() & 1) != 0)
      {
        v11 = __OFADD__(v8++, 1);
        if (v11)
        {
          __break(1u);
          break;
        }
      }
      else if (v6 == 2 && v7 == 0xE100000000000000 || (result = sub_1BEDE9CD4(), (result & 1) != 0))
      {
        if (!v8)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_1BEDE9938();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v13 = swift_allocObject();
          result = sub_1BEDDE1BC(a1);
          *(_QWORD *)(v13 + 16) = result;
          v12 = v13 | 0x8000000000000000;
          goto LABEL_23;
        }
      }
      else if (v6 == 3 && v7 == 0xE100000000000000 || (result = sub_1BEDE9CD4(), (result & 1) != 0))
      {
        if (!v8)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_1BEDE9938();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          result = swift_allocEmptyBox();
          v12 = result | 0x4000000000000000;
          goto LABEL_23;
        }
        v11 = __OFSUB__(v8--, 1);
        if (v11)
        {
          __break(1u);
          return result;
        }
      }
      MEMORY[0x1C3B851F0](v6, v7);
      swift_bridgeObjectRelease();
      v6 = sub_1BEDE9938();
      v7 = v9;
    }
    while (v9);
  }
  result = swift_bridgeObjectRelease();
  v12 = 0xF000000000000007;
LABEL_23:
  *a2 = v12;
  return result;
}

uint64_t _s24MessagesBlastDoorSupport12LiteTextSpanO2eeoiySbAC_ACtFZ_0(uint64_t *a1, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v7;
  uint64_t v8;

  v2 = *a1;
  v3 = *a2;
  v4 = (unint64_t)*a1 >> 62;
  if (!(_DWORD)v4)
  {
    if (!(v3 >> 62))
    {
      if (*(_QWORD *)(v2 + 16) != *(_QWORD *)(v3 + 16) || *(_QWORD *)(v2 + 24) != *(_QWORD *)(v3 + 24))
        return sub_1BEDE9CD4();
      return 1;
    }
    return 0;
  }
  if ((_DWORD)v4 != 1)
  {
    if (v3 >> 62 == 2)
    {
      v7 = *(_QWORD *)(v2 + 16);
      v8 = *(_QWORD *)(v3 + 16);
      swift_retain();
      swift_retain();
      LOBYTE(v7) = sub_1BEDDC654(v7, v8);
      swift_release();
      swift_release();
      return v7 & 1;
    }
    return 0;
  }
  return v3 >> 62 == 1;
}

unint64_t sub_1BEDDEE7C()
{
  unint64_t result;

  result = qword_1EF578568;
  if (!qword_1EF578568)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEBD6C, &type metadata for LiteTextSpan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578568);
  }
  return result;
}

unint64_t sub_1BEDDEEC0()
{
  unint64_t result;

  result = qword_1EF578570;
  if (!qword_1EF578570)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEBD1C, &type metadata for LiteTextSpan.AttributedSpansCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578570);
  }
  return result;
}

unint64_t sub_1BEDDEF04()
{
  unint64_t result;

  result = qword_1EF578578;
  if (!qword_1EF578578)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for LiteTextAttribute, &type metadata for LiteTextAttribute);
    atomic_store(result, (unint64_t *)&qword_1EF578578);
  }
  return result;
}

unint64_t sub_1BEDDEF48()
{
  unint64_t result;

  result = qword_1EF578590;
  if (!qword_1EF578590)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for LiteTextSpan, &type metadata for LiteTextSpan);
    atomic_store(result, (unint64_t *)&qword_1EF578590);
  }
  return result;
}

unint64_t sub_1BEDDEF8C()
{
  unint64_t result;

  result = qword_1EF578598;
  if (!qword_1EF578598)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEBCCC, &type metadata for LiteTextSpan.MarkerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578598);
  }
  return result;
}

unint64_t sub_1BEDDEFD0()
{
  unint64_t result;

  result = qword_1EF5785A0;
  if (!qword_1EF5785A0)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for LiteTextMarker, &type metadata for LiteTextMarker);
    atomic_store(result, (unint64_t *)&qword_1EF5785A0);
  }
  return result;
}

unint64_t sub_1BEDDF014()
{
  unint64_t result;

  result = qword_1EF5785A8;
  if (!qword_1EF5785A8)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEBC7C, &type metadata for LiteTextSpan.PlainTextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5785A8);
  }
  return result;
}

uint64_t sub_1BEDDF058()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_1BEDDF07C()
{
  unint64_t result;

  result = qword_1EF5785D8;
  if (!qword_1EF5785D8)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for LiteTextAttribute, &type metadata for LiteTextAttribute);
    atomic_store(result, (unint64_t *)&qword_1EF5785D8);
  }
  return result;
}

uint64_t sub_1BEDDF0C0(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF578580);
    v8 = a2();
    result = MEMORY[0x1C3B85BE0](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BEDDF128()
{
  unint64_t result;

  result = qword_1EF5785E8;
  if (!qword_1EF5785E8)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for LiteTextSpan, &type metadata for LiteTextSpan);
    atomic_store(result, (unint64_t *)&qword_1EF5785E8);
  }
  return result;
}

unint64_t sub_1BEDDF16C()
{
  unint64_t result;

  result = qword_1EF5785F0;
  if (!qword_1EF5785F0)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for LiteTextMarker, &type metadata for LiteTextMarker);
    atomic_store(result, (unint64_t *)&qword_1EF5785F0);
  }
  return result;
}

uint64_t sub_1BEDDF1B0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_1BEDDF1D4()
{
  unint64_t result;

  result = qword_1EF578608;
  if (!qword_1EF578608)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEBC2C, &type metadata for LiteTextAttribute.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578608);
  }
  return result;
}

unint64_t sub_1BEDDF218()
{
  unint64_t result;

  result = qword_1EF578610;
  if (!qword_1EF578610)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEBBDC, &type metadata for LiteTextAttribute.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578610);
  }
  return result;
}

unint64_t sub_1BEDDF25C()
{
  unint64_t result;

  result = qword_1EF578638;
  if (!qword_1EF578638)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEBB8C, &type metadata for LiteTextMarker.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578638);
  }
  return result;
}

unint64_t sub_1BEDDF2A0()
{
  unint64_t result;

  result = qword_1EF578640;
  if (!qword_1EF578640)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEBB3C, &type metadata for LiteTextMarker.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578640);
  }
  return result;
}

unint64_t sub_1BEDDF2E8()
{
  unint64_t result;

  result = qword_1EF578658;
  if (!qword_1EF578658)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for LiteTextAttribute, &type metadata for LiteTextAttribute);
    atomic_store(result, (unint64_t *)&qword_1EF578658);
  }
  return result;
}

unint64_t sub_1BEDDF330()
{
  unint64_t result;

  result = qword_1EF578660;
  if (!qword_1EF578660)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for LiteTextMarker, &type metadata for LiteTextMarker);
    atomic_store(result, (unint64_t *)&qword_1EF578660);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for LiteTextSpan(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for LiteTextSpan()
{
  return swift_release();
}

_QWORD *assignWithCopy for LiteTextSpan(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for LiteTextSpan(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LiteTextSpan(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 126);
  v3 = (((*(_QWORD *)a1 >> 57) >> 5) | (4 * ((*(_QWORD *)a1 >> 57) & 0x18 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for LiteTextSpan(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7D)
  {
    *(_QWORD *)result = a2 - 126;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1BEDDF4DC(_QWORD *a1)
{
  return *a1 >> 62;
}

_QWORD *sub_1BEDDF4E8(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t *sub_1BEDDF4F8(uint64_t *result, uint64_t a2)
{
  *result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  return result;
}

ValueMetadata *type metadata accessor for LiteTextSpan()
{
  return &type metadata for LiteTextSpan;
}

ValueMetadata *type metadata accessor for LiteTextAttribute()
{
  return &type metadata for LiteTextAttribute;
}

ValueMetadata *type metadata accessor for LiteTextMarker()
{
  return &type metadata for LiteTextMarker;
}

ValueMetadata *type metadata accessor for LiteControlCharacters()
{
  return &type metadata for LiteControlCharacters;
}

ValueMetadata *type metadata accessor for LiteTextParser()
{
  return &type metadata for LiteTextParser;
}

ValueMetadata *type metadata accessor for LiteTextMarker.CodingKeys()
{
  return &type metadata for LiteTextMarker.CodingKeys;
}

ValueMetadata *type metadata accessor for LiteTextMarker.UnknownCodingKeys()
{
  return &type metadata for LiteTextMarker.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for LiteTextAttribute.CodingKeys()
{
  return &type metadata for LiteTextAttribute.CodingKeys;
}

ValueMetadata *type metadata accessor for LiteTextAttribute.UnknownCodingKeys()
{
  return &type metadata for LiteTextAttribute.UnknownCodingKeys;
}

uint64_t storeEnumTagSinglePayload for LiteTextSpan.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BEDDF5F0 + 4 * byte_1BEDEB335[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1BEDDF624 + 4 * asc_1BEDEB330[v4]))();
}

uint64_t sub_1BEDDF624(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDDF62C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BEDDF634);
  return result;
}

uint64_t sub_1BEDDF640(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BEDDF648);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1BEDDF64C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDDF654(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LiteTextSpan.CodingKeys()
{
  return &type metadata for LiteTextSpan.CodingKeys;
}

ValueMetadata *type metadata accessor for LiteTextSpan.PlainTextCodingKeys()
{
  return &type metadata for LiteTextSpan.PlainTextCodingKeys;
}

uint64_t _s24MessagesBlastDoorSupport14LiteTextMarkerOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1BEDDF6C0 + 4 * byte_1BEDEB33A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1BEDDF6E0 + 4 * byte_1BEDEB33F[v4]))();
}

_BYTE *sub_1BEDDF6C0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1BEDDF6E0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BEDDF6E8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BEDDF6F0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1BEDDF6F8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1BEDDF700(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LiteTextSpan.MarkerCodingKeys()
{
  return &type metadata for LiteTextSpan.MarkerCodingKeys;
}

uint64_t getEnumTagSinglePayload for LiteTextSpan.AttributedSpansCodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LiteTextSpan.AttributedSpansCodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BEDDF7F8 + 4 * byte_1BEDEB349[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BEDDF82C + 4 * byte_1BEDEB344[v4]))();
}

uint64_t sub_1BEDDF82C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDDF834(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BEDDF83CLL);
  return result;
}

uint64_t sub_1BEDDF848(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BEDDF850);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BEDDF854(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDDF85C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1BEDDF868(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LiteTextSpan.AttributedSpansCodingKeys()
{
  return &type metadata for LiteTextSpan.AttributedSpansCodingKeys;
}

unint64_t sub_1BEDDF888()
{
  unint64_t result;

  result = qword_1EF578668;
  if (!qword_1EF578668)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB6DC, &type metadata for LiteTextSpan.AttributedSpansCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578668);
  }
  return result;
}

unint64_t sub_1BEDDF8D0()
{
  unint64_t result;

  result = qword_1EF578670;
  if (!qword_1EF578670)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB794, &type metadata for LiteTextSpan.MarkerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578670);
  }
  return result;
}

unint64_t sub_1BEDDF918()
{
  unint64_t result;

  result = qword_1EF578678;
  if (!qword_1EF578678)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB84C, &type metadata for LiteTextSpan.PlainTextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578678);
  }
  return result;
}

unint64_t sub_1BEDDF960()
{
  unint64_t result;

  result = qword_1EF578680;
  if (!qword_1EF578680)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB904, &type metadata for LiteTextSpan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578680);
  }
  return result;
}

unint64_t sub_1BEDDF9A8()
{
  unint64_t result;

  result = qword_1EF578688;
  if (!qword_1EF578688)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEBA0C, &type metadata for LiteTextAttribute.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578688);
  }
  return result;
}

unint64_t sub_1BEDDF9F0()
{
  unint64_t result;

  result = qword_1EF578690;
  if (!qword_1EF578690)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEBB14, &type metadata for LiteTextMarker.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578690);
  }
  return result;
}

unint64_t sub_1BEDDFA38()
{
  unint64_t result;

  result = qword_1EF578698;
  if (!qword_1EF578698)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEBA34, &type metadata for LiteTextMarker.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578698);
  }
  return result;
}

unint64_t sub_1BEDDFA80()
{
  unint64_t result;

  result = qword_1EF5786A0;
  if (!qword_1EF5786A0)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEBA5C, &type metadata for LiteTextMarker.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5786A0);
  }
  return result;
}

unint64_t sub_1BEDDFAC8()
{
  unint64_t result;

  result = qword_1EF5786A8;
  if (!qword_1EF5786A8)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEBA84, &type metadata for LiteTextMarker.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5786A8);
  }
  return result;
}

unint64_t sub_1BEDDFB10()
{
  unint64_t result;

  result = qword_1EF5786B0;
  if (!qword_1EF5786B0)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEBAAC, &type metadata for LiteTextMarker.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5786B0);
  }
  return result;
}

unint64_t sub_1BEDDFB58()
{
  unint64_t result;

  result = qword_1EF5786B8;
  if (!qword_1EF5786B8)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB92C, &type metadata for LiteTextAttribute.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5786B8);
  }
  return result;
}

unint64_t sub_1BEDDFBA0()
{
  unint64_t result;

  result = qword_1EF5786C0;
  if (!qword_1EF5786C0)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB954, &type metadata for LiteTextAttribute.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5786C0);
  }
  return result;
}

unint64_t sub_1BEDDFBE8()
{
  unint64_t result;

  result = qword_1EF5786C8;
  if (!qword_1EF5786C8)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB97C, &type metadata for LiteTextAttribute.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5786C8);
  }
  return result;
}

unint64_t sub_1BEDDFC30()
{
  unint64_t result;

  result = qword_1EF5786D0;
  if (!qword_1EF5786D0)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB9A4, &type metadata for LiteTextAttribute.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5786D0);
  }
  return result;
}

unint64_t sub_1BEDDFC78()
{
  unint64_t result;

  result = qword_1EF5786D8;
  if (!qword_1EF5786D8)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB7BC, &type metadata for LiteTextSpan.PlainTextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5786D8);
  }
  return result;
}

unint64_t sub_1BEDDFCC0()
{
  unint64_t result;

  result = qword_1EF5786E0;
  if (!qword_1EF5786E0)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB7E4, &type metadata for LiteTextSpan.PlainTextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5786E0);
  }
  return result;
}

unint64_t sub_1BEDDFD08()
{
  unint64_t result;

  result = qword_1EF5786E8;
  if (!qword_1EF5786E8)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB704, &type metadata for LiteTextSpan.MarkerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5786E8);
  }
  return result;
}

unint64_t sub_1BEDDFD50()
{
  unint64_t result;

  result = qword_1EF5786F0;
  if (!qword_1EF5786F0)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB72C, &type metadata for LiteTextSpan.MarkerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5786F0);
  }
  return result;
}

unint64_t sub_1BEDDFD98()
{
  unint64_t result;

  result = qword_1EF5786F8;
  if (!qword_1EF5786F8)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB64C, &type metadata for LiteTextSpan.AttributedSpansCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5786F8);
  }
  return result;
}

unint64_t sub_1BEDDFDE0()
{
  unint64_t result;

  result = qword_1EF578700;
  if (!qword_1EF578700)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB674, &type metadata for LiteTextSpan.AttributedSpansCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578700);
  }
  return result;
}

unint64_t sub_1BEDDFE28()
{
  unint64_t result;

  result = qword_1EF578708;
  if (!qword_1EF578708)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB874, &type metadata for LiteTextSpan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578708);
  }
  return result;
}

unint64_t sub_1BEDDFE70()
{
  unint64_t result;

  result = qword_1EF578710;
  if (!qword_1EF578710)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEB89C, &type metadata for LiteTextSpan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578710);
  }
  return result;
}

uint64_t sub_1BEDDFEB4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v2 || (sub_1BEDE9CD4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1BEDE9CD4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1BEDDFF74(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7865546E69616C70 && a2 == 0xE900000000000074;
  if (v2 || (sub_1BEDE9CD4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x72656B72616DLL && a2 == 0xE600000000000000 || (sub_1BEDE9CD4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7475626972747461 && a2 == 0xEF736E6170536465)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1BEDE9CD4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1BEDE00F0(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0)
    return swift_release();
  return result;
}

unint64_t sub_1BEDE0108()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF578728;
  if (!qword_1EF578728)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF578720);
    result = MEMORY[0x1C3B85BE0](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EF578728);
  }
  return result;
}

uint64_t MessageType.init(rawValue:)(unsigned __int8 a1)
{
  return sub_1BEDE02E0(a1) & 0x1FF;
}

uint64_t sub_1BEDE018C()
{
  return sub_1BEDE9D70();
}

uint64_t sub_1BEDE01B8@<X0>(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_1BEDE02E0(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

void sub_1BEDE01E8(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t PreviewType.init(rawValue:)(unsigned __int8 a1)
{
  unsigned __int8 v1;
  int v2;

  v1 = a1;
  if (a1)
  {
    if (a1 == 1)
      v1 = a1;
    else
      v1 = 0;
    v2 = a1 != 1;
  }
  else
  {
    v2 = 0;
  }
  return v1 | (v2 << 8);
}

uint64_t sub_1BEDE022C()
{
  sub_1BEDE9D58();
  sub_1BEDE9D70();
  return sub_1BEDE9D7C();
}

uint64_t sub_1BEDE0270()
{
  sub_1BEDE9D58();
  sub_1BEDE9D70();
  return sub_1BEDE9D7C();
}

char *sub_1BEDE02B0@<X0>(char *result@<X0>, char *a2@<X8>)
{
  int v2;
  char v3;
  BOOL v4;
  BOOL v5;
  char v6;
  BOOL v7;

  v2 = *result;
  if (*result)
    v3 = 0;
  else
    v3 = *result;
  v4 = v2 != 0;
  v5 = v2 == 1;
  if (v2 == 1)
    v6 = 1;
  else
    v6 = v3;
  v7 = !v5 && v4;
  *a2 = v6;
  a2[1] = v7;
  return result;
}

uint64_t sub_1BEDE02E0(unsigned __int8 a1)
{
  int v1;

  v1 = 0;
  switch(a1)
  {
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x68u:
    case 0x69u:
    case 0x6Au:
    case 0x6Bu:
    case 0x6Cu:
    case 0x6Fu:
    case 0x70u:
    case 0x71u:
    case 0x74u:
    case 0x76u:
    case 0x77u:
    case 0x78u:
    case 0x7Au:
    case 0x83u:
    case 0x86u:
    case 0x87u:
    case 0x8Bu:
    case 0xAAu:
    case 0xB4u:
    case 0xB5u:
    case 0xBEu:
    case 0xC3u:
    case 0xC4u:
      return a1 | (v1 << 8);
    default:
      a1 = 0;
      v1 = 1;
      break;
  }
  return a1 | (v1 << 8);
}

unint64_t sub_1BEDE0330()
{
  unint64_t result;

  result = qword_1EF578730;
  if (!qword_1EF578730)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for MessageType, &type metadata for MessageType);
    atomic_store(result, (unint64_t *)&qword_1EF578730);
  }
  return result;
}

unint64_t sub_1BEDE0378()
{
  unint64_t result;

  result = qword_1EF578738;
  if (!qword_1EF578738)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for PreviewType, &type metadata for PreviewType);
    atomic_store(result, (unint64_t *)&qword_1EF578738);
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageType()
{
  return &type metadata for MessageType;
}

ValueMetadata *type metadata accessor for PreviewType()
{
  return &type metadata for PreviewType;
}

uint64_t TopLevelDictionary.incomingPushPayload.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BEDD7ADC(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for IncomingPushPayload);
}

uint64_t TopLevelDictionary.incomingPushPayload.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_1BEDE0414(a1, v1);
}

uint64_t sub_1BEDE0414(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IncomingPushPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*TopLevelDictionary.incomingPushPayload.modify())()
{
  return CGSizeMake;
}

uint64_t TopLevelDictionary.decryptedData.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for TopLevelDictionary() + 20);
  v2 = *(_QWORD *)v1;
  sub_1BEDD02C4(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t type metadata accessor for TopLevelDictionary()
{
  uint64_t result;

  result = qword_1EF577D20;
  if (!qword_1EF577D20)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t TopLevelDictionary.decryptedData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = v2 + *(int *)(type metadata accessor for TopLevelDictionary() + 20);
  result = sub_1BEDD42F8(*(_QWORD *)v5, *(_QWORD *)(v5 + 8));
  *(_QWORD *)v5 = a1;
  *(_QWORD *)(v5 + 8) = a2;
  return result;
}

double (*TopLevelDictionary.decryptedData.modify())(double, double)
{
  type metadata accessor for TopLevelDictionary();
  return CGSizeMake;
}

uint64_t TopLevelDictionary.shouldShowPeerErrors.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for TopLevelDictionary() + 24));
}

uint64_t TopLevelDictionary.shouldShowPeerErrors.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for TopLevelDictionary();
  *(_BYTE *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

double (*TopLevelDictionary.shouldShowPeerErrors.modify())(double, double)
{
  type metadata accessor for TopLevelDictionary();
  return CGSizeMake;
}

uint64_t TopLevelDictionary.encryptionTypeString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TopLevelDictionary() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TopLevelDictionary.encryptionTypeString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TopLevelDictionary() + 28));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

double (*TopLevelDictionary.encryptionTypeString.modify())(double, double)
{
  type metadata accessor for TopLevelDictionary();
  return CGSizeMake;
}

uint64_t TopLevelDictionary.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];
  __int128 v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578740);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BEDE082C();
  sub_1BEDE9DAC();
  LOBYTE(v11) = 0;
  type metadata accessor for IncomingPushPayload();
  sub_1BEDE0BE8(&qword_1EF578748, (uint64_t)&protocol conformance descriptor for IncomingPushPayload);
  sub_1BEDE9CB0();
  if (!v2)
  {
    v11 = *(_OWORD *)(v3 + *(int *)(type metadata accessor for TopLevelDictionary() + 20));
    v10[15] = 1;
    sub_1BEDE0870();
    sub_1BEDE9C80();
    LOBYTE(v11) = 2;
    sub_1BEDE9C68();
    LOBYTE(v11) = 3;
    sub_1BEDE9C5C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1BEDE082C()
{
  unint64_t result;

  result = qword_1EF577D40;
  if (!qword_1EF577D40)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for TopLevelDictionary.CodingKeys, &type metadata for TopLevelDictionary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF577D40);
  }
  return result;
}

unint64_t sub_1BEDE0870()
{
  unint64_t result;

  result = qword_1EF578750;
  if (!qword_1EF578750)
  {
    result = MEMORY[0x1C3B85BE0](MEMORY[0x1E0CB0350], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EF578750);
  }
  return result;
}

uint64_t TopLevelDictionary.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  _QWORD *v30;
  char *v31;
  char *v32;
  __int128 v33;
  char v34;

  v27 = a2;
  v4 = type metadata accessor for IncomingPushPayload();
  MEMORY[0x1E0C80A78](v4);
  v28 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF577DA8);
  v6 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TopLevelDictionary();
  v10 = (int *)MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = &v12[v10[5]];
  *(_OWORD *)v13 = xmmword_1BEDEB2F0;
  v14 = v10[6];
  v12[v14] = 2;
  v15 = &v12[v10[7]];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v31 = v15;
  v32 = v13;
  v16 = a1[3];
  v30 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_1BEDE082C();
  sub_1BEDE9D94();
  if (v2)
  {
    v19 = v32;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
    sub_1BEDD42F8(*(_QWORD *)v19, *((_QWORD *)v19 + 1));
    return swift_bridgeObjectRelease();
  }
  else
  {
    v26 = v14;
    v17 = v6;
    LOBYTE(v33) = 0;
    sub_1BEDE0BE8(&qword_1EF577D78, (uint64_t)&protocol conformance descriptor for IncomingPushPayload);
    v18 = (uint64_t)v28;
    sub_1BEDE9C2C();
    sub_1BEDE0C28(v18, (uint64_t)v12);
    v34 = 1;
    sub_1BEDE0C6C();
    sub_1BEDE9BFC();
    *(_OWORD *)v32 = v33;
    LOBYTE(v33) = 2;
    v12[v26] = sub_1BEDE9BE4();
    LOBYTE(v33) = 3;
    v20 = sub_1BEDE9BD8();
    v22 = v21;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v29);
    v23 = (uint64_t *)v31;
    swift_bridgeObjectRelease();
    *v23 = v20;
    v23[1] = v22;
    sub_1BEDD7ADC((uint64_t)v12, v27, (uint64_t (*)(_QWORD))type metadata accessor for TopLevelDictionary);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
    return sub_1BEDD7B20((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for TopLevelDictionary);
  }
}

uint64_t sub_1BEDE0BE8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for IncomingPushPayload();
    result = MEMORY[0x1C3B85BE0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BEDE0C28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IncomingPushPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1BEDE0C6C()
{
  unint64_t result;

  result = qword_1EF577D30;
  if (!qword_1EF577D30)
  {
    result = MEMORY[0x1C3B85BE0](MEMORY[0x1E0CB0378], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EF577D30);
  }
  return result;
}

uint64_t sub_1BEDE0CB0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TopLevelDictionary.init(from:)(a1, a2);
}

uint64_t sub_1BEDE0CC4(_QWORD *a1)
{
  return TopLevelDictionary.encode(to:)(a1);
}

MessagesBlastDoorSupport::TopLevelDictionary::CodingKeys_optional __swiftcall TopLevelDictionary.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  MessagesBlastDoorSupport::TopLevelDictionary::CodingKeys_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1BEDE9BB4();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

MessagesBlastDoorSupport::TopLevelDictionary::CodingKeys_optional __swiftcall TopLevelDictionary.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  _BYTE *v1;
  _BYTE *v2;
  MessagesBlastDoorSupport::TopLevelDictionary::CodingKeys_optional result;
  char v4;

  v2 = v1;
  result.value = TopLevelDictionary.CodingKeys.init(rawValue:)(stringValue).value;
  *v2 = v4;
  return result;
}

MessagesBlastDoorSupport::TopLevelDictionary::CodingKeys_optional __swiftcall TopLevelDictionary.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  _BYTE *v1;

  *v1 = 4;
  return (MessagesBlastDoorSupport::TopLevelDictionary::CodingKeys_optional)intValue;
}

uint64_t TopLevelDictionary.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t TopLevelDictionary.CodingKeys.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1BEDE0DB0
                                                                     + 4 * asc_1BEDEBFA0[*v0]))(0xD00000000000001DLL, 0x80000001BEDECAE0);
}

uint64_t sub_1BEDE0DB0(uint64_t a1)
{
  return a1 + 2;
}

uint64_t TopLevelDictionary.CodingKeys.stringValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1BEDE0E1C + 4 * byte_1BEDEBFA4[*v0]))(0xD00000000000001DLL, 0x80000001BEDECAE0);
}

uint64_t sub_1BEDE0E1C(uint64_t a1)
{
  return a1 + 2;
}

void sub_1BEDE0E54(char *a1)
{
  sub_1BEDE6F20(*a1);
}

void sub_1BEDE0E60()
{
  char *v0;

  sub_1BEDE5C98(*v0);
}

void sub_1BEDE0E68(uint64_t a1)
{
  char *v1;

  sub_1BEDE7074(a1, *v1);
}

void sub_1BEDE0E70(uint64_t a1)
{
  char *v1;

  sub_1BEDE5DDC(a1, *v1);
}

MessagesBlastDoorSupport::TopLevelDictionary::CodingKeys_optional sub_1BEDE0E78(Swift::String *a1)
{
  return TopLevelDictionary.CodingKeys.init(rawValue:)(*a1);
}

uint64_t sub_1BEDE0E84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = TopLevelDictionary.CodingKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

MessagesBlastDoorSupport::TopLevelDictionary::CodingKeys_optional sub_1BEDE0EAC@<W0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  MessagesBlastDoorSupport::TopLevelDictionary::CodingKeys_optional result;
  char v5;

  result.value = TopLevelDictionary.CodingKeys.init(rawValue:)(*(Swift::String *)&a1).value;
  *a2 = v5;
  return result;
}

void sub_1BEDE0EE0(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1BEDE0EEC()
{
  sub_1BEDE082C();
  return sub_1BEDE9DB8();
}

uint64_t sub_1BEDE0F14()
{
  sub_1BEDE082C();
  return sub_1BEDE9DC4();
}

uint64_t TopLevelDictionary.encrypted.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  BOOL v3;
  char v4;

  v1 = (_QWORD *)(v0 + *(int *)(type metadata accessor for TopLevelDictionary() + 28));
  v2 = v1[1];
  if (!v2 || (*v1 == 1701736302 ? (v3 = v2 == 0xE400000000000000) : (v3 = 0), v3))
    v4 = 0;
  else
    v4 = sub_1BEDE9CD4() ^ 1;
  return v4 & 1;
}

unint64_t sub_1BEDE0FA8()
{
  unint64_t result;

  result = qword_1EF578758;
  if (!qword_1EF578758)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for TopLevelDictionary.CodingKeys, &type metadata for TopLevelDictionary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578758);
  }
  return result;
}

unint64_t sub_1BEDE0FF0()
{
  unint64_t result;

  result = qword_1EF577D50;
  if (!qword_1EF577D50)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for TopLevelDictionary.CodingKeys, &type metadata for TopLevelDictionary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF577D50);
  }
  return result;
}

unint64_t sub_1BEDE1038()
{
  unint64_t result;

  result = qword_1EF577D48;
  if (!qword_1EF577D48)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for TopLevelDictionary.CodingKeys, &type metadata for TopLevelDictionary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF577D48);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for TopLevelDictionary(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1BEDE9038();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = (int *)type metadata accessor for IncomingPushPayload();
    v9 = v8[5];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    *(_QWORD *)v10 = *(_QWORD *)v11;
    v10[8] = v11[8];
    *((_BYTE *)a1 + v8[6]) = *((_BYTE *)a2 + v8[6]);
    *((_BYTE *)a1 + v8[7]) = *((_BYTE *)a2 + v8[7]);
    *((_BYTE *)a1 + v8[8]) = *((_BYTE *)a2 + v8[8]);
    v12 = v8[9];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v13[8] = v14[8];
    *(_QWORD *)v13 = *(_QWORD *)v14;
    v15 = a3[5];
    v16 = (char *)a1 + v15;
    v17 = (char *)a2 + v15;
    v18 = *((_QWORD *)v17 + 1);
    if (v18 >> 60 == 15)
    {
      *(_OWORD *)v16 = *(_OWORD *)v17;
    }
    else
    {
      v20 = *(_QWORD *)v17;
      sub_1BEDBB398(*(_QWORD *)v17, *((_QWORD *)v17 + 1));
      *(_QWORD *)v16 = v20;
      *((_QWORD *)v16 + 1) = v18;
    }
    v21 = a3[7];
    *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
    v22 = (_QWORD *)((char *)a1 + v21);
    v23 = (_QWORD *)((char *)a2 + v21);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TopLevelDictionary(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;

  v4 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = (uint64_t *)(a1 + *(int *)(a2 + 20));
  v6 = v5[1];
  if (v6 >> 60 != 15)
    sub_1BEDBB354(*v5, v6);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TopLevelDictionary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;

  v6 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = (int *)type metadata accessor for IncomingPushPayload();
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  *(_BYTE *)(a1 + v7[6]) = *(_BYTE *)(a2 + v7[6]);
  *(_BYTE *)(a1 + v7[7]) = *(_BYTE *)(a2 + v7[7]);
  *(_BYTE *)(a1 + v7[8]) = *(_BYTE *)(a2 + v7[8]);
  v11 = v7[9];
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v14 = a3[5];
  v15 = a1 + v14;
  v16 = (uint64_t *)(a2 + v14);
  v17 = v16[1];
  if (v17 >> 60 == 15)
  {
    *(_OWORD *)v15 = *(_OWORD *)v16;
  }
  else
  {
    v18 = *v16;
    sub_1BEDBB398(*v16, v16[1]);
    *(_QWORD *)v15 = v18;
    *(_QWORD *)(v15 + 8) = v17;
  }
  v19 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TopLevelDictionary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;

  v6 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = (int *)type metadata accessor for IncomingPushPayload();
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = *(_BYTE *)(v10 + 8);
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_BYTE *)(v9 + 8) = v11;
  *(_BYTE *)(a1 + v7[6]) = *(_BYTE *)(a2 + v7[6]);
  *(_BYTE *)(a1 + v7[7]) = *(_BYTE *)(a2 + v7[7]);
  *(_BYTE *)(a1 + v7[8]) = *(_BYTE *)(a2 + v7[8]);
  v12 = v7[9];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = *(_BYTE *)(v14 + 8);
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = v15;
  v16 = a3[5];
  v17 = (uint64_t *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v19 = *(_QWORD *)(a2 + v16 + 8);
  if (*(_QWORD *)(a1 + v16 + 8) >> 60 != 15)
  {
    if (v19 >> 60 != 15)
    {
      v21 = *v18;
      sub_1BEDBB398(v21, v19);
      v22 = *v17;
      v23 = v17[1];
      *v17 = v21;
      v17[1] = v19;
      sub_1BEDBB354(v22, v23);
      goto LABEL_8;
    }
    sub_1BEDE14B4((uint64_t)v17);
    goto LABEL_6;
  }
  if (v19 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)v17 = *(_OWORD *)v18;
    goto LABEL_8;
  }
  v20 = *v18;
  sub_1BEDBB398(v20, v19);
  *v17 = v20;
  v17[1] = v19;
LABEL_8:
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v24 = a3[7];
  v25 = (_QWORD *)(a1 + v24);
  v26 = (_QWORD *)(a2 + v24);
  *v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1BEDE14B4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0CB0338] - 8) + 8))();
  return a1;
}

uint64_t initializeWithTake for TopLevelDictionary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = (int *)type metadata accessor for IncomingPushPayload();
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  *(_BYTE *)(a1 + v7[6]) = *(_BYTE *)(a2 + v7[6]);
  *(_BYTE *)(a1 + v7[7]) = *(_BYTE *)(a2 + v7[7]);
  *(_BYTE *)(a1 + v7[8]) = *(_BYTE *)(a2 + v7[8]);
  v11 = v7[9];
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  v14 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v14) = *(_BYTE *)(a2 + v14);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for TopLevelDictionary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = (int *)type metadata accessor for IncomingPushPayload();
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  *(_BYTE *)(a1 + v7[6]) = *(_BYTE *)(a2 + v7[6]);
  *(_BYTE *)(a1 + v7[7]) = *(_BYTE *)(a2 + v7[7]);
  *(_BYTE *)(a1 + v7[8]) = *(_BYTE *)(a2 + v7[8]);
  v11 = v7[9];
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  v14 = a3[5];
  v15 = (uint64_t *)(a1 + v14);
  v16 = (uint64_t *)(a2 + v14);
  v17 = *(_QWORD *)(a1 + v14 + 8);
  if (v17 >> 60 != 15)
  {
    v18 = v16[1];
    if (v18 >> 60 != 15)
    {
      v19 = *v15;
      *v15 = *v16;
      v15[1] = v18;
      sub_1BEDBB354(v19, v17);
      goto LABEL_6;
    }
    sub_1BEDE14B4((uint64_t)v15);
  }
  *(_OWORD *)v15 = *(_OWORD *)v16;
LABEL_6:
  v20 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v21 = (_QWORD *)(a1 + v20);
  v22 = (uint64_t *)(a2 + v20);
  v24 = *v22;
  v23 = v22[1];
  *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TopLevelDictionary()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BEDE16F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = type metadata accessor for IncomingPushPayload();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for TopLevelDictionary()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BEDE1790(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for IncomingPushPayload();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28) + 8) = a2;
  return result;
}

uint64_t sub_1BEDE180C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for IncomingPushPayload();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TopLevelDictionary.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TopLevelDictionary.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BEDE196C + 4 * byte_1BEDEBFAD[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1BEDE19A0 + 4 * byte_1BEDEBFA8[v4]))();
}

uint64_t sub_1BEDE19A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDE19A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BEDE19B0);
  return result;
}

uint64_t sub_1BEDE19BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BEDE19C4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1BEDE19C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDE19D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TopLevelDictionary.CodingKeys()
{
  return &type metadata for TopLevelDictionary.CodingKeys;
}

void sub_1BEDE19EC(double a1, double a2)
{
  CGImage *v2;
  CGColorSpace *DeviceRGB;
  uint32_t BitmapInfo;
  CGContext *v7;
  _BYTE *v8;
  _BYTE *v9;

  if (a1 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (a1 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if ((*(_QWORD *)&a1 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(_QWORD *)&a2 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_16;
  }
  if (a2 <= -9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 >= 9.22337204e18)
  {
LABEL_18:
    __break(1u);
    return;
  }
  DeviceRGB = CGImageGetColorSpace(v2);
  if (!DeviceRGB)
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  BitmapInfo = CGImageGetBitmapInfo(v2);
  v7 = CGBitmapContextCreate(0, (uint64_t)a1, (uint64_t)a2, 8uLL, 0, DeviceRGB, BitmapInfo);

  if (v7)
  {
    CGContextSetInterpolationQuality(v7, kCGInterpolationHigh);
    sub_1BEDE99D4();
    if (!CGBitmapContextCreateImage(v7))
    {
      sub_1BEDE1BB4();
      swift_allocError();
      *v9 = 1;
      swift_willThrow();
    }

  }
  else
  {
    sub_1BEDE1BB4();
    swift_allocError();
    *v8 = 0;
    swift_willThrow();
  }
}

unint64_t sub_1BEDE1BB4()
{
  unint64_t result;

  result = qword_1EF578760;
  if (!qword_1EF578760)
  {
    result = MEMORY[0x1C3B85BE0]("ጬ(", &type metadata for MessagesAttachmentScalingError);
    atomic_store(result, (unint64_t *)&qword_1EF578760);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for MessagesAttachmentScalingError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BEDE1C44 + 4 * byte_1BEDEC1F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BEDE1C78 + 4 * byte_1BEDEC1F0[v4]))();
}

uint64_t sub_1BEDE1C78(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDE1C80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BEDE1C88);
  return result;
}

uint64_t sub_1BEDE1C94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BEDE1C9CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BEDE1CA0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDE1CA8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MessagesAttachmentScalingError()
{
  return &type metadata for MessagesAttachmentScalingError;
}

unint64_t sub_1BEDE1CC8()
{
  unint64_t result;

  result = qword_1EF578768;
  if (!qword_1EF578768)
  {
    result = MEMORY[0x1C3B85BE0](&unk_1BEDEC260, &type metadata for MessagesAttachmentScalingError);
    atomic_store(result, (unint64_t *)&qword_1EF578768);
  }
  return result;
}

void sub_1BEDE1D0C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1BEDE1D54@<X0>(int a1@<W8>)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (BYTE6(v2) == 16)
  {
    if (!a1)
      goto LABEL_13;
    if (a1 == 1)
    {
      if ((int)v3 <= v3 >> 32)
      {
        if (!sub_1BEDE8EDC())
        {
LABEL_18:
          sub_1BEDE8EF4();
          __break(1u);
          goto LABEL_19;
        }
        if (!__OFSUB__((int)v3, sub_1BEDE8F00()))
        {
          sub_1BEDE8EF4();
LABEL_13:
          sub_1BEDE9020();
          sub_1BEDBB354(v3, v2);
          v5 = sub_1BEDE9038();
          v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
          v7 = v1;
          v8 = 0;
          return v6(v7, v8, 1, v5);
        }
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      __break(1u);
    }
    else
    {
      v9 = *(_QWORD *)(v3 + 16);
      swift_retain();
      swift_retain();
      v10 = sub_1BEDE8EDC();
      if (!v10)
      {
LABEL_19:
        sub_1BEDE8EF4();
        __break(1u);
        JUMPOUT(0x1BEDE1FD0);
      }
      v11 = v10;
      v12 = sub_1BEDE8F00();
      v13 = __OFSUB__(v9, v12);
      v14 = v9 - v12;
      if (!v13)
      {
        sub_1BEDE8EF4();
        *(_DWORD *)(v4 - 84) = *(unsigned __int8 *)(v11 + v14);
        swift_release();
        swift_release();
        goto LABEL_13;
      }
    }
    __break(1u);
    goto LABEL_17;
  }
  sub_1BEDBB354(v3, v2);
  v5 = sub_1BEDE9038();
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  v7 = v1;
  v8 = 1;
  return v6(v7, v8, 1, v5);
}

uint64_t sub_1BEDE1FE0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];

  v8[3] = MEMORY[0x1E0DEAC20];
  v8[4] = MEMORY[0x1E0CB1AA8];
  v8[0] = a1;
  v8[1] = a2;
  v2 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x1E0DEAC20]);
  v3 = (_BYTE *)*v2;
  if (*v2 && (v4 = (_BYTE *)v2[1], v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      v6 = sub_1BEDE2BD0(v3, v4);
    }
    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      v6 = sub_1BEDE2C90((uint64_t)v3, (uint64_t)v4);
    }
    else
    {
      v6 = sub_1BEDE2D08((uint64_t)v3, (uint64_t)v4);
    }
  }
  else
  {
    v6 = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v6;
}

uint64_t UUIDData.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1BEDE9038();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t UUIDData.wrappedValue.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1BEDE9038();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*UUIDData.wrappedValue.modify())()
{
  return CGSizeMake;
}

uint64_t UUIDData.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v33[2];
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  unint64_t v44;
  _QWORD v45[4];

  v41 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF577D38);
  v4 = MEMORY[0x1E0C80A78](v3);
  v38 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x1E0C80A78](v4);
  v39 = (char *)v33 - v7;
  MEMORY[0x1E0C80A78](v6);
  v40 = (char *)v33 - v8;
  v9 = sub_1BEDE9038();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)v33 - v14;
  v16 = type metadata accessor for UUIDData();
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v19 = v42;
  sub_1BEDE9D88();
  if (v19)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v33[1] = v13;
  v34 = v15;
  v36 = v9;
  v37 = v10;
  v35 = v18;
  v20 = v40;
  v21 = v41;
  v42 = a1;
  __swift_project_boxed_opaque_existential_1(v45, v45[3]);
  sub_1BEDE0C6C();
  sub_1BEDE9CEC();
  v22 = v43;
  v23 = v44;
  sub_1BEDBB398(v43, v44);
  v24 = (uint64_t)v20;
  sub_1BEDE1D0C(v22, v23);
  v25 = v37;
  v26 = v20;
  v27 = v36;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v26, 1, v36) == 1)
  {
    sub_1BEDE27A4(v24);
    sub_1BEDE9B00();
    swift_allocError();
    v43 = 0;
    v44 = 0xE000000000000000;
    sub_1BEDE9AD0();
    sub_1BEDE992C();
    __asm { BR              X10 }
  }
  sub_1BEDBB354(v22, v23);
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 32);
  v29 = v34;
  v28(v34, v24, v27);
  v30 = (uint64_t)v35;
  v28(v35, (uint64_t)v29, v27);
  v31 = (uint64_t)v42;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
  sub_1BEDD7A54(v30, v21);
  return __swift_destroy_boxed_opaque_existential_0(v31);
}

uint64_t type metadata accessor for UUIDData()
{
  uint64_t result;

  result = qword_1EF577D98;
  if (!qword_1EF577D98)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BEDE27A4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF577D38);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t UUIDData.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _BYTE v8[24];
  uint64_t v9;

  v3 = sub_1BEDE9038();
  v4 = sub_1BEDE1FE0(v1, v1 + *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  v6 = v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BEDE9DA0();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v8, v9);
  sub_1BEDE0870();
  sub_1BEDE9CF8();
  sub_1BEDBB354(v4, v6);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
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

uint64_t sub_1BEDE28EC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return UUIDData.init(from:)(a1, a2);
}

uint64_t sub_1BEDE2900(_QWORD *a1)
{
  return UUIDData.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for UUIDData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BEDE9038();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t initializeWithCopy for UUIDData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for UUIDData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for UUIDData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for UUIDData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for UUIDData()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BEDE2A6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BEDE9038();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for UUIDData()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BEDE2AB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BEDE9038();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_1BEDE2AF4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BEDE9038();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_BYTE *sub_1BEDE2B5C@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
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
    result = (_BYTE *)sub_1BEDE2BD0(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_1BEDE2C90((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_1BEDE2D08((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_1BEDE2BD0(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
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

uint64_t sub_1BEDE2C90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_1BEDE8F0C();
  swift_allocObject();
  result = sub_1BEDE8ED0();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1BEDE8FD8();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1BEDE2D08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_1BEDE8F0C();
  swift_allocObject();
  result = sub_1BEDE8ED0();
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

uint64_t sub_1BEDE2D88(uint64_t a1)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  unint64_t v10;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578770);
  v10 = sub_1BEDE2E20();
  v8[0] = a1;
  v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  v3 = (_BYTE *)(*v2 + 32);
  v4 = &v3[*(_QWORD *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_1BEDE2B5C(v3, v4, &v7);
  v5 = v7;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

unint64_t sub_1BEDE2E20()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF578778;
  if (!qword_1EF578778)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF578770);
    result = MEMORY[0x1C3B85BE0](MEMORY[0x1E0CB1B08], v1);
    atomic_store(result, (unint64_t *)&qword_1EF578778);
  }
  return result;
}

uint64_t TopLevelDictionary.metadata.getter@<X0>(uint64_t a1@<X8>)
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
  _QWORD v11[2];

  v11[0] = a1;
  v2 = sub_1BEDE980C();
  MEMORY[0x1E0C80A78](v2);
  v3 = type metadata accessor for UUIDData();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BEDE9038();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for IncomingPushPayload();
  sub_1BEDE3020(v1, (uint64_t)v5);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
  sub_1BEDE9800();
  return sub_1BEDE9818();
}

uint64_t sub_1BEDE3020(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UUIDData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BEDE3064(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (!a1)
    return 0;
  v3 = a1;
  swift_bridgeObjectRetain();
  v4 = sub_1BEDE8FF0();
  v6 = v5;
  v7 = LiteMessageCompressor.encode(_:)(v4, v5);
  v9 = v8;
  v11 = v10;
  sub_1BEDBB354(v4, v6);
  swift_bridgeObjectRelease();
  if (v9 >> 60 == 15)
  {

    return 0;
  }
  if (a2)
    *a2 = v11;
  sub_1BEDBB398(v7, v9);
  v12 = sub_1BEDE8FE4();
  sub_1BEDD42F8(v7, v9);
  sub_1BEDD42F8(v7, v9);

  return v12;
}

id BlastDoorLiteMessageCompressor.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id BlastDoorLiteMessageCompressor.init()()
{
  void *v0;
  objc_super v2;

  LiteMessageCompressor.init()();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BlastDoorLiteMessageCompressor();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for BlastDoorLiteMessageCompressor()
{
  return objc_opt_self();
}

id BlastDoorLiteMessageCompressor.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BlastDoorLiteMessageCompressor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for BlastDoorLiteMessageCompressor()
{
  return swift_lookUpClassMethod();
}

uint64_t *sub_1BEDE32D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_1BEDE94AC();
    v10 = *(_QWORD *)(v9 - 8);
    v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    swift_bridgeObjectRetain();
    if (v11(v8, 1, v9))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t sub_1BEDE33D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_1BEDE94AC();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

_QWORD *sub_1BEDE344C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(char *, uint64_t, uint64_t);
  uint64_t v11;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_1BEDE94AC();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  swift_bridgeObjectRetain();
  if (v10(v7, 1, v8))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

_QWORD *sub_1BEDE3518(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1BEDE94AC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

_OWORD *sub_1BEDE3640(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1BEDE94AC();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

_QWORD *sub_1BEDE36FC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1BEDE94AC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_1BEDE3814()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BEDE3820(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_1BEDE38A0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BEDE38AC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for LiteTextMessageContent(uint64_t a1)
{
  return sub_1BEDE4798(a1, (uint64_t *)&unk_1EF578788);
}

void sub_1BEDE3938()
{
  unint64_t v0;

  sub_1BEDE39AC();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_1BEDE39AC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF578798)
  {
    sub_1BEDE94AC();
    v0 = sub_1BEDE9A7C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF578798);
  }
}

uint64_t *sub_1BEDE3A00(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  unsigned int (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1BEDE9038();
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
    v15 = sub_1BEDE94AC();
    v16 = *(_QWORD *)(v15 - 8);
    v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
    swift_bridgeObjectRetain();
    if (v17(v14, 1, v15))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
  }
  return a1;
}

uint64_t sub_1BEDE3B28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  v5 = a1 + *(int *)(a2 + 24);
  v6 = sub_1BEDE94AC();
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

uint64_t sub_1BEDE3BC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(const void *, uint64_t, uint64_t);
  uint64_t v17;

  v6 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (void *)(a1 + v8);
  v13 = (const void *)(a2 + v8);
  v14 = sub_1BEDE94AC();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48);
  swift_bridgeObjectRetain();
  if (v16(v13, 1, v14))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 16))(v12, v13, v14);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_1BEDE3CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;

  v6 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 24);
  v11 = (void *)(a1 + v10);
  v12 = (void *)(a2 + v10);
  v13 = sub_1BEDE94AC();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t sub_1BEDE3E18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_1BEDE94AC();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t sub_1BEDE3EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  v6 = sub_1BEDE9038();
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
  v13 = (void *)(a1 + v12);
  v14 = (void *)(a2 + v12);
  v15 = sub_1BEDE94AC();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 40))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t sub_1BEDE4040()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BEDE404C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_1BEDE9038();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_1BEDE40FC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BEDE4108(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_1BEDE9038();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for LiteReplyMessageContent(uint64_t a1)
{
  return sub_1BEDE4798(a1, (uint64_t *)&unk_1EF5787A0);
}

void sub_1BEDE41C8()
{
  unint64_t v0;
  unint64_t v1;

  sub_1BEDE9038();
  if (v0 <= 0x3F)
  {
    sub_1BEDE39AC();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *sub_1BEDE4254(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1BEDE92A8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1BEDE9038();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(a3 + 24);
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1BEDE431C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_1BEDE92A8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BEDE4390(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v6 = sub_1BEDE92A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1BEDE442C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v6 = sub_1BEDE92A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1BEDE44DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1BEDE92A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1BEDE456C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_1BEDE92A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1BEDE9038();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1BEDE460C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BEDE4618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  int v15;

  v6 = sub_1BEDE92A8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_1BEDE9038();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  v15 = v14 - 1;
  if (v15 < 0)
    v15 = -1;
  return (v15 + 1);
}

uint64_t sub_1BEDE46D0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BEDE46DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_1BEDE92A8();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_1BEDE9038();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  return result;
}

uint64_t type metadata accessor for LiteAcknowledgmentMessageContent(uint64_t a1)
{
  return sub_1BEDE4798(a1, (uint64_t *)&unk_1EF5787B0);
}

uint64_t sub_1BEDE4798(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BEDE47CC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1BEDE92A8();
  if (v1 <= 0x3F)
  {
    result = sub_1BEDE9038();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_1BEDE4858@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (uint64_t)sub_1BEDBACAC();
  if (!v1)
  {
    v8 = HIBYTE(v7) & 0xF;
    v14[0] = result;
    v14[1] = v7;
    if ((v7 & 0x2000000000000000) == 0)
      v8 = result & 0xFFFFFFFFFFFFLL;
    v14[2] = 0;
    v14[3] = v8;
    swift_bridgeObjectRetain();
    v9 = sub_1BEDDE1BC((uint64_t)v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v10 = Array<A>.spansAsPlainText.getter(v9);
    v12 = v11;
    swift_bridgeObjectRelease();
    *a1 = v10;
    a1[1] = v12;
    result = sub_1BEDD69FC(3);
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      sub_1BEDE94A0();
      v13 = type metadata accessor for LiteTextMessageContent(0);
      return sub_1BEDE50C0((uint64_t)v5, (uint64_t)a1 + *(int *)(v13 + 20));
    }
  }
  return result;
}

unint64_t sub_1BEDE4998@<X0>(char *a1@<X8>)
{
  uint64_t v1;
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
  unint64_t result;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  _QWORD v39[4];
  uint64_t v40;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF577D38);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BEDE9038();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (unint64_t)sub_1BEDBACAC();
  if (!v1)
  {
    v36 = v12;
    v37 = v5;
    v40 = v9;
    v15 = HIBYTE(v14) & 0xF;
    v39[0] = result;
    v39[1] = v14;
    if ((v14 & 0x2000000000000000) == 0)
      v15 = result & 0xFFFFFFFFFFFFLL;
    v39[2] = 0;
    v39[3] = v15;
    swift_bridgeObjectRetain();
    v16 = a1;
    v17 = sub_1BEDDE1BC((uint64_t)v39);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v18 = Array<A>.spansAsPlainText.getter(v17);
    v20 = v19;
    swift_bridgeObjectRelease();
    v21 = type metadata accessor for LiteReplyMessageContent(0);
    v22 = *(int *)(v21 + 20);
    v38 = v16;
    v23 = (uint64_t *)&v16[v22];
    *v23 = v18;
    v23[1] = v20;
    v24 = sub_1BEDD6564(16);
    v35 = v21;
    v26 = v25;
    sub_1BEDBB398(v24, v25);
    v27 = v26;
    sub_1BEDE1D0C(v24, v26);
    v28 = v40;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v40) == 1)
    {
      sub_1BEDE27A4((uint64_t)v8);
      sub_1BEDBB310();
      swift_allocError();
      *v29 = 2;
      swift_willThrow();
      sub_1BEDBB354(v24, v27);
      return swift_bridgeObjectRelease();
    }
    else
    {
      sub_1BEDBB354(v24, v27);
      v30 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
      v31 = v36;
      v30(v36, v8, v28);
      v32 = v38;
      v30(v38, v31, v28);
      result = sub_1BEDD69FC(3);
      v33 = (uint64_t)v37;
      v34 = v35;
      if ((result & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else
      {
        sub_1BEDE94A0();
        return sub_1BEDE50C0(v33, (uint64_t)&v32[*(int *)(v34 + 24)]);
      }
    }
  }
  return result;
}

uint64_t sub_1BEDE4C60@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  void (*v30)(char *, uint64_t, uint64_t);
  char *v31;
  char *v32;
  void (*v33)(char *, _QWORD, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  BOOL v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v61 = a2;
  v3 = sub_1BEDE98E4();
  MEMORY[0x1E0C80A78](v3);
  v60 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF577D38);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BEDE9038();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BEDE92A8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v54 - v17;
  v19 = v62;
  result = sub_1BEDD6774(4);
  if (!v19)
  {
    v55 = v11;
    v56 = v16;
    v58 = v8;
    v59 = a1;
    v57 = v9;
    v62 = v12;
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      sub_1BEDE929C();
      v21 = v13;
      v22 = v62;
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v61, v18, v62);
      v23 = sub_1BEDD6564(16);
      v25 = v24;
      sub_1BEDBB398(v23, v24);
      v26 = (uint64_t)v7;
      sub_1BEDE1D0C(v23, v25);
      v28 = v57;
      v27 = v58;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v57 + 48))(v26, 1, v58) == 1)
      {
        sub_1BEDE27A4(v26);
        sub_1BEDBB310();
        swift_allocError();
        *v29 = 2;
        swift_willThrow();
        sub_1BEDBB354(v23, v25);
        return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v61, v22);
      }
      sub_1BEDBB354(v23, v25);
      v30 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 32);
      v31 = v55;
      v30(v55, v26, v27);
      v54 = type metadata accessor for LiteAcknowledgmentMessageContent(0);
      v32 = v61;
      v30(&v61[*(int *)(v54 + 20)], (uint64_t)v31, v27);
      v33 = *(void (**)(char *, _QWORD, uint64_t))(v21 + 104);
      v34 = v56;
      v33(v56, *MEMORY[0x1E0D029B8], v62);
      sub_1BEDE5108();
      sub_1BEDE9968();
      sub_1BEDE9968();
      v35 = v64;
      v36 = v63;
      v37 = *(void (**)(char *, uint64_t))(v21 + 8);
      v37(v34, v62);
      v38 = v35 == v36;
      v39 = v32;
      v40 = v62;
      if (!v38)
      {
        v33(v34, *MEMORY[0x1E0D029A8], v62);
        sub_1BEDE9968();
        sub_1BEDE9968();
        v41 = v64;
        v42 = v63;
        result = ((uint64_t (*)(char *, uint64_t))v37)(v34, v40);
        if (v41 != v42)
        {
          v43 = &v39[*(int *)(v54 + 24)];
          *(_QWORD *)v43 = 0;
          *((_QWORD *)v43 + 1) = 0;
          return result;
        }
      }
      result = sub_1BEDD69FC(3);
      if ((result & 0x8000000000000000) == 0)
      {
        v44 = sub_1BEDD6564(result);
        v46 = v45;
        sub_1BEDE98D8();
        v47 = sub_1BEDE98CC();
        if (v48)
        {
          v49 = v47;
          v50 = v48;
          result = sub_1BEDBB354(v44, v46);
          v51 = (uint64_t *)&v39[*(int *)(v54 + 24)];
          *v51 = v49;
          v51[1] = v50;
        }
        else
        {
          sub_1BEDBB310();
          swift_allocError();
          *v52 = 0;
          swift_willThrow();
          sub_1BEDBB354(v44, v46);
          v53 = v58;
          v37(v39, v62);
          return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(&v39[*(int *)(v54 + 20)], v53);
        }
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1BEDE50C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5784F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1BEDE5108()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF5787C0;
  if (!qword_1EF5787C0)
  {
    v1 = sub_1BEDE92A8();
    result = MEMORY[0x1C3B85BE0](MEMORY[0x1E0D029D0], v1);
    atomic_store(result, (unint64_t *)&qword_1EF5787C0);
  }
  return result;
}

uint64_t SatelliteSMSTextMessageUnpacker.unpack(from:)@<X0>(unint64_t a1@<X8>)
{
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
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  char *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  char v63;
  unint64_t v64;

  v64 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578468);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1BEDE9854();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BEDE98E4();
  MEMORY[0x1E0C80A78](v9);
  sub_1BEDE8F30();
  swift_allocObject();
  v10 = sub_1BEDE8F24();
  sub_1BEDE58CC();
  sub_1BEDE8F18();
  if (v1)
    return swift_release();
  v54 = v5;
  v55 = v4;
  v57 = v6;
  v58 = v10;
  v13 = v60;
  v12 = v61;
  if (v63)
    v14 = 0;
  else
    v14 = v62;
  v56 = v61;
  v59 = v60;
  if (v61 >> 60 == 15)
  {
    sub_1BEDE9848();
    sub_1BEDD5B28();
    v15 = (void *)sub_1BEDE9A70();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1BEDEABE0;
    v17 = v57;
    v18 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
    v19 = v54;
    v20 = (uint64_t)v55;
    v18(v55, v8, v54);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v17 + 56))(v20, 0, 1, v19);
    v21 = sub_1BEDE9710();
    v23 = v22;
    sub_1BEDE5B84(v20);
    *(_QWORD *)(v16 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v16 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v16 + 32) = v21;
    *(_QWORD *)(v16 + 40) = v23;
    sub_1BEDE99F8();
    sub_1BEDE9068();

    swift_bridgeObjectRelease();
    sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    swift_allocError();
    v18(v24, v8, v19);
    swift_willThrow();
    swift_release();
    v25 = v59;
    v26 = v56;
  }
  else
  {
    sub_1BEDD02C4(v60, v61);
    if (v14)
    {
      if (qword_1EF578198 != -1)
        swift_once();
      v60 = qword_1EF57C1E0;
      swift_bridgeObjectRetain();
      v13 = LiteMessageCompressor.decode(_:codecID:)(v59, v12, v14);
      v28 = v27;
      swift_bridgeObjectRelease();
      if (v28 >> 60 == 15)
      {
        v29 = v8;
        sub_1BEDE9848();
        sub_1BEDD5B28();
        v30 = (void *)sub_1BEDE9A70();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
        v31 = swift_allocObject();
        *(_OWORD *)(v31 + 16) = xmmword_1BEDEABE0;
        v32 = v57;
        v33 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
        v34 = v54;
        v35 = (uint64_t)v55;
        v33(v55, v29, v54);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v32 + 56))(v35, 0, 1, v34);
        v36 = sub_1BEDE9710();
        v38 = v37;
        sub_1BEDE5B84(v35);
        *(_QWORD *)(v31 + 56) = MEMORY[0x1E0DEA968];
        *(_QWORD *)(v31 + 64) = sub_1BEDCD658();
        *(_QWORD *)(v31 + 32) = v36;
        *(_QWORD *)(v31 + 40) = v38;
        sub_1BEDE99F8();
        sub_1BEDE9068();

        swift_bridgeObjectRelease();
        sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
        swift_allocError();
        v33(v39, v29, v34);
        swift_willThrow();
        swift_release();
        v40 = v59;
        v41 = v56;
        sub_1BEDD42F8(v59, v56);
        sub_1BEDD42F8(v40, v41);
        return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v29, v34);
      }
    }
    else
    {
      sub_1BEDBB398(v13, v12);
      v28 = v12;
    }
    v17 = v57;
    sub_1BEDE98D8();
    sub_1BEDE98CC();
    if (v42)
    {
      sub_1BEDE5910();
      swift_bridgeObjectRelease();
      sub_1BEDE9644();
      sub_1BEDBB354(v13, v28);
      v43 = v59;
      v44 = v56;
      sub_1BEDD42F8(v59, v56);
      sub_1BEDD42F8(v43, v44);
      return swift_release();
    }
    sub_1BEDE9848();
    sub_1BEDD5B28();
    v45 = (void *)sub_1BEDE9A70();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FA8);
    v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = xmmword_1BEDEABE0;
    v57 = *(_QWORD *)(v17 + 16);
    v64 = v28;
    v19 = v54;
    v47 = (uint64_t)v55;
    ((void (*)(char *, char *, uint64_t))v57)(v55, v8, v54);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v17 + 56))(v47, 0, 1, v19);
    v48 = sub_1BEDE9710();
    v50 = v49;
    sub_1BEDE5B84(v47);
    *(_QWORD *)(v46 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v46 + 64) = sub_1BEDCD658();
    *(_QWORD *)(v46 + 32) = v48;
    *(_QWORD *)(v46 + 40) = v50;
    sub_1BEDE99F8();
    sub_1BEDE9068();

    swift_bridgeObjectRelease();
    sub_1BEDD47C0(&qword_1EF5781F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D03288], MEMORY[0x1E0D032A0]);
    swift_allocError();
    ((void (*)(uint64_t, char *, uint64_t))v57)(v51, v8, v19);
    swift_willThrow();
    sub_1BEDBB354(v13, v64);
    swift_release();
    v52 = v59;
    v53 = v56;
    sub_1BEDD42F8(v59, v56);
    v25 = v52;
    v26 = v53;
  }
  sub_1BEDD42F8(v25, v26);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v8, v19);
}

unint64_t sub_1BEDE58CC()
{
  unint64_t result;

  result = qword_1EF5787C8;
  if (!qword_1EF5787C8)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for SatelliteSMSTextMessageDictionary, &type metadata for SatelliteSMSTextMessageDictionary);
    atomic_store(result, (unint64_t *)&qword_1EF5787C8);
  }
  return result;
}

_QWORD *sub_1BEDE5910()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  swift_bridgeObjectRetain();
  v0 = sub_1BEDE9938();
  if (!v1)
  {
    v4 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_22;
  }
  v2 = v0;
  v3 = v1;
  v4 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  do
  {
    v5 = 0;
    while (1)
    {
      if ((v5 & 1) == 0)
      {
        if (v2 == 1 && v3 == 0xE100000000000000)
        {
          v5 = 1;
          goto LABEL_6;
        }
        v5 = 1;
        if ((sub_1BEDE9CD4() & 1) != 0)
          goto LABEL_6;
        if (v2 == 25 && v3 == 0xE100000000000000 || (sub_1BEDE9CD4() & 1) != 0)
          break;
      }
      MEMORY[0x1C3B851F0](v2, v3);
      v5 = 0;
LABEL_6:
      swift_bridgeObjectRelease();
      v2 = sub_1BEDE9938();
      v3 = v6;
      if (!v6)
        goto LABEL_22;
    }
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v4 = sub_1BEDD5FB8(0, v4[2] + 1, 1, v4);
    v8 = v4[2];
    v7 = v4[3];
    if (v8 >= v7 >> 1)
      v4 = sub_1BEDD5FB8((_QWORD *)(v7 > 1), v8 + 1, 1, v4);
    v4[2] = v8 + 1;
    v9 = &v4[2 * v8];
    v9[4] = 0;
    v9[5] = 0xE000000000000000;
    v2 = sub_1BEDE9938();
    v3 = v10;
  }
  while (v10);
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1BEDE5B70@<X0>(unint64_t a1@<X8>)
{
  return SatelliteSMSTextMessageUnpacker.unpack(from:)(a1);
}

uint64_t sub_1BEDE5B84(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578468);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BEDE5BC4()
{
  return sub_1BEDD47C0(&qword_1EF5782F0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D02FE8], MEMORY[0x1E0D02FE0]);
}

ValueMetadata *type metadata accessor for SatelliteSMSTextMessageUnpacker()
{
  return &type metadata for SatelliteSMSTextMessageUnpacker;
}

void sub_1BEDE5C00(char a1)
{
  sub_1BEDE9D58();
  __asm { BR              X10 }
}

uint64_t sub_1BEDE5C44()
{
  sub_1BEDE98FC();
  swift_bridgeObjectRelease();
  return sub_1BEDE9D7C();
}

void sub_1BEDE5C98(char a1)
{
  sub_1BEDE9D58();
  __asm { BR              X10 }
}

uint64_t sub_1BEDE5CF0()
{
  sub_1BEDE98FC();
  swift_bridgeObjectRelease();
  return sub_1BEDE9D7C();
}

uint64_t sub_1BEDE5D58()
{
  sub_1BEDE9D58();
  sub_1BEDE98FC();
  swift_bridgeObjectRelease();
  return sub_1BEDE9D7C();
}

void sub_1BEDE5DDC(uint64_t a1, char a2)
{
  sub_1BEDE9D58();
  __asm { BR              X10 }
}

uint64_t sub_1BEDE5E30()
{
  sub_1BEDE98FC();
  swift_bridgeObjectRelease();
  return sub_1BEDE9D7C();
}

void sub_1BEDE5E98(uint64_t a1, char a2)
{
  sub_1BEDE9D58();
  __asm { BR              X10 }
}

uint64_t sub_1BEDE5ED8()
{
  sub_1BEDE98FC();
  swift_bridgeObjectRelease();
  return sub_1BEDE9D7C();
}

uint64_t sub_1BEDE5F2C()
{
  sub_1BEDE9D58();
  sub_1BEDE98FC();
  swift_bridgeObjectRelease();
  return sub_1BEDE9D7C();
}

unint64_t SatelliteSMSTextMessageDictionary.CodingKeys.stringValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000013;
  else
    return 0xD00000000000001ALL;
}

uint64_t SatelliteSMSTextMessageDictionary.compressedText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_1BEDD02C4(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t SatelliteSMSTextMessageDictionary.compressedText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1BEDD42F8(*(_QWORD *)v2, *(_QWORD *)(v2 + 8));
  *(_QWORD *)v2 = a1;
  *(_QWORD *)(v2 + 8) = a2;
  return result;
}

uint64_t (*SatelliteSMSTextMessageDictionary.compressedText.modify())()
{
  return CGSizeMake;
}

uint64_t SatelliteSMSTextMessageDictionary.codecID.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t SatelliteSMSTextMessageDictionary.codecID.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = result;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*SatelliteSMSTextMessageDictionary.codecID.modify())()
{
  return CGSizeMake;
}

uint64_t SatelliteSMSTextMessageDictionary.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  uint64_t v12;
  uint64_t v13;
  int v14;
  char v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5787D0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  v11[0] = v1[2];
  v14 = *((unsigned __int8 *)v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BEDE64D0();
  sub_1BEDE9DAC();
  v12 = v8;
  v13 = v7;
  v15 = 0;
  sub_1BEDE0870();
  v9 = v11[1];
  sub_1BEDE9C80();
  if (!v9)
  {
    LOBYTE(v12) = 1;
    sub_1BEDE9C74();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SatelliteSMSTextMessageDictionary.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  char v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  char v18;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5787E0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BEDE64D0();
  sub_1BEDE9D94();
  if (v2)
  {
    v10 = 0;
    v11 = 0xF000000000000000;
  }
  else
  {
    v18 = 0;
    sub_1BEDE0C6C();
    sub_1BEDE9BFC();
    v10 = v16;
    v11 = v17;
    LOBYTE(v16) = 1;
    sub_1BEDD02C4(v10, v17);
    v12 = sub_1BEDE9BF0();
    v13 = v8;
    v15 = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v13, v5);
    *(_QWORD *)a2 = v10;
    *(_QWORD *)(a2 + 8) = v11;
    *(_QWORD *)(a2 + 16) = v12;
    *(_BYTE *)(a2 + 24) = v15 & 1;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_1BEDD42F8(v10, v11);
}

uint64_t sub_1BEDE6384@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SatelliteSMSTextMessageDictionary.init(from:)(a1, a2);
}

uint64_t sub_1BEDE6398(_QWORD *a1)
{
  return SatelliteSMSTextMessageDictionary.encode(to:)(a1);
}

MessagesBlastDoorSupport::SatelliteSMSTextMessageDictionary::CodingKeys_optional __swiftcall SatelliteSMSTextMessageDictionary.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  MessagesBlastDoorSupport::SatelliteSMSTextMessageDictionary::CodingKeys_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1BEDE9BB4();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

MessagesBlastDoorSupport::SatelliteSMSTextMessageDictionary::CodingKeys_optional __swiftcall SatelliteSMSTextMessageDictionary.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  MessagesBlastDoorSupport::SatelliteSMSTextMessageDictionary::CodingKeys_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1BEDE9BB4();
  result.value = swift_bridgeObjectRelease();
  if (v3)
  {
    if (v3 == 1)
      v5 = 1;
    else
      v5 = 2;
  }
  else
  {
    v5 = 0;
  }
  *v2 = v5;
  return result;
}

MessagesBlastDoorSupport::SatelliteSMSTextMessageDictionary::CodingKeys_optional __swiftcall SatelliteSMSTextMessageDictionary.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  _BYTE *v1;

  *v1 = 2;
  return (MessagesBlastDoorSupport::SatelliteSMSTextMessageDictionary::CodingKeys_optional)intValue;
}

uint64_t SatelliteSMSTextMessageDictionary.CodingKeys.intValue.getter()
{
  return 0;
}

unint64_t SatelliteSMSTextMessageDictionary.CodingKeys.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000013;
  else
    return 0xD00000000000001ALL;
}

unint64_t sub_1BEDE64D0()
{
  unint64_t result;

  result = qword_1EF5787D8;
  if (!qword_1EF5787D8)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for SatelliteSMSTextMessageDictionary.CodingKeys, &type metadata for SatelliteSMSTextMessageDictionary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5787D8);
  }
  return result;
}

uint64_t sub_1BEDE6514(char *a1, char *a2)
{
  return sub_1BEDE6CF8(*a1, *a2);
}

unint64_t sub_1BEDE6524()
{
  unint64_t result;

  result = qword_1EF5787E8;
  if (!qword_1EF5787E8)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for SatelliteSMSTextMessageDictionary.CodingKeys, &type metadata for SatelliteSMSTextMessageDictionary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5787E8);
  }
  return result;
}

uint64_t sub_1BEDE6568()
{
  return sub_1BEDE5D58();
}

uint64_t sub_1BEDE6570()
{
  sub_1BEDE98FC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BEDE65D0()
{
  return sub_1BEDE5F2C();
}

MessagesBlastDoorSupport::SatelliteSMSTextMessageDictionary::CodingKeys_optional sub_1BEDE65D8(Swift::String *a1)
{
  return SatelliteSMSTextMessageDictionary.CodingKeys.init(rawValue:)(*a1);
}

void sub_1BEDE65E4(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  if (*v1)
    v2 = 0xD000000000000013;
  else
    v2 = 0xD00000000000001ALL;
  v3 = 0x80000001BEDECB80;
  if (*v1)
    v3 = 0x80000001BEDECBA0;
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_1BEDE662C()
{
  unint64_t result;

  result = qword_1EF5787F0;
  if (!qword_1EF5787F0)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for SatelliteSMSTextMessageDictionary.CodingKeys, &type metadata for SatelliteSMSTextMessageDictionary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5787F0);
  }
  return result;
}

unint64_t sub_1BEDE6674()
{
  unint64_t result;

  result = qword_1EF5787F8;
  if (!qword_1EF5787F8)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for SatelliteSMSTextMessageDictionary.CodingKeys, &type metadata for SatelliteSMSTextMessageDictionary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF5787F8);
  }
  return result;
}

unint64_t sub_1BEDE66B8()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000013;
  else
    return 0xD00000000000001ALL;
}

uint64_t sub_1BEDE66FC()
{
  sub_1BEDE64D0();
  return sub_1BEDE9DB8();
}

uint64_t sub_1BEDE6724()
{
  sub_1BEDE64D0();
  return sub_1BEDE9DC4();
}

uint64_t initializeBufferWithCopyOfBuffer for SatelliteSMSTextMessageDictionary(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t *destroy for SatelliteSMSTextMessageDictionary(uint64_t *result)
{
  unint64_t v1;

  v1 = result[1];
  if (v1 >> 60 != 15)
    return (uint64_t *)sub_1BEDBB354(*result, v1);
  return result;
}

uint64_t initializeWithCopy for SatelliteSMSTextMessageDictionary(uint64_t a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v5 = *a2;
    sub_1BEDBB398(*a2, a2[1]);
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v4;
  }
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  return a1;
}

uint64_t assignWithCopy for SatelliteSMSTextMessageDictionary(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)(a1 + 8) >> 60 != 15)
  {
    if (v4 >> 60 != 15)
    {
      v6 = *(_QWORD *)a2;
      sub_1BEDBB398(*(_QWORD *)a2, *(_QWORD *)(a2 + 8));
      v7 = *(_QWORD *)a1;
      v8 = *(_QWORD *)(a1 + 8);
      *(_QWORD *)a1 = v6;
      *(_QWORD *)(a1 + 8) = v4;
      sub_1BEDBB354(v7, v8);
      goto LABEL_8;
    }
    sub_1BEDE14B4(a1);
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  v5 = *(_QWORD *)a2;
  sub_1BEDBB398(*(_QWORD *)a2, *(_QWORD *)(a2 + 8));
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v4;
LABEL_8:
  v9 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v9;
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

uint64_t assignWithTake for SatelliteSMSTextMessageDictionary(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4 >> 60 != 15)
  {
    v5 = *(_QWORD *)(a2 + 8);
    if (v5 >> 60 != 15)
    {
      v6 = *(_QWORD *)a1;
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = v5;
      sub_1BEDBB354(v6, v4);
      goto LABEL_6;
    }
    sub_1BEDE14B4(a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for SatelliteSMSTextMessageDictionary(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xC && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 12);
  v3 = *(_QWORD *)(a1 + 8) >> 60;
  if (((4 * (_DWORD)v3) & 0xC) != 0)
    v4 = 14 - ((4 * v3) & 0xC | (v3 >> 2));
  else
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SatelliteSMSTextMessageDictionary(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 12;
    if (a3 >= 0xC)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xC)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SatelliteSMSTextMessageDictionary()
{
  return &type metadata for SatelliteSMSTextMessageDictionary;
}

uint64_t storeEnumTagSinglePayload for SatelliteSMSTextMessageDictionary.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BEDE6A4C + 4 * byte_1BEDEC4D9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BEDE6A80 + 4 * byte_1BEDEC4D4[v4]))();
}

uint64_t sub_1BEDE6A80(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDE6A88(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BEDE6A90);
  return result;
}

uint64_t sub_1BEDE6A9C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BEDE6AA4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BEDE6AA8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDE6AB0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SatelliteSMSTextMessageDictionary.CodingKeys()
{
  return &type metadata for SatelliteSMSTextMessageDictionary.CodingKeys;
}

uint64_t NSUserDefaults.isMessagesLockdownModeEnabled.getter()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;
  void *v5;
  id v6;
  unsigned __int8 v7;
  _OWORD v8[2];
  _BYTE v9[24];
  uint64_t v10;

  v1 = v0;
  sub_1BEDE905C();
  v2 = (void *)sub_1BEDE9044();
  v3 = MEMORY[0x1C3B84920]();

  if ((v3 & 1) != 0)
    return 1;
  v5 = (void *)sub_1BEDE989C();
  v6 = objc_msgSend(v1, sel_objectForKey_inDomain_, v5, *MEMORY[0x1E0CB2B58]);

  if (v6)
  {
    sub_1BEDE9AA0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_1BEDE6BE8((uint64_t)v8, (uint64_t)v9);
  if (v10)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v7;
  }
  else
  {
    sub_1BEDE6C30((uint64_t)v9);
  }
  return 0;
}

uint64_t sub_1BEDE6BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BEDE6C30(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED702FF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t RelayGroupMutationPayload.CodingKeys.stringValue.getter()
{
  char *v0;

  return qword_1BEDEC9D8[*v0];
}

void RelayGroupMutationPayload.knownType.getter(_BYTE *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  if ((unint64_t)*v1 >= 4)
    LOBYTE(v2) = 4;
  *a1 = v2;
}

uint64_t RelayGroupMutationPayload.knownParticipantChangeType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  if ((*(_BYTE *)(v1 + 128) & 1) == 0)
    return sub_1BEDE9734();
  v3 = sub_1BEDE9740();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(a1, 1, 1, v3);
}

uint64_t sub_1BEDE6CF8(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000013;
  else
    v3 = 0xD00000000000001ALL;
  if (v2)
    v4 = 0x80000001BEDECB80;
  else
    v4 = 0x80000001BEDECBA0;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000013;
  else
    v5 = 0xD00000000000001ALL;
  if ((a2 & 1) != 0)
    v6 = 0x80000001BEDECBA0;
  else
    v6 = 0x80000001BEDECB80;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_1BEDE9CD4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1BEDE6DA0(char a1, char a2)
{
  char v2;

  if (qword_1BEDEC9D8[a1] == qword_1BEDEC9D8[a2])
    v2 = 1;
  else
    v2 = sub_1BEDE9CD4();
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

void sub_1BEDE6E04(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1BEDE6E3C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1BEDE6E88 + 4 * byte_1BEDEC6C6[a2]))(99);
}

uint64_t sub_1BEDE6E88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == 99 && v1 == v2)
    v3 = 1;
  else
    v3 = sub_1BEDE9CD4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_1BEDE6F20(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1BEDE6F6C(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1BEDE6FC0 + 4 * byte_1BEDEC6D0[a2]))(a3 + 2);
}

uint64_t sub_1BEDE6FC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;

  if (a1 == a3 + 2 && v3 == 0x80000001BEDECB00)
    v4 = 1;
  else
    v4 = sub_1BEDE9CD4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_1BEDE7048()
{
  sub_1BEDE98FC();
  return swift_bridgeObjectRelease();
}

void sub_1BEDE7074(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1BEDE70B8()
{
  sub_1BEDE98FC();
  return swift_bridgeObjectRelease();
}

MessagesBlastDoorSupport::RelayGroupMutationType_optional __swiftcall RelayGroupMutationType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (MessagesBlastDoorSupport::RelayGroupMutationType_optional)rawValue;
}

uint64_t RelayGroupMutationType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

MessagesBlastDoorSupport::RelayGroupMutationType_optional sub_1BEDE7120(Swift::Int *a1)
{
  return RelayGroupMutationType.init(rawValue:)(*a1);
}

void sub_1BEDE7128(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t RelayGroupMutationPayload.type.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t RelayGroupMutationPayload.type.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*RelayGroupMutationPayload.type.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.service.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RelayGroupMutationPayload.service.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*RelayGroupMutationPayload.service.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.groupID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RelayGroupMutationPayload.groupID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*RelayGroupMutationPayload.groupID.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.originalGroupID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RelayGroupMutationPayload.originalGroupID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

uint64_t (*RelayGroupMutationPayload.originalGroupID.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.guid.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RelayGroupMutationPayload.guid.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return result;
}

uint64_t (*RelayGroupMutationPayload.guid.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.destinationCallerID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RelayGroupMutationPayload.destinationCallerID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = a2;
  return result;
}

uint64_t (*RelayGroupMutationPayload.destinationCallerID.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.sender.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RelayGroupMutationPayload.sender.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 88) = a1;
  *(_QWORD *)(v2 + 96) = a2;
  return result;
}

uint64_t (*RelayGroupMutationPayload.sender.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.updatedName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RelayGroupMutationPayload.updatedName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 104) = a1;
  *(_QWORD *)(v2 + 112) = a2;
  return result;
}

uint64_t (*RelayGroupMutationPayload.updatedName.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.participantChangeType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 120);
}

uint64_t RelayGroupMutationPayload.participantChangeType.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = result;
  *(_BYTE *)(v2 + 128) = a2 & 1;
  return result;
}

uint64_t (*RelayGroupMutationPayload.participantChangeType.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.changedParticipants.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t RelayGroupMutationPayload.changedParticipants.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 136) = a1;
  return result;
}

uint64_t (*RelayGroupMutationPayload.changedParticipants.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.fromMe.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 144);
}

uint64_t RelayGroupMutationPayload.fromMe.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 144) = result;
  return result;
}

uint64_t (*RelayGroupMutationPayload.fromMe.modify())()
{
  return CGSizeMake;
}

MessagesBlastDoorSupport::RelayGroupMutationPayload::CodingKeys_optional __swiftcall RelayGroupMutationPayload.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  MessagesBlastDoorSupport::RelayGroupMutationPayload::CodingKeys_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1BEDE9BB4();
  result.value = swift_bridgeObjectRelease();
  v5 = 11;
  if (v3 < 0xB)
    v5 = v3;
  *v2 = v5;
  return result;
}

MessagesBlastDoorSupport::RelayGroupMutationPayload::CodingKeys_optional __swiftcall RelayGroupMutationPayload.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  _BYTE *v1;
  _BYTE *v2;
  MessagesBlastDoorSupport::RelayGroupMutationPayload::CodingKeys_optional result;
  char v4;

  v2 = v1;
  result.value = RelayGroupMutationPayload.CodingKeys.init(rawValue:)(stringValue).value;
  *v2 = v4;
  return result;
}

MessagesBlastDoorSupport::RelayGroupMutationPayload::CodingKeys_optional __swiftcall RelayGroupMutationPayload.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  _BYTE *v1;

  *v1 = 11;
  return (MessagesBlastDoorSupport::RelayGroupMutationPayload::CodingKeys_optional)intValue;
}

uint64_t RelayGroupMutationPayload.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t RelayGroupMutationPayload.CodingKeys.rawValue.getter()
{
  char *v0;

  return qword_1BEDEC9D8[*v0];
}

uint64_t sub_1BEDE75AC(char *a1, char *a2)
{
  return sub_1BEDE6DA0(*a1, *a2);
}

uint64_t sub_1BEDE75B8()
{
  sub_1BEDE9D58();
  sub_1BEDE7048();
  return sub_1BEDE9D7C();
}

uint64_t sub_1BEDE75FC()
{
  return sub_1BEDE7048();
}

uint64_t sub_1BEDE7604()
{
  sub_1BEDE9D58();
  sub_1BEDE7048();
  return sub_1BEDE9D7C();
}

MessagesBlastDoorSupport::RelayGroupMutationPayload::CodingKeys_optional sub_1BEDE7644(Swift::String *a1)
{
  return RelayGroupMutationPayload.CodingKeys.init(rawValue:)(*a1);
}

uint64_t sub_1BEDE7650@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = RelayGroupMutationPayload.CodingKeys.rawValue.getter();
  *a1 = result;
  a1[1] = 0xE100000000000000;
  return result;
}

uint64_t sub_1BEDE7678()
{
  return RelayGroupMutationPayload.CodingKeys.stringValue.getter();
}

MessagesBlastDoorSupport::RelayGroupMutationPayload::CodingKeys_optional sub_1BEDE7690@<W0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  MessagesBlastDoorSupport::RelayGroupMutationPayload::CodingKeys_optional result;
  char v5;

  result.value = RelayGroupMutationPayload.CodingKeys.init(rawValue:)(*(Swift::String *)&a1).value;
  *a2 = v5;
  return result;
}

void sub_1BEDE76C4(_BYTE *a1@<X8>)
{
  *a1 = 11;
}

uint64_t sub_1BEDE76D0()
{
  sub_1BEDE7A58();
  return sub_1BEDE9DB8();
}

uint64_t sub_1BEDE76F8()
{
  sub_1BEDE7A58();
  return sub_1BEDE9DC4();
}

uint64_t RelayGroupMutationPayload.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
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
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  int v22;
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
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578800);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 8);
  v35 = *(_QWORD *)(v1 + 16);
  v36 = v7;
  v8 = *(_QWORD *)(v1 + 24);
  v33 = *(_QWORD *)(v1 + 32);
  v34 = v8;
  v9 = *(_QWORD *)(v1 + 40);
  v31 = *(_QWORD *)(v1 + 48);
  v32 = v9;
  v10 = *(_QWORD *)(v1 + 56);
  v29 = *(_QWORD *)(v1 + 64);
  v30 = v10;
  v11 = *(_QWORD *)(v1 + 72);
  v27 = *(_QWORD *)(v1 + 80);
  v28 = v11;
  v12 = *(_QWORD *)(v1 + 88);
  v25 = *(_QWORD *)(v1 + 96);
  v26 = v12;
  v13 = *(_QWORD *)(v1 + 104);
  v23 = *(_QWORD *)(v1 + 112);
  v24 = v13;
  v21 = *(_QWORD *)(v1 + 120);
  v22 = *(unsigned __int8 *)(v1 + 128);
  v14 = *(_QWORD *)(v1 + 136);
  v15 = a1[3];
  v16 = a1;
  v18 = v17;
  __swift_project_boxed_opaque_existential_1(v16, v15);
  sub_1BEDE7A58();
  sub_1BEDE9DAC();
  LOBYTE(v39) = 0;
  v19 = v37;
  sub_1BEDE9CA4();
  if (!v19)
  {
    LOBYTE(v39) = 1;
    sub_1BEDE9C98();
    LOBYTE(v39) = 2;
    sub_1BEDE9C98();
    LOBYTE(v39) = 3;
    sub_1BEDE9C98();
    LOBYTE(v39) = 4;
    sub_1BEDE9C98();
    LOBYTE(v39) = 5;
    sub_1BEDE9C5C();
    LOBYTE(v39) = 6;
    sub_1BEDE9C5C();
    LOBYTE(v39) = 7;
    sub_1BEDE9C5C();
    LOBYTE(v39) = 8;
    sub_1BEDE9C74();
    v39 = v14;
    v38 = 9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578810);
    sub_1BEDE8270(&qword_1EF578818, MEMORY[0x1E0DEA970], MEMORY[0x1E0DEA0B8]);
    sub_1BEDE9C80();
    LOBYTE(v39) = 10;
    sub_1BEDE9C68();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v18);
}

unint64_t sub_1BEDE7A58()
{
  unint64_t result;

  result = qword_1EF578808;
  if (!qword_1EF578808)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for RelayGroupMutationPayload.CodingKeys, &type metadata for RelayGroupMutationPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578808);
  }
  return result;
}

uint64_t RelayGroupMutationPayload.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  int v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v41;
  int v42;
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
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  char v67;
  _QWORD v68[16];
  char v69;
  _BYTE v70[7];
  uint64_t v71;
  char v72;
  char v73;
  _BYTE v74[7];
  char v75;
  _QWORD *v76;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578820);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = 1;
  v9 = a1[3];
  v76 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_1BEDE7A58();
  sub_1BEDE9D94();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v76);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    LOBYTE(v68[0]) = 0;
    v10 = sub_1BEDE9C20();
    LOBYTE(v68[0]) = 1;
    v53 = sub_1BEDE9C14();
    LOBYTE(v68[0]) = 2;
    v12 = v11;
    swift_bridgeObjectRetain();
    v13 = sub_1BEDE9C14();
    v57 = v12;
    v52 = v13;
    LOBYTE(v68[0]) = 3;
    v15 = v14;
    swift_bridgeObjectRetain();
    v16 = sub_1BEDE9C14();
    v56 = v15;
    v51 = v16;
    LOBYTE(v68[0]) = 4;
    v18 = v17;
    swift_bridgeObjectRetain();
    v19 = sub_1BEDE9C14();
    v55 = v18;
    v49 = v19;
    v50 = v10;
    LOBYTE(v68[0]) = 5;
    v21 = v20;
    swift_bridgeObjectRetain();
    v22 = sub_1BEDE9BD8();
    v54 = v21;
    v24 = v23;
    v48 = v22;
    LOBYTE(v68[0]) = 6;
    swift_bridgeObjectRetain();
    v46 = sub_1BEDE9BD8();
    v47 = v24;
    LOBYTE(v68[0]) = 7;
    v26 = v25;
    swift_bridgeObjectRetain();
    v27 = sub_1BEDE9BD8();
    v29 = v28;
    v44 = v27;
    v45 = v26;
    LOBYTE(v68[0]) = 8;
    swift_bridgeObjectRetain();
    v43 = sub_1BEDE9BF0();
    v42 = v30;
    v75 = v30 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF578810);
    LOBYTE(v58) = 9;
    sub_1BEDE8270(&qword_1EF578828, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEA0D8]);
    sub_1BEDE9BFC();
    v31 = v68[0];
    v73 = 10;
    swift_bridgeObjectRetain();
    v32 = sub_1BEDE9BE4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_QWORD *)&v58 = v50;
    *((_QWORD *)&v58 + 1) = v53;
    *(_QWORD *)&v59 = v57;
    *((_QWORD *)&v59 + 1) = v52;
    *(_QWORD *)&v60 = v56;
    *((_QWORD *)&v60 + 1) = v51;
    v33 = v55;
    *(_QWORD *)&v61 = v55;
    *((_QWORD *)&v61 + 1) = v49;
    *(_QWORD *)&v62 = v54;
    *((_QWORD *)&v62 + 1) = v48;
    *(_QWORD *)&v63 = v47;
    *((_QWORD *)&v63 + 1) = v46;
    *(_QWORD *)&v64 = v45;
    *((_QWORD *)&v64 + 1) = v44;
    *(_QWORD *)&v65 = v29;
    *((_QWORD *)&v65 + 1) = v43;
    LOBYTE(v66) = v42 & 1;
    *((_QWORD *)&v66 + 1) = v31;
    v67 = v32;
    sub_1BEDE82D0((uint64_t)&v58);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v34 = v47;
    swift_bridgeObjectRelease();
    v35 = v45;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v36 = v65;
    *(_OWORD *)(a2 + 96) = v64;
    *(_OWORD *)(a2 + 112) = v36;
    *(_OWORD *)(a2 + 128) = v66;
    *(_BYTE *)(a2 + 144) = v67;
    v37 = v61;
    *(_OWORD *)(a2 + 32) = v60;
    *(_OWORD *)(a2 + 48) = v37;
    v38 = v63;
    *(_OWORD *)(a2 + 64) = v62;
    *(_OWORD *)(a2 + 80) = v38;
    v39 = v59;
    *(_OWORD *)a2 = v58;
    *(_OWORD *)(a2 + 16) = v39;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v76);
    v68[0] = v50;
    v68[1] = v53;
    v68[2] = v57;
    v68[3] = v52;
    v68[4] = v56;
    v68[5] = v51;
    v68[6] = v33;
    v68[7] = v49;
    v68[8] = v54;
    v68[9] = v48;
    v68[10] = v34;
    v68[11] = v46;
    v68[12] = v35;
    v68[13] = v44;
    v68[14] = v29;
    v68[15] = v43;
    v69 = v75;
    *(_DWORD *)&v70[3] = *(_DWORD *)&v74[3];
    *(_DWORD *)v70 = *(_DWORD *)v74;
    v71 = v31;
    v72 = v32;
    return sub_1BEDD5A94((uint64_t)v68);
  }
}

uint64_t sub_1BEDE8270(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF578810);
    v8[0] = a2;
    v8[1] = a2;
    result = MEMORY[0x1C3B85BE0](a3, v7, v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BEDE82D0(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_1BEDE8368()
{
  unint64_t result;

  result = qword_1EF578830;
  if (!qword_1EF578830)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for RelayGroupMutationType, &type metadata for RelayGroupMutationType);
    atomic_store(result, (unint64_t *)&qword_1EF578830);
  }
  return result;
}

unint64_t sub_1BEDE83B0()
{
  unint64_t result;

  result = qword_1EF578838;
  if (!qword_1EF578838)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for RelayGroupMutationPayload.CodingKeys, &type metadata for RelayGroupMutationPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578838);
  }
  return result;
}

unint64_t sub_1BEDE83F8()
{
  unint64_t result;

  result = qword_1EF578840;
  if (!qword_1EF578840)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for RelayGroupMutationPayload.CodingKeys, &type metadata for RelayGroupMutationPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578840);
  }
  return result;
}

unint64_t sub_1BEDE8440()
{
  unint64_t result;

  result = qword_1EF578848;
  if (!qword_1EF578848)
  {
    result = MEMORY[0x1C3B85BE0](&protocol conformance descriptor for RelayGroupMutationPayload.CodingKeys, &type metadata for RelayGroupMutationPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF578848);
  }
  return result;
}

uint64_t sub_1BEDE8484@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return RelayGroupMutationPayload.init(from:)(a1, a2);
}

uint64_t sub_1BEDE8498(_QWORD *a1)
{
  return RelayGroupMutationPayload.encode(to:)(a1);
}

uint64_t storeEnumTagSinglePayload for RelayGroupMutationType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BEDE84F8 + 4 * byte_1BEDEC6DD[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1BEDE852C + 4 * byte_1BEDEC6D8[v4]))();
}

uint64_t sub_1BEDE852C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDE8534(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BEDE853CLL);
  return result;
}

uint64_t sub_1BEDE8548(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BEDE8550);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1BEDE8554(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDE855C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RelayGroupMutationType()
{
  return &type metadata for RelayGroupMutationType;
}

uint64_t destroy for RelayGroupMutationPayload()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RelayGroupMutationPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  v8 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v8;
  v9 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v9;
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RelayGroupMutationPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = v4;
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  return a1;
}

__n128 __swift_memcpy145_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for RelayGroupMutationPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for RelayGroupMutationPayload(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 145))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RelayGroupMutationPayload(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 144) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 145) = 1;
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
    *(_BYTE *)(result + 145) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for RelayGroupMutationPayload()
{
  return &type metadata for RelayGroupMutationPayload;
}

uint64_t getEnumTagSinglePayload for RelayGroupMutationPayload.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RelayGroupMutationPayload.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_1BEDE8A74 + 4 * byte_1BEDEC6E7[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_1BEDE8AA8 + 4 * byte_1BEDEC6E2[v4]))();
}

uint64_t sub_1BEDE8AA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDE8AB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BEDE8AB8);
  return result;
}

uint64_t sub_1BEDE8AC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BEDE8ACCLL);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_1BEDE8AD0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BEDE8AD8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RelayGroupMutationPayload.CodingKeys()
{
  return &type metadata for RelayGroupMutationPayload.CodingKeys;
}

uint64_t sub_1BEDE8EA0()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1BEDE8EAC()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1BEDE8EB8()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1BEDE8EC4()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t sub_1BEDE8ED0()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1BEDE8EDC()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1BEDE8EE8()
{
  return MEMORY[0x1E0CAE8D8]();
}

uint64_t sub_1BEDE8EF4()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1BEDE8F00()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1BEDE8F0C()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1BEDE8F18()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t sub_1BEDE8F24()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t sub_1BEDE8F30()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t sub_1BEDE8F3C()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1BEDE8F48()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1BEDE8F54()
{
  return MEMORY[0x1E0CAFD98]();
}

uint64_t sub_1BEDE8F60()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1BEDE8F6C()
{
  return MEMORY[0x1E0CAFEA0]();
}

uint64_t sub_1BEDE8F78()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1BEDE8F84()
{
  return MEMORY[0x1E0CAFF30]();
}

uint64_t sub_1BEDE8F90()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1BEDE8F9C()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1BEDE8FA8()
{
  return MEMORY[0x1E0CB0088]();
}

uint64_t sub_1BEDE8FB4()
{
  return MEMORY[0x1E0CB00F0]();
}

uint64_t sub_1BEDE8FC0()
{
  return MEMORY[0x1E0CB0128]();
}

uint64_t sub_1BEDE8FCC()
{
  return MEMORY[0x1E0CB0138]();
}

uint64_t sub_1BEDE8FD8()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1BEDE8FE4()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1BEDE8FF0()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1BEDE8FFC()
{
  return MEMORY[0x1E0CB02C0]();
}

uint64_t sub_1BEDE9008()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1BEDE9014()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1BEDE9020()
{
  return MEMORY[0x1E0CB0970]();
}

uint64_t sub_1BEDE902C()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1BEDE9038()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1BEDE9044()
{
  return MEMORY[0x1E0D44618]();
}

uint64_t sub_1BEDE9050()
{
  return MEMORY[0x1E0D44620]();
}

uint64_t sub_1BEDE905C()
{
  return MEMORY[0x1E0D44628]();
}

uint64_t sub_1BEDE9068()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1BEDE9074()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1BEDE9080()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_1BEDE908C()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_1BEDE9098()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1BEDE90A4()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_1BEDE90B0()
{
  return MEMORY[0x1E0DF2158]();
}

uint64_t sub_1BEDE90BC()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_1BEDE90C8()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_1BEDE90D4()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_1BEDE90E0()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_1BEDE90EC()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_1BEDE90F8()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_1BEDE9104()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1BEDE9110()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1BEDE911C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1BEDE9128()
{
  return MEMORY[0x1E0D44008]();
}

uint64_t sub_1BEDE9134()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1BEDE9140()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1BEDE914C()
{
  return MEMORY[0x1E0DEF688]();
}

uint64_t sub_1BEDE9158()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1BEDE9164()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1BEDE9170()
{
  return MEMORY[0x1E0D02898]();
}

uint64_t sub_1BEDE917C()
{
  return MEMORY[0x1E0D028A0]();
}

uint64_t sub_1BEDE9188()
{
  return MEMORY[0x1E0D028A8]();
}

uint64_t sub_1BEDE9194()
{
  return MEMORY[0x1E0D028B0]();
}

uint64_t sub_1BEDE91A0()
{
  return MEMORY[0x1E0D028B8]();
}

uint64_t sub_1BEDE91AC()
{
  return MEMORY[0x1E0D028C0]();
}

uint64_t sub_1BEDE91B8()
{
  return MEMORY[0x1E0D028C8]();
}

uint64_t sub_1BEDE91C4()
{
  return MEMORY[0x1E0D028D0]();
}

uint64_t sub_1BEDE91D0()
{
  return MEMORY[0x1E0D028D8]();
}

uint64_t sub_1BEDE91DC()
{
  return MEMORY[0x1E0D028E0]();
}

uint64_t sub_1BEDE91E8()
{
  return MEMORY[0x1E0D028E8]();
}

uint64_t sub_1BEDE91F4()
{
  return MEMORY[0x1E0D028F8]();
}

uint64_t sub_1BEDE9200()
{
  return MEMORY[0x1E0D02900]();
}

uint64_t sub_1BEDE920C()
{
  return MEMORY[0x1E0D02908]();
}

uint64_t sub_1BEDE9218()
{
  return MEMORY[0x1E0D02910]();
}

uint64_t sub_1BEDE9224()
{
  return MEMORY[0x1E0D02918]();
}

uint64_t sub_1BEDE9230()
{
  return MEMORY[0x1E0D02920]();
}

uint64_t sub_1BEDE923C()
{
  return MEMORY[0x1E0D02928]();
}

uint64_t sub_1BEDE9248()
{
  return MEMORY[0x1E0D02930]();
}

uint64_t sub_1BEDE9254()
{
  return MEMORY[0x1E0D02938]();
}

uint64_t sub_1BEDE9260()
{
  return MEMORY[0x1E0D02948]();
}

uint64_t sub_1BEDE926C()
{
  return MEMORY[0x1E0D02958]();
}

uint64_t sub_1BEDE9278()
{
  return MEMORY[0x1E0D02978]();
}

uint64_t sub_1BEDE9284()
{
  return MEMORY[0x1E0D02988]();
}

uint64_t sub_1BEDE9290()
{
  return MEMORY[0x1E0D02998]();
}

uint64_t sub_1BEDE929C()
{
  return MEMORY[0x1E0D029B0]();
}

uint64_t sub_1BEDE92A8()
{
  return MEMORY[0x1E0D029C0]();
}

uint64_t sub_1BEDE92B4()
{
  return MEMORY[0x1E0D029D8]();
}

uint64_t sub_1BEDE92C0()
{
  return MEMORY[0x1E0D029E0]();
}

uint64_t sub_1BEDE92CC()
{
  return MEMORY[0x1E0D029F0]();
}

uint64_t sub_1BEDE92D8()
{
  return MEMORY[0x1E0D029F8]();
}

uint64_t sub_1BEDE92E4()
{
  return MEMORY[0x1E0D02A10]();
}

uint64_t sub_1BEDE92F0()
{
  return MEMORY[0x1E0D02A30]();
}

uint64_t sub_1BEDE92FC()
{
  return MEMORY[0x1E0D02A50]();
}

uint64_t sub_1BEDE9308()
{
  return MEMORY[0x1E0D02A70]();
}

uint64_t sub_1BEDE9314()
{
  return MEMORY[0x1E0D02A80]();
}

uint64_t sub_1BEDE9320()
{
  return MEMORY[0x1E0D02A88]();
}

uint64_t sub_1BEDE932C()
{
  return MEMORY[0x1E0D02AA0]();
}

uint64_t sub_1BEDE9338()
{
  return MEMORY[0x1E0D02AB0]();
}

uint64_t sub_1BEDE9344()
{
  return MEMORY[0x1E0D02AB8]();
}

uint64_t sub_1BEDE9350()
{
  return MEMORY[0x1E0D02AD0]();
}

uint64_t sub_1BEDE935C()
{
  return MEMORY[0x1E0D02AE0]();
}

uint64_t sub_1BEDE9368()
{
  return MEMORY[0x1E0D02AE8]();
}

uint64_t sub_1BEDE9374()
{
  return MEMORY[0x1E0D02AF0]();
}

uint64_t sub_1BEDE9380()
{
  return MEMORY[0x1E0D02B08]();
}

uint64_t sub_1BEDE938C()
{
  return MEMORY[0x1E0D02B18]();
}

uint64_t sub_1BEDE9398()
{
  return MEMORY[0x1E0D02B20]();
}

uint64_t sub_1BEDE93A4()
{
  return MEMORY[0x1E0D02B28]();
}

uint64_t sub_1BEDE93B0()
{
  return MEMORY[0x1E0D02B30]();
}

uint64_t sub_1BEDE93BC()
{
  return MEMORY[0x1E0D02B38]();
}

uint64_t sub_1BEDE93C8()
{
  return MEMORY[0x1E0D02B40]();
}

uint64_t sub_1BEDE93D4()
{
  return MEMORY[0x1E0D02B50]();
}

uint64_t sub_1BEDE93E0()
{
  return MEMORY[0x1E0D02B88]();
}

uint64_t sub_1BEDE93EC()
{
  return MEMORY[0x1E0D02B90]();
}

uint64_t sub_1BEDE93F8()
{
  return MEMORY[0x1E0D02BA0]();
}

uint64_t sub_1BEDE9404()
{
  return MEMORY[0x1E0D02BA8]();
}

uint64_t sub_1BEDE9410()
{
  return MEMORY[0x1E0D02BB0]();
}

uint64_t sub_1BEDE941C()
{
  return MEMORY[0x1E0D02BC0]();
}

uint64_t sub_1BEDE9428()
{
  return MEMORY[0x1E0D02BE0]();
}

uint64_t sub_1BEDE9434()
{
  return MEMORY[0x1E0D02C20]();
}

uint64_t sub_1BEDE9440()
{
  return MEMORY[0x1E0D02C30]();
}

uint64_t sub_1BEDE944C()
{
  return MEMORY[0x1E0D02C38]();
}

uint64_t sub_1BEDE9458()
{
  return MEMORY[0x1E0D02C58]();
}

uint64_t sub_1BEDE9464()
{
  return MEMORY[0x1E0D02C78]();
}

uint64_t sub_1BEDE9470()
{
  return MEMORY[0x1E0D02C90]();
}

uint64_t sub_1BEDE947C()
{
  return MEMORY[0x1E0D02CA8]();
}

uint64_t sub_1BEDE9488()
{
  return MEMORY[0x1E0D02CB0]();
}

uint64_t sub_1BEDE9494()
{
  return MEMORY[0x1E0D02CB8]();
}

uint64_t sub_1BEDE94A0()
{
  return MEMORY[0x1E0D02CC0]();
}

uint64_t sub_1BEDE94AC()
{
  return MEMORY[0x1E0D02CC8]();
}

uint64_t sub_1BEDE94B8()
{
  return MEMORY[0x1E0D02CE0]();
}

uint64_t sub_1BEDE94C4()
{
  return MEMORY[0x1E0D02D00]();
}

uint64_t sub_1BEDE94D0()
{
  return MEMORY[0x1E0D02D20]();
}

uint64_t sub_1BEDE94DC()
{
  return MEMORY[0x1E0D02D30]();
}

uint64_t sub_1BEDE94E8()
{
  return MEMORY[0x1E0D02D38]();
}

uint64_t sub_1BEDE94F4()
{
  return MEMORY[0x1E0D02D48]();
}

uint64_t sub_1BEDE9500()
{
  return MEMORY[0x1E0D02D50]();
}

uint64_t sub_1BEDE950C()
{
  return MEMORY[0x1E0D02D68]();
}

uint64_t sub_1BEDE9518()
{
  return MEMORY[0x1E0D02D88]();
}

uint64_t sub_1BEDE9524()
{
  return MEMORY[0x1E0D02DA8]();
}

uint64_t sub_1BEDE9530()
{
  return MEMORY[0x1E0D02DB8]();
}

uint64_t sub_1BEDE953C()
{
  return MEMORY[0x1E0D02DC0]();
}

uint64_t sub_1BEDE9548()
{
  return MEMORY[0x1E0D02DC8]();
}

uint64_t sub_1BEDE9554()
{
  return MEMORY[0x1E0D02DD8]();
}

uint64_t sub_1BEDE9560()
{
  return MEMORY[0x1E0D02DE0]();
}

uint64_t sub_1BEDE956C()
{
  return MEMORY[0x1E0D02DE8]();
}

uint64_t sub_1BEDE9578()
{
  return MEMORY[0x1E0D02DF8]();
}

uint64_t sub_1BEDE9584()
{
  return MEMORY[0x1E0D02E18]();
}

uint64_t sub_1BEDE9590()
{
  return MEMORY[0x1E0D02E28]();
}

uint64_t sub_1BEDE959C()
{
  return MEMORY[0x1E0D02E30]();
}

uint64_t sub_1BEDE95A8()
{
  return MEMORY[0x1E0D02E48]();
}

uint64_t sub_1BEDE95B4()
{
  return MEMORY[0x1E0D02E88]();
}

uint64_t sub_1BEDE95C0()
{
  return MEMORY[0x1E0D02EB0]();
}

uint64_t sub_1BEDE95CC()
{
  return MEMORY[0x1E0D02EC8]();
}

uint64_t sub_1BEDE95D8()
{
  return MEMORY[0x1E0D02EE8]();
}

uint64_t sub_1BEDE95E4()
{
  return MEMORY[0x1E0D02F00]();
}

uint64_t sub_1BEDE95F0()
{
  return MEMORY[0x1E0D02F10]();
}

uint64_t sub_1BEDE95FC()
{
  return MEMORY[0x1E0D02F18]();
}

uint64_t sub_1BEDE9608()
{
  return MEMORY[0x1E0D02F30]();
}

uint64_t sub_1BEDE9614()
{
  return MEMORY[0x1E0D02F70]();
}

uint64_t sub_1BEDE9620()
{
  return MEMORY[0x1E0D02F90]();
}

uint64_t sub_1BEDE962C()
{
  return MEMORY[0x1E0D02FB0]();
}

uint64_t sub_1BEDE9638()
{
  return MEMORY[0x1E0D02FD0]();
}

uint64_t sub_1BEDE9644()
{
  return MEMORY[0x1E0D02FD8]();
}

uint64_t sub_1BEDE9650()
{
  return MEMORY[0x1E0D02FE8]();
}

uint64_t sub_1BEDE965C()
{
  return MEMORY[0x1E0D03008]();
}

uint64_t sub_1BEDE9668()
{
  return MEMORY[0x1E0D03018]();
}

uint64_t sub_1BEDE9674()
{
  return MEMORY[0x1E0D03020]();
}

uint64_t sub_1BEDE9680()
{
  return MEMORY[0x1E0D03028]();
}

uint64_t sub_1BEDE968C()
{
  return MEMORY[0x1E0D03038]();
}

uint64_t sub_1BEDE9698()
{
  return MEMORY[0x1E0D03070]();
}

uint64_t sub_1BEDE96A4()
{
  return MEMORY[0x1E0D03080]();
}

uint64_t sub_1BEDE96B0()
{
  return MEMORY[0x1E0D03088]();
}

uint64_t sub_1BEDE96BC()
{
  return MEMORY[0x1E0D03090]();
}

uint64_t sub_1BEDE96C8()
{
  return MEMORY[0x1E0D03098]();
}

uint64_t sub_1BEDE96D4()
{
  return MEMORY[0x1E0D030A8]();
}

uint64_t sub_1BEDE96E0()
{
  return MEMORY[0x1E0D030C0]();
}

uint64_t sub_1BEDE96EC()
{
  return MEMORY[0x1E0D03128]();
}

uint64_t sub_1BEDE96F8()
{
  return MEMORY[0x1E0D03138]();
}

uint64_t sub_1BEDE9704()
{
  return MEMORY[0x1E0D03140]();
}

uint64_t sub_1BEDE9710()
{
  return MEMORY[0x1E0D03150]();
}

uint64_t sub_1BEDE971C()
{
  return MEMORY[0x1E0D03168]();
}

uint64_t sub_1BEDE9728()
{
  return MEMORY[0x1E0D03178]();
}

uint64_t sub_1BEDE9734()
{
  return MEMORY[0x1E0D03188]();
}

uint64_t sub_1BEDE9740()
{
  return MEMORY[0x1E0D03190]();
}

uint64_t sub_1BEDE974C()
{
  return MEMORY[0x1E0D031B0]();
}

uint64_t sub_1BEDE9758()
{
  return MEMORY[0x1E0D031B8]();
}

uint64_t sub_1BEDE9764()
{
  return MEMORY[0x1E0D031C0]();
}

uint64_t sub_1BEDE9770()
{
  return MEMORY[0x1E0D031C8]();
}

uint64_t sub_1BEDE977C()
{
  return MEMORY[0x1E0D031D8]();
}

uint64_t sub_1BEDE9788()
{
  return MEMORY[0x1E0D031E0]();
}

uint64_t sub_1BEDE9794()
{
  return MEMORY[0x1E0D031E8]();
}

uint64_t sub_1BEDE97A0()
{
  return MEMORY[0x1E0D031F0]();
}

uint64_t sub_1BEDE97AC()
{
  return MEMORY[0x1E0D031F8]();
}

uint64_t sub_1BEDE97B8()
{
  return MEMORY[0x1E0D03200]();
}

uint64_t sub_1BEDE97C4()
{
  return MEMORY[0x1E0D03208]();
}

uint64_t sub_1BEDE97D0()
{
  return MEMORY[0x1E0D03218]();
}

uint64_t sub_1BEDE97DC()
{
  return MEMORY[0x1E0D03220]();
}

uint64_t sub_1BEDE97E8()
{
  return MEMORY[0x1E0D03228]();
}

uint64_t sub_1BEDE97F4()
{
  return MEMORY[0x1E0D03230]();
}

uint64_t sub_1BEDE9800()
{
  return MEMORY[0x1E0D03238]();
}

uint64_t sub_1BEDE980C()
{
  return MEMORY[0x1E0D03240]();
}

uint64_t sub_1BEDE9818()
{
  return MEMORY[0x1E0D03248]();
}

uint64_t sub_1BEDE9824()
{
  return MEMORY[0x1E0D03258]();
}

uint64_t sub_1BEDE9830()
{
  return MEMORY[0x1E0D03260]();
}

uint64_t sub_1BEDE983C()
{
  return MEMORY[0x1E0D03270]();
}

uint64_t sub_1BEDE9848()
{
  return MEMORY[0x1E0D03280]();
}

uint64_t sub_1BEDE9854()
{
  return MEMORY[0x1E0D03288]();
}

uint64_t sub_1BEDE9860()
{
  return MEMORY[0x1E0D03298]();
}

uint64_t sub_1BEDE986C()
{
  return MEMORY[0x1E0D032A8]();
}

uint64_t sub_1BEDE9878()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1BEDE9884()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1BEDE9890()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1BEDE989C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1BEDE98A8()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1BEDE98B4()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1BEDE98C0()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BEDE98CC()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1BEDE98D8()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1BEDE98E4()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1BEDE98F0()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1BEDE98FC()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1BEDE9908()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1BEDE9914()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1BEDE9920()
{
  return MEMORY[0x1E0DEA7F8]();
}

uint64_t sub_1BEDE992C()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1BEDE9938()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1BEDE9944()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1BEDE9950()
{
  return MEMORY[0x1E0DEAA38]();
}

uint64_t sub_1BEDE995C()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1BEDE9968()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1BEDE9974()
{
  return MEMORY[0x1E0DEACC0]();
}

uint64_t sub_1BEDE9980()
{
  return MEMORY[0x1E0DEAD38]();
}

uint64_t sub_1BEDE998C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1BEDE9998()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1BEDE99A4()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1BEDE99B0()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1BEDE99BC()
{
  return MEMORY[0x1E0DF0A88]();
}

uint64_t sub_1BEDE99C8()
{
  return MEMORY[0x1E0DF0A90]();
}

uint64_t sub_1BEDE99D4()
{
  return MEMORY[0x1E0C9B900]();
}

uint64_t sub_1BEDE99E0()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1BEDE99EC()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BEDE99F8()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1BEDE9A04()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1BEDE9A10()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1BEDE9A1C()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1BEDE9A28()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1BEDE9A34()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1BEDE9A40()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_1BEDE9A4C()
{
  return MEMORY[0x1E0D032B0]();
}

uint64_t sub_1BEDE9A58()
{
  return MEMORY[0x1E0D032B8]();
}

uint64_t sub_1BEDE9A64()
{
  return MEMORY[0x1E0D032C0]();
}

uint64_t sub_1BEDE9A70()
{
  return MEMORY[0x1E0D032C8]();
}

uint64_t sub_1BEDE9A7C()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1BEDE9A88()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1BEDE9A94()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1BEDE9AA0()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1BEDE9AAC()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1BEDE9AB8()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1BEDE9AC4()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_1BEDE9AD0()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1BEDE9ADC()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1BEDE9AE8()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1BEDE9AF4()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1BEDE9B00()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1BEDE9B0C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1BEDE9B18()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1BEDE9B24()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1BEDE9B30()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1BEDE9B3C()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1BEDE9B48()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1BEDE9B54()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1BEDE9B60()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1BEDE9B6C()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1BEDE9B78()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1BEDE9B84()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1BEDE9B90()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1BEDE9B9C()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1BEDE9BA8()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1BEDE9BB4()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1BEDE9BC0()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1BEDE9BCC()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1BEDE9BD8()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1BEDE9BE4()
{
  return MEMORY[0x1E0DECF60]();
}

uint64_t sub_1BEDE9BF0()
{
  return MEMORY[0x1E0DECF78]();
}

uint64_t sub_1BEDE9BFC()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1BEDE9C08()
{
  return MEMORY[0x1E0DECFB8]();
}

uint64_t sub_1BEDE9C14()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1BEDE9C20()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1BEDE9C2C()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1BEDE9C38()
{
  return MEMORY[0x1E0DED018]();
}

uint64_t sub_1BEDE9C44()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1BEDE9C50()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1BEDE9C5C()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1BEDE9C68()
{
  return MEMORY[0x1E0DED098]();
}

uint64_t sub_1BEDE9C74()
{
  return MEMORY[0x1E0DED0B0]();
}

uint64_t sub_1BEDE9C80()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1BEDE9C8C()
{
  return MEMORY[0x1E0DED0E8]();
}

uint64_t sub_1BEDE9C98()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1BEDE9CA4()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1BEDE9CB0()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1BEDE9CBC()
{
  return MEMORY[0x1E0DED148]();
}

uint64_t sub_1BEDE9CC8()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1BEDE9CD4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1BEDE9CE0()
{
  return MEMORY[0x1E0DED628]();
}

uint64_t sub_1BEDE9CEC()
{
  return MEMORY[0x1E0DED658]();
}

uint64_t sub_1BEDE9CF8()
{
  return MEMORY[0x1E0DED6F8]();
}

uint64_t sub_1BEDE9D04()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1BEDE9D10()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1BEDE9D1C()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1BEDE9D28()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1BEDE9D34()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1BEDE9D40()
{
  return MEMORY[0x1E0CB26A0]();
}

uint64_t sub_1BEDE9D4C()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1BEDE9D58()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1BEDE9D64()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1BEDE9D70()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1BEDE9D7C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1BEDE9D88()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_1BEDE9D94()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1BEDE9DA0()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t sub_1BEDE9DAC()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1BEDE9DB8()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1BEDE9DC4()
{
  return MEMORY[0x1E0DEE8E8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
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

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cosl_codec_get_decoded_size()
{
  return MEMORY[0x1E0DE52D0]();
}

uint64_t cosl_codec_get_id()
{
  return MEMORY[0x1E0DE52D8]();
}

uint64_t cosl_codec_map()
{
  return MEMORY[0x1E0DE52E0]();
}

uint64_t cosl_codec_unmap()
{
  return MEMORY[0x1E0DE52E8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocEmptyBox()
{
  return MEMORY[0x1E0DEEAA0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1E0DEEB70]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}


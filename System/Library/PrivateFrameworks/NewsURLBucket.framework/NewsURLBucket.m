id sub_1ABFB85E0(char *a1, uint64_t a2, uint64_t *a3, void (*a4)(_QWORD))
{
  objc_class *ObjectType;
  uint64_t v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v8 = *a3;
  a4(0);
  *(_QWORD *)&a1[v8] = swift_allocObject();
  v10.receiver = a1;
  v10.super_class = ObjectType;
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t type metadata accessor for URLHasher()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for URLCanonicalizer()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for StringHasher()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for HashBucketer()
{
  return objc_opt_self();
}

uint64_t HashBucketer.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t HashBucketer.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t HashBucketer.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t HashBucketer.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t variable initialization expression of URLHasher.stringHasher()
{
  type metadata accessor for StringHasher();
  return swift_allocObject();
}

uint64_t variable initialization expression of ObjCHashBucketer.hashBucketer()
{
  type metadata accessor for HashBucketer();
  return swift_allocObject();
}

uint64_t variable initialization expression of ObjCURLCanonicalizer.urlCanonicalizer()
{
  type metadata accessor for URLCanonicalizer();
  return swift_allocObject();
}

uint64_t variable initialization expression of ObjCURLHasher.urlHasher()
{
  uint64_t v0;

  type metadata accessor for URLHasher();
  v0 = swift_allocObject();
  type metadata accessor for StringHasher();
  *(_QWORD *)(v0 + 16) = swift_allocObject();
  return v0;
}

void sub_1ABFB8A18(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_1ABFB8A20@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void _s13NewsURLBucket12HashBucketerC6bucket3for0E5CountSi10Foundation4DataV_SitF_0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_1ABFB8A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  unint64_t v23;
  unint64_t v24;
  unsigned int v25;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t))((char *)&loc_1ABFB8B54 + *((int *)qword_1ABFB8D78 + v25)))(a1, a2, a3, a4, a5, a6, a7, a8, a23, v23 >> 40, HIDWORD(v23), v23 >> 24, v23 >> 16, v23 >> 8, HIBYTE(v24), HIWORD(v24));
}

uint64_t sub_1ABFB8D88(uint64_t a1, unint64_t a2)
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

uint64_t sub_1ABFB8DCC(uint64_t a1, unint64_t a2)
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

BOOL static BloomFilterReaderWriter.QueryResult.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t BloomFilterReaderWriter.QueryResult.hash(into:)()
{
  return sub_1ABFBC730();
}

uint64_t BloomFilterReaderWriter.QueryResult.hashValue.getter()
{
  sub_1ABFBC724();
  sub_1ABFBC730();
  return sub_1ABFBC73C();
}

BOOL sub_1ABFB8E88(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1ABFB8EA0()
{
  sub_1ABFBC724();
  sub_1ABFBC730();
  return sub_1ABFBC73C();
}

uint64_t sub_1ABFB8EE4()
{
  return sub_1ABFBC730();
}

uint64_t sub_1ABFB8F0C()
{
  sub_1ABFBC724();
  sub_1ABFBC730();
  return sub_1ABFBC73C();
}

uint64_t BloomFilterReaderWriter.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 72);
  sub_1ABFB8D88(v1, *(_QWORD *)(v0 + 80));
  return v1;
}

Swift::Void __swiftcall BloomFilterReaderWriter.add(_:)(Swift::String a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 16);
  if (v2 < 0)
  {
    __break(1u);
    JUMPOUT(0x1ABFB91CCLL);
  }
  if (v2)
  {
    sub_1ABFB91EC(a1._countAndFlagsBits, (unint64_t)a1._object);
    swift_beginAccess();
    __asm { BR              X11 }
  }
}

void sub_1ABFB91EC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  sub_1ABFBC70C();
  swift_bridgeObjectRetain();
  sub_1ABFBC67C();
  swift_bridgeObjectRelease();
  _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(a1, a2);
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 56));
  swift_beginAccess();
  __asm { BR              X12 }
}

uint64_t sub_1ABFB92C4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = (*(uint64_t (**)(uint64_t, unint64_t, _QWORD, uint64_t, uint64_t))(v4 + 8))(v1, v2, BYTE6(v0), v3, v4);
  sub_1ABFB8DCC(v1, v2);
  return v5 / 8;
}

NewsURLBucket::BloomFilterReaderWriter::QueryResult __swiftcall BloomFilterReaderWriter.contains(_:)(Swift::String a1)
{
  uint64_t *v1;
  void *object;
  uint64_t countAndFlagsBits;

  countAndFlagsBits = a1._countAndFlagsBits;
  if (v1[2] >= 1)
  {
    object = a1._object;
    swift_beginAccess();
    sub_1ABFBC70C();
    swift_bridgeObjectRetain();
    sub_1ABFBC67C();
    swift_bridgeObjectRelease();
    _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(countAndFlagsBits, (unint64_t)object);
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1(v1 + 4, v1[7]);
    __asm { BR              X11 }
  }
  return 1;
}

uint64_t BloomFilterReaderWriter.deinit()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  sub_1ABFB8DCC(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  return v0;
}

uint64_t BloomFilterReaderWriter.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  sub_1ABFB8DCC(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  return swift_deallocClassInstance();
}

uint64_t sub_1ABFB9738(uint64_t a1, uint64_t a2)
{
  return BloomFilterReaderWriter.contains(_:)(*(Swift::String *)&a1);
}

void sub_1ABFB9758(uint64_t a1, uint64_t a2)
{
  BloomFilterReaderWriter.add(_:)(*(Swift::String *)&a1);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
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

unint64_t sub_1ABFB97C0()
{
  unint64_t result;

  result = qword_1EEC5E3E8;
  if (!qword_1EEC5E3E8)
  {
    result = MEMORY[0x1AF439664](&protocol conformance descriptor for BloomFilterReaderWriter.QueryResult, &type metadata for BloomFilterReaderWriter.QueryResult);
    atomic_store(result, (unint64_t *)&qword_1EEC5E3E8);
  }
  return result;
}

uint64_t type metadata accessor for BloomFilterReaderWriter()
{
  return objc_opt_self();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BloomFilterReaderWriter.QueryResult(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for BloomFilterReaderWriter.QueryResult(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1ABFB9910 + 4 * byte_1ABFBCBA5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1ABFB9944 + 4 * asc_1ABFBCBA0[v4]))();
}

uint64_t sub_1ABFB9944(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1ABFB994C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1ABFB9954);
  return result;
}

uint64_t sub_1ABFB9960(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1ABFB9968);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1ABFB996C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1ABFB9974(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1ABFB9980(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1ABFB998C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterReaderWriter.QueryResult()
{
  return &type metadata for BloomFilterReaderWriter.QueryResult;
}

uint64_t URLHasher.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  type metadata accessor for StringHasher();
  *(_QWORD *)(v0 + 16) = swift_allocObject();
  return v0;
}

uint64_t URLHasher.init()()
{
  uint64_t v0;

  type metadata accessor for StringHasher();
  *(_QWORD *)(v0 + 16) = swift_allocObject();
  return v0;
}

uint64_t URLHasher.hash(for:maxLength:)()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = sub_1ABFBC52C();
  _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(v0, v1);
  v3 = v2;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t URLHasher.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t URLHasher.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1ABFB9AAC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = sub_1ABFBC52C();
  _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(v0, v1);
  v3 = v2;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t URLCanonicalizer.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t URLCanonicalizer.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t URLCanonicalizer.canonicalizedURL(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char *v21;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v26 = a2;
  v3 = sub_1ABFBC598();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v25 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC5E3F0);
  MEMORY[0x1E0C80A78]();
  v24 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC5E3F8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1ABFBC4B4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78]();
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ABFBC4A8();
  sub_1ABFBC52C();
  sub_1ABFBC49C();
  swift_bridgeObjectRelease();
  v23 = v10;
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (!v13(v8, 1, v9))
  {
    v14 = sub_1ABFBC478();
    if (v15)
    {
      v31 = v14;
      v32 = v15;
      v29 = 0x292B3F5C7C2B2F28;
      v30 = 0xE900000000000024;
      v27 = 0;
      v28 = 0xE000000000000000;
      sub_1ABFB9F88();
      sub_1ABFBC6E8();
      swift_bridgeObjectRelease();
    }
  }
  if (v13(v8, 1, v9))
    swift_bridgeObjectRelease();
  else
    sub_1ABFBC484();
  v16 = (uint64_t)v24;
  sub_1ABFBC580();
  if (v17)
  {
    sub_1ABFBC658();
    swift_bridgeObjectRelease();
  }
  sub_1ABFBC490();
  sub_1ABFBC574();
  sub_1ABFBC46C();
  sub_1ABFBC550();
  if (v18)
  {
    sub_1ABFBC658();
    swift_bridgeObjectRelease();
  }
  sub_1ABFBC448();
  if (sub_1ABFBC55C() == 47 && v19 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = sub_1ABFBC718();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0)
    {
      sub_1ABFBC55C();
      sub_1ABFBC454();
    }
  }
  sub_1ABFBC568();
  sub_1ABFBC460();
  sub_1ABFBC43C();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v9);
  v21 = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v25, a1, v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v16, 1, v3) == 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v26, v21, v3);
    sub_1ABFB9F4C(v16, &qword_1EEC5E3F0);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v21, v3);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v26, v16, v3);
  }
  return sub_1ABFB9F4C((uint64_t)v8, &qword_1EEC5E3F8);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1AF439658]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1ABFB9F4C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1ABFB9F88()
{
  unint64_t result;

  result = qword_1EEC5E400;
  if (!qword_1EEC5E400)
  {
    result = MEMORY[0x1AF439664](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EEC5E400);
  }
  return result;
}

uint64_t URLCanonicalizer.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t URLCanonicalizer.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1ABFB9FE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return URLCanonicalizer.canonicalizedURL(for:)(a1, a2);
}

id sub_1ABFB9FF8()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB38E8]);
  result = sub_1ABFBA598(0xD00000000000002DLL, 0x80000001ABFBD4F0, 1);
  qword_1EEC5E408 = (uint64_t)result;
  return result;
}

unint64_t sub_1ABFBA06C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  unint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  uint64_t v30;
  unint64_t v31;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC5E3F0);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)v29 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1ABFBC598();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ABFBC52C();
  v7 = sub_1ABFBC658();
  v9 = v8;
  swift_bridgeObjectRelease();
  if (qword_1EEC5E3E0 != -1)
    swift_once();
  v10 = (void *)qword_1EEC5E408;
  if (qword_1EEC5E408)
  {
    swift_bridgeObjectRetain();
    v11 = v10;
    v12 = sub_1ABFBC6C4();
    swift_bridgeObjectRelease();
    v13 = (void *)sub_1ABFBC640();
    v14 = objc_msgSend(v11, sel_firstMatchInString_options_range_, v13, 0, 0, v12);

    if (v14)
    {

    }
    else
    {
      v30 = v7;
      v31 = v9;
      v29[2] = 0x292F2F2A2E285ELL;
      v29[3] = 0xE700000000000000;
      v29[0] = 0;
      v29[1] = 0xE000000000000000;
      sub_1ABFB9F88();
      sub_1ABFBC6E8();
      swift_bridgeObjectRelease();
      v30 = 0x2F2F3A70747468;
      v31 = 0xE700000000000000;
      sub_1ABFBC67C();
      swift_bridgeObjectRelease();

    }
  }
  sub_1ABFBC58C();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_1ABFBA3F4((uint64_t)v2);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  v16 = sub_1ABFBC550();
  v18 = v17;
  if (!v17)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return 0;
  }
  v15 = v16;
  swift_bridgeObjectRetain();
  v19 = sub_1ABFBA434();
  swift_bridgeObjectRelease();
  if ((v19 & 1) == 0)
  {
LABEL_15:
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return v15;
  }
  result = sub_1ABFBC670();
  v21 = HIBYTE(v18) & 0xF;
  if ((v18 & 0x2000000000000000) == 0)
    v21 = v15 & 0xFFFFFFFFFFFFLL;
  if (4 * v21 >= result >> 14)
  {
    v22 = sub_1ABFBC6DC();
    v24 = v23;
    v26 = v25;
    v28 = v27;
    swift_bridgeObjectRelease();
    v15 = MEMORY[0x1AF4393B8](v22, v24, v26, v28);
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_1ABFBA3F4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC5E3F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1ABFBA434()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0 = sub_1ABFBC688();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    do
    {
      v6 = sub_1ABFBC688();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v4 = sub_1ABFBC718();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      v2 = sub_1ABFBC688();
      v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_1ABFBC688();
  v9 = v8;
  swift_bridgeObjectRelease();
  v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

id sub_1ABFBA598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = (void *)sub_1ABFBC640();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_1ABFBC520();

    swift_willThrow();
  }
  return v6;
}

id ObjCHashBucketer.init()()
{
  return sub_1ABFBA844(&OBJC_IVAR___NBObjCHashBucketer_hashBucketer, (void (*)(_QWORD))type metadata accessor for HashBucketer);
}

uint64_t ObjCURLCanonicalizer.canonicalizedURL(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return URLCanonicalizer.canonicalizedURL(for:)(a1, a2);
}

id ObjCURLCanonicalizer.init()()
{
  return sub_1ABFBA844(&OBJC_IVAR___NBObjCURLCanonicalizer_urlCanonicalizer, (void (*)(_QWORD))type metadata accessor for URLCanonicalizer);
}

id sub_1ABFBA844(uint64_t *a1, void (*a2)(_QWORD))
{
  char *v2;
  objc_class *ObjectType;
  uint64_t v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = *a1;
  a2(0);
  *(_QWORD *)&v2[v6] = swift_allocObject();
  v8.receiver = v2;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t sub_1ABFBA8C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return URLCanonicalizer.canonicalizedURL(for:)(a1, a2);
}

uint64_t ObjCURLHasher.hash(for:maxLength:)()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = sub_1ABFBC52C();
  _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(v0, v1);
  v3 = v2;
  swift_bridgeObjectRelease();
  return v3;
}

id ObjCURLHasher.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ObjCURLHasher.init()()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = OBJC_IVAR___NBObjCURLHasher_urlHasher;
  type metadata accessor for URLHasher();
  v3 = swift_allocObject();
  type metadata accessor for StringHasher();
  *(_QWORD *)(v3 + 16) = swift_allocObject();
  *(_QWORD *)&v0[v2] = v3;
  v5.receiver = v0;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

id ObjCBloomFilterReader.__allocating_init(data:hashFunctionCount:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char *v11;
  objc_super v13;
  __int128 v14;
  uint64_t v15;
  _UNKNOWN **v16;

  v7 = (char *)objc_allocWithZone(v3);
  type metadata accessor for StringHasher();
  v8 = swift_allocObject();
  v15 = type metadata accessor for HashBucketer();
  v16 = &protocol witness table for HashBucketer;
  *(_QWORD *)&v14 = swift_allocObject();
  v9 = type metadata accessor for BloomFilterReaderWriter();
  v10 = (_QWORD *)swift_allocObject();
  v10[9] = a1;
  v10[10] = a2;
  v10[2] = a3;
  v10[3] = v8;
  sub_1ABFBB04C(&v14, (uint64_t)(v10 + 4));
  v11 = &v7[OBJC_IVAR___NBObjCBloomFilterReader_bloomFilterReader];
  *((_QWORD *)v11 + 3) = v9;
  *((_QWORD *)v11 + 4) = &protocol witness table for BloomFilterReaderWriter;
  *(_QWORD *)v11 = v10;
  v13.receiver = v7;
  v13.super_class = v3;
  return objc_msgSendSuper2(&v13, sel_init);
}

id ObjCBloomFilterReader.init(data:hashFunctionCount:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char *v11;
  objc_super v13;
  __int128 v14;
  uint64_t v15;
  _UNKNOWN **v16;

  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for StringHasher();
  v8 = swift_allocObject();
  v15 = type metadata accessor for HashBucketer();
  v16 = &protocol witness table for HashBucketer;
  *(_QWORD *)&v14 = swift_allocObject();
  v9 = type metadata accessor for BloomFilterReaderWriter();
  v10 = (_QWORD *)swift_allocObject();
  v10[9] = a1;
  v10[10] = a2;
  v10[2] = a3;
  v10[3] = v8;
  sub_1ABFBB04C(&v14, (uint64_t)(v10 + 4));
  v11 = &v3[OBJC_IVAR___NBObjCBloomFilterReader_bloomFilterReader];
  *((_QWORD *)v11 + 3) = v9;
  *((_QWORD *)v11 + 4) = &protocol witness table for BloomFilterReaderWriter;
  *(_QWORD *)v11 = v10;
  v13.receiver = v3;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, sel_init);
}

Swift::Bool __swiftcall ObjCBloomFilterReader.maybeContains(_:)(Swift::String a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  uint64_t v5;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___NBObjCBloomFilterReader_bloomFilterReader + 24);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR___NBObjCBloomFilterReader_bloomFilterReader + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR___NBObjCBloomFilterReader_bloomFilterReader), v4);
  return ((*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(v5 + 8))(countAndFlagsBits, object, v4, v5) & 1) == 0;
}

void ObjCBloomFilterReader.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _s13NewsURLBucket16ObjCHashBucketerCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

NSString_optional __swiftcall NSURL.nb_domain()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1ABFBC598();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ABFBC544();
  sub_1ABFBA06C();
  v5 = v4;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (!v5)
    return 0;
  v6 = sub_1ABFBC640();
  swift_bridgeObjectRelease();
  return (NSString_optional)v6;
}

id sub_1ABFBAF80(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v2 = sub_1ABFBC598();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ABFBC544();
  v6 = a1;
  sub_1ABFBA06C();
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v8)
  {
    v9 = (void *)sub_1ABFBC640();

    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {

    return 0;
  }
}

uint64_t sub_1ABFBB04C(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for ObjCHashBucketer()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ObjCURLCanonicalizer()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ObjCURLHasher()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ObjCBloomFilterReader()
{
  return objc_opt_self();
}

uint64_t StringHasher.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t StringHasher.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1ABFBB10C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC5E438);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_1ABFBC370((uint64_t)v14);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v4 = (char *)v17 + (HIBYTE(a2) & 0xF);
      v5 = v17;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v2 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v3 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v2 = sub_1ABFBC700();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = sub_1ABFBBEE0(v5, v4);
    v8 = v7;
    if (v7 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v14[0] = v6;
      *((_QWORD *)&v14[0] + 1) = v8;
      return *(_QWORD *)&v14[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v9 = sub_1ABFBC694();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = sub_1ABFBBF44(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x1E0C80A78]();
    sub_1ABFBB708();
    __asm { BR              X12 }
  }
  sub_1ABFBB04C(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  sub_1ABFBC514();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

uint64_t sub_1ABFBB608@<X0>(uint64_t __src@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (__src)
  {
    if (a2 - __src >= a3)
      v5 = a3;
    else
      v5 = a2 - __src;
    if (v5)
    {
      if (v5 < 15)
      {
        __src = sub_1ABFBBD28((_BYTE *)__src, (_BYTE *)(__src + v5));
        v7 = v8 & 0xFFFFFFFFFFFFFFLL;
      }
      else
      {
        sub_1ABFBC508();
        swift_allocObject();
        v6 = sub_1ABFBC4CC();
        if ((unint64_t)v5 >= 0x7FFFFFFF)
        {
          sub_1ABFBC5B0();
          __src = swift_allocObject();
          *(_QWORD *)(__src + 16) = 0;
          *(_QWORD *)(__src + 24) = v5;
          v7 = v6 | 0x8000000000000000;
        }
        else
        {
          __src = v5 << 32;
          v7 = v6 | 0x4000000000000000;
        }
      }
    }
    else
    {
      __src = 0;
      v7 = 0xC000000000000000;
    }
  }
  else
  {
    v7 = 0xC000000000000000;
  }
  *a4 = __src;
  a4[1] = v7;
  return __src;
}

uint64_t StringHasher.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t StringHasher.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void sub_1ABFBB6F8(uint64_t a1)
{
  _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

void sub_1ABFBB708()
{
  __asm { BR              X11 }
}

_QWORD *sub_1ABFBB768@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_BYTE *sub_1ABFBB9F8@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
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
    result = (_BYTE *)sub_1ABFBBD28(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_1ABFBBDE8((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_1ABFBBE60((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

_QWORD *sub_1ABFBBA6C(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_1ABFBBAD0(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)sub_1ABFBC4D8();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)sub_1ABFBC4FC();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = sub_1ABFBC4F0();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t sub_1ABFBBB7C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_1ABFBC4D8();
  if (!result || (result = sub_1ABFBC4FC(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_1ABFBC4F0();
      sub_1ABFBC634();
      sub_1ABFBC310();
      return sub_1ABFBC5F8();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1ABFBBC28(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_1ABFBC6D0();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x1AF439400](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_1ABFBBCA0@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = sub_1ABFBC6F4();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1ABFBBD28(_BYTE *__src, _BYTE *a2)
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

uint64_t sub_1ABFBBDE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_1ABFBC508();
  swift_allocObject();
  result = sub_1ABFBC4CC();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1ABFBC5B0();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1ABFBBE60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_1ABFBC508();
  swift_allocObject();
  result = sub_1ABFBC4CC();
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

_BYTE *sub_1ABFBBEE0(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)sub_1ABFBBD28(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_1ABFBBDE8((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)sub_1ABFBBE60((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_1ABFBBF44(uint64_t result)
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
      sub_1ABFBC508();
      swift_allocObject();
      sub_1ABFBC4E4();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1ABFBC5B0();
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

void _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_1ABFBC634();
  MEMORY[0x1E0C80A78]();
  sub_1ABFBC628();
  MEMORY[0x1E0C80A78]();
  swift_bridgeObjectRetain();
  sub_1ABFBB10C(a1, a2);
  v5 = v4;
  sub_1ABFBC310();
  sub_1ABFBC610();
  __asm { BR              X10 }
}

uint64_t sub_1ABFBC0E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v5 - 104) = v3;
  *(_WORD *)(v5 - 96) = v4;
  *(_BYTE *)(v5 - 94) = BYTE2(v4);
  *(_BYTE *)(v5 - 93) = BYTE3(v4);
  *(_BYTE *)(v5 - 92) = BYTE4(v4);
  *(_BYTE *)(v5 - 91) = BYTE5(v4);
  sub_1ABFBC5F8();
  sub_1ABFB8DCC(v3, v4);
  sub_1ABFBC604();
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 136) + 8))(v2, v1);
  MEMORY[0x1E0C80A78](v6);
  sub_1ABFBC61C();
  sub_1ABFB8DCC(v3, v4);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 - 128) + 8))(v0, *(_QWORD *)(v5 - 120));
  return *(_QWORD *)(v5 - 104);
}

unint64_t sub_1ABFBC310()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEC5E430;
  if (!qword_1EEC5E430)
  {
    v1 = sub_1ABFBC634();
    result = MEMORY[0x1AF439664](MEMORY[0x1E0CA9930], v1);
    atomic_store(result, (unint64_t *)&qword_1EEC5E430);
  }
  return result;
}

uint64_t sub_1ABFBC358@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  return sub_1ABFBB608(a1, a2, *(_QWORD *)(v3 + 16), a3);
}

uint64_t sub_1ABFBC370(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC5E440);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_1ABFBC3B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = sub_1ABFBBA6C((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_1ABFBC420, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_1ABFBC40C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1ABFB8DCC(a1, a2);
  return a1;
}

uint64_t sub_1ABFBC420@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1ABFBBCA0(a1, a2);
}

uint64_t sub_1ABFBC43C()
{
  return MEMORY[0x1E0CAE7D0]();
}

uint64_t sub_1ABFBC448()
{
  return MEMORY[0x1E0CAE7F0]();
}

uint64_t sub_1ABFBC454()
{
  return MEMORY[0x1E0CAE808]();
}

uint64_t sub_1ABFBC460()
{
  return MEMORY[0x1E0CAE818]();
}

uint64_t sub_1ABFBC46C()
{
  return MEMORY[0x1E0CAE828]();
}

uint64_t sub_1ABFBC478()
{
  return MEMORY[0x1E0CAE830]();
}

uint64_t sub_1ABFBC484()
{
  return MEMORY[0x1E0CAE838]();
}

uint64_t sub_1ABFBC490()
{
  return MEMORY[0x1E0CAE848]();
}

uint64_t sub_1ABFBC49C()
{
  return MEMORY[0x1E0CAE858]();
}

uint64_t sub_1ABFBC4A8()
{
  return MEMORY[0x1E0CAE878]();
}

uint64_t sub_1ABFBC4B4()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1ABFBC4C0()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t sub_1ABFBC4CC()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1ABFBC4D8()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1ABFBC4E4()
{
  return MEMORY[0x1E0CAE8D8]();
}

uint64_t sub_1ABFBC4F0()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1ABFBC4FC()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1ABFBC508()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1ABFBC514()
{
  return MEMORY[0x1E0CAEE50]();
}

uint64_t sub_1ABFBC520()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1ABFBC52C()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1ABFBC538()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1ABFBC544()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1ABFBC550()
{
  return MEMORY[0x1E0CAFF20]();
}

uint64_t sub_1ABFBC55C()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1ABFBC568()
{
  return MEMORY[0x1E0CAFF48]();
}

uint64_t sub_1ABFBC574()
{
  return MEMORY[0x1E0CAFF50]();
}

uint64_t sub_1ABFBC580()
{
  return MEMORY[0x1E0CAFF80]();
}

uint64_t sub_1ABFBC58C()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1ABFBC598()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1ABFBC5A4()
{
  return MEMORY[0x1E0CB0088]();
}

uint64_t sub_1ABFBC5B0()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1ABFBC5BC()
{
  return MEMORY[0x1E0CB0160]();
}

uint64_t sub_1ABFBC5C8()
{
  return MEMORY[0x1E0CB0188]();
}

uint64_t sub_1ABFBC5D4()
{
  return MEMORY[0x1E0CB01C0]();
}

uint64_t sub_1ABFBC5E0()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1ABFBC5EC()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1ABFBC5F8()
{
  return MEMORY[0x1E0CA92A8]();
}

uint64_t sub_1ABFBC604()
{
  return MEMORY[0x1E0CA92B0]();
}

uint64_t sub_1ABFBC610()
{
  return MEMORY[0x1E0CA92C8]();
}

uint64_t sub_1ABFBC61C()
{
  return MEMORY[0x1E0CA92E0]();
}

uint64_t sub_1ABFBC628()
{
  return MEMORY[0x1E0CA92F8]();
}

uint64_t sub_1ABFBC634()
{
  return MEMORY[0x1E0CA9940]();
}

uint64_t sub_1ABFBC640()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1ABFBC64C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1ABFBC658()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1ABFBC664()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1ABFBC670()
{
  return MEMORY[0x1E0DEA7D8]();
}

uint64_t sub_1ABFBC67C()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1ABFBC688()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1ABFBC694()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1ABFBC6A0()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1ABFBC6AC()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1ABFBC6B8()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1ABFBC6C4()
{
  return MEMORY[0x1E0DEA8F8]();
}

uint64_t sub_1ABFBC6D0()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1ABFBC6DC()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1ABFBC6E8()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1ABFBC6F4()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1ABFBC700()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1ABFBC70C()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1ABFBC718()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1ABFBC724()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1ABFBC730()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1ABFBC73C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
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

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

